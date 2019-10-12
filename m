Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F2D4EB5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 11:46:46 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJDz3-0006fW-1z
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 05:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwU-0005TI-Jn
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwT-0003VH-4Y
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:06 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:4356)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iJDwS-0003QR-BE; Sat, 12 Oct 2019 05:44:05 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65da1a04ec06-4ebdd;
 Sat, 12 Oct 2019 17:43:43 +0800 (CST)
X-RM-TRANSID: 2ee65da1a04ec06-4ebdd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75da1a0478f4-669b6;
 Sat, 12 Oct 2019 17:43:42 +0800 (CST)
X-RM-TRANSID: 2ee75da1a0478f4-669b6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/2] isa/pc87312: use helper to be more easier to understand
 when using abstract QOM parent functions.
Date: Sat, 12 Oct 2019 17:43:23 +0800
Message-Id: <20191012094323.234788-3-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: hpoussin@reactos.org, f4bug@amsat.org,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe introduced a series of helpers to make the
device class_init() easier to understand when a
device class change the parent hooks, device pc87312
missed helper, so convert it.

Cc: hpoussin@reactos.org
Cc: f4bug@amsat.org
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/isa/pc87312.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index b9bd57471e..13c1c43d2f 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -338,8 +338,7 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
-    sc->parent_realize = dc->realize;
-    dc->realize = pc87312_realize;
+    device_class_set_parent_realize(dc, pc87312_realize, &sc->parent_realize);
     dc->reset = pc87312_reset;
     dc->vmsd = &vmstate_pc87312;
     dc->props = pc87312_properties;
-- 
2.17.1




