Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7D5B88A7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:54:06 +0200 (CEST)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRu1-00039s-4k
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwS-0008W1-N9
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwJ-0008VH-3w
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so2144830wmr.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=//e/ZN3ckKFpSJhex3jLrOtW1Ky/TB8tcKb8eFkaCDI=;
 b=fcXudYxfvCIg1xlg+rJyFOQklZezlXCOCfKu4sTOO9j2uxBpi9MdZxRD8bHWd5boBo
 1JAq/CsbKLlOy/Ri657S75eX1ClCVNU1fJ7SI2dfUtqahjyCBd/wAyRJmLesvef9oO/8
 INAeKrqSwLEcYIkwiV+nKO3ch19trhBN0ai/dc5DTaGBtgFkr7mmjUAg2GaNyt2nd7cH
 uxVC9lCh6w2AJTJk/W2x2yvRRLuVG94RcmYo6Tx03n+pbdpw1mDyPv/xYXcngAbsxSGR
 yitPlaWCQGlw0cPVDIFXHUt4utu+7W3eWuhSPVJMhQHi9VKhXLUEp21n1e0nXiDsICv/
 cnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=//e/ZN3ckKFpSJhex3jLrOtW1Ky/TB8tcKb8eFkaCDI=;
 b=sf1G5AXFDVKlSq+ui2tnbfgUwZXqtwGXkK+EyYjTId0IxaRTlnKcVourYPAr1/PSs/
 zin35hXo/LjXjQABpjF8ITRCL9kKxWkzW8YhAv7o+HhTL8vlGT0w9sf5x7uBPS/ivPMR
 ng1cFfyWQnQCxhrnpUcuS9krQAce1lTnSskY4pQooM9Wx0/pyDphO76cfdJuE9Xu1QZz
 fEs+Ae/C8UMQ7vNZIddIV8YvPGpBhEMSirT6KURIv3s6mqipQI/014igYH1bQQOdwoc4
 2HKvCKnuauHHJ4RJLaym0h2Wa3xg8GQH92ApxChbY32ZCrKtfjs2u0CF5BDiGb0CNLXR
 aFUA==
X-Gm-Message-State: ACgBeo0s57fE7mbMGlsJv/1dF05N5IM5mrSFzmmM4KI/pp71lGcEZhbZ
 hphXRqrXLXhOnBLCfotKGZ8glnFHMR+sAYCx
X-Google-Smtp-Source: AA6agR5+drzOrmMRczHyXW5B5+Tjlf3So2uR+S3o0au21GhfbstRFngCGEsT+qUzZ3Eq9T06XXe6qg==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr2823677wmb.174.1663156341610; 
 Wed, 14 Sep 2022 04:52:21 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Enrik Berkhan <Enrik.Berkhan@inka.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/20] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Date: Wed, 14 Sep 2022 12:51:59 +0100
Message-Id: <20220914115217.117532-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Enrik Berkhan <Enrik.Berkhan@inka.de>

In more recent Raspbian OS Linux kernels, the fb driver gives up
immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
displays are reported.

This change simply always reports one display. It makes bcm2835_fb work
again with these more recent kernels.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Message-Id: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e94e951057..890ae7bae5 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
-- 
2.34.1


