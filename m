Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4371F6E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:06:19 +0200 (CEST)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTSs-00036g-Mg
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8l-0007nl-HC
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8j-0000zY-1I
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fPYISrPwguO+ngXydsq1EkKIQOWmZRvf4qRYRIqqdw=;
 b=UNAuYqvsEvlssfSjC3peIwEr84gGmzkAEqoTFsmGq2d6Aq2mIbY5nO8fbglB0zVVVQFLw1
 xRgIo4B7b7J5TMvggIZD4ox2dtDCMae9lDkZHjdxjfdxv2Hx/7ObagweiEl2OePlhUc9iw
 YAscPuTxNzrnp5mfoPKtU6JjtoxRkV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-jAlw_qcwM16uweMT2iu32A-1; Thu, 11 Jun 2020 15:45:26 -0400
X-MC-Unique: jAlw_qcwM16uweMT2iu32A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E065A0C01;
 Thu, 11 Jun 2020 19:45:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A440B7E589;
 Thu, 11 Jun 2020 19:45:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 038/115] hw/i386/vmport: Assert vmport initialized before
 registering commands
Date: Thu, 11 Jun 2020 15:43:32 -0400
Message-Id: <20200611194449.31468-39-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Liran Alon <liran.alon@oracle.com>,
 Nikita Leshenko <nikita.leshchenko@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

vmport_register() is also called from other modules such as vmmouse.
Therefore, these modules rely that vmport is realized before those call
sites. If this is violated, vmport_register() will NULL-deref.

To make such issues easier to debug, assert in vmport_register() that
vmport is already realized.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20200312165431.82118-17-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 309cfd105b..79ef25d223 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -81,6 +81,8 @@ static VMPortState *port_state;
 void vmport_register(VMPortCommand command, VMPortReadFunc *func, void *opaque)
 {
     assert(command < VMPORT_ENTRIES);
+    assert(port_state);
+
     trace_vmport_register(command, func, opaque);
     port_state->func[command] = func;
     port_state->opaque[command] = opaque;
-- 
2.26.2



