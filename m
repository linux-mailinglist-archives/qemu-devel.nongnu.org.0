Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5081D655BDE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:03:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOU-0002Hv-3z; Sat, 24 Dec 2022 18:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOQ-0002GT-5k
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:30 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOO-0006Ge-AH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:29 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 19so1057872plo.12
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=FesStA7qsfUIwMgIUKOlVap98sJ6r/hwLcAOLoVSJzICVmTRZSVbSgYDMSZdjZAiv4
 AJWemDZQqtn4D5k0AJyx+u8GEOHtbYrb7gRvLhx+Mr2BGWTWZSy25IF6agbhYM8r1CQk
 KOBneRzn+a7WNGRtKBAay7v5402o4z1e5x9bkerPgVcVpY6MpsCsAHoBuEp1NoA/gbYr
 MtKrfbY+7zcNvplTMOQsAjSR4iIT+qd/nJAz9E3335h/MM000LNS0nIDvXFtfz58dmbJ
 Up7rtUhZ2244s+g0sSHSNfTVbaju0S8MIuVl8yPmIhEqCTae2/ZogqT+xkDn5Hp6Q9f/
 X8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=XSGKewi3/a4VxN2SG5lhphvJ5DvTWrYY2+lFFUc7GDdiZICYWpNvu2AAgu+n1jU4TG
 WnhMg9X4iSCT0nj5IJwy4/JSdwJBhrbOzDykDKzJtYVb2dTfyYDadS8sM9dW9OViRKAo
 Mk0hpabjr4c7rfC1JJBpAF8cRpwVJQWDH5FOmSvhVNBcdJZIMQVD0sYval7ayeQ8pCUq
 bBJuepY5SKe/Tg2DAgD60xGTif91GH/2xQ69tFdee/kjWjYycs1Qfh3UuGJ80pdplv8i
 hMHCdEl/19M+FID52ZFUyUak5tzPc+oSI/q9+pJE8JbHzRcYjVmBQhSkKGlaqC08O7OI
 gR3w==
X-Gm-Message-State: AFqh2koo+wyQcx1i/j7GZOslhN/0TQj2ZeXBvh2sgWUJBgux3W4Jfy8Z
 lbdX8tkReZu+UvUThFspb4GpWCwY8fgDxao/
X-Google-Smtp-Source: AMrXdXtbr0YUwWl18dmDZfWNfJPtZ/HZNg2kQiaPJTaTWuGsBJXOqJpyAQE5oWgsQyoZlf71ZeEyew==
X-Received: by 2002:a17:902:d891:b0:189:d979:22a with SMTP id
 b17-20020a170902d89100b00189d979022amr15355705plz.29.1671926245074; 
 Sat, 24 Dec 2022 15:57:25 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v5 03/43] tcg/s390x: Fix coding style
Date: Sat, 24 Dec 2022 15:56:40 -0800
Message-Id: <20221224235720.842093-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

We are going to modify this code, so fix its style first to avoid:

  ERROR: spaces required around that '*' (ctx:VxV)
  #281: FILE: tcg/s390x/tcg-target.c.inc:1224:
  +        uintptr_t mask = ~(0xffffull << i*16);
                                            ^

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221130132654.76369-2-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..f1d3907cd8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -802,9 +802,9 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     }
 
     for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i*16;
+        tcg_target_long mask = 0xffffull << i * 16;
         if ((uval & mask) == uval) {
-            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i*16);
+            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
             return true;
         }
     }
@@ -1221,9 +1221,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i*16);
+        tcg_target_ulong mask = ~(0xffffull << i * 16);
         if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1231,9 +1231,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i*32);
+            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
             if (((val | ~valid) & mask) == mask) {
-                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
@@ -1279,9 +1279,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i*16);
+        tcg_target_ulong mask = (0xffffull << i * 16);
         if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1289,9 +1289,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i*32);
+            tcg_target_ulong mask = (0xffffffffull << i * 32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
-                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
-- 
2.34.1


