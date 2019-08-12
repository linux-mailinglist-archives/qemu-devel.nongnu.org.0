Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801089819
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 09:46:40 +0200 (CEST)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx52N-0005ee-C4
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 03:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hx51S-000448-Hx
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:45:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hx51R-0007ec-JK
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:45:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hx51R-0007eG-Dc
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:45:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so29115066wru.10
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 00:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfojkDzCf1eY0fx+WFbDa7MyAVQy0gSxC1MNFuOMis4=;
 b=CuAfCroGejqHXCbUoznh/ncQzR+Pu8wlnRE3YcPGL8wJ9D/Uiq1Zd358NVMsCT5TDY
 z4qc/HMAbZvkCnzgoItvSb8hZ7ZyZ1MnN2wiPX6ma68lqXxZUgAjBizEX91qOncKiQL+
 SuvU7M0a3B1+e9GqUy6owg1t7rRxs/JED+UhFtSg5jJmokmAxH+uM6Iscm3p8pqBbMAg
 shbdqI9M+geISQIJ7OBzAdLCS+6I0RcJw1WGyfipYaEgsZLMXf3re+GGOTx33JaxqstC
 fEASfoaUF/xHyN6L2/9yYxoVnkhi4ZBJFdTnMfOAcSIIulzuk5bizzIUUiLVXzeLIhFG
 iKiw==
X-Gm-Message-State: APjAAAWTOGqL5lk8LqitnnXNAg49wgFvqLIcYaU1E8ajSUODt5ZA76ba
 4/dZnMRqgcarh41DY3mFUnB1PVB/UOIz5w==
X-Google-Smtp-Source: APXvYqwqSWMV4UkiuBdWjf9nu3MtKEONGWpySABlNg94ZHCwOUrGtyIjnmWEyNrFuL2EliPP0yVzQQ==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr28574416wrw.169.1565595940401; 
 Mon, 12 Aug 2019 00:45:40 -0700 (PDT)
Received: from xz-x1.redhat.com (net77-43-52-122.mclink.it. [77.43.52.122])
 by smtp.gmail.com with ESMTPSA id a84sm15909450wmf.29.2019.08.12.00.45.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 00:45:39 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 09:45:30 +0200
Message-Id: <20190812074531.28970-4-peterx@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812074531.28970-1-peterx@redhat.com>
References: <20190812074531.28970-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: [Qemu-devel] [PATCH RFC 3/4] pc/q35: Disallow vfio-pci hotplug
 without VT-d caching mode
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 peterx@redhat.com, Bandan Das <bsd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of bailing out when trying to hotplug a vfio-pci device with
below configuration:

  -device intel-iommu,caching-mode=off

With this we can return a warning message to the user via QMP/HMP and
the VM will continue to work after failing the hotplug:

  (qemu) device_add vfio-pci,bus=root.3,host=05:00.0,id=vfio1
  Error: Device assignment is not allowed without enabling caching-mode=on for Intel IOMMU.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/pc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 549c437050..4ea00c7bd2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2905,6 +2905,26 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
+
+static bool pc_hotplug_allowed(MachineState *ms, DeviceState *dev, Error **errp)
+{
+    X86IOMMUState *iommu = x86_iommu_get_default();
+    IntelIOMMUState *intel_iommu;
+
+    if (iommu &&
+        object_dynamic_cast((Object *)iommu, TYPE_INTEL_IOMMU_DEVICE) &&
+        object_dynamic_cast((Object *)dev, "vfio-pci")) {
+        intel_iommu = INTEL_IOMMU_DEVICE(iommu);
+        if (!intel_iommu->caching_mode) {
+            error_setg(errp, "Device assignment is not allowed without "
+                       "enabling caching-mode=on for Intel IOMMU.");
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static void pc_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2929,6 +2949,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->pvh_enabled = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = pc_get_hotplug_handler;
+    mc->hotplug_allowed = pc_hotplug_allowed;
     mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
     mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
-- 
2.21.0


