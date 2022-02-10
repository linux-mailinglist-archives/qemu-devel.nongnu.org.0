Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82B4B0E2B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:13:04 +0100 (CET)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9Fv-0004hl-NT
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eX-0002X7-8y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:25 -0500
Received: from [2607:f8b0:4864:20::42e] (port=43967
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eU-0004wq-G9
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:24 -0500
Received: by mail-pf1-x42e.google.com with SMTP id d187so9930083pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ws/n5TeF+Rc5l/irILflhDF6sca8Ug7Y9ekpBzlYtfk=;
 b=emzlia5p8qVEsOfVXZv+C8v5aqddRtD6BRmMgZruBmVRESa00qbEyba/dWpiHyquIB
 YIPmJIu4OmjuO3SB5JBTA8ZuNswHUdBfvTiTZPx+ETRRmD+NiNfHafdbN7vm5504cjNT
 NSsCczvG3/XmEvxynDkp9h8Caz02lyHG9KAzvcufnnyRq+jxFLqDW9CXtVfylfOL9wrB
 Ax1d6EUOE7++sBUQIY96qb12b32UBDU/49n0c0HkdiYGxMjPWG23DMsNKH15DRsijEUO
 k6tUuGTlItvJ7EU/YuhOK9LPhPtsHA99rbNwegnBpeylk14jFGz1ZzDYy3DoyX9YiLiL
 7LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ws/n5TeF+Rc5l/irILflhDF6sca8Ug7Y9ekpBzlYtfk=;
 b=2xnkugeGPHwjldHWWSGwfzSI7TxCWkkZK+vq0MVDCB4QvYoFGq+OeOpGp41BjiN2j2
 OHPmdK9TE0EcLoc4A12rlimwEXSvOv2Cmv8/wBYP48fPR7n7nQqgaUWbCw12W89GqnWv
 A7/f/V6hdYgbhAWi4sdlag1SMddCn0Ibaf2U24XapXtYMnXFxzWvi4qiC45RQBxdyOrm
 u45s8rvo1YEVnxl3gUQxngdczf6AsHgMAA4TPBfgGlrSN54+KuUCwlD+pDq3BXR/nrR8
 vnslQ2Vm3TEhQYNF4Raf/1eHYOyeDlK8V9TFOcdoMsCFL3qtRTdiVGXMFPWq1axRocVY
 JJkQ==
X-Gm-Message-State: AOAM530vHdftHe4fbGozHs8ar7ksRqNHMzUxuGWjy9W4XVxTErAu2ZLY
 ml/bpatVpyaCS6DznzQDhnnOWdLCBjK7uoP+
X-Google-Smtp-Source: ABdhPJwTYk4ymAN6GnJm4ENlU9jGsIhaVM5+Ua03lm14v4iK1ZoGJYutEby1S7A6CqqsV5JHLKKK2Q==
X-Received: by 2002:a62:8c57:: with SMTP id m84mr7154141pfd.28.1644496459852; 
 Thu, 10 Feb 2022 04:34:19 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r10sm8001220pgk.74.2022.02.10.04.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:19 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/4] hw/openrisc/openrisc_sim: Add support for initrd
 loading
Date: Thu, 10 Feb 2022 21:34:03 +0900
Message-Id: <20220210123403.2059926-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210123403.2059926-1-shorne@gmail.com>
References: <20220210123403.2059926-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42e.google.com
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

The initrd passed via the command line is loaded into memory.  It's
location and size is then added to the device tree so the kernel knows
where to find it.

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


