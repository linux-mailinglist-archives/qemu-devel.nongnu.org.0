Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D424C41A3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:40:50 +0100 (CET)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNX5l-0001Mh-Ut
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:40:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1t-0004ck-85
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:50 -0500
Received: from [2607:f8b0:4864:20::62a] (port=42608
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1o-0002uo-Id
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p17so4187389plo.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=f5XxEiNTUAaUoZl9qpwSizSAgeoqsdZQDIr8qcxHkEDiXDayeBCVCxN1oBRH7iU4CI
 9iIuXyIsPGuVjYHI7Q2tTeoTZw2YIxC3Cny2NukxiJNq37WBsxnG96v4mOY59FrSapNK
 M53hF5TFOSOAqmCVR72vQLTSqHkNtPURt/QhG+3ocTxnw1fWWo1w5Vh9n1DLYHyrLoT1
 5f51Rb8zJasodrfwYU232GBALNtSoagWT1O8OpeaC0QRgQ1OH+UhhY1M6QR+szoZeZhy
 GopSSp3ITJDAJGtFzxC4r/JZEyBrnolyA8RWbKhYvlp+cZ8XVW/j/HKgOWdb/GyqY0NE
 2Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=CfrAbx0LVVB2sWcKIGadKp5XM+XGvIFGjm4D0sIu/lipLjkGuGkoK3tJpihCYmabxU
 b6yUYeRDApdOzy7c+btYtnsYLh10Pg5AC7EifTSCyRgj4pDgHOl3iuFGWhpz2fSKdd05
 RfVU73VHbF2E47lJlSQCADVZPfeEbts6PoP/9+r/tIgNAMoo+JJraAULTQHCL/c4w23P
 tCDCHdFJdbE4cwW0q81Y3i3nC0Pt92Hp8BqKdcSjM4S7F7yp3oO7LH+0rVnM0NzmvXI6
 rkSS3c4CPyMQ7BI6e6T+pGVRQcelYDtYFiqpPU8PhO2kG5iQ+AVJMWe41eKKoYiTWezA
 6H3A==
X-Gm-Message-State: AOAM5318IcySpW0fLZE4hssCDwGPR2g1ZqF0UWPhRyYU6OzPTZX3rD2Q
 6hJAInNHH7a4TIyv8hy0hvQwK6AK/Sf2yokH
X-Google-Smtp-Source: ABdhPJznRFvVyfpvWLRG7p6yS6cBe5YNkb8tQg4Lziw9RFdAKCqxV5psMcJaO9NInF/ZD9iQtFvz2A==
X-Received: by 2002:a17:902:f605:b0:14f:5d75:4fb0 with SMTP id
 n5-20020a170902f60500b0014f5d754fb0mr6168437plg.101.1645777954361; 
 Fri, 25 Feb 2022 00:32:34 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004e1414f0bb1sm2070007pfl.135.2022.02.25.00.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:33 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 1/6] hw/openrisc/openrisc_sim: Create machine state for or1ksim
Date: Fri, 25 Feb 2022 17:32:17 +0900
Message-Id: <20220225083222.1174517-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
References: <20220225083222.1174517-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62a.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to attach machine state attributes like
the device tree fdt.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 73fe383c2d..26d2370e60 100644
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
@@ -183,8 +195,10 @@ static void openrisc_sim_init(MachineState *machine)
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
@@ -192,4 +206,16 @@ static void openrisc_sim_machine_init(MachineClass *mc)
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


