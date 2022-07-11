Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A2570A46
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:02:29 +0200 (CEST)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAyfs-0007RZ-KZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaX-0002RG-Pe; Mon, 11 Jul 2022 14:56:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaV-00067B-OX; Mon, 11 Jul 2022 14:56:57 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BInTqC022352;
 Mon, 11 Jul 2022 18:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AQVO8WNAAxuBqLptMhXJqx6J/Dn9b2QzeScLobxXJ6w=;
 b=f7GtUggrgBvtrRdEriT2IPD2c4K9p1FLrFTFC/zrk8ocQOtnUCYm+T7FryQ7+y/MD4IW
 tWfZzZEhcUS6Fz7OdIxrwow6+LWt9okVrKhzyxeWnYpnRcSLoBAuZzVDqC8dpMgfb5Gh
 SjImb0jsIaCHxrm19K/esVEQMjVlO4KivSVOvRwypapFlLwG9SawlWhFVJKQphrzqK60
 aATVnFox0HKOvRpGfzvsEz1ufoMaset1ox3HY++lxIXZBosrOn41ai13P715y8Q4KkeD
 yjVmTBXTlp3htP3gqoeDR8hZrwGVC5P4BPtnhals1DTytN/szTvvyETGNZVQhdxEYrne 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8sfwg5c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:53 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BInW6G022410;
 Mon, 11 Jul 2022 18:56:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8sfwg5b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BIo3fp016875;
 Mon, 11 Jul 2022 18:56:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhu4yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26BIuma87995818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 18:56:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3E8B42041;
 Mon, 11 Jul 2022 18:56:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 648A54203F;
 Mon, 11 Jul 2022 18:56:47 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jul 2022 18:56:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/3] hw/misc: Add mmio-debug-exit device
Date: Mon, 11 Jul 2022 20:56:39 +0200
Message-Id: <20220711185640.3558813-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220711185640.3558813-1-iii@linux.ibm.com>
References: <20220711185640.3558813-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qcPSydl876BqhKHgpQdn4pJm0bzUp46b
X-Proofpoint-ORIG-GUID: wyHMXz_PRkPUl8syza9_44rRoMr0EwKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_23,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110079
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

System tests on x86 use isa-debug-exit device in order to signal
success or failure to the test runner. Unfortunately it's not easily
usable on other architectures, since a guest needs to access
address_space_io, which may not be as straightforward as on x86.
Also, it requires adding ISA bus, which an architecture might not
otherwise need.

Introduce mmio-debug-exit device, which has the same semantics, but is
triggered by writes to memory.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 hw/misc/Kconfig          |  3 ++
 hw/misc/debugexit_mmio.c | 80 ++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build      |  1 +
 hw/s390x/Kconfig         |  1 +
 4 files changed, 85 insertions(+)
 create mode 100644 hw/misc/debugexit_mmio.c

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..0f12735ef7 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -15,6 +15,9 @@ config ISA_DEBUG
     bool
     depends on ISA_BUS
 
+config MMIO_DEBUGEXIT
+    bool
+
 config SGA
     bool
     depends on ISA_BUS
diff --git a/hw/misc/debugexit_mmio.c b/hw/misc/debugexit_mmio.c
new file mode 100644
index 0000000000..5e823cc01c
--- /dev/null
+++ b/hw/misc/debugexit_mmio.c
@@ -0,0 +1,80 @@
+/*
+ * Exit with status X when the guest writes X (little-endian) to a specified
+ * address. For testing purposes only.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+
+#define TYPE_MMIO_DEBUG_EXIT_DEVICE "mmio-debug-exit"
+OBJECT_DECLARE_SIMPLE_TYPE(MMIODebugExitState, MMIO_DEBUG_EXIT_DEVICE)
+
+struct MMIODebugExitState {
+    DeviceState parent_obj;
+
+    uint32_t base;
+    uint32_t size;
+    MemoryRegion region;
+};
+
+static uint64_t mmio_debug_exit_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void mmio_debug_exit_write(void *opaque, hwaddr addr, uint64_t val,
+                                  unsigned width)
+{
+    exit(val);
+}
+
+static const MemoryRegionOps mmio_debug_exit_ops = {
+    .read = mmio_debug_exit_read,
+    .write = mmio_debug_exit_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void mmio_debug_exit_realizefn(DeviceState *d, Error **errp)
+{
+    MMIODebugExitState *s = MMIO_DEBUG_EXIT_DEVICE(d);
+
+    memory_region_init_io(&s->region, OBJECT(s), &mmio_debug_exit_ops, s,
+                          TYPE_MMIO_DEBUG_EXIT_DEVICE, s->size);
+    memory_region_add_subregion(get_system_memory(), s->base, &s->region);
+}
+
+static Property mmio_debug_exit_properties[] = {
+    DEFINE_PROP_UINT32("base", MMIODebugExitState, base, 0),
+    DEFINE_PROP_UINT32("size", MMIODebugExitState, size, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mmio_debug_exit_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = mmio_debug_exit_realizefn;
+    device_class_set_props(dc, mmio_debug_exit_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo mmio_debug_exit_info = {
+    .name          = TYPE_MMIO_DEBUG_EXIT_DEVICE,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(MMIODebugExitState),
+    .class_init    = mmio_debug_exit_class_initfn,
+};
+
+static void mmio_debug_exit_register_types(void)
+{
+    type_register_static(&mmio_debug_exit_info);
+}
+
+type_init(mmio_debug_exit_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..1d2a1067dc 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
 softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
+softmmu_ss.add(when: 'CONFIG_MMIO_DEBUGEXIT', if_true: files('debugexit_mmio.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
diff --git a/hw/s390x/Kconfig b/hw/s390x/Kconfig
index 5e7d8a2bae..9223715dcc 100644
--- a/hw/s390x/Kconfig
+++ b/hw/s390x/Kconfig
@@ -5,6 +5,7 @@ config S390_CCW_VIRTIO
     imply VFIO_AP
     imply VFIO_CCW
     imply WDT_DIAG288
+    imply MMIO_DEBUGEXIT
     select PCI
     select S390_FLIC
     select SCLPCONSOLE
-- 
2.35.3


