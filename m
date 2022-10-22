Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFE609731
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 01:14:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhg0-0001rS-Al
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5u-0007Pd-0w; Sat, 22 Oct 2022 11:07:26 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5s-0002KU-FS; Sat, 22 Oct 2022 11:07:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id r14so16114903edc.7;
 Sat, 22 Oct 2022 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCbrGkmcG+BWuVnx/vhHyEilPIinR6ET4jQmGiE7pNw=;
 b=U7lBSKKwGrG3O2kSkt2RfaZO6Xo/WWpS7JwlCJfPyg8zzHnzKwL0+7b6mXlRLqJCeI
 KBTK+5f4p1Ga6UyY034hdMQvZmYhrHBMNw0K7h1YyKOcJWguwAV1JO1xCE+zh/r8+44b
 QHjAg6X8fsqZGN6srs7WXrFcqacOpMza4PCjklZS2nnjZkc1Uuott1H002FaZ+pboZtT
 TKtVHJrScAjbgic/9KBftrwi5yct2rRlsvFrHqGQMbNdJw/rRjZMJ+7/CPdi+iTVJ8/W
 n/oOxD7avKRk7uGMrYJK7LYAawtF9ZhlRbwMWmh62Dl4gBPt+4bNV25/o5IandnbLVyr
 q+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCbrGkmcG+BWuVnx/vhHyEilPIinR6ET4jQmGiE7pNw=;
 b=BS9F1zd/XzS+eqSukVsX+0gEjVYdu5/ZxZcsGzoh3N8H6EozbvVmje60HE7BAJhjW4
 CUiBf74wgfVO5YP48LPIyxkl62RuqShLLnabKigbSgIch1Ad5gAhvDF9xqSnlHdAc6n3
 /m7A2GOPvdpjdVrvVqYkFzlPjVE76BBILoEacobNvoV6lwM6Qd15l9P8jnC8a0MMPz8N
 9o8AAIJ4SghZOxZaNTw7QaSWwRMKJ4jtRS/PH+InCiipUcT2+4joU5UMaV9cOWRGZW2j
 G527mddMVKXD87/EuvoDP7lUUxT3J9DCJ0jzknK4zAupITH+6TdRLXOsLj8e3bebHC8J
 X1+w==
X-Gm-Message-State: ACrzQf0CVOLhqcGm3dTiWjwyyauOFmYnOJI+DJfSFcXBmcYlonFQQgnM
 PoKHe/JkZcVKkTj8iyMl1x8g4RuIcJzKnw==
X-Google-Smtp-Source: AMsMyM4l9d7eohneT7E+G1weU1WvK95Du3tTM18Aj1iJILPUiCJMN1pV6wG7v+7SQHv2Y6SbF3cSpQ==
X-Received: by 2002:a17:907:8a24:b0:78d:cd60:1022 with SMTP id
 sc36-20020a1709078a2400b0078dcd601022mr20092187ejc.384.1666451243263; 
 Sat, 22 Oct 2022 08:07:23 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:22 -0700 (PDT)
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
Subject: [PATCH v2 37/43] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Sat, 22 Oct 2022 17:05:02 +0200
Message-Id: <20221022150508.26830-38-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

There is no need for having different names here. Having the same name
further allows code to be shared between PIIX3 and PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 5123474fab..55ed997b2c 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -388,7 +388,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     isa_bus_irqs(isa_bus, d->pic.in_irqs);
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -579,7 +579,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.38.1


