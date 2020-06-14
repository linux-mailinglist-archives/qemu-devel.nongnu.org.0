Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF81F893E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:33:29 +0200 (CEST)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkThQ-0002rO-JZ
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTdL-0005p2-99; Sun, 14 Jun 2020 10:29:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38344
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTdJ-0005Ab-Op; Sun, 14 Jun 2020 10:29:14 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTdA-0006Hv-6N; Sun, 14 Jun 2020 15:29:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:21 +0100
Message-Id: <20200614142840.10245-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/22] cuda: convert ADB autopoll timer from ns to ms
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

This is in preparation for consolidating all of the ADB autopoll management
in one place.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/cuda.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index e0cc0aac5d..a407f2abc8 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -208,8 +208,9 @@ static void cuda_adb_poll(void *opaque)
         obuf[1] = 0x40; /* polled data */
         cuda_send_packet_to_host(s, obuf, olen + 2);
     }
-    timer_mod(s->adb_poll_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-              (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
+
+    timer_mod(s->adb_poll_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+              s->autopoll_rate_ms);
 }
 
 /* description of commands */
@@ -236,8 +237,8 @@ static bool cuda_cmd_autopoll(CUDAState *s,
         s->autopoll = autopoll;
         if (autopoll) {
             timer_mod(s->adb_poll_timer,
-                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                      (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
+                      qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                      s->autopoll_rate_ms);
         } else {
             timer_del(s->adb_poll_timer);
         }
@@ -262,8 +263,8 @@ static bool cuda_cmd_set_autorate(CUDAState *s,
     s->autopoll_rate_ms = in_data[0];
     if (s->autopoll) {
         timer_mod(s->adb_poll_timer,
-                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                  (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  s->autopoll_rate_ms);
     }
     return true;
 }
@@ -539,7 +540,7 @@ static void cuda_realize(DeviceState *dev, Error **errp)
     s->sr_delay_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, cuda_set_sr_int, s);
     s->sr_delay_ns = 20 * SCALE_US;
 
-    s->adb_poll_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, cuda_adb_poll, s);
+    s->adb_poll_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, cuda_adb_poll, s);
     s->adb_poll_mask = 0xffff;
     s->autopoll_rate_ms = 20;
 }
-- 
2.20.1


