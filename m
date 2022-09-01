Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B50F5A965B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:08:07 +0200 (CEST)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTizO-0001Qw-A4
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaP-0005gn-JT; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaF-0000E5-GV; Thu, 01 Sep 2022 07:42:17 -0400
Received: by mail-ed1-x535.google.com with SMTP id z8so13387249edb.6;
 Thu, 01 Sep 2022 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nD+jGqQYURG5xsaq+oD5YvWClrYTdwH6ZUzIb2BISlw=;
 b=XgI3Owix+bZcz/DlrC+KRWcmv58MDaGLzhgDEJcek60YzA7H8+92egngPfO/zywx68
 NcyALEcomltHL4V31g9MNc7gdoItu5ArMLqYjYZ4oaIz9O966HoCQ7XOshxA7SQd1c2A
 J0E11ve+YNcV5p4AxNXRBWzv4wrWQ4PbvcrpoV+IFqyGEEFJLOfuRm/mp0yWp1GmHAsi
 89IjKAOsuOtxy8cSn5n1S69toSAEudaiCHQ1ANA9ifnyD9pJJIiSCHAUED2ykJ/1QODk
 WQb0L16UgI/N7u4cRDddwrhJUzUV6fm66khX4s7ap94ICaZAYJ4dYMA2TcnFeisRVU9f
 VZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nD+jGqQYURG5xsaq+oD5YvWClrYTdwH6ZUzIb2BISlw=;
 b=pEUjOiBOxNQKSikhEMnUUkoaiHstvhRm52kbtprN9CtG8G2LXRShPeBLjmhu7XpWwe
 W3gin1x8lVeIMzY2hG4e0jNiH/E/QHs3QzJnTaC30Q3gbAkb4yfqSf2r+2tBR5E+AGtw
 spdKjDuiAPMJxmbJY7jQFQQ7LyRgZ+Bb+2JtrFafKPgnPH9TNk01OQbg/mIbQ5V71FAy
 kC3yhyQK4rFqeQNYBPDhp2p1Ydu4wXOoC0xtKuUNgNZpPeJBkc1H2nTOmw0G7qsTtuYJ
 tOBVvi3GDyXzPg+bUboOd/Md6BQuKiNf6G8l8LRSwi0tPHf9gImKuwIkPhvKqZLDPEz8
 pRAA==
X-Gm-Message-State: ACgBeo3JrwDAT3kM6spaWotoiSJQF1dEvGlgtLU3PYtDOzbAebQ28bhg
 kNGWZ1ZD/3TKqjTKfY4HQkQJmxkJWIY=
X-Google-Smtp-Source: AA6agR595CGKvjC3SS6TUBFuUhbsBTdXvVdFa1LtSU/QfB9miUkOYgfIJppqyPhlIuB7MFX1F5MIUA==
X-Received: by 2002:a05:6402:50cb:b0:440:8bac:1e02 with SMTP id
 h11-20020a05640250cb00b004408bac1e02mr29137284edb.336.1662032520783; 
 Thu, 01 Sep 2022 04:42:00 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 04/13] hw/isa/vt82c686: Reuse errp
Date: Thu,  1 Sep 2022 13:41:18 +0200
Message-Id: <20220901114127.53914-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

Rather than terminating abruptly, make use of the already present errp and
propagate the error to the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5582c0b179..37e37b3855 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -590,7 +590,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
-                          &error_fatal);
+                          errp);
+
+    if (!isa_bus) {
+        return;
+    }
+
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
-- 
2.37.3


