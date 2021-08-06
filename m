Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE973E2CEC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:48:48 +0200 (CEST)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC19T-0006U9-6E
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1mC18N-0005KI-HS
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:47:39 -0400
Received: from metis.ext.pengutronix.de
 ([2001:67c:670:201:290:27ff:fe1d:cc33]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1mC18M-0000ix-7s
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:47:39 -0400
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1mC18E-0004Jn-2u; Fri, 06 Aug 2021 16:47:30 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1mC18C-0005fb-TH; Fri, 06 Aug 2021 16:47:28 +0200
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1mC18C-00Fk4c-Pz; Fri, 06 Aug 2021 16:47:28 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/char/pl011: add support for sending break
Date: Fri,  6 Aug 2021 16:47:00 +0200
Message-Id: <20210806144700.3751979-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-devel@nongnu.org
Received-SPF: pass client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 envelope-from=jlu@pengutronix.de; helo=metis.ext.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Jan Luebbe <jlu@pengutronix.de>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Break events are currently only handled by chardev/char-serial.c, so we
just ignore errors, which results in no behaviour change for other
chardevs.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 hw/char/pl011.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index dc85527a5f92..6e2d7f75095c 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -26,6 +26,7 @@
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "chardev/char-fe.h"
+#include "chardev/char-serial.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -231,6 +232,11 @@ static void pl011_write(void *opaque, hwaddr offset,
             s->read_count = 0;
             s->read_pos = 0;
         }
+        if ((s->lcr ^ value) & 0x1) {
+            int break_enable = value & 0x1;
+            qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
+                              &break_enable);
+        }
         s->lcr = value;
         pl011_set_read_trigger(s);
         break;
-- 
2.30.2


