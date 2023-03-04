Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E186AAABC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTms-0003Jl-E1; Sat, 04 Mar 2023 10:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmq-0003E0-1n
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:04 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmo-00089L-7S
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:03 -0500
Received: by mail-ed1-x530.google.com with SMTP id o15so21449355edr.13
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIehz7iHwJm3nul5f2/1cK//AVrpTVcwyFm3oTuiRek=;
 b=JjHxuvqRSehB4SWZQIJWgbifoCNrJkRqnLhW7HaR5BIrroh4wlu8zuNlJJvBmvX12u
 z9snzLXm9yUNwFJyy+l1AAXoPuLb5fdKJAnOIDvzllbO0lDT/nFR7rRFaBGEf+E6w7Md
 FL/QWsc84qbr58n4yipieJWJMTWrzOorJixra400UcHX3WaMe1mNiS+HgvwqpwStOIa5
 stRlWKAzSv5u56HWVwgJQydoe5W0FTTLhD96CRt3xkQ38Qk7/DaDwpoiVsHoweSDkoEl
 /w7ysdkZQkqCCroSl9R1hP4CkeLrzDFQx4GZReiobyQ7lrXR1YlmIA0Xn5Gq3LhTkBlM
 eB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIehz7iHwJm3nul5f2/1cK//AVrpTVcwyFm3oTuiRek=;
 b=zriijNF8WTuU7uTwgf2q5TLYr8du4mukxxUMHPiBuwimc57q1F6NWQ+3sboJ2x6Szy
 FzOzENjboeaemtgimPyaNG6l8jDxg80Udn4KRx+M++REUuS+7Cft73iRz/3M+TSPXEz6
 qjC7AZ11HUTOqvFUVT4MiMrnXykuLg1VAXx1K3SRt4odj6UUYP79T3R00E3KIZ5iVSye
 hTVIj1U/0q7RSOKGJqvY3lt9HYkNo4Rp1gqf+81EtqBUgKsDSRPK0lEx3ks+6KfabayO
 DcedtXLZms5+0PojkSR2P4Q71xDJSXKX8M4OkVwfMrX/bN3w+FFSXQpg7oMhHLOY6eKI
 daeg==
X-Gm-Message-State: AO0yUKUYWzpWT7WVfaTw6E0LSQAxLvVn2SjKjs4j9PlLWabhp203UaL9
 XNSrkoBUVsvret1gZzkpXWTUq2x5fNs=
X-Google-Smtp-Source: AK7set9rcwkm0mYLurxYey53pQBAqV0qX46yEVl4dNVMTS2X81fstgJVY3wnOjKBZ2Zu+qaFOTZY9Q==
X-Received: by 2002:a17:907:608d:b0:88c:a43d:81bc with SMTP id
 ht13-20020a170907608d00b0088ca43d81bcmr5969567ejc.58.1677943620459; 
 Sat, 04 Mar 2023 07:27:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/13] hw/pci-host/q35: Initialize PCMachineState::bus in
 board code
Date: Sat,  4 Mar 2023 16:26:39 +0100
Message-Id: <20230304152648.103749-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

The Q35 PCI host currently sets the PC machine's PCI bus attribute
through global state, thereby assuming the machine to be a PC machine.
The Q35 machine code already holds on to Q35's pci bus attribute, so can
easily set its own property while preserving encapsulation.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_q35.c  | 4 +++-
 hw/pci-host/q35.c | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 68097bea55..42e79433a5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -231,10 +231,12 @@ static void pc_q35_init(MachineState *machine)
                             x86ms->below_4g_mem_size, NULL);
     object_property_set_int(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
                             x86ms->above_4g_mem_size, NULL);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
 
     /* pci */
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
     host_bus = PCI_BUS(qdev_get_child_bus(DEVICE(phb), "pcie.0"));
+    pcms->bus = host_bus;
+
     /* create ISA bus */
     lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
                                 TYPE_ICH9_LPC_DEVICE);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0497194983..9d21915a55 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -66,7 +66,6 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
-    PC_MACHINE(qdev_get_machine())->bus = pci->bus;
     pci->bypass_iommu =
         PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
-- 
2.39.2


