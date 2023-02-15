Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA794697AB5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFyB-0003Wm-SI; Wed, 15 Feb 2023 06:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxr-0002zg-4i
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxn-0003jO-4G
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso1356570wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=FDEpq891SJJTD33BLm7+mPU4j83Y1FTHm5FhH7xYFEH7arPmmpEg2tfIIdnqE5jtEX
 gpioEJ+w9T5DP8ctbrd1KMbkJqRP6IISr1hxk8Z0VlfkEliKEx1paalLcKgBB9o0IF82
 ieSpIDvXXIch9bkTOIFiWm/XF1LD2bDGkfOLl4smBHJqQziyXgpINeGPiRQfhd1pVb2R
 H9b9UXJoOciikZGcEaCIK8d0fyJN7YFXphBKWvHLHXAw96wVbx1A+mgHaTJe+XtWYpC7
 aO9rBVWpNgnIryiaTsW95oKYoqmcafT0Jd8cMTEEzmvdJDt77n1NkxoZ504TPKdl7P/L
 OKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=kW4u0AqCpk9OV1tzq9v8Mq4Y+QcokrvK/w+wPD+fGv53gKOtsr8SAIz0zb4L0xGmym
 63V0Xp0QdC8OCSMPyvVP41kG05Yo1UUwyzYYseMQLAxOSYLt9wTMX6zNjUtR/ZSODQYr
 0d+Jm/xwr7HzQUgLIRCW+HXC1wNCFGo2txJZmzN24bw9RsUbiH/HlBiM9qaJRQOpfeGd
 SPDd3fDTyX/D4rH3HI2kImAAKRaUXXQew2/OHUq0zuJMou92WuRN/7qLhVC4K4a+A1Nz
 7lNJeGlX5d6G1J7cZdtgd82b1cQy3svn8s7E51UxSugLNpSLTp3X/aHN7KMyuLF4oz1Z
 qbVw==
X-Gm-Message-State: AO0yUKVkHQRMtI7BDHnqis7mVFNU61V63v0t3mwbsdyatTIi5PEQvV2F
 5RQZS8Kv/T1Vb2UU/4hxSzf/IEw7wDHBU/6x
X-Google-Smtp-Source: AK7set+89475AUjyMvfwpJ3QkpofDQEcycNmhCK1jIbrBW8Tc0Ge/6nsztUCB/z5FhLR6I+ateiD+g==
X-Received: by 2002:a05:600c:8505:b0:3e0:185:44af with SMTP id
 gw5-20020a05600c850500b003e0018544afmr1355411wmb.20.1676460517480; 
 Wed, 15 Feb 2023 03:28:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c451300b003e1f319b87bsm2038630wmo.24.2023.02.15.03.28.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
Date: Wed, 15 Feb 2023 12:27:09 +0100
Message-Id: <20230215112712.23110-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

The function is only used inside ide/pci.c, so doesn't need to be exported.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/pci.c         | 6 ++++++
 include/hw/ide/pci.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 2ddcb49b27..fc9224bbc9 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static IDEState *bmdma_active_if(BMDMAState *bmdma)
+{
+    assert(bmdma->bus->retry_unit != (uint8_t)-1);
+    return bmdma->bus->ifs + bmdma->bus->retry_unit;
+}
+
 static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
                             BlockCompletionFunc *dma_cb)
 {
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 2a6284acac..7b5e3f6e1c 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -55,12 +55,6 @@ struct PCIIDEState {
     MemoryRegion data_bar[2];
 };
 
-static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
-{
-    assert(bmdma->bus->retry_unit != (uint8_t)-1);
-    return bmdma->bus->ifs + bmdma->bus->retry_unit;
-}
-
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
-- 
2.38.1


