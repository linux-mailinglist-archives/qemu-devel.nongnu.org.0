Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB759640E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3bf-00071h-E9
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H1-0004yb-FR
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:51 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:44711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gr-0004aZ-No
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:50 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so8170974otq.11
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=X92Dz0ywDzYVawuTMHXDyda7X6TRtqlFqLPovKxZ9n41nVF+255bVQKGefligoePjf
 D31wpZrBOtdUxNRExGjCMxIwoz27vzmPrnp1LBkKeDWxeB0D48eY6At1R8e665gMcLoU
 VCgLjMyX2qNN6AIg3hCATLwsEGiApUrdR9xJ9cnjy6IHjqB5eLtOPdwJPAcxkR//zGrq
 UzAMaJJhCKTBIGdpfT3trc+2ZsCAE7izJSrazlVnA5a/xSz/FsnaqbXI9jRoErv5hk/b
 GW4MhjN9+rMW3RdIdC+SGgAAUN/WS7CqeRA2Sm6J8HtgIzMruWFZRtcEqxZ4iC+Pbdil
 aKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=KVRwcyoTDm0AhUrH/IQ8HbbBx5BqOFXanSHHUEgpbv58C5vdo97EmhR4PU5yqmzPVF
 7MLVprEpkUJq4DGdyQkx6jZ7nw2kR+nMG8D4Hnueut3p2pNdgt+0zylr9QajIeDTKQ73
 JIiT+wJEYj2uacrzmoYTWZBmBLbzfghm59cVf60OaIBSFLUbu8u+0FwAunVeLXIjaXu8
 pAX2TuPHCTtCeNvG9T7zEsaDdEtSHOR3ikZA9vlWOjPJXfY5ZT+4uRhPyNu1qIr3ZkwP
 8Z0BlgqPQX4oD9HJg31/jq8FPnAJh4nY2mks6ToDZDqsbK12Bgy+6fOM+1hnR5s2hoFv
 nGVQ==
X-Gm-Message-State: ACgBeo3Ywc8X2JrK2mIfgXgGriuIvad9Ww8+DXbilo2sieHjRxFeHPTQ
 FHfutJZqCa8rx1Du8Y/AGvU21+xH6dbiHw==
X-Google-Smtp-Source: AA6agR6yl7Qnimj3IyIacPNSmD9eJDnO919G+6ORJeewh7oAI0+GovcnGbCxYwcHfQmtlL9qM+54sw==
X-Received: by 2002:a05:6830:2646:b0:638:b172:92d5 with SMTP id
 f6-20020a056830264600b00638b17292d5mr3498326otu.75.1660682080696; 
 Tue, 16 Aug 2022 13:34:40 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 15/33] accel/tcg: Introduce is_same_page()
Date: Tue, 16 Aug 2022 15:33:42 -0500
Message-Id: <20220816203400.161187-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1


