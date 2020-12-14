Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728082D9A13
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:37:18 +0100 (CET)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooyT-0007vq-HD
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSU-0002AZ-0m
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:14 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSS-00041I-2U
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:13 -0500
Received: by mail-oi1-x241.google.com with SMTP id 15so19241709oix.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=OFkbbUcGudf0byED37KQrQQ+2t7+REliUnnk+wpcPSRsLUucGWJTd+E0iMkvEgUH43
 wmcztRjHZjapXoT6tjVzhfavQIr75HX/572pB6gkkOtDl2D7jy9u+nQi0pidbhVjRXcX
 pdQV+wtiANcu99RPqGikT2n5FaxasaE8pEQBD5bSPL66aXS4n1O2+V8YD4RYWIKVBaLy
 nWl5AEv2gDDSz/Gz2zjV/+6DnWKQvLDK7j8lJtCp8A1tHdxs1C7CT2yAEac3hIlAxWpv
 BqqwTfzmCiPHN48hCr86KrMWQ9q8MPt7XUYgcdsiuxSAO9N8KUjSwn7HGLKnE4SiPETS
 jYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=qDcMpqMbtWwXJSxmGS+g7CGAIrw5GQDLKFO0OUVv2HBzhbPtrB3v8l6meZ/VBQ+NT+
 lR7uiOGLNQCx8uT1ggOsnW1KSoL1G32gMYjJJv0k2N3HmSUwxy0q0watAJsbQfIO+AFO
 mBGrGzwhBTAPv024YY9ECO/lNvbBymtnPkslFdrnb3DciUgwcZ3qv2h4/PhxT55Q1ymV
 f0+ZaP1Yy8nrmXaZjRahSkUS4wisQ1QYopUgoV5EqRulqTdj0k4tLeFv85FU23rY5+ju
 wq4CJYZ3LrvzqaazswYLsgPDCcziPQcFzSNP8LMGFv0KEoM7A+uUyjlytxdpB3b/wbJf
 CE1w==
X-Gm-Message-State: AOAM533Z2MRmOqBhu2nZfY+603JPV+aV8dYTdlBmrt/OhAXclIZQP8WQ
 PczdCpjwIaYvbc7xb3BsAWB2jvTx5Bh3TrPw
X-Google-Smtp-Source: ABdhPJxFl7t0EN4XSa3BWrDlNOAK5GABOZbVWdSfolh8n4Q2h6+p5jAhaNS8YvAkzyJ0vtKUcQkXpA==
X-Received: by 2002:aca:4ed3:: with SMTP id c202mr17409395oib.95.1607954649252; 
 Mon, 14 Dec 2020 06:04:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/43] tcg/s390: Use tcg_tbrel_diff
Date: Mon, 14 Dec 2020 08:03:03 -0600
Message-Id: <20201214140314.18544-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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


