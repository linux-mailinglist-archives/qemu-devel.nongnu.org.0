Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4A4572AF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:18:55 +0100 (CET)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6bH-0003G3-1t
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OZ-0005T8-L5
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:48 -0500
Received: from [2a00:1450:4864:20::433] (port=35602
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OX-0004Gr-QN
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id i5so19027462wrb.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3QFXn/rxzfGJ1Zl+l855GTQvmJfR4mGMCcIgpO2hOs=;
 b=bR1McaU3br+AX2biMEYG/LnOlzlNb4QXht9gfQDvOAPPlpnYZXoxZCcH9zDYPffR/4
 hvVs7YOukeErFef9lN12+jY2CPxOBIzH9qTUAdQGM53TT1ZseszmZ0uV4zvqpqDYrzvF
 PR9rukwmrFQdrEi8GEHloZe9iePQKA/5FgHDH8XH2cHJjx76lop9lwqOkcvopM+ahZwb
 1WPyGaWVumqQGxhc5Ej3mKf1ze6J8RqBCDV+bp7c3Ja2rpVg1YvT7vBA2i1rnD2NCOkk
 wjHa+ifGwOG5MATN9aZrRdKRVMj0djZCiNxYsiGyOgRYFIla8G6HvODJjD6bDDg3twxl
 bjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3QFXn/rxzfGJ1Zl+l855GTQvmJfR4mGMCcIgpO2hOs=;
 b=ZIV82vrYXBjXcEC1yGUPNQHe+ZLeBuJXdf+KDuC2nenU3G1vdP1CqZCWrXqyHY7Pqd
 TN7rBvuEObK1+srkyOmIyDlsw6zRc2dj8VCBZac7T05uqMP1xo+DTHUitI00z0rkgpMC
 2YfjmDSmzoZmR3n0PW/CFiAkZ4bnXb271FEj7EBh/RDLbiqRei1Zs24VNpYQPa7yv2Qf
 ptlK3x8T+BCGcuU1xL6p49AzUKDAB7+81z7ltDCFV188uSLw4o4YZXgb1s4vE7UPUGFP
 CoJoWR+6utZ2FRymu+FHixwNoi0XmMvJI9NtkUzov2KoJPp8AH7jxvMBDs9uiYydTSnS
 IvBQ==
X-Gm-Message-State: AOAM531F+7mxwTCjCsuyjkpgAijOKTjz48vl+YebUdA/l+RBO2L8kX0v
 /N3jZcq76so9W6LZfclAE+13BH6uDkloXbu83gY=
X-Google-Smtp-Source: ABdhPJwIhPnT6EBM0aPlK2KWIutkLeVLCIQY1c5eA0m64zD3xWa7bCIA//N9Y5TMmr/OGcdMq4a1og==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr8431190wrw.283.1637337944483; 
 Fri, 19 Nov 2021 08:05:44 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/35] target/ppc: Use FloatRoundMode in do_fri
Date: Fri, 19 Nov 2021 17:04:42 +0100
Message-Id: <20211119160502.17432-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the proper type for the enumeration.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9439dd7f21..535002741a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -594,7 +594,7 @@ FPU_FCFI(fcfidu, uint64_to_float64, 0)
 FPU_FCFI(fcfidus, uint64_to_float32, 1)
 
 static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
-                       int rounding_mode)
+                       FloatRoundMode rounding_mode)
 {
     CPU_DoubleU farg;
     FloatRoundMode old_rounding_mode = get_float_rounding_mode(&env->fp_status);
-- 
2.25.1


