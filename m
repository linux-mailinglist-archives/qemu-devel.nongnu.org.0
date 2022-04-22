Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB250B736
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:26:00 +0200 (CEST)
Received: from localhost ([::1]:36266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsMH-0002uT-NL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhW-0004XW-Uz
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhV-0003cl-20
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:50 -0400
Received: by mail-pf1-x42e.google.com with SMTP id bo5so7775182pfb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyTCNhDhkfX02+YiD10zVwLNMHjK/GcTywN2HnpKIRs=;
 b=nJ49uB2AY5ToAwE2ahPcAco3aJ/XPGlcffqXSFcNXhDYoLAbEyYQZ1iFTCGZ+XlZqD
 tW2VYMqm3PFYEUYQCgEWX2q47hmuYcgdr/Wvn/hVnoxTmos3yXfMIL/ixh+W+AzWaeHZ
 KGqhWxY886J2jV15Zy7Nh9haWEkipJcq9u1uuI6wGvNaBmX6ZtkZgi+pbts+EpJG1Iq9
 p+8AHMTqhyIVS4Pc2OaLd7JiF0CqOOtqXq68iAvkQyyy5hcoRfKtRYdK8gPlM8dGIa+e
 5b6U140uTefiML069RrqdDGWCgcyVz0l+MjU9gzioCNstN4UQ1GSBsts2kqXj8v7iujl
 LwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyTCNhDhkfX02+YiD10zVwLNMHjK/GcTywN2HnpKIRs=;
 b=T84dbA6sK4IVLZHHmH3xfSqudDxBpRLHKxkccORbbS7cuCAp711RQP05wIjzFQg7PC
 Iky48dd3xm4bCPaQZ0l0kuiDPZnFkoL3YaHB9W/1GabIfuwTk2pc66hZMB+WtM89D9GJ
 QXw47r1Pl6zgxo4fDiC/K1qt7Kp8LuL0MfMU9HZNTxNst/OHDYqirfT9ALF7OKtDxObd
 sNGdjQKV6hH7y4oxyaUW6eJuWsert0jG/YXOlFXtbuKDKiv1MzEb7NeOV+L6QdovDjEB
 zPZ2aYlZpkvxOCb05WBtB8Q0Z2lLSmG/7pfM+W8cv6XXlpyU6+RlMUCTDmQ49HjOyJam
 3DWA==
X-Gm-Message-State: AOAM533tTLxHvPhnwtlbdsTs7Nf7m7wAOg4DVjECoxnIfX9a/u6vmdKo
 H2gyHY9p5LVXFDV3KP4jpVJsser7HJM=
X-Google-Smtp-Source: ABdhPJzMyBqlbs9hIPyHn9ht7N6alNLKkZ9e4073eOx2iNLAeTjlQxuP0qLpPVL9niTVtPs810FghQ==
X-Received: by 2002:a05:6a00:b52:b0:508:31e1:7d35 with SMTP id
 p18-20020a056a000b5200b0050831e17d35mr4653936pfo.33.1650627827416; 
 Fri, 22 Apr 2022 04:43:47 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:46 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/xtensa: use tcg_contatnt_* for numeric literals
Date: Fri, 22 Apr 2022 04:43:27 -0700
Message-Id: <20220422114332.374472-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace tcg_const_* for numeric literals with tcg_constant_*.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 9ecbbf172114..53f75f7586b2 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -306,16 +306,14 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    TCGv_i32 tmp = tcg_const_i32(32);
     if (!dc->sar_m32_allocated) {
         dc->sar_m32 = tcg_temp_local_new_i32();
         dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
-    tcg_gen_sub_i32(cpu_SR[SAR], tmp, dc->sar_m32);
+    tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
     dc->sar_5bit = false;
     dc->sar_m32_5bit = true;
-    tcg_temp_free(tmp);
 }
 
 static void gen_exception(DisasContext *dc, int excp)
@@ -1956,11 +1954,10 @@ static void translate_mov(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movcond(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
 
     tcg_gen_movcond_i32(par[0], arg[0].out,
                         arg[2].in, zero, arg[1].in, arg[0].in);
-    tcg_temp_free(zero);
 }
 
 static void translate_movi(DisasContext *dc, const OpcodeArg arg[],
@@ -1972,7 +1969,7 @@ static void translate_movi(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_andi_i32(tmp, arg[2].in, 1 << arg[2].imm);
@@ -1980,7 +1977,6 @@ static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, tmp, zero,
                         arg[1].in, arg[0].in);
     tcg_temp_free(tmp);
-    tcg_temp_free(zero);
 }
 
 static void translate_movsp(DisasContext *dc, const OpcodeArg arg[],
@@ -6443,7 +6439,7 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
         [COMPARE_OLE] = gen_helper_ole_d,
         [COMPARE_ULE] = gen_helper_ule_d,
     };
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 res = tcg_temp_new_i32();
     TCGv_i32 set_br = tcg_temp_new_i32();
     TCGv_i32 clr_br = tcg_temp_new_i32();
@@ -6455,7 +6451,6 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(TCG_COND_NE,
                         arg[0].out, res, zero,
                         set_br, clr_br);
-    tcg_temp_free(zero);
     tcg_temp_free(res);
     tcg_temp_free(set_br);
     tcg_temp_free(clr_br);
@@ -6475,7 +6470,7 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
         [COMPARE_ULE] = gen_helper_ule_s,
     };
     OpcodeArg arg32[3];
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 res = tcg_temp_new_i32();
     TCGv_i32 set_br = tcg_temp_new_i32();
     TCGv_i32 clr_br = tcg_temp_new_i32();
@@ -6489,7 +6484,6 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, res, zero,
                         set_br, clr_br);
     put_f32_i2(arg, arg32, 1, 2);
-    tcg_temp_free(zero);
     tcg_temp_free(res);
     tcg_temp_free(set_br);
     tcg_temp_free(clr_br);
@@ -6665,14 +6659,13 @@ static void translate_mov_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movcond_d(DisasContext *dc, const OpcodeArg arg[],
                                 const uint32_t par[])
 {
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     TCGv_i64 arg2 = tcg_temp_new_i64();
 
     tcg_gen_ext_i32_i64(arg2, arg[2].in);
     tcg_gen_movcond_i64(par[0], arg[0].out,
                         arg2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(arg2);
 }
 
@@ -6680,12 +6673,11 @@ static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
                                 const uint32_t par[])
 {
     if (arg[0].num_bits == 32) {
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 zero = tcg_constant_i32(0);
 
         tcg_gen_movcond_i32(par[0], arg[0].out,
                             arg[2].in, zero,
                             arg[1].in, arg[0].in);
-        tcg_temp_free(zero);
     } else {
         translate_movcond_d(dc, arg, par);
     }
@@ -6694,7 +6686,7 @@ static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     TCGv_i32 tmp1 = tcg_temp_new_i32();
     TCGv_i64 tmp2 = tcg_temp_new_i64();
 
@@ -6703,7 +6695,6 @@ static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0],
                         arg[0].out, tmp2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i32(tmp1);
     tcg_temp_free_i64(tmp2);
 }
@@ -6712,7 +6703,7 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
     if (arg[0].num_bits == 32) {
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 zero = tcg_constant_i32(0);
         TCGv_i32 tmp = tcg_temp_new_i32();
 
         tcg_gen_andi_i32(tmp, arg[2].in, 1 << arg[2].imm);
@@ -6720,7 +6711,6 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
                             arg[0].out, tmp, zero,
                             arg[1].in, arg[0].in);
         tcg_temp_free(tmp);
-        tcg_temp_free(zero);
     } else {
         translate_movp_d(dc, arg, par);
     }
-- 
2.30.2


