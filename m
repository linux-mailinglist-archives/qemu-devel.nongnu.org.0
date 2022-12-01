Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7463F779
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 19:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0oHr-0001OP-63; Thu, 01 Dec 2022 13:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oHo-0001MQ-VM
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oHm-0008Bu-Vc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669919270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zFk/Jbf8XdeLcNWjgv4+fGwT3viXgDP0K1T4YtWoNUE=;
 b=IDt3DSLElBAZhcN989JPyfJoCvCU/gEeWnoPerKnsO6klEKBjWX5Zr1sdyCN0rhvg8lWUV
 Uwjv8PK2gRB0x9nDudIMH+nwhAR6z5o0Vvp94O6U+FZquFS3szwoZz5y7v7wMWX77jJsjM
 IZPf9kUKLE3IpbGgPW/WYkax7iH5nSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-F-yMaGNyOPCSOq53zdi7qA-1; Thu, 01 Dec 2022 13:27:47 -0500
X-MC-Unique: F-yMaGNyOPCSOq53zdi7qA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8D8C894E85;
 Thu,  1 Dec 2022 18:27:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44ABD492B28;
 Thu,  1 Dec 2022 18:27:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
Subject: [PATCH for-8.0] target/s390x/tcg: Fix and improve the SACF instruction
Date: Thu,  1 Dec 2022 19:27:29 +0100
Message-Id: <20221201182729.133002-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The SET ADDRESS SPACE CONTROL FAST code has a couple of issues:

1) The instruction is not privileged, it can be used from problem space,
too. Just the switching to the home address space is privileged and
should still generate a privilege exception. This bug is e.g. causing
programs like Java that use the "getcpu" vdso kernel function to crash
(see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417)

2) If DAT is not enabled, the instruction is supposed to generate
a special operation exception.

3) The switch-case statement in the code hid a weird oddity: It did not
support the secondary address space though that should be working without
problems. But there is a "case 0x100" which means access register mode -
and that is not implemented in QEMU yet. The code used the secondary mode
for the access register mode instead - which seems to sufficient to make
the Linux kernel happy that still temporarily tries to switch to the access
register mode here and there. Anyway, let's get rid of the cumbersome
switch-case statement and add a proper comment for the access register
oddity to make it more clear what is going on here.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.h.inc |  2 +-
 target/s390x/tcg/cc_helper.c     | 36 +++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 7e952bdfc8..54d4250c9f 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -1365,7 +1365,7 @@
 /* SERVICE CALL LOGICAL PROCESSOR (PV hypercall) */
     F(0xb220, SERVC,   RRE,   Z,   r1_o, r2_o, 0, 0, servc, 0, IF_PRIV | IF_IO)
 /* SET ADDRESS SPACE CONTROL FAST */
-    F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
+    C(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0)
 /* SET CLOCK */
     F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
 /* SET CLOCK COMPARATOR */
diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index b2e8d3d9f5..6f1350c4e2 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -486,23 +486,31 @@ void HELPER(load_psw)(CPUS390XState *env, uint64_t mask, uint64_t addr)
 void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
 {
     HELPER_LOG("%s: %16" PRIx64 "\n", __func__, a1);
+    uint64_t as = (a1 & 0xf00) >> 8;
 
-    switch (a1 & 0xf00) {
-    case 0x000:
-        env->psw.mask &= ~PSW_MASK_ASC;
-        env->psw.mask |= PSW_ASC_PRIMARY;
-        break;
-    case 0x100:
-        env->psw.mask &= ~PSW_MASK_ASC;
-        env->psw.mask |= PSW_ASC_SECONDARY;
-        break;
-    case 0x300:
-        env->psw.mask &= ~PSW_MASK_ASC;
-        env->psw.mask |= PSW_ASC_HOME;
-        break;
-    default:
+    if (!(env->psw.mask & PSW_MASK_DAT)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
+    }
+
+    if (as == AS_HOME && (env->psw.mask & PSW_MASK_PSTATE)) {
+        tcg_s390_program_interrupt(env, PGM_PRIVILEGED, GETPC());
+    }
+
+    if ((as & 0xc) != 0) {
         HELPER_LOG("unknown sacf mode: %" PRIx64 "\n", a1);
         tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
     }
+
+    if (as == AS_ACCREG) {
+        /*
+         * FIXME: Access register mode is not implemented yet, but Linux
+         * still seems to try to temporarily use this. Fortunately, it
+         * seems to be happy if we use the secondary mode instead.
+         */
+        as = AS_SECONDARY;
+    }
+
+    env->psw.mask &= ~PSW_MASK_ASC;
+    env->psw.mask |= as << PSW_SHIFT_ASC;
 }
 #endif
-- 
2.31.1


