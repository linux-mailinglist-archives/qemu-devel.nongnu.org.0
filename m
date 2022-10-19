Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F810604D06
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:19:34 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBn1-0003HB-3F
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX3-0006FE-1Q; Wed, 19 Oct 2022 12:03:01 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:60149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX0-0001S0-8d; Wed, 19 Oct 2022 12:03:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6D48975A175;
 Wed, 19 Oct 2022 18:02:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3712D75A16C; Wed, 19 Oct 2022 18:02:54 +0200 (CEST)
Message-Id: <b1504a82157a586aa284e8ee3b427b9a07b24169.1666194485.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666194485.git.balaton@eik.bme.hu>
References: <cover.1666194485.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 3/8] ppc4xx_sdram: Move ppc4xx_sdram_banks() to
 ppc4xx_sdram.c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Wed, 19 Oct 2022 18:02:54 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This function is only used by the ppc4xx memory controller models so
it can be made static.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc4xx_devs.c    | 62 -----------------------------------------
 hw/ppc/ppc4xx_sdram.c   | 61 ++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 20 ++++++-------
 3 files changed, 69 insertions(+), 74 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f737dbb3d6..c1d111465d 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -23,73 +23,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "cpu.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
-/*
- * Split RAM between SDRAM banks.
- *
- * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
- * and must be 0-terminated.
- *
- * The 4xx SDRAM controller supports a small number of banks, and each bank
- * must be one of a small set of sizes. The number of banks and the supported
- * sizes varies by SoC.
- */
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[])
-{
-    ram_addr_t size_left = memory_region_size(ram);
-    ram_addr_t base = 0;
-    ram_addr_t bank_size;
-    int i;
-    int j;
-
-    for (i = 0; i < nr_banks; i++) {
-        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
-            bank_size = sdram_bank_sizes[j];
-            if (bank_size <= size_left) {
-                char name[32];
-
-                ram_banks[i].base = base;
-                ram_banks[i].size = bank_size;
-                base += bank_size;
-                size_left -= bank_size;
-                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
-                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
-                                         ram_banks[i].base, ram_banks[i].size);
-                break;
-            }
-        }
-        if (!size_left) {
-            /* No need to use the remaining banks. */
-            break;
-        }
-    }
-
-    if (size_left) {
-        ram_addr_t used_size = memory_region_size(ram) - size_left;
-        GString *s = g_string_new(NULL);
-
-        for (i = 0; sdram_bank_sizes[i]; i++) {
-            g_string_append_printf(s, "%" PRIi64 "%s",
-                                   sdram_bank_sizes[i] / MiB,
-                                   sdram_bank_sizes[i + 1] ? ", " : "");
-        }
-        error_report("at most %d bank%s of %s MiB each supported",
-                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
-        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
-            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
-
-        g_string_free(s, true);
-        exit(EXIT_FAILURE);
-    }
-}
-
 /*****************************************************************************/
 /* MAL */
 
diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index d88363bc3d..62ef7d8f0d 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -43,6 +43,67 @@
 /*****************************************************************************/
 /* Shared functions */
 
+/*
+ * Split RAM between SDRAM banks.
+ *
+ * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
+ * and must be 0-terminated.
+ *
+ * The 4xx SDRAM controller supports a small number of banks, and each bank
+ * must be one of a small set of sizes. The number of banks and the supported
+ * sizes varies by SoC.
+ */
+static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
+                               Ppc4xxSdramBank ram_banks[],
+                               const ram_addr_t sdram_bank_sizes[])
+{
+    ram_addr_t size_left = memory_region_size(ram);
+    ram_addr_t base = 0;
+    ram_addr_t bank_size;
+    int i;
+    int j;
+
+    for (i = 0; i < nr_banks; i++) {
+        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
+            bank_size = sdram_bank_sizes[j];
+            if (bank_size <= size_left) {
+                char name[32];
+
+                ram_banks[i].base = base;
+                ram_banks[i].size = bank_size;
+                base += bank_size;
+                size_left -= bank_size;
+                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
+                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
+                                         ram_banks[i].base, ram_banks[i].size);
+                break;
+            }
+        }
+        if (!size_left) {
+            /* No need to use the remaining banks. */
+            break;
+        }
+    }
+
+    if (size_left) {
+        ram_addr_t used_size = memory_region_size(ram) - size_left;
+        GString *s = g_string_new(NULL);
+
+        for (i = 0; sdram_bank_sizes[i]; i++) {
+            g_string_append_printf(s, "%" PRIi64 "%s",
+                                   sdram_bank_sizes[i] / MiB,
+                                   sdram_bank_sizes[i + 1] ? ", " : "");
+        }
+        error_report("at most %d bank%s of %s MiB each supported",
+                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
+        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
+            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
+
+        g_string_free(s, true);
+        exit(EXIT_FAILURE);
+    }
+}
+
 static void sdram_bank_map(Ppc4xxSdramBank *bank)
 {
     memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 10c6dd535f..f8c86e09ec 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,18 +29,6 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-typedef struct {
-    MemoryRegion ram;
-    MemoryRegion container; /* used for clipping */
-    hwaddr base;
-    hwaddr size;
-    uint32_t bcr;
-} Ppc4xxSdramBank;
-
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[]);
-
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
 /*
@@ -111,6 +99,14 @@ struct Ppc4xxEbcState {
 };
 
 /* SDRAM DDR controller */
+typedef struct {
+    MemoryRegion ram;
+    MemoryRegion container; /* used for clipping */
+    hwaddr base;
+    hwaddr size;
+    uint32_t bcr;
+} Ppc4xxSdramBank;
+
 #define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
 #define SDR0_DDR0_DDRM_DDR1       0x20000000
 #define SDR0_DDR0_DDRM_DDR2       0x40000000
-- 
2.30.4


