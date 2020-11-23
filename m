Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861F2C04DD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:48:11 +0100 (CET)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAKG-0002R7-JE
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFf-0004Ar-9s
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFd-0002ec-EZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id e7so743964wrv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w7kJtjSln/vkJJqN5ENFGK2r5RrZXgIwV0P5o18qYy4=;
 b=d3Cj6zuzNyF0cXjYfX6OhXOzJYHktk5hW5l0m7qt77+WHoX5RP4fqXsH7e4SgaQPMV
 sbk36o962Amcwz9XTBx2LxUY+nsmcQlXJB51VXpuWtLbx+8a9oUcbWxbGW4sAqk4MqZt
 gAxzCqc5ktC1W/QKeO+0FizFbmOD7niUBcoR0nDkEGXcyo7iiCzZefj60kGf38PPDue8
 FV6Cq6aDVQpBbAvBW16uUuteU7VQIBNfjRmAvOcpf+Ska0JIX3ybhfl+4Rm+y7tYZhiy
 doHTFTFMPcGb73RHTLKTbxII1fetkOXuAJctGdVU1BiHOQpNB8H3Xh7VGy2LYBEiD28v
 2dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7kJtjSln/vkJJqN5ENFGK2r5RrZXgIwV0P5o18qYy4=;
 b=XQmAGoVIc/ZlrKfnGxRGGVS253/WirIFu4qj+5ZfeSOB9CUY2KZut2YzPTRNZ6Nzcw
 ektLf2fi+wL6uuJV//4/Bbx1gSwWm75oWntVwGIChga3EK5v1gyOEgHj4sI7PzFMut8+
 R1Ca3tqAr2ACZXENfpUiwNBLFYd3naYstJmIZ28JdO/TJ2ongZDH1I3EvF2k5T9tvEqn
 escKAcb+A0jDkE/R9oBhmsJtM9fqZpca2C808kCrySqR4BNKdu+LqxbDrCdgRPYL02Gh
 Dh9jgB6xSxsCdLDNWbvuJYSXR44XXuW16paqZFT0eybTYGhFJPz7fVPdsJtliI516CtY
 CTWQ==
X-Gm-Message-State: AOAM533Xj+73/sOno86Anllm4WRSLGp+3S11RswPYpYZ1Kj7cOyYF+nc
 CoJ0Cnj7D85nOQMHMBmz+61Eq2pl1aLicQ==
X-Google-Smtp-Source: ABdhPJyIqPdRWefj7yLqRligwRKijuMcp7Ayosu/6BDl1HO+H9wJd5TguQRcHEK5JGpOBPGE+/RWGA==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr32261151wru.292.1606131799862; 
 Mon, 23 Nov 2020 03:43:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/24] hw/arm: Fix bad print format specifiers
Date: Mon, 23 Nov 2020 11:42:53 +0000
Message-Id: <20201123114315.13372-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: AlexChen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%i" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 5F9FD78B.8000300@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/pxa2xx.c | 2 +-
 hw/arm/spitz.c  | 2 +-
 hw/arm/tosa.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 591776ba887..1a98f3bd5cd 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -675,7 +675,7 @@ static void pxa2xx_ssp_write(void *opaque, hwaddr addr,
         if (value & SSCR0_MOD)
             printf("%s: Attempt to use network mode\n", __func__);
         if (s->enable && SSCR0_DSS(value) < 4)
-            printf("%s: Wrong data size: %i bits\n", __func__,
+            printf("%s: Wrong data size: %u bits\n", __func__,
                             SSCR0_DSS(value));
         if (!(value & SSCR0_SSE)) {
             s->sssr = 0;
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 32bdeacfd36..772662f1494 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -586,7 +586,7 @@ struct SpitzLCDTG {
 static void spitz_bl_update(SpitzLCDTG *s)
 {
     if (s->bl_power && s->bl_intensity)
-        zaurus_printf("LCD Backlight now at %i/63\n", s->bl_intensity);
+        zaurus_printf("LCD Backlight now at %u/63\n", s->bl_intensity);
     else
         zaurus_printf("LCD Backlight now off\n");
 }
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index fe88ed89fee..66b244aeffd 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -150,7 +150,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
 
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    fprintf(stderr, "TG: %u %02x\n", value >> 5, value & 0x1f);
     return 0;
 }
 
-- 
2.20.1


