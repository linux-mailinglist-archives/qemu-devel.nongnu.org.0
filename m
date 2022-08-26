Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E75A292F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:17:07 +0200 (CEST)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRa8w-0006JA-RQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4D-0007cQ-4L; Fri, 26 Aug 2022 10:12:13 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa43-0003qH-V1; Fri, 26 Aug 2022 10:12:12 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11e86b7379dso924494fac.10; 
 Fri, 26 Aug 2022 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=j1RYsPISHcQmqkfg0bCXBflgdHOzA77Z6HtOczxpsOA=;
 b=SV+1hPN5vfdPYqYnEbsFUdulxGd6hv//jAJqny0cgLkZAqe309mR5VESbcSyEAELeB
 32zikRo1bnVJWueEJnIJl9OjVo8q6PfybbEYdCWYZJ5VyrJVDLlmUudjr4gUnxvZzP9k
 DgDdgRt2Qfer+FvS1hrNynoKDRjSrPHbut7JUIkApiU4/JByTKRjQ2D8L4t758EsgdLx
 2SYXz/GFsXwS+lpMXkDqwtLkSqVJg+Qz8+fJvBlNbmADoLmk9DCuLleQ7kwAlpwjjn2R
 xCHOCLkFPeXv4roZabDo8NZ36wWELhndXMFuFJQmhQjD9if9TKwCUCCzvobYhbeWp5It
 2s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=j1RYsPISHcQmqkfg0bCXBflgdHOzA77Z6HtOczxpsOA=;
 b=BRwTqVesBRFWExDBcWGVPd9ICVsHtSmAzVKjDNbsW+EUiiFFD6PezwFA1h8FhArSmn
 jb4qBBfaDxBTkKewpxf3b/Om30k0C30eM1vCYg7jFCLCMS++7QGpWIMie2veQ6QA7+Z2
 kPMUVLCfZfOuFhORj48j3K0T1HCmFKMWMhTQTHAqHabE0oamz1VbfzT6lhG+BcJwMvgm
 CniDTicFE42iweiwahsOKZyC4gGyGBDZNr2JMKzsEqYLJMbkqNBvwJV/8+kh3HJJ+iiP
 5HEIODXn1T5n/YxkJwj+ETWmjEqKfFbQ1L+RQRrDSHz86wbpMV5I0VTx22nBe/0MupTU
 sKHQ==
X-Gm-Message-State: ACgBeo1yzRNdh9ZVxcPVIM5BuBjSNqMjDgxUpZLGB/z3y29Fs6LZawnL
 MwQy5g/K665MFaw9lrrHUmcdv27k+iw=
X-Google-Smtp-Source: AA6agR74VKXjELPAWCyRXlmKH1A14sZCFuSy0heZEfmTMfyrxp02y1Cq9wBqneX/RkDwvxaCgPMVAA==
X-Received: by 2002:a05:6870:c14a:b0:11d:588:da3a with SMTP id
 g10-20020a056870c14a00b0011d0588da3amr1889262oad.214.1661523121982; 
 Fri, 26 Aug 2022 07:12:01 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v4 02/21] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Fri, 26 Aug 2022 11:11:31 -0300
Message-Id: <20220826141150.7201-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
all microblaze machines that uses microblaze_load_dtb().

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/microblaze/boot.c      | 11 ++++++++++-
 hw/microblaze/meson.build |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..e9ebc04381 100644
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
@@ -100,7 +103,13 @@ static int microblaze_load_dtb(hwaddr addr,
     }
 
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
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


