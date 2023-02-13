Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD66693EAC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStH-0000jp-OJ; Mon, 13 Feb 2023 02:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStD-0000j3-Qp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStC-0000jJ-82
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id n33so1990763wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5i16l2BnG5bR396mqVfBfc0/x+tQE8lt1qXCAB9bxlU=;
 b=EhPR2h+mT0Fu6KYa1KxHWufluoq5JvbKHON0sjpQhXXUGUR8Hwrj3dQ91ekpFgLpWU
 fW2Hrzgy+qxh3sMW577X9Zlrx+KqHM1orUhbSDN5dS/d4Lpc+PBXSQzPuh2pnwg2eUyB
 hrJBufZ3MmTwEx6npaFdaW9tH8tLLp/voGcRFO1PLfpHQC2Wz+fryltP2KBUfaR5Hn2A
 xTgWF5mGmANohXvGXZxmf61VxIcKxWtjCGK7vLNylMARaZW6OsyINEgUHcihleP2bUKn
 tLkZ6izc5DmaE69ksbX4Ic9m9CACTOJBPy+JihzlgzE2GAMAhhNfCG400OBs/k8morqs
 RPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5i16l2BnG5bR396mqVfBfc0/x+tQE8lt1qXCAB9bxlU=;
 b=t8oDMSPJqTltJ8YcvsbhVCkjSrIQ5K0Nac01SPaMCToqc97YgnA627r9dsW/TN1KkK
 VjFKkwtivu67Fgf69BCXljCQUqxYwzA0w3BVJiRegTg9RDCfFSLix0EnoYM9asOwUax6
 9Pw8AUh5/Km3i3EFCgddgtvc4DT5K/AGnY17jZ9lKRHpcTL8YFGuXzKRjbKsNmU+DFzV
 J++dN0MBvv9gwpWM3L+frdG1vt3BmrSadO/fcAVfH/yiHumBYsrN9g0CSBnhlnHmbPaU
 x6hD31m0cWjLQPv+oQ/qzJTOOskqNkA0WDPfYvZ3QW+/PXtK5VlX9OAWatUYOX3BX7hF
 Ld4w==
X-Gm-Message-State: AO0yUKW0s9TFMmXTFmk6un3LtL9KfmYjan3BvKplJF/XeoFAjsIDY6yl
 yWA7IMqTyyPZakuEg2PLvSGLrLahbEDYiI38
X-Google-Smtp-Source: AK7set+91wu9eO/3I/3vIKZJ+kxI4mlAVwh9iuP27xWIBUZi0Pe1XIVEdwEouLt2DjeLv0k74P+r7A==
X-Received: by 2002:a05:600c:4b1c:b0:3df:eb5d:c583 with SMTP id
 i28-20020a05600c4b1c00b003dfeb5dc583mr18025496wmp.17.1676271875912; 
 Sun, 12 Feb 2023 23:04:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm12386835wmb.27.2023.02.12.23.04.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 2/9] hw/audio: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:16 +0100
Message-Id: <20230213070423.76428-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/intel-hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index b9ed231fe8..ec38828da0 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -59,7 +59,7 @@ void hda_codec_bus_init(DeviceState *dev, HDACodecBus *bus, size_t bus_size,
 
 static void hda_codec_dev_realize(DeviceState *qdev, Error **errp)
 {
-    HDACodecBus *bus = HDA_BUS(qdev->parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(qdev));
     HDACodecDevice *dev = HDA_CODEC_DEVICE(qdev);
     HDACodecDeviceClass *cdc = HDA_CODEC_DEVICE_GET_CLASS(dev);
 
@@ -103,14 +103,14 @@ HDACodecDevice *hda_codec_find(HDACodecBus *bus, uint32_t cad)
 
 void hda_codec_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
     bus->response(dev, solicited, response);
 }
 
 bool hda_codec_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                     uint8_t *buf, uint32_t len)
 {
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
     return bus->xfer(dev, stnr, output, buf, len);
 }
 
@@ -344,7 +344,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
     const MemTxAttrs attrs = { .memory = true };
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
     uint32_t wp, ex;
@@ -399,7 +399,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                            uint8_t *buf, uint32_t len)
 {
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
     uint32_t s, copy, left;
-- 
2.38.1


