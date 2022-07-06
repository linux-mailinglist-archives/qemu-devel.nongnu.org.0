Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661656834E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:17:39 +0200 (CEST)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91AA-0000AD-9c
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lb-0006Nz-3R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:24 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LZ-0000gE-1o
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:22 -0400
Received: by mail-pf1-x429.google.com with SMTP id x184so349734pfx.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7USofFy6/R6DxVwNku/PFYigY7yHsE6i1usXBLJ75E=;
 b=LyRn1ocZrr6lmCZ8xNLkfByWAtaHaUBX8RcTA5NnkLu56s5NDJWypMoP+4zIqBn3P3
 WqknCD7fxBzzB77BD+6AdgIW8lUqh9z2/TkYzy63wXWU6KDLGoYwwZpa5XUVFaxpC4lU
 YCFXyWrnlfjxBdp0IU9/Mi/aW3ozioP+6hPXrdXFTgD8WlVYF8+joC7E4iii90h2JyLl
 fxvmfwYbQRJwBxsiGBR89ZAecWC0eSu3Fit5i/VHjKiukcG3Jl3FNJU7vy0xE/Tx0S9n
 aA+qA16zLXAwl6c5iUFdSEQGAT7qPbrg8piGCnG0j9Z7YipYiNGrmM3KJjhyPvXcOFZY
 6IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7USofFy6/R6DxVwNku/PFYigY7yHsE6i1usXBLJ75E=;
 b=c+xpmSKmNcXuqnqcp3Z1EL+QhMdIOFLBJxSc5WZPaeYl/hirbWoh5XzQ1HlX2WNAy4
 LghRM+rxBzbGjP8TqqIpsNHwr9gtTqk/Go0fHgKvMyCvVosnA8IDIuwOb3xOn2RzQXE/
 Sh4VaY9rSV5M0DzYtUfxGppaXTQKsumQJJbGTBKl5W74NIIEm6/90ducMVwddmB1gOWR
 QEZQBvyEYcybAAfC8VFur2G0Z/ieTOknaD/sWO2046aKM8YogWsxfM0oSurPO4721EwN
 AC31zvXL/NbhDpP/ry6atIk7w2ya8Ru1Q0B8QBgiH8qJybPj25GY77bNpjiLzSXS9dkH
 3Jnw==
X-Gm-Message-State: AJIora8H7NJ7dCbFhn0ydEdRdokEuB4YbFsfeHXC12duK26WU60CmkWy
 NCeHRhAJ9Y7tPjDpm3U5LsZYkNYof+pzsAk1
X-Google-Smtp-Source: AGRyM1tyBrJYz7AkFxDNfn7tb0kAKkuBwsj3SVdx4eiwf/gHdPtsI2SANe9Brk3f53r9ZUTl3AdErQ==
X-Received: by 2002:a63:d449:0:b0:40d:7553:aef6 with SMTP id
 i9-20020a63d449000000b0040d7553aef6mr33596430pgj.16.1657095919069; 
 Wed, 06 Jul 2022 01:25:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 23/45] target/arm: Implement SME ADDHA, ADDVA
Date: Wed,  6 Jul 2022 13:53:49 +0530
Message-Id: <20220706082411.1664825-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Drop restrict.
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      | 11 +++++
 target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 31 +++++++++++++
 4 files changed, 137 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 95f6e88bdd..753e9e624c 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -115,3 +115,8 @@ DEF_HELPER_FLAGS_5(sme_st1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i
 DEF_HELPER_FLAGS_5(sme_st1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_5(sme_st1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_5(sme_st1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index f1ebd857a5..8cb6c4053c 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -53,3 +53,14 @@ LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
 
 LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
 STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
+
+### SME Add Vector to Array
+
+&adda           zad zn pm pn
+@adda_32        ........ .. ..... . pm:3 pn:3 zn:5 ... zad:2    &adda
+@adda_64        ........ .. ..... . pm:3 pn:3 zn:5 ..  zad:3    &adda
+
+ADDHA_s         11000000 10 01000 0 ... ... ..... 000 ..        @adda_32
+ADDVA_s         11000000 10 01000 1 ... ... ..... 000 ..        @adda_32
+ADDHA_d         11000000 11 01000 0 ... ... ..... 00 ...        @adda_64
+ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index e8895143c1..10b7c1ad68 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -828,3 +828,93 @@ DO_ST(q, _be, MO_128)
 DO_ST(q, _le, MO_128)
 
 #undef DO_ST
+
+void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
+    uint64_t *pn = vpn, *pm = vpm;
+    uint32_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ) {
+        uint64_t pa = pn[row >> 4];
+        do {
+            if (pa & 1) {
+                for (col = 0; col < oprsz; ) {
+                    uint64_t pb = pm[col >> 4];
+                    do {
+                        if (pb & 1) {
+                            zda[tile_vslice_index(row) + col] += zn[col];
+                        }
+                        pb >>= 4;
+                    } while (++col & 15);
+                }
+            }
+            pa >>= 4;
+        } while (++row & 15);
+    }
+}
+
+void HELPER(sme_addha_d)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pn = vpn, *pm = vpm;
+    uint64_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    zda[tile_vslice_index(row) + col] += zn[col];
+                }
+            }
+        }
+    }
+}
+
+void HELPER(sme_addva_s)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
+    uint64_t *pn = vpn, *pm = vpm;
+    uint32_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ) {
+        uint64_t pa = pn[row >> 4];
+        do {
+            if (pa & 1) {
+                uint32_t zn_row = zn[row];
+                for (col = 0; col < oprsz; ) {
+                    uint64_t pb = pm[col >> 4];
+                    do {
+                        if (pb & 1) {
+                            zda[tile_vslice_index(row) + col] += zn_row;
+                        }
+                        pb >>= 4;
+                    } while (++col & 15);
+                }
+            }
+            pa >>= 4;
+        } while (++row & 15);
+    }
+}
+
+void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pn = vpn, *pm = vpm;
+    uint64_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t zn_row = zn[row];
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    zda[tile_vslice_index(row) + col] += zn_row;
+                }
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 35c2644812..d3b9cdd5c4 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -267,3 +267,34 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 
 TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
 TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
+
+static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
+                    gen_helper_gvec_4 *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, 0);
+    TCGv_ptr za, zn, pn, pm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+
+    fn(za, zn, pn, pm, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
+TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
+TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
+TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
+TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
-- 
2.34.1


