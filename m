Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB6606FF7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:22:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollQi-0002GR-Dn
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:22:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oll34-00017Y-3Q
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011g-1b; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074N-5h; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0R-2O;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Date: Fri, 21 Oct 2022 06:58:04 +0100
Message-Id: <20221021055808.342055-3-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

The qemu_fdt_setprop_string_array() does not return error codes and
will call exit() if any of the fdt calls fails (and should print an
error with the node being altered). This is done to prepare for the
change for qemu_fdt_setprop_strings() helper which does not return
any error codes (hw/core/guest-loader.c is the only place where an
return is checked).

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..c61ebc4144 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -57,25 +57,17 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
 
     if (s->kernel) {
         const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
         if (s->args) {
-            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
-                error_setg(errp, "couldn't set %s/bootargs", node);
-            }
+            qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
         }
     } else if (s->initrd) {
         const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
     }
 }
 
-- 
2.35.1


