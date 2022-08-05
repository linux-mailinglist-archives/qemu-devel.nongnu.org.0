Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB98358A908
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:53:09 +0200 (CEST)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu0y-0006Mx-Oy
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoH-0007SH-GU
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:01 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoE-0001RO-Ev
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:01 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id c22so994119vko.7
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=L4TUkDvLOTrmsvqmV/R+O0UADQGB40cLKBf4CYlSw1k=;
 b=PV9c63oKZk72v0DwutDQTXJvA6qfYn/uoWmsw/bTZP116sNeB6YTM7ts8vOWtlQiaH
 cPNyEDejRT/+q4wYXfYab76t3gHTEcy4+18pdCeRIzVbbl5Y/vnD8Y/Nq1emmSDzJcWw
 0c+GNRvR9unrAJVnSbq38tzt9crGLWj3jko+GQ9T/QeNO7mMjUUdyMpGmVwOg3TrouBh
 mV6IECWesBU3bMfIeEHjG5KlexvzvH+mpcyshMQmAKxHxrJQwr0vDa9dzW/d6syVjQGh
 fwpojBl6JJMZ6lqVEYMNlR7L9utuE09dE//nkvTcWEIVUnHK9D0uXSHlg531Xi8upaM7
 htgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L4TUkDvLOTrmsvqmV/R+O0UADQGB40cLKBf4CYlSw1k=;
 b=HAu/tvPzt+WNqZZ9b3wbpo1xSdu1SOi4eQtNvASlmx0vYf+6K1VcRclqBd6wqirlHz
 LuH/zRIffnlmu0PRdyS7hOHkCPqp3aXI630LvI7n0nX/zLin7QhRNTte4QQ9774258oN
 ZHO7phfH4TlfUpRRZlD0mzNa/ikkV14c5T+9k73crzgbC4cYLnqvexvGlM72AtGzXZix
 UMHXNTjOGNM8S3V87pet9XNVxN2RAEu7OaD9PeDjqB3RWpK19tSUaIeYnbVNzYGmJPBz
 1wkHDLc/tENRFmRUZTCZ8FfWz4V5uGg/GHdZUop9RGr4yd3We3FM2nlIMS7n1703wIb+
 qJUg==
X-Gm-Message-State: ACgBeo3uTONDXE4tu1X77Pf1BTKarvLpJTggxf5JQ6FEitb6CmOr2k3C
 55fRaWAx+kTiicB+v/sv/bsuO3BMFn0=
X-Google-Smtp-Source: AA6agR5dYF496mR3IwA8/2IPYq5WxS1H44PBSji+VbGWF91L/TLSYXskIoF3OU3SOGn6G/f86UTZFw==
X-Received: by 2002:a1f:4ac4:0:b0:378:397d:c292 with SMTP id
 x187-20020a1f4ac4000000b00378397dc292mr2404512vka.1.1659692397201; 
 Fri, 05 Aug 2022 02:39:57 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:39:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v2 02/20] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Fri,  5 Aug 2022 06:39:30 -0300
Message-Id: <20220805093948.82561-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
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
 hw/microblaze/boot.c      | 13 ++++++++++++-
 hw/microblaze/meson.build |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..001cdefd5c 100644
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
@@ -100,7 +103,15 @@ static int microblaze_load_dtb(hwaddr addr,
     }
 
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     */
+    fdt_pack(fdt);
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
2.36.1


