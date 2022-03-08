Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C44D1144
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:46:56 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUYZ-00016A-FX
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9V-0005mn-Bj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:01 -0500
Received: from [2607:f8b0:4864:20::102e] (port=42779
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9T-0006XL-P5
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1596695pjq.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+jQs21jGzokf3Yfc7d46eGEeMlYc/6pCsyk7NVMPxQ=;
 b=p9onNzxDSMZrCprXu6px+Rn8Tg7bSaGSL5bWJw93JwBcQuXtWsnZ0AfJ+uaL2PSifU
 xNHl539ufNvGh74yPFYrbtKbI1NzzK3W0N5AgOBL6IcXQxR8/cF8/pDNDDZUS5F8l4IQ
 el9vv1oWQEp7gfYgmwKCDkuxfm6ZwY0sfXYOQ5pFmK5WFXv6r2vFVYWSfMcawITZFQN/
 ySt8Pn+nbAr4eF1Dqr7hWn///KXj6pQ/Mrs5bOviyAdMXkxl7omFdd/R7StU9OVsGR56
 TI0aHklEZpP/bW3MqeIj/R41CGKuBHeXBUSAo+DDryWRM23uKrSaMSyqJKa4qheoimAX
 EPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+jQs21jGzokf3Yfc7d46eGEeMlYc/6pCsyk7NVMPxQ=;
 b=UjjlPZG1POqCamKuxt7JPPKeiDv1XpsK4k2N2jgfTwyKW3kTBG/QgdjAFQbZHYUgGP
 lwtoI6td8i8iwLRQbeUIJGU0HnJ2cSVZZjzJGb/0Lk7K2o4xYHf0lTz4JPSJyqcdBClQ
 a+H0yMLkaWt8lkWlu3jqGPEvIxHToIHTIG05RbMYPLNzJsn+GdEncZPRY5qG5sYYIWjr
 YaccXmLy19BU7XEdemsUOPKVc3i3Ng6DepO3PqMYvyfSZxfAweb/Cp134flEKyUELmNt
 u0qJ70cSgLbenaoldsON1DorvXSFvRP0YwTWaKoKgsCxa8XUjuAJZK2plTA7m9QlmxZv
 MJ3A==
X-Gm-Message-State: AOAM531iWY23Oi7opWFhFSpRWDpmZRLjPRcjSB7gGJP+AmcvUVyX1c/8
 2tjevO3MA9kie+cT/pMfVSCn2SQHiCfgTg==
X-Google-Smtp-Source: ABdhPJyk+NtBJ5auKo7esvVxxZFrtp75T9oKfQxytsmUk+JTAicmnBu8Rt7+izMLYloW0JUbq8sU3Q==
X-Received: by 2002:a17:90a:a594:b0:1bc:5def:a652 with SMTP id
 b20-20020a17090aa59400b001bc5defa652mr3187541pjq.167.1646724058484; 
 Mon, 07 Mar 2022 23:20:58 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/33] hw/nios2: Introduce Nios2MachineState
Date: Mon,  7 Mar 2022 21:20:03 -1000
Message-Id: <20220308072005.307955-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to move data from the heap into Nios2MachineState,
which is not possible with DEFINE_MACHINE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd..f245e0baa8 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -36,10 +36,18 @@
 
 #include "boot.h"
 
+struct Nios2MachineState {
+    MachineState parent_obj;
+};
+
+#define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
+OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
+
 #define BINARY_DEVICE_TREE_FILE    "10m50-devboard.dtb"
 
 static void nios2_10m50_ghrd_init(MachineState *machine)
 {
+    Nios2MachineState *nms = NIOS2_MACHINE(machine);
     Nios2CPU *cpu;
     DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -101,15 +109,29 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     cpu->exception_addr = 0xc8000120;
     cpu->fast_tlb_miss_addr = 0xc0000100;
 
-    nios2_load_kernel(cpu, ram_base, ram_size, machine->initrd_filename,
+    nios2_load_kernel(cpu, ram_base, ram_size, nms->parent_obj.initrd_filename,
                       BINARY_DEVICE_TREE_FILE, NULL);
 }
 
-static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
+static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
 }
 
-DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
+static const TypeInfo nios2_10m50_ghrd_type_info = {
+    .name          = TYPE_NIOS2_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(Nios2MachineState),
+    .class_size    = sizeof(MachineClass),
+    .class_init    = nios2_10m50_ghrd_class_init,
+};
+
+static void nios2_10m50_ghrd_type_init(void)
+{
+    type_register_static(&nios2_10m50_ghrd_type_info);
+}
+type_init(nios2_10m50_ghrd_type_init);
-- 
2.25.1


