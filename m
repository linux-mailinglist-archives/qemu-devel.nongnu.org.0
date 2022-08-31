Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2A75A824C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:52:45 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ1E-0001pa-AA
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvF-0002fb-9B; Wed, 31 Aug 2022 11:46:33 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvD-00036S-3A; Wed, 31 Aug 2022 11:46:33 -0400
Received: by mail-ej1-x62f.google.com with SMTP id fy31so28822836ejc.6;
 Wed, 31 Aug 2022 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=XGVDLu//PkX5DB5M+3wFUb6A2+b7TsOdxhKze6BO4JP4WB1eihbsrX8o9iWpQzsFup
 NsdVJdVhTzscOtakb8jgtJrFOQyhfhCb2g4RKq4xuHciWIzI6pBSC7xCBDjf0kisYq6W
 p5yDQAhAvzLtFAp/ybmJcrIQASvDnla9cyF6EzVp1bNAzkT0YWO3R2ejfO/ONBUttNtB
 AkgVmp2nCddxY4i8dUjtLBEE/PT9LSqMpOUvwZfujmEv9WKsgvlKqQW36waxEKYgEFr4
 5OnVq1zHSpsMyBxaefcBhw7qnKB+uWX2Oucr3kWyMVzgy/nK/smCZScewji4Jjde3NnG
 FP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=zYLcHdFPE2PFej+bfa3Pxuhs15roadDarxS3DMFtFt+czQRB3xZJvlfas56Sec8FqK
 vvvzfNjADAPW479LmNjepJLyDhGUwgvxKvAuIPZbTaOyq68MlrfL2Nm/W5cQUS4sYxEp
 4R3ozFH5QcOQTWX9c3/lVNJ/dSPzLqHMJ8Q75UMyeyhyhSxkGsMU7Xc4Mz4HxIFJTYwQ
 ikdlPBn44C2NxoHnjhodP2m6R0tQlmsPrYvMp+8E9t61ViKBWD8QoUwxM4q4lNTkMDY/
 LeGztGSDPswP7HDzDtho/XQqtEApR++y+j/MHh09fAHWOetMudyMovT2kGBnRogRW82M
 MkWA==
X-Gm-Message-State: ACgBeo3A6EYjjnrkyh9XQ+GxegrASBsuk//tNHVFeuvxrHAHef1fIWbu
 GfBLnqpMAOYMjItAMhbYQnWv5K5em1Y=
X-Google-Smtp-Source: AA6agR4UiN7P1de0TfveeRLbjdZ1nAI3+wsShuwBRhMcktcAvPha3wwyEUfsByUG8UXHWjLvV98/9Q==
X-Received: by 2002:a17:906:491:b0:73d:c060:7cef with SMTP id
 f17-20020a170906049100b0073dc0607cefmr21023395eja.111.1661960788737; 
 Wed, 31 Aug 2022 08:46:28 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 03/12] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Wed, 31 Aug 2022 17:45:56 +0200
Message-Id: <20220831154605.12773-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Unlike get_system_memory(), pci_address_space() respects the memory tree
available to the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9d12e1cae4..5582c0b179 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -589,7 +589,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           &error_fatal);
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
-- 
2.37.3


