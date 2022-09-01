Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4105A8F8C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:15:50 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeQY-0006hl-0x
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4O-0005wO-5S
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4I-0003HE-1f
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id u17so1744245wrp.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=iHHwqQQDIPgqQjEBQ0AM+ad6yviEEToq0tbdAALDR4+2KIGud02xYzu26YAtD0sV6K
 P7OgBy6zISuKyrDS2Es0hygczDk79dTYOt0sVBLOgu97vBbyzcMwGXVVpOh6H6TurWii
 QROQiKfUlwYBH0GX6f7erwBko7sfyOjIlF5wOVPGaFG0Nbcyz6MJpVTPq2yKOh3xZEaK
 RzMw7bYowYw7srFuCU08VlrWQuEUNlnCGbxsbWQLHPaP5OIGC9VXbvfm29wenrUsb8w9
 zC5b6guil4d1pNARPkVxhgDch7roQAmVMT33Yd+DxPOS4VA02vktfJZd0Ufle7R6mgOD
 +phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=kw3cCqoHgZIM/IKC1YxV/ncd27ZCQ/M5H++C1B75NJmMJ7ewr2zdiVHjvK/FNz3S/2
 wT8R7+epmNvTy+iXxNGOWI59fssR+RFVIPPsiGCJscsombBYgWQINfals23gw06Rqtsb
 qPYfYWXat9QaLA272e3YxgwPLa+4bCcci4O2j1w7tdlC5wPORgd0vXvTuz2MnSaQ/nyp
 DglJXPqZy+aM99i6B1l4w5qX9eB8/OrQ3t8I0ct1TKozAU/Wi4EszC+J99u2Aa3Jh44L
 xlqMkicpgi4l/44UMlpfwnMYxNiBjYPAi/JQB5/CP53Xh2YiRLX+9RFIW1gKYWkK9H3W
 CLiw==
X-Gm-Message-State: ACgBeo270iNOZA1J4DyOC4MtF0Vz/wn71AGk4H1NbjnHWwzXZd0HKKHJ
 IPZcBIz+Ace0E03lIR8xjTcUdJhOXamnklLZ
X-Google-Smtp-Source: AA6agR6jviPDtlARx0B09x8DAQAC37RK3TVwyheFmDbeocoSRsX57gNCHiZ3ZYYC/eHkz4dA0TNLkg==
X-Received: by 2002:adf:e78c:0:b0:225:f5db:969e with SMTP id
 n12-20020adfe78c000000b00225f5db969emr14331996wrm.716.1662015167107; 
 Wed, 31 Aug 2022 23:52:47 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/20] accel/tcg: Introduce is_same_page()
Date: Thu,  1 Sep 2022 07:51:57 +0100
Message-Id: <20220901065210.117081-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


