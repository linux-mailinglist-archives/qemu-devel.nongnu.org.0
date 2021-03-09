Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E2332D57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:33:43 +0100 (CET)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgEn-0003Zp-Or
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6i-0007KN-Fj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:16 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6X-0002T6-DW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:16 -0500
Received: by mail-oi1-x22d.google.com with SMTP id w65so15514493oie.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s6m7gD9TSwnsmEAd7UsDrChSJzeJfhUW4ksDD+ynVvo=;
 b=VDbkviV7z80Ab7PYlUFre1xirKLNZvbB1E4V44YCRX19nKcDzctngMaQcDMujqbbij
 FQdEZPwz6ltLVwBdTmt17ZvzJOhE/V6WPc1KwSyDSbTpAjKqq76FwPFfZ8IT8IlIugl9
 9wJRJ5a0DnYVM8gnjksN1NswG5lslP0UsxNIOZmwRN4ZNx+bNAPFTAOreKo2V0qjw5kW
 tB2UzCGzYsaT5Euaz2MS8kmHR7DioZGB5nhlJWwSJl7D8viOU4bKxGsfAeI6bzW0DvE5
 LkaxEs8RU1WK4MsJpwp/620YE9117MgXsUWhXh8AVvxJmUneII/qFHB8AabFF4BmIslW
 To3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6m7gD9TSwnsmEAd7UsDrChSJzeJfhUW4ksDD+ynVvo=;
 b=c5QbJhuMFajAI8YFYA/9yL/49b67oUDN/X/B4UGGAnuBRRmrZL3++iXdhExK8cM/T8
 JpMmtD9mymqR89wzjizqs9z8oYWH4HHAqiRVRY1G6kixsB86vHDQ1rLD5SlymflGTQBS
 D46ETP+g4a8RaIgktC7WSfYbWkJQCOyjUbJnirAMNPLe4cPu8igssaPwUEZQHm4VjFQn
 FocD1/AEw37NcLPDGoXnASheplaXJXQtyfmhynLjzHcWvdhvg2lpp3ZQ4Up9iLh8TjjT
 yYpYLIRDc2cKzWx3K8OOmpqbhZKjTGcLUiV+/rQD8OElKty4kS1IJCq4Gw65fYJIrhhw
 pEcQ==
X-Gm-Message-State: AOAM5307Pwi/sDSNYgNj/8eXtlf0J4hxWVgx2S2PwB6x0kBU0R3A+rKw
 12MHtsZD2BhP6LzBskBaHCuu1KsETi//ivwc
X-Google-Smtp-Source: ABdhPJw/f6ONh/qutIX7uFZovrZeQiyWI77Mu8CCrlOYxR2chwhFg/s6rk1w7F4Pom92WB/Zbd805g==
X-Received: by 2002:aca:3509:: with SMTP id c9mr3454792oia.51.1615306864442;
 Tue, 09 Mar 2021 08:21:04 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/78] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
Date: Tue,  9 Mar 2021 08:19:42 -0800
Message-Id: <20210309162041.23124-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
v2: Fix select offsetting and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 12 +++++++++
 target/arm/sve_helper.c    | 23 ++++++++++++++++
 target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c2155cc544..229fb396b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2402,3 +2402,17 @@ DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7508b901d0..56b7353bfa 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -70,6 +70,7 @@
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
+&rrrr_esz       rd ra rn rm esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -119,6 +120,10 @@
 @rdn_i8s        ........ esz:2 ...... ... imm:s8 rd:5 \
                 &rri_esz rn=%reg_movprfx
 
+# Four operand, vector element size
+@rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz ra=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -1235,3 +1240,10 @@ CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
 CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
 SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
 SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
+
+## SVE2 integer absolute difference and accumulate long
+
+SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
+SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
+UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
+UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6d70d10701..dd2c6a7404 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,29 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_ZZZW_ACC(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    intptr_t sel1 = simd_data(desc) * sizeof(TYPEN);            \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {               \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));               \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel1));               \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                      \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm) + aa;               \
+    }                                                           \
+}
+
+DO_ZZZW_ACC(sve2_sabal_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZW_ACC
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e4eca9f16d..c179e1f123 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -163,6 +163,18 @@ static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                        vsz, vsz, data, fn);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs. */
+static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                              int rd, int rn, int rm, int ra, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -6317,3 +6329,46 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 {
     return do_cadd(s, a, true, true);
 }
+
+static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2][4] = {
+        { NULL,                    gen_helper_sve2_sabal_h,
+          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
+        { NULL,                    gen_helper_sve2_uabal_h,
+          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
+    };
+    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
+}
+
+static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, false);
+}
+
+static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, true);
+}
+
+static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, false);
+}
+
+static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, true);
+}
-- 
2.25.1


