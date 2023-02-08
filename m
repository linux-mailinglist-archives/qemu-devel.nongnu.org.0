Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7368F991
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrkU-0000mb-RY; Wed, 08 Feb 2023 16:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkT-0000mG-6c
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkR-0007xA-Es
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d88wFZ2mo/0imCYZRYbYiUssCRrNIVVmiSofCMtgJ24=;
 b=i+Dte1+KTwDdiVjZh9bsFTzyMcF6DSJO94CUvdhx8Rtf4u8b4UIut0kONJO0OCIMD6yB7T
 OVsMRnO0GpQugbJlFD/rkg64wTDEwjvH5dVFsq+QiEO/dNiCbkbIbucR8OH+L7P519ZM1I
 EcOkMfT0qdFeXMSBaVYCkV2ebsQ5lcs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-dR2kufrdPsypl1v658DwtQ-1; Wed, 08 Feb 2023 16:12:57 -0500
X-MC-Unique: dR2kufrdPsypl1v658DwtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so51091wmb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d88wFZ2mo/0imCYZRYbYiUssCRrNIVVmiSofCMtgJ24=;
 b=nfzWUeuZNzqKXb46w4WW5wSZ1zEMDBVDUZRgWXWjGCyu0A1nMeeaZW9WC5aCO2wxGF
 g7qbXY11NlpFDAg2ZfwpYTopBrEBYmJXqzvbUaudUVkKXaxuqkhgZNA0c4xtVyZJTZA9
 ygvkV168IdrwXqDvMjOoPrbRto1s+FqONOxThq1t1xh0dLIx6WyoV6Hq9SrSqx9Op3no
 dkyw6y+Y0f04fZ3sugx2l1Ilne+P1vRZtNR/NutjlK/E/uc48j/PfjCVSWvqu1Jx8p39
 0bIRifAukBYuxFyxp26o7dbt5xPomNSLWJo3vyxXh8dXTBMUSgKN+/8FE9bdcErUMaCH
 1UFA==
X-Gm-Message-State: AO0yUKV43V1HvGQK0XDy9Vi6lzPlFOXftyQG/cYLFxwwSGvoPg3jxJYY
 UD6zinDsuvuSUWkqaSACVdiv2rhOwSpZNdLqHLn9P8nksJ8b/iRB92aaG456ved/kH7hXYvURRl
 KNrnwppwpWuT2yaoszcOoUIx/pqiUykNAFl5GeRl6f/eZntUdU0VUyND2Zgm1j2LA38Gw
X-Received: by 2002:a5d:488b:0:b0:2c3:daf1:ec3 with SMTP id
 g11-20020a5d488b000000b002c3daf10ec3mr8376256wrq.61.1675890775939; 
 Wed, 08 Feb 2023 13:12:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+igEz+8dGMfAGcBhjW48G3LU/ELPOe8gmvLXjBts0ZxATjRj3035BnQWK5uF+zCZ7Igv1FLA==
X-Received: by 2002:a5d:488b:0:b0:2c3:daf1:ec3 with SMTP id
 g11-20020a5d488b000000b002c3daf10ec3mr8376226wrq.61.1675890775626; 
 Wed, 08 Feb 2023 13:12:55 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 c12-20020adffb4c000000b002b6bcc0b64dsm14397944wrs.4.2023.02.08.13.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:55 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH RFC 6/7] Revert "x86: return modified setup_data only if read
 as memory, not as file"
Message-ID: <20230208211212.41951-7-mst@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


