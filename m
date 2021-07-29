Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74603DA2AF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:59:18 +0200 (CEST)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94h3-00082g-Vy
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941f-0001ac-8S
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941A-0001W6-9O
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m12so1651011wru.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1nPPw7sf6+ACZS1KSJaNNWd+RZu2j3hEbtkOKyLj6Kw=;
 b=eo5Xakfmv7I1HlifNM/udWOgc6jt+ZL52gj3uUt84STRxjLsqBC83kcqq2qRwdpZaQ
 +/PObFMo41KBDHpcch5MLaiGvv7S5Z/Jy9pv3OD2+5wRIPUKYk3D9wX2iiqoKXqy79xt
 26lxIE8Ni1Vn9BrX6XzxTxDdZQ4HDbagHF8Zy+hfMCOzl7px4h1jlvWMgoDMl+crjdu0
 hCr0HCWA7cO0MLupQ61o8jH5vE4F7pqJa2D2NWEcwjIjaIVjlp+mk4n+qhYFhzTRgFUX
 0lY0cvZQF1XhnlkyzzLEWUtaPJVNoRKal05x+PGFnM/GVBox/iqkrk//o9guC5eihDPv
 vuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1nPPw7sf6+ACZS1KSJaNNWd+RZu2j3hEbtkOKyLj6Kw=;
 b=OqdiS7MDgwJfmpzBh8+eilBzqSgSAq5OdBGJWGpF2UfeMns8TTUor2nLW+vFRzJMeD
 ll5JgxY/RZIBE1bxa0lBrFvCT2PGr6y+3A0ZpyRuBmTokfwOtsfpEiydUaSCtZ9MCDMX
 XF6t1PJVXTqtHCzRaszcoHzNvg1XORikb20/l+IAcSt1Sr4Vd0dGT/Rn/7PC6OW0XDRF
 l1bBUUcB0bhZZsjTMtdDveXAhleDFBwbOPEc4pOhp4GAM6Nj9WNg7vxCp5HXVzVD5T5V
 VkuoITGibCwsRxcFlDKkx96vQsE161B54d6zF9x0xQK3oxybS8zrc8q3X9MG58X0NB1r
 sSJg==
X-Gm-Message-State: AOAM532sHrfuUzh1QyzImd2h8cm2/3wKcTMw9UrLs7KxpdExTPSIsuvH
 cJP6cczr+SPv9qtTa5UfnVS0og==
X-Google-Smtp-Source: ABdhPJwpRMycSu+uqxFm+tdQ5QMu/DncPMrjyANSA5GlxOr9K7m/HDmZBS4MkuJa3Gegs9B/p7INuw==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr4118152wru.427.1627557359030; 
 Thu, 29 Jul 2021 04:15:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 53/53] target/arm: Enable MVE in Cortex-M55
Date: Thu, 29 Jul 2021 12:15:12 +0100
Message-Id: <20210729111512.16541-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now have a complete MVE emulation, so we can enable it in our
Cortex-M55 model by setting the ID registers to match those of a
Cortex-M55 with full MVE support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu_tcg.c          | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 144dc491d95..89310e4842f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -87,6 +87,7 @@ for the following architecture extensions:
 - LOB (Low Overhead loops and Branch future)
 - M (Main Extension)
 - MPU (Memory Protection Unit Extension)
+- MVE (M-Profile Vector Extension)
 - PXN (Privileged Execute Never)
 - RAS (Reliability, Serviceability and Availability): "minimum RAS Extension" only
 - S (Security Extension)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436a..33cc75af57d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -654,12 +654,9 @@ static void cortex_m55_initfn(Object *obj)
     cpu->revidr = 0;
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
-    /*
-     * These are the MVFR* values for the FPU, no MVE configuration;
-     * we will update them later when we implement MVE
-     */
+    /* These are the MVFR* values for the FPU + full MVE configuration */
     cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr1 = 0x12100211;
     cpu->isar.mvfr2 = 0x00000040;
     cpu->isar.id_pfr0 = 0x20000030;
     cpu->isar.id_pfr1 = 0x00000230;
-- 
2.20.1


