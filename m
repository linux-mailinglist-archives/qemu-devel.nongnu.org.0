Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6775F3FC2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:32:43 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeI6-0005Nn-4h
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9r-00049X-M4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:24:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9o-0004NU-Nh
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:24:11 -0400
Received: by mail-pg1-x530.google.com with SMTP id s206so12237439pgs.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/wY4wB/ohQK/ixOh+AwUZx64z8H5nK1+i4RzAT+ks7s=;
 b=lCu02r5wosrs0/79F2h83fxLHGEQkzxp2gC513SNhno/2VuUq7tfsWFJoyEfeZO3m+
 V2UKS8EsZCiIVNkV2syXpVnSfC3x0EAqJMlQ4G4uNhzZm62DoEQCW6H4+EDMQCTRPdbk
 VOfXtGzwngciR3sacGLMnkxZWemHl4ZIzttsQinoHoOm/cfGGyWD/1TfuaQy1mLlIqVw
 sURdFF2/e4vOa1g60KnM71zcNfu8g2KgMXI74bQUbp0X3V69D5OtXO8gBn5lyrrZLEL9
 93T6/MYMn7E8dH8uO85J2ddiA/r2y2QtLKk9DIkjiXjsqrzd/ac96Qf3QuybRUzqqjjs
 oc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/wY4wB/ohQK/ixOh+AwUZx64z8H5nK1+i4RzAT+ks7s=;
 b=4yImRW94qD8pStGJ0Xsif1dhA4epH7bAEQmtqAo+ZRni5VltVHnnUEoUS6QNB2sp/2
 EHV43Lkq/GIntXWIoS3nVUkRp3dmIDuCS2bgouik14fdt84AgKhy/Lk5trS53urpRMU4
 LJaaPr/DbTglYTyjbm8Cd+TierYfnzBwm0U1nV2MThVdFhJSgxw1EXC6ZSy/kYwebS0c
 ldlShJOIWYq+e8jqryzuDH+9ayRnTk7DaW6ZrvwZHoFK0rd812T36WWNqWHSo5TZdbe8
 RgwHeN08CCNh4kOIlvl9qm2+pPG5FG9PRV1ltkiPxXuS3Y/oyFhDh9xY8SIWQRn2uLQp
 f35Q==
X-Gm-Message-State: ACrzQf31xebe9lTQjN3rSzWeA5SPl2N2nrvPvFUpy+R1vEtJWI/cg6lp
 GdrvpMg3LsAzScKN0px4rmSc/w==
X-Google-Smtp-Source: AMsMyM75m/bJQI3JBriOhEmYCx4AEwO6hYD6He+dp0DVmyen50p4S6+u3n05+tft0VVkoVRVRdTn5Q==
X-Received: by 2002:a63:6909:0:b0:41c:9f4f:a63c with SMTP id
 e9-20020a636909000000b0041c9f4fa63cmr23234360pgc.76.1664875447384; 
 Tue, 04 Oct 2022 02:24:07 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Tue,  4 Oct 2022 14:53:50 +0530
Message-Id: <20221004092351.18209-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index befa9d2c26..de2efccebf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1267,6 +1267,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -1300,13 +1307,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.25.1


