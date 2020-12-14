Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7C2D99FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:31:07 +0100 (CET)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koosU-0000w4-JU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSQ-00025A-Fc
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:10 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSJ-00040O-JX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:10 -0500
Received: by mail-ot1-x341.google.com with SMTP id y24so15769075otk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=WMMeYOtDU8uzl4qt7ittcULDkhk+Y1yLVe88v/iPk2PRM/V93OZqFdkmJp/UfQ0Ew4
 SIAOal4s4KViJQJSdQapwPTppkKQ7cBvw7busMhGqSjLmojDCPP885L+YIh+WOpj2gfN
 tPdPHHEZ09Rn88KSzcaVwgFmvDGO4+MaoASGoawjQIh4o4iV0suQeeYEQnwK/QZ8C2/w
 CcrAhPQ5SMyeltzVRscr7Nz/2VyvxYlNt1ZbQiOp5AgfDyIftsvYHvcUJYsq5p7m7Cva
 7GncAj4C5W3GZvAHX1C+3J7MGkSno1vi7eMulxMIjK1Gt+NZCEjT2v1VG7qJX5Qkn4OQ
 1h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=T4uXUy0QCyhESv7MWDd0gjcQ6JHNYNYqm0SMglv+zP+3AO/avKADSqTt5V2/o+jsgS
 QEKmKYes0nJkTZI2s793xzlLR2TKLoT+ge3YouDjlJaNyycJvVbBAnq1vE3UlDzJ78uP
 qkhEs5Nlm/JRCa80Xxj3DvbmhF303ylSuQa510PHf2Gx5F4sWalfxwIAAQGyalEz5g76
 5FywXFNeAqRaMtl9os66KnDDPNk4dEsBCNoE0U0vTAGKez6z8ASqgPYpPSIV6jsHXSAG
 HJGXv1O7SyHe7i+isFMtpzgyu4po4Snih560+M/Ep2TtX8q98SvtVXC1tmdSG4TWTAIH
 oufw==
X-Gm-Message-State: AOAM530tHQlleAgQX40TizqnssEZVr4EHvTWxz6FIPIgk8APhO6HxFBb
 3Qjk3uBItXGPN2iLmOIZ7Yc+dge+SecDQqBX
X-Google-Smtp-Source: ABdhPJwHSECkDAS2CfLByriAu1E4R3J2PGF+Z1r06WZaIZnyMEzED5OgAo6YCmKyR65KaCaV3IpaRA==
X-Received: by 2002:a05:6830:107:: with SMTP id
 i7mr19290608otp.247.1607954641060; 
 Mon, 14 Dec 2020 06:04:01 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/43] tcg/ppc: Use tcg_tbrel_diff
Date: Mon, 14 Dec 2020 08:02:58 -0600
Message-Id: <20201214140314.18544-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
 tcg/ppc/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0eb9c4ebe2..ed7a201578 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -837,7 +837,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Load addresses within the TB with one insn.  */
-    tb_diff = arg - (intptr_t)s->code_gen_ptr;
+    tb_diff = tcg_tbrel_diff(s, (void *)arg);
     if (!in_prologue && USE_REG_TB && tb_diff == (int16_t)tb_diff) {
         tcg_out32(s, ADDI | TAI(ret, TCG_REG_TB, tb_diff));
         return;
@@ -890,7 +890,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* Use the constant pool, if possible.  */
     if (!in_prologue && USE_REG_TB) {
         new_pool_label(s, arg, R_PPC_ADDR16, s->code_ptr,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
         tcg_out32(s, LD | TAI(ret, TCG_REG_TB, 0));
         return;
     }
@@ -940,7 +940,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
      */
     if (USE_REG_TB) {
         rel = R_PPC_ADDR16;
-        add = -(intptr_t)s->code_gen_ptr;
+        add = tcg_tbrel_diff(s, NULL);
     } else {
         rel = R_PPC_ADDR32;
         add = 0;
-- 
2.25.1


