Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2757315B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:42:09 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXwf-0008Sv-0A
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZe-0005fE-KG
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZd-0004pZ-6h
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id e15so13117005edj.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+baRA/9fbuj7fG1YRTlplP/PEYlmL8FCzPzPRwkVAjI=;
 b=VGw7bQL2hqBA7pSX95cX9z66AxAXa3Xpvl4tit1luHoOoFpQmtZKV5nZX/Cs7tzDCT
 MfmLgBRojMJGgyQOMgRhl9N7Y6OERgtsMT7aup9NEvnVmWSwmklYHL6346zwD4G7dVGo
 dNmwaqsiAlLnC1XyrpzO2SeTsF97TNGFsTSd+sIb7CRPGFyJyXb6r4wR4KdJ8n7JMK+s
 rDYVeQDEPzHrjcuaDwc32GtuNhglxv0gyOvStlOgDVduG7ER6gdY7XAMIsfu9ggM72Xd
 1uO5mTzejbhUyaZcvbaFPFU5OAOplHKYAqt7u1cfAp9iZ+FFRorgSam3fee11HXv2IE2
 pSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+baRA/9fbuj7fG1YRTlplP/PEYlmL8FCzPzPRwkVAjI=;
 b=7gbeKuTHt9LjzX5BgxcH6/R+s2WxmQ1eL2uJ313Zn/4KANp6iGmYYq6KDGulFLMavO
 aTMteD7XycyPwsp/78MJXeeGrPwBVSBmhva21iov1vvdCmv47KIjyZrtl2UN/isbdLSo
 GnjMRkfPJYrGk1bRVP3o0gxkPBrJAyFBnUNLm1tjKOtctnTzGnwXHldiKnJQqYebezQi
 VOb1uC7kW/R0a2+x3lNacPyiu43SnHKMAeSKIG6m97JaPQnChafoJUB2JrMiWslA9VP9
 /AmNAMcVUdeMVCdfT7mFUBUockLxWZg3sitQP8VQobe9NFgbD38TMlCvr9beq774wBiI
 2d/Q==
X-Gm-Message-State: AJIora+U4hgWLiQiY3vBlWbLhMiNjHbe8AnHmkpC+g0fvMh7W4poEiBG
 I8LtiPNRll7VU2K1Kne8OMpX1av1vco=
X-Google-Smtp-Source: AGRyM1tdLO56aRtszk7FgSgNPhvzkcZN/b8ZG93PrYGwjHdxfcGo3DPEROPHSyZjvfOkysDpP8pBfQ==
X-Received: by 2002:a05:6402:3886:b0:435:643a:b7ae with SMTP id
 fd6-20020a056402388600b00435643ab7aemr3132563edb.4.1657700299738; 
 Wed, 13 Jul 2022 01:18:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/11] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Wed, 13 Jul 2022 10:17:34 +0200
Message-Id: <20220713081735.112016-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f843a73d90..19c86b68bd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -303,7 +303,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index fd9c8f853a..56a741c192 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -351,6 +351,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     } else {
         object_unparent(OBJECT(&d->pm));
     }
-- 
2.37.1


