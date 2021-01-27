Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B263054FF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:51:10 +0100 (CET)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fbZ-0007gs-6V
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZQ-0006Mq-NL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:56 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZO-0008FL-Ss
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:56 -0500
Received: by mail-lj1-x22d.google.com with SMTP id f19so972452ljn.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiuGvTPGKFpIhZ2vJD8la6tRAd3TGUEQyGxMVtg+XwA=;
 b=htCf/CAxYuGWVrekib6DZg5fchDalAvItjoTTZVvSnczRLGSjwMG3FCPpf2bLZeJCR
 26RiXer0JLg97Z9OJJfxPWPtDCLcOt7B5yPDi5r7WkLjoEU944cQrHfUTpwRg4AM3tW8
 NRLyvS7Zxb7p8+aaygR4I3joo8g/Pj1r5zRycVDmqMWH+GxefIRqSGYVqFX9ICeCgY5O
 nOwN3/1ix/DQB0VkZKVws4+/BiS10Xs9NzeFHm9bghQ1E9k6cKkDg2V4evp6XzUOzLxv
 LtgRaCdewyPE4cbVbq6yJv2Et0ePk2f/N+MBbyyGTupQj+AZNNw2ge6bRo+6MjoOe6sv
 CPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiuGvTPGKFpIhZ2vJD8la6tRAd3TGUEQyGxMVtg+XwA=;
 b=gCc1knsFiFdrvMWpZQDvZhpOpeSmIs4QWeeaDo8GH1mvJV4kmJXtN/1SnXWAULVZgV
 8LEld5kOMDacRIqu8t9tUfl+hKdDBAfggGtp4CjcYvXndaZta1LU4TziIaNNBvVnLI3K
 SR8xauICrdMI+1nWoUnmwRsA9UydTp6t1Z9duTfjHuobBvZ0B4MIKhTpTnu6pkoHS9ps
 NZqH4jTtw3O9GAxZiTo9vfO74MSQAR1Z66/vYZ6Yr6XqEhPxIwAiDjVQDtM4ja44obdr
 ov5uI5M0iEJKyP0/vKIXUA21QPOAlWgaeNhbhlfX0lXCr1z//miD/+WArUJZDoNwXX34
 LH2g==
X-Gm-Message-State: AOAM532HaypUH+ml3rhScQuTMCvN7zT/DoiRcxLe7TmSfpcwHSTyaFQR
 LPIxUm5icBE6pIw7TmREF5PwGcI1Pf0=
X-Google-Smtp-Source: ABdhPJw2yx476ozhcXKNfKvt/+Xim1Hlxt1pGi8IVQqOHA/MPQoKlWKatFrVcxBsf930ZhvBRX5bRQ==
X-Received: by 2002:a05:651c:233:: with SMTP id
 z19mr4827313ljn.486.1611733732967; 
 Tue, 26 Jan 2021 23:48:52 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id k5sm367349ljg.119.2021.01.26.23.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:48:52 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 1/3] target/microblaze: Add use-non-secure property
Date: Wed, 27 Jan 2021 08:48:48 +0100
Message-Id: <20210127074850.1886235-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
References: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, joe.komlodi@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <joe.komlodi@xilinx.com>

This property is used to control the security of the following interfaces
on MicroBlaze:
M_AXI_DP - data interface
M_AXI_IP - instruction interface
M_AXI_DC - dcache interface
M_AXI_IC - icache interface

It works by enabling or disabling the use of the non_secure[3:0] signals.

Interfaces and their corresponding values are taken from:
https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug984-vivado-microblaze-ref.pdf
page 153.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <1611274735-303873-2-git-send-email-komlodi@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/cpu.h | 11 ++++++++++
 target/microblaze/cpu.c | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index c1c264199f..199cfb02d6 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -233,6 +233,12 @@ typedef struct CPUMBState CPUMBState;
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
+/* use-non-secure property masks */
+#define USE_NON_SECURE_M_AXI_DP_MASK 0x1
+#define USE_NON_SECURE_M_AXI_IP_MASK 0x2
+#define USE_NON_SECURE_M_AXI_DC_MASK 0x4
+#define USE_NON_SECURE_M_AXI_IC_MASK 0x8
+
 struct CPUMBState {
     uint32_t bvalue;   /* TCG temporary, only valid during a TB */
     uint32_t btarget;  /* Full resolved branch destination */
@@ -316,6 +322,7 @@ typedef struct {
     bool use_msr_instr;
     bool use_pcmp_instr;
     bool use_mmu;
+    uint8_t use_non_secure;
     bool dcache_writeback;
     bool endi;
     bool dopb_bus_exception;
@@ -337,6 +344,10 @@ struct MicroBlazeCPU {
     CPUState parent_obj;
 
     /*< public >*/
+    bool ns_axi_dp;
+    bool ns_axi_ip;
+    bool ns_axi_dc;
+    bool ns_axi_ic;
 
     CPUNegativeOffsetState neg;
     CPUMBState env;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c8e754cfb1..accfb23a4f 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -98,6 +98,38 @@ static bool mb_cpu_has_work(CPUState *cs)
 }
 
 #ifndef CONFIG_USER_ONLY
+static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DP_MASK;
+
+    cpu->ns_axi_dp = level & en;
+}
+
+static void mb_cpu_ns_axi_ip(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IP_MASK;
+
+    cpu->ns_axi_ip = level & en;
+}
+
+static void mb_cpu_ns_axi_dc(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DC_MASK;
+
+    cpu->ns_axi_dc = level & en;
+}
+
+static void mb_cpu_ns_axi_ic(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IC_MASK;
+
+    cpu->ns_axi_ic = level & en;
+}
+
 static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -248,6 +280,10 @@ static void mb_cpu_initfn(Object *obj)
 #ifndef CONFIG_USER_ONLY
     /* Inbound IRQ and FIR lines */
     qdev_init_gpio_in(DEVICE(cpu), microblaze_cpu_set_irq, 2);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dp, "ns_axi_dp", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ip, "ns_axi_ip", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dc, "ns_axi_dc", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ic, "ns_axi_ic", 1);
 #endif
 }
 
@@ -277,6 +313,16 @@ static Property mb_properties[] = {
     DEFINE_PROP_BOOL("use-msr-instr", MicroBlazeCPU, cfg.use_msr_instr, true),
     DEFINE_PROP_BOOL("use-pcmp-instr", MicroBlazeCPU, cfg.use_pcmp_instr, true),
     DEFINE_PROP_BOOL("use-mmu", MicroBlazeCPU, cfg.use_mmu, true),
+    /*
+     * use-non-secure enables/disables the use of the non_secure[3:0] signals.
+     * It is a bitfield where 1 = non-secure for the following bits and their
+     * corresponding interfaces:
+     * 0x1 - M_AXI_DP
+     * 0x2 - M_AXI_IP
+     * 0x4 - M_AXI_DC
+     * 0x8 - M_AXI_IC
+     */
+    DEFINE_PROP_UINT8("use-non-secure", MicroBlazeCPU, cfg.use_non_secure, 0),
     DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
                      false),
     DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
-- 
2.25.1


