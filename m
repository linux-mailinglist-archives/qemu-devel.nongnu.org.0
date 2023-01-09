Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0D662D7B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuI-0003HD-No; Mon, 09 Jan 2023 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtf-0002jH-6z; Mon, 09 Jan 2023 12:25:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtc-0000zU-NF; Mon, 09 Jan 2023 12:25:18 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so21932003ejc.2;
 Mon, 09 Jan 2023 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rii9ZmdKPNRYuyNGcUNUU8qirt/EB9vaI3Aqh3cPmU4=;
 b=jMO5dniNOV4HmJ0wX2sKj+vPCdeA8KDiRUFmPPxH7Dq7o7Zophnd/3epwNXS4VlwZp
 rbbpi+40oLWkYceYGQOD6/6xSceD7ZiR05CEOxZSbTMppqJqnmy/2wo3rET8YK221/KL
 MofmUFTgpfsMn734Fl5oCxKfk8IwNtvtAEzUREFIl7RR+zf0urH+pxUlOTTUgcSV2JJZ
 1nyiTpgHgB0Ee9Hf4lpO/t/AMXf+KWHZMnYim65xlrDS2xtK+6BBT63kiqM204XeOUXj
 TR+zALdv63OQQu2YXpA9MNeH7B8HPGupzaNAKx8hBHlYBsja6UDTik7sP5ZPeuiHRDRD
 KHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rii9ZmdKPNRYuyNGcUNUU8qirt/EB9vaI3Aqh3cPmU4=;
 b=JghTV0D2TkCc3bfLIeOdavMHGMYEWfOIJFpByf82/FPP0F1P9RGI0VmrIrXPYNR46N
 82jK25b/5v7WdYDwLISG1n2sEPzCYjabuDFyvQ2lR1jAF/PV18JBI29aZS3JlrV9JGzb
 gGtWUjjJa082lxEYAZKb+a1haDUrW0eDNt5M8brigavB7mHuCMGvZjcfeeEZ8v7mNEAy
 7aLPjjoKWC25i684k8kNk3k4Hi4uiFU3pPYkFjxpv/9+zo4AMt8VSjgS9r+I6VRz3q+j
 7rjMFldVLKE6+ODtutPX1e5yaezABLp0a/jN3XswVYCrm9APn2hNNhPnkenNU/MEo5cf
 Pgug==
X-Gm-Message-State: AFqh2kr9VoIGlu3+PBEYF+8by9ZMTDfiugGLUm5czKEgsGnBFbigNklK
 TwmUI+of8vlV2ecZ5vszIcTkt91wMRNGtg==
X-Google-Smtp-Source: AMrXdXtl8LAbCqRMxR0d284ZbmacxkwIYfu9cUbdZVBWV+xJ58SGDuasKwriNs5TjB6fttNxJmLtPw==
X-Received: by 2002:a17:907:a50f:b0:7c0:d609:6f9b with SMTP id
 vr15-20020a170907a50f00b007c0d6096f9bmr61290488ejc.27.1673285113104; 
 Mon, 09 Jan 2023 09:25:13 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 18/33] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Mon,  9 Jan 2023 18:23:31 +0100
Message-Id: <20230109172347.1830-19-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-18-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4675981021..92d9dd1ae2 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -329,7 +329,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a549b1a8a5..6d2ffd449c 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -343,6 +343,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.39.0


