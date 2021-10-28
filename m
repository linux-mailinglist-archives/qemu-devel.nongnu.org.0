Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92943E95D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:12:06 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBkr-0006GV-7K
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWa-0003eI-EQ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWV-0000OJ-GE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 35CBF75619C;
 Thu, 28 Oct 2021 21:57:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9021F7561AE; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <6c5014e86298b5d511a0e4e80f405683ad4191c2.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 16/23] hw/intc/sh_intc: Replace abort() with
 g_assert_not_reached()
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

All the places that call abort should not happen which is better
marked by g_assert_not_reached.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/sh_intc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 57c341c030..56a288e093 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -96,8 +96,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
             return source->vect;
         }
     }
-
-    abort();
+    g_assert_not_reached();
 }
 
 #define INTC_MODE_IS_PRIO 0x80
@@ -169,8 +168,7 @@ static void sh_intc_locate(struct intc_desc *desc,
             return;
         }
     }
-
-    abort();
+    g_assert_not_reached();
 }
 
 static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
@@ -241,7 +239,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
         value = *valuep & ~value;
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
 
     for (k = 0; k <= first; k++) {
-- 
2.21.4


