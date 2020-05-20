Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5991DB620
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbPb6-0002Bj-H3
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 10:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXm-0004wm-MD
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXk-0004Pu-Pz
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 60A93748DDD;
 Wed, 20 May 2020 16:17:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 34630748DD1; Wed, 20 May 2020 16:17:49 +0200 (CEST)
Message-Id: <90b2648461d57d384823c90fa700cdd81d0b7254.1589981990.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1589981990.git.balaton@eik.bme.hu>
References: <cover.1589981990.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/6] sm501: Convert printf + abort to qemu_log_mask
Date: Wed, 20 May 2020 15:39:50 +0200
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 10:17:49
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some places already use qemu_log_mask() to log unimplemented features
or errors but some others have printf() then abort(). Convert these to
qemu_log_mask() and avoid aborting to prevent guests to easily cause
denial of service.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 57 ++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index acc692531a..bd3ccfe311 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -727,8 +727,8 @@ static void sm501_2d_operation(SM501State *s)
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
 
     if (addressing != 0x0) {
-        printf("%s: only XY addressing is supported.\n", __func__);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
+        return;
     }
 
     if (rop_mode == 0) {
@@ -754,8 +754,8 @@ static void sm501_2d_operation(SM501State *s)
 
     if ((s->twoD_source_base & 0x08000000) ||
         (s->twoD_destination_base & 0x08000000)) {
-        printf("%s: only local memory is supported.\n", __func__);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
+        return;
     }
 
     switch (operation) {
@@ -823,9 +823,9 @@ static void sm501_2d_operation(SM501State *s)
         break;
 
     default:
-        printf("non-implemented SM501 2D operation. %d\n", operation);
-        abort();
-        break;
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
+                      operation);
+        return;
     }
 
     if (dst_base >= get_fb_addr(s, crt) &&
@@ -892,9 +892,8 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 system config : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
+                      "register read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -948,15 +947,15 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
         break;
     case SM501_ENDIAN_CONTROL:
         if (value & 0x00000001) {
-            printf("sm501 system config : big endian mode not implemented.\n");
-            abort();
+            qemu_log_mask(LOG_UNIMP, "sm501: system config big endian mode not"
+                          " implemented.\n");
         }
         break;
 
     default:
-        printf("sm501 system config : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (uint32_t)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
+                      "register write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1207,9 +1206,8 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 disp ctrl : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -1345,9 +1343,9 @@ static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 disp ctrl : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1433,9 +1431,8 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
         ret = 0; /* Should return interrupt status */
         break;
     default:
-        printf("sm501 disp ctrl : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -1520,9 +1517,9 @@ static void sm501_2d_engine_write(void *opaque, hwaddr addr,
         /* ignored, writing 0 should clear interrupt status */
         break;
     default:
-        printf("sm501 2d engine : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2d engine register "
+                      "write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1670,9 +1667,9 @@ static void sm501_update_display(void *opaque)
         draw_line = draw_line32_funcs[dst_depth_index];
         break;
     default:
-        printf("sm501 update display : invalid control register value.\n");
-        abort();
-        break;
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: update display"
+                      "invalid control register value.\n");
+        return;
     }
 
     /* set up to draw hardware cursor */
-- 
2.21.3


