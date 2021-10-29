Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E2440532
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:57:14 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZs9-0008PX-Ly
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJJ-0007iH-SK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJE-0005bs-F4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D08BE756198;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F0B397561D9; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <15e04aa665c68ab5df47bbf505346d413be2fc1c.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 26/30] hw/intc/sh_intc: Remove unneeded local variable
 initialisers
Date: Fri, 29 Oct 2021 23:02:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

The sh_intc_locate function will either init these or not return so no
need to initialise them.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 3603b448c2..1c30988437 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -196,14 +196,13 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
     }
 }
 
-static uint64_t sh_intc_read(void *opaque, hwaddr offset,
-                             unsigned size)
+static uint64_t sh_intc_read(void *opaque, hwaddr offset, unsigned size)
 {
     struct intc_desc *desc = opaque;
-    intc_enum *enum_ids = NULL;
-    unsigned int first = 0;
-    unsigned int width = 0;
-    unsigned int mode = 0;
+    intc_enum *enum_ids;
+    unsigned int first;
+    unsigned int width;
+    unsigned int mode;
     unsigned long *valuep;
 
     sh_intc_locate(desc, (unsigned long)offset, &valuep,
@@ -216,12 +215,12 @@ static void sh_intc_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
 {
     struct intc_desc *desc = opaque;
-    intc_enum *enum_ids = NULL;
-    unsigned int first = 0;
-    unsigned int width = 0;
-    unsigned int mode = 0;
-    unsigned int k;
+    intc_enum *enum_ids;
+    unsigned int first;
+    unsigned int width;
+    unsigned int mode;
     unsigned long *valuep;
+    unsigned int k;
     unsigned long mask;
 
     trace_sh_intc_write(size, offset, value);
-- 
2.21.4


