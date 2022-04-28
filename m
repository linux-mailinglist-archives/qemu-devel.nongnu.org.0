Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E779D51376B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:53:27 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5WJ-00015T-19
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ja-0005EB-5z
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JY-0006GS-Ko
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q23so7097080wra.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3SXQK2e5H9f8jpPSeEKEA5MUIJM1yA208qybcvx/YqA=;
 b=RBF8GU/bQc/E3BUsUgGtQ5P4vqOJZuh4E0ch9ICIAb4+MJJ4oEyoq0AoMJ5qc+G8w0
 iDRTh31IoB2UVnJlCtvULnDTc+RsdvL7BbNQVvphsg2CHPelrqaz7S1I05f4Qp75wK2O
 jOusSGV3hSpnYBXO1h0j4e6hML6MoDEU0sTo1vdCfniZmmKKxhQvvoi0BGwZGkPd4SnW
 wiJceqntk/s/I05qt3UwQDpd4OFC6woZuIw9yH77EWlE3hfbDV3ao62vYrVDl2sP4DJc
 80/qH7/hX/M8Tra6WI08EJhCNkqMy5rvievY4wB7JKlGP4Aob+d0BYQSze+5y0lHxzhK
 SlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SXQK2e5H9f8jpPSeEKEA5MUIJM1yA208qybcvx/YqA=;
 b=0I/OCS7E03o7WB1ZdVywLLUlqryNHvKh88c5O5M5MVY+9vgGa1s4N0GmXEFV35VmxH
 AIf3HFJhg2mKfn98YKGukUNHxBlYw85Y5Bhljjr8Ad/0MV0RvJApUG5Z2FbIgeIDyqRZ
 yNK2w76p8aJzUGBDdX0QWKX5EnAzV+DtGOZcFJz1qS55xSGfpM4Tjn57SBHO49wdx9e2
 7OpjM0zkCpxvrbJF+wkixWVUV27V2+CypBGVIJsq2jU6BfUy3EJfs8Gl6oXZkGkrrz2l
 09winYv4X9xb4t/O4GxAjHKt6i58dLkqFO2MGGVkyygC1uP1JrJdVAwUA8n/Xu6VqvKj
 3Ecg==
X-Gm-Message-State: AOAM530/PQMsuF1YO5Z/cKKxlhzCM6jBLLK+z0ccOz9yY/9YMczkAent
 0Y2AhmUaGcgwBwDkNjV2g4sfuQbKV1vTog==
X-Google-Smtp-Source: ABdhPJyZfroisqTAkj4AocFKT7J+w/SBjdwhHhxCttzWKVvrEE94q40+EtqI83r/k7Z+jzfZUlaXbQ==
X-Received: by 2002:adf:b1db:0:b0:20a:bcb5:6526 with SMTP id
 r27-20020adfb1db000000b0020abcb56526mr27569189wra.305.1651156815183; 
 Thu, 28 Apr 2022 07:40:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/54] target/arm: Use tcg_constant in shift_reg_imm
Date: Thu, 28 Apr 2022 15:39:17 +0100
Message-Id: <20220428143958.2451229-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 537eebbf1da..3de2b27cc7b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4678,11 +4678,7 @@ static void shift_reg_imm(TCGv_i64 dst, TCGv_i64 src, int sf,
     if (shift_i == 0) {
         tcg_gen_mov_i64(dst, src);
     } else {
-        TCGv_i64 shift_const;
-
-        shift_const = tcg_const_i64(shift_i);
-        shift_reg(dst, src, sf, shift_type, shift_const);
-        tcg_temp_free_i64(shift_const);
+        shift_reg(dst, src, sf, shift_type, tcg_constant_i64(shift_i));
     }
 }
 
-- 
2.25.1


