Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C060C01F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:51:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on82t-0002lA-8b; Mon, 24 Oct 2022 20:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82r-0002Ur-Ey
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:53 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82p-0005CO-Qh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F061E616D7;
 Tue, 25 Oct 2022 00:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84911C433C1;
 Tue, 25 Oct 2022 00:43:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="e3cEMzH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbbFBZxOYFy4Zfuf8OqG4mrJyea5K03RVWzfP1v5dzM=;
 b=e3cEMzH7D9YrNitdh9pUoIi52oGo/wYsdnfALpUdVwb6lpzI/fnqbN9XJV2sIPz4QaZ1BO
 zEUX3Kc00pjWpilLTcKFAGL29YnXOo1yJo4f/xsF0JqjblZZHS/QTZtWA3rhN6rWSUl5me
 6h4aYUGv2/dHTqAKRyAybZ8eqi1pxiw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd7de717
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:41 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v4 02/11] device-tree: add re-randomization helper function
Date: Tue, 25 Oct 2022 02:43:18 +0200
Message-Id: <20221025004327.568476-3-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Several
architectures require this functionality, so export a function for
injecting a new seed into the given FDT.

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/sysemu/device_tree.h |  9 +++++++++
 softmmu/device_tree.c        | 21 +++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index e7c5441f56..ca5339beae 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -197,6 +197,15 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
                                                 qdt_tmp);                 \
     })
 
+
+/**
+ * qemu_fdt_randomize_seeds:
+ * @fdt: device tree blob
+ *
+ * Re-randomize all "rng-seed" properties with new seeds.
+ */
+void qemu_fdt_randomize_seeds(void *fdt);
+
 #define FDT_PCI_RANGE_RELOCATABLE          0x80000000
 #define FDT_PCI_RANGE_PREFETCHABLE         0x40000000
 #define FDT_PCI_RANGE_ALIASED              0x20000000
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index ce74f3d48d..30aa3aea9f 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -22,6 +22,7 @@
 #include "qemu/option.h"
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
@@ -680,3 +681,23 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
 
     info_report("dtb dumped to %s", filename);
 }
+
+void qemu_fdt_randomize_seeds(void *fdt)
+{
+    int noffset, poffset, len;
+    const char *name;
+    uint8_t *data;
+
+    for (noffset = fdt_next_node(fdt, 0, NULL);
+         noffset >= 0;
+         noffset = fdt_next_node(fdt, noffset, NULL)) {
+        for (poffset = fdt_first_property_offset(fdt, noffset);
+             poffset >= 0;
+             poffset = fdt_next_property_offset(fdt, poffset)) {
+            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);
+            if (!data || strcmp(name, "rng-seed"))
+                continue;
+            qemu_guest_getrandom_nofail(data, len);
+        }
+    }
+}
-- 
2.38.1


