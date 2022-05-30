Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8A537A2C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:51:36 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdvq-00050J-8s
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvda0-0001IS-Ux
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZx-0001SD-S4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g67so2314275pfb.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXG46gb5vDGhy9f7YsaXpUIkHYFL5rrxl3IChHngQk8=;
 b=elYiEcQXFDY27xpsylEEIIWEXhhyQ9cjDoxNf9kZExV0dvlWfYJDVlHtOsmlk3ajyV
 jbwuDNQAX8mrbK1L+iZjDssoHpw+81mw1yRP6hAxGGt8IoHoYaAZ4qlG201Li9mBoqHZ
 HkYxp/68QYiuxcj03nJwtO2iM+vc6FUJonlQDL3OZ7gR14MzP5YhqljbdHCY9/J2sOo1
 T/A73vYfBXuf9hWgaejHGq6IJPVFnYuzIwhZu8JyQv18t/H1qznwLn/ZRdvfi5Ck0Iyq
 m62Mdo4oBOGYohLd3ZsXsOuaZggvIfE6yW5z/AQ54EYDq+7DZDut3DCND8uuQT9sTUe6
 SpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXG46gb5vDGhy9f7YsaXpUIkHYFL5rrxl3IChHngQk8=;
 b=iIBN9ChIeQ4hh3fQAFCY03gZiU2vsg5y1PY9Sz1Fb5OOf3MgKyFeacWXnYlTtZTpEe
 kC6fHawfh0ubwx19qUVTM9x4Si3KNla4dLl5SWaRu7Qm59X5q/jG4s3qffMZH/zGcqsZ
 8kQ/xIb9MY1GnKMBSNINzFaHbPYurVnlLdQ9i5rqzJItslPsb78S41wmiOom5Sg+aJRM
 yFyFZv/poamDV1nCRPKJt6LNkBpNRGN+GZyxYooihRppJihDik9I6UnQbnxzkIXBeqN2
 6L6fbAZwjAdG8gQ6P3eJ8qykx6VCGDTjAodIPGPGpaSYvXCPsdCj1HSqlheFmgRN9bSW
 IXgQ==
X-Gm-Message-State: AOAM5318XkYPWUp/UZKgW9E74/nirwoHCNG87DZNPsCxp2Oz35WtZDeW
 TFNwDiO2VMhC7ap4jxxxsv0=
X-Google-Smtp-Source: ABdhPJxzp1l5rTrRjGHEMc7M/3t0t1mfohEH8iMMMR6XOYk7nTno3V4mh6RJ9tQbVGjP7h8vnUnEtg==
X-Received: by 2002:a63:a47:0:b0:3fb:4c3b:a9c3 with SMTP id
 z7-20020a630a47000000b003fb4c3ba9c3mr16589805pgk.151.1653910134959; 
 Mon, 30 May 2022 04:28:54 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a63574a000000b003c25dfd7372sm8173575pgm.26.2022.05.30.04.28.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 09/11] hw/i386/pc_piix: create PIIX4_PM device directly
 instead of using piix4_pm_initfn()
Date: Mon, 30 May 2022 13:27:16 +0200
Message-Id: <20220530112718.26582-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 683ec39b80..d6668b7c06 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -281,11 +282,15 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PIIX4PMState *piix4_pm;
+        PCIDevice *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
-                                   x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
+        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
+        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
+                          x86_machine_is_smm_enabled(x86ms));
+        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
+
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
-- 
2.36.1


