Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043863F460
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:43:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhX-0005Jl-BW; Thu, 01 Dec 2022 10:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005En-9Y; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhK-0004vz-HY; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 24FEC11F994;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 00:59:29 +0100
Subject: [PATCH qemu.git v3 2/8] hw/timer/imx_epit: cleanup CR defines
Message-ID: <166990932074.29941.8709118178538288040-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 4 ++--
 include/hw/timer/imx_epit.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2841fbaa1c..661e9158e3 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -82,8 +82,8 @@ static void imx_epit_set_freq(IMXEPITState *s)
     uint32_t clksrc;
     uint32_t prescaler;
 
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
+    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
 
     s->freq = imx_ccm_get_clock_frequency(s->ccm,
                                 imx_epit_clocks[clksrc]) / prescaler;
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 2acc41e982..e2cb96229b 100644
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


