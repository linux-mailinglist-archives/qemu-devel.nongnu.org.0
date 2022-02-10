Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E04B0EF4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:41:48 +0100 (CET)
Received: from localhost ([::1]:59732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9hi-000750-GA
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:41:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eQ-0002JP-1G
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:18 -0500
Received: from [2607:f8b0:4864:20::1031] (port=53987
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eO-0004vF-CG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:17 -0500
Received: by mail-pj1-x1031.google.com with SMTP id qe15so5016851pjb.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=dpxnArhOAS2FIFIHWgsEXI3tWcqAXZF78SLnm/cfvelIDc4peZT4bvwyDbVUDmsBsm
 0ZRhBgBdqzYJXnpjTl8Pst/yiw/iZMoNLe25If+zFehONds9tIN8CIY1D1EwlwxYG/yi
 pBjVupfWc7RZIOnR+vxjO4K9IKwEqYMLhX2keB3fdcXQ7E+YrprGikukygA8F2jLPGU5
 kN7UXFx/7fBzpl5S9BzS8lE0soB9vyMk0cy+hevJm+cXZFQNwJNld1z+xppvbop+BsWh
 UqbjcwxsCGBoEuw2nbm0AerLkWw2Bdr7G6AuyYHYpLNL6/7BWN40ve/bb8TsZ67o/SW2
 jk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=HKLrXer+mbnmVpR9mUWICo4g7pxoTBwP6q6NPXKIFgViwAXlKeGhPEho28pJ/JMCZO
 4Lhyn1uYRfEIbK6xWgvcWYc2q8O3p6U/E4wqkrXMYgsmfJW22AVBjmlhhsLqLwyMZxKq
 E5PjUdbuj8Ja1I5k2+vmNr8vL1Kw3dnLvIp11DFuI0HOYyaOQaSDjnTurGI9rlH3fVm3
 owAUwdNV7R8GSBBpnj9gH7h8fimKkTCXAr6zSJnyV/gDVGeHps5VgyXsl/abiTsYg2bR
 NnyYNVOLisuwj/41s5of1bGZJw3SFolldRdbUUq7rHBVXdMDSb9BD7ojKUg/IPPOE9KM
 3vRw==
X-Gm-Message-State: AOAM532mDhAnQmFwES7MCS0gjy1Ufjo4LBiQwirdxlB9XJZMmsYYCfe1
 rwahcgaoRuK9ujnHqSix0jmyM0taNWIVgwO9
X-Google-Smtp-Source: ABdhPJztTxo0al3Lvt4oZyKy9IiNtnwptcmJ1pVeIw9Tm6BpXnTeaymCy6cLMFmX4l/0mJ9uZiu5Ag==
X-Received: by 2002:a17:90b:390a:: with SMTP id
 ob10mr1268013pjb.45.1644496451198; 
 Thu, 10 Feb 2022 04:34:11 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id t24sm23860270pfg.92.2022.02.10.04.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:10 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/4] hw/openrisc/openrisc_sim: Create machine state for
 or1ksim
Date: Thu, 10 Feb 2022 21:34:00 +0900
Message-Id: <20220210123403.2059926-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210123403.2059926-1-shorne@gmail.com>
References: <20220210123403.2059926-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jia Liu <proljc@gmail.com>
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


