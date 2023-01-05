Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8765EF06
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJR-00033Z-GO; Thu, 05 Jan 2023 09:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJN-0002xA-11; Thu, 05 Jan 2023 09:33:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJL-00074Q-Bu; Thu, 05 Jan 2023 09:33:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z16so19830411wrw.1;
 Thu, 05 Jan 2023 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWHVV9vda19NyRvqLRkxjGUSWjvbhCUasXFZrRPoMVo=;
 b=UDiHdVqQOBeHwH7grDRrTQuGos6rn9dsizXa/bCoA/GkfXxPlCjbE8oZ+kCWlPZ79H
 G+LYDmlbe6mIC8sYOCITZadYKk1v8ndkc7XCOWhoGtF7PJ7OMS/LIjPBPfLMxpT7nbUu
 o9F/fFIx8tpjDdTusqvWen1io5OGickBauKGTXDTO7+EVd2ytI0EAliR2ORak83pF4tD
 E+W19FkJheaiEVdImi0tyq4d2KEpX7T2Cam+VvVZmxLOysJMaTwOOajVQpPW/o88J+cB
 8LZK1RS60+6Np4yyeJ3YR9MJMd/WYbLPZw60LpZAASNnw48IlyOCfoOJXQXI0P8fCKyd
 NSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWHVV9vda19NyRvqLRkxjGUSWjvbhCUasXFZrRPoMVo=;
 b=QpGZg4xuaPW6A46uQTtVtCikMFl1EYOcbK5AlsLXvAhdXzY8FC2p3B3+eLksjO49ZH
 JBhCkP4v8lGsh+jr6gvb0Fq69agT9Tb0IIsln5JQDL153ZrLvsJuzXWhNW3TbYlUCHN/
 /bLwE7yK3r0/0XVvXyC+3nnTwPB7xmiqTBLXRIEhv4Qt6AZG60pmksp9fDw+/En7stw7
 s6f2yg9eMPcvKdr9aOlEQ+4aXJ5P38fR4rFdW9LtVPzzhWL83RR9p82bVH5KY3P0TB6y
 5VFICgqvQVEz2Dr6xrpJSAuyNnpVEf3qIFs88d+6gh6m3YqDr7j6ye/f6mljS9wwMiMB
 MRWQ==
X-Gm-Message-State: AFqh2krGgbFGrcB5yRndzEbZyiaHLUjUKKP1QJOy1tVVwWQrS03LbF8+
 CZZ3vDwpe1iTFTWVFdJi2NNrDYBrfS4W/w==
X-Google-Smtp-Source: AMrXdXsfqcj9oHXpfHEXK7jkIKXjBt6MaHkEJjHF4sD2kKwyZqIkgSFShnfpMZtf+LqBUHPeUxn2dQ==
X-Received: by 2002:a5d:4ac5:0:b0:273:bdf5:663a with SMTP id
 y5-20020a5d4ac5000000b00273bdf5663amr36063641wrs.26.1672929217336; 
 Thu, 05 Jan 2023 06:33:37 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 27/31] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Thu,  5 Jan 2023 15:32:24 +0100
Message-Id: <20230105143228.244965-28-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
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
index 81cb4e64ab..d8cd80e859 100644
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


