Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D0332D24
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:21:45 +0100 (CET)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJg3E-0002ZE-IV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6f-0007Dm-Jy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:13 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6S-0002S5-0m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:13 -0500
Received: by mail-ot1-x331.google.com with SMTP id f33so13306104otf.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FdA8tFtpyXbNCIxq+Lmcx9QVlUew+tHqOvL8JhiAxSE=;
 b=KWZ5hzYb/Cy/mtS/FrvezYm9PeHrluo2e5vf1QQ1uDT3eUN/kMPJzgUnq03y4plxrm
 4jKCJvQKSTwKcp2aZJt1H6NN0hWqWUIq9ISlySWOF88W43UDzAQnuVzkjfwihWNOfyYT
 g0BNurTNHETVJ3BS+t8G8KwdZVndkIoZquTYIiyVVSGEcFjWNTOArV2LRLDcuje9yJLu
 UKz6ofpHG8PDpUu9rrKz+iUjwVc0Kq2fcOwdM8QUCyq1FlNShLLTQa19RPCeODjLHsuo
 9GrP9dSPQJMJmXbjdfllvSe8X376MOC8vQBszPbxgq8LIRW1awW4jDJ8f6iBr0yUp9a1
 0qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FdA8tFtpyXbNCIxq+Lmcx9QVlUew+tHqOvL8JhiAxSE=;
 b=IZ7m5c0YrkthJuJnTcS43KpXr38FfkRU0iZd3NiYqMSFpSeqGpJPbr9cTRzU14FkBx
 nEEAYbYoEADHBCipBmKZwOgQb68o/go1rnB5pOEhqShPVQ/BOZdQG/R5RlmKPgbm4BCN
 6qNAherpEe4wkHm+wjW4BY2mOIW7DxA80u79mBWfVW0TmuvZtc0a8Z6Vvyjq+8ZnojyB
 WU2P9kIQ0TmIljYkPvlbH92a0sGGaFNYl6SiQ8W5B6LoM2OA3WE86UuaJGkdmTAgxCVg
 Sz+VbxFMEdLhpjh3nFIP5m7SpjOmQKZ6O1p6oo1r3WEWz08Lp72tsZyd1StgXntAfGVh
 Ankw==
X-Gm-Message-State: AOAM5300G+9LSKkSjQYxNX4mbrWUsTTRwCnKo/jy5IIcBKiFBJgPujN6
 U5VSCf1d/ytb5gLnlD8SSMsrhnJOyFz/J+RO
X-Google-Smtp-Source: ABdhPJy1cztkJbg3AehUc8TyV46/kvo/JzgfTta5kFaJ/knohyW2/gtJpZ4emMAUSdoX0oW6jU/aBQ==
X-Received: by 2002:a05:6830:158c:: with SMTP id
 i12mr23783504otr.7.1615306858887; 
 Tue, 09 Mar 2021 08:20:58 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/78] target/arm: Implement PMULLB and PMULLT
Date: Tue,  9 Mar 2021 08:19:37 -0800
Message-Id: <20210309162041.23124-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++++++
 target/arm/helper-sve.h    |  1 +
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/vec_helper.c    | 24 ++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ee92ea876e..824365209b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4198,6 +4198,16 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
+}
+
+static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ad8121eec6..bf3e533eb4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2363,3 +2363,4 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d9a72b7661..016c15ebb6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1201,6 +1201,8 @@ USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
 
 SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
 SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+PMULLB          01000101 .. 0 ..... 011 010 ..... .....  @rd_rn_rm
+PMULLT          01000101 .. 0 ..... 011 011 ..... .....  @rd_rn_rm
 SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8da87a6ce0..260337d111 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6031,6 +6031,28 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
+        NULL,                    gen_helper_sve2_pmull_d,
+    };
+    if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_PMULLB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, false);
+}
+
+static bool trans_PMULLT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, true);
+}
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 40b92100bf..b0ce597060 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1750,6 +1750,30 @@ void HELPER(sve2_pmull_h)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = pmull_h(nn, mm);
     }
 }
+
+static uint64_t pmull_d(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
+
+    for (i = 0; i < 32; ++i) {
+        uint64_t mask = -((op1 >> i) & 1);
+        result ^= (op2 << i) & mask;
+    }
+    return result;
+}
+
+void HELPER(sve2_pmull_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t sel = H4(simd_data(desc));
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *n = vn, *m = vm;
+    uint64_t *d = vd;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = pmull_d(n[2 * i + sel], m[2 * i + sel]);
+    }
+}
 #endif
 
 #define DO_CMP0(NAME, TYPE, OP)                         \
-- 
2.25.1


