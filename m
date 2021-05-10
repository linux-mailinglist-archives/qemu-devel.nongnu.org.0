Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE2379784
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:17:32 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBPH-0002UZ-Da
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBH7-0000eb-6x
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGv-0004z2-Kr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso11777237wmo.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPiCr7uH0qLtwDI+9ztTOX0+Iqb2mkfB6dk1TyXG9m0=;
 b=Llstzy4hz+XPmQglsXp8FkpP3SeHzPdjnGiVeOq/SmM8UZCUceRTFAC68VGbzOLG9S
 kzknCIjehHiWSrPlLaiaJNMrc2jYVv10e7ULmsLqqc0TKJ30tbBQkyTOLss+4JQvXYoA
 6OAIUv6n59galPeby0+21y+IRapEC1j+SNaN0Dt4bilzCKYQSe2VgEadpQqM+Wl+YitL
 r7szuSFT9tuQLBycq2tdi+qU2lgTXuvDkQol6VLXkvIVfa3CfdPxCrwApXobg/Kuu3bE
 Jqk/tZIpiU09XeTc//radvDZp1sCtCmTl7SXQhz9vjr8wBwoXPdsTdn4jwIfAV5GjVNN
 qCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPiCr7uH0qLtwDI+9ztTOX0+Iqb2mkfB6dk1TyXG9m0=;
 b=h0HveUi0sYbY7ia8xdreqR8EcZvx8u0Qv8ySai7I8XorwuFA5hqcqF8a6+t0ukPFgP
 eKCSY6x1GTbbRaVzNeA4biYgETlCwTKr8nP77+tWVXVRaU+TYjAR97p4AvoZOpufWXa7
 UfBj4adyVxrT7gutnW4l+i0Gw95M6EVXmDgG9INh94IpxFoaCbEFCpubGFEb1IjmZjfL
 nmHSufZGlFLNH9BXMXwzLlX4J3bv2IGfcyfljSogwap1FYjl1kJvrWloLArMjic9UzRq
 rYhNnmgyIjrbF95VV1RWfhlVXhhr/m4rrjmK2uQVqLPdrKKVnfYqoMIc9soLbaay3X/z
 DeuA==
X-Gm-Message-State: AOAM533qHl2dMabWqpt6dQ1hec+T154h4dJVMlsQLwU6OMBgWakuCaPW
 hoFT3Q2mOaeT9/uNMgZq3mJsBQ==
X-Google-Smtp-Source: ABdhPJyilvEiWTQvYX9DpuEclE2vFDgYUGwGA/UUElqXilzAsWGCABsJwSsz8qUSLGyAt2Elzh47Ag==
X-Received: by 2002:a7b:c092:: with SMTP id r18mr24640288wmh.51.1620673732103; 
 Mon, 10 May 2021 12:08:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/arm/armsse: Convert armsse_realize() to use ERRP_GUARD
Date: Mon, 10 May 2021 20:08:42 +0100
Message-Id: <20210510190844.17799-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert armsse_realize() to use ERRP_GUARD(), following
the rules in include/qapi/error.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We'll be adding a new error check in the next patch, so
do this first to avoid adding more uses of legacy
error_propagate().
---
 hw/arm/armsse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 1729f09c7cb..be5aa1f113a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -913,7 +913,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     const ARMSSEDeviceInfo *devinfo;
     int i;
     MemoryRegion *mr;
-    Error *err = NULL;
     SysBusDevice *sbd_apb_ppc0;
     SysBusDevice *sbd_secctl;
     DeviceState *dev_apb_ppc0;
@@ -922,6 +921,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     DeviceState *dev_splitter;
     uint32_t addr_width_max;
 
+    ERRP_GUARD();
+
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
         return;
@@ -1151,10 +1152,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         uint32_t sram_bank_size = 1 << s->sram_addr_width;
 
         memory_region_init_ram(&s->sram[i], NULL, ramname,
-                               sram_bank_size, &err);
+                               sram_bank_size, errp);
         g_free(ramname);
-        if (err) {
-            error_propagate(errp, err);
+        if (*errp) {
             return;
         }
         object_property_set_link(OBJECT(&s->mpc[i]), "downstream",
-- 
2.20.1


