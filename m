Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E665EEF8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJK-0002t9-T4; Thu, 05 Jan 2023 09:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002kp-Hw; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIw-0006uP-Uz; Thu, 05 Jan 2023 09:33:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id s9so4301436wru.13;
 Thu, 05 Jan 2023 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iS/t0s+kO/h2RwOcxnCdWLmYPedCBBrg6QHdOEUU0w4=;
 b=JT2+b+HNCME0IKpNEKGz1IlJYecfWVYHUcStDRyBa9Sur7UwKzyVJAjjrn6xiezqXV
 TIxy8J8V/QmQYcubgTrjEL12r/qpgj8ffozdzCsrSCGVEU2XaNGjdEtkkipJ6/RLxJpP
 WHKKjru0aUppYIBeVkU0hRUH77yVBI/hK8axjrd+gJud9GW0z6LBarI6FdA/edlFb7Co
 o/nX5wmFLpgaXLZlqmbaE0ZdbXk50KYGpjU4MljuAjwSLuFt5mo5ctTbWu2ntv/iOUQf
 vqZSkKInKKEIhFB57MGcivOw1KA9DPlDso3TNjiHbWMFH3PFt7LWSvWm7RZGhNnydeGp
 5cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iS/t0s+kO/h2RwOcxnCdWLmYPedCBBrg6QHdOEUU0w4=;
 b=fg8vSJEq1qOQv8AFMy3s3JinfTFlr+2ZYUnlkMOZEYbcfkliCVd/PM91NX0dZlN50T
 LTiDxL93PuD2OhcGp3iAUNtF1wzZRzQnnOgX9TX6ZTyAtECtrqkGfmLrOWUvLbHygNKz
 pSpf8mXZiKkirsbcPwDBz8jAvELVKQz3BzFktEgty1EqgyXZeNZwBCUyzpEPiWQi8KdP
 LKefuyyAiGBWtDdd501z5yiMaSJ7PrItXJd4JYTOYkF2JAomQjoXnwDV7BuVi+Q5hXLS
 rCUI3nt1HjhxB54K168G5B3vY6K06oq/N9r0Et8BzmKyc/Vewg7KyEUw472MPCk70sU6
 zYKg==
X-Gm-Message-State: AFqh2kqXxRjNbKRnQ/zHxLErN0iY4lfcF2BVs7b2ZvkDw89owXLzLM0t
 e4CGI2TuG0A8GicOMqoisAWpbAv2Dol7Ag==
X-Google-Smtp-Source: AMrXdXtKMmM0Gy5jTeGZez/wGnQP2ygwLacOSYu6D7StTPhi2p+X77lrSUcn2ImeGCCr2ktHT4E13g==
X-Received: by 2002:a5d:6f03:0:b0:28f:31d2:be38 with SMTP id
 ay3-20020a5d6f03000000b0028f31d2be38mr16337609wrb.43.1672929192550; 
 Thu, 05 Jan 2023 06:33:12 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:12 -0800 (PST)
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
Subject: [PATCH v5 06/31] hw/i386/pc_piix: Associate pci_map_irq_fn as soon as
 PCI bus is created
Date: Thu,  5 Jan 2023 15:32:03 +0100
Message-Id: <20230105143228.244965-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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

Observe that the pci_map_irq_fn's don't depend on the south bridge
instance. So associate them immediately when the PCI bus is created to
keep things logically together.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index edc0ac8cf1..d1f7d95936 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -229,6 +229,9 @@ static void pc_init1(MachineState *machine,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
@@ -236,10 +239,6 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
-
-        pci_bus_map_irqs(pci_bus,
-                         xen_enabled() ? xen_pci_slot_get_pirq
-                                       : pci_slot_get_pirq);
     } else {
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
-- 
2.39.0


