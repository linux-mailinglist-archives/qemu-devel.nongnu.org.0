Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08865F065
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSQc-0002qv-3Z; Thu, 05 Jan 2023 10:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQZ-0002ph-S0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:11 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQY-0003e6-BN
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id s5so53308362edc.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXPMNZX6fFuitIkXKFdlOMBiwA2wDHbf5K45BryHz3E=;
 b=FEAP9qTBwUpponszU8DPrV4LH/6+nDZ48INW4ArzTdtZKS6CM9zQR/MTKVYqM6VuXH
 MiwybdsomYEVIKC+FNyNUsmRLmMuVfPWih/md2f9vcScfVMjGfhiDAbSI54IKxQ/imIX
 AaYNJPZ4mEARQ6t6yD3Xqv2UcA7qNXWZpXUnGNsuPZUCv1VhuYDN4dr+N4QyX0G7yKvI
 VsqenQJYl6m+qgvwZKZu8xvuLnVPq7+5JRuVhxaZGqpCFg9e20eSMmsNVZbCV4S2wVwa
 V/334VfIQJktsqXl98N0XI7teEK1MyewNrVqEK4eMZQ9KMfFMICdO2EvuPUYyUyD5Rdr
 G90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXPMNZX6fFuitIkXKFdlOMBiwA2wDHbf5K45BryHz3E=;
 b=D6Y7yhq9xCe69vK5h3BGhl2H+u+EIyXkA4ge6M1Ao74KWmxONZU3tOraXlWKp6z2re
 1sSbS8xo6I+AcIjoZCEnwBUpTvUmx2SFbPhoe7tBWdAI2aM7gzJuh+uXJSADIZ60nZJS
 +seWDgspS7hAQk7wrbp9HHXNkXNy5DG8nmSj5YyMe5rLCTgvxceIHxKCGUGFDLG/XdOv
 q84WLRVoPozvUQfMpsqOmnH7bnlSFPjL5YbUeMyXricI8MYTIqoNNHlIDjkddfOy5jIe
 skLnLmFLAbVnEvN8oN1dV7AV36ioXukdy2pcInVruY1IwL5z7j212FpwP0WkSTczHtQ5
 fTMQ==
X-Gm-Message-State: AFqh2kqN/YgphQjrAeXGYTot1zUeCaCrN6kN87CibcS9oDIV3zZFO71w
 SXRJqXUKmd3FzR+DXflVzH7wev22bvJ4CQ==
X-Google-Smtp-Source: AMrXdXtdukm9lTVor0SA6mZv2IoWLjoGcuqUZsRAPwoS9ft9Hp+Ojxnmn5uq48X7bQt7XUL48XyFMw==
X-Received: by 2002:a05:6402:43c8:b0:48d:a0fc:d334 with SMTP id
 p8-20020a05640243c800b0048da0fcd334mr13836274edc.30.1672933508810; 
 Thu, 05 Jan 2023 07:45:08 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 dk28-20020a0564021d9c00b004856bba2c8bsm12371004edb.47.2023.01.05.07.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:45:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/2] hw/pci-host/bonito: Inline pci_register_root_bus()
Date: Thu,  5 Jan 2023 16:44:39 +0100
Message-Id: <20230105154440.259361-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105154440.259361-1-shentey@gmail.com>
References: <20230105154440.259361-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

pci_bonito_map_irq() is board-specific but has to be implemented in the
north bridge because pci_register_root_bus() wants a pci_map_irq_fn.
Inline pci_register_root_bus() so we can move pci_bonito_map_irq() to
board code in the next step.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/bonito.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index ca5fa2a155..0ec437a623 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -631,10 +631,11 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &bs->irq);
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
-    phb->bus = pci_register_root_bus(dev, "pci",
-                                     pci_bonito_set_irq, pci_bonito_map_irq,
-                                     dev, &bs->pci_mem, get_system_io(),
-                                     PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
+
+    phb->bus = pci_root_bus_new(dev, "pci", &bs->pci_mem, get_system_io(),
+                                PCI_DEVFN(5, 0), TYPE_PCI_BUS);
+    pci_bus_irqs(phb->bus, pci_bonito_set_irq, dev, 32);
+    pci_bus_map_irqs(phb->bus, pci_bonito_map_irq);
 
     for (size_t i = 0; i < 3; i++) {
         char *name = g_strdup_printf("pci.lomem%zu", i);
-- 
2.39.0


