Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB82479C71
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:53:19 +0100 (CET)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfle-0000Uz-Uk
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbk-0000pp-CI
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:04 -0500
Received: from [2607:f8b0:4864:20::52c] (port=46863
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbh-0003U4-RG
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id r138so5440123pgr.13
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nf0so4qrr+/bxDxj+Sw0o2TYL+Hd96M6E8AXnkGVi40=;
 b=IKEKm8ZVV8a6JXaL1nB5ed/v6aXecSEyTisgvUoUbHHLw4Ab/xVo2bvaY547HeJSVp
 gBIiXJ/xzI0ANGRAa2Sz4mkHvesGGCBPnP+g+1yqrMjxWj4JuKdBNrCjhdLkhP5+F2Xn
 4cvQYud6fWu03W2kEUmwyZDtmhqNfckzp+8AVt5ZxL3KpqM4EzP6Cw7AX1WmFYCR/YdT
 wZJJrK2xTel7xNm0ZwiqRNpVpQ4UbVp2lpYS4AOu54Lf7jDHDrkIkoHrlVPoUCMVgoyZ
 kc6QZfJUn+9n26C2awZYlgyN5/JFQYs6CHdhqEhLtqU8Casz5HgWUdlUuajqNCDczAI3
 rOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nf0so4qrr+/bxDxj+Sw0o2TYL+Hd96M6E8AXnkGVi40=;
 b=690MANBOShF4LjRhYdhGCTEOjpCvxRBXT55F7c4I81zBPCEwy0/5cl7lzedjqFsHpY
 Rsr6/BZDK9g5LNiSROQjoFYw5bw618fYTOrESNlGfQTCSI297EnX0TNUvF7S06AUzTTR
 JZsTdJ4zazPjuiX6UPJIlEfPc5TKoNo7u4HUksOFnLJ7MoYJNxBHgfrA71AX1DjTvU5E
 uo69YiAAFJkWW4ugkun6haI2f0uV5PejUtA/UdSj/7NBSSu0HNNW4Jw0M2P3e3WjzHuX
 J04KRdRKFKexA8BzRfq1UZmp8Ew5yTnk1z4j+P5SmrchqBgssMCzLwR0PR2l2C9wSkOH
 tzrQ==
X-Gm-Message-State: AOAM531gPn0in01CLsiUjH/ISMpkYeqVg0YijYG5Blxb2oBpxeg7Nz5Y
 d9cScy/UDlOvbrRqmAc7i7aXSkUIZrHvjA==
X-Google-Smtp-Source: ABdhPJxrtwVtyHbDGbcSrfI6YWt0s8dKsP1Y0g4SpUUX/6DJZTgjzLvmLxUshGLKXTv/uajyMtiatw==
X-Received: by 2002:a63:701b:: with SMTP id l27mr8112639pgc.241.1639856580516; 
 Sat, 18 Dec 2021 11:43:00 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/20] tcg/i386: Expand vector word rotate as avx512vbmi2
 shift-double
Date: Sat, 18 Dec 2021 11:42:44 -0800
Message-Id: <20211218194250.247633-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

While there are no specific 16-bit rotate instructions, there
are double-word shifts, which can perform the same operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 30b9afc1d3..54fb8321a9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3350,6 +3350,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
         switch (vece) {
+        case MO_16:
+            return have_avx512vbmi2 ? -1 : 0;
         case MO_32:
         case MO_64:
             return have_avx512vl ? 1 : have_avx2 ? -1 : 0;
@@ -3494,6 +3496,12 @@ static void expand_vec_rotli(TCGType type, unsigned vece,
         return;
     }
 
+    if (have_avx512vbmi2) {
+        vec_gen_4(INDEX_op_x86_vpshldi_vec, type, vece,
+                  tcgv_vec_arg(v0), tcgv_vec_arg(v1), tcgv_vec_arg(v1), imm);
+        return;
+    }
+
     t = tcg_temp_new_vec(type);
     tcg_gen_shli_vec(vece, t, v1, imm);
     tcg_gen_shri_vec(vece, v0, v1, (8 << vece) - imm);
@@ -3524,8 +3532,16 @@ static void expand_vec_rotls(TCGType type, unsigned vece,
 static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
                             TCGv_vec v1, TCGv_vec sh, bool right)
 {
-    TCGv_vec t = tcg_temp_new_vec(type);
+    TCGv_vec t;
 
+    if (have_avx512vbmi2) {
+        vec_gen_4(right ? INDEX_op_x86_vpshrdv_vec : INDEX_op_x86_vpshldv_vec,
+                  type, vece, tcgv_vec_arg(v0), tcgv_vec_arg(v1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(sh));
+        return;
+    }
+
+    t = tcg_temp_new_vec(type);
     tcg_gen_dupi_vec(vece, t, 8 << vece);
     tcg_gen_sub_vec(vece, t, t, sh);
     if (right) {
-- 
2.25.1


