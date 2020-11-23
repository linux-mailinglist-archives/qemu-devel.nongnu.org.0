Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AC2C04C5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:44:52 +0100 (CET)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAH4-0005xh-CF
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFg-0004Bx-5n
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:24 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFe-0002fQ-DQ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:23 -0500
Received: by mail-wr1-x443.google.com with SMTP id g14so3068408wrm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W8OZiwXErPaHZrssg3fNa1FJR5CnKtlyLA6VpRcXeRs=;
 b=iKK0Vc3nMTFq0Rfw24hofZ2+eOduvn8UBOvNGDSjayAfw7WUIJ1U+FVNbhkN/RS8BI
 tQ+tMnq/H3IP9eJCW8Bz5Gfkn7JWv5IVWB1G5wHmW6b6qZGDUR7YjxpisU26YZXpQwma
 di41O7QQqqS4Q8527OGgivaFyf/WAHjg2BTwly3758XwQ7Kk0s9FZwItK7x5DO/GPT7v
 +4160DhsJHUY0eIN4Qd0HxsR8G1nOXtxp4AVzLe5erX67xi/1m2E6RoW+BtiF3IWsEQY
 Hq3kH92YYU9sOKTxaEVZXo8+srdxtzUooFbZ+Ck0aYI3DVbw1MV0Zex+M//nG8ZiU6ol
 zM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8OZiwXErPaHZrssg3fNa1FJR5CnKtlyLA6VpRcXeRs=;
 b=P+LvK1Y50KPPhxSMC2q44H5y1x3UdCxhCC48QFpR1THUIvPVXwN2TrLlxQNqdQB0Gc
 hgFthZ+KW7k/L+oPZ4SdQRo3XkPrZ/EEGRQjwkMR1cOrJu1zDbUNjjlagiNALKTNJkB4
 4UNBSNeA5fos6N0FwMYRGGs/9EVUDQHY11Te7q/pVPt7yS+9VDo749jd0Bvy7DYoo8tS
 4XeKuMlo3l50LhSM4t/+xT7o+OqC2iJty/WtOGM5ATlXEedY0iRrBE58l0XuJG3hYZHf
 USxaYFUxbLKnEr+PJZ+H67odRGi0FDo2tZ3f6ITtGP1cMyI1fXognBevvk0UR5IlnnSv
 NbTg==
X-Gm-Message-State: AOAM533gtt8sDASXS5eP4zwEgjyFkrr6SzkOGp6r++vCX674p6lKPtL7
 BZMHx1vVfogY8TNCfMdHY02n+xdB+0YcFw==
X-Google-Smtp-Source: ABdhPJz2DNFNlH//2i/k+B78o1gOXmejB/BIPU84Q2hev3viZXrMn8j4sLqNWx0FXm4vnXIOp9WnmA==
X-Received: by 2002:adf:fe0f:: with SMTP id n15mr31936153wrr.357.1606131800835; 
 Mon, 23 Nov 2020 03:43:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] hw/intc: fix heap-buffer-overflow in rxicu_realize()
Date: Mon, 23 Nov 2020 11:42:54 +0000
Message-Id: <20201123114315.13372-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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

From: Chen Qun <kuhn.chenqun@huawei.com>

When 'j = icu->nr_sense – 1', the 'j < icu->nr_sense' condition is true,
then 'j = icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds access.

The asan showed stack:
ERROR: AddressSanitizer: heap-buffer-overflow on address 0x604000004d7d at pc 0x55852cd26a76 bp 0x7ffe39f26200 sp 0x7ffe39f261f0
READ of size 1 at 0x604000004d7d thread T0
    #0 0x55852cd26a75 in rxicu_realize ../hw/intc/rx_icu.c:311
    #1 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
    #2 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
    #3 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
    #4 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c:28
    #5 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
    #6 0x55852cbf0b27 in register_icu ../hw/rx/rx62n.c:156
    #7 0x55852cbf12a6 in rx62n_realize ../hw/rx/rx62n.c:261
    #8 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
    #9 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
    #10 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
    #11 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c:28
    #12 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
    #13 0x55852cbf1a85 in rx_gdbsim_init ../hw/rx/rx-gdbsim.c:109
    #14 0x55852cd22de0 in qemu_init ../softmmu/vl.c:4380
    #15 0x55852ca57088 in main ../softmmu/main.c:49
    #16 0x7feefafa5d42 in __libc_start_main (/lib64/libc.so.6+0x26d42)

Add the 'ice->src[i].sense' initialize to the default value, and then
process init_sense array to identify which irqs should be level-triggered.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20201111141733.2358800-1-kuhn.chenqun@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/rx_icu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
index 94e17a9deac..e5c01807b9a 100644
--- a/hw/intc/rx_icu.c
+++ b/hw/intc/rx_icu.c
@@ -300,22 +300,20 @@ static const MemoryRegionOps icu_ops = {
 static void rxicu_realize(DeviceState *dev, Error **errp)
 {
     RXICUState *icu = RX_ICU(dev);
-    int i, j;
+    int i;
 
     if (icu->init_sense == NULL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "rx_icu: trigger-level property must be set.");
         return;
     }
-    for (i = j = 0; i < NR_IRQS; i++) {
-        if (icu->init_sense[j] == i) {
-            icu->src[i].sense = TRG_LEVEL;
-            if (j < icu->nr_sense) {
-                j++;
-            }
-        } else {
-            icu->src[i].sense = TRG_PEDGE;
-        }
+
+    for (i = 0; i < NR_IRQS; i++) {
+        icu->src[i].sense = TRG_PEDGE;
+    }
+    for (i = 0; i < icu->nr_sense; i++) {
+        uint8_t irqno = icu->init_sense[i];
+        icu->src[irqno].sense = TRG_LEVEL;
     }
     icu->req_irq = -1;
 }
-- 
2.20.1


