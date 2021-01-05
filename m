Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA92EB1A6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:44:42 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqNt-0000VO-Uq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0q-0002iG-NA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:52 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0o-0006gM-NJ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:52 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m6so121723pfm.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=MtbGtIOqY5SBF9O0XH31ELRHHusQe1Sriz+uaxxmmLW/TG3QUPk2MRSnf5EwkTGXCQ
 SXbaYflXUe4k4PF2nF4qkOfXZVUZgSzeQ29SVuxJrIUSgzk02Q4Qkkgs8gsNru/vOtm4
 dBH/BUNU76rTSzRWsl4yMA1wHQB0LlfgLW+BtXEN2+NT0+TFH1D4CPpYq4RPWqhxzZdx
 KqX+xFY3WX5OoyTfinRSQFIa4nvBgD2NSx57YTlAsLNZ2lwFQU55l85X43/wrZbLC/Jm
 4epatupdLA39/yb+REcgZrGgmmh4V2Tyse3oaYpiDzZiJMGsu9dZWuOTOd2EZzWQCmwH
 g3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=ry2vH0tGQrN6gS85Xb+kZl9NKR9O2fUc1PQ/fEQUtuTlk/RZUE9uHvpJxa3CXtoQYT
 0W1r458B7F+oXqC97Auvqn2AFSIBaJci7CNHs1qkg3fIBVX/zjYBObKV7CvK/Vgii9Zb
 j/x2xFjq3VccYjv+3VCGnD6OHFbrkmMskbEKGc80E2CJPWaO3LUcHm25kHTq2KfuCmmj
 nX03o8mBjELU9juslVtjDkILirOTiSZ3qtweFX7E6tAsOSlYY6PT1i4PK1SSCDrCdKvB
 TIDs2ZstFX9EgF2wOIvSNyCp4annNtr1gZEGiMb80AXPz26bPiTUynfGDiW7URjV1T7I
 egiw==
X-Gm-Message-State: AOAM530fTjq/2G8W1sdLv6+IL/3S+yDk2IgeSDrPAL5NSg3B+OVQq3Gw
 o2potBfjCqt9G7H7zOpBYmJG6T2kGjqjMg==
X-Google-Smtp-Source: ABdhPJw2zZ8hlgAViqH4kNl0JT2h6wtSPc4oUMvZVXV0a9S1C9/OjFSVvAq0bIvcPuQeKBMOXsuEiw==
X-Received: by 2002:a05:6a00:230d:b029:18b:9cb:dead with SMTP id
 h13-20020a056a00230db029018b09cbdeadmr198335pfh.24.1609867249118; 
 Tue, 05 Jan 2021 09:20:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/43] tcg/s390: Use tcg_tbrel_diff
Date: Tue,  5 Jan 2021 07:19:39 -1000
Message-Id: <20210105171950.415486-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_tbrel_diff when we need a displacement to a label,
and with a NULL argument when we need the normalizing addend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 1444914428..e4c61fc014 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -630,7 +630,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
             return;
         }
     } else if (USE_REG_TB && !in_prologue) {
-        ptrdiff_t off = sval - (uintptr_t)s->code_gen_ptr;
+        ptrdiff_t off = tcg_tbrel_diff(s, (void *)sval);
         if (off == sextract64(off, 0, 20)) {
             /* This is certain to be an address within TB, and therefore
                OFF will be negative; don't try RX_LA.  */
@@ -655,7 +655,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     } else if (USE_REG_TB && !in_prologue) {
         tcg_out_insn(s, RXY, LG, ret, TCG_REG_TB, TCG_REG_NONE, 0);
         new_pool_label(s, sval, R_390_20, s->code_ptr - 2,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
     } else {
         TCGReg base = ret ? ret : TCG_TMP0;
         tcg_out_insn(s, RIL, LARL, base, 0);
@@ -746,7 +746,7 @@ static void tcg_out_ld_abs(TCGContext *s, TCGType type, TCGReg dest, void *abs)
         }
     }
     if (USE_REG_TB) {
-        ptrdiff_t disp = abs - (void *)s->code_gen_ptr;
+        ptrdiff_t disp = tcg_tbrel_diff(s, abs);
         if (disp == sextract64(disp, 0, 20)) {
             tcg_out_ld(s, type, dest, TCG_REG_TB, disp);
             return;
@@ -956,7 +956,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         if (!maybe_out_small_movi(s, type, TCG_TMP0, val)) {
             tcg_out_insn(s, RXY, NG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
             new_pool_label(s, val & valid, R_390_20, s->code_ptr - 2,
-                           -(intptr_t)s->code_gen_ptr);
+                           tcg_tbrel_diff(s, NULL));
             return;
         }
     } else {
@@ -1015,7 +1015,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     } else if (USE_REG_TB) {
         tcg_out_insn(s, RXY, OG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
         new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
     } else {
         /* Perform the OR via sequential modifications to the high and
            low parts.  Do this via recursion to handle 16-bit vs 32-bit
@@ -1050,7 +1050,7 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     } else if (USE_REG_TB) {
         tcg_out_insn(s, RXY, XG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
         new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
     } else {
         /* Perform the xor by parts.  */
         tcg_debug_assert(s390_facilities & FACILITY_EXT_IMM);
@@ -1108,12 +1108,12 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 op = (is_unsigned ? RXY_CLY : RXY_CY);
                 tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
                 new_pool_label(s, (uint32_t)c2, R_390_20, s->code_ptr - 2,
-                               4 - (intptr_t)s->code_gen_ptr);
+                               4 - tcg_tbrel_diff(s, NULL));
             } else {
                 op = (is_unsigned ? RXY_CLG : RXY_CG);
                 tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
                 new_pool_label(s, c2, R_390_20, s->code_ptr - 2,
-                               -(intptr_t)s->code_gen_ptr);
+                               tcg_tbrel_diff(s, NULL));
             }
             goto exit;
         } else {
-- 
2.25.1


