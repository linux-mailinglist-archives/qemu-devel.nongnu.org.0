Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26E2EE730
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:50:24 +0100 (CET)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcEh-0002Oa-Dg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhY-0001Ya-1t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:09 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001ht-2Y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:06 -0500
Received: by mail-pg1-x52a.google.com with SMTP id v19so5713810pgj.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=WSQ1vjMfcFSEiFwD2ilBFyUMOxZMGrRhVjafLy8ZGx+qy72Mchrfm/WUWVn8R98UsW
 lwes/MpfVJnWrENSTZX47IGvC678x0++PJpzZbMpYFa0dR4EJLXxWKLMkDIUsnazFFnx
 3RGyelxFzD+QBkN7kFIws01jnrgt0eJls0cAczmj0Sh0R1QyDTcjyuLKlnUHYhpoTvYG
 UbdD9f9ZvbxlwNsqjbHZdIYWBSgJd0A+T0CRMOMA8Viue9GEukluvaOuhGv3Eg1sIPrD
 gDsLElrJtl64bm0FEsSFYSs1727DBYi/dbk6ol8DRn8TQxNmGwXCSi6TcMib/E4rI4U1
 HTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkypnopb5BzPYlv4jtMpd96OEpFhEMM9GKjZQ7ld/TU=;
 b=KSFDGJuJuzAJXFa6NS/JOwNLAPSlOdhH59aM0z6DF1nSRmPYOdd3qYR+wUKlRMCXGE
 MrkOVZ4zGVEIgZRuRCtkDV3bb42uvNw9eczDOFOK28z6VewqUS6E+mX4QTVNg4yY6kCJ
 p1pYbqtgCKfNnD9XAhmnUKdAKGe1TN1fStc783P2HOYye7YtdAAC/9NEGX/8vdNbdvIo
 JXsP7K6kLl8oMfSo6FtkqG1DKNBXmXN2QRyEiEjc+Ki68l/lzZCdi5mCwi7GN5U7k6jX
 xYIA8bVANtyU6cOI+qVgjf8QM26duniTf8MPSl40itJhkCi6c52E15KzP63LYkxW/KG3
 vL4w==
X-Gm-Message-State: AOAM5306g6btZ4y/lzLtao82bZsq1hSTNIw0XsHJm1ycyqKp5HGFFf8A
 S08nG6avXOJiQ01VUgf0cG0/R5AWBIgojA==
X-Google-Smtp-Source: ABdhPJy6NghMJS5atYhHL1V6+4/bQAKmhNmIOYLgDLGVyxD26honS2Q/15XKEKy5ju/B4Ra1F8H++Q==
X-Received: by 2002:a62:38cf:0:b029:19e:41ac:526b with SMTP id
 f198-20020a6238cf0000b029019e41ac526bmr375454pfa.0.1610050554032; 
 Thu, 07 Jan 2021 12:15:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/47] tcg/s390: Use tcg_tbrel_diff
Date: Thu,  7 Jan 2021 10:14:37 -1000
Message-Id: <20210107201448.1152301-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: peter.maydell@linaro.org
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


