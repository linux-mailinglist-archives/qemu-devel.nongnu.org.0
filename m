Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88728696467
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9f-0007bW-8T; Tue, 14 Feb 2023 08:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9Z-0007XM-0M
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:25 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9V-0003uu-23
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:24 -0500
Received: by mail-ej1-x631.google.com with SMTP id mc25so2572766ejb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbrbM3p3jfrGHEMaBbnBB4lGzc6BURl9OVfHqnE3l1g=;
 b=ZAseUPkO/fFbUT4C8zmaiXFp1Y4Q03J0xuS/tWGeORMJ3PTZsSIBUkHNs9ZCEd3mBd
 KUCtoKEf6Yn/kCQbllFrNzevAG2U1jRh2iFPfLru2QF4ofxYuHTVnKhaliEhHbE9HLdR
 MDur00vpk/WB4UZfNUFqBqdyNopaMVZqkviJrkLc/PEY4RVUatgZD+w+qgxGCc7hkRnH
 KAmLFNQ1t7ESDD00M1O3f5gG99bpePpUArCb7DP8QAljogrjudAsXYYW/0wB2yFoVyzr
 5jECJX2hxGD7bwY3YGCgY74qWIgtzhAAlvZo0nXYP35F240FQCwltG8x6hBgE7x9RbG9
 qfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DbrbM3p3jfrGHEMaBbnBB4lGzc6BURl9OVfHqnE3l1g=;
 b=oBd1RJ6KXMqXTXJMudEQ7gdUOUvLIqWcxCyQB6keERmgt1E0UI1oXtkzXCrQRgKK9J
 BBeIxcfM6wzNTO62d0HnBH08K611ldNU4dO594vLa0AJnx1xbMjdkSMkv47yayueUvJM
 djHa5Psw/Dy/gHr3Dz7BiPydpyr7nK+FYQkord1rfqf0yUEz0g6FZk18OgqypOPVLoLo
 2r3D/hJpJkrf/4wLJnaHMtOEOiK4QguLDJyTwEoXzRe5UvBI3z27PVc4lSn2lCM73c2d
 AdE6yIwai7KI6d3gQZ1CrhASeEl4dGrp2mVoIsi19+Zq+ceIKKSfhsuIL5tT6IH+GWDT
 +f/g==
X-Gm-Message-State: AO0yUKUfigjPJrP58J08io1oB021Ttt2Ocd5JXKzfeEmSYisCYZdPyrj
 1J6Nroh3FqTQxAQK5pJggGsFilisWA4=
X-Google-Smtp-Source: AK7set/9KyYfdob1xVcfJ0siERL5uCHjq5a2J+3Ag0w59HhdRTNNniZK9nb1aYmzlgjoDh5CM2wAVw==
X-Received: by 2002:a17:907:379:b0:889:d156:616d with SMTP id
 rs25-20020a170907037900b00889d156616dmr3123143ejb.27.1676380517317; 
 Tue, 14 Feb 2023 05:15:17 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:16 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/12] hw/pci-host/q35: Initialize properties just once
Date: Tue, 14 Feb 2023 14:14:35 +0100
Message-Id: <20230214131441.101760-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Although not used there, the attributes for Q35's "pci-hole64-size" and
"short_root_bus" properties currently reside in its child device. This
causes the default values to be overwritten during the child's
object_initialize() phase. Avoid this by moving both attributes into the
host device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/q35.h |  5 +++--
 hw/pci-host/q35.c         | 20 +++++---------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index fcbe57b42d..93e41ffbee 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -54,8 +54,6 @@ struct MCHPCIState {
     Range pci_hole;
     uint64_t below_4g_mem_size;
     uint64_t above_4g_mem_size;
-    uint64_t pci_hole64_size;
-    uint32_t short_root_bus;
     uint16_t ext_tseg_mbytes;
 };
 
@@ -64,7 +62,10 @@ struct Q35PCIHost {
     PCIExpressHost parent_obj;
     /*< public >*/
 
+    uint64_t pci_hole64_size;
+    uint32_t short_root_bus;
     bool pci_hole64_fix;
+
     MCHPCIState mch;
 };
 
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0e198f97a7..03aa08dae5 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -76,7 +76,7 @@ static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
     Q35PCIHost *s = Q35_HOST_DEVICE(host_bridge);
 
      /* For backwards compat with old device paths */
-    if (s->mch.short_root_bus) {
+    if (s->short_root_bus) {
         return "0000";
     }
     return "0000:00";
@@ -161,27 +161,19 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
 
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
-    hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
+    hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
     if (s->pci_hole64_fix && value < hole64_end) {
         value = hole64_end;
     }
     visit_type_uint64(v, name, &value, errp);
 }
 
-/*
- * NOTE: setting defaults for the mch.* fields in this table
- * doesn't work, because mch is a separate QOM object that is
- * zeroed by the object_initialize(&s->mch, ...) call inside
- * q35_host_initfn().  The default values for those
- * properties need to be initialized manually by
- * q35_host_initfn() after the object_initialize() call.
- */
 static Property q35_host_props[] = {
     DEFINE_PROP_UINT64(PCIE_HOST_MCFG_BASE, Q35PCIHost, parent_obj.base_addr,
                         MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT),
     DEFINE_PROP_SIZE(PCI_HOST_PROP_PCI_HOLE64_SIZE, Q35PCIHost,
-                     mch.pci_hole64_size, Q35_PCI_HOST_HOLE64_SIZE_DEFAULT),
-    DEFINE_PROP_UINT32("short_root_bus", Q35PCIHost, mch.short_root_bus, 0),
+                     pci_hole64_size, Q35_PCI_HOST_HOLE64_SIZE_DEFAULT),
+    DEFINE_PROP_UINT32("short_root_bus", Q35PCIHost, short_root_bus, 0),
     DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MEM_SIZE, Q35PCIHost,
                      mch.below_4g_mem_size, 0),
     DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MEM_SIZE, Q35PCIHost,
@@ -218,9 +210,7 @@ static void q35_host_initfn(Object *obj)
     object_initialize_child(OBJECT(s), "mch", &s->mch, TYPE_MCH_PCI_DEVICE);
     qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
     qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
-    /* mch's object_initialize resets the default value, set it again */
-    qdev_prop_set_uint64(DEVICE(s), PCI_HOST_PROP_PCI_HOLE64_SIZE,
-                         Q35_PCI_HOST_HOLE64_SIZE_DEFAULT);
+
     object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
                         q35_host_get_pci_hole_start,
                         NULL, NULL, NULL);
-- 
2.39.1


