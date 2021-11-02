Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D37442C53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:15:49 +0100 (CET)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrlc-0007Q9-Du
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW5-0007dG-VH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:45 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:42764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW4-0006s9-5U
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:45 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bm28so4083040qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GgIC/L4O3idafA92xVJBzxSWcbdJlwK/CFRWNxE3FH0=;
 b=FEqC+Re8yKwgdSYWXwuTtz9g4ZrqKR8Xcz/RJooXCLwbHJeTjn9E9YOtNb4+JJTG5Z
 9/rd5iv9JdBvc/RkP4/NM7KA6g9ClNXCGSyyl6cp05bX8nb6Qt+GXIzlxRN6tZfSogka
 aA0JloMinPQ09oRSKgFEU8oNRQFItue5NrLotoSDO0TPXqLjWvVfKIB+XomdA1/8VfRG
 mrt1c9/dvZ/HkivnWEfyGySGQce/jE/ggFe2bj+V870tbhBlhNhiioyMHF5IhCblMkkK
 RlyrP83FvS18surWBv/0I0elyykyLO4Ax9IsGxsvrqeV00OvNn+IPXgjoPy3jy/VLPTC
 p9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GgIC/L4O3idafA92xVJBzxSWcbdJlwK/CFRWNxE3FH0=;
 b=1APIcmC1m+KXr09q2GoLPPOTluvIM5/RHd9yhhaJYS9B89UXTebIDPUdqJT5c7hGaE
 +m5Gp/TMitE6+Wof9CdT2g2v2Tejg2mNUAwZPYbXxGWQkWXztNTZEl0RMe0L2AM71VOA
 Vh7OGVCJiOhrtgicwx5EVE6IarnCn37L7rllKU8L8WQ6lKFe/4WXMl0MRVEYLpaFwvVb
 vUUFQiND/cUQ7uHiEr/KYFUqC1m+LI4A0FhdZbKSB2uLEDVU98k84NDg1sqCGb0PtnDd
 0YyWyeKjmMXZ9lr+zUUqYoe5UeWbl0njNsh8MN/5TLm5VyaIan/sjTuD7sJYaj1IeNzo
 pqhw==
X-Gm-Message-State: AOAM531ScmqX6uWav3kDlBlu2UBtBZowR+LtxO/G8OSO/gzmt60KAgnG
 wFWsK1t+qihQiAVy1xoJxfUNtp63kWrInA==
X-Google-Smtp-Source: ABdhPJxRdvj75Xec8CegNNxrFNyyuB03ShyBqXN96PafnrnvZOVVMwk5oVvzBjh18TJAboPDUNfCtg==
X-Received: by 2002:a05:620a:98e:: with SMTP id
 x14mr25381468qkx.457.1635850783324; 
 Tue, 02 Nov 2021 03:59:43 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] target/arm: Use tcg_constant_i32() in gen_rev16()
Date: Tue,  2 Nov 2021 06:59:33 -0400
Message-Id: <20211102105934.214596-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since the mask is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52ba562c96..98f5925928 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -388,13 +388,12 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-    TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
+    TCGv_i32 mask = tcg_constant_i32(0x00ff00ff);
     tcg_gen_shri_i32(tmp, var, 8);
     tcg_gen_and_i32(tmp, tmp, mask);
     tcg_gen_and_i32(var, var, mask);
     tcg_gen_shli_i32(var, var, 8);
     tcg_gen_or_i32(dest, var, tmp);
-    tcg_temp_free_i32(mask);
     tcg_temp_free_i32(tmp);
 }
 
-- 
2.25.1


