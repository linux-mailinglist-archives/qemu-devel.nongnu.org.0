Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B0681D6A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc2H-0002vV-OO; Mon, 30 Jan 2023 16:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc23-0002k6-Mv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc21-0005jX-RE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id 88so12386558pjo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgNfwNG6N+lGCQvIJAy0cKZOwgafxSBot5A4L6tBKHw=;
 b=vZgk6uiWI7xVvjDXaGpmhjkKh1TEJF5wD4YLI1DhePlIDyx5IBVCFK+WwSQH2X4vKq
 CUv770BTX+1Beo3QsNOK2l32VNXzQGvHsi8gcL7fc37HZR9pGhUNf+ZFO4RPn0iVxdG0
 wJuH/bPlbtT0oBxZ/QQJcCEpx25AL4iOfjnYkIxLo6CCOOeet2CncDCugUbShuSK8fr1
 6yscOBUFACNkWSCLkiKROUFckXriOcOXy5/76/oVnoA88I/aqdkVtGLKGLz0F/LtOK43
 0NckeENBRyYaIKdfX4oCFqGo56ntsC1gb80/Ic+UT3ieZ6KVj8zHLTWgs0slemDbfXjM
 kZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgNfwNG6N+lGCQvIJAy0cKZOwgafxSBot5A4L6tBKHw=;
 b=xtsjWN3O+MdQpW+A8RiJaaZTN4n48GrMRuZIQ604cB5227hE+o9atIlxc81pcWkTyX
 85GIsa4AI61jwrv3JS/fbP2Sn073dLN/31aW8q2uDBRIich7KZ7Nc/Y2awXp6qOPTrJc
 S99xtfG7I/6gge1TulGkYJ6Sbfl76eh0hUsuZmLbmLZw9zovZN/HUyvSJbPBsO9N2S8r
 rXGtLc/u3zUVkZ5ewPug7F3leyxzSoj88bIIvkVZ24qvdvnKwXpVHvkNs02FAh2fEfl8
 Ytjb5pn+uvkjSBwoLcdPioZcftQTEmc3fTVyYbsezbw/5oSBsB4LkYjybrUWeXQes3Do
 CDLA==
X-Gm-Message-State: AO0yUKXYlbzz6MWjSyB60o5nTbusulDqywxMziq8Z6bE8NGFp9uBvt4/
 9vheRMr8ZGa1mZUNPAft/ySIWZyXrNxTyDfK
X-Google-Smtp-Source: AK7set9LYu7aXVMW7RLR9UjOOXhvgjmcz5TUiXJup/PSRXnoXybz4S2vgjy1H1Q8w7KLDleg3wEFcw==
X-Received: by 2002:a17:90b:33cd:b0:229:25de:ee4a with SMTP id
 lk13-20020a17090b33cd00b0022925deee4amr10462065pjb.45.1675115380547; 
 Mon, 30 Jan 2023 13:49:40 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128 for
 CDSG
Date: Mon, 30 Jan 2023 11:48:40 -1000
Message-Id: <20230130214844.1158612-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/helper.h            |  2 --
 target/s390x/tcg/insn-data.h.inc |  2 +-
 target/s390x/tcg/mem_helper.c    | 52 ------------------------------
 target/s390x/tcg/translate.c     | 55 +++++++++++++++++++-------------
 4 files changed, 33 insertions(+), 78 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bccd3bfca6..341bc51ec2 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -35,8 +35,6 @@ DEF_HELPER_3(cxgb, i128, env, s64, i32)
 DEF_HELPER_3(celgb, i64, env, i64, i32)
 DEF_HELPER_3(cdlgb, i64, env, i64, i32)
 DEF_HELPER_3(cxlgb, i128, env, i64, i32)
-DEF_HELPER_4(cdsg, void, env, i64, i32, i32)
-DEF_HELPER_4(cdsg_parallel, void, env, i64, i32, i32)
 DEF_HELPER_4(csst, i32, env, i32, i64, i64)
 DEF_HELPER_4(csst_parallel, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_3(aeb, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 893f4b48db..9d2d35f084 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -276,7 +276,7 @@
 /* COMPARE DOUBLE AND SWAP */
     D(0xbb00, CDS,     RS_a,  Z,   r3_D32, r1_D32, new, r1_D32, cs, 0, MO_TEUQ)
     D(0xeb31, CDSY,    RSY_a, LD,  r3_D32, r1_D32, new, r1_D32, cs, 0, MO_TEUQ)
-    C(0xeb3e, CDSG,    RSY_a, Z,   0, 0, 0, 0, cdsg, 0)
+    C(0xeb3e, CDSG,    RSY_a, Z,   la2, r3_D64, 0, r1_D64, cdsg, 0)
 /* COMPARE AND SWAP AND STORE */
     C(0xc802, CSST,    SSF,   CASS, la1, a2, 0, 0, csst, 0)
 
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 49969abda7..d6725fd18c 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1771,58 +1771,6 @@ uint32_t HELPER(trXX)(CPUS390XState *env, uint32_t r1, uint32_t r2,
     return cc;
 }
 
-void HELPER(cdsg)(CPUS390XState *env, uint64_t addr,
-                  uint32_t r1, uint32_t r3)
-{
-    uintptr_t ra = GETPC();
-    Int128 cmpv = int128_make128(env->regs[r1 + 1], env->regs[r1]);
-    Int128 newv = int128_make128(env->regs[r3 + 1], env->regs[r3]);
-    Int128 oldv;
-    uint64_t oldh, oldl;
-    bool fail;
-
-    check_alignment(env, addr, 16, ra);
-
-    oldh = cpu_ldq_data_ra(env, addr + 0, ra);
-    oldl = cpu_ldq_data_ra(env, addr + 8, ra);
-
-    oldv = int128_make128(oldl, oldh);
-    fail = !int128_eq(oldv, cmpv);
-    if (fail) {
-        newv = oldv;
-    }
-
-    cpu_stq_data_ra(env, addr + 0, int128_gethi(newv), ra);
-    cpu_stq_data_ra(env, addr + 8, int128_getlo(newv), ra);
-
-    env->cc_op = fail;
-    env->regs[r1] = int128_gethi(oldv);
-    env->regs[r1 + 1] = int128_getlo(oldv);
-}
-
-void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
-                           uint32_t r1, uint32_t r3)
-{
-    uintptr_t ra = GETPC();
-    Int128 cmpv = int128_make128(env->regs[r1 + 1], env->regs[r1]);
-    Int128 newv = int128_make128(env->regs[r3 + 1], env->regs[r3]);
-    int mem_idx;
-    MemOpIdx oi;
-    Int128 oldv;
-    bool fail;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-    fail = !int128_eq(oldv, cmpv);
-
-    env->cc_op = fail;
-    env->regs[r1] = int128_gethi(oldv);
-    env->regs[r1 + 1] = int128_getlo(oldv);
-}
-
 static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                         uint64_t a2, bool parallel)
 {
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d422a1e62b..9ea28b3e52 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2224,31 +2224,25 @@ static DisasJumpType op_cs(DisasContext *s, DisasOps *o)
 static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
-    int r3 = get_field(s, r3);
-    int d2 = get_field(s, d2);
-    int b2 = get_field(s, b2);
-    DisasJumpType ret = DISAS_NEXT;
-    TCGv_i64 addr;
-    TCGv_i32 t_r1, t_r3;
 
-    /* Note that R1:R1+1 = expected value and R3:R3+1 = new value.  */
-    addr = get_address(s, 0, b2, d2);
-    t_r1 = tcg_const_i32(r1);
-    t_r3 = tcg_const_i32(r3);
-    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_helper_cdsg(cpu_env, addr, t_r1, t_r3);
-    } else if (HAVE_CMPXCHG128) {
-        gen_helper_cdsg_parallel(cpu_env, addr, t_r1, t_r3);
-    } else {
-        gen_helper_exit_atomic(cpu_env);
-        ret = DISAS_NORETURN;
-    }
-    tcg_temp_free_i64(addr);
-    tcg_temp_free_i32(t_r1);
-    tcg_temp_free_i32(t_r3);
+    o->out_128 = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);
 
-    set_cc_static(s);
-    return ret;
+    /* Note out (R1:R1+1) = expected value and in2 (R3:R3+1) = new value.  */
+    tcg_gen_atomic_cmpxchg_i128(o->out_128, o->addr1, o->out_128, o->in2_128,
+                                get_mem_index(s), MO_BE | MO_128 | MO_ALIGN);
+
+    /*
+     * Extract result into cc_dst:cc_src, compare vs the expected value
+     * in the as yet unmodified input registers, then update CC_OP.
+     */
+    tcg_gen_extr_i128_i64(cc_src, cc_dst, o->out_128);
+    tcg_gen_xor_i64(cc_dst, cc_dst, regs[r1]);
+    tcg_gen_xor_i64(cc_src, cc_src, regs[r1 + 1]);
+    tcg_gen_or_i64(cc_dst, cc_dst, cc_src);
+    set_cc_nz_u64(s, cc_dst);
+
+    return DISAS_NEXT;
 }
 
 static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
@@ -5488,6 +5482,13 @@ static void wout_r1_D32(DisasContext *s, DisasOps *o)
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
 
+static void wout_r1_D64(DisasContext *s, DisasOps *o)
+{
+    int r1 = get_field(s, r1);
+    tcg_gen_extr_i128_i64(regs[r1 + 1], regs[r1], o->out_128);
+}
+#define SPEC_wout_r1_D64 SPEC_r1_even
+
 static void wout_r3_P32(DisasContext *s, DisasOps *o)
 {
     int r3 = get_field(s, r3);
@@ -5935,6 +5936,14 @@ static void in2_r3(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_r3 0
 
+static void in2_r3_D64(DisasContext *s, DisasOps *o)
+{
+    int r3 = get_field(s, r3);
+    o->in2_128 = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(o->in2_128, regs[r3 + 1], regs[r3]);
+}
+#define SPEC_in2_r3_D64 SPEC_r3_even
+
 static void in2_r3_sr32(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-- 
2.34.1


