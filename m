Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C073717C0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:21:09 +0200 (CEST)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaNg-0005Pm-Fq
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLa-0003Tb-9F
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLW-0000wr-TH
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:57 -0400
Received: by mail-wm1-x329.google.com with SMTP id i128so1575224wma.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oi4njrzLK0pfsT3o6sZlJ4iKa/xeGzHyeEr0ump21y8=;
 b=K96zJOQ+OIxJdG3Zh3umby8c2BcJGCalFC9QMO9fXPVgKWr75GyDDJcmvJ6JgplS8V
 kZl/GK5QULgyTecuu8PgMpOWlPIKcFf2XA9BDthbFAlk1k9rfeiWnJpZ36bYM+3mXDlz
 oaa8zJUFWlGTgg3cPbdu5VztJmOhb4F7DN1DnNNRzgQIcF4/JiYZA/qqwp0EDy6tyjmu
 l/8tDRF+l1Wr7wGlNfE1Eb+Dj1SzigRcPzCUr3l18ryvhI0LX+UoOIX1r5P+E1+mM9fy
 9CGUnxjeCFUpBuk3ISlKvSmBAcp6tUeQtz090+l+9wZMZSnOC4W2/k37BLm3EMaBfatD
 0/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oi4njrzLK0pfsT3o6sZlJ4iKa/xeGzHyeEr0ump21y8=;
 b=FK5lBPp3UBTklqguqFiub8TqMu+86Pd9HsTaWR22edRtBU8KdojLTHVYdRlyKeuKRM
 n06DCCJua/kv2GjGv9+F62ZBd6b3hUgjIgyKagaN8V+17g/4kvIM64WBzbMQgYrJDc6c
 CZLcXh474ql+Js2tCPx/ezRaxiDOZlT17SoJx0Bj2C/FhsCRo6Uddpl9Jx9Yx4ZZy5nR
 QQPMIbu/IdLvjWJNR3jRCYWKXkmG+NH2cnpbFaLA9j7SO0yLk7trApct92AFiciIIydr
 H0wb9XRQXwqz6IOp5ufB7jjFNvJ0x7g70tvwkaKMDpln3qLj5Md9oszDBT2tIoLuq9vS
 kOjg==
X-Gm-Message-State: AOAM532H0vjLEYju901H83RzMUbrHhl8eeZpv25TAvRAFrs7wIN023Fc
 wRjoC4K8Wr0uMc7aFDij/WbzylR0CQuG5Q==
X-Google-Smtp-Source: ABdhPJyIyiDE9+ASHgw0OY94CzL2jLqtwKW2HKRNcC9/8krM8EgBO0PxjhHCRSvBNN1VfPFR1LymBQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr22297056wmi.36.1620055133409; 
 Mon, 03 May 2021 08:18:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u5sm11778254wrt.38.2021.05.03.08.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:18:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/ppc/pnv_psi: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Mon,  3 May 2021 16:18:49 +0100
Message-Id: <20210503151849.8766-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503151849.8766-1-peter.maydell@linaro.org>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pnv_psi.c code uses device_legacy_reset() for two purposes:
 * to reset itself from its qemu_register_reset() handler
 * to reset a XiveSource object it has

Neither it nor the XiveSource have any qbuses, so the new
device_cold_reset() function (which resets both the device and its
child buses) is equivalent here to device_legacy_reset() and we can
just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/pnv_psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 3e868c8c8da..292b373f93f 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -466,7 +466,7 @@ static void pnv_psi_reset(DeviceState *dev)
 
 static void pnv_psi_reset_handler(void *dev)
 {
-    device_legacy_reset(DEVICE(dev));
+    device_cold_reset(DEVICE(dev));
 }
 
 static void pnv_psi_realize(DeviceState *dev, Error **errp)
@@ -710,7 +710,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
         break;
     case PSIHB9_INTERRUPT_CONTROL:
         if (val & PSIHB9_IRQ_RESET) {
-            device_legacy_reset(DEVICE(&psi9->source));
+            device_cold_reset(DEVICE(&psi9->source));
         }
         psi->regs[reg] = val;
         break;
-- 
2.20.1


