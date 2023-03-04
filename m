Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C96AAAB2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmw-0003QE-DL; Sat, 04 Mar 2023 10:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmt-0003N5-RL
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:07 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmr-0008AA-Ta
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:07 -0500
Received: by mail-ed1-x535.google.com with SMTP id f13so21607789edz.6
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3MvMDbc6W1pZ0344ikgy3XfNx3ZtN3bD+GvmA7Exk4=;
 b=K4S1AK9ZHdrpJXFB49NExzvmgXbfG8DwiBMkH1r7tlHUYTLO3QArWdN4G2wKLDa5wD
 gukSGyMKkk6fYoIWN+Y5fVDg8VL53ewOC46HzsUejbwzysfAxqYH+AgdTkXEKF2UmcKv
 VhDfA4lOOtFePmEV9ov/sRjtOBoXbs9xX1JQ7MQDKV8ihYk5Jb8t6156Nzk7GvC2tcK+
 UuWPGXfy+CuJ49rLhMqDxeht8LZwQsBGrXo5heZieNcpPE58HKJpCNOTEpvGs3xQf6rQ
 uBWcYuMTP1hPP3einQrBvLn6CGXEE6ByTzX5YhbRPMXtTN/xt3s03QuHqSDfNDVTIJjF
 a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3MvMDbc6W1pZ0344ikgy3XfNx3ZtN3bD+GvmA7Exk4=;
 b=etLxk6ZHVHVX0fYq1iZ4Pr5J7kIf6nmKbkofOCeWlmyWm38V71Y3vyF+9p3BzDfYrE
 ognocNGK9QGNsX3gnTc5N7PuyiXien3RpKoL1d+gm/o2Ajpb2VuDvHnPVbFaGjPe9VPW
 XUY5dMR4GKRDYbdQJJdyq68HM5nv2f/Yp+HKM3ip0GcSLwfYcwh0LvVSigxMT2tvVD5S
 iD9S3i4JI0wxcIYQ4HhwCjxVb78DpWSeAGckGmND1YXkD6IsaU33waR5kGkmcaJpS+E/
 8qmtx8xssbDqH489GTlyN6+iShRQwq2We09aLw5P+vZ0Yx8RmseH/P2HYJZ0pmhN+GQ0
 +1ZQ==
X-Gm-Message-State: AO0yUKWIoIOBia43X/2XyFEDOET6OqvFwAW9ehVWVsBbgUYJqHgHg2fp
 zEEa7bGN7iCa5nKPMta2w6wtVJjAPi8=
X-Google-Smtp-Source: AK7set+JO9/xIiDcGQuD8A6U2+DK3ae+GKOHB2QywB7SwnWOWkDCPTzUt4g18GHjCEXifjyBGazrmQ==
X-Received: by 2002:a17:907:c25:b0:8b2:fb3d:95e6 with SMTP id
 ga37-20020a1709070c2500b008b2fb3d95e6mr6302372ejc.74.1677943624214; 
 Sat, 04 Mar 2023 07:27:04 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 08/13] hw/pci-host/q35: Initialize PCI hole boundaries just
 once
Date: Sat,  4 Mar 2023 16:26:43 +0100
Message-Id: <20230304152648.103749-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
index f20e092516..23df52a256 100644
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
@@ -506,14 +511,6 @@ static void mch_update(MCHPCIState *mch)
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
2.39.2


