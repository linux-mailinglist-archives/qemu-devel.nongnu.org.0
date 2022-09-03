Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E45AC134
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:43:42 +0200 (CEST)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ3N-0004a6-Px
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYua-0006R4-Np; Sat, 03 Sep 2022 15:34:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuZ-0005Ln-1c; Sat, 03 Sep 2022 15:34:36 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so3681106otd.12; 
 Sat, 03 Sep 2022 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=Je0h6qJEfPr7JOVFH/OGrwTfJrPtarYa/1RiFQxr3/67xtHbq38U4V0sb81TIfeKsw
 j4bNp4OW7OlwO0EavENrcWGs+gG4VOnw2UGRCgBeM6rT4kng5IQ+EVhzG1JDC3z842L1
 9t7DoliHbiaWHent5xv8jjDCxJO2T+C+drnYcV/NIYhskm3D0E4srwGRXGkE6Zvfjy5q
 ZU3eyfuw/bgLJHJzWGyMJJSDtNChE6eqEAb8RdwErXeXVspSrFah+HXbqI0wkPZbwN/O
 ljMAXGTH4wE0q1wzWJqfxFBXUmONtEPBb9vYS9Shz+D0s5mZ4B2NkZZk4TgN+26RVfWM
 p4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cjAKqoCsh4ucsmwOdsaJfx2iBShktx1X0R5EseCjguM=;
 b=aVviAIP+66jBipkgxB5/MjMVr23sStdrfUv09fSKRw79rVi6TfrHLKCpfPiI455v71
 dUGNji9m8bXJe1+SvxDc7uoL0/mx0bRA1Q3oXuXoLPIaYEwrFeTqJ8WyrbXTOJdEgnop
 Yrj2WT8puDAGSn2+ffvsm9bf7GJS8BnfHelz4odoAanCzeVK9ZnQ9MwbKMdaTiDGrUgd
 FeqTRaamK+0ASND4Q0MI64RvKT4GUT87++WRw/jj+60YGMUjnPo4i1vLADvyNrAL1J2F
 fOzrZ9/E3E7rY3FEyKhNPfS5PTnuSemDimB8Xpy7xlQE2h4FCp2Can8fdNlK3si7g7Sv
 H8sA==
X-Gm-Message-State: ACgBeo0/6ejbKJjPAnHHDSkp3Lb4FT4NCxVORKMSKisQBo5uMIBQnxWB
 tms9GivaSfD7CbPQJeAZEBcIxhfMj/AZPw==
X-Google-Smtp-Source: AA6agR7XwpsctZtXutFDO7XpWaaMi+cKGfUU2lR9sXzwOY7gX5ljBbaEQSeHgq43co0c1CfFSZl9LQ==
X-Received: by 2002:a05:6830:1418:b0:639:48a8:f005 with SMTP id
 v24-20020a056830141800b0063948a8f005mr17155430otp.94.1662233672689; 
 Sat, 03 Sep 2022 12:34:32 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v5 02/14] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Sat,  3 Sep 2022 16:34:08 -0300
Message-Id: <20220903193420.115986-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
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


