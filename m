Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7486AAABE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmu-0003M5-1p; Sat, 04 Mar 2023 10:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmr-0003K3-TV
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmq-00089g-3Z
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: by mail-ed1-x52b.google.com with SMTP id o15so21449617edr.13
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XwcRBugUKmi6NmgV7b6lAnsORrC7wApaPC7DEE8Pf6Y=;
 b=dIkxyywrhgjtScBIiIQQFPbrLl449xR4t/HyI7MhVDELIHO02MmQURIJjrhiIlm1FA
 cBtK2XWP0kqUCGygz0KyS/tAS6JvLwdTCp2zRQaBgjLDkTFGv+oGhWpAlEIC5sa9zhWD
 Hahtb+tNip+nkaHGTkUqTWb1tRoCTbivMntkoKVL0z/FNDCtk3FzC4fCHNpPFzL8hM+R
 K56Zp21mV3fK1gl1WFJ1SADPQ/U3sImCg9gWC5edtz517KuAkJDnegrvC5GTHNwsSidn
 GXGrO4Nwidd9/RFjceQey/0GRvZ/F7cJum9OMSutUcUFJzg3O06tJvTIVh2jsi2nf1VC
 Xjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XwcRBugUKmi6NmgV7b6lAnsORrC7wApaPC7DEE8Pf6Y=;
 b=GsEAGq0Ih6+Nt23yzvvz5eOZ9eI1qVYkhL55dwy9oOV7kUPDe1eNud+KPPaCY/nQQ7
 uD4WaDGmG4acMqADAT4Dw5OBBbK5GvoKTuBK6JhtZa+IYszOY3Pp9xPM8GxiusRlNC1m
 i0JFDdabkN0Gtm1r25LRP3+4QrbAkoNqHTEiPazUv6S4okBVFst0Ee867MlDDVLpBF55
 MisZcwmTxtTiePhSpTTCWGmEyuwLWcCHq4Pl0aNJUHmKNh0HOvfIA6dLad296JEdY+bi
 B4qW0UTAR6tscKFatZSUZioiFd99GAugPXu18kNvhRcfH9VSnLA9yG8UMIz07OcNV8AK
 3CTA==
X-Gm-Message-State: AO0yUKU9RqUwM4KrGZ8JAozXbSg8b11KXTEez2J9F25MzXOAePV1sdrS
 3RcX5K41Sqyg2KpuGbF2IkPhfm3i0Xc=
X-Google-Smtp-Source: AK7set8pXPtltbogv2/AZ68I0YnqtzPzxMYZGQ/aCPf2J+BRTbfw7D7m9pM+3Iet1xCvvAI6hGxfoQ==
X-Received: by 2002:a17:906:9b88:b0:8b1:fc:b06d with SMTP id
 dd8-20020a1709069b8800b008b100fcb06dmr7217291ejc.77.1677943622488; 
 Sat, 04 Mar 2023 07:27:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/13] hw/pci-host/q35: Initialize "bypass-iommu" property
 from board code
Date: Sat,  4 Mar 2023 16:26:41 +0100
Message-Id: <20230304152648.103749-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

The Q35 PCI host already has a "bypass-iommu" property. However, the
host initializes this property itself by accessing global machine state,
thereby assuming it to be a PC machine. Avoid this by having board code
set this property.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_q35.c  | 2 ++
 hw/pci-host/q35.c | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 42e79433a5..d620d92214 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -231,6 +231,8 @@ static void pc_q35_init(MachineState *machine)
                             x86ms->below_4g_mem_size, NULL);
     object_property_set_int(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
                             x86ms->above_4g_mem_size, NULL);
+    object_property_set_bool(phb, PCI_HOST_BYPASS_IOMMU,
+                             pcms->default_bus_bypass_iommu, NULL);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
 
     /* pci */
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 9d21915a55..f070842312 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -66,8 +66,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
-    pci->bypass_iommu =
-        PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
+
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
-- 
2.39.2


