Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC964641F2C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLT-0002Es-OU; Sun, 04 Dec 2022 14:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLP-0002Aa-3F; Sun, 04 Dec 2022 14:08:07 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLN-0001cz-JK; Sun, 04 Dec 2022 14:08:06 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x22so707016ejs.11;
 Sun, 04 Dec 2022 11:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O21mvhv0jXquAoUuO39uCEwvUB1QlIRX94aQwEjiL8g=;
 b=HCznjU4P5UeVcFhR9GpboExF8vtWCS1f6TbzCLG5ZeObY16p2FElbIDqVo/oXzObmF
 0F/zMLvBnACHhdMOf54V3FMii/pua7z5GRQ8lwJY1+hLyNlxI+Jr6XbJs/UGBHVGYJd0
 /WjFRVzQFR545xdICK2DIffZfTYS5hG6yfw8WU6lxy/I79yZVNK/xFRazuNeZvoKobM0
 3hmgilWyZco2/Cv4LDjpKK23drHWTdtl33vMKUjcu0tH2x5Awcr7hWW6GyTOVMMJba46
 fgrw9EN5Xfgc4b4JIhJFO4bsmQzRlIg/S0KghjjibzwUdcfOcyhwXSfH264aTDzGbSjy
 +Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O21mvhv0jXquAoUuO39uCEwvUB1QlIRX94aQwEjiL8g=;
 b=0XitCyVYgec0zwgOYlWMlRUm6fvuNt1tK/o6y0XepsAbYc1cPbgtKwa2lDLP9F+vDz
 d+10D/ofgooBWFARQMdfDE11AxZbVnAAq990fPeDHF8yuZnwU2mfjwGJ6Fk7o83qAqLx
 rFiuDzUx2crRP0CFBwq1HivfxSvWV222TVYuSgEPHrnf2+ZUZn2UH5GQtogwt8kbqvCp
 h3NCN2DjhDSQ8bzZnh10kvIStYuJe+7aiK1ega3aYFGPmBb9mMFo3GCnRQh0EkvaC1AX
 j25kJngi7thO6ZZ1HXaCxVaQlNz+V4UPR/qzv7IPEI08fMESusWSCEOo/0yzJ69OmTdf
 kInQ==
X-Gm-Message-State: ANoB5pnDbrQmjORF4FIoO9kwcNzVq32xizczvh5CYC0hShnmEtl0gmY6
 SDQGPvOR/rivMaZ9hmn+88sruyhfong=
X-Google-Smtp-Source: AA0mqf7zM1mm6qYInAB60oktzD5cy+Gj3CzzPHqOfgs23JqPtnIZPM7vlUSfjxt8kSn3hYyb4qrQ1A==
X-Received: by 2002:a17:906:52cd:b0:7c0:f212:46fc with SMTP id
 w13-20020a17090652cd00b007c0f21246fcmr1864091ejn.214.1670180882415; 
 Sun, 04 Dec 2022 11:08:02 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 25/32] hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
Date: Sun,  4 Dec 2022 20:05:46 +0100
Message-Id: <20221204190553.3274-26-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Prefixing with "piix4_" makes the method distinguishable from its
PIIX3 counterpart upon merging and also complies more with QEMU
conventions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-36-shentey@gmail.com>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 13ec2503d0..e01d6ae00c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -63,7 +63,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+static int piix4_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
@@ -249,7 +249,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
                               qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+                 PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
-- 
2.38.1


