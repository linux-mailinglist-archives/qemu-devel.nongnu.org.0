Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4866E797
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 21:18:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHsO4-0002tl-Pv; Tue, 17 Jan 2023 15:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsO3-0002tY-3D
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:51 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsO1-0006Rg-Ly
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:50 -0500
Received: by mail-ed1-x536.google.com with SMTP id s21so2509298edi.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 12:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydeX9QFFdks9xGDUB7zYGvimiTN6pGP8Ia7mPwpsiT8=;
 b=M4a/OMcrw38n2lxsGg5Comb/Gw3G1TsBIhXkP7lju0H8oKPgaDw/zQl6fN3jqarBQO
 4DiFz9wFKFmAcPshH9+AYp+xpSwFgZQyC8tDGRnYvuoTwY4TavgWA3JA4I1hFUyN3YP0
 jFGymLMsrTpSlQuwWTR3smKdM+u7EDZzutHCtfSdLtpmCq9om8lnzaJDtrHJkRfoKqMk
 HDEzsvB7Qt6RZfpJt36HKB6DxZsLtYrgVwHt5dEd+7i2TiIaMfNLVB3lU4otUlYNrKDc
 irq+fcQYLxDIkUVmozwtsGzFdpad/u41gZMS+RcYiFUONXhhose8AU5qwnVjNFccblBm
 59AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydeX9QFFdks9xGDUB7zYGvimiTN6pGP8Ia7mPwpsiT8=;
 b=xYzZlfNemyUQdz+CagFeIeFIRc6ZG//ojhSyVjE0pyYSz8TwYnPEKeW6Ve5Zr+/f0t
 vCYxEf3ai1F3zhAz/ixGuKYFR+VVfj5pggwHfBm7GxHsB/AFWuiLVbVsI+5NKs32klBw
 TgvYis5LWYJdPAno1d9Nlw5G8DLCyeFFxxEa69gWk5tM/iq4tILoHu+ngpmHP6KftLtI
 LJDmDxuxEaNcDhvaYZfXjnCx0kmvL6KpfDDoRNHlQCS5KyHWCe+Qnv1nAngZOvxV1E28
 TSWQ7dj9IYr3IXm2ZbdtIVZdmVb6Q4ccE93oVOjcXN7cJg1T4pBzBLfKASc8CYD6BAkm
 IYvA==
X-Gm-Message-State: AFqh2krUx8mNHWetQUxi/1UFmXD5D9h1fPOUpK+xANt/VI3RHajSSgDx
 to9gn7TgY7End6FOCwrmSVh7MUT8fmP2U9Vs
X-Google-Smtp-Source: AMrXdXvArPq5hfpDLRQQ4/hB0PA0eLQ5zC1TOHFTsQyTx62PfN/DpeqBhWsNEz3kMdEuQZmfzdw4LQ==
X-Received: by 2002:aa7:cfd3:0:b0:48e:bb08:c96 with SMTP id
 r19-20020aa7cfd3000000b0048ebb080c96mr4005986edy.28.1673986608204; 
 Tue, 17 Jan 2023 12:16:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a05640234d500b0049c2b02bad4sm5746257edc.88.2023.01.17.12.16.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 12:16:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/ppc/pegasos2: Extract via_i2c_bus() helper
Date: Tue, 17 Jan 2023 21:16:39 +0100
Message-Id: <20230117201640.88365-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117201640.88365-1-philmd@linaro.org>
References: <20230117201640.88365-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Simplify a bit pegasos2_init() by extracting via_i2c_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/pegasos2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index f46d4bf51d..ac69aee099 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -96,6 +96,14 @@ static void pegasos2_cpu_reset(void *opaque)
     }
 }
 
+static I2CBus *via_i2c_bus(PCIDevice *via)
+{
+    PCIDevice *dev;
+
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
+}
+
 static void pegasos2_init(MachineState *machine)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
@@ -103,7 +111,6 @@ static void pegasos2_init(MachineState *machine)
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
     PCIDevice *dev, *via;
-    I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
     int sz;
@@ -171,10 +178,8 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
-    i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
-    smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
+    smbus_eeprom_init_one(via_i2c_bus(via), 0x57, spd_data);
 
     /* other PC hardware */
     pci_vga_init(pci_bus);
-- 
2.38.1


