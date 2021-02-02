Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB830C998
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:25:42 +0100 (CET)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Mv-0005re-Mz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu3-0005ed-AP
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0002Io-JG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:50 -0500
Received: by mail-wm1-x331.google.com with SMTP id w4so2004907wmi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Nm5/v3GAFRWAcP6ZGflkMlT/2c75JEuKsAXc7vvx+2Y=;
 b=qW7dw+M6+S0YWhAbznoZocyEBhdmMKbDx0UEAVCDZervgwb8GfqlT/vB1nb2LXHswM
 HO+DWBZRi/QtjFiU1vLK8b8+khPekA8jCHqZ4OTza3/Kha0epeLxmOwJFARxhm3l+tJT
 vHDA+PDiJJ5JSvEEl/MDCajLbF5/UI09ndwvpga2D3cX0On19+kvysyeIBAUaiJcYaiC
 3AvE4EtQxriYEtcyvex4ilnKS3LZCUmgGiebhVhG4msNzQOFtd4sQvi679VXyqTqNJrq
 8X8gxNyGrwcwWFBuyhRn9cRgcV6EbPSCOVi/EfNpoOvaF1Mwt9+5DJxYWGrzkBcwfPmf
 up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nm5/v3GAFRWAcP6ZGflkMlT/2c75JEuKsAXc7vvx+2Y=;
 b=U8d8H8x4aN6mF1HPTnwsV8uVTroLeZPcAb/0w2CAeWunmkJq++mntJTGJRD2R12NmJ
 6BSr1r+tWrsc+6ZwWEc0w3zU0cbWUAo8xbwhdUwYSt6DONHddtBqQgsgrFSyTkD66ZAF
 yY2S156C13Baa5n5le7SHOt+7D6Ef0q35k9PKtwjjCCN9YQsf/OkuqP5hMwl0l96N/Vh
 n8HqTjxBilBsCJP9p5qLoWXqzuib9gffGFG++R1IskyOjD77pcOuo7Q57wq9R/PljcS+
 mxFbQqkspvWFQIGwDjqhMLyxDqHOIzr1bwz1OIf9O/LMjR0BePxPtSgoFo++DKe62sU/
 7uvw==
X-Gm-Message-State: AOAM532u/HLBuPkPJi+OpTl4yKoTKl8zHoEKRgIpg/GKwpWXrBFAttD7
 emYRldiRlcTwq2yhh0rN9ihDdzr84a1Ddg==
X-Google-Smtp-Source: ABdhPJwkPtTT8jPBnxo9Kl8QD02aFF+ojO5BAQnweAGia5hF5pMvEWrDL6DS7TkKxR3IB44I/tg/7Q==
X-Received: by 2002:a1c:1f4d:: with SMTP id f74mr4850332wmf.12.1612288539384; 
 Tue, 02 Feb 2021 09:55:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] hw/arm: Display CPU type in machine description
Date: Tue,  2 Feb 2021 17:55:17 +0000
Message-Id: <20210202175517.28729-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Most of ARM machines display their CPU when QEMU list the available
machines (-M help). Some machines do not. Fix to unify the help
output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210131184449.382425-7-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/digic_boards.c  | 2 +-
 hw/arm/microbit.c      | 2 +-
 hw/arm/netduino2.c     | 2 +-
 hw/arm/netduinoplus2.c | 2 +-
 hw/arm/orangepi.c      | 2 +-
 hw/arm/stellaris.c     | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index be12873673b..6cdc1d83fca 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)
 
 static void canon_a1100_machine_init(MachineClass *mc)
 {
-    mc->desc = "Canon PowerShot A1100 IS";
+    mc->desc = "Canon PowerShot A1100 IS (ARM946)";
     mc->init = &canon_a1100_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_size = 64 * MiB;
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 0947491cb97..e9494334ce7 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "BBC micro:bit";
+    mc->desc = "BBC micro:bit (Cortex-M0)";
     mc->init = microbit_init;
     mc->max_cpus = 1;
 }
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 8f103341443..1733b71507c 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)
 
 static void netduino2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino 2 Machine";
+    mc->desc = "Netduino 2 Machine (Cortex-M3)";
     mc->init = netduino2_init;
     mc->ignore_memory_transaction_failures = true;
 }
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 68abd3ec69d..d3ad7a2b675 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)
 
 static void netduinoplus2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino Plus 2 Machine";
+    mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
     mc->init = netduinoplus2_init;
 }
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d6306dfddae..40cdb5c6d2c 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)
 
 static void orangepi_machine_init(MachineClass *mc)
 {
-    mc->desc = "Orange Pi PC";
+    mc->desc = "Orange Pi PC (Cortex-A7)";
     mc->init = orangepi_init;
     mc->block_default_type = IF_SD;
     mc->units_per_default_bus = 1;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index ad72c0959f1..27292ec4113 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S811EVB";
+    mc->desc = "Stellaris LM3S811EVB (Cortex-M3)";
     mc->init = lm3s811evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
@@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S6965EVB";
+    mc->desc = "Stellaris LM3S6965EVB (Cortex-M3)";
     mc->init = lm3s6965evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
-- 
2.20.1


