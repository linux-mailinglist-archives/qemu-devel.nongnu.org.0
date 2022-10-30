Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DC612EDE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:17:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLb-0001GI-2C; Sun, 30 Oct 2022 22:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLA-00016g-4W; Sun, 30 Oct 2022 22:15:52 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL8-00036q-Pd; Sun, 30 Oct 2022 22:15:51 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CD64E11F296;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 00:59:29 +0100
Subject: [PATCH qemu.git 09/11] hw/timer/imx_epit: cleanup CR defines
Message-ID: <166718254546.5893.5075929684621857903-9@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 4 ++--
 include/hw/timer/imx_epit.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 5915d4b3d4..196fc67c30 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -71,8 +71,8 @@ static uint32_t imx_epit_set_freq(IMXEPITState *s)
     uint32_t prescaler;
     uint32_t freq;
 
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
+    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
 
     freq = imx_ccm_get_clock_frequency(s->ccm,
                                 imx_epit_clocks[clksrc]) / prescaler;
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 2219a426ab..f6d41be7e1 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -43,7 +43,7 @@
 #define CR_OCIEN    (1 << 2)
 #define CR_RLD      (1 << 3)
 #define CR_PRESCALE_SHIFT (4)
-#define CR_PRESCALE_MASK  (0xfff)
+#define CR_PRESCALE_BITS  (12)
 #define CR_SWR      (1 << 16)
 #define CR_IOVW     (1 << 17)
 #define CR_DBGEN    (1 << 18)
@@ -51,7 +51,7 @@
 #define CR_DOZEN    (1 << 20)
 #define CR_STOPEN   (1 << 21)
 #define CR_CLKSRC_SHIFT (24)
-#define CR_CLKSRC_MASK  (0x3 << CR_CLKSRC_SHIFT)
+#define CR_CLKSRC_BITS  (2)
 
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
-- 
2.34.5


