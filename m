Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18D67E946
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSh-0006ZQ-Ta; Fri, 27 Jan 2023 10:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSX-0006Lf-0p
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:09 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0007jJ-2o
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so3723545wms.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yN/IgYT7Bxizcp4NnY3jkl6JyQXTtY8B5IgNc586Emg=;
 b=UAsixQwzgDyNIcVfWpUt1IExJTdgLVxEQM++00szC9M3dgomol8l+EKRsv+VEWGyHA
 dEF6gWNQt4u25ymCvtvtwnZqgrdj8/5V2htCBUSrGS/rpuG+zprq207t0Lm0hfEQqw0P
 VMHEKz2jDbS9lK8UT9TAgWuHOeVBONylvkfOfw78vgefYYV8nR6azgjkL0+oSXmI4e2v
 9MUBkAKyLY6EFdtsKcCVvGBCJXyEdnBUaBTaWrvqVuADtBu1HuCvgZ9wbHMBzCoF6Qa1
 ofTakgFOIASDxfaGDDl2rBDE1NOCY0UreQ+XqICGeis5lny8ye6OXdg/eP6IM/okwE7Y
 ziCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yN/IgYT7Bxizcp4NnY3jkl6JyQXTtY8B5IgNc586Emg=;
 b=cKIhygl8oqM6uL89zckzM8tAe4zeY2GFNAagOIy611fcC5dp+cVj+B1LVuEa4DZlQ+
 gVkcamqCp0sm/IlnpPll4oZvi7FxhvzbDtbIrfiXyvUGypuejwaB60K4aWBMZ0Mxp2I9
 UlzoFA0+GhQUeNaxgAla6oB5v+m3ETWaGfGWjLDU7/WewuN9nGmtnXT1ubDxh2nSVytJ
 Mt1KYEd4jQ0UdSsPdcWd+QGO0sgo1nQ1gFLDvr5Lb3avboztvIEQn960TcjaYPFrMEL4
 BQaWDdT4jbcbA7bFGnHeNIFZATXMIvF4L9NVT7fo9Q6wGbYYZGLBhl/d6TtOCB9rarM/
 F21g==
X-Gm-Message-State: AFqh2kqREBsylJecxGSHpq3HdG1KahwWt3AwJ9YTrUYWIisVuBBYCXzW
 psc7zv4EzmVvrJlgTkdVpB599g==
X-Google-Smtp-Source: AMrXdXsGCl71/OUR43H8df4O6Jk1VGJQyA/zIETEzCmiuAC0gZNrO0vzJT8cEtddK2NOBpci8oXUTQ==
X-Received: by 2002:a05:600c:1d8e:b0:3d1:ebdf:d586 with SMTP id
 p14-20020a05600c1d8e00b003d1ebdfd586mr38542105wms.29.1674832562907; 
 Fri, 27 Jan 2023 07:16:02 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:02 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 09/16] hw/arm/boot: Populate realm memory with boot images
Date: Fri, 27 Jan 2023 15:07:22 +0000
Message-Id: <20230127150727.612594-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When using the Arm RME, register the images to be loaded into Realm
memory at boot. Two operations are needed for each image:
(1) INIT_IPA_REALM: mark the load addresses (IPA) as RAM with
    RMI_RTT_INIT_RIPAS.
(2) POPULATE_REALM: move the page into the Realm with RMI_DATA_CREATE.
    Its content contributes to the initial measurement.

The reason we separate (1) from (2) is that we may need to declare more
RAM than the image size. In particular booting arm64 Linux requires
reserving additional BSS space after the loaded image.

We could declare the whole guest RAM with INIT_IPA_REALM, though that
might be wasteful in terms of stage-2 mappings if the guest is not going
to use all that RAM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/boot.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 15c2bf1867..115d3f5dcc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "kvm_arm.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -192,9 +193,11 @@ static void write_bootloader(const char *name, hwaddr addr,
         code[i] = tswap32(insn);
     }
 
-    assert((len * sizeof(uint32_t)) < BOOTLOADER_MAX_SIZE);
+    len *= sizeof(uint32_t);
+    assert(len < BOOTLOADER_MAX_SIZE);
 
-    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
+    rom_add_blob_fixed_as(name, code, len, addr, as);
+    kvm_arm_rme_add_blob(addr, len, len);
 
     g_free(code);
 }
@@ -683,6 +686,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    kvm_arm_rme_add_blob(addr, size, size);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
@@ -964,6 +968,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
 
     *entry = mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
+    kvm_arm_rme_add_blob(*entry, size, kernel_size);
 
     g_free(buffer);
 
@@ -1119,6 +1124,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
             initrd_size = 0;
         }
         info->initrd_size = initrd_size;
+        kvm_arm_rme_add_blob(info->initrd_start, initrd_size, initrd_size);
 
         fixupcontext[FIXUP_BOARDID] = info->board_id;
         fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
-- 
2.39.0


