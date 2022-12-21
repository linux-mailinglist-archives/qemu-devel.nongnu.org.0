Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436266534AE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82U5-0003kQ-W7; Wed, 21 Dec 2022 12:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82T4-0002yE-SY; Wed, 21 Dec 2022 12:01:23 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82T2-0008En-VL; Wed, 21 Dec 2022 12:01:22 -0500
Received: by mail-ed1-x52b.google.com with SMTP id b69so22862679edf.6;
 Wed, 21 Dec 2022 09:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTCCW0ON8RB5NiruOxLsVnohAZWP2th2OnvKcG+pDHo=;
 b=lUtHFH+M8StVtu5rbzbWnp06/P9naF24ZzT0rfy1NC2VJmovMtgHizO1Qo97jlZXUQ
 Wvf9VQt28J2IBIWtWHABfBOVb/yDh+TNhHvXDbH4XNStE62P7VRgfFHi2s06Rc+MPlza
 tTyjlfFlLzgVbeIFMIev0FR0ZFze9WijnofANvngPXt0s+HS/A56pV7o8a3J5TVjgJxI
 mGRPoPchXrbpKFENk2zGkntz7rqAL5XgbzaY1eu21xvP1cSBGzirBa5Gg0ZnyyNcs3QJ
 YqoZ4VuAY/23uoV5A8Fs2qIcpHqDM60YRfztUp1A1M3ioZ99fR873UZ3je1FBSXSnh5E
 W3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTCCW0ON8RB5NiruOxLsVnohAZWP2th2OnvKcG+pDHo=;
 b=hoSE9byukNt78T0GIBTV2LIj1mPUipUjzSYSd35nag7cdq5SiaYpWzGfVDFT0e+x+h
 aDLrqyY+OwLyTOn+YCFg+I0zOdRHbBUtqW4yPBwOK7RiEId/DVYYNxm3kTm/jLkDCkKH
 OdNf0Lz3Ej4O2tR18JtKFasCWXX4CCZmNCDwc8DKtNJsZJ/1pvA6b0OY2wDIUJPyrNip
 Mnxuo3gMW/JrpC2nml82Az5QKV73p7itFjcUcDXpd3bmuyK+Q2ycyohcRunrEwDD998L
 RKEDLhFWcVOAPd9+UM32PJrIG87zi/NtOGiVvTh0MQjE0VtTVT/byK8PSRETRoD9xRyb
 SSug==
X-Gm-Message-State: AFqh2kovTJbIA3Bqsb6dV6TRB0lHRLmuuAAUx9NMxubfKkpBzbbRJhcb
 94iY7tPSPaRH/dYWW3WgRWRQ0LNi4WE=
X-Google-Smtp-Source: AMrXdXvv5J2TxKQbntLtYv7CSW95vqNopUWTw3blaX55boTpabxA5MLnmktlCLzyqfSbpeuJTWUckw==
X-Received: by 2002:a50:fd01:0:b0:470:174c:4fe with SMTP id
 i1-20020a50fd01000000b00470174c04femr2041745eds.8.1671642078088; 
 Wed, 21 Dec 2022 09:01:18 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 26/30] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Wed, 21 Dec 2022 17:59:59 +0100
Message-Id: <20221221170003.2929-27-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

There is no need for having different names here. Having the same name
further allows code to be shared between PIIX3 and PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-38-shentey@gmail.com>
---
 hw/isa/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 4683b0fa95..0bb508481f 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -351,7 +351,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     isa_bus_irqs(isa_bus, d->pic.in_irqs);
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -547,7 +547,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.39.0


