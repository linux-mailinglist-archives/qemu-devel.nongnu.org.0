Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39F2A2DAC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 16:09:17 +0100 (CET)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZbSN-0004rO-Mu
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 10:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZbRK-0004Qy-QV
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 10:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZbRI-0005gY-Di
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 10:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604329686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A2trkZvSPMcij12fk5Ov94Bno7+g/Hd1raAjCgdWRxs=;
 b=amblMceMb5eUDaY8iSOf3A3hd1jewwLbzxsUd3vsCLmPFp/kBcmPp08qzRREBq5R8x1QNs
 kKutD28FedM/p44TeWQDdP3wKY10wvQVR6RyPEDVJlYtLuY2irsu/1gfoLndIb4NycLe9x
 82EvJEQdxm829gchpl6rCjlawLVoFzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-sKrXOYdCPrqr7RSdPFq6gw-1; Mon, 02 Nov 2020 10:08:00 -0500
X-MC-Unique: sKrXOYdCPrqr7RSdPFq6gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7475C809DCD;
 Mon,  2 Nov 2020 15:07:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 657A75DA6B;
 Mon,  2 Nov 2020 15:07:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, amulmek1@in.ibm.com,
 stefanha@redhat.com
Subject: [PATCH] virtiofsd: Seccomp: Add 'send' for syslog
Date: Mon,  2 Nov 2020 15:07:50 +0000
Message-Id: <20201102150750.34565-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On ppc it looks like syslog ends up using 'send' rather than 'sendto'.

Reference: https://github.com/kata-containers/kata-containers/issues/1050

Reported-by: amulmek1@in.ibm.com
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_seccomp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index eb9af8265f..672fb72a31 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -118,6 +118,7 @@ static const int syscall_whitelist[] = {
 
 /* Syscalls used when --syslog is enabled */
 static const int syscall_whitelist_syslog[] = {
+    SCMP_SYS(send),
     SCMP_SYS(sendto),
 };
 
-- 
2.28.0


