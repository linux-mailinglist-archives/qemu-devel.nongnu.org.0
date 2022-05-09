Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21A51FC45
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:11:23 +0200 (CEST)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2EU-0005P5-DV
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22W-0007Bg-9M
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22U-0001I7-NI
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id i5so19083154wrc.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=utw3LcG1dMmm1L7xgVlIZJE0fwXZzx5RP9DT2it4qMY=;
 b=I8LFVy4UBf/5CFt85x/PlfGgFsQDAgSkpjJYzu5aCnA5ngi7bRI+QXAOM8LKDTwiRG
 fDcdhZnbyGPZz6rBxGPy0+uONdeTkTVJkBsRB5rIjR7GXoEbCrSK4iuXAyKvk/DR7h9m
 ggbCA4RbeUsf1f9t+kWCK+rak1mBn5bTH7UJGRa0Hrg3INKkQ+AXlFKtCxzaVoykdXyr
 Poutc8I1YMEjL9C0XPkkrq56dGvL3shY0EIdj4pGPA6e3vMhg9cwln5mp5lkgm8kfiwu
 pxIq2SgVvblo6mSJ5yQFnUapHtfDKWMVhYo7XPdFV0sw0mHWDHRxnFSCp77kAQ4ivW8C
 BOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utw3LcG1dMmm1L7xgVlIZJE0fwXZzx5RP9DT2it4qMY=;
 b=bqCbKZF1dX/2H78HOYLTw8wbV0FREG1X6a0FamwN0VvQflccT/tI36AwQzgo2nXNSt
 92XSc0jxfMf5XjkgVgRGPcpw6Den9qSTEATMPUYffgciJ7QpUFstg/64QcU6ILHWjf8Q
 zvsygXHFKyGtFQW09pAMy3+lwkkxl1tAnUzu4afvHgdO9Jr7QriAAkk6+3P+Yw48ytSN
 GX79i8vVS0XFweyxnh06raCdSU2uvXGBVPol0dpaEUecGJRu2xeMDAElpPbd6FueKm0u
 VljpUhtVZ44pJXFxlyEe0/2AWluUka6M08M6BQjLPvTbhhXup8aw2zhwwc3lTm3A2W+J
 loGA==
X-Gm-Message-State: AOAM5300FfdDDl/6EUsEWHfbbDHLC4r2KKb5HzDEbvm6A6y13iCztTZr
 udjjJ36ZIa+4OsxYbVIwiRCiXHR1bR8VNQ==
X-Google-Smtp-Source: ABdhPJxwRKncAo0BqRj7yDmkw5wpBs+H3y1ewro5MYAhriKtebgOmNEOxE3BXnejZ2BuFqLAQAzZUA==
X-Received: by 2002:a5d:598e:0:b0:20c:57ef:6083 with SMTP id
 n14-20020a5d598e000000b0020c57ef6083mr13535445wri.457.1652097536728; 
 Mon, 09 May 2022 04:58:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/32] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu
 max
Date: Mon,  9 May 2022 12:58:24 +0100
Message-Id: <20220509115848.3521805-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c17525..9aa2f737c1e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.25.1


