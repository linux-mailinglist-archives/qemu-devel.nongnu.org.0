Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29AD1CEB19
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 05:05:19 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYLEM-0002lb-Vh
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 23:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jYLCP-0000ur-UZ; Mon, 11 May 2020 23:03:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40716 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jYLCO-00083m-Fw; Mon, 11 May 2020 23:03:17 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9119AE9D41E74A1CA8F9;
 Tue, 12 May 2020 11:03:11 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 12 May 2020
 11:03:04 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <imammedo@redhat.com>, <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
 <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <fam@euphon.net>,
 <rth@twiddle.net>, <ehabkost@redhat.com>, <mtosatti@redhat.com>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <pbonzini@redhat.com>, <philmd@redhat.com>
Subject: [PATCH v27 02/10] hw/arm/virt: Introduce a RAS machine option
Date: Tue, 12 May 2020 11:06:01 +0800
Message-ID: <20200512030609.19593-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512030609.19593-1-gengdongjiu@huawei.com>
References: <20200512030609.19593-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 23:03:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: zhengxiang9@huawei.com, Jonathan.Cameron@huawei.com, linuxarm@huawei.com,
 gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RAS Virtualization feature is not supported now, so
add a RAS machine option and disable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 171e690..2d46c3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1995,6 +1995,20 @@ static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &vms->acpi, errp);
 }
 
+static bool virt_get_ras(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->ras;
+}
+
+static void virt_set_ras(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->ras = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2327,6 +2341,15 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    /* Default disallows RAS instantiation */
+    vms->ras = false;
+    object_property_add_bool(obj, "ras", virt_get_ras,
+                             virt_set_ras, NULL);
+    object_property_set_description(obj, "ras",
+                                    "Set on/off to enable/disable reporting host memory errors "
+                                    "to a KVM guest using ACPI and guest external abort exceptions",
+                                    NULL);
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6d67ace..31878dd 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
1.8.3.1


