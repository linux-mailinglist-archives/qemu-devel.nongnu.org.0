Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE488693765
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBiB-0004iV-L2; Sun, 12 Feb 2023 07:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdK-0007hh-W1; Sun, 12 Feb 2023 07:39:08 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdI-0001J7-Ed; Sun, 12 Feb 2023 07:39:06 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sb24so1914117ejb.8;
 Sun, 12 Feb 2023 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEU93Wx4BA8i3bA5LtOhAUmc0Begw/dol5OJq6wYHaM=;
 b=lpFOH0rdwfHvhvusVfWsMnxYEayP+92QgnqqjJyHaQ4KqYW99Q9RSWhLkv/gjytiWx
 FAfbsvnJmlDiGcfw7RCDq2WtjSy70svmeFUz7V017co8krt61FjCjnIy9uVRF2hDbPyA
 +Dw/a0LYvSrlhneoOg6RKtDQeAo+vAZPMXTqrHsrNVtm3Ok1QndStw7ZXgGLcPPDlfKl
 w9JQtEAqSebN5p/EH+WiETVt+JCEsWIX8ktE6X1L7vHYMfMbBcSZNV6Ah7/D3Ip1LzE7
 f0W32l9KlRKD68LRVwVKu9cF6MJ6n1ePw/5er+g/9wsNUjUGy1kFr1LdFTFlhNbyG+Ot
 Z5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEU93Wx4BA8i3bA5LtOhAUmc0Begw/dol5OJq6wYHaM=;
 b=B5x3bJa8AgcaV6VN0HKCTwb+n42Bdsc0WKe6Xt7O7mXwVq/aiwRTUZB32jyN0W1ufz
 6zYAw4zTFrLhKOa2SKMCR6ZyHNBnlieNNR26uSRvy72hqj+9GTwTj1y6j2XXKnEtw9N6
 SNc+DPr09hMyiJsHEVfVvFABTV0qYGs82qgp4jlBBkugWS20nmvk8OS9vypD3pY/tDcI
 T3upd413fV2t7+L6MKFI+CUVsTMTi4OlornLB6MiwwYjFo377VStsahEAI6vMB/4VTDf
 vnJJMrFzag5E5ZI9H23LBILIEsbqYUBVEeoA+C7EqZ0xB9DV4OAVBChuOyMY0wYrNKpg
 Jaag==
X-Gm-Message-State: AO0yUKWQXC9aCXqiB/hd3l9aibayiHSHGGcuNb2RWtBGmme+Dp7PcRVp
 64hdIgAH6DrrTp8kbK2areJK7XRoTaA=
X-Google-Smtp-Source: AK7set8Yxh+Ul9OaBeFi9j6T3b2thW3WdMDa7eBDR3Tqwc8CDgsa1Mc3uIxPGd0SMGi3gKxjalg3QQ==
X-Received: by 2002:a17:907:1707:b0:877:5dbc:da84 with SMTP id
 le7-20020a170907170700b008775dbcda84mr22586430ejc.72.1676205542661; 
 Sun, 12 Feb 2023 04:39:02 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:01 -0800 (PST)
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
Subject: [PATCH v7 16/23] hw/isa/piix4: Create the "intr" property during
 init() already
Date: Sun, 12 Feb 2023 13:37:58 +0100
Message-Id: <20230212123805.30799-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Only PIIX4 provides this property while PIIX3 doesn't.

Unlike initialize() methods, init() methods allow for device-specific
quirks without having to call the parent method. So move the creation of
the property into PIIX4's init() method as a preparation of the code
merge and the subsequent cleanup of the realize methods.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index df22c81cc2..7d4a66af49 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -176,9 +176,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
-                             "intr", 1);
-
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -239,6 +236,8 @@ static void piix4_init(Object *obj)
 {
     PIIXState *s = PIIX_PCI_DEVICE(obj);
 
+    qdev_init_gpio_out_named(DEVICE(obj), &s->cpu_intr, "intr", 1);
+
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
-- 
2.39.1


