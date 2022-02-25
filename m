Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C486E4C40DA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:02:46 +0100 (CET)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWUu-0005Ag-MZ
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW20-0004d4-J9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:53 -0500
Received: from [2607:f8b0:4864:20::102c] (port=56173
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1y-0002wA-Qt
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id gb21so4189237pjb.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=mpqGE9uMg7sW7MF5Cbm8/IKuVdqADRZx+gElgRze6d5yMEobvs9izQrxExX/p8oXU7
 k53/6zx+iSk+BaZhT9+b2QO4BiB+erqG+7lmpESLMJ4iW/PsbeGu2sinFQqbjY/fpRNv
 Ksora34nksW0hx/ywW6EfLE5fOw0PNa2KP0sws7jRlvdru5TD/p7QDcTr/rAU4xss8ur
 eHRqhw54SUiOqr9Kf7JNaFAPfQo4H/OYMrgl/Ji6Y5LtIseJWrAnLKekXxgjM2BWNlvU
 3Yt5RG/hesS2/B045hwDxZK8jWFYXYJxGezvHOsaV6EZZeo1kYSD/Cq7a8DMRZk9TOew
 C/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=JR2+8dwbNhfwCmdzwb+HMVwYfZn1jwH2iODs0pSZ2QKKZEw0ozD0rwOMVZBDUwVKbI
 kBq5DWrYTh2xmN6UGb0nsW8Qmz5Qt5hI8jwvZtx6Zat72XioNrun/3LKvjyVITyTxRWw
 RcD6xgO3ltvtbnYlvpK9TZcH9h0eS1x/P8BQYZ1jIywDD7+pVlwpL/WnOaa6q1LSqiKl
 rj20tFk0eb6fyHzlRW0jFlsr6167DIU7dN9TQ/jRECueAeUz4nWcDsoCKn+cILNHsLgM
 35IrBod4zsSX++MjU/1fQBMlJsf4+uKCmZGf2jRjpuTMbaDC2gd1YEfawWqcHj5OQPz5
 pNlA==
X-Gm-Message-State: AOAM530CjR46r6cqIQuzWU9Z1SmEwqEdUvzAcD6mMLFfAa6mji7lZqz4
 +n0p2DbtvehtHHimI9OIRMx2GZelvaZSqM0e
X-Google-Smtp-Source: ABdhPJyJ5fbRxuXg4nqW/bywO5QsoiUEw7eT5cxJdr69iGOVKMlEtQ2Aff2gnRz/bZ0pmBah4O+j5Q==
X-Received: by 2002:a17:902:f711:b0:14d:61ba:8baf with SMTP id
 h17-20020a170902f71100b0014d61ba8bafmr6360556plo.39.1645777969255; 
 Fri, 25 Feb 2022 00:32:49 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056a00244700b004e1300a2f7csm2070324pfj.212.2022.02.25.00.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:48 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 6/6] hw/openrisc/openrisc_sim: Add support for initrd loading
Date: Fri, 25 Feb 2022 17:32:22 +0900
Message-Id: <20220225083222.1174517-7-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
References: <20220225083222.1174517-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initrd passed via the command line is loaded into memory.  It's
location and size is then added to the device tree so the kernel knows
where to find it.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/openrisc/openrisc_sim.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index e0e71c0faa..8184caa60b 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -315,6 +315,33 @@ static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
     return 0;
 }
 
+static hwaddr openrisc_load_initrd(Or1ksimState *state, const char *filename,
+                                   hwaddr load_start, uint64_t mem_size)
+{
+    void *fdt = state->fdt;
+    int size;
+    hwaddr start;
+
+    /* We put the initrd right after the kernel; page aligned. */
+    start = TARGET_PAGE_ALIGN(load_start);
+
+    size = load_ramdisk(filename, start, mem_size - start);
+    if (size < 0) {
+        size = load_image_targphys(filename, start, mem_size - start);
+        if (size < 0) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_cell(fdt, "/chosen",
+                          "linux,initrd-start", start);
+    qemu_fdt_setprop_cell(fdt, "/chosen",
+                          "linux,initrd-end", start + size);
+
+    return start + size;
+}
+
 static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
                                   uint64_t mem_size)
 {
@@ -393,6 +420,10 @@ static void openrisc_sim_init(MachineState *machine)
 
     load_addr = openrisc_load_kernel(ram_size, kernel_filename);
     if (load_addr > 0) {
+        if (machine->initrd_filename) {
+            load_addr = openrisc_load_initrd(state, machine->initrd_filename,
+                                             load_addr, machine->ram_size);
+        }
         boot_info.fdt_addr = openrisc_load_fdt(state, load_addr,
                                                machine->ram_size);
     }
-- 
2.31.1


