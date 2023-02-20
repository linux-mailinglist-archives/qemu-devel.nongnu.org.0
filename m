Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E069C78E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:18:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2IW-0001aS-Sg; Mon, 20 Feb 2023 04:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gt-0007AR-Vp
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gs-0003t0-6p
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id b10so1930649wrx.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=iMKuljpnZBJ7a/EDsmZR4NisF1RKjfx4bI6aAVBclwO6/ZEGdJ2XasXkRfdhlE3Tmi
 TWWM4iXx96COyPQZLyTeMeVj5R35MlqIgPGc3S68NtjLqUrEiCk0/A5af9w+51UWlHwl
 jO45PJK99CbH5QdiMz3GDKxHXMlyFOg+hzK6rk+O3FOlOR3hLbz3h6SX0oh1aygo8HE7
 cLhFpqSypDd8KPG38NXtCtvm5fIJ2eOqcRC8BLltwCHokiaTaqH5cMxPLTtJqWEYXeIN
 Vf1MRk57fSsr5wxDGKPwJc6/6pjM+TfxrPx05v+P/rg5PoxhQMOG5/73ryeOmze3gXG7
 s2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=f/xq8+WIaWZQZW4DXFWiXTNgrboJCtThn7kVb1peZTW4a/RpBpk0lxgt8hbWbMHfK8
 7SUAtU92pFhsgEEWrvrFXQNH7JTAim0NqSJV8Ny4/XtS0omYARltIVyK8jftckpBQeIf
 45KeinHP9V/BflFoMf7b2LjuP7FA4pvCI8gjULwhDm23qBAV+qf6WchFQEnoT+bSYbSt
 kaK1pzcOXxaPOBCB+yHo3bhRQojV2Irh7idZxJh25iX37aKiW4oMxuhND+iZDYFPOISZ
 fws9ZrC9WNp/imgd3CUS+S9fcreIyrF90o/jOizwqDxsqFEuSRs4ZKzdjq1HfKJ/0TEY
 J1XA==
X-Gm-Message-State: AO0yUKUIx/MpdnU1TZU4GoQFAVR8BfzvISYX//i+vO8om4xXrFgDvrZ+
 vJ3IsonRBC6vTTIcbTu+K7A/fPLZMFBcfXLY
X-Google-Smtp-Source: AK7set9mffl4AElI25q2Zmv9NyHyyTEK4xfsh4uy/WFpw8CSHS2gqdY2Whz8cjZ7rr/Y1T6mPFmZQQ==
X-Received: by 2002:adf:e255:0:b0:2c5:52ef:61c5 with SMTP id
 bl21-20020adfe255000000b002c552ef61c5mr137090wrb.41.1676884541203; 
 Mon, 20 Feb 2023 01:15:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b002c563b124basm1028706wrp.103.2023.02.20.01.15.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 20/24] hw/ide/pci: Unexport bmdma_active_if()
Date: Mon, 20 Feb 2023 10:13:54 +0100
Message-Id: <20230220091358.17038-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


