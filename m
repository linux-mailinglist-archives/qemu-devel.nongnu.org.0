Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B86AAABF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmt-0003Ly-MM; Sat, 04 Mar 2023 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTms-0003Kz-8v
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:06 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmq-000895-CL
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: by mail-ed1-x534.google.com with SMTP id x3so21499774edb.10
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFlO1gp93LNeGeyRsdA/6R7zS1myv4F0OM3dNxXlP7w=;
 b=L9NE6CEhoPDRYRNFlPOGSfmxaEzGBEcy0LnPt5Tw5JKodb0TstdvqdxnfcXYsDf4oO
 4geRofgUSfc1Q4R+/ek90O55dduMfQoSVVhNhElXOnrSmR1rw3UH137rzrpnQPi4oD/c
 zDWxE5GH4ujGikxhknpDELJ77y5ksWckwKrINLRRGyndQvASegMBvC0RUSqvB8BcmOH8
 NNwWArTTY4djcZX0IqtbNlpcRQIQc5brgmzsb2otro3xbbtoSssBDZruAb12PRB/+BrZ
 HRvW0nek6pDS8VqmkWXaY8Kew1UKg6xELWkOPJent2RILCKk2jJZvofP32q2AdzO/jYs
 9jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFlO1gp93LNeGeyRsdA/6R7zS1myv4F0OM3dNxXlP7w=;
 b=pZiDtVKYj+UDDNSVTJNwb+JvwfKUXd/TB9Oo+Ig/g9yw6xhKDkD90D8N9VGNtV5aBd
 ioWx7TMKci0+VcUALi1f6N6yTNxZEHL2PX16All3p6ZmSJIn1JafAlOtCp1Mhm4pkq4K
 1ayF8aNZHAEkzjlM8QW7iYGoD8XKIqIUjuTKcFw/V+uuBq0f6QZbM1VqUH1pV3RWZOz4
 H4U4Mb6oev+y/9VXP13sJzYnzkkUSiX3ODNEsTMIny8ag55DAmPBpJBe7qu2Pl+CCi2O
 sO4bjD/IM3p6WlJYlR7xqxo6B85uD/S6dMZDzlni+m39o5jku0EKrkZLUKe8KwyNeK6t
 OF8g==
X-Gm-Message-State: AO0yUKWKYeKjxFfoBdV//UxnLIFt0G1aUJSt92vUz6oftvDNX7mZzzwu
 j9wBQVhibicq397Fcqo9+rWv4MTHlGo=
X-Google-Smtp-Source: AK7set8IlpNy3ZmwCidu95X31USoltKpWAfyClJyCKGpXMg07E4lhqiYUer31FMn04yOP4t6JF0wmw==
X-Received: by 2002:a17:906:3893:b0:885:a62c:5a5c with SMTP id
 q19-20020a170906389300b00885a62c5a5cmr5307547ejd.46.1677943623325; 
 Sat, 04 Mar 2023 07:27:03 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 07/13] hw/pci-host/q35: Initialize properties just once
Date: Sat,  4 Mar 2023 16:26:42 +0100
Message-Id: <20230304152648.103749-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
object_initialize() phase, requiring the host to re-assign the default
values manually again. Avoid this by moving both attributes into the
host device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/q35.h |  5 +++--
 hw/pci-host/q35.c         | 12 +++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

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
index f070842312..f20e092516 100644
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
@@ -161,7 +161,7 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
 
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
-    hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
+    hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
     if (s->pci_hole64_fix && value < hole64_end) {
         value = hole64_end;
     }
@@ -180,8 +180,8 @@ static Property q35_host_props[] = {
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
@@ -218,9 +218,7 @@ static void q35_host_initfn(Object *obj)
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
2.39.2


