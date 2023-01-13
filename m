Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E96669E32
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIy-0003TD-PU; Fri, 13 Jan 2023 10:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIY-0003Bu-8F
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIU-0006XF-2r
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so17056143wrq.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tT1oW9k+p9Iri79Qb+THu5Qi+IZcPWQrYF+smSoELo=;
 b=y0tJcvUB4Q56e9czjVYF43mKmQf1xMNOjmmAc5cHGyfGLryb0XPNYysKDSCJ8Jh99X
 p5cDEsecnpcGOzWbAJDvHBdSn6kjMWizcMsnf+tjcN4tUCC+SY3VegBCLOkdt9WORE/B
 IYzuwffGKnQIFfPvA7EbfNbes67MkM9W4m1iuttCZ05oWxyd2Tw0fb2OO8VpyG9ZoqE0
 EdsA7hy3OU/+84cAXnCxM4CuBAgRJ4v3+5qwQ9plV5sVxxgDiB5QDxJ4HF5Eoh6U0x9b
 Cer84KvsVRPkDDVjqQE4N6H0ePNpOTjrTk8EaF8F4lHmFb8TTkY9wYbduQLbxtxqyo7G
 UR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tT1oW9k+p9Iri79Qb+THu5Qi+IZcPWQrYF+smSoELo=;
 b=uZDDKwIhIov/lG7gXGTUKQg2vd453pIIrUEEoiqLwrnbSzHR6L6F+z+evhXiXUeQ5p
 USgnlkGkCAfysg1/5k6RgwRGtjC1+taP/ly/hKC83iHUo5Q9GcZ2RgcJxlPGZHAqBODj
 nsH0WsMyGkRWUiOznlGLy026Cn9aUVLtehpYIT84S+7N6MVwfnSLEvFrdjAHb4PE6z9j
 dX7qCzIDvVrvhBMozkd6dL62ttberlIms2kna2Phh7sIZZRrycIe4lQEqHTFdhuFIIZG
 KclE886dJq5TUidZpL373D6TZQtqaYViIqEHjgW2LoZRFHMr9kJojy2wV9MhEFgGNJeR
 FFbA==
X-Gm-Message-State: AFqh2koQT5dnqUKcrzScvG0MYDPiD/ReCjCUCX/kuiIAJSyOCyA+5ozL
 m1p+wG+nkMeQruJztl/V13SHvdb1TUn8mPTs
X-Google-Smtp-Source: AMrXdXvETo2vyBaUmpeMHtVO5qKoF1pI5d9wT4i29uVOV35tdSLgBHMwZkBDZPlNpnNC3Bmb0SeUtw==
X-Received: by 2002:adf:dd82:0:b0:2bd:bd54:25 with SMTP id
 x2-20020adfdd82000000b002bdbd540025mr9186211wrl.29.1673624928406; 
 Fri, 13 Jan 2023 07:48:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adffcc6000000b002bbdcd15e44sm15486399wrs.37.2023.01.13.07.48.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 40/46] hw/pci-host/bonito: Convert to 3-phase reset
Date: Fri, 13 Jan 2023 16:45:26 +0100
Message-Id: <20230113154532.49979-41-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Convert the TYPE_PCI_BONITO class to use 3-phase reset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230105130710.49264-2-philmd@linaro.org>
---
 hw/pci-host/bonito.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index f04f3ad668..450eb29ec0 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -47,7 +47,6 @@
 #include "hw/mips/mips.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
@@ -593,9 +592,9 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
     }
 }
 
-static void bonito_reset(void *opaque)
+static void bonito_reset_hold(Object *obj)
 {
-    PCIBonitoState *s = opaque;
+    PCIBonitoState *s = PCI_BONITO(obj);
     uint32_t val = 0;
 
     /* set the default value of north bridge registers */
@@ -739,8 +738,6 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
 
     pci_set_byte(dev->config + PCI_MIN_GNT, 0x3c);
     pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
-
-    qemu_register_reset(bonito_reset, s);
 }
 
 PCIBus *bonito_init(qemu_irq *pic)
@@ -770,7 +767,9 @@ static void bonito_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.hold = bonito_reset_hold;
     k->realize = bonito_realize;
     k->vendor_id = 0xdf53;
     k->device_id = 0x00d5;
-- 
2.38.1


