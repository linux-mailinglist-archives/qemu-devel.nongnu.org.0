Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495036F3C1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:37:07 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI5a-0007jS-BM
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlf-0003bC-Ga
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlG-0007ff-B6
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:31 -0400
Received: by mail-pf1-x431.google.com with SMTP id a12so5049194pfc.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25DSlpLulNmBUh0lJNnMADQKfneNuqLva9Dfea5rlQI=;
 b=fnvHVcuULEkD+hRr7GmLjyTtj/cVxGkpNJMYcPhb64/WVP5S4G+dhJ3XhIrOEcfn7S
 vqRjp3X0Q9xWn7Q+LWi5PnzZTJtqCuo/oIVc2xKrBYX+lRlmATHh2+CiKgtez2Va/9xA
 7Pl9oOKSOLUxmT5o04IxqAKNTldOLFmQqdAOiMTElaZdcKPToaMEfWnKFLHaJFfCBdLe
 DAghAaJcjCGuDVQEBBcR42y9iC346wmAfefqdMT8a70Po9HqOi7EHBdwk5anfYSl8zP7
 RatDAXXHciTrZQA+mWq5EYD97tIQlx4NFP7MqLyrX368C2rIqgj4Y/GuBcs492yDC0bH
 4HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25DSlpLulNmBUh0lJNnMADQKfneNuqLva9Dfea5rlQI=;
 b=TPMOg2WUu1G4kerKHe6kHa+Fpn0PsUo7+w2Eod3YQ60w5qCPl1sy5aJwtknXq3nOto
 S0eDdryfjPlmYHn0x4lazZ33nFbkce23nT8osV18Pcv2FiUfQsIiBYywpSm+ATg/cTwF
 b+Nh8SaFB+8+b7H2ROc/gm53yPwvPQERWYHtC87/G3ObZly8eHj+FxzqKDHRGpjtEUsA
 6tTypEyI3pRV71dhUWBLL9kYHWC7yLiO8LEXO7oZtiMwqLhnzEqB7FhSKNVysR+VxuRJ
 eUOi6y0rvNguW4x4AIvI4iP2KbniEdJwcEgaqSj2VWI0+UF7/Sn8t+OjMXIM1S8mGVVo
 pZWg==
X-Gm-Message-State: AOAM533jlD2upgy0nFbozc0T7rBbast29E7H2kQAzL8uoZl1hS3OgcVl
 7AZjRxzr+zwzW463TnSRs0BgMeLjQHcqxA==
X-Google-Smtp-Source: ABdhPJx/yhK63GYZKZ8SoQMkCjylkRDIRZt/8axl0vZa61Sz2O/2FjItGiVjoRYMGYYUq7xbs3vf3Q==
X-Received: by 2002:a63:9a41:: with SMTP id e1mr2355146pgo.390.1619745365075; 
 Thu, 29 Apr 2021 18:16:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] target/ppc: Implement prefixed integer store
 instructions
Date: Thu, 29 Apr 2021 18:15:43 -0700
Message-Id: <20210430011543.1017113-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn64.decode | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 4198e5c8f3..7a71a7a3bb 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -44,6 +44,18 @@ LWA             000001 00 0--.-- .................. \
 LD              000001 00 0--.-- .................. \
                 111001 ..... ..... ................     @PLS_D
 
+### Fixed-Point Store Instructions
+
+STW             000001 10 0--.-- .................. \
+                100100 ..... ..... ................     @PLS_D
+STB             000001 10 0--.-- .................. \
+                100110 ..... ..... ................     @PLS_D
+STH             000001 10 0--.-- .................. \
+                101100 ..... ..... ................     @PLS_D
+
+STD             000001 00 0--.-- .................. \
+                111101 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            000001 10 0--.-- ..................     \
-- 
2.25.1


