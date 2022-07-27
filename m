Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E8583560
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 00:43:28 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGpkV-0000Y3-UM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 18:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgU-0003gu-B9; Wed, 27 Jul 2022 18:39:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52722 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007ul-JX; Wed, 27 Jul 2022 18:39:18 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cQz-0S;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
Date: Wed, 27 Jul 2022 23:39:03 +0100
Message-Id: <20220727223905.624285-4-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727223905.624285-1-qemu@ben.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Change to using the qemu_fdt_setprop_strings() helper in
hw/core code.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..203090503e 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -56,10 +56,8 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
     if (s->kernel) {
-        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
+        if (qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                     "multiboot,module", "multiboot,kernel") < 0) {
             error_setg(errp, "couldn't set %s/compatible", node);
             return;
         }
@@ -69,10 +67,8 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
             }
         }
     } else if (s->initrd) {
-        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
+        if (qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                     "multiboot,module", "multiboot,ramdisk") < 0) {
             error_setg(errp, "couldn't set %s/compatible", node);
             return;
         }
-- 
2.35.1


