Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787475BFB21
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:39:09 +0200 (CEST)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawCB-0002lk-4Q
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw58-0005fv-SG
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:50 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw56-00018S-HM
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24A5F62FBC;
 Wed, 21 Sep 2022 09:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8782AC433D6;
 Wed, 21 Sep 2022 09:31:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="m0RQuqqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663752703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uX0shotiqjytMPNgE2hEorWHBh3w0UTEi07Hek986vs=;
 b=m0RQuqqFLn5iu+oaRZ8TkSVPrMPbnzu77aX64IvlKVN7WT2Cb0zrYA5BOXUhquzUuqvIjp
 11xiqUPu9bopuKokwAM8P5yGfG5Io/7bobhq9NFphk7Gb2S2iJkVLiZ2OSRtcELi7KFBSQ
 OlP/R2xHIYXPcGb/tEueFwmuLIA8LdQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56715e08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 21 Sep 2022 09:31:43 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v5 1/4] x86: return modified setup_data only if read as memory,
 not as file
Date: Wed, 21 Sep 2022 11:31:31 +0200
Message-Id: <20220921093134.2936487-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

If setup_data is being read into a specific memory location, then
generally the setup_data address parameter is read first, so that the
caller knows where to read it into. In that case, we should return
setup_data containing the absolute addresses that are hard coded and
determined a priori. This is the case when kernels are loaded by BIOS,
for example. In contrast, when setup_data is read as a file, then we
shouldn't modify setup_data, since the absolute address will be wrong by
definition. This is the case when OVMF loads the image.

This allows setup_data to be used like normal, without crashing when EFI
tries to use it.

(As a small development note, strangely, fw_cfg_add_file_callback() was
exported but fw_cfg_add_bytes_callback() wasn't, so this makes that
consistent.)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c             | 46 ++++++++++++++++++++++++++++++---------
 hw/nvram/fw_cfg.c         | 12 +++++-----
 include/hw/nvram/fw_cfg.h | 22 +++++++++++++++++++
 3 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..96d205927e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -37,6 +37,7 @@
 #include "sysemu/whpx.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
+#include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/xen.h"
@@ -764,6 +765,24 @@ static bool load_elfboot(const char *kernel_filename,
     return true;
 }
 
+typedef struct SetupDataFixup {
+    void *pos;
+    hwaddr orig_val, new_val;
+    uint32_t addr;
+} SetupDataFixup;
+
+static void fixup_setup_data(void *opaque)
+{
+    SetupDataFixup *fixup = opaque;
+    stq_p(fixup->pos, fixup->new_val);
+}
+
+static void reset_setup_data(void *opaque)
+{
+    SetupDataFixup *fixup = opaque;
+    stq_p(fixup->pos, fixup->orig_val);
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1088,8 +1107,11 @@ void x86_load_linux(X86MachineState *x86ms,
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
     }
 
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
 
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
@@ -1099,16 +1121,20 @@ void x86_load_linux(X86MachineState *x86ms,
      * file the user passed in.
      */
     if (!sev_enabled()) {
+        SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
+
         memcpy(setup, header, MIN(sizeof(header), setup_size));
+        /* Offset 0x250 is a pointer to the first setup_data link. */
+        fixup->pos = setup + 0x250;
+        fixup->orig_val = ldq_p(fixup->pos);
+        fixup->new_val = first_setup_data;
+        fixup->addr = cpu_to_le32(real_addr);
+        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup_data, NULL,
+                                  fixup, &fixup->addr, sizeof(fixup->addr), true);
+        qemu_register_reset(reset_setup_data, fixup);
+    } else {
+        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     }
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
-    sev_load_ctx.kernel_data = (char *)kernel;
-    sev_load_ctx.kernel_size = kernel_size;
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
     sev_load_ctx.setup_data = (char *)setup;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index d605f3f45a..564bda3395 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -692,12 +692,12 @@ static const VMStateDescription vmstate_fw_cfg = {
     }
 };
 
-static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
-                                      FWCfgCallback select_cb,
-                                      FWCfgWriteCallback write_cb,
-                                      void *callback_opaque,
-                                      void *data, size_t len,
-                                      bool read_only)
+void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
+                               FWCfgCallback select_cb,
+                               FWCfgWriteCallback write_cb,
+                               void *callback_opaque,
+                               void *data, size_t len,
+                               bool read_only)
 {
     int arch = !!(key & FW_CFG_ARCH_LOCAL);
 
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 0e7a8bc7af..e4fef393be 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -117,6 +117,28 @@ struct FWCfgMemState {
  */
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
 
+/**
+ * fw_cfg_add_bytes_callback:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ * @select_cb: callback function when selecting
+ * @write_cb: callback function after a write
+ * @callback_opaque: argument to be passed into callback function
+ * @data: pointer to start of item data
+ * @len: size of item data
+ * @read_only: is file read only
+ *
+ * Add a new fw_cfg item, available by selecting the given key, as a raw
+ * "blob" of the given size. The data referenced by the starting pointer
+ * is only linked, NOT copied, into the data structure of the fw_cfg device.
+ */
+void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
+                               FWCfgCallback select_cb,
+                               FWCfgWriteCallback write_cb,
+                               void *callback_opaque,
+                               void *data, size_t len,
+                               bool read_only);
+
 /**
  * fw_cfg_add_string:
  * @s: fw_cfg device being modified
-- 
2.37.3


