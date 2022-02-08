Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4E4AD830
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:15:25 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPP1-00035c-VK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqn-0000ij-Hy
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=42886
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqk-00024M-Oi
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h6so11460649wrb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JIBuxLdewgryzVDpiDHfhlGi/hrvUx98UZy6rt0YW+g=;
 b=fcotyDpTK13gBGSabP8zBhKBjiKVWIepKY4/66JcavEPiHawUrgmOGH29rVeqnTQJV
 K3NmoN8g7ivHY6nWsSFpuqUZCA1mHfBqeccrq93LkwPYwjX3cVVe3/6dAsJDBklhtIdq
 7hZIrM8l4jm4tAXtCsIzI8wxa2Hl+SVsoSECYaoc5dqAFAIQFiTgt8dUYirCCZIyXxEh
 wkVApwcrkHn+HgCryo3WQ1I+H+2QNONCCIIMGqO3AJa2+qOvzdlX+7CxPGFjIuFagF9O
 k1WQJIqnAC1tYytvvLC9SAqhtTUQsTB9muiO2luXLnOGDg7VwcDDNplUcbJjHCo5WloW
 2N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIBuxLdewgryzVDpiDHfhlGi/hrvUx98UZy6rt0YW+g=;
 b=jlYXUdOTeNdMj1ItJPL/u/7S+Fml7q4ZdBDg+SD3OkVgqO0fH+/Rt5XYoh6Uz2WVgc
 R7okgPN6Q5o+hzZ8IjX6mGMj7x0vWI9EC8aaWYqxigcW9O+dX0ApnlLFCWmvjTgT2MfJ
 BeUMIEXCklnDTG+qIGV6GuR1B4uLbUvLG+L79buW7+F5gmIdEMOEl5QEJd1Toaf4BUj9
 nSQzqsi5ee/xdMv3BWFcvGP9j6y73NxMS/LmnCEJfPldvfXdKvQJJfuAixkjUbsqBYmx
 cPj1B/4Yw5oTdUHqYBMbIwnkvPuPz72+mJTh62hDmLUMzjeLVqOmhibnBef/20Mw2bbX
 qsNA==
X-Gm-Message-State: AOAM53167Gretw7JUQIYDJpxMFe/NKbJQGpHyEmsSFPBhHLsVKSmshI9
 Ecbntw/3TSric8MvdvRYYKb7AZvxTvbo1A==
X-Google-Smtp-Source: ABdhPJy/S1hAjBV58I9eds8Z4oUnhSGX7Z4wRt9IMJf1R5nI8/CONtQNG5ROU0f6qaZveBCUjzFGew==
X-Received: by 2002:adf:d843:: with SMTP id k3mr1183525wrl.633.1644320397313; 
 Tue, 08 Feb 2022 03:39:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/39] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Date: Tue,  8 Feb 2022 11:39:20 +0000
Message-Id: <20220208113948.3217356-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
boot.c functionality to allow us to enable psci-conduit only if
the guest is being booted in EL1 or EL2, so that if the user runs
guest EL3 firmware code our PSCI emulation doesn't get in its
way.

To do this we stop setting the psci-conduit property on the CPU
objects in the SoC code, and instead set the psci_conduit field in
the arm_boot_info struct to tell the common boot loader code that
we'd like PSCI if the guest is starting at an EL that it makes
sense with.

Note that this means that EL3 guest code will have no way
to power on secondary cores, because we don't model any
kind of power controller that does that on this SoC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220127154639.2090164-7-peter.maydell@linaro.org
---
 hw/arm/xlnx-zcu102.c |  1 +
 hw/arm/xlnx-zynqmp.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 45eb19ab3b7..4c84bb932aa 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -236,6 +236,7 @@ static void xlnx_zcu102_init(MachineState *machine)
     s->binfo.ram_size = ram_size;
     s->binfo.loader_start = 0;
     s->binfo.modify_dtb = zcu102_modify_dtb;
+    s->binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
 }
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5fbf38c4660..6d0e4116db7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -216,7 +216,9 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
 
         name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /*
+             * Secondary CPUs start in powered-down state.
+             */
             object_property_set_bool(OBJECT(&s->rpu_cpu[i]),
                                      "start-powered-off", true, &error_abort);
         } else {
@@ -438,12 +440,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_apus; i++) {
         const char *name;
 
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), "psci-conduit",
-                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
-
         name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /*
+             * Secondary CPUs start in powered-down state.
+             */
             object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                      "start-powered-off", true, &error_abort);
         } else {
-- 
2.25.1


