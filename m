Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D556A7CC4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFo-0002Zj-0y; Thu, 02 Mar 2023 03:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFK-0002Br-5R
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFF-0001ye-QH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSfx4EEhKWxIZHb7NirlnEOJXXkyWmFVrE3AW0rFTkI=;
 b=XY5vcgD+ONPKtDjvjVzLbpmk8wZoRceX/okVgHKyJX+DyVM8Rzw6c1aDbFXGk4tEoqgrPb
 6GCdZ0+u7MrdmPnpvPZ0JMc/5t1I/vBLOfoCUMEal+eCtQZfIF1FnTGoeCjzfeFdXDDWCs
 f6sokEjUXZxhRVQpiAHP6r3V9aiie0k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-9LLhoPA_MiKTD41DCgAR0Q-1; Thu, 02 Mar 2023 03:24:55 -0500
X-MC-Unique: 9LLhoPA_MiKTD41DCgAR0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so741496wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745494;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSfx4EEhKWxIZHb7NirlnEOJXXkyWmFVrE3AW0rFTkI=;
 b=RaASmwh/toWHafPVZZQTUAZkdNuE3SF6pX+iqi6q2XSm2/yaDwFlYTV+BoAOten8Zg
 BvQH7MOuCfW/IuOgGKV2oNWA/K+q8CeJ5tQ4GaZJM1nJZRrGanXresh2d8lqMZTuURCV
 TUqP//JvyS9yZfrGBkOtkUxED4Dun6ehneLK5YXw3B3QFvGLlWUC2UB4xSegsKEGKyrg
 LsIQLB4UC+5OSxE110KOtzYbeCSdBcRfCygQ6PoD71bMiILkLkTe5GGFY5RV+k6zYaPE
 FnMQFCCGFaTyOBgiWiqTyGIrXvPqH02ulgtEVfxMj6oIST3jZJ2wJhvoqH5T6n+GxE5W
 yHOg==
X-Gm-Message-State: AO0yUKVoQfahtPFd2DO/MuWJpcFeZd5X3fuzjXpUW1wS2hN1FMhuJTH2
 Lki30YUxg+sjqvAM59U1N9yFe0mEvFkjYuRuwLqlaWjbJeF1V97OhV0VxoFy9D2TV35+Pi5UkKg
 bUDvMT7atVxmN65akTnpx523DKM2VWgop/BNd1eMtu8htD/oM57u9LoCN+yQLSpAfqA==
X-Received: by 2002:adf:e5cf:0:b0:2c3:f00c:ebaa with SMTP id
 a15-20020adfe5cf000000b002c3f00cebaamr7052171wrn.4.1677745494018; 
 Thu, 02 Mar 2023 00:24:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9WXeNoTj+8QQmeOslswSFhGTEfZgpHGkBkfLflMdtF8DlFous1xHqiBh/IFpsx2Kr8f/UDpw==
X-Received: by 2002:adf:e5cf:0:b0:2c3:f00c:ebaa with SMTP id
 a15-20020adfe5cf000000b002c3f00cebaamr7052145wrn.4.1677745493625; 
 Thu, 02 Mar 2023 00:24:53 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 i13-20020adfe48d000000b002c5539171d1sm14818363wrm.41.2023.03.02.00.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:53 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 07/53] Revert "x86: return modified setup_data only if read as
 memory, not as file"
Message-ID: <20230302082343.560446-8-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit e935b735085dfa61d8e6d276b6f9e7687796a3c7.

Fixes: e935b73508 ("x86: return modified setup_data only if read as memory, not as file")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/nvram/fw_cfg.h | 22 -------------------
 hw/i386/x86.c             | 46 +++++++++------------------------------
 hw/nvram/fw_cfg.c         | 12 +++++-----
 3 files changed, 16 insertions(+), 64 deletions(-)

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
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 66cf171ace..ed161a3409 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -36,7 +36,6 @@
 #include "sysemu/whpx.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
-#include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/xen.h"
@@ -770,24 +769,6 @@ static bool load_elfboot(const char *kernel_filename,
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
@@ -1112,11 +1093,8 @@ void x86_load_linux(X86MachineState *x86ms,
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
@@ -1126,20 +1104,16 @@ void x86_load_linux(X86MachineState *x86ms,
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
index a00881bc64..29a5bef1d5 100644
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
 
-- 
MST


