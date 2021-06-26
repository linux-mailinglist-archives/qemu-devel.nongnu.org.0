Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA83B4D2A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:42:06 +0200 (CEST)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx20z-0007Tf-Va
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vk-0001rL-PM
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vi-0000H3-8S
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:40 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6824102pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+P2plpG1hEGbBa3PeQi557W/CtPojqSuoRPWccO52Y=;
 b=ruECmRIjDCfgSsJa2s1Ws7unnSZYNI3lhfoOqDHKBTG3Ni1MfDUumK5CAzPT0kJQVL
 EsAsE69hLmwPO7c7HfpQwVNLNM763rRFldyz0/frSYhxYN4oZBmraBft3wOnwfyLQflT
 hoXVowAUftqW9jbXjTVOikarBN8n9LDYz0Y/rhTDETCF5j+8yzPQsXgAEGGzB9lD7/XH
 JHH3N4KENiykufQzE1X6X6ymN6nAOxfqiD6NhWyL9zOF5sT8DolhzCwXD/JDBAMBk/EO
 4eBIpZEtAkiviugdUn2XdGWnM6I4viNbkNCNo/JIeClPewvFw6dwwnfa1/QO93UquNyY
 NYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+P2plpG1hEGbBa3PeQi557W/CtPojqSuoRPWccO52Y=;
 b=nYLj74t+EGmsg+kFh8/dNMFvsIE2pmFQ3y6JK0j9nh7kwYIWota9DAZHWR56yeGls2
 z8pgXtNNcSbjEvobnsYW8XSEA/NPOiJtI+jHqkJvu2NfC5Z5ctqhwiX6XrNtiOZR6iay
 hZKocgw+Qo1Ry0LL3OzEycjA1qmUbrrTuY1WfAVDSd7PJ31IjHFiRRkM7K1o3uf9/raN
 pfgnwEUVZ7OTay488DEceAk5zjx0q55JSRVl5VJY5Bc8aTBrlVKb75fSRLOjVDwrjzuB
 NKz4oTPe1vOIv0UeSqjvScyY+X+vYnKiOsM9TuW+yR8HHuMmm443cQJqfEtHemT6n+3N
 TrCw==
X-Gm-Message-State: AOAM531sT1bWpl2Imeerd1sRHdN2IQ7z/Tun49GViU+irkl8KOcyCWNA
 BO8kzxfAIQJrNydrUjRtY266LdJQHSEW4Q==
X-Google-Smtp-Source: ABdhPJyos+erZxuVJTLWK8UVojR/N0Xrf94KfCaWZJ6tKpirGxnCoFTRNbYgjQkMwOL5acvf4eTbsQ==
X-Received: by 2002:a17:90b:1115:: with SMTP id
 gi21mr25213770pjb.116.1624689396930; 
 Fri, 25 Jun 2021 23:36:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/29] tcg/ppc: Split out tcg_out_sari{32,64}
Date: Fri, 25 Jun 2021 23:36:09 -0700
Message-Id: <20210626063631.2411938-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require sari in other context;
split out both for cleanliness sake.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index aa35ff8250..50347182d7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -768,6 +768,12 @@ static inline void tcg_out_shli64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICR, dst, src, c, 63 - c);
 }
 
+static inline void tcg_out_sari32(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    /* Limit immediate shift count lest we create an illegal insn.  */
+    tcg_out32(s, SRAWI | RA(dst) | RS(src) | SH(c & 31));
+}
+
 static inline void tcg_out_shri32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, 32 - c, c, 31);
@@ -778,6 +784,11 @@ static inline void tcg_out_shri64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICL, dst, src, 64 - c, c);
 }
 
+static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2601,8 +2612,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i32:
         if (const_args[2]) {
-            /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
+            tcg_out_sari32(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
         }
@@ -2690,8 +2700,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i64:
         if (const_args[2]) {
-            int sh = SH(args[2] & 0x1f) | (((args[2] >> 5) & 1) << 1);
-            tcg_out32(s, SRADI | RA(args[0]) | RS(args[1]) | sh);
+            tcg_out_sari64(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
         }
-- 
2.25.1


