Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A875362F47
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:37:50 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiKi-0001RX-Am
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEI-0001q5-PK; Sat, 17 Apr 2021 06:31:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEG-0000zk-Vw; Sat, 17 Apr 2021 06:31:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id c15so20075330wro.13;
 Sat, 17 Apr 2021 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5A08oqJfnwHuu4IIvHVyo2CuhBx8oIfeNWXxwFL7uE=;
 b=QvJcVwgjwo/yqaRENhIL6JYzDNYm0QfGCfHXA36JgYq698gGRG+bGZ98BrpmcbPNen
 9odV19fsxLa5woaotQsV3fOExc/BH1OAuBeBFw9QzsTmvda50Sf/6FDp3vQzzY7y6LRP
 R+0eFzWsDEyJT6Ytd17YwAgDxYM4TIwtYVSZT5wiQIwi8rB6a/YJSHvaDwWMDF4XPzUx
 Fe91kag1X1/M4+sm2NrLWGTohS82XGvrTulAE/E1/kdlpcliBPm61JzWF/iHOqcIa5qr
 qGE2TeEUWovktEIt4IFjuc09jrlBFV+13jHwPApoB5Kc3jVyx6gycNo91+Ma5UKvm3wj
 H03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L5A08oqJfnwHuu4IIvHVyo2CuhBx8oIfeNWXxwFL7uE=;
 b=qfQ7tgeLlgRDcDy2DB8D8tFvnHs4yGsvKCouNQ3CnVh9nkZkYQ8V5NIgAlLqsaOoSG
 yDwKf9Tz2twsBQl7YKUXkJE7cmMpPA6DSyvg9Qq52+9fqhfP/ETXPqCOMdbI5QxsCG/q
 6SF5MjxVLqUFJzpETQqWSm9h6D+Nd3F28JAmTlVdJBh3jB6D9CFbLmkdr/dk0t58k2nm
 ithrQzQdbIoxjDRW4fv8Lg/VQmL/a0YUt/EPBQCSyjKi97nXa9vxyJvwkRRis2H/0G+F
 sw6sC9x4oKMGyBNzX5NEMJfx3Ql+gHTBHDMbHll4E3fVUKKq55ujZ+3hXX7GaWbPJJxx
 orew==
X-Gm-Message-State: AOAM530yhmDyr3kpe7KMCFAu2D2fjgsGJKg3owYF/b4D+R8BSS9aW2OT
 MFRpKIU+hHwDv4j5a1ath/o2yNxlFQs=
X-Google-Smtp-Source: ABdhPJzvD0QAKxHmespnrW3MzoXZhd7Of64fnGKfU8KE/1YYIcN2qgkVDpZqmJeEsJ42UFwUfxZzJQ==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr3655698wrj.339.1618655466854; 
 Sat, 17 Apr 2021 03:31:06 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm11795815wmo.27.2021.04.17.03.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] hw/pci-host/raven: Use MR alias for AS root,
 not sysbus mapped MR
Date: Sat, 17 Apr 2021 12:30:24 +0200
Message-Id: <20210417103028.601124-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PCI I/O region is exposed as AddressSpace. AddressSpaces must
not be sysbus-mapped (to be zero-based), therefore map the region
using an alias.

As the new AdressSpace root memory region is now zero-based, we do not
need anymore to add the PCI I/O base address to the MemoryRegionOps
handlers. Update the temporary assertion and its comment.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 36652122424..7bbb7ef0a29 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -67,6 +67,7 @@ struct PRePPCIState {
     PCIBus pci_bus;
     AddressSpace pci_io_as;
     MemoryRegion pci_io;
+    MemoryRegion pci_io_alias;
     MemoryRegion pci_io_non_contiguous;
     MemoryRegion pci_memory;
     MemoryRegion pci_intack;
@@ -143,14 +144,13 @@ static inline hwaddr raven_io_address(PREPPCIState *s,
 {
     /*
      * We shouldn't access AddressSpace internals. However this assert
-     * is temporarily introduced to prove a subtle inconsistency from
-     * commit 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region"):
-     * AddressSpace root region must be zero-based, but the Raven use is not.
+     * is temporarily used to prove a subtle inconsistency from commit
+     * 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region") which
+     * expected the PCI I/O root region base address to be 0x80000000.
      *
-     * Assert the root region is based on physical address 0x80000000
-     * until the issue is fixed.
+     * We now use an alias memory region as root, which is zero-based.
      */
-    assert(s->pci_io_as.root->addr == PCI_IO_BASE_ADDR);
+    assert(s->pci_io_as.root->addr == 0);
 
     if (s->contiguous_map == 0) {
         /* 64 KB contiguous space for IOs */
@@ -172,8 +172,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
     addr = raven_io_address(s, addr);
-    address_space_read(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
-                       MEMTXATTRS_UNSPECIFIED, buf, size);
+    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
 
     if (size == 1) {
         return buf[0];
@@ -204,8 +203,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
         g_assert_not_reached();
     }
 
-    address_space_write(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
-                        MEMTXATTRS_UNSPECIFIED, buf, size);
+    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
 }
 
 static const MemoryRegionOps raven_io_ops = {
@@ -301,6 +299,8 @@ static void raven_pcihost_initfn(Object *obj)
     DeviceState *pci_dev;
 
     memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
+    memory_region_init_alias(&s->pci_io_alias, obj, "pci-io",
+                             &s->pci_io, 0, memory_region_size(&s->pci_io));
     memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
                           "pci-io-non-contiguous", 0x00800000);
     memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
@@ -308,7 +308,7 @@ static void raven_pcihost_initfn(Object *obj)
 
     /* CPU address space */
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
-                                &s->pci_io);
+                                &s->pci_io_alias);
     memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
-- 
2.26.3


