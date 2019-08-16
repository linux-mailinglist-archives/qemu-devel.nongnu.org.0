Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B258F9F5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 06:43:53 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyU5g-00011o-SU
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 00:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1hyU4k-0000TP-Ji
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:42:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1hyU4j-0004zr-Bh
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:42:54 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:6236)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1hyU4i-0004qT-5z; Fri, 16 Aug 2019 00:42:53 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5d56342c64b-e1608;
 Fri, 16 Aug 2019 12:42:20 +0800 (CST)
X-RM-TRANSID: 2eeb5d56342c64b-e1608
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.mshome.net (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35d563424051-48588;
 Fri, 16 Aug 2019 12:42:20 +0800 (CST)
X-RM-TRANSID: 2ee35d563424051-48588
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Fri, 16 Aug 2019 12:41:56 +0800
Message-Id: <20190816044156.386502-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] [PATCH] isa/pc87312: use
 device_class_set_parent_realize
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
Cc: hpoussin@reactos.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/isa/pc87312.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 85dbc94439..e95176c148 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -336,8 +336,8 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
-    sc->parent_realize = dc->realize;
-    dc->realize = pc87312_realize;
+    device_class_set_parent_realize(dc, pc87312_realize,
+                                    &sc->parent_realize);
     dc->reset = pc87312_reset;
     dc->vmsd = &vmstate_pc87312;
     dc->props = pc87312_properties;
-- 
2.17.1




