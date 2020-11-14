Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D42B2BB5
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 06:58:57 +0100 (CET)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdoaO-0007LW-57
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 00:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYW-0005Bz-Cx
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:57:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:27201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYU-0004NC-IG
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605333418; x=1636869418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mbxASUWy1fWRJ+jJOEgh3oNl6P0yN/NqGYscLjpSEE0=;
 b=R5EeRfe/3Clua2W88487a8S2eduLH+d6G0SUjVeXMgQ+NDKMtSiPWEdm
 L2AsWCnx3qtYS4AQDA6cl3UpMlH2LEYuXrMjnSzl4ur+bl5vYTsMjQvTQ
 keicjMCvLX2CKCBkXC3xSe0Pf5BsfbY2snoY63HJUgYjg4W/59gOg05Va
 0sUAfJLhlaLrZJipVaKBAtp0jcstoUsdvJK4T5C41hvIIYSkD+mfbNRtq
 0vYWQhJ26tAyRxAXVHlq9s9mn8J4BpJoekvSaYO4ML8l6ySAXw+smwdlA
 UBDon7Ns4Y+jc1N/9cF81w8Ulx4pNi1kOPKTUb7YWChqP65f+itL9hYJo w==;
IronPort-SDR: yDON+g1rkMEX5ZCXe9EtttXUVDBy/9ZmkbXeipyy/25pzMAAtfZZdw8gg3nbuCrzD4icjhSI6L
 DTahCDRouy4SIYjaoAo538WOpfatBk63cW5nC6nZnjnpKJnnm0Iz0VqdrQtt1NCYr1jaMlK4d4
 pTMJ074Q/NEu9kI9d6Q+VIeNMbE8ummQ7Cd+AvyH1QDDOfAnY2UXJe3Q/MvONATnyyoB/7CaJl
 TFpIxY+y4TC2bXLQqKj2S8bU/bJo4IJOGp6LmbGIqnTcNBJocX7FXqElpHtjSrsOwwBhoPllqH
 C/0=
X-IronPort-AV: E=Sophos;i="5.77,477,1596470400"; d="scan'208";a="152517557"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 13:56:52 +0800
IronPort-SDR: NkF5h56ophktFhq01VGyWumpQQCIt07rjdLbXJ24I0UGkbxAvyGR4YK91JFnwr+Kvy/gRfTflo
 yB07gJUafrKSnMExbRacny/hAS4a7u1dAaNzYkTG0U6y37VM028hZVAJSjQKE/N3SBE+kq7JZQ
 lKwiRBg0Y2HWtQFBhjRet7RA919cGd9stmNxGRzrSqe9xX7q8l5BujOZI+WV271pOYFWZhxAYp
 wDDkqSfHcxDeGrbRYPl6XaQq5eys+tuYwhhXGpncvLdBCzcqNnv7LRp8RuYcWQoNC4/uQLL4CN
 2s3uqUXytujBtsOgIZJ63+GV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 21:41:32 -0800
IronPort-SDR: gOlsNjS9dZdDYJtheMzAI8kgePG/UXn3EcYU+w/kfQWsaFU4WNqvrQSU0cXXFSNcWjOlTJ4Cgk
 0pxIRNPX7RJnEqPqPEfwjJv1OSrx1N7snYLFjLCkzmeQZkb59yXwsoZMPsgkMqYHEPzVLxtXMQ
 dvnYFizUeLQsnBn4zETvpapLNzfcwOBag4HOlYviyjeIp8Lq6goQKItddhe+JKtbVAnVXqrRX3
 pEkd165oDkB+qPDPzbjh7ZKJKy2pRp6YAnLQyoPOfcFCf4318PHVBFRYTkGalPoZWj0XsslPLM
 hXU=
WDCIronportException: Internal
Received: from cne130336.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.81])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Nov 2020 21:56:52 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/2] intc/ibex_plic: Ensure we don't loose interrupts
Date: Fri, 13 Nov 2020 21:45:09 -0800
Message-Id: <20201114054509.180352-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114054509.180352-1-alistair.francis@wdc.com>
References: <20201114054509.180352-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=58086a3e2=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 00:56:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an interrupt occurs between when we claim and complete an interrupt
we currently drop the interrupt in ibex_plic_irqs_set_pending(). This
somewhat matches hardware that also ignore the interrupt between the
claim and complete process.

In the case of hardware though the physical interrupt line will still
be asserted after we have completed the interrupt. This means we will
still act on the interrupt after the complete process. In QEMU we don't
and instead we drop the interrupt as it is never recorded.

This patch changed the behaviour of the Ibex PLIC so that we save all
interrupts that occur while we are between claiming and completing an
interrupt so that we can act on them after the completition process.

This fixes interrupts being dropped when running Tock on OpenTitain in
QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: e7bcf98c6925b1e6e7828e7c3f85293a09a65b12.1605136387.git.alistair.francis@wdc.com
---
 include/hw/intc/ibex_plic.h |  1 +
 hw/intc/ibex_plic.c         | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 37f03356b3..7fc495db99 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -33,6 +33,7 @@ struct IbexPlicState {
     MemoryRegion mmio;
 
     uint32_t *pending;
+    uint32_t *hidden_pending;
     uint32_t *claimed;
     uint32_t *source;
     uint32_t *priority;
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index db9e0aa25f..341c9db405 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -48,6 +48,7 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
          * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
          */
+        s->hidden_pending[pending_num] |= level << (irq % 32);
         return;
     }
 
@@ -176,8 +177,21 @@ static void ibex_plic_write(void *opaque, hwaddr addr,
             s->claim = 0;
         }
         if (s->claimed[value / 32] & 1 << (value % 32)) {
+            int pending_num = value / 32;
+
             /* This value was already claimed, clear it. */
-            s->claimed[value / 32] &= ~(1 << (value % 32));
+            s->claimed[pending_num] &= ~(1 << (value % 32));
+
+            if (s->hidden_pending[pending_num] & (1 << (value % 32))) {
+                /*
+                 * If the bit in hidden_pending is set then that means we
+                 * received an interrupt between claiming and completing
+                 * the interrupt that hasn't since been de-asserted.
+                 * On hardware this would trigger an interrupt, so let's
+                 * trigger one here as well.
+                 */
+                s->pending[pending_num] |= 1 << (value % 32);
+            }
         }
     }
 
@@ -239,6 +253,7 @@ static void ibex_plic_realize(DeviceState *dev, Error **errp)
     int i;
 
     s->pending = g_new0(uint32_t, s->pending_num);
+    s->hidden_pending = g_new0(uint32_t, s->pending_num);
     s->claimed = g_new0(uint32_t, s->pending_num);
     s->source = g_new0(uint32_t, s->source_num);
     s->priority = g_new0(uint32_t, s->priority_num);
-- 
2.29.2


