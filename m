Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58255B340
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:49:56 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WOR-0004M4-NZ
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKZ-0001O9-U7
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKW-0008Kz-OM
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3c8LZ7lwJGM6UsltFoeVrKrMFOBOfG5nlGNHi8yZus4=; b=l2WtmKQsvVUw7b7TkXeoNAkU1E
 y/VbyZT90kDsGgYMnvwv6xNGVmse1EHBtYomqADURNcxKqXLoU13NNGApNzg3+jB0FffXr3vLK2AL
 d/mdMpmfdbacK19duTh9u5vFcpf3hA84ojEKW6Vmfn4UqYcPx2We5Q3J+mdhW+xeatZUv0l1W99c8
 vFfW0nJwNZ9iY49cUH4omrMfVGvLabCSGc5+OZjEt91gjOhk5NUOlJ400MmfJYNG+3JOotuY6TQ77
 qRArUL3P/iS0E/vHaMwyzKHzdJi2i/vrAH39cDpPk+ahBdPMhiTdJrLE1NNQfoj0JSdJocfjS1leB
 crLsMH/DSvqxzthrN+C4GbYkU7FuFBrCMfRBZAWudlU4wWFZG6kq2xEfk15p0Yvj8x8AFQ8HGv9Mv
 aZp4sZuHaQNubswcGfE+ZnKV8b3fa28BsF4yW9KCrv/DG1Jsw3qKNen+IGwotki+o6bVgDxMtcrG5
 m3gimC7FxC7J/+CYRPcTGvD6GMLAROUXpn5REBhpr75Lg2yfOComkR/XHlwcE2lESUM+Xyeb0M0bT
 4wt7YN1z7sqx/zU1LrlCCBTUR9hDP7NCOBolTYaCJBD9/jS/7R+5EGOv2d5B6kT7S15bxpCrchSjV
 A1Rx3I2mmMMMSYTcBjq0cmV0fVXtgzEz+34CxmGik=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJI-0007KY-BM; Sun, 26 Jun 2022 18:44:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:38 +0100
Message-Id: <20220626174531.969187-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/55] ps2: QOMify PS2State
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Make PS2State a new abstract PS2_DEVICE QOM type to represent the common
functionality shared between PS2 keyboard and mouse devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-3-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 67dd2eca84..514e55cbb6 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
@@ -96,12 +97,17 @@ typedef struct {
 } PS2Queue;
 
 struct PS2State {
+    SysBusDevice parent_obj;
+
     PS2Queue queue;
     int32_t write_cmd;
     void (*update_irq)(void *, int);
     void *update_arg;
 };
 
+#define TYPE_PS2_DEVICE "ps2-device"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+
 typedef struct {
     PS2State common;
     int scan_enabled;
@@ -1277,3 +1283,25 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     qemu_register_reset(ps2_mouse_reset, s);
     return s;
 }
+
+static void ps2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo ps2_info = {
+    .name          = TYPE_PS2_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PS2State),
+    .class_init    = ps2_class_init,
+    .abstract      = true
+};
+
+static void ps2_register_types(void)
+{
+    type_register_static(&ps2_info);
+}
+
+type_init(ps2_register_types)
-- 
2.30.2


