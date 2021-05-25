Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63286390499
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:06:16 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYdL-0005OK-C8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYas-0001qY-Nu
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYan-00043R-2W
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id i17so32597093wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0oVBbFuDk2xIozXjg4onxzNbqyPjQF2tetw2XbwP1Qg=;
 b=CcBid34xMPyZe/I1FX9odRoTVDRPw61Jhs+6x0MJoKqoown3BzTN8vrvroi8fXG5Op
 4a3Hs75vpGtKQOJVDX9YY5rwsSFlSc+rgb05h3pvXmZywlSLmmhOw1A7TUhGHGNn+C4H
 FuYX70oKcme77WcihmVll5jwyjoIj5iEbOVrK9cz6VkxR7I4CWIW2aG8q6sBUI0WooBj
 MqKwzXJEPGze1xU60S0NB6Mk0y0TNMOTjA4G1iVABN32g0X0N0gPcwoJ2teTSdrAJj2U
 sP3beX1zJtIH6w1VfNk2L3HyKoUHeA1+p6N2Ys1yaOzc3ulHAcuMuotIkZPduLre5vhv
 PntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oVBbFuDk2xIozXjg4onxzNbqyPjQF2tetw2XbwP1Qg=;
 b=EYj67/Hxqd4v5Am6v1+MbFzNPJxiZPokM1sddcDn9uyx6MA/PaLXFcO628hANVk9DH
 CAhuzKeADa7CYzVhxjAvsXJQlnvf4dFZpt+pWXshwb4ZQ2vqSD5F8TyfGcT/PZs+e0O8
 mE+gcqrCtWAKdh+zY8MYClWOoMCpkVUrTZc6YntsuQ3+4bAhSVMFG5O1/hoix9PkReik
 uovTTQoVdWHq1GG/rZmhydzAhnFDtPJsiTVucWHKg6EZsvqcuDzgehAKyKqA7h4YL+kf
 AVt50DJ+EZpYcD8bNKhOU+W9/IW4t6DaIk+j5eOuV8h/vVK7dQrMSLcnDj9R6pELlKxP
 hjmg==
X-Gm-Message-State: AOAM532zjcT2pQLkOxhZa32C5dnOe0UmK85i9H5CbdlbDoOkIKTCeWMs
 W6kO8t0Pq3NOFL1Uu5XK+KdKbHcBZ1N0XHNe
X-Google-Smtp-Source: ABdhPJxHn+VLC/QrZ9ubdiGWjo8fXfM9QHDaA0uFo0fHiuxeu4bTRT9h38f92HTfMcNei+mAgQSZ9w==
X-Received: by 2002:a5d:6e03:: with SMTP id h3mr16296531wrz.138.1621955015604; 
 Tue, 25 May 2021 08:03:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 006/114] hw/arm/armsse: Convert armsse_realize() to use
 ERRP_GUARD
Date: Tue, 25 May 2021 16:01:36 +0100
Message-Id: <20210525150324.32370-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Convert armsse_realize() to use ERRP_GUARD(), following
the rules in include/qapi/error.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-5-peter.maydell@linaro.org
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


