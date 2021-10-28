Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443F43E95E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:12:07 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBks-0006Kv-5T
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWc-0003er-Di
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWX-0000PA-Ii
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5EDDE756192;
 Thu, 28 Oct 2021 21:57:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A3DEB7561C8; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <7cc78641a1f9fa0f75cb23c6b8d8a0dce9eaaec8.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 21/23] hw/timer/sh_timer: Fix format strings and remove
 casts
Date: Thu, 28 Oct 2021 21:27:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type casts are not needed when using the right format strings.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/timer/sh_timer.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 2038adfb0a..fca27cb247 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -77,7 +77,7 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
         }
         /* fall through */
     default:
-        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
+        hw_error("sh_timer_read: Bad offset 0x%"HWADDR_PRIx"\n", offset);
         return 0;
     }
 }
@@ -193,7 +193,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
         }
         /* fallthrough */
     default:
-        hw_error("sh_timer_write: Bad offset %x\n", (int)offset);
+        hw_error("sh_timer_write: Bad offset 0x%"HWADDR_PRIx"\n", offset);
     }
     sh_timer_update(s);
 }
@@ -264,7 +264,8 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset,
     trace_sh_timer_read(offset);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            hw_error("tmu012_write: Bad channel offset 0x%"HWADDR_PRIx"\n",
+                     offset);
         }
         return sh_timer_read(s->timer[2], offset - 0x20);
     }
@@ -282,7 +283,7 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset,
         return s->tocr;
     }
 
-    hw_error("tmu012_write: Bad offset %x\n", (int)offset);
+    hw_error("tmu012_write: Bad offset 0x%"HWADDR_PRIx"\n", offset);
     return 0;
 }
 
@@ -294,7 +295,8 @@ static void tmu012_write(void *opaque, hwaddr offset,
     trace_sh_timer_write(offset, value);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            hw_error("tmu012_write: Bad channel offset 0x%"HWADDR_PRIx"\n",
+                     offset);
         }
         sh_timer_write(s->timer[2], offset - 0x20, value);
         return;
-- 
2.21.4


