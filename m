Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD620269C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 23:06:48 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmkhL-00083t-3c
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 17:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfP-0005KT-Rk
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:47 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfL-0001gA-7i
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 44A02748DE1;
 Sat, 20 Jun 2020 23:04:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1D737475FA; Sat, 20 Jun 2020 23:04:32 +0200 (CEST)
Message-Id: <ddb5781d12913bb9d6dbfd9e5b1e2b893e2b3e2d.1592686588.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592686588.git.balaton@eik.bme.hu>
References: <cover.1592686588.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 1/9] sm501: Fix bounds checks
Date: Sat, 20 Jun 2020 22:56:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

We don't need to add width to pitch when calculating last point, that
would reject valid ops within the card's local_mem.

Fixes: b15a22bbcbe6a78dc3d88fe3134985e4cdd87de4
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index a7fc08c52b..5ceee4166f 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -723,8 +723,8 @@ static void sm501_2d_operation(SM501State *s)
         dst_y -= height - 1;
     }
 
-    if (dst_base >= get_local_mem_size(s) || dst_base +
-        (dst_x + width + (dst_y + height) * (dst_pitch + width)) *
+    if (dst_base >= get_local_mem_size(s) ||
+        dst_base + (dst_x + width + (dst_y + height) * dst_pitch) *
         (1 << format) >= get_local_mem_size(s)) {
         qemu_log_mask(LOG_GUEST_ERROR, "sm501: 2D op dest is outside vram.\n");
         return;
@@ -749,8 +749,8 @@ static void sm501_2d_operation(SM501State *s)
             src_y -= height - 1;
         }
 
-        if (src_base >= get_local_mem_size(s) || src_base +
-            (src_x + width + (src_y + height) * (src_pitch + width)) *
+        if (src_base >= get_local_mem_size(s) ||
+            src_base + (src_x + width + (src_y + height) * src_pitch) *
             (1 << format) >= get_local_mem_size(s)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "sm501: 2D op src is outside vram.\n");
-- 
2.21.3


