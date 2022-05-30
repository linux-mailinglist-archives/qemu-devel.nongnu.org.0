Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F8537A3E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:57:31 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve1a-0003gC-AJ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZ1-0000AG-FV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:59 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYz-0001M9-SF
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y189so10318669pfy.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Xg3ddB2ASNlFC7R7TJt/TAeFKmI/LPGXMVgfcznMf0=;
 b=mQK09UIXCOv/dAvenP8EcLB7GbC8/Bv3b1vlv9G6km3Y2JYf3LXy8EiJ98MU2lKy7Y
 5YDc/Hf8JHRvNEH+Br/ST56ZA/NXN+QRS+ZgX/fZFZbx1datiMVyzQfe2CfqUuhG85Gh
 7Xo/HuFis76AOVWNmYmBs20zYWXPnc+2s9IeZ37vprWAJKDa33gRcavnXrtW9uY/5cWD
 hKXH+JFGMfyU9gHVa4WBrlCo3Uva5QCgVANYeehy38UZSPaljuTkThYT7dS90wzxKBPM
 Yj4t0znta7yP/8W44pX+eiqclXwKwFEBH779NRhaPY/FFlWsfV0glRzyAAe8x0xGieqS
 V7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Xg3ddB2ASNlFC7R7TJt/TAeFKmI/LPGXMVgfcznMf0=;
 b=DsoitxjuNEQSdcLx1SpEtf6SFflGlh8Ih4hrOEPZU7OAp2sKAZjK1LtOxqXB6aZQ4/
 qQTsCoeLO+MBzR+07xZZLho8527XHMI2FMlD4Omb1E+DMkpPfVhdKRDUEG3avjLUoq1S
 X14Y1TqSkzFrMBP9EdFkgMY2X/es5MrKxxuSRYyayHXLT9p2OTxGHeMleScf4Xk8t9uo
 mMB/f+WofiTJjMtzuq72HMMlG1ghSS6PlkuF4iaWWQ39NKGioMWDPjUMW8MXx67PGcje
 GMwkvc5NEKh664BNTHRjxRkRAZcDRkAwVdTfrwt+rrVX+V+f7Q8JFrO/dMtZI5qpTgWt
 iK6Q==
X-Gm-Message-State: AOAM532ivVGiOd5LVppAlHax/cGCAyHqaBTTG/b5ABKl2rgt0eOuc1gP
 rPYlww8Ku5eJ41qtgIM+i4I=
X-Google-Smtp-Source: ABdhPJyJnBwmY334wWKxjsyfgqZm8oIRxztcJNCLi4S8SMovC5nTSJcQ+dTnVr2pXgwg+116gsxBEA==
X-Received: by 2002:a62:e40e:0:b0:518:3f5d:eecc with SMTP id
 r14-20020a62e40e000000b005183f5deeccmr16496571pfh.22.1653910076255; 
 Mon, 30 May 2022 04:27:56 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a17090282c100b00163fbb2bae5sm85700plz.209.2022.05.30.04.27.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:27:55 -0700 (PDT)
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
Subject: [PATCH v2 03/11] hw/acpi/piix4: convert smm_enabled bool to qdev
 property
Date: Mon, 30 May 2022 13:27:10 +0200
Message-Id: <20220530112718.26582-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

This allows the smm_enabled value to be set using a standard qdev property instead
of being referenced directly in piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220528091934.15520-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 558c250884..316e41e1d0 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -547,6 +547,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
     dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
+    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
     if (piix4_pm) {
         *piix4_pm = dev;
     }
@@ -554,7 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s = PIIX4_PM(dev);
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
-    s->smm_enabled = smm_enabled;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
@@ -664,6 +664,7 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4PMState, smm_enabled, false),
     DEFINE_PROP_BOOL("x-not-migrate-acpi-index", PIIX4PMState,
                       not_migrate_acpi_index, false),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.36.1


