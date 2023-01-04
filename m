Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B165E046
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBrs-0007aS-Fd; Wed, 04 Jan 2023 17:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpi-00069f-9A; Wed, 04 Jan 2023 17:02:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpd-0003BR-PC; Wed, 04 Jan 2023 17:02:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AC990749023;
 Wed,  4 Jan 2023 22:59:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 75A46749022; Wed,  4 Jan 2023 22:59:36 +0100 (CET)
Message-Id: <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1672868854.git.balaton@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 1/7] input/adb: Only include header where needed
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  4 Jan 2023 22:59:36 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The header hw/input/adb.h is included by some files that don't need
it. Clean it up and include only where necessary.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/cuda.c         | 2 --
 hw/misc/macio/pmu.c          | 3 ---
 hw/misc/mos6522.c            | 1 -
 include/hw/misc/mac_via.h    | 1 +
 include/hw/misc/macio/cuda.h | 1 +
 include/hw/misc/macio/pmu.h  | 1 +
 include/hw/misc/mos6522.h    | 3 +--
 7 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 853e88bfed..7208b90e12 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -27,8 +27,6 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "hw/input/adb.h"
-#include "hw/misc/mos6522.h"
 #include "hw/misc/macio/cuda.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 97ef8c771b..8575bc1264 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -31,10 +31,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "hw/input/adb.h"
 #include "hw/irq.h"
-#include "hw/misc/mos6522.h"
-#include "hw/misc/macio/gpio.h"
 #include "hw/misc/macio/pmu.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 0ed631186c..d6ba47bde9 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/input/adb.h"
 #include "hw/irq.h"
 #include "hw/misc/mos6522.h"
 #include "hw/qdev-properties.h"
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 5fe7a7f592..422da43bf9 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -12,6 +12,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mos6522.h"
+#include "hw/input/adb.h"
 #include "qom/object.h"
 
 
diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
index a71deec968..8a6678c749 100644
--- a/include/hw/misc/macio/cuda.h
+++ b/include/hw/misc/macio/cuda.h
@@ -26,6 +26,7 @@
 #ifndef CUDA_H
 #define CUDA_H
 
+#include "hw/input/adb.h"
 #include "hw/misc/mos6522.h"
 #include "qom/object.h"
 
diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
index 00fcdd23f5..ba76afb52a 100644
--- a/include/hw/misc/macio/pmu.h
+++ b/include/hw/misc/macio/pmu.h
@@ -10,6 +10,7 @@
 #ifndef PMU_H
 #define PMU_H
 
+#include "hw/input/adb.h"
 #include "hw/misc/mos6522.h"
 #include "hw/misc/macio/gpio.h"
 #include "qom/object.h"
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 05872fffc9..fba45668ab 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -27,9 +27,8 @@
 #ifndef MOS6522_H
 #define MOS6522_H
 
-#include "exec/memory.h"
+#include "exec/hwaddr.h"
 #include "hw/sysbus.h"
-#include "hw/input/adb.h"
 #include "qom/object.h"
 
 #define MOS6522_NUM_REGS 16
-- 
2.30.6


