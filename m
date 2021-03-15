Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D533AE14
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:58:33 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLj3Y-0000Ny-2R
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj0G-0006Uz-0B
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj0D-0004ny-QE
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615798504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEClig09x73pmcp7jVI3tOAnWfLZnq89fK9jpWSbTXk=;
 b=L3EMl+20LiLq7kc8b59QMuyzcqt2YWNKADiYkgndruX6ZJOx+WdNEj2lndNN8vf7j6cXsW
 gRCIg7fKhPIvFQihQjJxhfL/aeHj60jz6BJ4ITeCt6OiWV9HAbfzv5dfv6QI2bTrYggGmt
 ObEI4V6Wp4wN7ej3qvYT8W+8PMKhgdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-BNizdFasN4SQ7z3Wu6YJRA-1; Mon, 15 Mar 2021 04:55:02 -0400
X-MC-Unique: BNizdFasN4SQ7z3Wu6YJRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA74993928;
 Mon, 15 Mar 2021 08:55:01 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E797262A33;
 Mon, 15 Mar 2021 08:54:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/2] target/s390x: Store r1/r2 for page-translation
 exceptions during MVPG
Date: Mon, 15 Mar 2021 09:54:49 +0100
Message-Id: <20210315085449.34676-3-david@redhat.com>
In-Reply-To: <20210315085449.34676-1-david@redhat.com>
References: <20210315085449.34676-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PoP states:

    When EDAT-1 does not apply, and a program interruption due to a
    page-translation exception is recognized by the MOVE PAGE
    instruction, the contents of the R1 field of the instruction are
    stored in bit positions 0-3 of location 162, and the contents of
    the R2 field are stored in bit positions 4-7.

    If [...] an ASCE-type, region-first-translation,
    region-second-translation, region-third-translation, or
    segment-translation exception was recognized, the contents of
    location 162 are unpredictable.

So we have to write r1/r2 into the lowcore on page-translation
exceptions. Simply handle all exceptions inside our mvpg helper now.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h      |  2 +-
 target/s390x/insn-data.def |  2 +-
 target/s390x/mem_helper.c  | 46 +++++++++++++++++++++++---------------
 target/s390x/translate.c   |  7 +++++-
 4 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 55bd1551e6..d4e4f3388f 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -18,7 +18,7 @@ DEF_HELPER_3(srstu, void, env, i32, i32)
 DEF_HELPER_4(clst, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(mvz, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_3(mvst, i32, env, i32, i32)
 DEF_HELPER_4(ex, void, env, i32, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index e5b6efabf3..0bb1886a2e 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -641,7 +641,7 @@
 /* MOVE NUMERICS */
     C(0xd100, MVN,     SS_a,  Z,   la1, a2, 0, 0, mvn, 0)
 /* MOVE PAGE */
-    C(0xb254, MVPG,    RRE,   Z,   r1_o, r2_o, 0, 0, mvpg, 0)
+    C(0xb254, MVPG,    RRE,   Z,   0, 0, 0, 0, mvpg, 0)
 /* MOVE STRING */
     C(0xb255, MVST,    RRE,   Z,   0, 0, 0, 0, mvst, 0)
 /* MOVE WITH OPTIONAL SPECIFICATION */
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index bab872dcad..12e84a4285 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -915,8 +915,10 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 }
 
 /* move page */
-uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
+uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
 {
+    const uint64_t src = get_address(env, r2) & TARGET_PAGE_MASK;
+    const uint64_t dst = get_address(env, r1) & TARGET_PAGE_MASK;
     const int mmu_idx = cpu_mmu_index(env, false);
     const bool f = extract64(r0, 11, 1);
     const bool s = extract64(r0, 10, 1);
@@ -929,34 +931,42 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
         tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
     }
 
-    r1 = wrap_address(env, r1 & TARGET_PAGE_MASK);
-    r2 = wrap_address(env, r2 & TARGET_PAGE_MASK);
-
     /*
-     * TODO:
-     * - Access key handling
-     * - Store r1/r2 register identifiers at real location 162
+     * We always manually handle exceptions such that we can properly store
+     * r1/r2 to the lowcore on page-translation exceptions.
+     *
+     * TODO: Access key handling
      */
-    exc = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
+    exc = access_prepare_nf(&srca, env, true, src, TARGET_PAGE_SIZE,
                             MMU_DATA_LOAD, mmu_idx, ra);
     if (exc) {
-        return 2;
+        if (cco) {
+            return 2;
+        }
+        goto inject_exc;
     }
-    exc = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
+    exc = access_prepare_nf(&desta, env, true, dst, TARGET_PAGE_SIZE,
                             MMU_DATA_STORE, mmu_idx, ra);
     if (exc) {
-        if (exc == PGM_PROTECTION) {
-#if !defined(CONFIG_USER_ONLY)
-            stq_phys(env_cpu(env)->as,
-                     env->psa + offsetof(LowCore, trans_exc_code),
-                     env->tlb_fill_tec);
-#endif
-            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
+        if (cco && exc != PGM_PROTECTION) {
+            return 1;
         }
-        return 1;
+        goto inject_exc;
     }
     access_memmove(env, &desta, &srca, ra);
     return 0; /* data moved */
+inject_exc:
+#if !defined(CONFIG_USER_ONLY)
+    if (exc != PGM_ADDRESSING) {
+        stq_phys(env_cpu(env)->as, env->psa + offsetof(LowCore, trans_exc_code),
+                 env->tlb_fill_tec);
+    }
+    if (exc == PGM_PAGE_TRANS) {
+        stb_phys(env_cpu(env)->as, env->psa + offsetof(LowCore, op_access_id),
+                 r1 << 4 | r2);
+    }
+#endif
+    tcg_s390_program_interrupt(env, exc, ra);
 }
 
 /* string copy */
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 61dd0341e4..4f953ddfba 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -3513,7 +3513,12 @@ static DisasJumpType op_mvo(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvpg(DisasContext *s, DisasOps *o)
 {
-    gen_helper_mvpg(cc_op, cpu_env, regs[0], o->in1, o->in2);
+    TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
+    TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
+
+    gen_helper_mvpg(cc_op, cpu_env, regs[0], t1, t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.29.2


