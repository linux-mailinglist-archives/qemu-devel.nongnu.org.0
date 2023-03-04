Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B046AAABB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmu-0003M7-5D; Sat, 04 Mar 2023 10:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmr-0003If-AA
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmp-00089S-0z
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: by mail-ed1-x536.google.com with SMTP id ay14so17928501edb.11
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcmEd4diwhm8b1uCRcNdh3P72x85tYkeeTrt3/8M/N0=;
 b=IWc+5dS7QD2BdmjEtgr9I85YEk7dH3ZU3nsBfHY4YT7sCyGaxqpIjrqcwzX0Et/Z3S
 5LdJozBZR4OMB2HSf/HTfY8JXiGHkFrbosKw5IwoPmumYkarEvdkAMfWsOUYjZJnN/XL
 dbS71V1x8BqxApTEYtjjJQFGU260NpzileNQMu61KRq8wYSThF/QVtLZ4gbJ2QBI6pen
 vSHjqzfs1OMujL7Ylq0mFxFyZS5WcA5J60C1ENvuB4IgYQZ1ofgehLG+UGqQlqC6uKlr
 j8nldwFEF3vCzVtecNNLQDxJIDuZfA9wmb+76dO8eVkxvMN/vmBU2YYmz+pID8ItlGjN
 RYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcmEd4diwhm8b1uCRcNdh3P72x85tYkeeTrt3/8M/N0=;
 b=A+rDUl7nMFL7IBKvnP5WzVc935aISKnWoKK4VFXVu1uC4fWib0wiiL6I8LqxPSiOJc
 mNXKDIgEG08e7BVlXpkHXaOzCR+vQTlfl0HwWoM9hUsQ4GWyH5cKLOWHmUetRxAzL0hG
 JqkQ9nvV5wO2CU70v+/bLrWkyjAS7izKLK9FAgGx/wKZX+m/60lNsvz+hHvU4WM8B0xb
 Sk1SkHgkxJC7Aav16vn9eOubB0CZ0i6gfyzBxXxTYc6vqQVXdSRVDvtDoWSW1wMh5uFm
 01LVJrT7n4mlJqjEWH1l8TPOqeGnf/OXG4eLeWV0xmlyrPybmQRMjd2xjZFHCjZ/b4Bv
 bYCg==
X-Gm-Message-State: AO0yUKVE3XDLplc2LpswIdiAK24dw7SmH88rBhrO8EFVrgKrIAp18u16
 e1O7uD0W5B90H8fTGjlJH/RwKUDgQLM=
X-Google-Smtp-Source: AK7set9ei5TXsIdbUAURUzSZGvKsy0iQJ1P2MKuft3XCr+jKQDD/QBqmTRKOXV2zAIkI3fUrDUSnWg==
X-Received: by 2002:a17:906:8156:b0:886:221b:44e5 with SMTP id
 z22-20020a170906815600b00886221b44e5mr5513282ejw.62.1677943621264; 
 Sat, 04 Mar 2023 07:27:01 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 05/13] hw/pci/pci_host: Introduce PCI_HOST_BYPASS_IOMMU
 macro
Date: Sat,  4 Mar 2023 16:26:40 +0100
Message-Id: <20230304152648.103749-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Introduce a macro to avoid copy and pasting strings which can easily
cause typos.

Suggested-by: Michael S. Tsirkin<mst@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci/pci_host.h | 2 ++
 hw/pci/pci_host.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index c6f4eb4585..e52d8ec2cd 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -31,6 +31,8 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
+#define PCI_HOST_BYPASS_IOMMU "bypass-iommu"
+
 #define TYPE_PCI_HOST_BRIDGE "pci-host-bridge"
 OBJECT_DECLARE_TYPE(PCIHostState, PCIHostBridgeClass, PCI_HOST_BRIDGE)
 
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index dfd185bbb4..7af8afdcbe 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -232,7 +232,7 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
-    DEFINE_PROP_BOOL("bypass-iommu", PCIHostState, bypass_iommu, false),
+    DEFINE_PROP_BOOL(PCI_HOST_BYPASS_IOMMU, PCIHostState, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.2


