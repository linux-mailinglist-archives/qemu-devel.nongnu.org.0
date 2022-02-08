Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DA4AD854
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:30:05 +0100 (CET)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPdE-0007Be-OF
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:30:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000l8-OB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::436] (port=41983
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-00024S-IW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id k1so13650572wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GqHfUpEsKMZLaI4jcU1cq1CuH1+qtJTC3nWZv1Haqzk=;
 b=K0wN+YP/zZgz/7LiEHTm3gMPirwjIq0cY8InoRkSQGOSUyJne4VJNTID4TOMr16ufl
 Ik7vdv4zu2qLYATwaEyOb7qRjUD+aniAhNeb1fnrJMZbcOBTb1Z536gwiqnLiQ5LjGkm
 eh7qUWyI/OymGNiA5a8hvmQvfMT9KRkv+1S30jLKVsC/sKQVHso4dUjEF3HCVZUdTgIv
 cuLPR+1dYDPFvsxpaOuEoqQIe84GPDLo7cr8LVBjywRBNvyKpSsWvDwsE2UJudo9IxpU
 QD3AXxbpj6PuYjkku8PUGBObEAXGZCBSh7rfAOEGkUgrHqOOZM82fzYCwPlY0cFB6VRi
 Squw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GqHfUpEsKMZLaI4jcU1cq1CuH1+qtJTC3nWZv1Haqzk=;
 b=GSN0ofih/E148lf/vayTjex5JmdjSosma6IB9ajPcCslNBbvaSlm2VOyxS5m3qqybO
 3ZOle0HX+Of5IDQFYRt4JKqjmSUthHJkSDsKaeZaWaTdOCY5+dvE+UXmgixCq8UnJLv/
 ap0c3Pi6VAyPZ/Qk+boKX7Zt7PlOvIMJBEAGsf2xOW+adnF5d721iVQkJzeRuo3nm+Y5
 UzqOzFaf0CgyoWJDmQMGsnzE/hQu40UmLHrczvrb19ge9F2799gxKOSFxPqGreUj90E+
 MFls5GhGm4ZqHDlq9qk8GtCgh/TCtiroPj1id+ll1d/eIBDdwiQwZIsynAfiXLrc89tt
 uZig==
X-Gm-Message-State: AOAM530JRvkRIVHdbMSGmYhHTX0ZrV0oi3jq01AfD3/LoU9K/zHgjFx+
 h0YJ7En5/kMjIzT4OllUWFi9g7XQsppFtg==
X-Google-Smtp-Source: ABdhPJzA2cqFcrhd1nOPA9waHRFwfMPMcX0e6CZCrOKAkEodyXWXe57DvTk77F0e0NY7rHmGZO4/mg==
X-Received: by 2002:adf:f981:: with SMTP id f1mr3182951wrr.651.1644320398014; 
 Tue, 08 Feb 2022 03:39:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/39] hw/arm/versal: Let boot.c handle PSCI enablement
Date: Tue,  8 Feb 2022 11:39:21 +0000
Message-Id: <20220208113948.3217356-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Instead of setting the CPU psci-conduit and start-powered-off
properties in the xlnx-versal-virt board code, set the arm_boot_info
psci_conduit field so that the boot.c code can do it.

This will fix a corner case where we were incorrectly enabling PSCI
emulation when booting guest code into EL3 because it was an ELF file
passed to -kernel.  (EL3 guest code started via -bios, -pflash, or
the generic loader was already being run with PSCI emulation
disabled.)

Note that EL3 guest code has no way to turn on the secondary CPUs
because there's no emulated power controller, but this was already
true for EL3 guest code run via -bios, -pflash, or the generic
loader.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-8-peter.maydell@linaro.org
---
 include/hw/arm/xlnx-versal.h | 1 -
 hw/arm/xlnx-versal-virt.c    | 6 ++++--
 hw/arm/xlnx-versal.c         | 5 +----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 1b5ad4de802..0728316ec77 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -103,7 +103,6 @@ struct Versal {
 
     struct {
         MemoryRegion *mr_ddr;
-        uint32_t psci_conduit;
     } cfg;
 };
 
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 3f56ae28eea..ef3231cdbb3 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -628,6 +628,9 @@ static void versal_virt_init(MachineState *machine)
      * When loading an OS, we turn on QEMU's PSCI implementation with SMC
      * as the PSCI conduit. When there's no -kernel, we assume the user
      * provides EL3 firmware to handle PSCI.
+     *
+     * Even if the user provides a kernel filename, arm_load_kernel()
+     * may suppress PSCI if it's going to boot that guest code at EL3.
      */
     if (machine->kernel_filename) {
         psci_conduit = QEMU_PSCI_CONDUIT_SMC;
@@ -637,8 +640,6 @@ static void versal_virt_init(MachineState *machine)
                             TYPE_XLNX_VERSAL);
     object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
                              &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "psci-conduit", psci_conduit,
-                            &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     fdt_create(s);
@@ -679,6 +680,7 @@ static void versal_virt_init(MachineState *machine)
     s->binfo.loader_start = 0x0;
     s->binfo.get_dtb = versal_virt_get_dtb;
     s->binfo.modify_dtb = versal_virt_modify_dtb;
+    s->binfo.psci_conduit = psci_conduit;
     if (machine->kernel_filename) {
         arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
     } else {
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index ab58bebfd2e..2551dfc22d6 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -40,10 +40,8 @@ static void versal_create_apu_cpus(Versal *s)
         object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
                                 XLNX_VERSAL_ACPU_TYPE);
         obj = OBJECT(&s->fpd.apu.cpu[i]);
-        object_property_set_int(obj, "psci-conduit", s->cfg.psci_conduit,
-                                &error_abort);
         if (i) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /* Secondary CPUs start in powered-down state */
             object_property_set_bool(obj, "start-powered-off", true,
                                      &error_abort);
         }
@@ -667,7 +665,6 @@ static void versal_init(Object *obj)
 static Property versal_properties[] = {
     DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.25.1


