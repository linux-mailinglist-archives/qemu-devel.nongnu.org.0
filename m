Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4E4BC6B1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:30:46 +0100 (CET)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLKCa-0000BR-VK
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:30:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJYY-0000si-JF
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:49:22 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJXX-0001IK-4v
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:49:20 -0500
Received: by mail-oi1-f169.google.com with SMTP id k2so1690912oia.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=Nf1Mxn27xt4JN6qg1XCGVq/CfKU8mkknJPdNOLRz1waaqWeEwLjVUL6IisGq0/6OCN
 9QJzjiSuXaGZIo2vrFwx3LrlOgshj4U40XlTUXvQI262DslH05HAckJEuzK7wB5Xv6Jo
 b3wAXJdyc5Tgi6+eXnmSasEArWWk2SaWc8IWENwFIuaLKT4f2lgABCCMakR+3Zjlv6bg
 scQnh0m8XhY5UGLevyrpKAbDu6N1EWWYFSihKMQQaY9E2huXFp88iT5TcpxUYats49Ip
 lM3pnBXnKEPjyLfhrz23TgHEdWp2RSBRFFy0wEB9n8Vd8C+AQo+g8m9wRv1EeuuGCO8N
 rm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Yn04nvZkiqD9e5fzaG3S3X/4FZpuR1OsLhndKT3BtA=;
 b=JIDV9VizD8R1QeUceO/Jg0WqoF7NgyoSdO9OV6uGak4XNKcpHiHtVhrlWaqw+O2gQy
 09GXpOLtIHA//mWXvcotQTXHAqakfbIOuQn3EwhneJOCrXUW1C6NOsnWomE36ryEtAfl
 mtqa8dAhj7cDM6M3JhlGzDaFB/gulLWe2R4KAvzDs0aRbwI8sOkW/kF3LuB0ULBwtcRY
 xK4uHb/OclF7gwUqMRlxFnyL5HhYRR59FkpYN7FypjGgJw9OWPb0makaWwx03UsRVSfs
 EulfVe28vJOdDEDE1bPokA1AvBWpd5DpdB6zk7ceTK6DUdRK6939BLC8OYKNQQaJQnK6
 CCqw==
X-Gm-Message-State: AOAM532DuMxkGBm22tbcyv0d2nIlJ/7sBRoQ4sEqfVLPMmGQ3RAmrVeg
 HmH3qSyg4RvKqj4/cj2AzG3YiNTwqIMJvw==
X-Google-Smtp-Source: ABdhPJxWB4pKucX0huPkntAL4J6C2t2zWy3gHfe7ivd5FcFv/nGeodNmk6WVIfKcHB/+OuKJ9qF2lA==
X-Received: by 2002:a17:90a:c913:b0:1b8:d641:cc1e with SMTP id
 v19-20020a17090ac91300b001b8d641cc1emr11832170pjt.76.1645252959151; 
 Fri, 18 Feb 2022 22:42:39 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id y72sm5042840pfb.91.2022.02.18.22.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:38 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 6/6] hw/openrisc/openrisc_sim: Add support for initrd
 loading
Date: Sat, 19 Feb 2022 15:42:10 +0900
Message-Id: <20220219064210.3145381-7-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220219064210.3145381-1-shorne@gmail.com>
References: <20220219064210.3145381-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.167.169; envelope-from=shorne@gmail.com;
 helo=mail-oi1-f169.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>
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


