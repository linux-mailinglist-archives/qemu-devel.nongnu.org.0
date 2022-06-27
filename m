Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4455B830
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:27:57 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jA4-00088u-4D
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izS-0003gc-7O; Mon, 27 Jun 2022 03:16:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izP-0003u6-Pj; Mon, 27 Jun 2022 03:16:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ay16so17160780ejb.6;
 Mon, 27 Jun 2022 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oo7ypyvUebOkqcGL5BdIfd3NhdOwiRUM4reqQb4VVlY=;
 b=EbtxfAwAWU1lVQ9PL53Cyb8OMyhEzN3H3c/l+9/mpYym/pNV5bUqj8tlxMO4ut5C+B
 o7ZVnjfJq7MDdUdXQRKv6Db+BmbtulaBpUcYuq5/DdTOvJOy+iMN/DLJCX7QwwMBqL9b
 KtN2BBwjW1XO8qbtUCKo/BDW86Q+OfshbuA9d/OUElwoufNgUUfYY527sBQGXZcebPeI
 /kfyH9nLMp4O9bXO4uQ6r6iagMkOQIY/Ny/Gllyjxx+vxPuOZ9u7Y3J9XLeGKFbfvH3b
 uCWXPsb+nZLgzLg7u9FmeGAYKFtIALMZYT9KhgmhXHoI0der6VWVLy+VES/+iAGEKXLF
 y8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oo7ypyvUebOkqcGL5BdIfd3NhdOwiRUM4reqQb4VVlY=;
 b=IQE0xyWOR7kyv5L/PkS5av6PZmF/vz0LlcjYPM8yPLxz7UgBVjOLfeiigz4da6/cZe
 MY8qWJ6b4pOx7OUmvLL1RlwxLQY5IFZko0FezvH2HP7jfik595VSflKpH8yqt4Qzalei
 PzzeJRq0zDwhTwGsF8RqaVlxSOSObrRFMcBV2JjtYtESpY1KsZgxh2M7H7rTNKpfvuu3
 8om7WxGdUedZSawdAyaA4PmgbQDTGwlRceg/0KDYyxnQ01CniQoyOyxsAc81ELIPyx7w
 0Jyb/L8YDJxbluzhnAFFwseersIip3CS0H665RQOlesYqEOoaZZb2FuHIjzi538x7AKS
 l2iQ==
X-Gm-Message-State: AJIora+yCRkcL5+ZMROedqCh6hZQhSY9ZRVe5sVEiFxgy/hh2mFXQIFU
 lPy3Ft6JmuOE8fp+53lw8n4iRMB4WDZl3g==
X-Google-Smtp-Source: AGRyM1uMUKn6ZnmgPB1qUC4Qr31MCoBeyCp5nanYCIBQv0sJxcuZBXFEKrMbuyRz8UxZV52cHuD1DA==
X-Received: by 2002:a17:906:d54f:b0:726:4424:9d31 with SMTP id
 cr15-20020a170906d54f00b0072644249d31mr10450568ejc.227.1656314211776; 
 Mon, 27 Jun 2022 00:16:51 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 08/10] hw/ide/piix: Use pci_ide_init_ioport() rather than
 isa_ide_init_ioport()
Date: Mon, 27 Jun 2022 09:16:09 +0200
Message-Id: <20220627071611.8793-9-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

This should fix the last caller causing a NULL ISADev to be passed to
isa_register_portio_list() which now allows for disusing the isabus global
there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 312611c61f..087568ecf1 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -161,7 +161,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), dev, i, 2);
-        isa_ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+        pci_ide_init_ioport(&d->bus[i], PCI_DEVICE(d), port_info[i].iobase,
                             port_info[i].iobase2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(dev, i));
 
-- 
2.36.1


