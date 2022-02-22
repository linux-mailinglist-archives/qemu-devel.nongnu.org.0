Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F34BFF19
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:43:39 +0100 (CET)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYGJ-00027T-0a
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:43:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqA-00083f-V0; Tue, 22 Feb 2022 11:16:38 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:52993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq8-0005Yv-Tk; Tue, 22 Feb 2022 11:16:38 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mz9EL-1o9RYi393D-00wHY9; Tue, 22
 Feb 2022 17:16:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] hid: Implement support for side and extra buttons
Date: Tue, 22 Feb 2022 17:16:24 +0100
Message-Id: <20220222161624.382218-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OzCb64N2cYd1R9aWeQovsMhFwuGsr/13GRgXaFfJYXJoFhxThrH
 JBHEklgBYyJkEffxRB9zW764V8htsJiuuKeshRViz8bwmf7fuGVjnKkQllO5Qw6r7PN5G02
 0MI9R49vKzaBDBChcT2cA4eIICvpib7XhMnrxBVo8gS4FXvqoMit+y5JYOvsnid/xb6Chp5
 e9AyO6yLFgYowlwrmTNLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xe0ZHh8ssmU=:XVy3KHCi1zIk0bvocYY72n
 dbtF8IPX0Zfj9Z20bXzeqgOBeFOpzOLw37JRZcHWzzd+ml81yjeQLPVQ2myPTaFyWyBicvD78
 e4O2VUMA2dGHI6GCx15CDPl3fP84bGSCphEdoqQqQ3bqn1ybJev98hN2Q/li5WD8thUTE8Bf7
 0NhCdKbZldPMp71Pgm3XY3zUI4M7mo2E1VaR+rkICYUojlzcPYo39XadlWodoiS++J3kfb8lu
 hqG2w4rfBt0ACmIvSMSXj+Gc08yNrowmZTZz6TsFm+V4JqOApEE81Y/BLGv2poP+dj2kDfbrA
 cXjfqz8+NRf2cZl36fnmc0ismBoAK6Fu9yN7aMq9YeJVHhhoSVPItwJj7mzxE2u+jJWnCosxV
 zR3dY8m22LoNWEWRP4rGbu3hzTsU7vmOPRVpcZIhUXeoKAromKIrnBAqggYBjUd6xXbSX9+fR
 QcUFR8Fg0z62UOlO1qa9rcKt9RPfX87k7JvoUHqcE5IT5PIFKjT9eKZcoHuOFo733tD5ytsa5
 VD+3hnFlJnJWV2JEUAefyxdcJsGPblaSQ1bQsEVwsMQWFbTwbZK1kXjUCi59gyEYFbrhE42mi
 oxeX6KcFeMTPgFZLcIh+NzjHUjEuZLPuOz4VP1WD1elJvAhdbpqhgNa5VNCP7+NUeFFL0lmfc
 CMmuk0YBcOO2gYZqAK89Se1jeEcbEluBFn0/8IB7yuQ/+FOC4I20V/ZfGZZU3OQ+SB18=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Noah Bergbauer <noah@statshelix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Noah Bergbauer <noah@statshelix.com>

Simply set the respective bits and update the descriptor accordingly.

Signed-off-by: Noah Bergbauer <noah@statshelix.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211126140437.79745-1-noah@statshelix.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/hid.c   | 2 ++
 hw/usb/dev-hid.c | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 8aab0521f405..e7ecebdf8f88 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuConsole *src,
         [INPUT_BUTTON_LEFT]   = 0x01,
         [INPUT_BUTTON_RIGHT]  = 0x02,
         [INPUT_BUTTON_MIDDLE] = 0x04,
+        [INPUT_BUTTON_SIDE] = 0x08,
+        [INPUT_BUTTON_EXTRA] = 0x10,
     };
     HIDState *hs = (HIDState *)dev;
     HIDPointerEvent *e;
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 1c7ae97c3033..bdd6d1ffafe4 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor[] = {
     0xa1, 0x00,		/*   Collection (Physical) */
     0x05, 0x09,		/*     Usage Page (Button) */
     0x19, 0x01,		/*     Usage Minimum (1) */
-    0x29, 0x03,		/*     Usage Maximum (3) */
+    0x29, 0x05,		/*     Usage Maximum (5) */
     0x15, 0x00,		/*     Logical Minimum (0) */
     0x25, 0x01,		/*     Logical Maximum (1) */
-    0x95, 0x03,		/*     Report Count (3) */
+    0x95, 0x05,		/*     Report Count (5) */
     0x75, 0x01,		/*     Report Size (1) */
     0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
     0x95, 0x01,		/*     Report Count (1) */
-    0x75, 0x05,		/*     Report Size (5) */
+    0x75, 0x03,		/*     Report Size (3) */
     0x81, 0x01,		/*     Input (Constant) */
     0x05, 0x01,		/*     Usage Page (Generic Desktop) */
     0x09, 0x30,		/*     Usage (X) */
-- 
2.35.1


