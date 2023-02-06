Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247068C919
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9eQ-0004Yv-2c; Mon, 06 Feb 2023 17:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eO-0004YX-1s; Mon, 06 Feb 2023 17:07:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eM-0007JY-C7; Mon, 06 Feb 2023 17:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sTH6cWJo5X0A8BilSgqllpHy58qrKTHju/yyG0hOY3s=; b=NqVXD8h944ARTiDz6xLv63WrXj
 l/381s55OtTAbHaA3qqdE5yv5g8QA/VxYMVFCn4dhBWmsgiquI/IYVWn8Bs1nkox4c+STGCl0KiBS
 vquaLpTn0s0ZGnnRTgf7PiNGB1yPnj/3LZPZPsZeOfdf4cASHgM/mwwl+GQzfibrXKTQF64X/xGnb
 B0iWSFYz/nHhfYEKwkh9Cg+j19Xx2FJeBQ1UhjY1Dvk6HBkaCyE05gfbeCN5FetP84mg4zyEtDu17
 Dvp7maPzEB0VuqNJZGWHCnD/E0cpuPnKqDlasFPWwumXzc46ptxOoE4d9USJ+BaHg3hnBSn12hzd+
 N2g8IbwCv00g3Jt7MNHqHP1JI2pD7UGVmqUDOV0IoDM2mah9X0G5asSeVJHmirlPqs/75b7U04Obf
 oda9/cAbuY6RDKsSi3EXMwciAcFxYJxqc2CoN4IIAdGc1n/M8QUuBHD8nnixasY70vQxGRpXzF4fk
 MZ7O4/Ax4L+0GWU7JttKdxnxQWAo39BTV26sSqkel/cpDnueNtIOgiU7Bmpnqtgb0MkVfgBFhXWHG
 yfmcT4TJ4k05CcS65ZMYyrw7XW+Tyiy1dRHApDOq2XSItTFAeiG9x5vnVJnVLu/7APP67G/NYe5gr
 iIocYOUD0MtE85iVVY4l1r8r2E/HwSYO+nUKfKzbM=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9dm-00039N-4u; Mon, 06 Feb 2023 22:07:14 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:15 +0000
Message-Id: <20230206220722.125814-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 1/8] input/adb: Only include header where needed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The header hw/input/adb.h is included by some files that don't need
it. Clean it up and include only where necessary.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.30.2


