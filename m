Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95D5FBC92
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:59:23 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMLS-0005Ue-K1
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9c-0004Wm-7t
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:09 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:41120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9Z-0001Pp-5G
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39220B816A1;
 Tue, 11 Oct 2022 20:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860B4C433C1;
 Tue, 11 Oct 2022 20:47:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="K2yni7hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4iMmrVnKX4fWtisVeaMk48H8te3Kjy/7gY9G+U0Yws=;
 b=K2yni7hrlnufHionLwL2hJJUkIH+jINXp9vQgv/MxfT4G+2LHj7pveRv3pwg3HBwi0FelH
 B+Lw0ERaveFY3nxTjT6lfE/7a4TCOYuL2aBFyczW69OaJRpkOWK3S6c8Y0rIFZKY0So7H0
 mTHLW2f43y3KWXLQWkHMLrpyOszQTRk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6ec1ea70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:46:59 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 1/8] device-tree: add re-randomization helper function
Date: Tue, 11 Oct 2022 14:46:38 -0600
Message-Id: <20221011204645.1160916-2-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index ef060a9759..d552f324b6 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -196,6 +196,15 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
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
index 6ca3fad285..d986c7b7b3 100644
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
@@ -643,3 +644,23 @@ out:
     g_free(propcells);
     return ret;
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
2.37.3


