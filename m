Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C691427B301
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 19:23:01 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMwrc-0004JO-SF
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 13:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMwkv-0004I0-IT
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:16:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMwkt-0006Nq-VM
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:16:05 -0400
Received: by mail-wr1-x442.google.com with SMTP id j2so2204155wrx.7
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0SJjFbd388FP7VtA2QlAZt9WxWleZmvszMYBtRcFk4=;
 b=vEBIzaBJU5zbztWgGW7hJlkht9On6XiGv1j5pQ8NNfJUgnrt/J/kdtwBCv3MM1CouY
 169jOeOZqM3TDSjrlIalCqGwKHd0Fl+aqUqGaYFfKSrnGga3sPwV+ILH4nl8gjLoPjdq
 QcF/8jxOMstjvyo1LEtCOROQmkhUc9tJ14N57GzVGAYvd25d/be9lbLJmU2iid+j3bCE
 iKFUa4lfl3n4DbxL79FpLYqEtwVURgooKmzFNXn/KeBj7t++01abdfOy5T+wdPUguvmg
 9mcnuauwMIUGHfiPTC97ibIXAnBPRNyrgyhc9nr7Jkl4WTKGQPyK2yfThqZ2WFLCXO/g
 PoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N0SJjFbd388FP7VtA2QlAZt9WxWleZmvszMYBtRcFk4=;
 b=K15csbfDE8Bp0WV1Yw91ySMFpFIlP91hnbF/JOGWq4i3vGM4wMR7wsfI6+HL8bIUrp
 uOXC7cY1jjMG0WLm+aU2m6qLtJk774cLX2Ib6a55gAjQN5J8JEb9qhK2PhxVTLkneN6A
 rCQTTCJEshlwGYkozsAZK+NrdaIK8WNXCAnZbRnW+dzP5ch24uYCmRmgQz1TBhZ2r92b
 7U1+OFsFQXXqr6JcnyO8Ss+DcsHoUUvFFefv1TCzQaBqiwqF0K1U0Z0zjJw6H20+/uCt
 s0e1SoBhSHAdNsz+8C/GHDWG8A2Cg7D/sSICkKXIv73BhwDrXMRB58qY+HHuKTZnxiQb
 Rr9A==
X-Gm-Message-State: AOAM5334JmxVmgZ8DpxB85zm/2o1NgtjDEuwoVtG99MAaGadpaXQBLPR
 Lq00RhUDzGvwFWnD2OKSHaQw0xucrhw=
X-Google-Smtp-Source: ABdhPJxSimyIe/fYvcWe0+M3xh7G3U1Ed6BNnVPPG+lCN9LfxqAPtpRiXrb+q7rlT59UmI4nsq/LSw==
X-Received: by 2002:adf:f548:: with SMTP id j8mr2927228wrp.114.1601313362209; 
 Mon, 28 Sep 2020 10:16:02 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id z67sm464787wme.41.2020.09.28.10.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:16:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] hw/mips/boston: Set CPU frequency to 1 GHz
Date: Mon, 28 Sep 2020 19:15:35 +0200
Message-Id: <20200928171539.788309-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928171539.788309-1-f4bug@amsat.org>
References: <20200928171539.788309-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Burton <paulburton@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The I6400 can run at 1 GHz or more. Create a 'cpuclk'
output clock and connect it to the CPU input clock.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1b3f69e949c..5c541a0c5ea 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -30,6 +30,7 @@
 #include "hw/mips/cps.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -54,6 +55,7 @@ struct BostonState {
     MachineState *mach;
     MIPSCPSState cps;
     SerialMM *uart;
+    Clock *cpuclk;
 
     CharBackend lcd_display;
     char lcd_content[8];
@@ -251,10 +253,19 @@ static const MemoryRegionOps boston_platreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void mips_boston_instance_init(Object *obj)
+{
+    BostonState *s = BOSTON(obj);
+
+    s->cpuclk = qdev_init_clock_out(DEVICE(obj), "cpuclk");
+    clock_set_hz(s->cpuclk, 1000000000); /* 1 GHz */
+}
+
 static const TypeInfo boston_device = {
     .name          = TYPE_MIPS_BOSTON,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(BostonState),
+    .instance_init = mips_boston_instance_init,
 };
 
 static void boston_register_types(void)
@@ -462,6 +473,8 @@ static void boston_mach_init(MachineState *machine)
                             &error_fatal);
     object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
                             &error_fatal);
+    qdev_connect_clock_in(DEVICE(&s->cps), "clk",
+                          qdev_get_clock_out(dev, "cpuclk"));
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
-- 
2.26.2


