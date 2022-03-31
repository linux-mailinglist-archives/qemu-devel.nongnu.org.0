Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910C4ED5AC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:33:18 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqF2-0006zf-Vr
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:33:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz8-0001Y6-DJ; Thu, 31 Mar 2022 04:16:50 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:23769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz5-0000j4-TN; Thu, 31 Mar 2022 04:16:50 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V84rST054248;
 Thu, 31 Mar 2022 16:04:53 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 16:15:50 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/9] aspeed/timer: Add AST1030 support.
Date: Thu, 31 Mar 2022 16:15:41 +0800
Message-ID: <20220331081545.7140-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V84rST054248
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Steven Lee <steven_lee@aspeedtech.com>

ast1030 tmc(timer controller) is identical to ast2600 tmc.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c         | 17 +++++++++++++++++
 include/hw/timer/aspeed_timer.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 42c47d2ce6..9c20b3d6ad 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -745,12 +745,29 @@ static const TypeInfo aspeed_2600_timer_info = {
     .class_init = aspeed_2600_timer_class_init,
 };
 
+static void aspeed_1030_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedTimerClass *awc = ASPEED_TIMER_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 Timer";
+    awc->read = aspeed_2600_timer_read;
+    awc->write = aspeed_2600_timer_write;
+}
+
+static const TypeInfo aspeed_1030_timer_info = {
+    .name = TYPE_ASPEED_1030_TIMER,
+    .parent = TYPE_ASPEED_TIMER,
+    .class_init = aspeed_1030_timer_class_init,
+};
+
 static void aspeed_timer_register_types(void)
 {
     type_register_static(&aspeed_timer_info);
     type_register_static(&aspeed_2400_timer_info);
     type_register_static(&aspeed_2500_timer_info);
     type_register_static(&aspeed_2600_timer_info);
+    type_register_static(&aspeed_1030_timer_info);
 }
 
 type_init(aspeed_timer_register_types)
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index d36034a10c..07dc6b6f2c 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(AspeedTimerCtrlState, AspeedTimerClass, ASPEED_TIMER)
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
+#define TYPE_ASPEED_1030_TIMER TYPE_ASPEED_TIMER "-ast1030"
 
 #define ASPEED_TIMER_NR_TIMERS 8
 
-- 
2.17.1


