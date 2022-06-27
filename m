Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AE55B82B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:24:44 +0200 (CEST)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j6y-0004C0-2a
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izQ-0003fr-9K; Mon, 27 Jun 2022 03:16:56 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izM-0003t3-Iw; Mon, 27 Jun 2022 03:16:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id h23so17091011ejj.12;
 Mon, 27 Jun 2022 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejXc4e4k71xe4RFsx8c1sx/U647khWejGVztu+EJOtw=;
 b=OXs/JI8Sweu7Ndy+YLWj5SIbGaX2kQTVq+tNFEdAYfHTcVJ6x3tt7zM5UNywgMPM8Y
 dL2rRrfeJpDOiNcouoA2pPpCAl3OARQ1q8gxD9MtpYyvqTxOlWykQFINUSz7zVDM7U2B
 Fd4/ioeuy/mLDvBE7lsfFhlptRaOeh+24U+ZGhbwn8tiU+xCPD4J4V3w8ARoMYl5QzaJ
 h+mZdYVd5u1bzHeq2ijZu5v9aIQkBoLGvM1bhUd8F5AlTMpk369YcDSBFaudh9rfgqqG
 ojQtbPx7uBzo1CXKkdqDsMgAYmgtLba6WCB3KWRAEM6/7hxBdciO/oA17xoCUpLfS/mc
 cVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejXc4e4k71xe4RFsx8c1sx/U647khWejGVztu+EJOtw=;
 b=dvQ0PMMaucK9KnsfHuRUeF4WhRKjPwJcNu08GEqM7eOaBBsrwXNf7BISihbUVcJO1D
 U1ard+7JW8ybvNA/eR7ISwyBre1dqvneJFDqTeCINKIUAtVXKbohEioj+n1OvwDNy628
 UNKzFhvcXlhWbXtoP3dfl1lEsLgDC76siRrnHWL4PONfAnDefD5qb/IwfX7uN2BZrsP1
 +n0XeMaUprZlCF0K1ZHetvQUeX6JeXr9FmHAH4P3X+166R/vRF5+1TB/Zc3EjCHgeoWz
 5tBkSx6kz4yDKVHbxVvyhDD2Qj9wGLv0B3jsoUw6ldx5Izmhh7ifEdoE92djtTlA2Yq7
 Mu9g==
X-Gm-Message-State: AJIora+p/adjhc0r7/AlYNQdTbW5SiIkhXXYq03+XvSJxiFbpy1IlsgZ
 BVlA77DzrpNZaxClKdxyNkxc52vtalqtsw==
X-Google-Smtp-Source: AGRyM1tNmkwasFTkn9ZFZ8xlzQJRLJH0vKPy8Vcus584CQOIs8DdM0+YcX6uAVds5OvvLotOdLjuNg==
X-Received: by 2002:a17:907:7f03:b0:726:2d20:ea76 with SMTP id
 qf3-20020a1709077f0300b007262d20ea76mr11385738ejc.586.1656314206361; 
 Mon, 27 Jun 2022 00:16:46 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:46 -0700 (PDT)
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
Subject: [RFC PATCH 03/10] hw/i386/pc_piix: Allow for setting properties on
 "piix3-ide" before realizing it
Date: Mon, 27 Jun 2022 09:16:04 +0200
Message-Id: <20220627071611.8793-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The next patch will introduce a quirk for user-created PIIX IDE devices for
backwards compatibility. In order to opt-in to new behavior for builtin
devices a property will need to be set until a deprecation period is over.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0fc2361ffe..2d146b19c0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -252,7 +252,8 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
+        dev = pci_new_multifunction(piix3_devfn + 1, false, "piix3-ide");
+        pci_realize_and_unref(dev, pci_bus, &error_fatal);
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
-- 
2.36.1


