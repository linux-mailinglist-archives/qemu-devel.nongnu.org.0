Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9150A9D7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhdEo-0001tX-1p
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcY0-0000MK-ST
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:33:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXx-0005n6-VD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:33:00 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWy-000Caf-0Z; Thu, 21 Apr 2022 20:31:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:56 +0100
Message-Id: <20220421193100.5098-47-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 46/50] hppa: move enable_lan() define from hppa_sys.h to
 machine.c
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the board configuration is in one place, the define is only needed when
wiring up the board in machine.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h | 2 --
 hw/hppa/machine.c  | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 17e2c6dec1..e7f65cad75 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -5,6 +5,4 @@
 
 #include "hppa_hardware.h"
 
-#define enable_lasi_lan()       0
-
 #endif
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7fb41ff0e7..d61e2ea4e4 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -36,6 +36,9 @@
 
 #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)
 
+#define enable_lasi_lan()       0
+
+
 static void hppa_powerdown_req(Notifier *n, void *opaque)
 {
     hwaddr soft_power_reg = HPA_POWER_BUTTON;
-- 
2.20.1


