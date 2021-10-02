Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E638741FBCB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:37:37 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeGn-0000AH-0T
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWeAe-00033R-Me
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:31:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33310
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWeAd-0008D9-8u
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:31:16 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWeAO-0002WL-BF; Sat, 02 Oct 2021 13:31:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  2 Oct 2021 13:31:00 +0100
Message-Id: <20211002123101.14675-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002123101.14675-1-mark.cave-ayland@ilande.co.uk>
References: <20211002123101.14675-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/2] nubus.h: add ULL suffix to NUBUS_SUPER_SLOT_SIZE and
 NUBUS_SUPER_SLOT_SIZE
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Coverity thinks that the slot_offset multiplications in nubus_device_realize()
might overflow because the resulting hwaddr is 64-bit whilst the multiplication
is only done at 32-bits.

Add an explicit ULL suffix to NUBUS_SUPER_SLOT_SIZE and NUBUS_SUPER_SLOT_SIZE
to ensure that the multiplication is also done at 64-bits.

Fixes: Coverity CID 1464070
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/nubus/nubus.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index b3b4d2eadb..677dd6e5a2 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -15,13 +15,13 @@
 #include "qom/object.h"
 #include "qemu/units.h"
 
-#define NUBUS_SUPER_SLOT_SIZE 0x10000000U
+#define NUBUS_SUPER_SLOT_SIZE 0x10000000ULL
 #define NUBUS_SUPER_SLOT_NB   0xe
 
 #define NUBUS_SLOT_BASE       (NUBUS_SUPER_SLOT_SIZE * \
                                (NUBUS_SUPER_SLOT_NB + 1))
 
-#define NUBUS_SLOT_SIZE       0x01000000
+#define NUBUS_SLOT_SIZE       0x01000000ULL
 #define NUBUS_FIRST_SLOT      0x0
 #define NUBUS_LAST_SLOT       0xf
 #define NUBUS_SLOT_NB         (NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1)
-- 
2.20.1


