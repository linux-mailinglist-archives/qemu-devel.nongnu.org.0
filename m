Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDB4B0652
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:37:31 +0100 (CET)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI357-0007Sy-WD
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:37:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yj-00049U-Fu
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:55 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33845
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yg-0005Bi-Ds
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso1164934pjb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hA2LCga9fxXPPeWzfbk2k22i6rRvao14Hx9VLSmSXLA=;
 b=Ys9IMwo8rRKMjsqFORO2o/N5Ed7DhWpJG1BeEgVZUGCZw+zCAXfq+yXWxSyzEwd0FM
 y7SFmu3kjoj6qHeJYuUrupPTDqWDqG1jPyRnXAxMnFbRenPlvLAMCSeYybv361MAkgyl
 IvL0+S2ZiL8h9OctuLkmPF5jT+sSFBUTab9iZlYVK12FqwWfv/ui0PTzjaVQquP1gEN/
 C+4BPx2gFk+0sMZ4gNepRyNy/1qisv0Z+ILfsrPdRmOgqMkWr37ucgdiYjbCBoEIu7xW
 O4cW1FErT2z71uPwhmgkgwOrFh8QvdlUAWzlMzcqDI79I6pvUkGiB2nB5TYMIHYASJrS
 PMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hA2LCga9fxXPPeWzfbk2k22i6rRvao14Hx9VLSmSXLA=;
 b=iqXP/XgLBJbQfZ+lcyro6115t9u1fKMRySZmy5/6Hegl3f69xolfGosTMjLGnAWujT
 8+Ix32cojzl+0bqzAyuUol2QhYvL32+QoWp4uPiGjT3fh0hu05AQsedCX4R8ataPkGFz
 77A3Sas1YpWedz66VDs8ImO+Ho5FAbJxYXSzIp1f3dLXk61uemApRShKsXE2+IPINjjX
 ajYLQaz02lAhL/baxKscWfZehko2xsEmUpD0zfo+Y0HtPHPYyU9IRXruUXr0QWc16ezI
 yyiX7ylPgp2oXgghQaiIJCYN8re3k7iPgpTYO7JDimZxQ5iuEpb5jYBPuTCHeedWfMxE
 1q8Q==
X-Gm-Message-State: AOAM531X0uCrd1pNmLq7CBPTY/No0S9X3QEW6bGiG6TJuCLu805TalFT
 gdInLhAWXlbA4vvfLIky2cw5qB65woW7MA==
X-Google-Smtp-Source: ABdhPJz80Pgj4HzBDiZPcDgQXntAv+sT0ZcbEd9FXk/8oIA2cGYRZ71n6f1uUGltTj4Oga66sXyM1w==
X-Received: by 2002:a17:903:124e:: with SMTP id
 u14mr5962134plh.57.1644474639687; 
 Wed, 09 Feb 2022 22:30:39 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id mn7sm928873pjb.8.2022.02.09.22.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:30:39 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH 4/4] hw/openrisc/openrisc_sim: Add support for initrd loading
Date: Thu, 10 Feb 2022 15:30:09 +0900
Message-Id: <20220210063009.1048751-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063009.1048751-1-shorne@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The loaded initrd is loaded into memory.  It's location and size is then
added to the device tree so the kernel knows where to find it.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d7c26af82c..5354797e20 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -187,6 +187,32 @@ static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
     return 0;
 }
 
+static hwaddr openrisc_load_initrd(Or1ksimState *s, const char *filename,
+    hwaddr load_start, uint64_t mem_size)
+{
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
+    qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                          "linux,initrd-start", start);
+    qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                          "linux,initrd-end", start + size);
+
+    return start + size;
+}
+
 static uint32_t openrisc_load_fdt(Or1ksimState *s, hwaddr load_start,
     uint64_t mem_size)
 {
@@ -198,7 +224,7 @@ static uint32_t openrisc_load_fdt(Or1ksimState *s, hwaddr load_start,
         exit(1);
     }
 
-    /* We should put fdt right after the kernel */
+    /* We put fdt right after the kernel and/or initrd. */
     fdt_addr = ROUND_UP(load_start, 4);
 
     fdt_pack(s->fdt);
@@ -369,6 +395,10 @@ static void openrisc_sim_init(MachineState *machine)
                         machine->kernel_cmdline);
 
     load_addr = openrisc_load_kernel(ram_size, kernel_filename);
+    if (machine->initrd_filename) {
+        load_addr = openrisc_load_initrd(s, machine->initrd_filename,
+                                         load_addr, machine->ram_size);
+    }
     boot_info.fdt_addr = openrisc_load_fdt(s, load_addr, machine->ram_size);
 }
 
-- 
2.31.1


