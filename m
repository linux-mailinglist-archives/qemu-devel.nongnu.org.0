Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBE6699B4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:14:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmr-00014h-Mu; Fri, 13 Jan 2023 09:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-00010X-Lk
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmS-0003gJ-UV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso17439186wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M+xwFgGZEh0D/hoAK84xuNGNVlgbA1ZKtrhZxue+uNk=;
 b=I3aOgn6j6cR6tKag441/6+uB0GKnt4NtE1VjFc8fTlFSg6Hp3MLKujDi2O3+F/cTHc
 nc8BujmM7evveVJOjvYnOx+jHH0ukHW/0hv+zNHYijsOMjN/UGTDDDDw2IGKNwDVQEF+
 HFfynHGzYgm94LgjXdi4RHfJT0wVA6ajCE7jSpp9Gzt00Eq7Le9mVIVviHE72gvVmrZ8
 RLFBeHdxD4XXAUn33JI1acu6TAfSbTCH4nVFW2qLJer6FM96omzD8qQhumOLH5zLfkkF
 mZN+ifh+VABC7je0U3jrnx93bLkzM4JvvMpFMNgRDVeugZ1zH/l4l1Eluh/7Of/5LVBQ
 K3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+xwFgGZEh0D/hoAK84xuNGNVlgbA1ZKtrhZxue+uNk=;
 b=hBLHJy4AOWmTvkg/MPnojc/P9f+o7Gmk3Bul+R5efxxNGhRdX24HPDB9L3aKKGK8+E
 ETjf2nxw2hziDuxDsULwrw8qxt9jI1zSQe50y/NawI2R3F21WD0ZpOBmLc2FMUJOcJKO
 cxB7aP33a7DBpZKhGGohwp/u7yp31xfY6tKJcSHbrP+k3ApEfNLVIEB+TFaQdKRZkFEO
 dMS5LmR/2GdJls6aXw9Qy05unqtdu5F3LIkS/CI4j4lYwO+EoGtbL0vINPUTiB7ApYWW
 Lv1ZgibhumIP43baWugwOkeVWQmWqfdkpc6uXziy30yagMmUN722Q1fXYpXMvOXO35Pk
 cMwA==
X-Gm-Message-State: AFqh2krawN2j+uhCuOIAGYvGX3BEDkLuvysNHK/198islLTQPxJaLdCx
 vQIfmBuSrmAJuE3L3ENi9ji75ooaLUP8mjyk
X-Google-Smtp-Source: AMrXdXs3O4xXrFXlu3akFqW8EoYiRKZa9O5tL8PoqJ8MSxcTt62r3gGFGh/0H6v26YYSHdvC2T+piA==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a42d with SMTP id
 hg26-20020a05600c539a00b003d9efe8a42dmr14764050wmb.21.1673619099451; 
 Fri, 13 Jan 2023 06:11:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/38] hw/arm/collie: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:01 +0000
Message-Id: <20230113141126.535646-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IEC binary prefixes ease code review: the unit is explicit.

Add definitions for RAM / Flash / Flash blocksize.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/collie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e27932..d59c376e601 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -20,6 +20,10 @@
 #include "cpu.h"
 #include "qom/object.h"
 
+#define RAM_SIZE            (512 * MiB)
+#define FLASH_SIZE          (32 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 struct CollieMachineState {
     MachineState parent;
 
@@ -31,7 +35,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CollieMachineState, COLLIE_MACHINE)
 
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
-    .ram_size = 0x20000000,
+    .ram_size = RAM_SIZE,
 };
 
 static void collie_init(MachineState *machine)
@@ -52,14 +56,14 @@ static void collie_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
+    pflash_cfi01_register(SA_CS0, "collie.fl1", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", 0x02000000,
+    pflash_cfi01_register(SA_CS1, "collie.fl2", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
@@ -75,7 +79,7 @@ static void collie_machine_class_init(ObjectClass *oc, void *data)
     mc->init = collie_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("sa1110");
-    mc->default_ram_size = 0x20000000;
+    mc->default_ram_size = RAM_SIZE;
     mc->default_ram_id = "strongarm.sdram";
 }
 
-- 
2.34.1


