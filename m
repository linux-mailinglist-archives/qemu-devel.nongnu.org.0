Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16F67595A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:56:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItjN-0004bB-KA; Fri, 20 Jan 2023 10:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjH-0004ZX-Rm; Fri, 20 Jan 2023 10:54:59 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjG-00069b-Ee; Fri, 20 Jan 2023 10:54:59 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id DEEA620E1A54;
 Fri, 20 Jan 2023 07:54:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEEA620E1A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230096;
 bh=hA6UjCPH/KZisJeGGi0Pj05GPCIl4DXwLpG8cQ7M3eA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IyTfda6i2/pKpCR0Utb/t1/7A+F1PdI8fIRQt/j8sZwa4oNs934QNaOLU1mRCPnBt
 t3XsnOwucn1SxeboqTVQDESTHy/WPp/p/WVT7TcmyFBSGudASZfDJ3kdSvEwOHjtxm
 MtvT31xuXlpQ9bgo7XnR2BBH0zgo7fQ5tlW/PuHY=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 3/5] hw/char/pl011: implement a reset method
Date: Fri, 20 Jan 2023 16:54:45 +0100
Message-Id: <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
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
---
 hw/char/pl011.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 4df649a064..f9413f3703 100644
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


