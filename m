Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C964C6E8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiB-0007io-Uh; Wed, 14 Dec 2022 05:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0007cB-FM
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohe-00018e-G5
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z20HP6FvsJIrt/gLkdyk0hsYH6mMRPW471lF9nrJQ+c=;
 b=a5HP6nj3meRotv5tHhHXNMn1dj/AuRXxkDwprZPQS6MUpUP4zjA4QLTtvx3EJPRlVthhfO
 xIf//hRUdGgXaxMPM6x41ua6rvkNBX0hkKfaewjt7wZ4H6xwBScQgbdFT29Z/uKPtAiCVo
 kDVfCdc8jeCvAJj5SBhlzK0D7wAgxHw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-ZtrXZJK1Ogi0-5U1Q2t14g-1; Wed, 14 Dec 2022 05:09:25 -0500
X-MC-Unique: ZtrXZJK1Ogi0-5U1Q2t14g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B751C0896F;
 Wed, 14 Dec 2022 10:09:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3500492C14;
 Wed, 14 Dec 2022 10:09:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 05/23] target/s390x: The MVCP and MVCS instructions are not
 privileged
Date: Wed, 14 Dec 2022 11:08:53 +0100
Message-Id: <20221214100911.165291-6-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
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

The "MOVE TO PRIMARY/SECONDARY" instructions can also be called
from problem state. We just should properly check whether the
secondary-space access key is valid here, too, and inject a
privileged program exception if it is invalid.

Message-Id: <20221205125852.81848-1-thuth@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/helper.h            |  4 ++--
 target/s390x/tcg/insn-data.h.inc |  4 ++--
 target/s390x/tcg/mem_helper.c    | 16 ++++++++++++----
 target/s390x/tcg/translate.c     |  6 ++++--
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bf33d86f74..93923ca153 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -353,8 +353,8 @@ DEF_HELPER_FLAGS_3(tprot, TCG_CALL_NO_WG, i32, env, i64, i64)
 DEF_HELPER_2(iske, i64, env, i64)
 DEF_HELPER_3(sske, void, env, i64, i64)
 DEF_HELPER_2(rrbe, i32, env, i64)
-DEF_HELPER_4(mvcs, i32, env, i64, i64, i64)
-DEF_HELPER_4(mvcp, i32, env, i64, i64, i64)
+DEF_HELPER_5(mvcs, i32, env, i64, i64, i64, i64)
+DEF_HELPER_5(mvcp, i32, env, i64, i64, i64, i64)
 DEF_HELPER_4(sigp, i32, env, i64, i32, i32)
 DEF_HELPER_FLAGS_2(sacf, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_4(idte, TCG_CALL_NO_RWG, void, env, i64, i64, i32)
diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 54d4250c9f..79c6ab509a 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -1355,9 +1355,9 @@
     E(0xb24b, LURA,    RRE,   Z,   0, ra2, new, r1_32, lura, 0, MO_TEUL, IF_PRIV)
     E(0xb905, LURAG,   RRE,   Z,   0, ra2, r1, 0, lura, 0, MO_TEUQ, IF_PRIV)
 /* MOVE TO PRIMARY */
-    F(0xda00, MVCP,    SS_d,  Z,   la1, a2, 0, 0, mvcp, 0, IF_PRIV)
+    C(0xda00, MVCP,    SS_d,  Z,   la1, a2, 0, 0, mvcp, 0)
 /* MOVE TO SECONDARY */
-    F(0xdb00, MVCS,    SS_d,  Z,   la1, a2, 0, 0, mvcs, 0, IF_PRIV)
+    C(0xdb00, MVCS,    SS_d,  Z,   la1, a2, 0, 0, mvcs, 0)
 /* PURGE TLB */
     F(0xb20d, PTLB,    S,     Z,   0, 0, 0, 0, ptlb, 0, IF_PRIV)
 /* RESET REFERENCE BIT EXTENDED */
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 006b6798a7..cb82cd1c1d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2295,7 +2295,8 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     return re >> 1;
 }
 
-uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
+uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
+                      uint64_t key)
 {
     const uint8_t psw_as = (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT_ASC;
     S390Access srca, desta;
@@ -2310,6 +2311,10 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
         s390_program_interrupt(env, PGM_SPECIAL_OP, ra);
     }
 
+    if (!psw_key_valid(env, (key >> 4) & 0xf)) {
+        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
+    }
+
     l = wrap_length32(env, l);
     if (l > 256) {
         /* max 256 */
@@ -2319,14 +2324,14 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
         return cc;
     }
 
-    /* TODO: Access key handling */
     srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
     desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
     access_memmove(env, &desta, &srca, ra);
     return cc;
 }
 
-uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
+uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
+                      uint64_t key)
 {
     const uint8_t psw_as = (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT_ASC;
     S390Access srca, desta;
@@ -2341,6 +2346,10 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
         s390_program_interrupt(env, PGM_SPECIAL_OP, ra);
     }
 
+    if (!psw_key_valid(env, (key >> 4) & 0xf)) {
+        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
+    }
+
     l = wrap_length32(env, l);
     if (l > 256) {
         /* max 256 */
@@ -2350,7 +2359,6 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
         return cc;
     }
 
-    /* TODO: Access key handling */
     srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_SECONDARY_IDX, ra);
     desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_PRIMARY_IDX, ra);
     access_memmove(env, &desta, &srca, ra);
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1e599ac259..a339b277e9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3476,7 +3476,8 @@ static DisasJumpType op_mvcos(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mvcp(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, l1);
-    gen_helper_mvcp(cc_op, cpu_env, regs[r1], o->addr1, o->in2);
+    int r3 = get_field(s, r3);
+    gen_helper_mvcp(cc_op, cpu_env, regs[r1], o->addr1, o->in2, regs[r3]);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3484,7 +3485,8 @@ static DisasJumpType op_mvcp(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mvcs(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, l1);
-    gen_helper_mvcs(cc_op, cpu_env, regs[r1], o->addr1, o->in2);
+    int r3 = get_field(s, r3);
+    gen_helper_mvcs(cc_op, cpu_env, regs[r1], o->addr1, o->in2, regs[r3]);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.31.1


