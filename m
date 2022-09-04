Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1F5AC825
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:39:36 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzDC-0004n4-H6
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8w-0006k9-8P; Sun, 04 Sep 2022 19:35:11 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8u-0004ym-KJ; Sun, 04 Sep 2022 19:35:09 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11e9a7135easo18033797fac.6; 
 Sun, 04 Sep 2022 16:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=ezDiH1ekEb4Ezv9oCmBJ046+XsPeXkBgQxnjLN8zOj+RCkgyhMZs9E1hJp6SNPcmoL
 vr9mBPaL9tbTPgNKDTG7ssipoYLOkzTNxsKdo+kdx0+xRKip+yVI4eXzNzHiW9+reTCp
 27jVu7gRiQboZVODcFt9+fDurYtRHEGRLdFIslOr0LO2iRdXdoO36+yww25dn3PmOJbA
 VTLrb5g4MRlekO58717kJz0QCYVhJNx0uGcA0Z1qKmJmnWC1K3Ifm/hG/p418OoD8f7N
 vUxSQVs8v9vJNQnq5NuPNkSjSwuCH5S4OwpsYYGvHQfUvwQg5YKlXbgScs//LAKxlrcu
 1naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=waMzy7bQxQ0rx7Y7Q40bRX8y/eLId5MxolU0dBhhD2QUcXiWDX1PrUc4OtoWKlsLuk
 zH4fTaslIe2nSPpdYvrCc1WtIw4mWbxBYn77YRCj7umarGkIIFt+VIdtdRDYT2eqHiyE
 zK9WKMP/eNCRb/y82Lp96UAvCeGM2hftcB0RE2m7HwYKDAwAuDvoHclHkOkHMRFwsxCG
 h4SiW0foTXCaDc246izHFpC0v1bWvEHIeYNvlC4a0cvk9Wq67UPyZ0smX24LhV6Iq0+H
 URAw/at8yfIe5KZEQFdEpPFh/6O8UDZVu5s6oBCebEsWwQGm7U6knTcKepr9ArALvkGC
 vS2A==
X-Gm-Message-State: ACgBeo25XzZjQ0o9Shza7g9fL3GvgLDYhz9dV8Y2xDEP1HbExViOWV1E
 xZ6EkkMaWngMDGe7zIyEPc4YwUDVo9EQWg==
X-Google-Smtp-Source: AA6agR7V7Uvo+UrzBd+2ZN0spGZkyi/AMiqqY0BWCU5h8ZrTO/N8ZmqsfgatrYFWsnwXtuvUt257zw==
X-Received: by 2002:a05:6871:96:b0:11d:ca1b:db19 with SMTP id
 u22-20020a056871009600b0011dca1bdb19mr8076282oaa.74.1662334506968; 
 Sun, 04 Sep 2022 16:35:06 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v6 02/14] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Sun,  4 Sep 2022 20:34:44 -0300
Message-Id: <20220904233456.209027-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
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


