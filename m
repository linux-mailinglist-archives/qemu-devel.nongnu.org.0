Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6EE4B06C1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:59:24 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI3QI-00041m-IN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yj-00049Y-Nv
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:58 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44761
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yg-0005Aw-E5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:53 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so4590280pjh.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=chBGdOBMEgAMiRzLBP/Yre4uQprZ/h46al3NG/pDjYI=;
 b=fZ7fMfktS8/3CoXQAogo5bVNW1LGmB0LKdX/iunM49++pW4y+MhzCcJhsch84PJZmX
 WqMz6BrZWYl9k/JPlB/VoO7NJE2V6OaQNZFxIAJoO9l7dd/CKTaTRSJuIU2ipZFO6HH1
 16AtKc6VkjLm66NCC43r7WO/gtWQR9wU0+1FrmVe7wQjmIeJm9bdlj9RYYSL2ChqWPMV
 JZ3Ubc25Ioyg6Er9GOmnHmlnHPXIrJX6agL34l7+++Pv0tUK9O3e/q0tUqHOBII/9taO
 eKkxXB7x4V8go9EFaKGE+F6Z3/nxUKLVWI5neJo7IyiX2MOMwF7pB0h8T5KB7jI3bOjy
 sAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=chBGdOBMEgAMiRzLBP/Yre4uQprZ/h46al3NG/pDjYI=;
 b=IWf6BXQ5pV6vnctvQ+6jzqqvp1ESdQus3bZDF6qmGsdRohdAHeYCR3kNlQN5KgG7AM
 Ap6dY5ypesHlE8yQ0royUgp9jbyJ4vISArjhM1X2b+M7W8r6b2LIImch/Y34flP11OcN
 2445aGX2dYac+RRnymVWGDfgF9Y4ZYTwVTKW22zkf+N2n7jZwkGh1YSjwzlr4elDsJ86
 iCPvjhOZ6T2OBz+HkG/GJe+OmR3rVNOjnFELF8i1efdRTEGwW/Zz21DYrxHt/uIcQiAL
 4MP9k64LG3VFmdMtDKE8pKpPv0h9lohZ4dMjDfUGgqlFbvahZQhUsHdsgcL2L5yogJCw
 5A9A==
X-Gm-Message-State: AOAM531VC0Qk4Ecy+NcbooPSi7GEfw1hruxhHSOw04i9TEq2M0nCU44z
 MQ/mElhXt0LyPgl5zXJ8cCrl3SUfeXNEQw==
X-Google-Smtp-Source: ABdhPJxGrWC8RcuKWeAu5Ej7HLn+Ui74KJJ8ZWugIWA1irPZUp0HxPLmAzepRPqfYI8xWRTtlNDeuA==
X-Received: by 2002:a17:903:32c2:: with SMTP id
 i2mr5969108plr.55.1644474631389; 
 Wed, 09 Feb 2022 22:30:31 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id ml19sm857216pjb.52.2022.02.09.22.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:30:30 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH 1/4] hw/openrisc/openrisc_sim: Create machine state for or1ksim
Date: Thu, 10 Feb 2022 15:30:06 +0900
Message-Id: <20220210063009.1048751-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063009.1048751-1-shorne@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1036.google.com
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

This will allow us to attach machine state attributes like
the device tree fdt.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 73fe383c2d..b83cc1c191 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -37,6 +37,18 @@
 
 #define KERNEL_LOAD_ADDR 0x100
 
+#define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
+#define OR1KSIM_MACHINE(obj) \
+    OBJECT_CHECK(Or1ksimState, (obj), TYPE_OR1KSIM_MACHINE)
+
+typedef struct Or1ksimState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    /*< public >*/
+
+} Or1ksimState;
+
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
 } boot_info;
@@ -141,6 +153,7 @@ static void openrisc_sim_init(MachineState *machine)
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     OpenRISCCPU *cpus[2] = {};
+    Or1ksimState *s = OR1KSIM_MACHINE(machine);
     MemoryRegion *ram;
     qemu_irq serial_irq;
     int n;
@@ -183,8 +196,10 @@ static void openrisc_sim_init(MachineState *machine)
     openrisc_load_kernel(ram_size, kernel_filename);
 }
 
-static void openrisc_sim_machine_init(MachineClass *mc)
+static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "or1k simulation";
     mc->init = openrisc_sim_init;
     mc->max_cpus = 2;
@@ -192,4 +207,16 @@ static void openrisc_sim_machine_init(MachineClass *mc)
     mc->default_cpu_type = OPENRISC_CPU_TYPE_NAME("or1200");
 }
 
-DEFINE_MACHINE("or1k-sim", openrisc_sim_machine_init)
+static const TypeInfo or1ksim_machine_typeinfo = {
+    .name       = TYPE_OR1KSIM_MACHINE,
+    .parent     = TYPE_MACHINE,
+    .class_init = openrisc_sim_machine_init,
+    .instance_size = sizeof(Or1ksimState),
+};
+
+static void or1ksim_machine_init_register_types(void)
+{
+    type_register_static(&or1ksim_machine_typeinfo);
+}
+
+type_init(or1ksim_machine_init_register_types)
-- 
2.31.1


