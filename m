Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB523DD67D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:08:46 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXgT-0002Bz-Ik
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbE-0000j4-Uf
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbD-0000Ry-Gw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeAdYFwNG30K4OKc/m+Hcsdbxk+vvHMjFuRTy2s7Njc=;
 b=axXc6Vw3yC+zSrtyteZGSCHA2/VMK7rKZoLlg5RjC7yaq1j1uUShKGlyxtMLxXhZ5Y/O+Y
 qEKVAdbDmH8BwSkqUXRLlC6d3SgrytYBiu+pzqMv8E4BFLz9yf7c7ASLhhqNInyiPc6i1w
 ULp9b0UEfSComEDToHUhif/OUG4WeUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-kQ1j2c60Mz-yeGBchsmAzQ-1; Mon, 02 Aug 2021 09:03:15 -0400
X-MC-Unique: kQ1j2c60Mz-yeGBchsmAzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00544190B2A3
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 13:03:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97915FC23;
 Mon,  2 Aug 2021 13:03:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] seccomp: block use of clone3 syscall
Date: Mon,  2 Aug 2021 14:03:02 +0100
Message-Id: <20210802130303.3300108-5-berrange@redhat.com>
In-Reply-To: <20210802130303.3300108-1-berrange@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modern glibc will use clone3 instead of clone, when it detects that it
is available. We need to compare flags in order to decide whether to
allow clone (thread create vs process fork), but in clone3 the flags
are hidden inside a struct. Seccomp can't currently match on data inside
a struct, so our only option is to block clone3 entirely. If we use
ENOSYS to block it, then glibc transparently falls back to clone.

This may need to be revisited if Linux adds a new architecture in
future and only provides clone3, without clone.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 57139cc9ce..a7bb5c350f 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -244,6 +244,10 @@ static const struct QemuSeccompSyscall denylist[] = {
     RULE_CLONE_FLAG(CLONE_NEWPID),
     RULE_CLONE_FLAG(CLONE_NEWNET),
     RULE_CLONE_FLAG(CLONE_IO),
+#ifdef __SNR_clone3
+    { SCMP_SYS(clone3),                 QEMU_SECCOMP_SET_SPAWN,
+      0, NULL, SCMP_ACT_ERRNO(ENOSYS) },
+#endif
     /* resource control */
     { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL,
       0, NULL, SCMP_ACT_ERRNO(EPERM) },
-- 
2.31.1


