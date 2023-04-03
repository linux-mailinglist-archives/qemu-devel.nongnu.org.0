Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F26D3E48
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp2-0001gI-Ts; Mon, 03 Apr 2023 03:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEou-0001f6-Fn
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEot-0006cz-0X
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y14so28276283wrq.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2bxbqf6j4QPQJIwH9ivxbi0oLjhsXkO+rq7lp2Eh9U=;
 b=WC5szrsbsTKCY9H3NIUWRSbAOse9TsOnH1X01M7jJFEyCnqYih84GDL/KdBhBXgvfZ
 cxx71VQpcKF9zWdzMnSbkpc1hfesym5CJWKDjgWmFqmwEAZxtxhq8nOHsCyYPynIYrS9
 BaLfK4jsrhCeSuXHGsXYL7fNzlE5hnc0hfC+2XsB/zKpBEIWgD6sfzdiEyxE4zaNCnEv
 162tllbbB0sUjNuop5fu0nl/n19meZoUfNaKBn50XCNcWvdCal884QeT/q0SEepuboYT
 CVmM6NveJXfoFPYDUH3UGFCSnAI2AjW/EN4i3xu23N5hvy6np1jlESM9iiQdcFx39cPw
 K01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2bxbqf6j4QPQJIwH9ivxbi0oLjhsXkO+rq7lp2Eh9U=;
 b=F0WZlucnwOPanV/Al4ENfL3LAIdHW9X4BevwIdT0Nolyi4k03AIKlFCXJwzQYB4xzH
 /vcNRvejgPctGU0yDEe/+frEYzvLwM9x+T8K3wrYRqqeWsZ3sQz9CsCQl4iuVI8AK6A+
 R/OHtx1TDQItLFtfuzFOqIB1etl4n/Pot9lr8vnePebphjWe0CLyMRs+J9GFC5j1vQWu
 wsiNXLUnGpn2SMptk0rHrL4ykr7oUBrR2SlX/L3aHBa3zVNET2QQlqFeu4FrGS6+wO+D
 JymzlsJFKVSquOtoyp/84RF0/UU3xroN3KG1M9LPnZw5zpDv6SbaxcSwmtsKRzppXEkM
 TmSQ==
X-Gm-Message-State: AAQBX9cKXtPiagrr5oUoQ2BAulkWoJ85ZxH/cy82zb8uIBlqxwYfo5m6
 vVFepOP+gO3KyJ6WAMZGiT0ITpG08E4=
X-Google-Smtp-Source: AKy350a8w/UjVGBXm/IvW1eiUEjt7WBOj3GvSpZIn/V9+4KAg1DkfQwNZGfsneF3GohAYNphgxwWGA==
X-Received: by 2002:a05:6000:ca:b0:2d6:5afe:7b91 with SMTP id
 q10-20020a05600000ca00b002d65afe7b91mr11692241wrx.30.1680507696091; 
 Mon, 03 Apr 2023 00:41:36 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 2/7] hw/pci/pci.c: Don't leak PCIBus::irq_count[] in
 pci_bus_irqs()
Date: Mon,  3 Apr 2023 09:41:19 +0200
Message-Id: <20230403074124.3925-3-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
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

When calling pci_bus_irqs() multiple times on the same object without calling
pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked.
Let's fix this because Xen will do just that in a few commits, and because
calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome.

Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
pci_bus_irqs() doesn't do a double free.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..be1c5d16ec 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
     bus->set_irq = set_irq;
     bus->irq_opaque = irq_opaque;
     bus->nirq = nirq;
+    g_free(bus->irq_count);
     bus->irq_count = g_malloc0(nirq * sizeof(bus->irq_count[0]));
 }
 
@@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
     bus->irq_opaque = NULL;
     bus->nirq = 0;
     g_free(bus->irq_count);
+    bus->irq_count = NULL;
 }
 
 PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
-- 
2.40.0


