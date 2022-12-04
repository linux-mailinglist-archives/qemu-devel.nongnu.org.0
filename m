Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49435641F39
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLV-0002Ga-2w; Sun, 04 Dec 2022 14:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLR-0002CM-Es; Sun, 04 Dec 2022 14:08:09 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLP-0001iA-RN; Sun, 04 Dec 2022 14:08:09 -0500
Received: by mail-ej1-x631.google.com with SMTP id gu23so23021640ejb.10;
 Sun, 04 Dec 2022 11:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUhmfhn/h1n31XjeZ8qtknm+5PRn+Cih/Y+qV0yaBO0=;
 b=my1ZyqFofd7zRHnKKYDij1GRfF91ASKGRuLOkSpXTadnARZW+IPGSTZEpfER7A1vC8
 wI0I5ZmcyjlBbpWAiDODVRw0KZs3oGSablNgE73GvfoiLfrmq2A9av0eFvFF1qZJ8gzA
 3NXlt//0eWq8DVhCRR/dn/W+Q+vJKFIdqD0v0MEVe4ZiHzCKFg6o2aGj7itW9d+id3kf
 Rfnkax0YGmiHzdoT8EnUb7x5YGhtOYMvRCStZXN8z6CSOD+q+6Z6k+8VaTAakPolm0wL
 IASs919CmxOA91hf9C5Bicl/7BEewQqN0Mefab+Jkr/fxihgTGa1k/SvuM6j8z6NeZ3g
 s7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUhmfhn/h1n31XjeZ8qtknm+5PRn+Cih/Y+qV0yaBO0=;
 b=KI6ywgmNLc5y8rhOffp+7QnSVJe0WrJNKljhbm608kbS1mqSREnBSOUmaajC5j72dG
 //epxeFFRyZ6KTyul5oc/8LK0W7sqNVo4Kuqg4MeYljVDH1QMnDQ/PL1roOF8L2dS8x/
 de4oNQmWByOsp+GkMb/xXi5vFA8J1GD4bgOn01tw0xgoejWREKdKjytbr4GbjmG+sNJN
 4erGLvFHZRdElQ3k2RMEOS8Hd491D8FbkMhJUVx33hd2XRIxW/JkHuA1iubAQ9A4kt55
 SblO88FSBWHUDTLa+v54TOcS1dfoS61KOkPDCdi2lTTQDrGdFhYsCe/6/KqErVc/RpIW
 aubw==
X-Gm-Message-State: ANoB5plfP21UaYzrTypb9S08gaRxfFMQkF4kNvPdUxPhcXQBEOzGuiBq
 c3l307pIdkR2krlUwyX0k6QEvz9TGRI=
X-Google-Smtp-Source: AA0mqf6xMHE/KNVgaUvkrGqr2GWH97KkiM2AwrzET2NHSg4eEnvIgeyBSLtJGFOw3AdEuv3/WGEsQA==
X-Received: by 2002:a17:906:2ec7:b0:79b:413b:d64 with SMTP id
 s7-20020a1709062ec700b0079b413b0d64mr49478680eji.538.1670180885503; 
 Sun, 04 Dec 2022 11:08:05 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:05 -0800 (PST)
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
Subject: [PATCH 27/32] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Sun,  4 Dec 2022 20:05:48 +0100
Message-Id: <20221204190553.3274-28-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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
Message-Id: <20221022150508.26830-38-shentey@gmail.com>
---
 hw/isa/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 75001ce528..035f64b928 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -387,7 +387,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     isa_bus_irqs(isa_bus, d->pic.in_irqs);
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -585,7 +585,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.38.1


