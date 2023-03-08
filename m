Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4A46B0FDB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:08:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8U-0004k1-Bb; Wed, 08 Mar 2023 11:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8G-0004Xd-BJ; Wed, 08 Mar 2023 11:59:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8D-00045e-Vp; Wed, 08 Mar 2023 11:59:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2B21E40109;
 Wed,  8 Mar 2023 19:58:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E05071FD;
 Wed,  8 Mar 2023 19:58:35 +0300 (MSK)
Received: (nullmailer pid 2098340 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 31/47] Revert "x86: return modified setup_data only if read as
 memory, not as file"
Date: Wed,  8 Mar 2023 19:57:34 +0300
Message-Id: <20230308165815.2098148-31-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Michael S. Tsirkin" <mst@redhat.com>

This reverts commit e935b735085dfa61d8e6d276b6f9e7687796a3c7.

Fixes: e935b73508 ("x86: return modified setup_data only if read as memory, not as file")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit ae80d81cfa865cbe443543679e013e7fa5fcd12c)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/x86.c             | 46 +++++++++------------------------------
 hw/nvram/fw_cfg.c         | 12 +++++-----
 include/hw/nvram/fw_cfg.h | 22 -------------------
 3 files changed, 16 insertions(+), 64 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 76b12108b4..4831193c86 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -37,7 +37,6 @@
 #include "sysemu/whpx.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
-#include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/xen.h"
@@ -769,24 +768,6 @@ static bool load_elfboot(const char *kernel_filename,
     return true;
 }
 
-typedef struct SetupDataFixup {
-    void *pos;
-    hwaddr orig_val, new_val;
-    uint32_t addr;
-} SetupDataFixup;
-
-static void fixup_setup_data(void *opaque)
-{
-    SetupDataFixup *fixup = opaque;
-    stq_p(fixup->pos, fixup->new_val);
-}
-
-static void reset_setup_data(void *opaque)
-{
-    SetupDataFixup *fixup = opaque;
-    stq_p(fixup->pos, fixup->orig_val);
-}
-
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1111,11 +1092,8 @@ void x86_load_linux(X86MachineState *x86ms,
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
     }
 
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
-    sev_load_ctx.kernel_data = (char *)kernel;
-    sev_load_ctx.kernel_size = kernel_size;
+    /* Offset 0x250 is a pointer to the first setup_data link. */
+    stq_p(header + 0x250, first_setup_data);
 
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
@@ -1125,20 +1103,16 @@ void x86_load_linux(X86MachineState *x86ms,
      * file the user passed in.
      */
     if (!sev_enabled()) {
-        SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
-
         memcpy(setup, header, MIN(sizeof(header), setup_size));
-        /* Offset 0x250 is a pointer to the first setup_data link. */
-        fixup->pos = setup + 0x250;
-        fixup->orig_val = ldq_p(fixup->pos);
-        fixup->new_val = first_setup_data;
-        fixup->addr = cpu_to_le32(real_addr);
-        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup_data, NULL,
-                                  fixup, &fixup->addr, sizeof(fixup->addr), true);
-        qemu_register_reset(reset_setup_data, fixup);
-    } else {
-        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     }
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
     sev_load_ctx.setup_data = (char *)setup;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 6edf5ea3e9..371a45dfe2 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -693,12 +693,12 @@ static const VMStateDescription vmstate_fw_cfg = {
     }
 };
 
-void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
-                               FWCfgCallback select_cb,
-                               FWCfgWriteCallback write_cb,
-                               void *callback_opaque,
-                               void *data, size_t len,
-                               bool read_only)
+static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
+                                      FWCfgCallback select_cb,
+                                      FWCfgWriteCallback write_cb,
+                                      void *callback_opaque,
+                                      void *data, size_t len,
+                                      bool read_only)
 {
     int arch = !!(key & FW_CFG_ARCH_LOCAL);
 
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 2e503904dc..c1f81a5f13 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -117,28 +117,6 @@ struct FWCfgMemState {
  */
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
 
-/**
- * fw_cfg_add_bytes_callback:
- * @s: fw_cfg device being modified
- * @key: selector key value for new fw_cfg item
- * @select_cb: callback function when selecting
- * @write_cb: callback function after a write
- * @callback_opaque: argument to be passed into callback function
- * @data: pointer to start of item data
- * @len: size of item data
- * @read_only: is file read only
- *
- * Add a new fw_cfg item, available by selecting the given key, as a raw
- * "blob" of the given size. The data referenced by the starting pointer
- * is only linked, NOT copied, into the data structure of the fw_cfg device.
- */
-void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
-                               FWCfgCallback select_cb,
-                               FWCfgWriteCallback write_cb,
-                               void *callback_opaque,
-                               void *data, size_t len,
-                               bool read_only);
-
 /**
  * fw_cfg_add_string:
  * @s: fw_cfg device being modified
-- 
2.30.2


