Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C6A40C3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpJ-0005yp-AU; Mon, 27 Feb 2023 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboP-0005op-5K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboM-0005i2-LI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lvc+5SwC+ViF8FGhE8in1TJao5DLcHjbLQ0Q+E/k+dk=;
 b=JumuTPvcPyBUJIO4SPMW3x2pmMZlnPbjpRbXOA48l2xdZBKM6/EekWX721f0//7smA0in/
 DPHgX015vYNSqAwymfYIR9qHzvLkFO7vRDQ3rrCeJmbSlMYfQMgz+ANfZuP1aNYmnLGk6o
 NryA6GLdxHWo6FERysDmCns7nZzXLC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-wQWV-yQdO3Og73ZYSUYWAw-1; Mon, 27 Feb 2023 06:36:50 -0500
X-MC-Unique: wQWV-yQdO3Og73ZYSUYWAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB1E830F82;
 Mon, 27 Feb 2023 11:36:50 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF391121315;
 Mon, 27 Feb 2023 11:36:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/33] tests/tcg/s390x: Add bal.S
Date: Mon, 27 Feb 2023 12:36:10 +0100
Message-Id: <20230227113621.58468-23-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221103130011.2670186-1-iii@linux.ibm.com>
Message-Id: <20230220184052.163465-6-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/bal.S                   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/bal.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 50c1b88065..bcbe9367ef 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += bal
diff --git a/tests/tcg/s390x/bal.S b/tests/tcg/s390x/bal.S
new file mode 100644
index 0000000000..e54d8874ff
--- /dev/null
+++ b/tests/tcg/s390x/bal.S
@@ -0,0 +1,24 @@
+    .org 0x200                         /* lowcore padding */
+    .globl _start
+_start:
+    lpswe start24_psw
+_start24:
+    lgrl %r0,initial_r0
+    lgrl %r1,expected_r0
+    bal %r0,0f
+0:
+    cgrjne %r0,%r1,1f
+    lpswe success_psw
+1:
+    lpswe failure_psw
+    .align 8
+start24_psw:
+    .quad 0x160000000000,_start24      /* 24-bit mode, cc = 1, pm = 6 */
+initial_r0:
+    .quad 0x1234567887654321
+expected_r0:
+    .quad 0x1234567896000000 + 0b      /* ilc = 2, cc = 1, pm = 6 */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.31.1


