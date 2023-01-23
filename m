Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE81678150
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:25:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzbP-0007fV-8B; Mon, 23 Jan 2023 11:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbK-0007d3-2M; Mon, 23 Jan 2023 11:23:18 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbI-0003b2-Bf; Mon, 23 Jan 2023 11:23:17 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1C01D20E1ABC;
 Mon, 23 Jan 2023 08:23:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1C01D20E1ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490995;
 bh=fO/Se+Lf7pUJu/M6NJtHFI4xXBw3PP1KVuf4/UZcH3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIr1mwx0+pn4cdWNMIshwd9gryYjHX4y21CrB154SH/Id8wZHrVsmjA1FhTTdx7eI
 Eu9/jg2szAL66c3iC0rfoLivRj+lC7Rj4COHNTUHTRUShccjYlr6hDX81v3bepisRM
 DkXSR857vcbGzNg0mDXBZ/TJL8CH1C8sLE+ME6HA=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 3/5] hw/char/pl011: implement a reset method
Date: Mon, 23 Jan 2023 17:23:02 +0100
Message-Id: <20230123162304.26254-4-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

PL011 currently lacks a reset method. Implement it.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 05e8bdc050..ca7537d8ed 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -427,11 +427,6 @@ static void pl011_init(Object *obj)
     s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
                                 ClockUpdate);
 
-    s->read_trigger = 1;
-    s->ifl = 0x12;
-    s->cr = 0x300;
-    s->flags = 0x90;
-
     s->id = pl011_id_arm;
 }
 
@@ -443,11 +438,32 @@ static void pl011_realize(DeviceState *dev, Error **errp)
                              pl011_event, NULL, s, NULL, true);
 }
 
+static void pl011_reset(DeviceState *dev)
+{
+    PL011State *s = PL011(dev);
+
+    s->lcr = 0;
+    s->rsr = 0;
+    s->dmacr = 0;
+    s->int_enabled = 0;
+    s->int_level = 0;
+    s->ilpr = 0;
+    s->ibrd = 0;
+    s->fbrd = 0;
+    s->read_pos = 0;
+    s->read_count = 0;
+    s->read_trigger = 1;
+    s->ifl = 0x12;
+    s->cr = 0x300;
+    s->flags = 0x90;
+}
+
 static void pl011_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = pl011_realize;
+    dc->reset = pl011_reset;
     dc->vmsd = &vmstate_pl011;
     device_class_set_props(dc, pl011_properties);
 }
-- 
2.34.1


