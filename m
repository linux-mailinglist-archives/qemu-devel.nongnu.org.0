Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCA641F17
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLF-000238-Im; Sun, 04 Dec 2022 14:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLB-00022P-Lp; Sun, 04 Dec 2022 14:07:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLA-0001c1-5f; Sun, 04 Dec 2022 14:07:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fc4so16120845ejc.12;
 Sun, 04 Dec 2022 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIt81xygjiozkLrMxxUSiCzdICf1SNZEhu1dCkUo0t8=;
 b=S0Wt6N4A+CF4+ba8sI1tzngt7CtWtR1UaeQkFViJ5OChJPbPUxJeAGwMNbNYHN4fnz
 hqAOJDLOaTXy4Ef79eAxSHkkfnUqSxQ0YYG/W9d1lf6od9qCochTAQv2f5kMS4+gyWjI
 bLnCRoQZCnA1Z0QGKx4Y81sZlufYub5JxZCRLHadBlK6yCZC6hxJ2tBuK8qDuCtn0Xch
 k8j2xgdb6B9mp5jOQvVjmAV7MXLVQwa6sCp3CwUzuy9x8dM2ntBHtEuiLyjoG5DpSscf
 2dPBrchCxQTsas5njvOn71bI148cNkGqoB2MMp3aGZFa+UViOOtAeV8x4boDq/bZFgFW
 E0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIt81xygjiozkLrMxxUSiCzdICf1SNZEhu1dCkUo0t8=;
 b=7FliAnsh84/BsX3MYPyC986urzmyKaScfNfOD9zOs6MFxrRy268GaQdKJMFOqlOEjH
 CeAvM8ddWvaOvT17yQgpIMSQ8Fpyq9NMstnl68sjR7pbvfvTYcrxIQSGDK8algaMgcBa
 D99Tv6SfilLJHnC+b3yQ2kfgirc2XkjdTImC8GyqD+8JEaDIBRz33enhs3l+QJQFKeeX
 zjLNCgsoWZjGIGO49yck9cLGKvi2KaFuDwjG36sA68MmZ3DM2Z5EDo2UkSPpBPReafo+
 Vfi7NV18dkRh2b/o/mElIiWi4J6aSZ58DJ5FBWL0H70g0DMjYFXGZtc0J42RJL332KQ5
 iq/A==
X-Gm-Message-State: ANoB5pkVNPD7G7ETUBkDswf891/wstSjUR+kwizIZUqm5h60+pNUvyQW
 vWIZWaTzkMDj+xKvdPneqaz0Z4rRgCA=
X-Google-Smtp-Source: AA0mqf7c8g3Pncj3onYnaHDXZ40gUss34Vs8UlVQmdYsIWqnTkgY517ebbAvNfjTCZnr6NNw/OkLVw==
X-Received: by 2002:a17:906:a38c:b0:7c0:d58f:3409 with SMTP id
 k12-20020a170906a38c00b007c0d58f3409mr5703382ejz.416.1670180870991; 
 Sun, 04 Dec 2022 11:07:50 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:50 -0800 (PST)
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
Subject: [PATCH 18/32] hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
Date: Sun,  4 Dec 2022 20:05:39 +0100
Message-Id: <20221204190553.3274-19-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The additional prefix aligns the function name with both other
piix3-internal functions as well as QEMU conventions. Furthermore, it
will help to distinguish the function from its PIIX4 counterpart once
merged.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-24-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e99622699a..7faa699a3d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -85,7 +85,7 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
  */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
     slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
@@ -448,7 +448,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix3_set_irq, piix3_pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
-- 
2.38.1


