Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32815AC834
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:53:33 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzQi-0007DT-Kd
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz97-0006pV-T9; Sun, 04 Sep 2022 19:35:26 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz96-000540-3O; Sun, 04 Sep 2022 19:35:21 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso5215254otv.1; 
 Sun, 04 Sep 2022 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZnjR+HSANRXzGpPVU79J/JVQUyEsaYRiAdtq9yVQORw=;
 b=V0GxQITWYAAN9iB4yqwXYAkAJPHixaFli3Qj6xuYV/nAbzvoNNrkxHzE8MKNF0laXL
 dYxusUodsYh4x+ufExLIoXBj75/6L/VquOUqM4vFowWJgDDM+2NG76LXbcKXaB0cSTVg
 /McEBU75UYPGkOCf1XN+6bfzqAa2zI4sy2DZFLPXiS2jYPHqG6263vKUZm5PbqRTH4pH
 zXEakJZ0ESV+PNogxHJxi3dFxs719k6UM8DRfio/lo22Wfgsaa0ptd5Jhn6DF+ZuqoC1
 O9mRrHrZklDWakWUHz//NKxihr80UlUR0zvGYTJGr/NpOGm67znhDG6qJBzHwpf2EOms
 Lxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZnjR+HSANRXzGpPVU79J/JVQUyEsaYRiAdtq9yVQORw=;
 b=uAn1QF6miqj8ZCxASu7yfKwb0PhCE0wGhce4ySnRFEdXyoiVXqUvbADogVMau6rjxF
 qZVa9VjqMUPt5Bp374Kb9L9YLf4XotWY81DyAv7HSk0Lzv174zQksgBga4RCAe9V+8SN
 bL8QkpQDMoc5XyBCBk5oFpJmU4c2F3oKmLHuUHKztX9ccA3X+BpN/WQeOEEqlL78SibH
 aBUdsJ7aASdcRLKmOZvA8nfDzsq76zN3/ceNXavHQnA3pzxdjuFQcRsPoM5sk6QZQJJd
 ihTWdIYOuGDF3cl5CSB83r2HEIgfi7kCZFwqygNLHS/6PWpeARB/hGm1JAj8YuaUkeX7
 omig==
X-Gm-Message-State: ACgBeo2VZE59Py3+IAC9b/UfdwqXscqzYZ9vCSum/aWW6dEGke+L7VWn
 zbiWYcPKBkXBjJloeu9EXmkZFFwIhdZjGg==
X-Google-Smtp-Source: AA6agR5IhvgRHJzv+WTegA6adR2VI+wCWpM49pmUZW5Kenn0Xf4cZ6Yq+O0fLkYetMBpr5AJZ4Y4pQ==
X-Received: by 2002:a05:6830:3150:b0:637:1a0f:f344 with SMTP id
 c16-20020a056830315000b006371a0ff344mr18270378ots.149.1662334518517; 
 Sun, 04 Sep 2022 16:35:18 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v6 07/14] hw/ppc: set machine->fdt in xilinx_load_device_tree()
Date: Sun,  4 Sep 2022 20:34:49 -0300
Message-Id: <20220904233456.209027-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the
virtex_ml507 machine.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 493ea0c19f..d30f186979 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -45,6 +45,8 @@
 #include "hw/qdev-properties.h"
 #include "ppc405.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * MiB)
 
@@ -150,6 +152,7 @@ static int xilinx_load_device_tree(hwaddr addr,
                                       hwaddr initrd_size,
                                       const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     char *path;
     int fdt_size;
     void *fdt = NULL;
@@ -194,7 +197,10 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
-- 
2.37.2


