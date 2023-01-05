Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BA65EF11
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRQQ-0006Ys-3f; Thu, 05 Jan 2023 09:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRQJ-0006PP-QF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:40:53 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRQH-0003F0-Mr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:40:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1466751wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNDOqnsLbyhoDi5uMGk8/4UUP00n8RzWnJNlr2mmXCw=;
 b=u+oblYgDY7fD5KbasUEDoj5ricSGpo9z6Te0DEHS/SThi1t0rp/Fv8scGCdmt2GIlP
 pmEYoaESJHTQuCXvJJtnzTVnh3o1fFNZDG2hqM3P57ynBy/iCXkKPjOpYe/IsLcDBDVs
 YZg+LabRFF4d5wpM4fJRxknQE8NjxVGDVbnjfadaSXx92E2N6TSo8ZUIYRnWasGhoepP
 vJ04VRV9EO1n3/LbREv8uBGkuGjrpF3EBybBAcZ9tonptuJYB4chEPts6IW9UZJb6mpy
 7q8VcLuABMf5Pj5kmf60/EO8BqcCyBigeAk94CHtEUB0dPlH2fMDC1Y+MTea1ntE5OLv
 a5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNDOqnsLbyhoDi5uMGk8/4UUP00n8RzWnJNlr2mmXCw=;
 b=t5QbagcNK9D6XoyZaAYe8PZtsi7R4dMoxiDUDc2PMbKSIcBixwhx6i1DmWvXFphysA
 x5TlqoEPBIycwnMcEiCBuB4rXCvWrj/Pz4W2qKdGuB7YfMiiFYEOrQckrFIfHDMO6VxV
 xWIG6/OsBQi9OiDIoeBY3UUKTgR/zsg/tI0VLgEiqf5agUe+kmKfY2iVqXrWnLc6/JU/
 czSjreoAwvBgnne/2eDIr0SnZAnCr1xj4b+nsag4qClk8QEKki0QvoNMlYmnk+aOO9Wh
 5q3HKFeyy1pusnfEG33xmWYPOun+HO8JWUVh2PVSok45m3k1qOyfC51tKyp4vZ7yZ6Vq
 WD7A==
X-Gm-Message-State: AFqh2krsFkh/wk+5xm4Zr7vjoXhSEL9QxPfVrnjHDyVhPDRCOOfAXg/l
 zu3uhizwFnlZjkzIrrULSXx5XubiHWJrP7Hi
X-Google-Smtp-Source: AMrXdXtUdzQfZCdaIthHpZ1bmoKgUfFFqEdVMcyrdI0LWmObweZ2PwXERpr2EM259hg0RYgppYWG3g==
X-Received: by 2002:a05:600c:2217:b0:3d2:267d:64da with SMTP id
 z23-20020a05600c221700b003d2267d64damr35326920wml.10.1672929646406; 
 Thu, 05 Jan 2023 06:40:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a1c4c19000000b003d1e1f421bfsm2622176wmf.10.2023.01.05.06.40.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 06:40:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Date: Thu,  5 Jan 2023 15:40:44 +0100
Message-Id: <20230105144044.51822-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This argument was added 9 years ago in commit 83d08f2673
and has never been used since, so remote it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c         | 2 +-
 hw/pci-host/i440fx.c | 3 +--
 hw/pci-host/q35.c    | 3 +--
 include/hw/i386/pc.h | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d489ecc0d1..6e592bd969 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
 }
 
 /* setup pci memory address space mapping into system address space */
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space)
 {
     /* Set to lower priority than RAM */
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index d5426ef4a5..262f82c303 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
-                           f->pci_address_space);
+    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region",
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 20da121374..26390863d6 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     }
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
-                           mch->pci_address_space);
+    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d..88a120bc23 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
 #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
 
 
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space);
 
 void xen_load_linux(PCMachineState *pcms);
-- 
2.38.1


