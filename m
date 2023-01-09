Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678E662CEB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:36:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuY-0004GD-6w; Mon, 09 Jan 2023 12:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtr-0002un-ID; Mon, 09 Jan 2023 12:25:31 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtp-0001VO-Tp; Mon, 09 Jan 2023 12:25:31 -0500
Received: by mail-ej1-x62e.google.com with SMTP id u9so22000391ejo.0;
 Mon, 09 Jan 2023 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWHVV9vda19NyRvqLRkxjGUSWjvbhCUasXFZrRPoMVo=;
 b=CxsY7szcW3Zk7/859GqPV5zuRfabKRBm7HWvmuaGOxy6NouV5OFjtxN0edRLgvslob
 CqlivS2bF5+nFfCt6yUjePnQ2unJv0Dm0LqwfVppMpfVDJN3mlF1avAFGNz+/W8Xg0lD
 QUEhrofY7wSF+E7BmdxpBAcaNsi0WZjiRQYz4emGLwU42/i9V89qRU5sMBTIHSRaIphk
 vHk0MhuLVKemzEWEczF8Bi4DaOz8vTSVDK+gAlFjPbNBg/ihrU6/3ktGGWYlrbOxpRCO
 EhLeOX/F/lGgqF/cL0ONW4QX18xtVkUuXOSeHhsszx6l3HA0j6FUj7l0WS7aaxq4jXoM
 9rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWHVV9vda19NyRvqLRkxjGUSWjvbhCUasXFZrRPoMVo=;
 b=2PH21BdOgmW2cFBWL5bQ5shMBox4eyYq3B8EN0Wzo5MZImlFhGl3BxzFG6HVgsqiFv
 IfKxoCMIjfEXMJ+xwKfwzh5ItDovw0S0f6iIrJAjG8BbcJDO5GZqTx/djut8+z8WTneG
 eP8AmcMoTa6/uLZpT4kiYZgc/Ii/fIVF9ZF5Gw2DVa6Vvhg6G8vEzpMQYlBdgfdBQHoF
 m+obsx92dV4pwX9gfYq8EoPr+tACgCjG5aoei+y52vxNatUnq8T8e7weziSn0JJhJUwl
 nhn3OugIxZfsVAmOwlV2LUKCFkHYOXfUblHKtQbza0v0ysjEuH0ld12S2wK09sLVINlW
 a7qg==
X-Gm-Message-State: AFqh2koXhtfIcaFO9iufpYcSzo0du8p+DXpiP6DajnLfXpSw+NXOCEey
 G0CJyjyfMeSm6tHK9nU6DG/+Xnr5xUjLJw==
X-Google-Smtp-Source: AMrXdXteBlPaDvORh+ocargUarALhCfwi+Lp5LmJF1kbfeIPv/eS8Ib2PaoLrqgpSXgnXKTdI7PORw==
X-Received: by 2002:a17:907:c242:b0:7c1:9e6:d38e with SMTP id
 tj2-20020a170907c24200b007c109e6d38emr67015464ejc.67.1673285127067; 
 Mon, 09 Jan 2023 09:25:27 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:26 -0800 (PST)
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
Subject: [PATCH v6 29/33] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Mon,  9 Jan 2023 18:23:42 +0100
Message-Id: <20230109172347.1830-30-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
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


