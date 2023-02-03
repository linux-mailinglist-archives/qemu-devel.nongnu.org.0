Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF468A47C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qc-0000KN-Jj; Fri, 03 Feb 2023 16:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QE-0000EK-3u
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:45 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QC-0006Ac-2H
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:37 -0500
Received: by mail-ej1-x636.google.com with SMTP id lu11so18899827ejb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTCwlrhJCIZguZaGgCCFrwh716fRCo2CcQ01yatwjNM=;
 b=YPv6OCOFNmSqb9r3qVkITNmE1Qe3UrWL+M6ecJq0nPLVjhWsyRVlxRvpqMr/cqJHfl
 Lwee2uTqRg0JcPCDYAp9X1JgPx0Ez5L2qL5uUDt3nb90wQk5q/9ZvIom27mItRQ8A3Qn
 YNI+CgRoQL53Ej2UFnF+CttqMPbmKJPK4zVPwMlIEmHCf0+HfNSv13QQeqY2JxGkPECT
 W81zAALLn5fTjSyXY6R3qF8UD3EZ40XFwuhFv4M9ISUWVMF3GHWFXIkxnVkd2OZ5yMtH
 4ILfusxe3w+ftE0h6qeor+eKwQlA1TU/LJRL7lscySQL294LkuxZjObV4wm7In9eKEJU
 TL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTCwlrhJCIZguZaGgCCFrwh716fRCo2CcQ01yatwjNM=;
 b=wFzVsDAkc8djXWN8BNIaOUcfdiRcaEq6mU+SDBigF54xnGpXT/QX3kHNtETsUbonT2
 h1kswnR2f6n/1eO7K4X2I15AmSy8la6nMcrTAQLTihMbfy4Hkv3QhGE8VDyMmW86Y4Wa
 HHFg3BHRdH7FGebT0nPrZVlifhd10Z8F3tszTB5dhjXbJyRYvCshBA2S/CrGcjcK7aAQ
 8HxkRcKC+lbnuG/kqexrnD8nuu2DU2am2hARjdg2uj186md+xjZcHOhqzVt/rZ616R3z
 d87fIv6AsNnclbVVj5dH5Cm+rcaaTP7gIJDVd/bAHwGE71VopOk5MdcHQzDvUgohuitl
 D+BA==
X-Gm-Message-State: AO0yUKXeTUvqkdSfp6EN3D5aocvu7ENaOYOlAPF3vaftOpyhwyWllR/Y
 uMn1PNS50IkLtWatxjjcxk0iP3yPsTvbVpV2
X-Google-Smtp-Source: AK7set/RKL/KJNGH8cOkpgT1wltjC+aixxh2EQ2D1F1Sr8FKj8uIFRv4Xy8witNB+ZTz2LwLJjarJQ==
X-Received: by 2002:a17:906:8e16:b0:88b:f26d:7b25 with SMTP id
 rx22-20020a1709068e1600b0088bf26d7b25mr3024678ejc.28.1675458994230; 
 Fri, 03 Feb 2023 13:16:34 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906408b00b0088a694749f7sm1889419ejj.4.2023.02.03.13.16.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:16:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/misc/macio: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 22:16:19 +0100
Message-Id: <20230203211623.50930-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

All calls use errp=&error_abort, so converting to the
QDev API is a no-op (QDev API always uses &error_abort).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/macio/macio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 08dbdd7fc0..66393280f1 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -128,8 +128,7 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
     sysbus_connect_irq(sysbus_dev, 0, irq0);
     sysbus_connect_irq(sysbus_dev, 1, irq1);
     qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
-    object_property_set_link(OBJECT(ide), "dbdma", OBJECT(&s->dbdma),
-                             &error_abort);
+    qdev_prop_set_link(DEVICE(ide), "dbdma", OBJECT(&s->dbdma));
     macio_ide_register_dma(ide);
 
     qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
@@ -336,8 +335,7 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
 
         /* PMU */
         object_initialize_child(OBJECT(s), "pmu", &s->pmu, TYPE_VIA_PMU);
-        object_property_set_link(OBJECT(&s->pmu), "gpio", OBJECT(sysbus_dev),
-                                 &error_abort);
+        qdev_prop_set_link(DEVICE(&s->pmu), "gpio", OBJECT(sysbus_dev));
         qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
         if (!qdev_realize(DEVICE(&s->pmu), BUS(&s->macio_bus), errp)) {
             return;
-- 
2.38.1


