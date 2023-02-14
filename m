Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E030696462
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9e-0007b8-P4; Tue, 14 Feb 2023 08:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9X-0007XA-Ft
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:23 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9R-0003uk-SL
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:23 -0500
Received: by mail-ed1-x536.google.com with SMTP id fi26so17248114edb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSHw5fSD+GawWcmcSXMGHhcAnPm8nrYU8mTyUZGVz+Q=;
 b=kMxyiP7ZJm36pRIGfE93DIaY8jxd6K+T7abPMd/4P8kLOSGYeVaHkKEFawtlH7GjLB
 KN+6Iu6Wl88eRC9Bg2RqeIuYkVoi1FEEUYE1klIa7wDg6yO9zDC7fY+6mtbsjMZpqHmu
 CXYjvWnTUjDA60iHSehzklkAccwzQNvMr3jISNi6Q5UOkd9ie5RCnqAh94lInsSTuMc7
 r2zXmgu9rtEQb3b5zysijWDZa1BPHFsoIgXTABYzzER78s2/QWRRhPfW0sT41pahmCjg
 TV4/D/Wu2knI8vM2a1NTDGGZHxjmndkd6aV1WXhnipBCmDtSAqi4k9/HP1lypXEv6b4d
 d4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSHw5fSD+GawWcmcSXMGHhcAnPm8nrYU8mTyUZGVz+Q=;
 b=3lzhFnCwEIynC+P2iRnF+upACnGVwow8n4uW2WKxLf2lfxQrIVqXSiTsHa/VF8x6Zx
 yeI8j0s028kcTjA8KyhyU4YPqFqVCC7qaPJpJzGhNZmrmxI7CcDuFsvOmSKZUbMZfT/Z
 5CKRxsse4z4SA8CobFFHs7qqggqGIXKh5gvCrpzKJOZ/MJtMU3CFsz5isNHLviV4aw7L
 m5k4YHQn0HvJZecv3pkpzOfDT2GkuHbTdZ+jikHfywdcxr5zk2h6FnptO25SHCt6L3WY
 vAjE8eQCHR/plFXyyXMkxwGAzFHnyRNt6elwdSOECRHU2QKaRiJ9aoHPAlznM5V3HApt
 onxQ==
X-Gm-Message-State: AO0yUKXeyEMwzHbyUUDJJDz/+OeZ/kIgB9Gt6XdBrD8F2iHbOLTRsXG1
 FpZOXddCP6PwLkplWrQARU0AFkl/TeU=
X-Google-Smtp-Source: AK7set/oZqQ8QjiYth3Wo2rNsCmIWqUd8KuSCGKkMsDoKm5/l96/4ODU8DDefVViMnEkRJgryVQrZg==
X-Received: by 2002:a50:8ad5:0:b0:4ac:be42:5c66 with SMTP id
 k21-20020a508ad5000000b004acbe425c66mr2768853edk.11.1676380516028; 
 Tue, 14 Feb 2023 05:15:16 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 05/12] hw/pci-host/q35: Initialize "bypass-iommu" property
 from board code
Date: Tue, 14 Feb 2023 14:14:34 +0100
Message-Id: <20230214131441.101760-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
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
index c2dc87acee..b3c55012d4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -231,6 +231,8 @@ static void pc_q35_init(MachineState *machine)
                             x86ms->below_4g_mem_size, NULL);
     object_property_set_int(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
                             x86ms->above_4g_mem_size, NULL);
+    object_property_set_bool(phb, "bypass-iommu",
+                             pcms->default_bus_bypass_iommu, NULL);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
 
     /* pci */
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 26e9e28e0e..0e198f97a7 100644
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
2.39.1


