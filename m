Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29A69376B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:47:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBig-0006D3-Gd; Sun, 12 Feb 2023 07:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdP-0007mp-Jr; Sun, 12 Feb 2023 07:39:12 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdN-0001RK-Ru; Sun, 12 Feb 2023 07:39:11 -0500
Received: by mail-ej1-x635.google.com with SMTP id dr8so25791442ejc.12;
 Sun, 12 Feb 2023 04:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8u1HmbubAmPiDx1629mboTn4igQWkY+mXbaitofs00=;
 b=AopLx6by5+oH6jqd95dDIWyIYLBGKNQDbpCeHZip228PQO8iCSiZOLhjtDIkCeFQ2u
 nlwwxd45r1DeF4Mqfa+kK6eXcgR+HmMTaeql0n3bxxUiVdaBMTsGMDu1fnptvzuxlJmx
 LmyG2wIGuVuluDPKqqBDw7B0+tL3CRbEuQUa9np6FHzmKqlw4tPv2xuk3UmUYNrRCKG9
 3O1h+6bjaoGPdqOzI3C15g1u5Es3YMAAOEx5O2Skqqjyt97mAOVo+olxg6vZnXXXLiYP
 LhN4wkEZ8iaEZKpva0TL+FoHw3A5d4zq+AfEa+DumNPdxF2T391LoBD33DOntpoCyvfA
 51Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8u1HmbubAmPiDx1629mboTn4igQWkY+mXbaitofs00=;
 b=lRZHLswSBbDbujlaNZKASLPzQ7Ps3Wi43u4OYq64HtRvWbuW2Rliba6s9Yimc4Vwi1
 BpUsazxszn3r+WeZY+s10eoaMkT9meLZsoDV4J5cDINphQ/xLpXTEPllSRyH7+pGNVLg
 MJPpRhGD9MWh0odV9LaCO4uQjHtqu2fPd4F+Hr1XkJOTrgway1EEMSPY78YH23OfFH0G
 F1rs+pbfUOu0fxPRbglzT5dxIrgjlCak63BU+FLZLdv/8Fj9Hn0BtgHJBjDbVtj8hzY3
 owNWJiNXqhZ0yEU0n5q21ozJRsY7ESOE2L0N3A7t+u9HuiVOH08Xf8vXZp2CfdsCb/14
 F5yw==
X-Gm-Message-State: AO0yUKVojQ9Sf5/h3JXUnQ5L38XGvwEmVICc19FASlWBZ5xCggkWs4el
 oDGkdCh5lkFzWtx5kxsMOWX1rgJwad4=
X-Google-Smtp-Source: AK7set9oetNDSbKFt4j+c2MEmVfGPjArZJ/V2+zM0tlgOXeXPvAa6NyPYwxV6ga2xLe2VkN2XQvTKw==
X-Received: by 2002:a17:906:fd87:b0:8b0:c7aa:3b53 with SMTP id
 xa7-20020a170906fd8700b008b0c7aa3b53mr3800410ejb.70.1676205546988; 
 Sun, 12 Feb 2023 04:39:06 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 19/23] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Sun, 12 Feb 2023 13:38:01 +0100
Message-Id: <20230212123805.30799-20-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
index f904327823..4b48fe6023 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -345,7 +345,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -545,7 +545,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.39.1


