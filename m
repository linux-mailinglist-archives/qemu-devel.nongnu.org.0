Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA263F7B9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 19:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0oYM-0007Q5-OR; Thu, 01 Dec 2022 13:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oYK-0007Pc-8c
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:44:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oYG-0002vx-Tg
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669920291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iggJL6njhe9QxIYbvBTC2U/SfNx4+10AOuNqZ/ZorOg=;
 b=B9WLmAkbXOoOA42JAxzcgKkAscaQTEstsTX4ilLP/28dcvotpZCXMTqvZAj/4EOQzT7X5w
 /gySZJxDkmXrgLT3GdeE8Et7A1O2VBGyJVmnYUV3UZ5uCKcVAzcoEKSLXIVJ23PeBy5WDS
 JovL5FJTCJlBQCipnoo8McfGDzC6lxc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-bXaa625bOWqgbRFtSQ--cA-1; Thu, 01 Dec 2022 13:44:50 -0500
X-MC-Unique: bXaa625bOWqgbRFtSQ--cA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 117B43817963;
 Thu,  1 Dec 2022 18:44:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDA34B3FC8;
 Thu,  1 Dec 2022 18:44:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v2 for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
Date: Thu,  1 Dec 2022 19:44:43 +0100
Message-Id: <20221201184443.136355-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it can be
used from problem space, too. Just the switching to the home address space
is privileged and should still generate a privilege exception. This bug is
e.g. causing programs like Java that use the "getcpu" vdso kernel function
to crash (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417#26 ).

While we're at it, also check if DAT is not enabled. In that case the
instruction is supposed to generate a special operation exception.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.h.inc | 2 +-
 target/s390x/tcg/cc_helper.c     | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index b2e8d3d9f5..b36f8cdc8b 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -487,6 +487,10 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
 {
     HELPER_LOG("%s: %16" PRIx64 "\n", __func__, a1);
 
+    if (!(env->psw.mask & PSW_MASK_DAT)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
+    }
+
     switch (a1 & 0xf00) {
     case 0x000:
         env->psw.mask &= ~PSW_MASK_ASC;
@@ -497,6 +501,9 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
         env->psw.mask |= PSW_ASC_SECONDARY;
         break;
     case 0x300:
+        if ((env->psw.mask & PSW_MASK_PSTATE) != 0) {
+            tcg_s390_program_interrupt(env, PGM_PRIVILEGED, GETPC());
+        }
         env->psw.mask &= ~PSW_MASK_ASC;
         env->psw.mask |= PSW_ASC_HOME;
         break;
-- 
2.31.1


