Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96625B2712
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:46:10 +0200 (CEST)
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNTV-00078V-PC
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOQ-0004Nr-OV; Thu, 08 Sep 2022 15:40:54 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOP-0007BU-7E; Thu, 08 Sep 2022 15:40:54 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-127ba06d03fso23619623fac.3; 
 Thu, 08 Sep 2022 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=mRBWZOXszv3PJiTPz8GzErhrqs4Dxe/RzCa+JPBp4NubiFz1f+GvgGSOtpYUy1Nga7
 L2ZBQ2r+6cYI//5bqvOypkbZWXf5r9zhyCMhjbBCJ8u+fv786svc/ehCX5LpH3ka8jqN
 7UMuswzSzcQGqTo26oHQGEBDHDc1bPhlv+zYNCJ6q9xsqijF35FFImX/IPZtPgHNEcxp
 o97BcNcInSrEIYfdcO86J3L9dHktbYry/KO2DM//LZZAqaS3H1EtChm70VNx/IsNPlRu
 2YXL5h/UNgdI9U/SKb5jzDuD9MmuTM2fL8C9jpw00eNNgWIrSaX47MOBYNE8W0CJBHr7
 hdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=UgvvxVchJWl6dmeQYxmIGxDaRVPOnqAiEpAvsuQfwpK8Df6Z7XIEy1ZjwloKZKdSPd
 DA1kRfu8EJ8yJaXVIlyYhL8w4FQBO12QuGIfGXnYYn1b76NdU1BUqhvYTpMZtUcviy1p
 1YVgnJLqYQPwUbdROpFpfJ/D5DEV7AxIAHkeDGd5BLgFKteZ/zq6h/S+CpY9Vk06zSlN
 uvFaN2qstvssGUUIZTsSlNBCuD5ptUmY+JX2IiXfHU+W1wY8rYBZvei2CN3AfSNSwwCL
 MP5jvj4nZx0Ap3Wh2EmvuiCZX8jRTjrpiRgZBhOxx1Xn6CaWTJMTnJY7u+JN/pHIr2u/
 q1nQ==
X-Gm-Message-State: ACgBeo3KyP3NQ/jlkduWedY6ObPMB4e73rBxOpeCsYErvd1UY7Mt70PF
 LxS3TKMe67oHEuVTyA6qtyUyVPIyq//Lzw==
X-Google-Smtp-Source: AA6agR6FzHoXlDeS73YNoU0u0L9XEYM50cU+/s/e++V7pHNL3VLYSyLAUswSBBpkeCN1iN868DKrpA==
X-Received: by 2002:a05:6870:a188:b0:126:444d:743d with SMTP id
 a8-20020a056870a18800b00126444d743dmr2696054oaf.111.1662666051256; 
 Thu, 08 Sep 2022 12:40:51 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v7 02/14] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Thu,  8 Sep 2022 16:40:28 -0300
Message-Id: <20220908194040.518400-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for all
microblaze machines that uses microblaze_load_dtb().

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/microblaze/boot.c      | 8 +++++++-
 hw/microblaze/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..c8eff7b6fc 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -39,6 +39,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 static struct
 {
     void (*machine_cpu_reset)(MicroBlazeCPU *);
@@ -72,6 +74,7 @@ static int microblaze_load_dtb(hwaddr addr,
                                const char *kernel_cmdline,
                                const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -100,7 +103,10 @@ static int microblaze_load_dtb(hwaddr addr,
     }
 
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/microblaze/meson.build b/hw/microblaze/meson.build
index bb9e4eb8f4..a38a397872 100644
--- a/hw/microblaze/meson.build
+++ b/hw/microblaze/meson.build
@@ -1,5 +1,5 @@
 microblaze_ss = ss.source_set()
-microblaze_ss.add(files('boot.c'))
+microblaze_ss.add(files('boot.c'), fdt)
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_S3ADSP1800', if_true: files('petalogix_s3adsp1800_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_ML605', if_true: files('petalogix_ml605_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-zynqmp-pmu.c'))
-- 
2.37.2


