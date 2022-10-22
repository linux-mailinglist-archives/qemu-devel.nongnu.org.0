Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA6609680
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:27:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhD5-0005mW-92
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG58-0007Br-3l; Sat, 22 Oct 2022 11:06:38 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG56-00022R-M0; Sat, 22 Oct 2022 11:06:37 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16071396ede.8;
 Sat, 22 Oct 2022 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPHyKII+3huW/6EhHJvechG/cjKKu95IorOjS8dDUC8=;
 b=kwhwsjAgpoXD0krfWSoA9lfHvew72aBMgIGH5fJo4Hyq9b4zEOyhmuxzpa5KANLDTy
 5C+smmKFCVZOpGxxPUtrQs3yA3O/DhEQOq+yIv2hiw2j4zHg5lnniZgMSBL5ZPudqIOS
 qXYqx+o+3cwAzfIF0kwv79Ock+1mOaRos4DgBWYBWo7kxDqErSgJJy4VLqsqnqDj9Q//
 Xzw7QDbBt2AKtjd9eYMox8VOX+G2GbQWhZtqDaH3M7NSA44IIrbKFSlEE65FH7Gl7h13
 MHyaWMHeCrVjOLjC172z+QEkf9RfKX19FJthJ69C33dOAPYqhiLUAo4x8rKKt+Fig5/Y
 kPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gPHyKII+3huW/6EhHJvechG/cjKKu95IorOjS8dDUC8=;
 b=Ql2r5hLiwg46lkCTr1OeWOi3gGe2mxcXPd7ZhA/X8Vq0efYW5FGRzsCD7Jt8voSPzB
 905LenC8eU6Pq8LdIPrING35OuGZb4bzH0K8Lmi2ULw3Hg3TGdlvGclsFQ8WtpHz8ZED
 67H2cFWQkJ/eq2pOPGqKN7vlHVOJgIUavP+4tsF9rblwjl3dfDAOhzAWQWm9WnHJ7ryG
 rHJh70hW9gMbA7rbqWs+/dBo/uPlSV4O8SMCkFeOaCnes8WBt7oAvpikzz+EW2UmbTXx
 bw0+csPWr15CrELeXd7DKmzqJek3llQuw6hh7Tl+8Pf0MCPhPxbYZH8CxXXXvxaVgmtx
 Cy5Q==
X-Gm-Message-State: ACrzQf0hIGrtW8g/VS902UJKqyDTtNjx5L+ndquLGCiKwickgX0os9HF
 6z2YLgO5bfHDUHOf9mdBIlJepqJpFq2FsA==
X-Google-Smtp-Source: AMsMyM7PS8pc7NTk2KwvpI9eYHAJOvPGDN0ypcLd3nFvGLV/xNQpKFtaXLICiP47XcItYBCWnYMNCg==
X-Received: by 2002:a17:907:7d8f:b0:78e:2cba:560f with SMTP id
 oz15-20020a1709077d8f00b0078e2cba560fmr20404256ejc.173.1666451195409; 
 Sat, 22 Oct 2022 08:06:35 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 17/43] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Sat, 22 Oct 2022 17:04:42 +0200
Message-Id: <20221022150508.26830-18-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 19fe07a13b..dd4e89acf9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -313,7 +313,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index bbd1dfc373..59599558a1 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -355,6 +355,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.38.1


