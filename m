Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2008700A8D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxX-0006xZ-3J; Fri, 12 May 2023 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxU-0006uv-Ns
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxG-0004hR-O2
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so5092239f8f.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902469; x=1686494469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7ZdreOn7GzP2/qhzWCJzqHK4hMlTf1RtG4DdFV8A+I=;
 b=ruCmCfeAjlWFv6ZAPQ1UCtxDHaOIBb3VUZxb6qXl4HP1Q4Vtwp4zJh6LG6zDL17gqI
 gQtGlrIR0fUBGWUyD8zMvHUMPAYMc2Xh1Eb5Jyy/oMANuGsrKI1Hz/y3Q06bC9/+RBYN
 zKzm07JtdFVOu8qwjznHxzsgW4YtdpUDN+rcWSOsbWe6aYTOCWRwekXgjTYRxSWxHBLw
 0Z+kUMUrUS5oGJyh1eE2AGyC03HVpg5KftAyIk/8k7RKhA4foVXbViTxRSWQqEYkVy01
 eo0GnWXEgTzdTfgSbrE2F7l5GAYuuSR8S3x3nrZYCIkIv2azjQGJrDpgoYXAE8SeGYr/
 aGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902469; x=1686494469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7ZdreOn7GzP2/qhzWCJzqHK4hMlTf1RtG4DdFV8A+I=;
 b=LlYtH9dLm+7PynGCTbOco+mL9Tfi8cZGwT9eNiuw11XGHwqjBmZcSQOHbLdbitDCLk
 aN5eJCcLjm5+i5zKQUImqxTBKtitGWrlouHu1pHNF3XDpp4gb5nTjIjugt/bRbCSy7wn
 8UDxWKbqigmxDXYvm3vytGVNpVmgmj3nSJUdoUVgE4u5Vw4p6p4/NQdQBuvqUb8wYBA3
 KLkyVwjfych/rlFuuNPG615YsW0ofOGNfTIJtiDFM/dEOsho6Tw2Ce10D/c2zlBkxeyu
 VBEeiOPUhK7WrNRB43aaUE5XOQ7l98LBBllfr5DTvXwgNRHiEIpkyQPudCkKUYGiiDCB
 6cVg==
X-Gm-Message-State: AC+VfDwxDDATabcO8BizypAmTEqgdQm3Zv4W13CBvA1MAfXd05GJbS00
 HLr2itvosAn+QtrmVyj3t8F21g==
X-Google-Smtp-Source: ACHHUZ4ynFIKNJ5+x8jXIa2gDLJLhQmnWnzpybhkNhtVhLpLJBefNX0KTwxtCON8w7lpqLFTa1SGDg==
X-Received: by 2002:adf:e991:0:b0:307:a58f:5f7b with SMTP id
 h17-20020adfe991000000b00307a58f5f7bmr8780705wrm.64.1683902469393; 
 Fri, 12 May 2023 07:41:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 03/20] target/arm: Pull calls to disas_sve() and disas_sme()
 out of legacy decoder
Date: Fri, 12 May 2023 15:40:49 +0100
Message-Id: <20230512144106.3608981-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The SVE and SME decode is already done by decodetree.  Pull the calls
to these decoders out of the legacy decoder.  This doesn't change
behaviour because all the patterns in sve.decode and sme.decode
already require the bits that the legacy decoder is decoding to have
the correct values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7862e9dd4e3..2845febb713 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14205,19 +14205,6 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
 static void disas_a64_legacy(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 4)) {
-    case 0x0:
-        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x1: case 0x3: /* UNALLOCATED */
-        unallocated_encoding(s);
-        break;
-    case 0x2:
-        if (!disas_sve(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
     case 0x8: case 0x9: /* Data processing - immediate */
         disas_data_proc_imm(s, insn);
         break;
@@ -14239,7 +14226,7 @@ static void disas_a64_legacy(DisasContext *s, uint32_t insn)
         disas_data_proc_simd_fp(s, insn);
         break;
     default:
-        assert(FALSE); /* all 15 cases should be handled above */
+        unallocated_encoding(s);
         break;
     }
 }
@@ -14445,8 +14432,9 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         disas_sme_fa64(s, insn);
     }
 
-
-    if (!disas_a64(s, insn)) {
+    if (!disas_a64(s, insn) &&
+        !disas_sme(s,insn) &&
+        !disas_sve(s, insn)) {
         disas_a64_legacy(s, insn);
     }
 
-- 
2.34.1


