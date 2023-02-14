Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4F69645F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9f-0007bi-OT; Tue, 14 Feb 2023 08:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9Z-0007XN-0R
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:25 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9V-0003uy-2X
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:24 -0500
Received: by mail-ej1-x62f.google.com with SMTP id gn39so1617372ejc.8
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkQI+OmILy28+c+2zgMBpj3rebi/xKNz4e5yLjMHx+g=;
 b=lMjQ78Rj6wUDth17D7p3CdjXawu3REy0ubWFCODrunusV19FVnvNrpRarG1RRRJAxc
 Gv/tRCpdprOzC/jHRqC7b2cM0BLDd7TGfOTuehT45+EByMjPcM31P42AgptaAYPsucbf
 tkO/qjvsuRwwLI07iaRe6NbWDo8PRU8yu+Vdz42xlQnnrCIFehxqOuSkU01ulPLYqDT7
 dBKgFFky2ZKwEjEG/+Uwb1YDjwXxIO43kwsjkRwGUXm0tYEqnLV7f7qxx22MbkkBpfBp
 blcJ/hBBnvn2jfBK0CDYlDMQDZ8ztnpvSpGjyNuDSy1iz4DkcJRSmlmmuDxP5lcI8dom
 nyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkQI+OmILy28+c+2zgMBpj3rebi/xKNz4e5yLjMHx+g=;
 b=zXjypMo1dK5wHK2VqPbvAjaPlKHkPiG+/tJnS+Gv4Z7V1oT4IJ+FzYk84F248tMysO
 SOs94GBkHtyoR3J1sSRIg23Of+TgQc9fW6kB9PgnG/RxWEFsVgVc8BUK3x+6ISFzBrFk
 LW6s8AnS+EhHwsDuTo/m3s0Y7/2az2WGiWLLxBq1pWMyQnycTaP0UC3RIGgiqA648cgk
 0+6X9tMiqbar2iV1Bd9zh3b+dDQwJNxU5wlkC4aGoLW5oSV+FY8pC1r9gJYzrEeLGN7S
 dQJVhMMgqnLRpRtogTjhY07fLpB2293dAFwerfkhK4VGHX00cZZ3gim0igsSC4Mour97
 JlbQ==
X-Gm-Message-State: AO0yUKXsRwf7/muL8acMasmyAtswghhipH8osw7cbz7yDajuD54kYuu8
 ZEUBFZ23MNCYsCbbvbrjt71s1dmCdps=
X-Google-Smtp-Source: AK7set8M025AGNJgEjwJK0I5EabPt/5Vl8zg5UGiSHrUy5uE7uzBnVHz9dVcj/cIB8Wt+HgS8EqjnQ==
X-Received: by 2002:a17:906:4710:b0:87d:9447:f7fb with SMTP id
 y16-20020a170906471000b0087d9447f7fbmr2371480ejq.38.1676380518425; 
 Tue, 14 Feb 2023 05:15:18 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/12] hw/pci-host/q35: Initialize PCI hole boundaries just
 once
Date: Tue, 14 Feb 2023 14:14:36 +0100
Message-Id: <20230214131441.101760-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

The boundaries of the PCI hole depend on a property only which doesn't
change at runtime. There is no need to reevaluate the boundaries
whenever the PCI configuration space changes.

While at it, move the pci_hole attribute into the host device since it
is only used there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/q35.h |  2 +-
 hw/pci-host/q35.c         | 21 +++++++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 93e41ffbee..a04d5f1a17 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -51,7 +51,6 @@ struct MCHPCIState {
     MemoryRegion tseg_blackhole, tseg_window;
     MemoryRegion smbase_blackhole, smbase_window;
     bool has_smram_at_smbase;
-    Range pci_hole;
     uint64_t below_4g_mem_size;
     uint64_t above_4g_mem_size;
     uint16_t ext_tseg_mbytes;
@@ -62,6 +61,7 @@ struct Q35PCIHost {
     PCIExpressHost parent_obj;
     /*< public >*/
 
+    Range pci_hole;
     uint64_t pci_hole64_size;
     uint32_t short_root_bus;
     bool pci_hole64_fix;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 03aa08dae5..468bbfde51 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -62,6 +62,13 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     memory_region_set_flush_coalesced(&pci->data_mem);
     memory_region_add_coalescing(&pci->conf_mem, 0, 4);
 
+    /*
+     * pci hole goes from end-of-low-ram to io-apic.
+     * mmconfig will be excluded by the dsdt builder.
+     */
+    range_set_bounds(&s->pci_hole, s->mch.below_4g_mem_size,
+                     IO_APIC_DEFAULT_ADDRESS - 1);
+
     pci->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
@@ -90,8 +97,7 @@ static void q35_host_get_pci_hole_start(Object *obj, Visitor *v,
     uint64_t val64;
     uint32_t value;
 
-    val64 = range_is_empty(&s->mch.pci_hole)
-        ? 0 : range_lob(&s->mch.pci_hole);
+    val64 = range_is_empty(&s->pci_hole) ? 0 : range_lob(&s->pci_hole);
     value = val64;
     assert(value == val64);
     visit_type_uint32(v, name, &value, errp);
@@ -105,8 +111,7 @@ static void q35_host_get_pci_hole_end(Object *obj, Visitor *v,
     uint64_t val64;
     uint32_t value;
 
-    val64 = range_is_empty(&s->mch.pci_hole)
-        ? 0 : range_upb(&s->mch.pci_hole) + 1;
+    val64 = range_is_empty(&s->pci_hole) ? 0 : range_upb(&s->pci_hole) + 1;
     value = val64;
     assert(value == val64);
     visit_type_uint32(v, name, &value, errp);
@@ -498,14 +503,6 @@ static void mch_update(MCHPCIState *mch)
     mch_update_smram(mch);
     mch_update_ext_tseg_mbytes(mch);
     mch_update_smbase_smram(mch);
-
-    /*
-     * pci hole goes from end-of-low-ram to io-apic.
-     * mmconfig will be excluded by the dsdt builder.
-     */
-    range_set_bounds(&mch->pci_hole,
-                     mch->below_4g_mem_size,
-                     IO_APIC_DEFAULT_ADDRESS - 1);
 }
 
 static int mch_post_load(void *opaque, int version_id)
-- 
2.39.1


