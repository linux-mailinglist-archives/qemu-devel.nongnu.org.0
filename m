Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014217F205
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 09:36:55 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBaNi-0001tD-4C
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 04:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jBaJo-000527-NI
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jBaJi-0004Q1-JL
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jBaJi-0004N0-8e
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:46 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A8PFIi010279
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 04:32:45 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ynr9kmhgg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 04:32:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 10 Mar 2020 08:32:42 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Mar 2020 08:32:40 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02A8Wddd31261080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 08:32:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90C284C044;
 Tue, 10 Mar 2020 08:32:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E54874C046;
 Tue, 10 Mar 2020 08:32:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.23.214])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 08:32:37 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/2] s390x: protvirt: Support unpack facility
Date: Tue, 10 Mar 2020 04:32:32 -0400
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310083232.29805-1-frankja@linux.ibm.com>
References: <b608f7d8-81ac-1e5b-011d-bd576f77aade@redhat.com>
 <20200310083232.29805-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031008-0020-0000-0000-000003B239B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031008-0021-0000-0000-0000220A8417
Message-Id: <20200310083232.29805-2-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=3 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100057
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unpack facility provides the means to setup a protected guest. A
protected guest can not be introspected by the hypervisor or any
user/administrator of the machine it is running on.

Protected guests are encrypted at rest and need a special boot
mechanism via diag308 subcode 8 and 10.

Code 8 sets the PV specific IPLB which is retained seperately from
those set via code 5.

Code 10 is used to unpack the VM into protected memory, verify its
integrity and start it.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Co-developed-by: Christian Borntraeger <borntraeger@de.ibm.com> [Changes
to machine]
---
 hw/s390x/Makefile.objs              |   1 +
 hw/s390x/ipl.c                      |  56 +++++++++++-
 hw/s390x/ipl.h                      |  80 +++++++++++++++++
 hw/s390x/pv.c                       | 104 ++++++++++++++++++++++
 hw/s390x/pv.h                       |  34 ++++++++
 hw/s390x/s390-virtio-ccw.c          | 128 +++++++++++++++++++++++++++-
 include/hw/s390x/s390-virtio-ccw.h  |   1 +
 target/s390x/cpu.c                  |  22 +++++
 target/s390x/cpu.h                  |   1 +
 target/s390x/cpu_features_def.inc.h |   1 +
 target/s390x/diag.c                 |  32 ++++++-
 11 files changed, 453 insertions(+), 7 deletions(-)
 create mode 100644 hw/s390x/pv.c
 create mode 100644 hw/s390x/pv.h

diff --git a/hw/s390x/Makefile.objs b/hw/s390x/Makefile.objs
index e02ed80b68..a46a1c7894 100644
--- a/hw/s390x/Makefile.objs
+++ b/hw/s390x/Makefile.objs
@@ -31,6 +31,7 @@ obj-y += tod-qemu.o
 obj-$(CONFIG_KVM) += tod-kvm.o
 obj-$(CONFIG_KVM) += s390-skeys-kvm.o
 obj-$(CONFIG_KVM) += s390-stattrib-kvm.o
+obj-$(CONFIG_KVM) += pv.o
 obj-y += s390-ccw.o
 obj-y += ap-device.o
 obj-y += ap-bridge.o
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 9c1ecd423c..74d42a8d11 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -33,6 +33,7 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "exec/exec-all.h"
+#include "pv.h"
 
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
@@ -542,11 +543,30 @@ void s390_ipl_update_diag308(IplParameterBlock *iplb)
 {
     S390IPLState *ipl = get_ipl_device();
 
-    ipl->iplb = *iplb;
-    ipl->iplb_valid = true;
+    /*
+     * The IPLB set and retrieved by subcodes 8/9 is completely
+     * separate from the one managed via subcodes 5/6.
+     */
+    if (iplb->pbt == S390_IPL_TYPE_PV) {
+        ipl->iplb_pv = *iplb;
+        ipl->iplb_valid_pv = true;
+    } else {
+        ipl->iplb = *iplb;
+        ipl->iplb_valid = true;
+    }
     ipl->netboot = is_virtio_net_device(iplb);
 }
 
+IplParameterBlock *s390_ipl_get_iplb_pv(void)
+{
+    S390IPLState *ipl = get_ipl_device();
+
+    if (!ipl->iplb_valid_pv) {
+        return NULL;
+    }
+    return &ipl->iplb_pv;
+}
+
 IplParameterBlock *s390_ipl_get_iplb(void)
 {
     S390IPLState *ipl = get_ipl_device();
@@ -635,6 +655,38 @@ static void s390_ipl_prepare_qipl(S390CPU *cpu)
     cpu_physical_memory_unmap(addr, len, 1, len);
 }
 
+int s390_ipl_prepare_pv_header(void)
+{
+    IplParameterBlock *ipib = s390_ipl_get_iplb_pv();
+    IPLBlockPV *ipib_pv = &ipib->pv;
+    void *hdr = g_malloc(ipib_pv->pv_header_len);
+    int rc;
+
+    cpu_physical_memory_read(ipib_pv->pv_header_addr, hdr,
+                             ipib_pv->pv_header_len);
+    rc = s390_pv_set_sec_parms((uint64_t)hdr,
+                          ipib_pv->pv_header_len);
+    g_free(hdr);
+    return rc;
+}
+
+int s390_ipl_pv_unpack(void)
+{
+    IplParameterBlock *ipib = s390_ipl_get_iplb_pv();
+    IPLBlockPV *ipib_pv = &ipib->pv;
+    int i, rc = 0;
+
+    for (i = 0; i < ipib_pv->num_comp; i++) {
+        rc = s390_pv_unpack(ipib_pv->components[i].addr,
+                            TARGET_PAGE_ALIGN(ipib_pv->components[i].size),
+                            ipib_pv->components[i].tweak_pref);
+        if (rc) {
+            break;
+        }
+    }
+    return rc;
+}
+
 void s390_ipl_prepare_cpu(S390CPU *cpu)
 {
     S390IPLState *ipl = get_ipl_device();
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index 211ce2dbeb..66c8380397 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -15,6 +15,24 @@
 #include "cpu.h"
 #include "hw/qdev-core.h"
 
+struct IPLBlockPVComp {
+    uint64_t tweak_pref;
+    uint64_t addr;
+    uint64_t size;
+} QEMU_PACKED;
+typedef struct IPLBlockPVComp IPLBlockPVComp;
+
+struct IPLBlockPV {
+    uint8_t  reserved18[87];    /* 0x18 */
+    uint8_t  version;           /* 0x6f */
+    uint32_t reserved70;        /* 0x70 */
+    uint32_t num_comp;          /* 0x74 */
+    uint64_t pv_header_addr;    /* 0x78 */
+    uint64_t pv_header_len;     /* 0x80 */
+    struct IPLBlockPVComp components[];
+} QEMU_PACKED;
+typedef struct IPLBlockPV IPLBlockPV;
+
 struct IplBlockCcw {
     uint8_t  reserved0[85];
     uint8_t  ssid;
@@ -71,6 +89,7 @@ union IplParameterBlock {
         union {
             IplBlockCcw ccw;
             IplBlockFcp fcp;
+            IPLBlockPV pv;
             IplBlockQemuScsi scsi;
         };
     } QEMU_PACKED;
@@ -85,8 +104,11 @@ typedef union IplParameterBlock IplParameterBlock;
 
 int s390_ipl_set_loadparm(uint8_t *loadparm);
 void s390_ipl_update_diag308(IplParameterBlock *iplb);
+int s390_ipl_prepare_pv_header(void);
+int s390_ipl_pv_unpack(void);
 void s390_ipl_prepare_cpu(S390CPU *cpu);
 IplParameterBlock *s390_ipl_get_iplb(void);
+IplParameterBlock *s390_ipl_get_iplb_pv(void);
 
 enum s390_reset {
     /* default is a reset not triggered by a CPU e.g. issued by QMP */
@@ -94,6 +116,7 @@ enum s390_reset {
     S390_RESET_REIPL,
     S390_RESET_MODIFIED_CLEAR,
     S390_RESET_LOAD_NORMAL,
+    S390_RESET_PV,
 };
 void s390_ipl_reset_request(CPUState *cs, enum s390_reset reset_type);
 void s390_ipl_get_reset_request(CPUState **cs, enum s390_reset *reset_type);
@@ -133,6 +156,7 @@ struct S390IPLState {
     /*< private >*/
     DeviceState parent_obj;
     IplParameterBlock iplb;
+    IplParameterBlock iplb_pv;
     QemuIplParameters qipl;
     uint64_t start_addr;
     uint64_t compat_start_addr;
@@ -140,6 +164,7 @@ struct S390IPLState {
     uint64_t compat_bios_start_addr;
     bool enforce_bios;
     bool iplb_valid;
+    bool iplb_valid_pv;
     bool netboot;
     /* reset related properties don't have to be migrated or reset */
     enum s390_reset reset_type;
@@ -161,9 +186,11 @@ QEMU_BUILD_BUG_MSG(offsetof(S390IPLState, iplb) & 3, "alignment of iplb wrong");
 
 #define S390_IPL_TYPE_FCP 0x00
 #define S390_IPL_TYPE_CCW 0x02
+#define S390_IPL_TYPE_PV 0x05
 #define S390_IPL_TYPE_QEMU_SCSI 0xff
 
 #define S390_IPLB_HEADER_LEN 8
+#define S390_IPLB_MIN_PV_LEN 148
 #define S390_IPLB_MIN_CCW_LEN 200
 #define S390_IPLB_MIN_FCP_LEN 384
 #define S390_IPLB_MIN_QEMU_SCSI_LEN 200
@@ -173,6 +200,50 @@ static inline bool iplb_valid_len(IplParameterBlock *iplb)
     return be32_to_cpu(iplb->len) <= sizeof(IplParameterBlock);
 }
 
+static inline bool ipl_valid_pv_components(IplParameterBlock *iplb)
+{
+    IPLBlockPV *ipib_pv = &iplb->pv;
+    int i;
+
+    if (ipib_pv->num_comp == 0) {
+        return false;
+    }
+
+    for (i = 0; i < ipib_pv->num_comp; i++) {
+        /* Addr must be 4k aligned */
+        if (ipib_pv->components[i].addr & ~TARGET_PAGE_MASK) {
+            return false;
+        }
+
+        /* Tweak prefix is monotonically increasing with each component */
+        if (i < ipib_pv->num_comp - 1 &&
+            ipib_pv->components[i].tweak_pref >=
+            ipib_pv->components[i + 1].tweak_pref) {
+            return false;
+        }
+    }
+    return true;
+}
+
+static inline bool ipl_valid_pv_header(IplParameterBlock *iplb)
+{
+        IPLBlockPV *ipib_pv = &iplb->pv;
+
+        if (ipib_pv->pv_header_len > 2 * TARGET_PAGE_SIZE) {
+            return false;
+        }
+
+        if (!address_space_access_valid(&address_space_memory,
+                                        ipib_pv->pv_header_addr,
+                                        ipib_pv->pv_header_len,
+                                        false,
+                                        MEMTXATTRS_UNSPECIFIED)) {
+            return false;
+        }
+
+        return true;
+}
+
 static inline bool iplb_valid(IplParameterBlock *iplb)
 {
     switch (iplb->pbt) {
@@ -182,6 +253,15 @@ static inline bool iplb_valid(IplParameterBlock *iplb)
     case S390_IPL_TYPE_CCW:
         return (be32_to_cpu(iplb->len) >= S390_IPLB_MIN_CCW_LEN &&
                 iplb->pbt == S390_IPL_TYPE_CCW);
+    case S390_IPL_TYPE_PV:
+        if(be32_to_cpu(iplb->len) < S390_IPLB_MIN_PV_LEN ||
+           iplb->pbt != S390_IPL_TYPE_PV) {
+            return false;
+        }
+        if (!ipl_valid_pv_header(iplb)) {
+            return false;
+        }
+        return ipl_valid_pv_components(iplb);
     default:
         return false;
     }
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
new file mode 100644
index 0000000000..ba6409246e
--- /dev/null
+++ b/hw/s390x/pv.c
@@ -0,0 +1,104 @@
+/*
+ * Secure execution functions
+ *
+ * Copyright IBM Corp. 2020
+ * Author(s):
+ *  Janosch Frank <frankja@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+#include "qemu/osdep.h"
+
+#include <linux/kvm.h>
+
+#include "qemu/error-report.h"
+#include "sysemu/kvm.h"
+#include "pv.h"
+
+const char *cmd_names[] = {
+    "VM_ENABLE",
+    "VM_DISABLE",
+    "VM_SET_SEC_PARAMS",
+    "VM_UNPACK",
+    "VM_VERIFY",
+    "VM_PREP_RESET",
+    "VM_UNSHARE_ALL",
+};
+
+static int s390_pv_cmd(uint32_t cmd, void *data)
+{
+    int rc;
+    struct kvm_pv_cmd pv_cmd = {
+        .cmd = cmd,
+        .data = (uint64_t)data,
+    };
+
+    rc = kvm_vm_ioctl(kvm_state, KVM_S390_PV_COMMAND, &pv_cmd);
+    if (rc) {
+        error_report("KVM PV command %d (%s) failed: header rc %x rrc %x "
+                     "IOCTL rc: %d", cmd, cmd_names[cmd], pv_cmd.rc, pv_cmd.rrc,
+                     rc);
+    }
+    return rc;
+}
+
+static void s390_pv_cmd_exit(uint32_t cmd, void *data)
+{
+    int rc;
+
+    rc = s390_pv_cmd(cmd, data);
+    if (rc) {
+        exit(1);
+    }
+}
+
+int s390_pv_vm_enable(void)
+{
+    return s390_pv_cmd(KVM_PV_ENABLE, NULL);
+}
+
+void s390_pv_vm_disable(void)
+{
+     s390_pv_cmd_exit(KVM_PV_DISABLE, NULL);
+}
+
+int s390_pv_set_sec_parms(uint64_t origin, uint64_t length)
+{
+    struct kvm_s390_pv_sec_parm args = {
+        .origin = origin,
+        .length = length,
+    };
+
+    return s390_pv_cmd(KVM_PV_VM_SET_SEC_PARMS, &args);
+}
+
+/*
+ * Called for each component in the SE type IPL parameter block 0.
+ */
+int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak)
+{
+    struct kvm_s390_pv_unp args = {
+        .addr = addr,
+        .size = size,
+        .tweak = tweak,
+    };
+
+    return s390_pv_cmd(KVM_PV_VM_UNPACK, &args);
+}
+
+void s390_pv_perf_clear_reset(void)
+{
+    s390_pv_cmd_exit(KVM_PV_VM_PREP_RESET, NULL);
+}
+
+int s390_pv_verify(void)
+{
+    return s390_pv_cmd(KVM_PV_VM_VERIFY, NULL);
+}
+
+void s390_pv_unshare(void)
+{
+    s390_pv_cmd_exit(KVM_PV_VM_UNSHARE_ALL, NULL);
+}
diff --git a/hw/s390x/pv.h b/hw/s390x/pv.h
new file mode 100644
index 0000000000..e58fbca96a
--- /dev/null
+++ b/hw/s390x/pv.h
@@ -0,0 +1,34 @@
+/*
+ * Protected Virtualization header
+ *
+ * Copyright IBM Corp. 2020
+ * Author(s):
+ *  Janosch Frank <frankja@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#ifndef HW_S390_PV_H
+#define HW_S390_PV_H
+
+#ifdef CONFIG_KVM
+int s390_pv_vm_enable(void);
+void s390_pv_vm_disable(void);
+int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
+int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
+void s390_pv_perf_clear_reset(void);
+int s390_pv_verify(void);
+void s390_pv_unshare(void);
+#else
+static inline int s390_pv_vm_enable(void) { return 0; }
+static inline void s390_pv_vm_disable(void) {}
+static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
+static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { return 0; }
+static inline void s390_pv_perf_clear_reset(void) {}
+static inline int s390_pv_verify(void) { return 0; }
+static inline void s390_pv_unshare(void) {}
+#endif
+
+#endif /* HW_S390_PV_H */
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index a89cf4c129..fc84ddb3d1 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -41,6 +41,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/tod.h"
 #include "sysemu/sysemu.h"
+#include "hw/s390x/pv.h"
+#include <linux/kvm.h>
 
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
 {
@@ -238,9 +240,11 @@ static void s390_create_sclpconsole(const char *type, Chardev *chardev)
 static void ccw_init(MachineState *machine)
 {
     int ret;
+    S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
     VirtualCssBus *css_bus;
     DeviceState *dev;
 
+    ms->pv = false;
     s390_sclp_init();
     /* init memory + setup max page size. Required for the CPU model */
     s390_memory_init(machine->ram);
@@ -316,10 +320,88 @@ static inline void s390_do_cpu_ipl(CPUState *cs, run_on_cpu_data arg)
     s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
 }
 
+static void s390_machine_unprotect(S390CcwMachineState *ms)
+{
+    CPUState *t;
+
+    s390_pv_vm_disable();
+    CPU_FOREACH(t) {
+        S390_CPU(t)->env.pv = false;
+    }
+    ms->pv = false;
+}
+
+static int s390_machine_protect(S390CcwMachineState *ms)
+{
+    CPUState *t;
+    int rc;
+
+    /* Create SE VM */
+    rc = s390_pv_vm_enable();
+    if (rc) {
+        return rc;
+    }
+
+    CPU_FOREACH(t) {
+        S390_CPU(t)->env.pv = true;
+    }
+    ms->pv = true;
+
+    /* Set SE header and unpack */
+    rc = s390_ipl_prepare_pv_header();
+    if (rc) {
+        goto out_err;
+    }
+
+    /* Decrypt image */
+    rc = s390_ipl_pv_unpack();
+    if (rc) {
+        goto out_err;
+    }
+
+    /* Verify integrity */
+    rc = s390_pv_verify();
+    if (rc) {
+        goto out_err;
+    }
+    return rc;
+
+out_err:
+    s390_machine_unprotect(ms);
+    return rc;
+}
+
+#define DIAG_308_RC_INVAL_FOR_PV    0x0a02
+static void s390_machine_inject_pv_error(CPUState *cs)
+{
+    int r1 = (cs->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
+    CPUS390XState *env = &S390_CPU(cs)->env;
+
+    /* Report that we are unable to enter protected mode */
+    env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
+}
+
+static void s390_pv_prepare_reset(S390CcwMachineState *ms)
+{
+    CPUState *cs;
+
+    if (!ms->pv) {
+        return;
+    }
+    /* Unsharing requires all cpus to be stopped */
+    CPU_FOREACH(cs) {
+        s390_cpu_set_state(S390_CPU_STATE_STOPPED, S390_CPU(cs));
+    }
+    s390_pv_unshare();
+    s390_pv_perf_clear_reset();
+}
+
 static void s390_machine_reset(MachineState *machine)
 {
+    S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
     enum s390_reset reset_type;
     CPUState *cs, *t;
+    S390CPU *cpu;
 
     /* get the reset parameters, reset them once done */
     s390_ipl_get_reset_request(&cs, &reset_type);
@@ -327,9 +409,15 @@ static void s390_machine_reset(MachineState *machine)
     /* all CPUs are paused and synchronized at this point */
     s390_cmma_reset();
 
+    cpu = S390_CPU(cs);
+
     switch (reset_type) {
     case S390_RESET_EXTERNAL:
     case S390_RESET_REIPL:
+        if (ms->pv) {
+            s390_machine_unprotect(ms);
+        }
+
         qemu_devices_reset();
         s390_crypto_reset();
 
@@ -337,22 +425,56 @@ static void s390_machine_reset(MachineState *machine)
         run_on_cpu(cs, s390_do_cpu_ipl, RUN_ON_CPU_NULL);
         break;
     case S390_RESET_MODIFIED_CLEAR:
+        /*
+         * Susbsystem reset needs to be done before we unshare memory
+         * and loose access to VIRTIO structures in guest memory.
+         */
+        subsystem_reset();
+        s390_crypto_reset();
+        s390_pv_prepare_reset(ms);
         CPU_FOREACH(t) {
             run_on_cpu(t, s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
         }
-        subsystem_reset();
-        s390_crypto_reset();
         run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
         break;
     case S390_RESET_LOAD_NORMAL:
+        /*
+         * Susbsystem reset needs to be done before we unshare memory
+         * and loose access to VIRTIO structures in guest memory.
+         */
+        subsystem_reset();
+        s390_pv_prepare_reset(ms);
         CPU_FOREACH(t) {
             if (t == cs) {
                 continue;
             }
             run_on_cpu(t, s390_do_cpu_reset, RUN_ON_CPU_NULL);
         }
-        subsystem_reset();
         run_on_cpu(cs, s390_do_cpu_initial_reset, RUN_ON_CPU_NULL);
+        run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
+        break;
+    case S390_RESET_PV: /* Subcode 10 */
+        subsystem_reset();
+        s390_crypto_reset();
+
+        CPU_FOREACH(t) {
+            if (t == cs) {
+                continue;
+            }
+            run_on_cpu(t, s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
+        }
+        run_on_cpu(cs, s390_do_cpu_reset, RUN_ON_CPU_NULL);
+
+        if (s390_machine_protect(ms)) {
+            s390_machine_inject_pv_error(cs);
+            /*
+             * Continue after the diag308 so the guest knows something
+             * went wrong.
+             */
+            s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
+            return;
+        }
+
         run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
         break;
     default:
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 8aa27199c9..cd1dccc6e3 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -28,6 +28,7 @@ typedef struct S390CcwMachineState {
     /*< public >*/
     bool aes_key_wrap;
     bool dea_key_wrap;
+    bool pv;
     uint8_t loadparm[8];
 } S390CcwMachineState;
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3dd396e870..aec5fb3b76 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -37,6 +37,8 @@
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
 #ifndef CONFIG_USER_ONLY
+#include "hw/s390x/s390-virtio-ccw.h"
+#include "hw/s390x/pv.h"
 #include "hw/boards.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
@@ -174,6 +176,25 @@ static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_s390;
 }
 
+#if !defined(CONFIG_USER_ONLY)
+static bool machine_is_pv(MachineState *ms)
+{
+    static S390CcwMachineState *ccw;
+    Object *obj;
+
+    if (ccw)
+	    return ccw->pv;
+
+    /* we have to bail out for the "none" machine */
+    obj = object_dynamic_cast(OBJECT(ms), TYPE_S390_CCW_MACHINE);
+     if (!obj) {
+        return false;
+    }
+    ccw = S390_CCW_MACHINE(obj);
+    return ccw->pv;
+}
+#endif
+
 static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -205,6 +226,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
+    cpu->env.pv = machine_is_pv(ms);
     /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. */
     cs->cpu_index = cpu->env.core_id;
 #endif
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 1d17709d6e..7e4d9d267c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -114,6 +114,7 @@ struct CPUS390XState {
 
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
+    bool pv; /* protected virtualization */
 
 #if !defined(CONFIG_USER_ONLY)
     uint32_t core_id; /* PoP "CPU address", same as cpu_index */
diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_features_def.inc.h
index 31dff0d84e..60db28351d 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -107,6 +107,7 @@ DEF_FEAT(DEFLATE_BASE, "deflate-base", STFL, 151, "Deflate-conversion facility (
 DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-Enhancement Facility")
 DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
 DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
+DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 54e5670b3f..51f51eb5c6 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -52,6 +52,7 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 #define DIAG_308_RC_OK              0x0001
 #define DIAG_308_RC_NO_CONF         0x0102
 #define DIAG_308_RC_INVALID         0x0402
+#define DIAG_308_RC_NO_PV_CONF      0x0902
 
 #define DIAG308_RESET_MOD_CLR       0
 #define DIAG308_RESET_LOAD_NORM     1
@@ -59,10 +60,17 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 #define DIAG308_LOAD_NORMAL_DUMP    4
 #define DIAG308_SET                 5
 #define DIAG308_STORE               6
+#define DIAG308_PV_SET              8
+#define DIAG308_PV_STORE            9
+#define DIAG308_PV_START            10
 
 static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t addr,
                               uintptr_t ra, bool write)
 {
+    /* Handled by the Ultravisor */
+    if (env->pv) {
+        return 0;
+    }
     if ((r1 & 1) || (addr & ~TARGET_PAGE_MASK)) {
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return -1;
@@ -93,6 +101,11 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
         return;
     }
 
+    if (subcode >= DIAG308_PV_SET && !s390_has_feat(S390_FEAT_UNPACK)) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return;
+    }
+
     switch (subcode) {
     case DIAG308_RESET_MOD_CLR:
         s390_ipl_reset_request(cs, S390_RESET_MODIFIED_CLEAR);
@@ -105,6 +118,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
         s390_ipl_reset_request(cs, S390_RESET_REIPL);
         break;
     case DIAG308_SET:
+    case DIAG308_PV_SET:
         if (diag308_parm_check(env, r1, addr, ra, false)) {
             return;
         }
@@ -128,17 +142,31 @@ out:
         g_free(iplb);
         return;
     case DIAG308_STORE:
+    case DIAG308_PV_STORE:
         if (diag308_parm_check(env, r1, addr, ra, true)) {
             return;
         }
-        iplb = s390_ipl_get_iplb();
+        if (subcode == DIAG308_PV_STORE) {
+            iplb = s390_ipl_get_iplb_pv();
+        } else {
+            iplb = s390_ipl_get_iplb();
+        }
         if (iplb) {
             cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->len));
             env->regs[r1 + 1] = DIAG_308_RC_OK;
         } else {
             env->regs[r1 + 1] = DIAG_308_RC_NO_CONF;
         }
-        return;
+        break;
+    case DIAG308_PV_START:
+        iplb = s390_ipl_get_iplb_pv();
+        if (!iplb) {
+            env->regs[r1 + 1] = DIAG_308_RC_NO_PV_CONF;
+            return;
+        }
+
+        s390_ipl_reset_request(cs, S390_RESET_PV);
+        break;
     default:
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         break;
-- 
2.20.1


