Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D53F8D0A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:29:20 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJBn-0000rE-Ug
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImt-0005ng-17
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImr-0008UZ-1k
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so2655665wms.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iet8M/NeCrzb5+h+XHxXY29OeXdXIKP1DX2AdZZom80=;
 b=KO1WLPATQmkR6qkZi2rJumIbeztKXjPS3qr4o9iLnJJ9k5mTnBOnMudc3jowaBmg+b
 W4YFqt52Wt48vpDezJdwjPPNSpYjwQj28l4oK/IdDPijrZsfLmaHJHmlw7XGju+7Dpz4
 Y5mDNo+ABUIUvj90arkE3xVgKA9OtSBYA7/efchVEL2FZ4h1gcVLwPOWKDTJxE1y5w3Q
 8pPmpE2eZ7FF3boeL8qs3ZbJXUX8olTbWwm4XB/PMsrQlL31Ib7atC9JxLc7ynsVDQGY
 CnfE+C6IwM/lI+CwJyQZgX/kUv+MxvsH2ukh94O3v56JrDxOrj1Vlf4W2q972GBHEJu0
 sOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iet8M/NeCrzb5+h+XHxXY29OeXdXIKP1DX2AdZZom80=;
 b=YJrJVWKVw5OlZwjtdbe3WnF1Zcd+poOZfFfPmybypbFwbK1byQL3c3ZQFBBG0QiWFx
 1di1yzRTz0qext2SaFJKk/UBgGg0TFyLuSDmoRZja+i0ld4iFc2vzDcmwPMI7XZVWs/I
 7ddedNymy2NPFiKDKwGYj/E/GgBX1ZwJpRpIOg/uXy2NurvCp8JGvqpBOSmhS+I1JFtV
 d5mQBsnMgJFxVD5Hvj9R7qPrDDjhKOjTxJa8Z46xS1jFmJjasjBbG3qZwFVZXcVrth4S
 Pi0USlbIuAn1Jq4kKPv7ILin4iVaYPvAAEPhd0pWu6QQG39ZuOaPAt1gz4WdCaVwREbQ
 Os0Q==
X-Gm-Message-State: AOAM530tDQj0ZtUHTFKove19UxXwdp08mM5S4NCJIEdFTr53rApQNPUF
 syxFXyP8rsVv+p0Dx0c0qmUkKySnXd1l2Q==
X-Google-Smtp-Source: ABdhPJzqrw3Qb0UmcPZml6fSLv/W6CnyShdSYjTNds9u4gex0tz1fYGXmIKjuxu61mK5h5s+JNYksA==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr4673549wmc.113.1629997411610; 
 Thu, 26 Aug 2021 10:03:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/37] arch_init.h: Don't include arch_init.h unnecessarily
Date: Thu, 26 Aug 2021 18:02:51 +0100
Message-Id: <20210826170307.27733-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

arch_init.h only defines the QEMU_ARCH_* enumeration and the
arch_type global. Don't include it in files that don't use those.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210730105947.28215-8-peter.maydell@linaro.org
---
 blockdev.c                | 1 -
 hw/i386/pc.c              | 1 -
 hw/i386/pc_piix.c         | 1 -
 hw/i386/pc_q35.c          | 1 -
 hw/mips/jazz.c            | 1 -
 hw/mips/malta.c           | 1 -
 hw/ppc/prep.c             | 1 -
 hw/riscv/sifive_e.c       | 1 -
 hw/riscv/sifive_u.c       | 1 -
 hw/riscv/spike.c          | 1 -
 hw/riscv/virt.c           | 1 -
 monitor/qmp-cmds.c        | 1 -
 target/ppc/cpu_init.c     | 1 -
 target/s390x/cpu-sysemu.c | 1 -
 14 files changed, 14 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 3d8ac368a19..e79c5f3b5e8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -56,7 +56,6 @@
 #include "sysemu/iothread.h"
 #include "block/block_int.h"
 #include "block/trace.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/runstate.h"
 #include "sysemu/replay.h"
 #include "qemu/cutils.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a358..102b2239468 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -65,7 +65,6 @@
 #include "hw/xen/start_info.h"
 #include "ui/qemu-spice.h"
 #include "exec/memory.h"
-#include "sysemu/arch_init.h"
 #include "qemu/bitmap.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea92..1bc30167acc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -43,7 +43,6 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
-#include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 04b4a4788d7..eeb0b185b11 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -31,7 +31,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/loader.h"
-#include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "sysemu/kvm.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index d6183e18821..f5a26e174d5 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -35,7 +35,6 @@
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/arch_init.h"
 #include "hw/boards.h"
 #include "net/net.h"
 #include "hw/scsi/esp.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 7dcf175d726..b770b8d3671 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -38,7 +38,6 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
-#include "sysemu/arch_init.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index acfc2a91d8e..25a2e86b421 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -40,7 +40,6 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/isa/pc87312.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "trace.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index ddc658c8d68..5b7b245e1f3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,7 +45,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 
 static const MemMapEntry sifive_e_memmap[] = {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 87bbd10b211..6cc1a62b0f7 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -55,7 +55,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "chardev/char.h"
 #include "net/eth.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index fead77f0c48..aae36f2cb4d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -37,7 +37,6 @@
 #include "hw/char/riscv_htif.h"
 #include "hw/intc/sifive_clint.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a3cd2599a5..0e55411045a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -36,7 +36,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 9ddb9352e65..5c0d5e116b9 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -27,7 +27,6 @@
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac0..319a272d4c9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -22,7 +22,6 @@
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index df2c6bf6941..5471e01ee82 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -34,7 +34,6 @@
 
 #include "hw/s390x/pv.h"
 #include "hw/boards.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "hw/core/sysemu-cpu-ops.h"
-- 
2.20.1


