Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D963FFE4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymN-0002W4-Sc; Fri, 02 Dec 2022 00:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymM-0002Vj-EJ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:06 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymK-0003Bu-In
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:06 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 21so3964460pfw.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=bZtQRadi8r12yA7REVcLobpqUjKAVi+r48VSR/QMv/GDxXb/GOIaLeB9jHhovRQiYE
 GJh3bOW62+37pyzZZVqYFcWDtlkFm4qmPr/Oun3FWRtElCyC3Df/+AIE7hhxggP+1HqV
 QyNlowzu0oQYMoJUPflm23LSKtv9ml0F4ijqEXs9qFZbK2BamfcFiepsiWiOx6moB2Kw
 6dfsKZgfbpfGwbM7uAdpNkXYwU9X1HeQQlkahfREPepg8T6vkAZz9IvbQ7Jv2oBs+mZz
 LjcA7RXSwKtYe/HRyduI4LyEL0YNJ34LXlUgFBC4cA1rdlMUCl5z3zarEOiyNbTIWJLP
 bqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=aYLjUQsCmGtjLFTtstIfQfrPQtt2YR7zF/bCSEiZiKP4YPBYFBav7g+PCxdjq40W7U
 F9lWefl5jD/YjYdKWKmeziAIWtZSxNUbA6az+M1x57nm2NqZuC9OFmdzXSETW2naH5g/
 HQG2YzswxvTzavzxbE6I1YmcF/OJtXr4xBRPnTxZZ+GsB9/wMBon6FpfoBQOSIVKJpJs
 +wjY89XiglXpEewqPBSQaTeuY2QQxYqF6KYIvhAbqU/k4pSWo7cfiFTnH4Zt/LfmgUVO
 pTMQXOc4JlznEw15bZSoOthvy3yHzG2wdqeQb+YAP9b9y6kwgVm/lt2WTGaq2xQQBaCB
 fLRA==
X-Gm-Message-State: ANoB5pkHnOs+aFJSPdTU210dQtyXxAA+tH3Mq6y0UKgU5fISSIilXTSV
 JBDk2vaYbd2kvQodYwAyf+H7F54RomTbhg9N
X-Google-Smtp-Source: AA0mqf641ZiOY4GX5De/EL8/Op0M/6CPWA3xVlojevLssXluICCRxeRveDTDA7A09QbecRWDoCw6Jw==
X-Received: by 2002:a63:dd43:0:b0:45c:5a74:9a92 with SMTP id
 g3-20020a63dd43000000b0045c5a749a92mr44635679pgj.473.1669959603052; 
 Thu, 01 Dec 2022 21:40:03 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 03/34] tcg/s390x: Fix coding style
Date: Thu,  1 Dec 2022 21:39:27 -0800
Message-Id: <20221202053958.223890-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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


