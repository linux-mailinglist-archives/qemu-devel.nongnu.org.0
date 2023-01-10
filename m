Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D416641D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:30:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDfw-0001TE-Ou; Tue, 10 Jan 2023 07:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDd2-0007Ef-M4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:20 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDct-0000V4-BT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uokjStvan6WxJShESbSU8d8N/2/skIhLQ+MaKZmUoAA=; b=eKU7O+8rtow3USpad0ufcohbPF
 /8lFoPo7wMkhnK3Ucc64tJt8pruzx3LCGnaqzdOc3vjE9C5CdU19OMdDm899Pni55PgFsEFGboxjU
 /kwRTX/j/M4aVS8l2gyJ8gwWwU9UjsBZWT7PIR3lkKVlir7+5JToRUiMnaF6EQtdBXZ8mCrY2L7xU
 z9QfhlDj51nMU218zNDOfPC1xAEqNKpWs0gNGsClAGFGBXikHo1ACudRoZ+EToB5TGvRvWiEHkjir
 Ik3pth5VI1WDL8cn+Nxl5XZn6ujbb+Wg5WlU2WLJg5i4x1v/nPrYVaoQqOYixEb2jd7QoRnu18dBE
 yR2AK8Yg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDcM-0037tk-1r; Tue, 10 Jan 2023 12:20:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDcR-006YdZ-V2; Tue, 10 Jan 2023 12:20:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [PATCH v6 01/51] include: import Xen public headers to
 include/standard-headers/
Date: Tue, 10 Jan 2023 12:19:52 +0000
Message-Id: <20230110122042.1562155-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110122042.1562155-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

There are already some partial headers in include/hw/xen/interface/
which will be removed once we migrate users to the new location.

To start with, define __XEN_TOOLS__ in hw/xen/xen.h to ensure that any
internal definitions needed by Xen toolstack libraries are present
regardless of the order in which the headers are included. A reckoning
will come later, once we make the PV backends work in emulation and
untangle the headers for Xen-native vs. generic parts.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Update to Xen public headers from 4.16.2 release, add some in io/,
        define __XEN_TOOLS__ in hw/xen/xen.h]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/hw/xen/xen.h                          |   16 +-
 include/standard-headers/xen/arch-x86/cpuid.h |  118 ++
 .../xen/arch-x86/xen-x86_32.h                 |  194 +++
 .../xen/arch-x86/xen-x86_64.h                 |  241 ++++
 include/standard-headers/xen/arch-x86/xen.h   |  398 ++++++
 include/standard-headers/xen/event_channel.h  |  388 ++++++
 include/standard-headers/xen/features.h       |  143 +++
 include/standard-headers/xen/grant_table.h    |  686 ++++++++++
 include/standard-headers/xen/hvm/hvm_op.h     |  395 ++++++
 include/standard-headers/xen/hvm/params.h     |  318 +++++
 include/standard-headers/xen/io/blkif.h       |  722 +++++++++++
 include/standard-headers/xen/io/console.h     |   56 +
 include/standard-headers/xen/io/fbif.h        |  176 +++
 include/standard-headers/xen/io/kbdif.h       |  576 +++++++++
 include/standard-headers/xen/io/netif.h       | 1102 +++++++++++++++++
 include/standard-headers/xen/io/protocols.h   |   42 +
 include/standard-headers/xen/io/ring.h        |  495 ++++++++
 include/standard-headers/xen/io/usbif.h       |  425 +++++++
 include/standard-headers/xen/io/xenbus.h      |   80 ++
 include/standard-headers/xen/io/xs_wire.h     |  153 +++
 include/standard-headers/xen/memory.h         |  754 +++++++++++
 include/standard-headers/xen/physdev.h        |  383 ++++++
 include/standard-headers/xen/sched.h          |  202 +++
 include/standard-headers/xen/trace.h          |  341 +++++
 include/standard-headers/xen/vcpu.h           |  248 ++++
 include/standard-headers/xen/version.h        |  113 ++
 include/standard-headers/xen/xen-compat.h     |   46 +
 include/standard-headers/xen/xen.h            | 1049 ++++++++++++++++
 28 files changed, 9857 insertions(+), 3 deletions(-)
 create mode 100644 include/standard-headers/xen/arch-x86/cpuid.h
 create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_32.h
 create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_64.h
 create mode 100644 include/standard-headers/xen/arch-x86/xen.h
 create mode 100644 include/standard-headers/xen/event_channel.h
 create mode 100644 include/standard-headers/xen/features.h
 create mode 100644 include/standard-headers/xen/grant_table.h
 create mode 100644 include/standard-headers/xen/hvm/hvm_op.h
 create mode 100644 include/standard-headers/xen/hvm/params.h
 create mode 100644 include/standard-headers/xen/io/blkif.h
 create mode 100644 include/standard-headers/xen/io/console.h
 create mode 100644 include/standard-headers/xen/io/fbif.h
 create mode 100644 include/standard-headers/xen/io/kbdif.h
 create mode 100644 include/standard-headers/xen/io/netif.h
 create mode 100644 include/standard-headers/xen/io/protocols.h
 create mode 100644 include/standard-headers/xen/io/ring.h
 create mode 100644 include/standard-headers/xen/io/usbif.h
 create mode 100644 include/standard-headers/xen/io/xenbus.h
 create mode 100644 include/standard-headers/xen/io/xs_wire.h
 create mode 100644 include/standard-headers/xen/memory.h
 create mode 100644 include/standard-headers/xen/physdev.h
 create mode 100644 include/standard-headers/xen/sched.h
 create mode 100644 include/standard-headers/xen/trace.h
 create mode 100644 include/standard-headers/xen/vcpu.h
 create mode 100644 include/standard-headers/xen/version.h
 create mode 100644 include/standard-headers/xen/xen-compat.h
 create mode 100644 include/standard-headers/xen/xen.h

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..4d412fd4b2 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -1,12 +1,22 @@
-#ifndef QEMU_HW_XEN_H
-#define QEMU_HW_XEN_H
-
 /*
  * public xen header
  *   stuff needed outside xen-*.c, i.e. interfaces to qemu.
  *   must not depend on any xen headers being present in
  *   /usr/include/xen, so it can be included unconditionally.
  */
+#ifndef QEMU_HW_XEN_H
+#define QEMU_HW_XEN_H
+
+/*
+ * As a temporary measure while the headers are being untangled, define
+ * __XEN_TOOLS__ here before any Xen headers are included. Otherwise, if
+ * the Xen toolstack library headers are later included, they will find
+ * some of the "internal" definitions missing and the build will fail. In
+ * later commits, we'll end up with a rule that the native libraries have
+ * to be included first, which will ensure that the libraries get the
+ * version of Xen libraries that they expect.
+ */
+#define __XEN_TOOLS__ 1
 
 #include "exec/cpu-common.h"
 
diff --git a/include/standard-headers/xen/arch-x86/cpuid.h b/include/standard-headers/xen/arch-x86/cpuid.h
new file mode 100644
index 0000000000..ce46305bee
--- /dev/null
+++ b/include/standard-headers/xen/arch-x86/cpuid.h
@@ -0,0 +1,118 @@
+/******************************************************************************
+ * arch-x86/cpuid.h
+ *
+ * CPUID interface to Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2007 Citrix Systems, Inc.
+ *
+ * Authors:
+ *    Keir Fraser <keir@xen.org>
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_X86_CPUID_H__
+#define __XEN_PUBLIC_ARCH_X86_CPUID_H__
+
+/*
+ * For compatibility with other hypervisor interfaces, the Xen cpuid leaves
+ * can be found at the first otherwise unused 0x100 aligned boundary starting
+ * from 0x40000000.
+ *
+ * e.g If viridian extensions are enabled for an HVM domain, the Xen cpuid
+ * leaves will start at 0x40000100
+ */
+
+#define XEN_CPUID_FIRST_LEAF 0x40000000
+#define XEN_CPUID_LEAF(i)    (XEN_CPUID_FIRST_LEAF + (i))
+
+/*
+ * Leaf 1 (0x40000x00)
+ * EAX: Largest Xen-information leaf. All leaves up to an including @EAX
+ *      are supported by the Xen host.
+ * EBX-EDX: "XenVMMXenVMM" signature, allowing positive identification
+ *      of a Xen host.
+ */
+#define XEN_CPUID_SIGNATURE_EBX 0x566e6558 /* "XenV" */
+#define XEN_CPUID_SIGNATURE_ECX 0x65584d4d /* "MMXe" */
+#define XEN_CPUID_SIGNATURE_EDX 0x4d4d566e /* "nVMM" */
+
+/*
+ * Leaf 2 (0x40000x01)
+ * EAX[31:16]: Xen major version.
+ * EAX[15: 0]: Xen minor version.
+ * EBX-EDX: Reserved (currently all zeroes).
+ */
+
+/*
+ * Leaf 3 (0x40000x02)
+ * EAX: Number of hypercall transfer pages. This register is always guaranteed
+ *      to specify one hypercall page.
+ * EBX: Base address of Xen-specific MSRs.
+ * ECX: Features 1. Unused bits are set to zero.
+ * EDX: Features 2. Unused bits are set to zero.
+ */
+
+/* Does the host support MMU_PT_UPDATE_PRESERVE_AD for this guest? */
+#define _XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD 0
+#define XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD  (1u<<0)
+
+/*
+ * Leaf 4 (0x40000x03)
+ * Sub-leaf 0: EAX: bit 0: emulated tsc
+ *                  bit 1: host tsc is known to be reliable
+ *                  bit 2: RDTSCP instruction available
+ *             EBX: tsc_mode: 0=default (emulate if necessary), 1=emulate,
+ *                            2=no emulation, 3=no emulation + TSC_AUX support
+ *             ECX: guest tsc frequency in kHz
+ *             EDX: guest tsc incarnation (migration count)
+ * Sub-leaf 1: EAX: tsc offset low part
+ *             EBX: tsc offset high part
+ *             ECX: multiplicator for tsc->ns conversion
+ *             EDX: shift amount for tsc->ns conversion
+ * Sub-leaf 2: EAX: host tsc frequency in kHz
+ */
+
+/*
+ * Leaf 5 (0x40000x04)
+ * HVM-specific features
+ * Sub-leaf 0: EAX: Features
+ * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
+ * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
+ */
+#define XEN_HVM_CPUID_APIC_ACCESS_VIRT (1u << 0) /* Virtualized APIC registers */
+#define XEN_HVM_CPUID_X2APIC_VIRT      (1u << 1) /* Virtualized x2APIC accesses */
+/* Memory mapped from other domains has valid IOMMU entries */
+#define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
+#define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
+#define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
+
+/*
+ * Leaf 6 (0x40000x05)
+ * PV-specific parameters
+ * Sub-leaf 0: EAX: max available sub-leaf
+ * Sub-leaf 0: EBX: bits 0-7: max machine address width
+ */
+
+/* Max. address width in bits taking memory hotplug into account. */
+#define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
+
+#define XEN_CPUID_MAX_NUM_LEAVES 5
+
+#endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
diff --git a/include/standard-headers/xen/arch-x86/xen-x86_32.h b/include/standard-headers/xen/arch-x86/xen-x86_32.h
new file mode 100644
index 0000000000..19d7388633
--- /dev/null
+++ b/include/standard-headers/xen/arch-x86/xen-x86_32.h
@@ -0,0 +1,194 @@
+/******************************************************************************
+ * xen-x86_32.h
+ *
+ * Guest OS interface to x86 32-bit Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004-2007, K A Fraser
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__
+#define __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__
+
+/*
+ * Hypercall interface:
+ *  Input:  %ebx, %ecx, %edx, %esi, %edi, %ebp (arguments 1-6)
+ *  Output: %eax
+ * Access is via hypercall page (set up by guest loader or via a Xen MSR):
+ *  call hypercall_page + hypercall-number * 32
+ * Clobbered: Argument registers (e.g., 2-arg hypercall clobbers %ebx,%ecx)
+ */
+
+/*
+ * These flat segments are in the Xen-private section of every GDT. Since these
+ * are also present in the initial GDT, many OSes will be able to avoid
+ * installing their own GDT.
+ */
+#define FLAT_RING1_CS 0xe019    /* GDT index 259 */
+#define FLAT_RING1_DS 0xe021    /* GDT index 260 */
+#define FLAT_RING1_SS 0xe021    /* GDT index 260 */
+#define FLAT_RING3_CS 0xe02b    /* GDT index 261 */
+#define FLAT_RING3_DS 0xe033    /* GDT index 262 */
+#define FLAT_RING3_SS 0xe033    /* GDT index 262 */
+
+#define FLAT_KERNEL_CS FLAT_RING1_CS
+#define FLAT_KERNEL_DS FLAT_RING1_DS
+#define FLAT_KERNEL_SS FLAT_RING1_SS
+#define FLAT_USER_CS    FLAT_RING3_CS
+#define FLAT_USER_DS    FLAT_RING3_DS
+#define FLAT_USER_SS    FLAT_RING3_SS
+
+#define __HYPERVISOR_VIRT_START_PAE    0xF5800000
+#define __MACH2PHYS_VIRT_START_PAE     0xF5800000
+#define __MACH2PHYS_VIRT_END_PAE       0xF6800000
+#define HYPERVISOR_VIRT_START_PAE      xen_mk_ulong(__HYPERVISOR_VIRT_START_PAE)
+#define MACH2PHYS_VIRT_START_PAE       xen_mk_ulong(__MACH2PHYS_VIRT_START_PAE)
+#define MACH2PHYS_VIRT_END_PAE         xen_mk_ulong(__MACH2PHYS_VIRT_END_PAE)
+
+/* Non-PAE bounds are obsolete. */
+#define __HYPERVISOR_VIRT_START_NONPAE 0xFC000000
+#define __MACH2PHYS_VIRT_START_NONPAE  0xFC000000
+#define __MACH2PHYS_VIRT_END_NONPAE    0xFC400000
+#define HYPERVISOR_VIRT_START_NONPAE   \
+    xen_mk_ulong(__HYPERVISOR_VIRT_START_NONPAE)
+#define MACH2PHYS_VIRT_START_NONPAE    \
+    xen_mk_ulong(__MACH2PHYS_VIRT_START_NONPAE)
+#define MACH2PHYS_VIRT_END_NONPAE      \
+    xen_mk_ulong(__MACH2PHYS_VIRT_END_NONPAE)
+
+#define __HYPERVISOR_VIRT_START __HYPERVISOR_VIRT_START_PAE
+#define __MACH2PHYS_VIRT_START  __MACH2PHYS_VIRT_START_PAE
+#define __MACH2PHYS_VIRT_END    __MACH2PHYS_VIRT_END_PAE
+
+#ifndef HYPERVISOR_VIRT_START
+#define HYPERVISOR_VIRT_START xen_mk_ulong(__HYPERVISOR_VIRT_START)
+#endif
+
+#define MACH2PHYS_VIRT_START  xen_mk_ulong(__MACH2PHYS_VIRT_START)
+#define MACH2PHYS_VIRT_END    xen_mk_ulong(__MACH2PHYS_VIRT_END)
+#define MACH2PHYS_NR_ENTRIES  ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>2)
+#ifndef machine_to_phys_mapping
+#define machine_to_phys_mapping ((unsigned long *)MACH2PHYS_VIRT_START)
+#endif
+
+/* 32-/64-bit invariability for control interfaces (domctl/sysctl). */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+#undef ___DEFINE_XEN_GUEST_HANDLE
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
+    typedef struct { type *p; }                                 \
+        __guest_handle_ ## name;                                \
+    typedef struct { union { type *p; uint64_aligned_t q; }; }  \
+        __guest_handle_64_ ## name
+#undef set_xen_guest_handle_raw
+#define set_xen_guest_handle_raw(hnd, val)                  \
+    do { if ( sizeof(hnd) == 8 ) *(uint64_t *)&(hnd) = 0;   \
+         (hnd).p = val;                                     \
+    } while ( 0 )
+#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
+#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
+#define __XEN_GUEST_HANDLE_64(name) __guest_handle_64_ ## name
+#define XEN_GUEST_HANDLE_64(name) __XEN_GUEST_HANDLE_64(name)
+#endif
+
+#ifndef __ASSEMBLY__
+
+#if defined(XEN_GENERATING_COMPAT_HEADERS)
+/* nothing */
+#elif defined(__XEN__) || defined(__XEN_TOOLS__)
+/* Anonymous unions include all permissible names (e.g., al/ah/ax/eax). */
+#define __DECL_REG_LO8(which) union { \
+    uint32_t e ## which ## x; \
+    uint16_t which ## x; \
+    struct { \
+        uint8_t which ## l; \
+        uint8_t which ## h; \
+    }; \
+}
+#define __DECL_REG_LO16(name) union { \
+    uint32_t e ## name, _e ## name; \
+    uint16_t name; \
+}
+#else
+/* Other sources must always use the proper 32-bit name (e.g., eax). */
+#define __DECL_REG_LO8(which) uint32_t e ## which ## x
+#define __DECL_REG_LO16(name) uint32_t e ## name
+#endif
+
+struct cpu_user_regs {
+    __DECL_REG_LO8(b);
+    __DECL_REG_LO8(c);
+    __DECL_REG_LO8(d);
+    __DECL_REG_LO16(si);
+    __DECL_REG_LO16(di);
+    __DECL_REG_LO16(bp);
+    __DECL_REG_LO8(a);
+    uint16_t error_code;    /* private */
+    uint16_t entry_vector;  /* private */
+    __DECL_REG_LO16(ip);
+    uint16_t cs;
+    uint8_t  saved_upcall_mask;
+    uint8_t  _pad0;
+    __DECL_REG_LO16(flags); /* eflags.IF == !saved_upcall_mask */
+    __DECL_REG_LO16(sp);
+    uint16_t ss, _pad1;
+    uint16_t es, _pad2;
+    uint16_t ds, _pad3;
+    uint16_t fs, _pad4;
+    uint16_t gs, _pad5;
+};
+typedef struct cpu_user_regs cpu_user_regs_t;
+DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
+
+#undef __DECL_REG_LO8
+#undef __DECL_REG_LO16
+
+/*
+ * Page-directory addresses above 4GB do not fit into architectural %cr3.
+ * When accessing %cr3, or equivalent field in vcpu_guest_context, guests
+ * must use the following accessor macros to pack/unpack valid MFNs.
+ */
+#define xen_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
+#define xen_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
+
+struct arch_vcpu_info {
+    unsigned long cr2;
+    unsigned long pad[5]; /* sizeof(vcpu_info_t) == 64 */
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+struct xen_callback {
+    unsigned long cs;
+    unsigned long eip;
+};
+typedef struct xen_callback xen_callback_t;
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/arch-x86/xen-x86_64.h b/include/standard-headers/xen/arch-x86/xen-x86_64.h
new file mode 100644
index 0000000000..40aed14366
--- /dev/null
+++ b/include/standard-headers/xen/arch-x86/xen-x86_64.h
@@ -0,0 +1,241 @@
+/******************************************************************************
+ * xen-x86_64.h
+ *
+ * Guest OS interface to x86 64-bit Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004-2006, K A Fraser
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__
+#define __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__
+
+/*
+ * Hypercall interface:
+ *  Input:  %rdi, %rsi, %rdx, %r10, %r8, %r9 (arguments 1-6)
+ *  Output: %rax
+ * Access is via hypercall page (set up by guest loader or via a Xen MSR):
+ *  call hypercall_page + hypercall-number * 32
+ * Clobbered: argument registers (e.g., 2-arg hypercall clobbers %rdi,%rsi)
+ */
+
+/*
+ * 64-bit segment selectors
+ * These flat segments are in the Xen-private section of every GDT. Since these
+ * are also present in the initial GDT, many OSes will be able to avoid
+ * installing their own GDT.
+ */
+
+#define FLAT_RING3_CS32 0xe023  /* GDT index 260 */
+#define FLAT_RING3_CS64 0xe033  /* GDT index 262 */
+#define FLAT_RING3_DS32 0xe02b  /* GDT index 261 */
+#define FLAT_RING3_DS64 0x0000  /* NULL selector */
+#define FLAT_RING3_SS32 0xe02b  /* GDT index 261 */
+#define FLAT_RING3_SS64 0xe02b  /* GDT index 261 */
+
+#define FLAT_KERNEL_DS64 FLAT_RING3_DS64
+#define FLAT_KERNEL_DS32 FLAT_RING3_DS32
+#define FLAT_KERNEL_DS   FLAT_KERNEL_DS64
+#define FLAT_KERNEL_CS64 FLAT_RING3_CS64
+#define FLAT_KERNEL_CS32 FLAT_RING3_CS32
+#define FLAT_KERNEL_CS   FLAT_KERNEL_CS64
+#define FLAT_KERNEL_SS64 FLAT_RING3_SS64
+#define FLAT_KERNEL_SS32 FLAT_RING3_SS32
+#define FLAT_KERNEL_SS   FLAT_KERNEL_SS64
+
+#define FLAT_USER_DS64 FLAT_RING3_DS64
+#define FLAT_USER_DS32 FLAT_RING3_DS32
+#define FLAT_USER_DS   FLAT_USER_DS64
+#define FLAT_USER_CS64 FLAT_RING3_CS64
+#define FLAT_USER_CS32 FLAT_RING3_CS32
+#define FLAT_USER_CS   FLAT_USER_CS64
+#define FLAT_USER_SS64 FLAT_RING3_SS64
+#define FLAT_USER_SS32 FLAT_RING3_SS32
+#define FLAT_USER_SS   FLAT_USER_SS64
+
+#define __HYPERVISOR_VIRT_START 0xFFFF800000000000
+#define __HYPERVISOR_VIRT_END   0xFFFF880000000000
+#define __MACH2PHYS_VIRT_START  0xFFFF800000000000
+#define __MACH2PHYS_VIRT_END    0xFFFF804000000000
+
+#ifndef HYPERVISOR_VIRT_START
+#define HYPERVISOR_VIRT_START xen_mk_ulong(__HYPERVISOR_VIRT_START)
+#define HYPERVISOR_VIRT_END   xen_mk_ulong(__HYPERVISOR_VIRT_END)
+#endif
+
+#define MACH2PHYS_VIRT_START  xen_mk_ulong(__MACH2PHYS_VIRT_START)
+#define MACH2PHYS_VIRT_END    xen_mk_ulong(__MACH2PHYS_VIRT_END)
+#define MACH2PHYS_NR_ENTRIES  ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>3)
+#ifndef machine_to_phys_mapping
+#define machine_to_phys_mapping ((unsigned long *)HYPERVISOR_VIRT_START)
+#endif
+
+/*
+ * int HYPERVISOR_set_segment_base(unsigned int which, unsigned long base)
+ *  @which == SEGBASE_*  ;  @base == 64-bit base address
+ * Returns 0 on success.
+ */
+#define SEGBASE_FS          0
+#define SEGBASE_GS_USER     1
+#define SEGBASE_GS_KERNEL   2
+#define SEGBASE_GS_USER_SEL 3 /* Set user %gs specified in base[15:0] */
+
+/*
+ * int HYPERVISOR_iret(void)
+ * All arguments are on the kernel stack, in the following format.
+ * Never returns if successful. Current kernel context is lost.
+ * The saved CS is mapped as follows:
+ *   RING0 -> RING3 kernel mode.
+ *   RING1 -> RING3 kernel mode.
+ *   RING2 -> RING3 kernel mode.
+ *   RING3 -> RING3 user mode.
+ * However RING0 indicates that the guest kernel should return to iteself
+ * directly with
+ *      orb   $3,1*8(%rsp)
+ *      iretq
+ * If flags contains VGCF_in_syscall:
+ *   Restore RAX, RIP, RFLAGS, RSP.
+ *   Discard R11, RCX, CS, SS.
+ * Otherwise:
+ *   Restore RAX, R11, RCX, CS:RIP, RFLAGS, SS:RSP.
+ * All other registers are saved on hypercall entry and restored to user.
+ */
+/* Guest exited in SYSCALL context? Return to guest with SYSRET? */
+#define _VGCF_in_syscall 8
+#define VGCF_in_syscall  (1<<_VGCF_in_syscall)
+#define VGCF_IN_SYSCALL  VGCF_in_syscall
+
+#ifndef __ASSEMBLY__
+
+struct iret_context {
+    /* Top of stack (%rsp at point of hypercall). */
+    uint64_t rax, r11, rcx, flags, rip, cs, rflags, rsp, ss;
+    /* Bottom of iret stack frame. */
+};
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/* Anonymous unions include all permissible names (e.g., al/ah/ax/eax/rax). */
+#define __DECL_REG_LOHI(which) union { \
+    uint64_t r ## which ## x; \
+    uint32_t e ## which ## x; \
+    uint16_t which ## x; \
+    struct { \
+        uint8_t which ## l; \
+        uint8_t which ## h; \
+    }; \
+}
+#define __DECL_REG_LO8(name) union { \
+    uint64_t r ## name; \
+    uint32_t e ## name; \
+    uint16_t name; \
+    uint8_t name ## l; \
+}
+#define __DECL_REG_LO16(name) union { \
+    uint64_t r ## name; \
+    uint32_t e ## name; \
+    uint16_t name; \
+}
+#define __DECL_REG_HI(num) union { \
+    uint64_t r ## num; \
+    uint32_t r ## num ## d; \
+    uint16_t r ## num ## w; \
+    uint8_t r ## num ## b; \
+}
+#elif defined(__GNUC__) && !defined(__STRICT_ANSI__)
+/* Anonymous union includes both 32- and 64-bit names (e.g., eax/rax). */
+#define __DECL_REG(name) union { \
+    uint64_t r ## name, e ## name; \
+    uint32_t _e ## name; \
+}
+#else
+/* Non-gcc sources must always use the proper 64-bit name (e.g., rax). */
+#define __DECL_REG(name) uint64_t r ## name
+#endif
+
+#ifndef __DECL_REG_LOHI
+#define __DECL_REG_LOHI(name) __DECL_REG(name ## x)
+#define __DECL_REG_LO8        __DECL_REG
+#define __DECL_REG_LO16       __DECL_REG
+#define __DECL_REG_HI(num)    uint64_t r ## num
+#endif
+
+struct cpu_user_regs {
+    __DECL_REG_HI(15);
+    __DECL_REG_HI(14);
+    __DECL_REG_HI(13);
+    __DECL_REG_HI(12);
+    __DECL_REG_LO8(bp);
+    __DECL_REG_LOHI(b);
+    __DECL_REG_HI(11);
+    __DECL_REG_HI(10);
+    __DECL_REG_HI(9);
+    __DECL_REG_HI(8);
+    __DECL_REG_LOHI(a);
+    __DECL_REG_LOHI(c);
+    __DECL_REG_LOHI(d);
+    __DECL_REG_LO8(si);
+    __DECL_REG_LO8(di);
+    uint32_t error_code;    /* private */
+    uint32_t entry_vector;  /* private */
+    __DECL_REG_LO16(ip);
+    uint16_t cs, _pad0[1];
+    uint8_t  saved_upcall_mask;
+    uint8_t  _pad1[3];
+    __DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
+    __DECL_REG_LO8(sp);
+    uint16_t ss, _pad2[3];
+    uint16_t es, _pad3[3];
+    uint16_t ds, _pad4[3];
+    uint16_t fs, _pad5[3];
+    uint16_t gs, _pad6[3];
+};
+typedef struct cpu_user_regs cpu_user_regs_t;
+DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
+
+#undef __DECL_REG
+#undef __DECL_REG_LOHI
+#undef __DECL_REG_LO8
+#undef __DECL_REG_LO16
+#undef __DECL_REG_HI
+
+#define xen_pfn_to_cr3(pfn) ((unsigned long)(pfn) << 12)
+#define xen_cr3_to_pfn(cr3) ((unsigned long)(cr3) >> 12)
+
+struct arch_vcpu_info {
+    unsigned long cr2;
+    unsigned long pad; /* sizeof(vcpu_info_t) == 64 */
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+typedef unsigned long xen_callback_t;
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/arch-x86/xen.h b/include/standard-headers/xen/arch-x86/xen.h
new file mode 100644
index 0000000000..7acd94c8eb
--- /dev/null
+++ b/include/standard-headers/xen/arch-x86/xen.h
@@ -0,0 +1,398 @@
+/******************************************************************************
+ * arch-x86/xen.h
+ *
+ * Guest OS interface to x86 Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004-2006, K A Fraser
+ */
+
+#include "../xen.h"
+
+#ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
+#define __XEN_PUBLIC_ARCH_X86_XEN_H__
+
+/* Structural guest handles introduced in 0x00030201. */
+#if __XEN_INTERFACE_VERSION__ >= 0x00030201
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type) \
+    typedef struct { type *p; } __guest_handle_ ## name
+#else
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type) \
+    typedef type * __guest_handle_ ## name
+#endif
+
+/*
+ * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
+ * in a struct in memory.
+ * XEN_GUEST_HANDLE_PARAM represent a guest pointer, when passed as an
+ * hypercall argument.
+ * XEN_GUEST_HANDLE_PARAM and XEN_GUEST_HANDLE are the same on X86 but
+ * they might not be on other architectures.
+ */
+#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
+    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
+    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
+#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
+#define __XEN_GUEST_HANDLE(name)        __guest_handle_ ## name
+#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
+#define XEN_GUEST_HANDLE_PARAM(name)    XEN_GUEST_HANDLE(name)
+#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = val; } while (0)
+#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
+
+#if defined(__i386__)
+# ifdef __XEN__
+__DeFiNe__ __DECL_REG_LO8(which) uint32_t e ## which ## x
+__DeFiNe__ __DECL_REG_LO16(name) union { uint32_t e ## name; }
+# endif
+#include "xen-x86_32.h"
+# ifdef __XEN__
+__UnDeF__ __DECL_REG_LO8
+__UnDeF__ __DECL_REG_LO16
+__DeFiNe__ __DECL_REG_LO8(which) e ## which ## x
+__DeFiNe__ __DECL_REG_LO16(name) e ## name
+# endif
+#elif defined(__x86_64__)
+#include "xen-x86_64.h"
+#endif
+
+#ifndef __ASSEMBLY__
+typedef unsigned long xen_pfn_t;
+#define PRI_xen_pfn "lx"
+#define PRIu_xen_pfn "lu"
+#endif
+
+#define XEN_HAVE_PV_GUEST_ENTRY 1
+
+#define XEN_HAVE_PV_UPCALL_MASK 1
+
+/*
+ * `incontents 200 segdesc Segment Descriptor Tables
+ */
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_set_gdt(const xen_pfn_t frames[], unsigned int entries);
+ * `
+ */
+/*
+ * A number of GDT entries are reserved by Xen. These are not situated at the
+ * start of the GDT because some stupid OSes export hard-coded selector values
+ * in their ABI. These hard-coded values are always near the start of the GDT,
+ * so Xen places itself out of the way, at the far end of the GDT.
+ *
+ * NB The LDT is set using the MMUEXT_SET_LDT op of HYPERVISOR_mmuext_op
+ */
+#define FIRST_RESERVED_GDT_PAGE  14
+#define FIRST_RESERVED_GDT_BYTE  (FIRST_RESERVED_GDT_PAGE * 4096)
+#define FIRST_RESERVED_GDT_ENTRY (FIRST_RESERVED_GDT_BYTE / 8)
+
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_update_descriptor(u64 pa, u64 desc);
+ * `
+ * ` @pa   The machine physical address of the descriptor to
+ * `       update. Must be either a descriptor page or writable.
+ * ` @desc The descriptor value to update, in the same format as a
+ * `       native descriptor table entry.
+ */
+
+/* Maximum number of virtual CPUs in legacy multi-processor guests. */
+#define XEN_LEGACY_MAX_VCPUS 32
+
+#ifndef __ASSEMBLY__
+
+typedef unsigned long xen_ulong_t;
+#define PRI_xen_ulong "lx"
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_stack_switch(unsigned long ss, unsigned long esp);
+ * `
+ * Sets the stack segment and pointer for the current vcpu.
+ */
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_set_trap_table(const struct trap_info traps[]);
+ * `
+ */
+/*
+ * Send an array of these to HYPERVISOR_set_trap_table().
+ * Terminate the array with a sentinel entry, with traps[].address==0.
+ * The privilege level specifies which modes may enter a trap via a software
+ * interrupt. On x86/64, since rings 1 and 2 are unavailable, we allocate
+ * privilege levels as follows:
+ *  Level == 0: Noone may enter
+ *  Level == 1: Kernel may enter
+ *  Level == 2: Kernel may enter
+ *  Level == 3: Everyone may enter
+ *
+ * Note: For compatibility with kernels not setting up exception handlers
+ *       early enough, Xen will avoid trying to inject #GP (and hence crash
+ *       the domain) when an RDMSR would require this, but no handler was
+ *       set yet. The precise conditions are implementation specific, and
+ *       new code may not rely on such behavior anyway.
+ */
+#define TI_GET_DPL(_ti)      ((_ti)->flags & 3)
+#define TI_GET_IF(_ti)       ((_ti)->flags & 4)
+#define TI_SET_DPL(_ti,_dpl) ((_ti)->flags |= (_dpl))
+#define TI_SET_IF(_ti,_if)   ((_ti)->flags |= ((!!(_if))<<2))
+struct trap_info {
+    uint8_t       vector;  /* exception vector                              */
+    uint8_t       flags;   /* 0-3: privilege level; 4: clear event enable?  */
+    uint16_t      cs;      /* code selector                                 */
+    unsigned long address; /* code offset                                   */
+};
+typedef struct trap_info trap_info_t;
+DEFINE_XEN_GUEST_HANDLE(trap_info_t);
+
+typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */
+
+/*
+ * The following is all CPU context. Note that the fpu_ctxt block is filled
+ * in by FXSAVE if the CPU has feature FXSR; otherwise FSAVE is used.
+ *
+ * Also note that when calling DOMCTL_setvcpucontext for HVM guests, not all
+ * information in this structure is updated, the fields read include: fpu_ctxt
+ * (if VGCT_I387_VALID is set), flags, user_regs and debugreg[*].
+ *
+ * Note: VCPUOP_initialise for HVM guests is non-symetric with
+ * DOMCTL_setvcpucontext, and uses struct vcpu_hvm_context from hvm/hvm_vcpu.h
+ */
+struct vcpu_guest_context {
+    /* FPU registers come first so they can be aligned for FXSAVE/FXRSTOR. */
+    struct { char x[512]; } fpu_ctxt;       /* User-level FPU registers     */
+#define VGCF_I387_VALID                (1<<0)
+#define VGCF_IN_KERNEL                 (1<<2)
+#define _VGCF_i387_valid               0
+#define VGCF_i387_valid                (1<<_VGCF_i387_valid)
+#define _VGCF_in_kernel                2
+#define VGCF_in_kernel                 (1<<_VGCF_in_kernel)
+#define _VGCF_failsafe_disables_events 3
+#define VGCF_failsafe_disables_events  (1<<_VGCF_failsafe_disables_events)
+#define _VGCF_syscall_disables_events  4
+#define VGCF_syscall_disables_events   (1<<_VGCF_syscall_disables_events)
+#define _VGCF_online                   5
+#define VGCF_online                    (1<<_VGCF_online)
+    unsigned long flags;                    /* VGCF_* flags                 */
+    struct cpu_user_regs user_regs;         /* User-level CPU registers     */
+    struct trap_info trap_ctxt[256];        /* Virtual IDT                  */
+    unsigned long ldt_base, ldt_ents;       /* LDT (linear address, # ents) */
+    unsigned long gdt_frames[16], gdt_ents; /* GDT (machine frames, # ents) */
+    unsigned long kernel_ss, kernel_sp;     /* Virtual TSS (only SS1/SP1)   */
+    /* NB. User pagetable on x86/64 is placed in ctrlreg[1]. */
+    unsigned long ctrlreg[8];               /* CR0-CR7 (control registers)  */
+    unsigned long debugreg[8];              /* DB0-DB7 (debug registers)    */
+#ifdef __i386__
+    unsigned long event_callback_cs;        /* CS:EIP of event callback     */
+    unsigned long event_callback_eip;
+    unsigned long failsafe_callback_cs;     /* CS:EIP of failsafe callback  */
+    unsigned long failsafe_callback_eip;
+#else
+    unsigned long event_callback_eip;
+    unsigned long failsafe_callback_eip;
+#ifdef __XEN__
+    union {
+        unsigned long syscall_callback_eip;
+        struct {
+            unsigned int event_callback_cs;    /* compat CS of event cb     */
+            unsigned int failsafe_callback_cs; /* compat CS of failsafe cb  */
+        };
+    };
+#else
+    unsigned long syscall_callback_eip;
+#endif
+#endif
+    unsigned long vm_assist;                /* VMASST_TYPE_* bitmap */
+#ifdef __x86_64__
+    /* Segment base addresses. */
+    uint64_t      fs_base;
+    uint64_t      gs_base_kernel;
+    uint64_t      gs_base_user;
+#endif
+};
+typedef struct vcpu_guest_context vcpu_guest_context_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
+
+struct arch_shared_info {
+    /*
+     * Number of valid entries in the p2m table(s) anchored at
+     * pfn_to_mfn_frame_list_list and/or p2m_vaddr.
+     */
+    unsigned long max_pfn;
+    /*
+     * Frame containing list of mfns containing list of mfns containing p2m.
+     * A value of 0 indicates it has not yet been set up, ~0 indicates it has
+     * been set to invalid e.g. due to the p2m being too large for the 3-level
+     * p2m tree. In this case the linear mapper p2m list anchored at p2m_vaddr
+     * is to be used.
+     */
+    xen_pfn_t     pfn_to_mfn_frame_list_list;
+    unsigned long nmi_reason;
+    /*
+     * Following three fields are valid if p2m_cr3 contains a value different
+     * from 0.
+     * p2m_cr3 is the root of the address space where p2m_vaddr is valid.
+     * p2m_cr3 is in the same format as a cr3 value in the vcpu register state
+     * and holds the folded machine frame number (via xen_pfn_to_cr3) of a
+     * L3 or L4 page table.
+     * p2m_vaddr holds the virtual address of the linear p2m list. All entries
+     * in the range [0...max_pfn[ are accessible via this pointer.
+     * p2m_generation will be incremented by the guest before and after each
+     * change of the mappings of the p2m list. p2m_generation starts at 0 and
+     * a value with the least significant bit set indicates that a mapping
+     * update is in progress. This allows guest external software (e.g. in Dom0)
+     * to verify that read mappings are consistent and whether they have changed
+     * since the last check.
+     * Modifying a p2m element in the linear p2m list is allowed via an atomic
+     * write only.
+     */
+    unsigned long p2m_cr3;         /* cr3 value of the p2m address space */
+    unsigned long p2m_vaddr;       /* virtual address of the p2m list */
+    unsigned long p2m_generation;  /* generation count of p2m mapping */
+#ifdef __i386__
+    /* There's no room for this field in the generic structure. */
+    uint32_t wc_sec_hi;
+#endif
+};
+typedef struct arch_shared_info arch_shared_info_t;
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/*
+ * struct xen_arch_domainconfig's ABI is covered by
+ * XEN_DOMCTL_INTERFACE_VERSION.
+ */
+struct xen_arch_domainconfig {
+#define _XEN_X86_EMU_LAPIC          0
+#define XEN_X86_EMU_LAPIC           (1U<<_XEN_X86_EMU_LAPIC)
+#define _XEN_X86_EMU_HPET           1
+#define XEN_X86_EMU_HPET            (1U<<_XEN_X86_EMU_HPET)
+#define _XEN_X86_EMU_PM             2
+#define XEN_X86_EMU_PM              (1U<<_XEN_X86_EMU_PM)
+#define _XEN_X86_EMU_RTC            3
+#define XEN_X86_EMU_RTC             (1U<<_XEN_X86_EMU_RTC)
+#define _XEN_X86_EMU_IOAPIC         4
+#define XEN_X86_EMU_IOAPIC          (1U<<_XEN_X86_EMU_IOAPIC)
+#define _XEN_X86_EMU_PIC            5
+#define XEN_X86_EMU_PIC             (1U<<_XEN_X86_EMU_PIC)
+#define _XEN_X86_EMU_VGA            6
+#define XEN_X86_EMU_VGA             (1U<<_XEN_X86_EMU_VGA)
+#define _XEN_X86_EMU_IOMMU          7
+#define XEN_X86_EMU_IOMMU           (1U<<_XEN_X86_EMU_IOMMU)
+#define _XEN_X86_EMU_PIT            8
+#define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
+#define _XEN_X86_EMU_USE_PIRQ       9
+#define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
+#define _XEN_X86_EMU_VPCI           10
+#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+
+#define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
+                                     XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
+                                     XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
+                                     XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
+                                     XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
+                                     XEN_X86_EMU_VPCI)
+    uint32_t emulation_flags;
+
+/*
+ * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
+ * handled by Xen instead of injecting a #GP to the guest. Note this option
+ * doesn't allow the guest to read or write to the underlying MSR.
+ */
+#define XEN_X86_MSR_RELAXED (1u << 0)
+    uint32_t misc_flags;
+};
+
+/* Location of online VCPU bitmap. */
+#define XEN_ACPI_CPU_MAP             0xaf00
+#define XEN_ACPI_CPU_MAP_LEN         ((HVM_MAX_VCPUS + 7) / 8)
+
+/* GPE0 bit set during CPU hotplug */
+#define XEN_ACPI_GPE0_CPUHP_BIT      2
+#endif
+
+/*
+ * Representations of architectural CPUID and MSR information.  Used as the
+ * serialised version of Xen's internal representation.
+ */
+typedef struct xen_cpuid_leaf {
+#define XEN_CPUID_NO_SUBLEAF 0xffffffffu
+    uint32_t leaf, subleaf;
+    uint32_t a, b, c, d;
+} xen_cpuid_leaf_t;
+DEFINE_XEN_GUEST_HANDLE(xen_cpuid_leaf_t);
+
+typedef struct xen_msr_entry {
+    uint32_t idx;
+    uint32_t flags; /* Reserved MBZ. */
+    uint64_t val;
+} xen_msr_entry_t;
+DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
+
+#endif /* !__ASSEMBLY__ */
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_fpu_taskswitch(int set);
+ * `
+ * Sets (if set!=0) or clears (if set==0) CR0.TS.
+ */
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_set_debugreg(int regno, unsigned long value);
+ *
+ * ` unsigned long
+ * ` HYPERVISOR_get_debugreg(int regno);
+ * For 0<=reg<=7, returns the debug register value.
+ * For other values of reg, returns ((unsigned long)-EINVAL).
+ * (Unfortunately, this interface is defective.)
+ */
+
+/*
+ * Prefix forces emulation of some non-trapping instructions.
+ * Currently only CPUID.
+ */
+#ifdef __ASSEMBLY__
+#define XEN_EMULATE_PREFIX .byte 0x0f,0x0b,0x78,0x65,0x6e ;
+#define XEN_CPUID          XEN_EMULATE_PREFIX cpuid
+#else
+#define XEN_EMULATE_PREFIX ".byte 0x0f,0x0b,0x78,0x65,0x6e ; "
+#define XEN_CPUID          XEN_EMULATE_PREFIX "cpuid"
+#endif
+
+/*
+ * Debug console IO port, also called "port E9 hack". Each character written
+ * to this IO port will be printed on the hypervisor console, subject to log
+ * level restrictions.
+ */
+#define XEN_HVM_DEBUGCONS_IOPORT 0xe9
+
+#endif /* __XEN_PUBLIC_ARCH_X86_XEN_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/event_channel.h b/include/standard-headers/xen/event_channel.h
new file mode 100644
index 0000000000..73c9f38ce1
--- /dev/null
+++ b/include/standard-headers/xen/event_channel.h
@@ -0,0 +1,388 @@
+/******************************************************************************
+ * event_channel.h
+ *
+ * Event channels between domains.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2003-2004, K A Fraser.
+ */
+
+#ifndef __XEN_PUBLIC_EVENT_CHANNEL_H__
+#define __XEN_PUBLIC_EVENT_CHANNEL_H__
+
+#include "xen.h"
+
+/*
+ * `incontents 150 evtchn Event Channels
+ *
+ * Event channels are the basic primitive provided by Xen for event
+ * notifications. An event is the Xen equivalent of a hardware
+ * interrupt. They essentially store one bit of information, the event
+ * of interest is signalled by transitioning this bit from 0 to 1.
+ *
+ * Notifications are received by a guest via an upcall from Xen,
+ * indicating when an event arrives (setting the bit). Further
+ * notifications are masked until the bit is cleared again (therefore,
+ * guests must check the value of the bit after re-enabling event
+ * delivery to ensure no missed notifications).
+ *
+ * Event notifications can be masked by setting a flag; this is
+ * equivalent to disabling interrupts and can be used to ensure
+ * atomicity of certain operations in the guest kernel.
+ *
+ * Event channels are represented by the evtchn_* fields in
+ * struct shared_info and struct vcpu_info.
+ */
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_event_channel_op(enum event_channel_op cmd, void *args)
+ * `
+ * @cmd  == EVTCHNOP_* (event-channel operation).
+ * @args == struct evtchn_* Operation-specific extra arguments (NULL if none).
+ */
+
+/* ` enum event_channel_op { // EVTCHNOP_* => struct evtchn_* */
+#define EVTCHNOP_bind_interdomain 0
+#define EVTCHNOP_bind_virq        1
+#define EVTCHNOP_bind_pirq        2
+#define EVTCHNOP_close            3
+#define EVTCHNOP_send             4
+#define EVTCHNOP_status           5
+#define EVTCHNOP_alloc_unbound    6
+#define EVTCHNOP_bind_ipi         7
+#define EVTCHNOP_bind_vcpu        8
+#define EVTCHNOP_unmask           9
+#define EVTCHNOP_reset           10
+#define EVTCHNOP_init_control    11
+#define EVTCHNOP_expand_array    12
+#define EVTCHNOP_set_priority    13
+#ifdef __XEN__
+#define EVTCHNOP_reset_cont      14
+#endif
+/* ` } */
+
+typedef uint32_t evtchn_port_t;
+DEFINE_XEN_GUEST_HANDLE(evtchn_port_t);
+
+/*
+ * EVTCHNOP_alloc_unbound: Allocate a port in domain <dom> and mark as
+ * accepting interdomain bindings from domain <remote_dom>. A fresh port
+ * is allocated in <dom> and returned as <port>.
+ * NOTES:
+ *  1. If the caller is unprivileged then <dom> must be DOMID_SELF.
+ *  2. <remote_dom> may be DOMID_SELF, allowing loopback connections.
+ */
+struct evtchn_alloc_unbound {
+    /* IN parameters */
+    domid_t dom, remote_dom;
+    /* OUT parameters */
+    evtchn_port_t port;
+};
+typedef struct evtchn_alloc_unbound evtchn_alloc_unbound_t;
+
+/*
+ * EVTCHNOP_bind_interdomain: Construct an interdomain event channel between
+ * the calling domain and <remote_dom>. <remote_dom,remote_port> must identify
+ * a port that is unbound and marked as accepting bindings from the calling
+ * domain. A fresh port is allocated in the calling domain and returned as
+ * <local_port>.
+ *
+ * In case the peer domain has already tried to set our event channel
+ * pending, before it was bound, EVTCHNOP_bind_interdomain always sets
+ * the local event channel pending.
+ *
+ * The usual pattern of use, in the guest's upcall (or subsequent
+ * handler) is as follows: (Re-enable the event channel for subsequent
+ * signalling and then) check for the existence of whatever condition
+ * is being waited for by other means, and take whatever action is
+ * needed (if any).
+ *
+ * NOTES:
+ *  1. <remote_dom> may be DOMID_SELF, allowing loopback connections.
+ */
+struct evtchn_bind_interdomain {
+    /* IN parameters. */
+    domid_t remote_dom;
+    evtchn_port_t remote_port;
+    /* OUT parameters. */
+    evtchn_port_t local_port;
+};
+typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
+
+/*
+ * EVTCHNOP_bind_virq: Bind a local event channel to VIRQ <irq> on specified
+ * vcpu.
+ * NOTES:
+ *  1. Virtual IRQs are classified as per-vcpu or global. See the VIRQ list
+ *     in xen.h for the classification of each VIRQ.
+ *  2. Global VIRQs must be allocated on VCPU0 but can subsequently be
+ *     re-bound via EVTCHNOP_bind_vcpu.
+ *  3. Per-vcpu VIRQs may be bound to at most one event channel per vcpu.
+ *     The allocated event channel is bound to the specified vcpu and the
+ *     binding cannot be changed.
+ */
+struct evtchn_bind_virq {
+    /* IN parameters. */
+    uint32_t virq; /* enum virq */
+    uint32_t vcpu;
+    /* OUT parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_bind_virq evtchn_bind_virq_t;
+
+/*
+ * EVTCHNOP_bind_pirq: Bind a local event channel to a real IRQ (PIRQ <irq>).
+ * NOTES:
+ *  1. A physical IRQ may be bound to at most one event channel per domain.
+ *  2. Only a sufficiently-privileged domain may bind to a physical IRQ.
+ */
+struct evtchn_bind_pirq {
+    /* IN parameters. */
+    uint32_t pirq;
+#define BIND_PIRQ__WILL_SHARE 1
+    uint32_t flags; /* BIND_PIRQ__* */
+    /* OUT parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_bind_pirq evtchn_bind_pirq_t;
+
+/*
+ * EVTCHNOP_bind_ipi: Bind a local event channel to receive events.
+ * NOTES:
+ *  1. The allocated event channel is bound to the specified vcpu. The binding
+ *     may not be changed.
+ */
+struct evtchn_bind_ipi {
+    uint32_t vcpu;
+    /* OUT parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_bind_ipi evtchn_bind_ipi_t;
+
+/*
+ * EVTCHNOP_close: Close a local event channel <port>. If the channel is
+ * interdomain then the remote end is placed in the unbound state
+ * (EVTCHNSTAT_unbound), awaiting a new connection.
+ */
+struct evtchn_close {
+    /* IN parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_close evtchn_close_t;
+
+/*
+ * EVTCHNOP_send: Send an event to the remote end of the channel whose local
+ * endpoint is <port>.
+ */
+struct evtchn_send {
+    /* IN parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_send evtchn_send_t;
+
+/*
+ * EVTCHNOP_status: Get the current status of the communication channel which
+ * has an endpoint at <dom, port>.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may obtain the status of an event
+ *     channel for which <dom> is not DOMID_SELF.
+ */
+struct evtchn_status {
+    /* IN parameters */
+    domid_t  dom;
+    evtchn_port_t port;
+    /* OUT parameters */
+#define EVTCHNSTAT_closed       0  /* Channel is not in use.                 */
+#define EVTCHNSTAT_unbound      1  /* Channel is waiting interdom connection.*/
+#define EVTCHNSTAT_interdomain  2  /* Channel is connected to remote domain. */
+#define EVTCHNSTAT_pirq         3  /* Channel is bound to a phys IRQ line.   */
+#define EVTCHNSTAT_virq         4  /* Channel is bound to a virtual IRQ line */
+#define EVTCHNSTAT_ipi          5  /* Channel is bound to a virtual IPI line */
+    uint32_t status;
+    uint32_t vcpu;                 /* VCPU to which this channel is bound.   */
+    union {
+        struct {
+            domid_t dom;
+        } unbound;                 /* EVTCHNSTAT_unbound */
+        struct {
+            domid_t dom;
+            evtchn_port_t port;
+        } interdomain;             /* EVTCHNSTAT_interdomain */
+        uint32_t pirq;             /* EVTCHNSTAT_pirq        */
+        uint32_t virq;             /* EVTCHNSTAT_virq        */
+    } u;
+};
+typedef struct evtchn_status evtchn_status_t;
+
+/*
+ * EVTCHNOP_bind_vcpu: Specify which vcpu a channel should notify when an
+ * event is pending.
+ * NOTES:
+ *  1. IPI-bound channels always notify the vcpu specified at bind time.
+ *     This binding cannot be changed.
+ *  2. Per-VCPU VIRQ channels always notify the vcpu specified at bind time.
+ *     This binding cannot be changed.
+ *  3. All other channels notify vcpu0 by default. This default is set when
+ *     the channel is allocated (a port that is freed and subsequently reused
+ *     has its binding reset to vcpu0).
+ */
+struct evtchn_bind_vcpu {
+    /* IN parameters. */
+    evtchn_port_t port;
+    uint32_t vcpu;
+};
+typedef struct evtchn_bind_vcpu evtchn_bind_vcpu_t;
+
+/*
+ * EVTCHNOP_unmask: Unmask the specified local event-channel port and deliver
+ * a notification to the appropriate VCPU if an event is pending.
+ */
+struct evtchn_unmask {
+    /* IN parameters. */
+    evtchn_port_t port;
+};
+typedef struct evtchn_unmask evtchn_unmask_t;
+
+/*
+ * EVTCHNOP_reset: Close all event channels associated with specified domain.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify other than DOMID_SELF.
+ *  3. Destroys all control blocks and event array, resets event channel
+ *     operations to 2-level ABI if called with <dom> == DOMID_SELF and FIFO
+ *     ABI was used. Guests should not bind events during EVTCHNOP_reset call
+ *     as these events are likely to be lost.
+ */
+struct evtchn_reset {
+    /* IN parameters. */
+    domid_t dom;
+};
+typedef struct evtchn_reset evtchn_reset_t;
+
+/*
+ * EVTCHNOP_init_control: initialize the control block for the FIFO ABI.
+ *
+ * Note: any events that are currently pending will not be resent and
+ * will be lost.  Guests should call this before binding any event to
+ * avoid losing any events.
+ */
+struct evtchn_init_control {
+    /* IN parameters. */
+    uint64_t control_gfn;
+    uint32_t offset;
+    uint32_t vcpu;
+    /* OUT parameters. */
+    uint8_t link_bits;
+    uint8_t _pad[7];
+};
+typedef struct evtchn_init_control evtchn_init_control_t;
+
+/*
+ * EVTCHNOP_expand_array: add an additional page to the event array.
+ */
+struct evtchn_expand_array {
+    /* IN parameters. */
+    uint64_t array_gfn;
+};
+typedef struct evtchn_expand_array evtchn_expand_array_t;
+
+/*
+ * EVTCHNOP_set_priority: set the priority for an event channel.
+ */
+struct evtchn_set_priority {
+    /* IN parameters. */
+    evtchn_port_t port;
+    uint32_t priority;
+};
+typedef struct evtchn_set_priority evtchn_set_priority_t;
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_event_channel_op_compat(struct evtchn_op *op)
+ * `
+ * Superceded by new event_channel_op() hypercall since 0x00030202.
+ */
+struct evtchn_op {
+    uint32_t cmd; /* enum event_channel_op */
+    union {
+        evtchn_alloc_unbound_t    alloc_unbound;
+        evtchn_bind_interdomain_t bind_interdomain;
+        evtchn_bind_virq_t        bind_virq;
+        evtchn_bind_pirq_t        bind_pirq;
+        evtchn_bind_ipi_t         bind_ipi;
+        evtchn_close_t            close;
+        evtchn_send_t             send;
+        evtchn_status_t           status;
+        evtchn_bind_vcpu_t        bind_vcpu;
+        evtchn_unmask_t           unmask;
+    } u;
+};
+typedef struct evtchn_op evtchn_op_t;
+DEFINE_XEN_GUEST_HANDLE(evtchn_op_t);
+
+/*
+ * 2-level ABI
+ */
+
+#define EVTCHN_2L_NR_CHANNELS (sizeof(xen_ulong_t) * sizeof(xen_ulong_t) * 64)
+
+/*
+ * FIFO ABI
+ */
+
+/* Events may have priorities from 0 (highest) to 15 (lowest). */
+#define EVTCHN_FIFO_PRIORITY_MAX     0
+#define EVTCHN_FIFO_PRIORITY_DEFAULT 7
+#define EVTCHN_FIFO_PRIORITY_MIN     15
+
+#define EVTCHN_FIFO_MAX_QUEUES (EVTCHN_FIFO_PRIORITY_MIN + 1)
+
+typedef uint32_t event_word_t;
+
+#define EVTCHN_FIFO_PENDING 31
+#define EVTCHN_FIFO_MASKED  30
+#define EVTCHN_FIFO_LINKED  29
+#define EVTCHN_FIFO_BUSY    28
+
+#define EVTCHN_FIFO_LINK_BITS 17
+#define EVTCHN_FIFO_LINK_MASK ((1 << EVTCHN_FIFO_LINK_BITS) - 1)
+
+#define EVTCHN_FIFO_NR_CHANNELS (1 << EVTCHN_FIFO_LINK_BITS)
+
+struct evtchn_fifo_control_block {
+    uint32_t ready;
+    uint32_t _rsvd;
+    uint32_t head[EVTCHN_FIFO_MAX_QUEUES];
+};
+typedef struct evtchn_fifo_control_block evtchn_fifo_control_block_t;
+
+#endif /* __XEN_PUBLIC_EVENT_CHANNEL_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/features.h b/include/standard-headers/xen/features.h
new file mode 100644
index 0000000000..9ee2f760ef
--- /dev/null
+++ b/include/standard-headers/xen/features.h
@@ -0,0 +1,143 @@
+/******************************************************************************
+ * features.h
+ *
+ * Feature flags, reported by XENVER_get_features.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2006, Keir Fraser <keir@xensource.com>
+ */
+
+#ifndef __XEN_PUBLIC_FEATURES_H__
+#define __XEN_PUBLIC_FEATURES_H__
+
+/*
+ * `incontents 200 elfnotes_features XEN_ELFNOTE_FEATURES
+ *
+ * The list of all the features the guest supports. They are set by
+ * parsing the XEN_ELFNOTE_FEATURES and XEN_ELFNOTE_SUPPORTED_FEATURES
+ * string. The format is the  feature names (as given here without the
+ * "XENFEAT_" prefix) separated by '|' characters.
+ * If a feature is required for the kernel to function then the feature name
+ * must be preceded by a '!' character.
+ *
+ * Note that if XEN_ELFNOTE_SUPPORTED_FEATURES is used, then in the
+ * XENFEAT_dom0 MUST be set if the guest is to be booted as dom0,
+ */
+
+/*
+ * If set, the guest does not need to write-protect its pagetables, and can
+ * update them via direct writes.
+ */
+#define XENFEAT_writable_page_tables       0
+
+/*
+ * If set, the guest does not need to write-protect its segment descriptor
+ * tables, and can update them via direct writes.
+ */
+#define XENFEAT_writable_descriptor_tables 1
+
+/*
+ * If set, translation between the guest's 'pseudo-physical' address space
+ * and the host's machine address space are handled by the hypervisor. In this
+ * mode the guest does not need to perform phys-to/from-machine translations
+ * when performing page table operations.
+ */
+#define XENFEAT_auto_translated_physmap    2
+
+/* If set, the guest is running in supervisor mode (e.g., x86 ring 0). */
+#define XENFEAT_supervisor_mode_kernel     3
+
+/*
+ * If set, the guest does not need to allocate x86 PAE page directories
+ * below 4GB. This flag is usually implied by auto_translated_physmap.
+ */
+#define XENFEAT_pae_pgdir_above_4gb        4
+
+/* x86: Does this Xen host support the MMU_PT_UPDATE_PRESERVE_AD hypercall? */
+#define XENFEAT_mmu_pt_update_preserve_ad  5
+
+/* x86: Does this Xen host support the MMU_{CLEAR,COPY}_PAGE hypercall? */
+#define XENFEAT_highmem_assist             6
+
+/*
+ * If set, GNTTABOP_map_grant_ref honors flags to be placed into guest kernel
+ * available pte bits.
+ */
+#define XENFEAT_gnttab_map_avail_bits      7
+
+/* x86: Does this Xen host support the HVM callback vector type? */
+#define XENFEAT_hvm_callback_vector        8
+
+/* x86: pvclock algorithm is safe to use on HVM */
+#define XENFEAT_hvm_safe_pvclock           9
+
+/* x86: pirq can be used by HVM guests */
+#define XENFEAT_hvm_pirqs                 10
+
+/* operation as Dom0 is supported */
+#define XENFEAT_dom0                      11
+
+/* Xen also maps grant references at pfn = mfn.
+ * This feature flag is deprecated and should not be used.
+#define XENFEAT_grant_map_identity        12
+ */
+
+/* Guest can use XENMEMF_vnode to specify virtual node for memory op. */
+#define XENFEAT_memory_op_vnode_supported 13
+
+/* arm: Hypervisor supports ARM SMC calling convention. */
+#define XENFEAT_ARM_SMCCC_supported       14
+
+/*
+ * x86/PVH: If set, ACPI RSDP can be placed at any address. Otherwise RSDP
+ * must be located in lower 1MB, as required by ACPI Specification for IA-PC
+ * systems.
+ * This feature flag is only consulted if XEN_ELFNOTE_GUEST_OS contains
+ * the "linux" string.
+ */
+#define XENFEAT_linux_rsdp_unrestricted   15
+
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn. If a domain is direct-mapped,
+ * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
+ * is set.
+ *
+ * If neither flag is set (e.g. older Xen releases) the assumptions are:
+ * - not auto_translated domains (x86 only) are always direct-mapped
+ * - on x86, auto_translated domains are not direct-mapped
+ * - on ARM, Dom0 is direct-mapped, DomUs are not
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
+#define XENFEAT_NR_SUBMAPS 1
+
+#endif /* __XEN_PUBLIC_FEATURES_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/grant_table.h b/include/standard-headers/xen/grant_table.h
new file mode 100644
index 0000000000..7934d7b718
--- /dev/null
+++ b/include/standard-headers/xen/grant_table.h
@@ -0,0 +1,686 @@
+/******************************************************************************
+ * grant_table.h
+ *
+ * Interface for granting foreign access to page frames, and receiving
+ * page-ownership transfers.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004, K A Fraser
+ */
+
+#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
+#define __XEN_PUBLIC_GRANT_TABLE_H__
+
+#include "xen.h"
+
+/*
+ * `incontents 150 gnttab Grant Tables
+ *
+ * Xen's grant tables provide a generic mechanism to memory sharing
+ * between domains. This shared memory interface underpins the split
+ * device drivers for block and network IO.
+ *
+ * Each domain has its own grant table. This is a data structure that
+ * is shared with Xen; it allows the domain to tell Xen what kind of
+ * permissions other domains have on its pages. Entries in the grant
+ * table are identified by grant references. A grant reference is an
+ * integer, which indexes into the grant table. It acts as a
+ * capability which the grantee can use to perform operations on the
+ * granter's memory.
+ *
+ * This capability-based system allows shared-memory communications
+ * between unprivileged domains. A grant reference also encapsulates
+ * the details of a shared page, removing the need for a domain to
+ * know the real machine address of a page it is sharing. This makes
+ * it possible to share memory correctly with domains running in
+ * fully virtualised memory.
+ */
+
+/***********************************
+ * GRANT TABLE REPRESENTATION
+ */
+
+/* Some rough guidelines on accessing and updating grant-table entries
+ * in a concurrency-safe manner. For more information, Linux contains a
+ * reference implementation for guest OSes (drivers/xen/grant_table.c, see
+ * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
+ *
+ * NB. WMB is a no-op on current-generation x86 processors. However, a
+ *     compiler barrier will still be required.
+ *
+ * Introducing a valid entry into the grant table:
+ *  1. Write ent->domid.
+ *  2. Write ent->frame:
+ *      GTF_permit_access:   Frame to which access is permitted.
+ *      GTF_accept_transfer: Pseudo-phys frame slot being filled by new
+ *                           frame, or zero if none.
+ *  3. Write memory barrier (WMB).
+ *  4. Write ent->flags, inc. valid type.
+ *
+ * Invalidating an unused GTF_permit_access entry:
+ *  1. flags = ent->flags.
+ *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
+ *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
+ *  NB. No need for WMB as reuse of entry is control-dependent on success of
+ *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
+ *
+ * Invalidating an in-use GTF_permit_access entry:
+ *  This cannot be done directly. Request assistance from the domain controller
+ *  which can set a timeout on the use of a grant entry and take necessary
+ *  action. (NB. This is not yet implemented!).
+ *
+ * Invalidating an unused GTF_accept_transfer entry:
+ *  1. flags = ent->flags.
+ *  2. Observe that !(flags & GTF_transfer_committed). [*]
+ *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
+ *  NB. No need for WMB as reuse of entry is control-dependent on success of
+ *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
+ *  [*] If GTF_transfer_committed is set then the grant entry is 'committed'.
+ *      The guest must /not/ modify the grant entry until the address of the
+ *      transferred frame is written. It is safe for the guest to spin waiting
+ *      for this to occur (detect by observing GTF_transfer_completed in
+ *      ent->flags).
+ *
+ * Invalidating a committed GTF_accept_transfer entry:
+ *  1. Wait for (ent->flags & GTF_transfer_completed).
+ *
+ * Changing a GTF_permit_access from writable to read-only:
+ *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
+ *
+ * Changing a GTF_permit_access from read-only to writable:
+ *  Use SMP-safe bit-setting instruction.
+ */
+
+/*
+ * Reference to a grant entry in a specified domain's grant table.
+ */
+typedef uint32_t grant_ref_t;
+
+/*
+ * A grant table comprises a packed array of grant entries in one or more
+ * page frames shared between Xen and a guest.
+ * [XEN]: This field is written by Xen and read by the sharing guest.
+ * [GST]: This field is written by the guest and read by Xen.
+ */
+
+/*
+ * Version 1 of the grant table entry structure is maintained largely for
+ * backwards compatibility.  New guests are recommended to support using
+ * version 2 to overcome version 1 limitations, but to default to version 1.
+ */
+#if __XEN_INTERFACE_VERSION__ < 0x0003020a
+#define grant_entry_v1 grant_entry
+#define grant_entry_v1_t grant_entry_t
+#endif
+struct grant_entry_v1 {
+    /* GTF_xxx: various type and flag information.  [XEN,GST] */
+    uint16_t flags;
+    /* The domain being granted foreign privileges. [GST] */
+    domid_t  domid;
+    /*
+     * GTF_permit_access: GFN that @domid is allowed to map and access. [GST]
+     * GTF_accept_transfer: GFN that @domid is allowed to transfer into. [GST]
+     * GTF_transfer_completed: MFN whose ownership transferred by @domid
+     *                         (non-translated guests only). [XEN]
+     */
+    uint32_t frame;
+};
+typedef struct grant_entry_v1 grant_entry_v1_t;
+
+/* The first few grant table entries will be preserved across grant table
+ * version changes and may be pre-populated at domain creation by tools.
+ */
+#define GNTTAB_NR_RESERVED_ENTRIES     8
+#define GNTTAB_RESERVED_CONSOLE        0
+#define GNTTAB_RESERVED_XENSTORE       1
+
+/*
+ * Type of grant entry.
+ *  GTF_invalid: This grant entry grants no privileges.
+ *  GTF_permit_access: Allow @domid to map/access @frame.
+ *  GTF_accept_transfer: Allow @domid to transfer ownership of one page frame
+ *                       to this guest. Xen writes the page number to @frame.
+ *  GTF_transitive: Allow @domid to transitively access a subrange of
+ *                  @trans_grant in @trans_domid.  No mappings are allowed.
+ */
+#define GTF_invalid         (0U<<0)
+#define GTF_permit_access   (1U<<0)
+#define GTF_accept_transfer (2U<<0)
+#define GTF_transitive      (3U<<0)
+#define GTF_type_mask       (3U<<0)
+
+/*
+ * Subflags for GTF_permit_access and GTF_transitive.
+ *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
+ *  GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
+ *  GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
+ * Further subflags for GTF_permit_access only.
+ *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags to be used for
+ *                             mappings of the grant [GST]
+ *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
+ *                will only be allowed to copy from the grant, and not
+ *                map it. [GST]
+ */
+#define _GTF_readonly       (2)
+#define GTF_readonly        (1U<<_GTF_readonly)
+#define _GTF_reading        (3)
+#define GTF_reading         (1U<<_GTF_reading)
+#define _GTF_writing        (4)
+#define GTF_writing         (1U<<_GTF_writing)
+#define _GTF_PWT            (5)
+#define GTF_PWT             (1U<<_GTF_PWT)
+#define _GTF_PCD            (6)
+#define GTF_PCD             (1U<<_GTF_PCD)
+#define _GTF_PAT            (7)
+#define GTF_PAT             (1U<<_GTF_PAT)
+#define _GTF_sub_page       (8)
+#define GTF_sub_page        (1U<<_GTF_sub_page)
+
+/*
+ * Subflags for GTF_accept_transfer:
+ *  GTF_transfer_committed: Xen sets this flag to indicate that it is committed
+ *      to transferring ownership of a page frame. When a guest sees this flag
+ *      it must /not/ modify the grant entry until GTF_transfer_completed is
+ *      set by Xen.
+ *  GTF_transfer_completed: It is safe for the guest to spin-wait on this flag
+ *      after reading GTF_transfer_committed. Xen will always write the frame
+ *      address, followed by ORing this flag, in a timely manner.
+ */
+#define _GTF_transfer_committed (2)
+#define GTF_transfer_committed  (1U<<_GTF_transfer_committed)
+#define _GTF_transfer_completed (3)
+#define GTF_transfer_completed  (1U<<_GTF_transfer_completed)
+
+/*
+ * Version 2 grant table entries.  These fulfil the same role as
+ * version 1 entries, but can represent more complicated operations.
+ * Any given domain will have either a version 1 or a version 2 table,
+ * and every entry in the table will be the same version.
+ *
+ * The interface by which domains use grant references does not depend
+ * on the grant table version in use by the other domain.
+ */
+#if __XEN_INTERFACE_VERSION__ >= 0x0003020a
+/*
+ * Version 1 and version 2 grant entries share a common prefix.  The
+ * fields of the prefix are documented as part of struct
+ * grant_entry_v1.
+ */
+struct grant_entry_header {
+    uint16_t flags;
+    domid_t  domid;
+};
+typedef struct grant_entry_header grant_entry_header_t;
+
+/*
+ * Version 2 of the grant entry structure.
+ */
+union grant_entry_v2 {
+    grant_entry_header_t hdr;
+
+    /*
+     * This member is used for V1-style full page grants, where either:
+     *
+     * -- hdr.type is GTF_accept_transfer, or
+     * -- hdr.type is GTF_permit_access and GTF_sub_page is not set.
+     *
+     * In that case, the frame field has the same semantics as the
+     * field of the same name in the V1 entry structure.
+     */
+    struct {
+        grant_entry_header_t hdr;
+        uint32_t pad0;
+        uint64_t frame;
+    } full_page;
+
+    /*
+     * If the grant type is GTF_grant_access and GTF_sub_page is set,
+     * @domid is allowed to access bytes [@page_off,@page_off+@length)
+     * in frame @frame.
+     */
+    struct {
+        grant_entry_header_t hdr;
+        uint16_t page_off;
+        uint16_t length;
+        uint64_t frame;
+    } sub_page;
+
+    /*
+     * If the grant is GTF_transitive, @domid is allowed to use the
+     * grant @gref in domain @trans_domid, as if it was the local
+     * domain.  Obviously, the transitive access must be compatible
+     * with the original grant.
+     *
+     * The current version of Xen does not allow transitive grants
+     * to be mapped.
+     */
+    struct {
+        grant_entry_header_t hdr;
+        domid_t trans_domid;
+        uint16_t pad0;
+        grant_ref_t gref;
+    } transitive;
+
+    uint32_t __spacer[4]; /* Pad to a power of two */
+};
+typedef union grant_entry_v2 grant_entry_v2_t;
+
+typedef uint16_t grant_status_t;
+
+#endif /* __XEN_INTERFACE_VERSION__ */
+
+/***********************************
+ * GRANT TABLE QUERIES AND USES
+ */
+
+/* ` enum neg_errnoval
+ * ` HYPERVISOR_grant_table_op(enum grant_table_op cmd,
+ * `                           void *args,
+ * `                           unsigned int count)
+ * `
+ *
+ * @args points to an array of a per-command data structure. The array
+ * has @count members
+ */
+
+/* ` enum grant_table_op { // GNTTABOP_* => struct gnttab_* */
+#define GNTTABOP_map_grant_ref        0
+#define GNTTABOP_unmap_grant_ref      1
+#define GNTTABOP_setup_table          2
+#define GNTTABOP_dump_table           3
+#define GNTTABOP_transfer             4
+#define GNTTABOP_copy                 5
+#define GNTTABOP_query_size           6
+#define GNTTABOP_unmap_and_replace    7
+#if __XEN_INTERFACE_VERSION__ >= 0x0003020a
+#define GNTTABOP_set_version          8
+#define GNTTABOP_get_status_frames    9
+#define GNTTABOP_get_version          10
+#define GNTTABOP_swap_grant_ref	      11
+#define GNTTABOP_cache_flush	      12
+#endif /* __XEN_INTERFACE_VERSION__ */
+/* ` } */
+
+/*
+ * Handle to track a mapping created via a grant reference.
+ */
+typedef uint32_t grant_handle_t;
+
+/*
+ * GNTTABOP_map_grant_ref: Map the grant entry (<dom>,<ref>) for access
+ * by devices and/or host CPUs. If successful, <handle> is a tracking number
+ * that must be presented later to destroy the mapping(s). On error, <status>
+ * is a negative status code.
+ * NOTES:
+ *  1. If GNTMAP_device_map is specified then <dev_bus_addr> is the address
+ *     via which I/O devices may access the granted frame.
+ *  2. If GNTMAP_host_map is specified then a mapping will be added at
+ *     either a host virtual address in the current address space, or at
+ *     a PTE at the specified machine address.  The type of mapping to
+ *     perform is selected through the GNTMAP_contains_pte flag, and the
+ *     address is specified in <host_addr>.
+ *  3. Mappings should only be destroyed via GNTTABOP_unmap_grant_ref. If a
+ *     host mapping is destroyed by other means then it is *NOT* guaranteed
+ *     to be accounted to the correct grant reference!
+ */
+struct gnttab_map_grant_ref {
+    /* IN parameters. */
+    uint64_t host_addr;
+    uint32_t flags;               /* GNTMAP_* */
+    grant_ref_t ref;
+    domid_t  dom;
+    /* OUT parameters. */
+    int16_t  status;              /* => enum grant_status */
+    grant_handle_t handle;
+    uint64_t dev_bus_addr;
+};
+typedef struct gnttab_map_grant_ref gnttab_map_grant_ref_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_map_grant_ref_t);
+
+/*
+ * GNTTABOP_unmap_grant_ref: Destroy one or more grant-reference mappings
+ * tracked by <handle>. If <host_addr> or <dev_bus_addr> is zero, that
+ * field is ignored. If non-zero, they must refer to a device/host mapping
+ * that is tracked by <handle>
+ * NOTES:
+ *  1. The call may fail in an undefined manner if either mapping is not
+ *     tracked by <handle>.
+ *  3. After executing a batch of unmaps, it is guaranteed that no stale
+ *     mappings will remain in the device or host TLBs.
+ */
+struct gnttab_unmap_grant_ref {
+    /* IN parameters. */
+    uint64_t host_addr;
+    uint64_t dev_bus_addr;
+    grant_handle_t handle;
+    /* OUT parameters. */
+    int16_t  status;              /* => enum grant_status */
+};
+typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
+
+/*
+ * GNTTABOP_setup_table: Set up a grant table for <dom> comprising at least
+ * <nr_frames> pages. The frame addresses are written to the <frame_list>.
+ * Only <nr_frames> addresses are written, even if the table is larger.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ *  3. Xen may not support more than a single grant-table page per domain.
+ */
+struct gnttab_setup_table {
+    /* IN parameters. */
+    domid_t  dom;
+    uint32_t nr_frames;
+    /* OUT parameters. */
+    int16_t  status;              /* => enum grant_status */
+#if __XEN_INTERFACE_VERSION__ < 0x00040300
+    XEN_GUEST_HANDLE(ulong) frame_list;
+#else
+    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
+#endif
+};
+typedef struct gnttab_setup_table gnttab_setup_table_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_t);
+
+/*
+ * GNTTABOP_dump_table: Dump the contents of the grant table to the
+ * xen console. Debugging use only.
+ */
+struct gnttab_dump_table {
+    /* IN parameters. */
+    domid_t dom;
+    /* OUT parameters. */
+    int16_t status;               /* => enum grant_status */
+};
+typedef struct gnttab_dump_table gnttab_dump_table_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
+
+/*
+ * GNTTABOP_transfer: Transfer <frame> to a foreign domain. The foreign domain
+ * has previously registered its interest in the transfer via <domid, ref>.
+ *
+ * Note that, even if the transfer fails, the specified page no longer belongs
+ * to the calling domain *unless* the error is GNTST_bad_page.
+ *
+ * Note further that only PV guests can use this operation.
+ */
+struct gnttab_transfer {
+    /* IN parameters. */
+    xen_pfn_t     mfn;
+    domid_t       domid;
+    grant_ref_t   ref;
+    /* OUT parameters. */
+    int16_t       status;
+};
+typedef struct gnttab_transfer gnttab_transfer_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
+
+
+/*
+ * GNTTABOP_copy: Hypervisor based copy
+ * source and destinations can be eithers MFNs or, for foreign domains,
+ * grant references. the foreign domain has to grant read/write access
+ * in its grant table.
+ *
+ * The flags specify what type source and destinations are (either MFN
+ * or grant reference).
+ *
+ * Note that this can also be used to copy data between two domains
+ * via a third party if the source and destination domains had previously
+ * grant appropriate access to their pages to the third party.
+ *
+ * source_offset specifies an offset in the source frame, dest_offset
+ * the offset in the target frame and  len specifies the number of
+ * bytes to be copied.
+ */
+
+#define _GNTCOPY_source_gref      (0)
+#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
+#define _GNTCOPY_dest_gref        (1)
+#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
+
+struct gnttab_copy {
+    /* IN parameters. */
+    struct gnttab_copy_ptr {
+        union {
+            grant_ref_t ref;
+            xen_pfn_t   gmfn;
+        } u;
+        domid_t  domid;
+        uint16_t offset;
+    } source, dest;
+    uint16_t      len;
+    uint16_t      flags;          /* GNTCOPY_* */
+    /* OUT parameters. */
+    int16_t       status;
+};
+typedef struct gnttab_copy  gnttab_copy_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
+
+/*
+ * GNTTABOP_query_size: Query the current and maximum sizes of the shared
+ * grant table.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ */
+struct gnttab_query_size {
+    /* IN parameters. */
+    domid_t  dom;
+    /* OUT parameters. */
+    uint32_t nr_frames;
+    uint32_t max_nr_frames;
+    int16_t  status;              /* => enum grant_status */
+};
+typedef struct gnttab_query_size gnttab_query_size_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
+
+/*
+ * GNTTABOP_unmap_and_replace: Destroy one or more grant-reference mappings
+ * tracked by <handle> but atomically replace the page table entry with one
+ * pointing to the machine address under <new_addr>.  <new_addr> will be
+ * redirected to the null entry.
+ * NOTES:
+ *  1. The call may fail in an undefined manner if either mapping is not
+ *     tracked by <handle>.
+ *  2. After executing a batch of unmaps, it is guaranteed that no stale
+ *     mappings will remain in the device or host TLBs.
+ */
+struct gnttab_unmap_and_replace {
+    /* IN parameters. */
+    uint64_t host_addr;
+    uint64_t new_addr;
+    grant_handle_t handle;
+    /* OUT parameters. */
+    int16_t  status;              /* => enum grant_status */
+};
+typedef struct gnttab_unmap_and_replace gnttab_unmap_and_replace_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_and_replace_t);
+
+#if __XEN_INTERFACE_VERSION__ >= 0x0003020a
+/*
+ * GNTTABOP_set_version: Request a particular version of the grant
+ * table shared table structure.  This operation may be used to toggle
+ * between different versions, but must be performed while no grants
+ * are active.  The only defined versions are 1 and 2.
+ */
+struct gnttab_set_version {
+    /* IN/OUT parameters */
+    uint32_t version;
+};
+typedef struct gnttab_set_version gnttab_set_version_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_set_version_t);
+
+
+/*
+ * GNTTABOP_get_status_frames: Get the list of frames used to store grant
+ * status for <dom>. In grant format version 2, the status is separated
+ * from the other shared grant fields to allow more efficient synchronization
+ * using barriers instead of atomic cmpexch operations.
+ * <nr_frames> specify the size of vector <frame_list>.
+ * The frame addresses are returned in the <frame_list>.
+ * Only <nr_frames> addresses are returned, even if the table is larger.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ */
+struct gnttab_get_status_frames {
+    /* IN parameters. */
+    uint32_t nr_frames;
+    domid_t  dom;
+    /* OUT parameters. */
+    int16_t  status;              /* => enum grant_status */
+    XEN_GUEST_HANDLE(uint64_t) frame_list;
+};
+typedef struct gnttab_get_status_frames gnttab_get_status_frames_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_get_status_frames_t);
+
+/*
+ * GNTTABOP_get_version: Get the grant table version which is in
+ * effect for domain <dom>.
+ */
+struct gnttab_get_version {
+    /* IN parameters */
+    domid_t dom;
+    uint16_t pad;
+    /* OUT parameters */
+    uint32_t version;
+};
+typedef struct gnttab_get_version gnttab_get_version_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_get_version_t);
+
+/*
+ * GNTTABOP_swap_grant_ref: Swap the contents of two grant entries.
+ */
+struct gnttab_swap_grant_ref {
+    /* IN parameters */
+    grant_ref_t ref_a;
+    grant_ref_t ref_b;
+    /* OUT parameters */
+    int16_t status;             /* => enum grant_status */
+};
+typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
+
+/*
+ * Issue one or more cache maintenance operations on a portion of a
+ * page granted to the calling domain by a foreign domain.
+ */
+struct gnttab_cache_flush {
+    union {
+        uint64_t dev_bus_addr;
+        grant_ref_t ref;
+    } a;
+    uint16_t offset; /* offset from start of grant */
+    uint16_t length; /* size within the grant */
+#define GNTTAB_CACHE_CLEAN          (1u<<0)
+#define GNTTAB_CACHE_INVAL          (1u<<1)
+#define GNTTAB_CACHE_SOURCE_GREF    (1u<<31)
+    uint32_t op;
+};
+typedef struct gnttab_cache_flush gnttab_cache_flush_t;
+DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
+
+#endif /* __XEN_INTERFACE_VERSION__ */
+
+/*
+ * Bitfield values for gnttab_map_grant_ref.flags.
+ */
+ /* Map the grant entry for access by I/O devices. */
+#define _GNTMAP_device_map      (0)
+#define GNTMAP_device_map       (1<<_GNTMAP_device_map)
+ /* Map the grant entry for access by host CPUs. */
+#define _GNTMAP_host_map        (1)
+#define GNTMAP_host_map         (1<<_GNTMAP_host_map)
+ /* Accesses to the granted frame will be restricted to read-only access. */
+#define _GNTMAP_readonly        (2)
+#define GNTMAP_readonly         (1<<_GNTMAP_readonly)
+ /*
+  * GNTMAP_host_map subflag:
+  *  0 => The host mapping is usable only by the guest OS.
+  *  1 => The host mapping is usable by guest OS + current application.
+  */
+#define _GNTMAP_application_map (3)
+#define GNTMAP_application_map  (1<<_GNTMAP_application_map)
+
+ /*
+  * GNTMAP_contains_pte subflag:
+  *  0 => This map request contains a host virtual address.
+  *  1 => This map request contains the machine addess of the PTE to update.
+  */
+#define _GNTMAP_contains_pte    (4)
+#define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
+
+/*
+ * Bits to be placed in guest kernel available PTE bits (architecture
+ * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).
+ */
+#define _GNTMAP_guest_avail0    (16)
+#define GNTMAP_guest_avail_mask ((uint32_t)~0 << _GNTMAP_guest_avail0)
+
+/*
+ * Values for error status returns. All errors are -ve.
+ */
+/* ` enum grant_status { */
+#define GNTST_okay             (0)  /* Normal return.                        */
+#define GNTST_general_error    (-1) /* General undefined error.              */
+#define GNTST_bad_domain       (-2) /* Unrecognsed domain id.                */
+#define GNTST_bad_gntref       (-3) /* Unrecognised or inappropriate gntref. */
+#define GNTST_bad_handle       (-4) /* Unrecognised or inappropriate handle. */
+#define GNTST_bad_virt_addr    (-5) /* Inappropriate virtual address to map. */
+#define GNTST_bad_dev_addr     (-6) /* Inappropriate device address to unmap.*/
+#define GNTST_no_device_space  (-7) /* Out of space in I/O MMU.              */
+#define GNTST_permission_denied (-8) /* Not enough privilege for operation.  */
+#define GNTST_bad_page         (-9) /* Specified page was invalid for op.    */
+#define GNTST_bad_copy_arg    (-10) /* copy arguments cross page boundary.   */
+#define GNTST_address_too_big (-11) /* transfer page address too large.      */
+#define GNTST_eagain          (-12) /* Operation not done; try again.        */
+#define GNTST_no_space        (-13) /* Out of space (handles etc).           */
+/* ` } */
+
+#define GNTTABOP_error_msgs {                   \
+    "okay",                                     \
+    "undefined error",                          \
+    "unrecognised domain id",                   \
+    "invalid grant reference",                  \
+    "invalid mapping handle",                   \
+    "invalid virtual address",                  \
+    "invalid device address",                   \
+    "no spare translation slot in the I/O MMU", \
+    "permission denied",                        \
+    "bad page",                                 \
+    "copy arguments cross page boundary",       \
+    "page address size too large",              \
+    "operation not done; try again",            \
+    "out of space",                             \
+}
+
+#endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/hvm/hvm_op.h b/include/standard-headers/xen/hvm/hvm_op.h
new file mode 100644
index 0000000000..870ec52060
--- /dev/null
+++ b/include/standard-headers/xen/hvm/hvm_op.h
@@ -0,0 +1,395 @@
+/*
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2007, Keir Fraser
+ */
+
+#ifndef __XEN_PUBLIC_HVM_HVM_OP_H__
+#define __XEN_PUBLIC_HVM_HVM_OP_H__
+
+#include "../xen.h"
+#include "../trace.h"
+#include "../event_channel.h"
+
+/* Get/set subcommands: extra argument == pointer to xen_hvm_param struct. */
+#define HVMOP_set_param           0
+#define HVMOP_get_param           1
+struct xen_hvm_param {
+    domid_t  domid;    /* IN */
+    uint16_t pad;
+    uint32_t index;    /* IN */
+    uint64_t value;    /* IN/OUT */
+};
+typedef struct xen_hvm_param xen_hvm_param_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_param_t);
+
+struct xen_hvm_altp2m_suppress_ve {
+    uint16_t view;
+    uint8_t suppress_ve; /* Boolean type. */
+    uint8_t pad1;
+    uint32_t pad2;
+    uint64_t gfn;
+};
+
+struct xen_hvm_altp2m_suppress_ve_multi {
+    uint16_t view;
+    uint8_t suppress_ve; /* Boolean type. */
+    uint8_t pad1;
+    int32_t first_error; /* Should be set to 0. */
+    uint64_t first_gfn; /* Value may be updated. */
+    uint64_t last_gfn;
+    uint64_t first_error_gfn; /* Gfn of the first error. */
+};
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040900
+
+/* Set the logical level of one of a domain's PCI INTx wires. */
+#define HVMOP_set_pci_intx_level  2
+struct xen_hvm_set_pci_intx_level {
+    /* Domain to be updated. */
+    domid_t  domid;
+    /* PCI INTx identification in PCI topology (domain:bus:device:intx). */
+    uint8_t  domain, bus, device, intx;
+    /* Assertion level (0 = unasserted, 1 = asserted). */
+    uint8_t  level;
+};
+typedef struct xen_hvm_set_pci_intx_level xen_hvm_set_pci_intx_level_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_set_pci_intx_level_t);
+
+/* Set the logical level of one of a domain's ISA IRQ wires. */
+#define HVMOP_set_isa_irq_level   3
+struct xen_hvm_set_isa_irq_level {
+    /* Domain to be updated. */
+    domid_t  domid;
+    /* ISA device identification, by ISA IRQ (0-15). */
+    uint8_t  isa_irq;
+    /* Assertion level (0 = unasserted, 1 = asserted). */
+    uint8_t  level;
+};
+typedef struct xen_hvm_set_isa_irq_level xen_hvm_set_isa_irq_level_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_set_isa_irq_level_t);
+
+#define HVMOP_set_pci_link_route  4
+struct xen_hvm_set_pci_link_route {
+    /* Domain to be updated. */
+    domid_t  domid;
+    /* PCI link identifier (0-3). */
+    uint8_t  link;
+    /* ISA IRQ (1-15), or 0 (disable link). */
+    uint8_t  isa_irq;
+};
+typedef struct xen_hvm_set_pci_link_route xen_hvm_set_pci_link_route_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_set_pci_link_route_t);
+
+#endif /* __XEN_INTERFACE_VERSION__ < 0x00040900 */
+
+/* Flushes all VCPU TLBs: @arg must be NULL. */
+#define HVMOP_flush_tlbs          5
+
+/*
+ * hvmmem_type_t should not be defined when generating the corresponding
+ * compat header. This will ensure that the improperly named HVMMEM_(*)
+ * values are defined only once.
+ */
+#ifndef XEN_GENERATING_COMPAT_HEADERS
+
+typedef enum {
+    HVMMEM_ram_rw,             /* Normal read/write guest RAM */
+    HVMMEM_ram_ro,             /* Read-only; writes are discarded */
+    HVMMEM_mmio_dm,            /* Reads and write go to the device model */
+#if __XEN_INTERFACE_VERSION__ < 0x00040700
+    HVMMEM_mmio_write_dm,      /* Read-only; writes go to the device model */
+#else
+    HVMMEM_unused,             /* Placeholder; setting memory to this type
+                                  will fail for code after 4.7.0 */
+#endif
+    HVMMEM_ioreq_server        /* Memory type claimed by an ioreq server; type
+                                  changes to this value are only allowed after
+                                  an ioreq server has claimed its ownership.
+                                  Only pages with HVMMEM_ram_rw are allowed to
+                                  change to this type; conversely, pages with
+                                  this type are only allowed to be changed back
+                                  to HVMMEM_ram_rw. */
+} hvmmem_type_t;
+
+#endif /* XEN_GENERATING_COMPAT_HEADERS */
+
+/* Hint from PV drivers for pagetable destruction. */
+#define HVMOP_pagetable_dying        9
+struct xen_hvm_pagetable_dying {
+    /* Domain with a pagetable about to be destroyed. */
+    domid_t  domid;
+    uint16_t pad[3]; /* align next field on 8-byte boundary */
+    /* guest physical address of the toplevel pagetable dying */
+    uint64_t gpa;
+};
+typedef struct xen_hvm_pagetable_dying xen_hvm_pagetable_dying_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_pagetable_dying_t);
+
+/* Get the current Xen time, in nanoseconds since system boot. */
+#define HVMOP_get_time              10
+struct xen_hvm_get_time {
+    uint64_t now;      /* OUT */
+};
+typedef struct xen_hvm_get_time xen_hvm_get_time_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_time_t);
+
+#define HVMOP_xentrace              11
+struct xen_hvm_xentrace {
+    uint16_t event, extra_bytes;
+    uint8_t extra[TRACE_EXTRA_MAX * sizeof(uint32_t)];
+};
+typedef struct xen_hvm_xentrace xen_hvm_xentrace_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_xentrace_t);
+
+/* Following tools-only interfaces may change in future. */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+/* Deprecated by XENMEM_access_op_set_access */
+#define HVMOP_set_mem_access        12
+
+/* Deprecated by XENMEM_access_op_get_access */
+#define HVMOP_get_mem_access        13
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+#define HVMOP_get_mem_type    15
+/* Return hvmmem_type_t for the specified pfn. */
+struct xen_hvm_get_mem_type {
+    /* Domain to be queried. */
+    domid_t domid;
+    /* OUT variable. */
+    uint16_t mem_type;
+    uint16_t pad[2]; /* align next field on 8-byte boundary */
+    /* IN variable. */
+    uint64_t pfn;
+};
+typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
+
+/* Following tools-only interfaces may change in future. */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+/*
+ * Definitions relating to DMOP_create_ioreq_server. (Defined here for
+ * backwards compatibility).
+ */
+
+#define HVM_IOREQSRV_BUFIOREQ_OFF    0
+#define HVM_IOREQSRV_BUFIOREQ_LEGACY 1
+/*
+ * Use this when read_pointer gets updated atomically and
+ * the pointer pair gets read atomically:
+ */
+#define HVM_IOREQSRV_BUFIOREQ_ATOMIC 2
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+#if defined(__i386__) || defined(__x86_64__)
+
+/*
+ * HVMOP_set_evtchn_upcall_vector: Set a <vector> that should be used for event
+ *                                 channel upcalls on the specified <vcpu>. If set,
+ *                                 this vector will be used in preference to the
+ *                                 domain global callback via (see
+ *                                 HVM_PARAM_CALLBACK_IRQ).
+ */
+#define HVMOP_set_evtchn_upcall_vector 23
+struct xen_hvm_evtchn_upcall_vector {
+    uint32_t vcpu;
+    uint8_t vector;
+};
+typedef struct xen_hvm_evtchn_upcall_vector xen_hvm_evtchn_upcall_vector_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_evtchn_upcall_vector_t);
+
+#endif /* defined(__i386__) || defined(__x86_64__) */
+
+#define HVMOP_guest_request_vm_event 24
+
+/* HVMOP_altp2m: perform altp2m state operations */
+#define HVMOP_altp2m 25
+
+#define HVMOP_ALTP2M_INTERFACE_VERSION 0x00000001
+
+struct xen_hvm_altp2m_domain_state {
+    /* IN or OUT variable on/off */
+    uint8_t state;
+};
+typedef struct xen_hvm_altp2m_domain_state xen_hvm_altp2m_domain_state_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_domain_state_t);
+
+struct xen_hvm_altp2m_vcpu_enable_notify {
+    uint32_t vcpu_id;
+    uint32_t pad;
+    /* #VE info area gfn */
+    uint64_t gfn;
+};
+typedef struct xen_hvm_altp2m_vcpu_enable_notify xen_hvm_altp2m_vcpu_enable_notify_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_vcpu_enable_notify_t);
+
+struct xen_hvm_altp2m_vcpu_disable_notify {
+    uint32_t vcpu_id;
+};
+typedef struct xen_hvm_altp2m_vcpu_disable_notify xen_hvm_altp2m_vcpu_disable_notify_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_vcpu_disable_notify_t);
+
+struct xen_hvm_altp2m_view {
+    /* IN/OUT variable */
+    uint16_t view;
+    uint16_t hvmmem_default_access; /* xenmem_access_t */
+};
+typedef struct xen_hvm_altp2m_view xen_hvm_altp2m_view_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_view_t);
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040a00
+struct xen_hvm_altp2m_set_mem_access {
+    /* view */
+    uint16_t view;
+    /* Memory type */
+    uint16_t access; /* xenmem_access_t */
+    uint32_t pad;
+    /* gfn */
+    uint64_t gfn;
+};
+typedef struct xen_hvm_altp2m_set_mem_access xen_hvm_altp2m_set_mem_access_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_set_mem_access_t);
+#endif /* __XEN_INTERFACE_VERSION__ < 0x00040a00 */
+
+struct xen_hvm_altp2m_mem_access {
+    /* view */
+    uint16_t view;
+    /* Memory type */
+    uint16_t access; /* xenmem_access_t */
+    uint32_t pad;
+    /* gfn */
+    uint64_t gfn;
+};
+typedef struct xen_hvm_altp2m_mem_access xen_hvm_altp2m_mem_access_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_mem_access_t);
+
+struct xen_hvm_altp2m_set_mem_access_multi {
+    /* view */
+    uint16_t view;
+    uint16_t pad;
+    /* Number of pages */
+    uint32_t nr;
+    /*
+     * Used for continuation purposes.
+     * Must be set to zero upon initial invocation.
+     */
+    uint64_t opaque;
+    /* List of pfns to set access for */
+    XEN_GUEST_HANDLE(const_uint64) pfn_list;
+    /* Corresponding list of access settings for pfn_list */
+    XEN_GUEST_HANDLE(const_uint8) access_list;
+};
+
+struct xen_hvm_altp2m_change_gfn {
+    /* view */
+    uint16_t view;
+    uint16_t pad1;
+    uint32_t pad2;
+    /* old gfn */
+    uint64_t old_gfn;
+    /* new gfn, INVALID_GFN (~0UL) means revert */
+    uint64_t new_gfn;
+};
+typedef struct xen_hvm_altp2m_change_gfn xen_hvm_altp2m_change_gfn_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_change_gfn_t);
+
+struct xen_hvm_altp2m_get_vcpu_p2m_idx {
+    uint32_t vcpu_id;
+    uint16_t altp2m_idx;
+};
+
+struct xen_hvm_altp2m_set_visibility {
+    uint16_t altp2m_idx;
+    uint8_t visible;
+    uint8_t pad;
+};
+
+struct xen_hvm_altp2m_op {
+    uint32_t version;   /* HVMOP_ALTP2M_INTERFACE_VERSION */
+    uint32_t cmd;
+/* Get/set the altp2m state for a domain */
+#define HVMOP_altp2m_get_domain_state     1
+#define HVMOP_altp2m_set_domain_state     2
+/* Set a given VCPU to receive altp2m event notifications */
+#define HVMOP_altp2m_vcpu_enable_notify   3
+/* Create a new view */
+#define HVMOP_altp2m_create_p2m           4
+/* Destroy a view */
+#define HVMOP_altp2m_destroy_p2m          5
+/* Switch view for an entire domain */
+#define HVMOP_altp2m_switch_p2m           6
+/* Notify that a page of memory is to have specific access types */
+#define HVMOP_altp2m_set_mem_access       7
+/* Change a p2m entry to have a different gfn->mfn mapping */
+#define HVMOP_altp2m_change_gfn           8
+/* Set access for an array of pages */
+#define HVMOP_altp2m_set_mem_access_multi 9
+/* Set the "Suppress #VE" bit on a page */
+#define HVMOP_altp2m_set_suppress_ve      10
+/* Get the "Suppress #VE" bit of a page */
+#define HVMOP_altp2m_get_suppress_ve      11
+/* Get the access of a page of memory from a certain view */
+#define HVMOP_altp2m_get_mem_access       12
+/* Disable altp2m event notifications for a given VCPU */
+#define HVMOP_altp2m_vcpu_disable_notify  13
+/* Get the active vcpu p2m index */
+#define HVMOP_altp2m_get_p2m_idx          14
+/* Set the "Supress #VE" bit for a range of pages */
+#define HVMOP_altp2m_set_suppress_ve_multi 15
+/* Set visibility for a given altp2m view */
+#define HVMOP_altp2m_set_visibility       16
+    domid_t domain;
+    uint16_t pad1;
+    uint32_t pad2;
+    union {
+        struct xen_hvm_altp2m_domain_state         domain_state;
+        struct xen_hvm_altp2m_vcpu_enable_notify   enable_notify;
+        struct xen_hvm_altp2m_view                 view;
+#if __XEN_INTERFACE_VERSION__ < 0x00040a00
+        struct xen_hvm_altp2m_set_mem_access       set_mem_access;
+#endif /* __XEN_INTERFACE_VERSION__ < 0x00040a00 */
+        struct xen_hvm_altp2m_mem_access           mem_access;
+        struct xen_hvm_altp2m_change_gfn           change_gfn;
+        struct xen_hvm_altp2m_set_mem_access_multi set_mem_access_multi;
+        struct xen_hvm_altp2m_suppress_ve          suppress_ve;
+        struct xen_hvm_altp2m_suppress_ve_multi    suppress_ve_multi;
+        struct xen_hvm_altp2m_vcpu_disable_notify  disable_notify;
+        struct xen_hvm_altp2m_get_vcpu_p2m_idx     get_vcpu_p2m_idx;
+        struct xen_hvm_altp2m_set_visibility       set_visibility;
+        uint8_t pad[64];
+    } u;
+};
+typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
+
+#endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/hvm/params.h b/include/standard-headers/xen/hvm/params.h
new file mode 100644
index 0000000000..c9d6e70d7b
--- /dev/null
+++ b/include/standard-headers/xen/hvm/params.h
@@ -0,0 +1,318 @@
+/*
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2007, Keir Fraser
+ */
+
+#ifndef __XEN_PUBLIC_HVM_PARAMS_H__
+#define __XEN_PUBLIC_HVM_PARAMS_H__
+
+#include "hvm_op.h"
+
+/* These parameters are deprecated and their meaning is undefined. */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+#define HVM_PARAM_PAE_ENABLED                4
+#define HVM_PARAM_DM_DOMAIN                 13
+#define HVM_PARAM_MEMORY_EVENT_CR0          20
+#define HVM_PARAM_MEMORY_EVENT_CR3          21
+#define HVM_PARAM_MEMORY_EVENT_CR4          22
+#define HVM_PARAM_MEMORY_EVENT_INT3         23
+#define HVM_PARAM_NESTEDHVM                 24
+#define HVM_PARAM_MEMORY_EVENT_SINGLE_STEP  25
+#define HVM_PARAM_BUFIOREQ_EVTCHN           26
+#define HVM_PARAM_MEMORY_EVENT_MSR          30
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+/*
+ * Parameter space for HVMOP_{set,get}_param.
+ */
+
+#define HVM_PARAM_CALLBACK_IRQ 0
+#define HVM_PARAM_CALLBACK_IRQ_TYPE_MASK xen_mk_ullong(0xFF00000000000000)
+/*
+ * How should CPU0 event-channel notifications be delivered?
+ *
+ * If val == 0 then CPU0 event-channel notifications are not delivered.
+ * If val != 0, val[63:56] encodes the type, as follows:
+ */
+
+#define HVM_PARAM_CALLBACK_TYPE_GSI      0
+/*
+ * val[55:0] is a delivery GSI.  GSI 0 cannot be used, as it aliases val == 0,
+ * and disables all notifications.
+ */
+
+#define HVM_PARAM_CALLBACK_TYPE_PCI_INTX 1
+/*
+ * val[55:0] is a delivery PCI INTx line:
+ * Domain = val[47:32], Bus = val[31:16] DevFn = val[15:8], IntX = val[1:0]
+ */
+
+#if defined(__i386__) || defined(__x86_64__)
+#define HVM_PARAM_CALLBACK_TYPE_VECTOR   2
+/*
+ * val[7:0] is a vector number.  Check for XENFEAT_hvm_callback_vector to know
+ * if this delivery method is available.
+ */
+#elif defined(__arm__) || defined(__aarch64__)
+#define HVM_PARAM_CALLBACK_TYPE_PPI      2
+/*
+ * val[55:16] needs to be zero.
+ * val[15:8] is interrupt flag of the PPI used by event-channel:
+ *  bit 8: the PPI is edge(1) or level(0) triggered
+ *  bit 9: the PPI is active low(1) or high(0)
+ * val[7:0] is a PPI number used by event-channel.
+ * This is only used by ARM/ARM64 and masking/eoi the interrupt associated to
+ * the notification is handled by the interrupt controller.
+ */
+#define HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_MASK      0xFF00
+#define HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_LOW_LEVEL 2
+#endif
+
+/*
+ * These are not used by Xen. They are here for convenience of HVM-guest
+ * xenbus implementations.
+ */
+#define HVM_PARAM_STORE_PFN    1
+#define HVM_PARAM_STORE_EVTCHN 2
+
+#define HVM_PARAM_IOREQ_PFN    5
+
+#define HVM_PARAM_BUFIOREQ_PFN 6
+
+#if defined(__i386__) || defined(__x86_64__)
+
+/*
+ * Viridian enlightenments
+ *
+ * (See http://download.microsoft.com/download/A/B/4/AB43A34E-BDD0-4FA6-BDEF-79EEF16E880B/Hypervisor%20Top%20Level%20Functional%20Specification%20v4.0.docx)
+ *
+ * To expose viridian enlightenments to the guest set this parameter
+ * to the desired feature mask. The base feature set must be present
+ * in any valid feature mask.
+ */
+#define HVM_PARAM_VIRIDIAN     9
+
+/* Base+Freq viridian feature sets:
+ *
+ * - Hypercall MSRs (HV_X64_MSR_GUEST_OS_ID and HV_X64_MSR_HYPERCALL)
+ * - APIC access MSRs (HV_X64_MSR_EOI, HV_X64_MSR_ICR and HV_X64_MSR_TPR)
+ * - Virtual Processor index MSR (HV_X64_MSR_VP_INDEX)
+ * - Timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
+ *   HV_X64_MSR_APIC_FREQUENCY)
+ */
+#define _HVMPV_base_freq 0
+#define HVMPV_base_freq  (1 << _HVMPV_base_freq)
+
+/* Feature set modifications */
+
+/* Disable timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
+ * HV_X64_MSR_APIC_FREQUENCY).
+ * This modification restores the viridian feature set to the
+ * original 'base' set exposed in releases prior to Xen 4.4.
+ */
+#define _HVMPV_no_freq 1
+#define HVMPV_no_freq  (1 << _HVMPV_no_freq)
+
+/* Enable Partition Time Reference Counter (HV_X64_MSR_TIME_REF_COUNT) */
+#define _HVMPV_time_ref_count 2
+#define HVMPV_time_ref_count  (1 << _HVMPV_time_ref_count)
+
+/* Enable Reference TSC Page (HV_X64_MSR_REFERENCE_TSC) */
+#define _HVMPV_reference_tsc 3
+#define HVMPV_reference_tsc  (1 << _HVMPV_reference_tsc)
+
+/* Use Hypercall for remote TLB flush */
+#define _HVMPV_hcall_remote_tlb_flush 4
+#define HVMPV_hcall_remote_tlb_flush (1 << _HVMPV_hcall_remote_tlb_flush)
+
+/* Use APIC assist */
+#define _HVMPV_apic_assist 5
+#define HVMPV_apic_assist (1 << _HVMPV_apic_assist)
+
+/* Enable crash MSRs */
+#define _HVMPV_crash_ctl 6
+#define HVMPV_crash_ctl (1 << _HVMPV_crash_ctl)
+
+/* Enable SYNIC MSRs */
+#define _HVMPV_synic 7
+#define HVMPV_synic (1 << _HVMPV_synic)
+
+/* Enable STIMER MSRs */
+#define _HVMPV_stimer 8
+#define HVMPV_stimer (1 << _HVMPV_stimer)
+
+/* Use Synthetic Cluster IPI Hypercall */
+#define _HVMPV_hcall_ipi 9
+#define HVMPV_hcall_ipi (1 << _HVMPV_hcall_ipi)
+
+/* Enable ExProcessorMasks */
+#define _HVMPV_ex_processor_masks 10
+#define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
+
+/* Allow more than 64 VPs */
+#define _HVMPV_no_vp_limit 11
+#define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
+
+/* Enable vCPU hotplug */
+#define _HVMPV_cpu_hotplug 12
+#define HVMPV_cpu_hotplug (1 << _HVMPV_cpu_hotplug)
+
+#define HVMPV_feature_mask \
+        (HVMPV_base_freq | \
+         HVMPV_no_freq | \
+         HVMPV_time_ref_count | \
+         HVMPV_reference_tsc | \
+         HVMPV_hcall_remote_tlb_flush | \
+         HVMPV_apic_assist | \
+         HVMPV_crash_ctl | \
+         HVMPV_synic | \
+         HVMPV_stimer | \
+         HVMPV_hcall_ipi | \
+         HVMPV_ex_processor_masks | \
+         HVMPV_no_vp_limit | \
+         HVMPV_cpu_hotplug)
+
+#endif
+
+/*
+ * Set mode for virtual timers (currently x86 only):
+ *  delay_for_missed_ticks (default):
+ *   Do not advance a vcpu's time beyond the correct delivery time for
+ *   interrupts that have been missed due to preemption. Deliver missed
+ *   interrupts when the vcpu is rescheduled and advance the vcpu's virtual
+ *   time stepwise for each one.
+ *  no_delay_for_missed_ticks:
+ *   As above, missed interrupts are delivered, but guest time always tracks
+ *   wallclock (i.e., real) time while doing so.
+ *  no_missed_ticks_pending:
+ *   No missed interrupts are held pending. Instead, to ensure ticks are
+ *   delivered at some non-zero rate, if we detect missed ticks then the
+ *   internal tick alarm is not disabled if the VCPU is preempted during the
+ *   next tick period.
+ *  one_missed_tick_pending:
+ *   Missed interrupts are collapsed together and delivered as one 'late tick'.
+ *   Guest time always tracks wallclock (i.e., real) time.
+ */
+#define HVM_PARAM_TIMER_MODE   10
+#define HVMPTM_delay_for_missed_ticks    0
+#define HVMPTM_no_delay_for_missed_ticks 1
+#define HVMPTM_no_missed_ticks_pending   2
+#define HVMPTM_one_missed_tick_pending   3
+
+/* Boolean: Enable virtual HPET (high-precision event timer)? (x86-only) */
+#define HVM_PARAM_HPET_ENABLED 11
+
+/* Identity-map page directory used by Intel EPT when CR0.PG=0. */
+#define HVM_PARAM_IDENT_PT     12
+
+/* ACPI S state: currently support S0 and S3 on x86. */
+#define HVM_PARAM_ACPI_S_STATE 14
+
+/* TSS used on Intel when CR0.PE=0. */
+#define HVM_PARAM_VM86_TSS     15
+
+/* Boolean: Enable aligning all periodic vpts to reduce interrupts */
+#define HVM_PARAM_VPT_ALIGN    16
+
+/* Console debug shared memory ring and event channel */
+#define HVM_PARAM_CONSOLE_PFN    17
+#define HVM_PARAM_CONSOLE_EVTCHN 18
+
+/*
+ * Select location of ACPI PM1a and TMR control blocks. Currently two locations
+ * are supported, specified by version 0 or 1 in this parameter:
+ *   - 0: default, use the old addresses
+ *        PM1A_EVT == 0x1f40; PM1A_CNT == 0x1f44; PM_TMR == 0x1f48
+ *   - 1: use the new default qemu addresses
+ *        PM1A_EVT == 0xb000; PM1A_CNT == 0xb004; PM_TMR == 0xb008
+ * You can find these address definitions in <hvm/ioreq.h>
+ */
+#define HVM_PARAM_ACPI_IOPORTS_LOCATION 19
+
+/* Params for the mem event rings */
+#define HVM_PARAM_PAGING_RING_PFN   27
+#define HVM_PARAM_MONITOR_RING_PFN  28
+#define HVM_PARAM_SHARING_RING_PFN  29
+
+/* SHUTDOWN_* action in case of a triple fault */
+#define HVM_PARAM_TRIPLE_FAULT_REASON 31
+
+#define HVM_PARAM_IOREQ_SERVER_PFN 32
+#define HVM_PARAM_NR_IOREQ_SERVER_PAGES 33
+
+/* Location of the VM Generation ID in guest physical address space. */
+#define HVM_PARAM_VM_GENERATION_ID_ADDR 34
+
+/*
+ * Set mode for altp2m:
+ *  disabled: don't activate altp2m (default)
+ *  mixed: allow access to all altp2m ops for both in-guest and external tools
+ *  external: allow access to external privileged tools only
+ *  limited: guest only has limited access (ie. control VMFUNC and #VE)
+ *
+ * Note that 'mixed' mode has not been evaluated for safety from a
+ * security perspective.  Before using this mode in a
+ * security-critical environment, each subop should be evaluated for
+ * safety, with unsafe subops blacklisted in XSM.
+ */
+#define HVM_PARAM_ALTP2M       35
+#define XEN_ALTP2M_disabled      0
+#define XEN_ALTP2M_mixed         1
+#define XEN_ALTP2M_external      2
+#define XEN_ALTP2M_limited       3
+
+/*
+ * Size of the x87 FPU FIP/FDP registers that the hypervisor needs to
+ * save/restore.  This is a workaround for a hardware limitation that
+ * does not allow the full FIP/FDP and FCS/FDS to be restored.
+ *
+ * Valid values are:
+ *
+ * 8: save/restore 64-bit FIP/FDP and clear FCS/FDS (default if CPU
+ *    has FPCSDS feature).
+ *
+ * 4: save/restore 32-bit FIP/FDP, FCS/FDS, and clear upper 32-bits of
+ *    FIP/FDP.
+ *
+ * 0: allow hypervisor to choose based on the value of FIP/FDP
+ *    (default if CPU does not have FPCSDS).
+ *
+ * If FPCSDS (bit 13 in CPUID leaf 0x7, subleaf 0x0) is set, the CPU
+ * never saves FCS/FDS and this parameter should be left at the
+ * default of 8.
+ */
+#define HVM_PARAM_X87_FIP_WIDTH 36
+
+/*
+ * TSS (and its size) used on Intel when CR0.PE=0. The address occupies
+ * the low 32 bits, while the size is in the high 32 ones.
+ */
+#define HVM_PARAM_VM86_TSS_SIZED 37
+
+/* Enable MCA capabilities. */
+#define HVM_PARAM_MCA_CAP 38
+#define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
+#define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
+
+#define HVM_NR_PARAMS 39
+
+#endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
diff --git a/include/standard-headers/xen/io/blkif.h b/include/standard-headers/xen/io/blkif.h
new file mode 100644
index 0000000000..4cdba79aba
--- /dev/null
+++ b/include/standard-headers/xen/io/blkif.h
@@ -0,0 +1,722 @@
+/******************************************************************************
+ * blkif.h
+ *
+ * Unified block-device I/O interface for Xen guest OSes.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2003-2004, Keir Fraser
+ * Copyright (c) 2012, Spectra Logic Corporation
+ */
+
+#ifndef __XEN_PUBLIC_IO_BLKIF_H__
+#define __XEN_PUBLIC_IO_BLKIF_H__
+
+#include "ring.h"
+#include "../grant_table.h"
+
+/*
+ * Front->back notifications: When enqueuing a new request, sending a
+ * notification can be made conditional on req_event (i.e., the generic
+ * hold-off mechanism provided by the ring macros). Backends must set
+ * req_event appropriately (e.g., using RING_FINAL_CHECK_FOR_REQUESTS()).
+ *
+ * Back->front notifications: When enqueuing a new response, sending a
+ * notification can be made conditional on rsp_event (i.e., the generic
+ * hold-off mechanism provided by the ring macros). Frontends must set
+ * rsp_event appropriately (e.g., using RING_FINAL_CHECK_FOR_RESPONSES()).
+ */
+
+#ifndef blkif_vdev_t
+#define blkif_vdev_t   uint16_t
+#endif
+#define blkif_sector_t uint64_t
+
+/*
+ * Feature and Parameter Negotiation
+ * =================================
+ * The two halves of a Xen block driver utilize nodes within the XenStore to
+ * communicate capabilities and to negotiate operating parameters.  This
+ * section enumerates these nodes which reside in the respective front and
+ * backend portions of the XenStore, following the XenBus convention.
+ *
+ * All data in the XenStore is stored as strings.  Nodes specifying numeric
+ * values are encoded in decimal.  Integer value ranges listed below are
+ * expressed as fixed sized integer types capable of storing the conversion
+ * of a properly formated node string, without loss of information.
+ *
+ * Any specified default value is in effect if the corresponding XenBus node
+ * is not present in the XenStore.
+ *
+ * XenStore nodes in sections marked "PRIVATE" are solely for use by the
+ * driver side whose XenBus tree contains them.
+ *
+ * XenStore nodes marked "DEPRECATED" in their notes section should only be
+ * used to provide interoperability with legacy implementations.
+ *
+ * See the XenBus state transition diagram below for details on when XenBus
+ * nodes must be published and when they can be queried.
+ *
+ *****************************************************************************
+ *                            Backend XenBus Nodes
+ *****************************************************************************
+ *
+ *------------------ Backend Device Identification (PRIVATE) ------------------
+ *
+ * mode
+ *      Values:         "r" (read only), "w" (writable)
+ *
+ *      The read or write access permissions to the backing store to be
+ *      granted to the frontend.
+ *
+ * params
+ *      Values:         string
+ *
+ *      A free formatted string providing sufficient information for the
+ *      hotplug script to attach the device and provide a suitable
+ *      handler (ie: a block device) for blkback to use.
+ *
+ * physical-device
+ *      Values:         "MAJOR:MINOR"
+ *      Notes: 11
+ *
+ *      MAJOR and MINOR are the major number and minor number of the
+ *      backing device respectively.
+ *
+ * physical-device-path
+ *      Values:         path string
+ *
+ *      A string that contains the absolute path to the disk image. On
+ *      NetBSD and Linux this is always a block device, while on FreeBSD
+ *      it can be either a block device or a regular file.
+ *
+ * type
+ *      Values:         "file", "phy", "tap"
+ *
+ *      The type of the backing device/object.
+ *
+ *
+ * direct-io-safe
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *
+ *      The underlying storage is not affected by the direct IO memory
+ *      lifetime bug.  See:
+ *        https://lists.xen.org/archives/html/xen-devel/2012-12/msg01154.html
+ *
+ *      Therefore this option gives the backend permission to use
+ *      O_DIRECT, notwithstanding that bug.
+ *
+ *      That is, if this option is enabled, use of O_DIRECT is safe,
+ *      in circumstances where we would normally have avoided it as a
+ *      workaround for that bug.  This option is not relevant for all
+ *      backends, and even not necessarily supported for those for
+ *      which it is relevant.  A backend which knows that it is not
+ *      affected by the bug can ignore this option.
+ *
+ *      This option doesn't require a backend to use O_DIRECT, so it
+ *      should not be used to try to control the caching behaviour.
+ *
+ *--------------------------------- Features ---------------------------------
+ *
+ * feature-barrier
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *
+ *      A value of "1" indicates that the backend can process requests
+ *      containing the BLKIF_OP_WRITE_BARRIER request opcode.  Requests
+ *      of this type may still be returned at any time with the
+ *      BLKIF_RSP_EOPNOTSUPP result code.
+ *
+ * feature-flush-cache
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *
+ *      A value of "1" indicates that the backend can process requests
+ *      containing the BLKIF_OP_FLUSH_DISKCACHE request opcode.  Requests
+ *      of this type may still be returned at any time with the
+ *      BLKIF_RSP_EOPNOTSUPP result code.
+ *
+ * feature-discard
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *
+ *      A value of "1" indicates that the backend can process requests
+ *      containing the BLKIF_OP_DISCARD request opcode.  Requests
+ *      of this type may still be returned at any time with the
+ *      BLKIF_RSP_EOPNOTSUPP result code.
+ *
+ * feature-persistent
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *      Notes: 7
+ *
+ *      A value of "1" indicates that the backend can keep the grants used
+ *      by the frontend driver mapped, so the same set of grants should be
+ *      used in all transactions. The maximum number of grants the backend
+ *      can map persistently depends on the implementation, but ideally it
+ *      should be RING_SIZE * BLKIF_MAX_SEGMENTS_PER_REQUEST. Using this
+ *      feature the backend doesn't need to unmap each grant, preventing
+ *      costly TLB flushes. The backend driver should only map grants
+ *      persistently if the frontend supports it. If a backend driver chooses
+ *      to use the persistent protocol when the frontend doesn't support it,
+ *      it will probably hit the maximum number of persistently mapped grants
+ *      (due to the fact that the frontend won't be reusing the same grants),
+ *      and fall back to non-persistent mode. Backend implementations may
+ *      shrink or expand the number of persistently mapped grants without
+ *      notifying the frontend depending on memory constraints (this might
+ *      cause a performance degradation).
+ *
+ *      If a backend driver wants to limit the maximum number of persistently
+ *      mapped grants to a value less than RING_SIZE *
+ *      BLKIF_MAX_SEGMENTS_PER_REQUEST a LRU strategy should be used to
+ *      discard the grants that are less commonly used. Using a LRU in the
+ *      backend driver paired with a LIFO queue in the frontend will
+ *      allow us to have better performance in this scenario.
+ *
+ *----------------------- Request Transport Parameters ------------------------
+ *
+ * max-ring-page-order
+ *      Values:         <uint32_t>
+ *      Default Value:  0
+ *      Notes:          1, 3
+ *
+ *      The maximum supported size of the request ring buffer in units of
+ *      lb(machine pages). (e.g. 0 == 1 page,  1 = 2 pages, 2 == 4 pages,
+ *      etc.).
+ *
+ * max-ring-pages
+ *      Values:         <uint32_t>
+ *      Default Value:  1
+ *      Notes:          DEPRECATED, 2, 3
+ *
+ *      The maximum supported size of the request ring buffer in units of
+ *      machine pages.  The value must be a power of 2.
+ *
+ *------------------------- Backend Device Properties -------------------------
+ *
+ * discard-enable
+ *      Values:         0/1 (boolean)
+ *      Default Value:  1
+ *
+ *      This optional property, set by the toolstack, instructs the backend
+ *      to offer (or not to offer) discard to the frontend. If the property
+ *      is missing the backend should offer discard if the backing storage
+ *      actually supports it.
+ *
+ * discard-alignment
+ *      Values:         <uint32_t>
+ *      Default Value:  0
+ *      Notes:          4, 5
+ *
+ *      The offset, in bytes from the beginning of the virtual block device,
+ *      to the first, addressable, discard extent on the underlying device.
+ *
+ * discard-granularity
+ *      Values:         <uint32_t>
+ *      Default Value:  <"sector-size">
+ *      Notes:          4
+ *
+ *      The size, in bytes, of the individually addressable discard extents
+ *      of the underlying device.
+ *
+ * discard-secure
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *      Notes:          10
+ *
+ *      A value of "1" indicates that the backend can process BLKIF_OP_DISCARD
+ *      requests with the BLKIF_DISCARD_SECURE flag set.
+ *
+ * info
+ *      Values:         <uint32_t> (bitmap)
+ *
+ *      A collection of bit flags describing attributes of the backing
+ *      device.  The VDISK_* macros define the meaning of each bit
+ *      location.
+ *
+ * sector-size
+ *      Values:         <uint32_t>
+ *
+ *      The logical block size, in bytes, of the underlying storage. This
+ *      must be a power of two with a minimum value of 512.
+ *
+ *      NOTE: Because of implementation bugs in some frontends this must be
+ *            set to 512, unless the frontend advertizes a non-zero value
+ *            in its "feature-large-sector-size" xenbus node. (See below).
+ *
+ * physical-sector-size
+ *      Values:         <uint32_t>
+ *      Default Value:  <"sector-size">
+ *
+ *      The physical block size, in bytes, of the backend storage. This
+ *      must be an integer multiple of "sector-size".
+ *
+ * sectors
+ *      Values:         <uint64_t>
+ *
+ *      The size of the backend device, expressed in units of "sector-size".
+ *      The product of "sector-size" and "sectors" must also be an integer
+ *      multiple of "physical-sector-size", if that node is present.
+ *
+ *****************************************************************************
+ *                            Frontend XenBus Nodes
+ *****************************************************************************
+ *
+ *----------------------- Request Transport Parameters -----------------------
+ *
+ * event-channel
+ *      Values:         <uint32_t>
+ *
+ *      The identifier of the Xen event channel used to signal activity
+ *      in the ring buffer.
+ *
+ * ring-ref
+ *      Values:         <uint32_t>
+ *      Notes:          6
+ *
+ *      The Xen grant reference granting permission for the backend to map
+ *      the sole page in a single page sized ring buffer.
+ *
+ * ring-ref%u
+ *      Values:         <uint32_t>
+ *      Notes:          6
+ *
+ *      For a frontend providing a multi-page ring, a "number of ring pages"
+ *      sized list of nodes, each containing a Xen grant reference granting
+ *      permission for the backend to map the page of the ring located
+ *      at page index "%u".  Page indexes are zero based.
+ *
+ * protocol
+ *      Values:         string (XEN_IO_PROTO_ABI_*)
+ *      Default Value:  XEN_IO_PROTO_ABI_NATIVE
+ *
+ *      The machine ABI rules governing the format of all ring request and
+ *      response structures.
+ *
+ * ring-page-order
+ *      Values:         <uint32_t>
+ *      Default Value:  0
+ *      Maximum Value:  MAX(ffs(max-ring-pages) - 1, max-ring-page-order)
+ *      Notes:          1, 3
+ *
+ *      The size of the frontend allocated request ring buffer in units
+ *      of lb(machine pages). (e.g. 0 == 1 page, 1 = 2 pages, 2 == 4 pages,
+ *      etc.).
+ *
+ * num-ring-pages
+ *      Values:         <uint32_t>
+ *      Default Value:  1
+ *      Maximum Value:  MAX(max-ring-pages,(0x1 << max-ring-page-order))
+ *      Notes:          DEPRECATED, 2, 3
+ *
+ *      The size of the frontend allocated request ring buffer in units of
+ *      machine pages.  The value must be a power of 2.
+ *
+ *--------------------------------- Features ---------------------------------
+ *
+ * feature-persistent
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *      Notes: 7, 8, 9
+ *
+ *      A value of "1" indicates that the frontend will reuse the same grants
+ *      for all transactions, allowing the backend to map them with write
+ *      access (even when it should be read-only). If the frontend hits the
+ *      maximum number of allowed persistently mapped grants, it can fallback
+ *      to non persistent mode. This will cause a performance degradation,
+ *      since the the backend driver will still try to map those grants
+ *      persistently. Since the persistent grants protocol is compatible with
+ *      the previous protocol, a frontend driver can choose to work in
+ *      persistent mode even when the backend doesn't support it.
+ *
+ *      It is recommended that the frontend driver stores the persistently
+ *      mapped grants in a LIFO queue, so a subset of all persistently mapped
+ *      grants gets used commonly. This is done in case the backend driver
+ *      decides to limit the maximum number of persistently mapped grants
+ *      to a value less than RING_SIZE * BLKIF_MAX_SEGMENTS_PER_REQUEST.
+ *
+ * feature-large-sector-size
+ *      Values:         0/1 (boolean)
+ *      Default Value:  0
+ *
+ *      A value of "1" indicates that the frontend will correctly supply and
+ *      interpret all sector-based quantities in terms of the "sector-size"
+ *      value supplied in the backend info, whatever that may be set to.
+ *      If this node is not present or its value is "0" then it is assumed
+ *      that the frontend requires that the logical block size is 512 as it
+ *      is hardcoded (which is the case in some frontend implementations).
+ *
+ *------------------------- Virtual Device Properties -------------------------
+ *
+ * device-type
+ *      Values:         "disk", "cdrom", "floppy", etc.
+ *
+ * virtual-device
+ *      Values:         <uint32_t>
+ *
+ *      A value indicating the physical device to virtualize within the
+ *      frontend's domain.  (e.g. "The first ATA disk", "The third SCSI
+ *      disk", etc.)
+ *
+ *      See docs/misc/vbd-interface.txt for details on the format of this
+ *      value.
+ *
+ * Notes
+ * -----
+ * (1) Multi-page ring buffer scheme first developed in the Citrix XenServer
+ *     PV drivers.
+ * (2) Multi-page ring buffer scheme first used in some RedHat distributions
+ *     including a distribution deployed on certain nodes of the Amazon
+ *     EC2 cluster.
+ * (3) Support for multi-page ring buffers was implemented independently,
+ *     in slightly different forms, by both Citrix and RedHat/Amazon.
+ *     For full interoperability, block front and backends should publish
+ *     identical ring parameters, adjusted for unit differences, to the
+ *     XenStore nodes used in both schemes.
+ * (4) Devices that support discard functionality may internally allocate space
+ *     (discardable extents) in units that are larger than the exported logical
+ *     block size. If the backing device has such discardable extents the
+ *     backend should provide both discard-granularity and discard-alignment.
+ *     Providing just one of the two may be considered an error by the frontend.
+ *     Backends supporting discard should include discard-granularity and
+ *     discard-alignment even if it supports discarding individual sectors.
+ *     Frontends should assume discard-alignment == 0 and discard-granularity
+ *     == sector size if these keys are missing.
+ * (5) The discard-alignment parameter allows a physical device to be
+ *     partitioned into virtual devices that do not necessarily begin or
+ *     end on a discardable extent boundary.
+ * (6) When there is only a single page allocated to the request ring,
+ *     'ring-ref' is used to communicate the grant reference for this
+ *     page to the backend.  When using a multi-page ring, the 'ring-ref'
+ *     node is not created.  Instead 'ring-ref0' - 'ring-refN' are used.
+ * (7) When using persistent grants data has to be copied from/to the page
+ *     where the grant is currently mapped. The overhead of doing this copy
+ *     however doesn't suppress the speed improvement of not having to unmap
+ *     the grants.
+ * (8) The frontend driver has to allow the backend driver to map all grants
+ *     with write access, even when they should be mapped read-only, since
+ *     further requests may reuse these grants and require write permissions.
+ * (9) Linux implementation doesn't have a limit on the maximum number of
+ *     grants that can be persistently mapped in the frontend driver, but
+ *     due to the frontent driver implementation it should never be bigger
+ *     than RING_SIZE * BLKIF_MAX_SEGMENTS_PER_REQUEST.
+ *(10) The discard-secure property may be present and will be set to 1 if the
+ *     backing device supports secure discard.
+ *(11) Only used by Linux and NetBSD.
+ */
+
+/*
+ * Multiple hardware queues/rings:
+ * If supported, the backend will write the key "multi-queue-max-queues" to
+ * the directory for that vbd, and set its value to the maximum supported
+ * number of queues.
+ * Frontends that are aware of this feature and wish to use it can write the
+ * key "multi-queue-num-queues" with the number they wish to use, which must be
+ * greater than zero, and no more than the value reported by the backend in
+ * "multi-queue-max-queues".
+ *
+ * For frontends requesting just one queue, the usual event-channel and
+ * ring-ref keys are written as before, simplifying the backend processing
+ * to avoid distinguishing between a frontend that doesn't understand the
+ * multi-queue feature, and one that does, but requested only one queue.
+ *
+ * Frontends requesting two or more queues must not write the toplevel
+ * event-channel and ring-ref keys, instead writing those keys under sub-keys
+ * having the name "queue-N" where N is the integer ID of the queue/ring for
+ * which those keys belong. Queues are indexed from zero.
+ * For example, a frontend with two queues must write the following set of
+ * queue-related keys:
+ *
+ * /local/domain/1/device/vbd/0/multi-queue-num-queues = "2"
+ * /local/domain/1/device/vbd/0/queue-0 = ""
+ * /local/domain/1/device/vbd/0/queue-0/ring-ref = "<ring-ref#0>"
+ * /local/domain/1/device/vbd/0/queue-0/event-channel = "<evtchn#0>"
+ * /local/domain/1/device/vbd/0/queue-1 = ""
+ * /local/domain/1/device/vbd/0/queue-1/ring-ref = "<ring-ref#1>"
+ * /local/domain/1/device/vbd/0/queue-1/event-channel = "<evtchn#1>"
+ *
+ * It is also possible to use multiple queues/rings together with
+ * feature multi-page ring buffer.
+ * For example, a frontend requests two queues/rings and the size of each ring
+ * buffer is two pages must write the following set of related keys:
+ *
+ * /local/domain/1/device/vbd/0/multi-queue-num-queues = "2"
+ * /local/domain/1/device/vbd/0/ring-page-order = "1"
+ * /local/domain/1/device/vbd/0/queue-0 = ""
+ * /local/domain/1/device/vbd/0/queue-0/ring-ref0 = "<ring-ref#0>"
+ * /local/domain/1/device/vbd/0/queue-0/ring-ref1 = "<ring-ref#1>"
+ * /local/domain/1/device/vbd/0/queue-0/event-channel = "<evtchn#0>"
+ * /local/domain/1/device/vbd/0/queue-1 = ""
+ * /local/domain/1/device/vbd/0/queue-1/ring-ref0 = "<ring-ref#2>"
+ * /local/domain/1/device/vbd/0/queue-1/ring-ref1 = "<ring-ref#3>"
+ * /local/domain/1/device/vbd/0/queue-1/event-channel = "<evtchn#1>"
+ *
+ */
+
+/*
+ * STATE DIAGRAMS
+ *
+ *****************************************************************************
+ *                                   Startup                                 *
+ *****************************************************************************
+ *
+ * Tool stack creates front and back nodes with state XenbusStateInitialising.
+ *
+ * Front                                Back
+ * =================================    =====================================
+ * XenbusStateInitialising              XenbusStateInitialising
+ *  o Query virtual device               o Query backend device identification
+ *    properties.                          data.
+ *  o Setup OS device instance.          o Open and validate backend device.
+ *                                       o Publish backend features and
+ *                                         transport parameters.
+ *                                                      |
+ *                                                      |
+ *                                                      V
+ *                                      XenbusStateInitWait
+ *
+ * o Query backend features and
+ *   transport parameters.
+ * o Allocate and initialize the
+ *   request ring.
+ * o Publish transport parameters
+ *   that will be in effect during
+ *   this connection.
+ *              |
+ *              |
+ *              V
+ * XenbusStateInitialised
+ *
+ *                                       o Query frontend transport parameters.
+ *                                       o Connect to the request ring and
+ *                                         event channel.
+ *                                       o Publish backend device properties.
+ *                                                      |
+ *                                                      |
+ *                                                      V
+ *                                      XenbusStateConnected
+ *
+ *  o Query backend device properties.
+ *  o Finalize OS virtual device
+ *    instance.
+ *              |
+ *              |
+ *              V
+ * XenbusStateConnected
+ *
+ * Note: Drivers that do not support any optional features, or the negotiation
+ *       of transport parameters, can skip certain states in the state machine:
+ *
+ *       o A frontend may transition to XenbusStateInitialised without
+ *         waiting for the backend to enter XenbusStateInitWait.  In this
+ *         case, default transport parameters are in effect and any
+ *         transport parameters published by the frontend must contain
+ *         their default values.
+ *
+ *       o A backend may transition to XenbusStateInitialised, bypassing
+ *         XenbusStateInitWait, without waiting for the frontend to first
+ *         enter the XenbusStateInitialised state.  In this case, default
+ *         transport parameters are in effect and any transport parameters
+ *         published by the backend must contain their default values.
+ *
+ *       Drivers that support optional features and/or transport parameter
+ *       negotiation must tolerate these additional state transition paths.
+ *       In general this means performing the work of any skipped state
+ *       transition, if it has not already been performed, in addition to the
+ *       work associated with entry into the current state.
+ */
+
+/*
+ * REQUEST CODES.
+ */
+#define BLKIF_OP_READ              0
+#define BLKIF_OP_WRITE             1
+/*
+ * All writes issued prior to a request with the BLKIF_OP_WRITE_BARRIER
+ * operation code ("barrier request") must be completed prior to the
+ * execution of the barrier request.  All writes issued after the barrier
+ * request must not execute until after the completion of the barrier request.
+ *
+ * Optional.  See "feature-barrier" XenBus node documentation above.
+ */
+#define BLKIF_OP_WRITE_BARRIER     2
+/*
+ * Commit any uncommitted contents of the backing device's volatile cache
+ * to stable storage.
+ *
+ * Optional.  See "feature-flush-cache" XenBus node documentation above.
+ */
+#define BLKIF_OP_FLUSH_DISKCACHE   3
+/*
+ * Used in SLES sources for device specific command packet
+ * contained within the request. Reserved for that purpose.
+ */
+#define BLKIF_OP_RESERVED_1        4
+/*
+ * Indicate to the backend device that a region of storage is no longer in
+ * use, and may be discarded at any time without impact to the client.  If
+ * the BLKIF_DISCARD_SECURE flag is set on the request, all copies of the
+ * discarded region on the device must be rendered unrecoverable before the
+ * command returns.
+ *
+ * This operation is analogous to performing a trim (ATA) or unamp (SCSI),
+ * command on a native device.
+ *
+ * More information about trim/unmap operations can be found at:
+ * http://t13.org/Documents/UploadedDocuments/docs2008/
+ *     e07154r6-Data_Set_Management_Proposal_for_ATA-ACS2.doc
+ * http://www.seagate.com/staticfiles/support/disc/manuals/
+ *     Interface%20manuals/100293068c.pdf
+ *
+ * Optional.  See "feature-discard", "discard-alignment",
+ * "discard-granularity", and "discard-secure" in the XenBus node
+ * documentation above.
+ */
+#define BLKIF_OP_DISCARD           5
+
+/*
+ * Recognized if "feature-max-indirect-segments" in present in the backend
+ * xenbus info. The "feature-max-indirect-segments" node contains the maximum
+ * number of segments allowed by the backend per request. If the node is
+ * present, the frontend might use blkif_request_indirect structs in order to
+ * issue requests with more than BLKIF_MAX_SEGMENTS_PER_REQUEST (11). The
+ * maximum number of indirect segments is fixed by the backend, but the
+ * frontend can issue requests with any number of indirect segments as long as
+ * it's less than the number provided by the backend. The indirect_grefs field
+ * in blkif_request_indirect should be filled by the frontend with the
+ * grant references of the pages that are holding the indirect segments.
+ * These pages are filled with an array of blkif_request_segment that hold the
+ * information about the segments. The number of indirect pages to use is
+ * determined by the number of segments an indirect request contains. Every
+ * indirect page can contain a maximum of
+ * (PAGE_SIZE / sizeof(struct blkif_request_segment)) segments, so to
+ * calculate the number of indirect pages to use we have to do
+ * ceil(indirect_segments / (PAGE_SIZE / sizeof(struct blkif_request_segment))).
+ *
+ * If a backend does not recognize BLKIF_OP_INDIRECT, it should *not*
+ * create the "feature-max-indirect-segments" node!
+ */
+#define BLKIF_OP_INDIRECT          6
+
+/*
+ * Maximum scatter/gather segments per request.
+ * This is carefully chosen so that sizeof(blkif_ring_t) <= PAGE_SIZE.
+ * NB. This could be 12 if the ring indexes weren't stored in the same page.
+ */
+#define BLKIF_MAX_SEGMENTS_PER_REQUEST 11
+
+/*
+ * Maximum number of indirect pages to use per request.
+ */
+#define BLKIF_MAX_INDIRECT_PAGES_PER_REQUEST 8
+
+/*
+ * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
+ * 'sector_number' in blkif_request, blkif_request_discard and
+ * blkif_request_indirect are sector-based quantities. See the description
+ * of the "feature-large-sector-size" frontend xenbus node above for
+ * more information.
+ */
+struct blkif_request_segment {
+    grant_ref_t gref;        /* reference to I/O buffer frame        */
+    /* @first_sect: first sector in frame to transfer (inclusive).   */
+    /* @last_sect: last sector in frame to transfer (inclusive).     */
+    uint8_t     first_sect, last_sect;
+};
+
+/*
+ * Starting ring element for any I/O request.
+ */
+struct blkif_request {
+    uint8_t        operation;    /* BLKIF_OP_???                         */
+    uint8_t        nr_segments;  /* number of segments                   */
+    blkif_vdev_t   handle;       /* only for read/write requests         */
+    uint64_t       id;           /* private guest value, echoed in resp  */
+    blkif_sector_t sector_number;/* start sector idx on disk (r/w only)  */
+    struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
+};
+typedef struct blkif_request blkif_request_t;
+
+/*
+ * Cast to this structure when blkif_request.operation == BLKIF_OP_DISCARD
+ * sizeof(struct blkif_request_discard) <= sizeof(struct blkif_request)
+ */
+struct blkif_request_discard {
+    uint8_t        operation;    /* BLKIF_OP_DISCARD                     */
+    uint8_t        flag;         /* BLKIF_DISCARD_SECURE or zero         */
+#define BLKIF_DISCARD_SECURE (1<<0)  /* ignored if discard-secure=0      */
+    blkif_vdev_t   handle;       /* same as for read/write requests      */
+    uint64_t       id;           /* private guest value, echoed in resp  */
+    blkif_sector_t sector_number;/* start sector idx on disk             */
+    uint64_t       nr_sectors;   /* number of contiguous sectors to discard*/
+};
+typedef struct blkif_request_discard blkif_request_discard_t;
+
+struct blkif_request_indirect {
+    uint8_t        operation;    /* BLKIF_OP_INDIRECT                    */
+    uint8_t        indirect_op;  /* BLKIF_OP_{READ/WRITE}                */
+    uint16_t       nr_segments;  /* number of segments                   */
+    uint64_t       id;           /* private guest value, echoed in resp  */
+    blkif_sector_t sector_number;/* start sector idx on disk (r/w only)  */
+    blkif_vdev_t   handle;       /* same as for read/write requests      */
+    grant_ref_t    indirect_grefs[BLKIF_MAX_INDIRECT_PAGES_PER_REQUEST];
+#ifdef __i386__
+    uint64_t       pad;          /* Make it 64 byte aligned on i386      */
+#endif
+};
+typedef struct blkif_request_indirect blkif_request_indirect_t;
+
+struct blkif_response {
+    uint64_t        id;              /* copied from request */
+    uint8_t         operation;       /* copied from request */
+    int16_t         status;          /* BLKIF_RSP_???       */
+};
+typedef struct blkif_response blkif_response_t;
+
+/*
+ * STATUS RETURN CODES.
+ */
+ /* Operation not supported (only happens on barrier writes). */
+#define BLKIF_RSP_EOPNOTSUPP  -2
+ /* Operation failed for some unspecified reason (-EIO). */
+#define BLKIF_RSP_ERROR       -1
+ /* Operation completed successfully. */
+#define BLKIF_RSP_OKAY         0
+
+/*
+ * Generate blkif ring structures and types.
+ */
+DEFINE_RING_TYPES(blkif, struct blkif_request, struct blkif_response);
+
+#define VDISK_CDROM        0x1
+#define VDISK_REMOVABLE    0x2
+#define VDISK_READONLY     0x4
+
+#endif /* __XEN_PUBLIC_IO_BLKIF_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/console.h b/include/standard-headers/xen/io/console.h
new file mode 100644
index 0000000000..4811f47220
--- /dev/null
+++ b/include/standard-headers/xen/io/console.h
@@ -0,0 +1,56 @@
+/******************************************************************************
+ * console.h
+ *
+ * Console I/O interface for Xen guest OSes.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2005, Keir Fraser
+ */
+
+#ifndef __XEN_PUBLIC_IO_CONSOLE_H__
+#define __XEN_PUBLIC_IO_CONSOLE_H__
+
+typedef uint32_t XENCONS_RING_IDX;
+
+#define MASK_XENCONS_IDX(idx, ring) ((idx) & (sizeof(ring)-1))
+
+struct xencons_interface {
+    char in[1024];
+    char out[2048];
+    XENCONS_RING_IDX in_cons, in_prod;
+    XENCONS_RING_IDX out_cons, out_prod;
+};
+
+#ifdef XEN_WANT_FLEX_CONSOLE_RING
+#include "ring.h"
+DEFINE_XEN_FLEX_RING(xencons);
+#endif
+
+#endif /* __XEN_PUBLIC_IO_CONSOLE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/fbif.h b/include/standard-headers/xen/io/fbif.h
new file mode 100644
index 0000000000..cc25aab32e
--- /dev/null
+++ b/include/standard-headers/xen/io/fbif.h
@@ -0,0 +1,176 @@
+/*
+ * fbif.h -- Xen virtual frame buffer device
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (C) 2005 Anthony Liguori <aliguori@us.ibm.com>
+ * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
+ */
+
+#ifndef __XEN_PUBLIC_IO_FBIF_H__
+#define __XEN_PUBLIC_IO_FBIF_H__
+
+/* Out events (frontend -> backend) */
+
+/*
+ * Out events may be sent only when requested by backend, and receipt
+ * of an unknown out event is an error.
+ */
+
+/* Event type 1 currently not used */
+/*
+ * Framebuffer update notification event
+ * Capable frontend sets feature-update in xenstore.
+ * Backend requests it by setting request-update in xenstore.
+ */
+#define XENFB_TYPE_UPDATE 2
+
+struct xenfb_update
+{
+    uint8_t type;    /* XENFB_TYPE_UPDATE */
+    int32_t x;      /* source x */
+    int32_t y;      /* source y */
+    int32_t width;  /* rect width */
+    int32_t height; /* rect height */
+};
+
+/*
+ * Framebuffer resize notification event
+ * Capable backend sets feature-resize in xenstore.
+ */
+#define XENFB_TYPE_RESIZE 3
+
+struct xenfb_resize
+{
+    uint8_t type;    /* XENFB_TYPE_RESIZE */
+    int32_t width;   /* width in pixels */
+    int32_t height;  /* height in pixels */
+    int32_t stride;  /* stride in bytes */
+    int32_t depth;   /* depth in bits */
+    int32_t offset;  /* offset of the framebuffer in bytes */
+};
+
+#define XENFB_OUT_EVENT_SIZE 40
+
+union xenfb_out_event
+{
+    uint8_t type;
+    struct xenfb_update update;
+    struct xenfb_resize resize;
+    char pad[XENFB_OUT_EVENT_SIZE];
+};
+
+/* In events (backend -> frontend) */
+
+/*
+ * Frontends should ignore unknown in events.
+ */
+
+/*
+ * Framebuffer refresh period advice
+ * Backend sends it to advise the frontend their preferred period of
+ * refresh.  Frontends that keep the framebuffer constantly up-to-date
+ * just ignore it.  Frontends that use the advice should immediately
+ * refresh the framebuffer (and send an update notification event if
+ * those have been requested), then use the update frequency to guide
+ * their periodical refreshs.
+ */
+#define XENFB_TYPE_REFRESH_PERIOD 1
+#define XENFB_NO_REFRESH 0
+
+struct xenfb_refresh_period
+{
+    uint8_t type;    /* XENFB_TYPE_UPDATE_PERIOD */
+    uint32_t period; /* period of refresh, in ms,
+                      * XENFB_NO_REFRESH if no refresh is needed */
+};
+
+#define XENFB_IN_EVENT_SIZE 40
+
+union xenfb_in_event
+{
+    uint8_t type;
+    struct xenfb_refresh_period refresh_period;
+    char pad[XENFB_IN_EVENT_SIZE];
+};
+
+/* shared page */
+
+#define XENFB_IN_RING_SIZE 1024
+#define XENFB_IN_RING_LEN (XENFB_IN_RING_SIZE / XENFB_IN_EVENT_SIZE)
+#define XENFB_IN_RING_OFFS 1024
+#define XENFB_IN_RING(page) \
+    ((union xenfb_in_event *)((char *)(page) + XENFB_IN_RING_OFFS))
+#define XENFB_IN_RING_REF(page, idx) \
+    (XENFB_IN_RING((page))[(idx) % XENFB_IN_RING_LEN])
+
+#define XENFB_OUT_RING_SIZE 2048
+#define XENFB_OUT_RING_LEN (XENFB_OUT_RING_SIZE / XENFB_OUT_EVENT_SIZE)
+#define XENFB_OUT_RING_OFFS (XENFB_IN_RING_OFFS + XENFB_IN_RING_SIZE)
+#define XENFB_OUT_RING(page) \
+    ((union xenfb_out_event *)((char *)(page) + XENFB_OUT_RING_OFFS))
+#define XENFB_OUT_RING_REF(page, idx) \
+    (XENFB_OUT_RING((page))[(idx) % XENFB_OUT_RING_LEN])
+
+struct xenfb_page
+{
+    uint32_t in_cons, in_prod;
+    uint32_t out_cons, out_prod;
+
+    int32_t width;          /* the width of the framebuffer (in pixels) */
+    int32_t height;         /* the height of the framebuffer (in pixels) */
+    uint32_t line_length;   /* the length of a row of pixels (in bytes) */
+    uint32_t mem_length;    /* the length of the framebuffer (in bytes) */
+    uint8_t depth;          /* the depth of a pixel (in bits) */
+
+    /*
+     * Framebuffer page directory
+     *
+     * Each directory page holds PAGE_SIZE / sizeof(*pd)
+     * framebuffer pages, and can thus map up to PAGE_SIZE *
+     * PAGE_SIZE / sizeof(*pd) bytes.  With PAGE_SIZE == 4096 and
+     * sizeof(unsigned long) == 4/8, that's 4 Megs 32 bit and 2 Megs
+     * 64 bit.  256 directories give enough room for a 512 Meg
+     * framebuffer with a max resolution of 12,800x10,240.  Should
+     * be enough for a while with room leftover for expansion.
+     */
+    unsigned long pd[256];
+};
+
+/*
+ * Wart: xenkbd needs to know default resolution.  Put it here until a
+ * better solution is found, but don't leak it to the backend.
+ */
+#ifdef __KERNEL__
+#define XENFB_WIDTH 800
+#define XENFB_HEIGHT 600
+#define XENFB_DEPTH 32
+#endif
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/kbdif.h b/include/standard-headers/xen/io/kbdif.h
new file mode 100644
index 0000000000..a6b01c52c7
--- /dev/null
+++ b/include/standard-headers/xen/io/kbdif.h
@@ -0,0 +1,576 @@
+/*
+ * kbdif.h -- Xen virtual keyboard/mouse
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (C) 2005 Anthony Liguori <aliguori@us.ibm.com>
+ * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
+ */
+
+#ifndef __XEN_PUBLIC_IO_KBDIF_H__
+#define __XEN_PUBLIC_IO_KBDIF_H__
+
+/*
+ *****************************************************************************
+ *                     Feature and Parameter Negotiation
+ *****************************************************************************
+ *
+ * The two halves of a para-virtual driver utilize nodes within
+ * XenStore to communicate capabilities and to negotiate operating parameters.
+ * This section enumerates these nodes which reside in the respective front and
+ * backend portions of XenStore, following XenBus convention.
+ *
+ * All data in XenStore is stored as strings.  Nodes specifying numeric
+ * values are encoded in decimal. Integer value ranges listed below are
+ * expressed as fixed sized integer types capable of storing the conversion
+ * of a properly formated node string, without loss of information.
+ *
+ *****************************************************************************
+ *                            Backend XenBus Nodes
+ *****************************************************************************
+ *
+ *---------------------------- Features supported ----------------------------
+ *
+ * Capable backend advertises supported features by publishing
+ * corresponding entries in XenStore and puts 1 as the value of the entry.
+ * If a feature is not supported then 0 must be set or feature entry omitted.
+ *
+ * feature-disable-keyboard
+ *      Values:         <uint>
+ *
+ *      If there is no need to expose a virtual keyboard device by the
+ *      frontend then this must be set to 1.
+ *
+ * feature-disable-pointer
+ *      Values:         <uint>
+ *
+ *      If there is no need to expose a virtual pointer device by the
+ *      frontend then this must be set to 1.
+ *
+ * feature-abs-pointer
+ *      Values:         <uint>
+ *
+ *      Backends, which support reporting of absolute coordinates for pointer
+ *      device should set this to 1.
+ *
+ * feature-multi-touch
+ *      Values:         <uint>
+ *
+ *      Backends, which support reporting of multi-touch events
+ *      should set this to 1.
+ *
+ * feature-raw-pointer
+ *      Values:        <uint>
+ *
+ *      Backends, which support reporting raw (unscaled) absolute coordinates
+ *      for pointer devices should set this to 1. Raw (unscaled) values have
+ *      a range of [0, 0x7fff].
+ *
+ *-----------------------  Device Instance Parameters ------------------------
+ *
+ * unique-id
+ *      Values:         <string>
+ *
+ *      After device instance initialization it is assigned a unique ID,
+ *      so every instance of the frontend can be identified by the backend
+ *      by this ID. This can be UUID or such.
+ *
+ *------------------------- Pointer Device Parameters ------------------------
+ *
+ * width
+ *      Values:         <uint>
+ *
+ *      Maximum X coordinate (width) to be used by the frontend
+ *      while reporting input events, pixels, [0; UINT32_MAX].
+ *
+ * height
+ *      Values:         <uint>
+ *
+ *      Maximum Y coordinate (height) to be used by the frontend
+ *      while reporting input events, pixels, [0; UINT32_MAX].
+ *
+ *----------------------- Multi-touch Device Parameters ----------------------
+ *
+ * multi-touch-num-contacts
+ *      Values:         <uint>
+ *
+ *      Number of simultaneous touches reported.
+ *
+ * multi-touch-width
+ *      Values:         <uint>
+ *
+ *      Width of the touch area to be used by the frontend
+ *      while reporting input events, pixels, [0; UINT32_MAX].
+ *
+ * multi-touch-height
+ *      Values:         <uint>
+ *
+ *      Height of the touch area to be used by the frontend
+ *      while reporting input events, pixels, [0; UINT32_MAX].
+ *
+ *****************************************************************************
+ *                            Frontend XenBus Nodes
+ *****************************************************************************
+ *
+ *------------------------------ Feature request -----------------------------
+ *
+ * Capable frontend requests features from backend via setting corresponding
+ * entries to 1 in XenStore. Requests for features not advertised as supported
+ * by the backend have no effect.
+ *
+ * request-abs-pointer
+ *      Values:         <uint>
+ *
+ *      Request backend to report absolute pointer coordinates
+ *      (XENKBD_TYPE_POS) instead of relative ones (XENKBD_TYPE_MOTION).
+ *
+ * request-multi-touch
+ *      Values:         <uint>
+ *
+ *      Request backend to report multi-touch events.
+ *
+ * request-raw-pointer
+ *      Values:         <uint>
+ *
+ *      Request backend to report raw unscaled absolute pointer coordinates.
+ *      This option is only valid if request-abs-pointer is also set.
+ *      Raw unscaled coordinates have the range [0, 0x7fff]
+ *
+ *----------------------- Request Transport Parameters -----------------------
+ *
+ * event-channel
+ *      Values:         <uint>
+ *
+ *      The identifier of the Xen event channel used to signal activity
+ *      in the ring buffer.
+ *
+ * page-gref
+ *      Values:         <uint>
+ *
+ *      The Xen grant reference granting permission for the backend to map
+ *      a sole page in a single page sized event ring buffer.
+ *
+ * page-ref
+ *      Values:         <uint>
+ *
+ *      OBSOLETE, not recommended for use.
+ *      PFN of the shared page.
+ */
+
+/*
+ * EVENT CODES.
+ */
+
+#define XENKBD_TYPE_MOTION             1
+#define XENKBD_TYPE_RESERVED           2
+#define XENKBD_TYPE_KEY                3
+#define XENKBD_TYPE_POS                4
+#define XENKBD_TYPE_MTOUCH             5
+
+/* Multi-touch event sub-codes */
+
+#define XENKBD_MT_EV_DOWN              0
+#define XENKBD_MT_EV_UP                1
+#define XENKBD_MT_EV_MOTION            2
+#define XENKBD_MT_EV_SYN               3
+#define XENKBD_MT_EV_SHAPE             4
+#define XENKBD_MT_EV_ORIENT            5
+
+/*
+ * CONSTANTS, XENSTORE FIELD AND PATH NAME STRINGS, HELPERS.
+ */
+
+#define XENKBD_DRIVER_NAME             "vkbd"
+
+#define XENKBD_FIELD_FEAT_DSBL_KEYBRD  "feature-disable-keyboard"
+#define XENKBD_FIELD_FEAT_DSBL_POINTER "feature-disable-pointer"
+#define XENKBD_FIELD_FEAT_ABS_POINTER  "feature-abs-pointer"
+#define XENKBD_FIELD_FEAT_RAW_POINTER  "feature-raw-pointer"
+#define XENKBD_FIELD_FEAT_MTOUCH       "feature-multi-touch"
+#define XENKBD_FIELD_REQ_ABS_POINTER   "request-abs-pointer"
+#define XENKBD_FIELD_REQ_RAW_POINTER   "request-raw-pointer"
+#define XENKBD_FIELD_REQ_MTOUCH        "request-multi-touch"
+#define XENKBD_FIELD_RING_GREF         "page-gref"
+#define XENKBD_FIELD_EVT_CHANNEL       "event-channel"
+#define XENKBD_FIELD_WIDTH             "width"
+#define XENKBD_FIELD_HEIGHT            "height"
+#define XENKBD_FIELD_MT_WIDTH          "multi-touch-width"
+#define XENKBD_FIELD_MT_HEIGHT         "multi-touch-height"
+#define XENKBD_FIELD_MT_NUM_CONTACTS   "multi-touch-num-contacts"
+#define XENKBD_FIELD_UNIQUE_ID         "unique-id"
+
+/* OBSOLETE, not recommended for use */
+#define XENKBD_FIELD_RING_REF          "page-ref"
+
+/*
+ *****************************************************************************
+ * Description of the protocol between frontend and backend driver.
+ *****************************************************************************
+ *
+ * The two halves of a Para-virtual driver communicate with
+ * each other using a shared page and an event channel.
+ * Shared page contains a ring with event structures.
+ *
+ * All reserved fields in the structures below must be 0.
+ *
+ *****************************************************************************
+ *                           Backend to frontend events
+ *****************************************************************************
+ *
+ * Frontends should ignore unknown in events.
+ * All event packets have the same length (40 octets)
+ * All event packets have common header:
+ *
+ *          0         octet
+ * +-----------------+
+ * |       type      |
+ * +-----------------+
+ * type - uint8_t, event code, XENKBD_TYPE_???
+ *
+ *
+ * Pointer relative movement event
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MOTION  |                     reserved                     | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                               rel_x                               | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                               rel_y                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                               rel_z                               | 16
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 20
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * rel_x - int32_t, relative X motion
+ * rel_y - int32_t, relative Y motion
+ * rel_z - int32_t, relative Z motion (wheel)
+ */
+
+struct xenkbd_motion
+{
+    uint8_t type;
+    int32_t rel_x;
+    int32_t rel_y;
+    int32_t rel_z;
+};
+
+/*
+ * Key event (includes pointer buttons)
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_KEY     |     pressed    |            reserved             | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                              keycode                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 12
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * pressed - uint8_t, 1 if pressed; 0 otherwise
+ * keycode - uint32_t, KEY_* from linux/input.h
+ */
+
+struct xenkbd_key
+{
+    uint8_t type;
+    uint8_t pressed;
+    uint32_t keycode;
+};
+
+/*
+ * Pointer absolute position event
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_POS     |                     reserved                     | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_x                               | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_y                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                               rel_z                               | 16
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 20
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * abs_x - int32_t, absolute X position (in FB pixels)
+ * abs_y - int32_t, absolute Y position (in FB pixels)
+ * rel_z - int32_t, relative Z motion (wheel)
+ */
+
+struct xenkbd_position
+{
+    uint8_t type;
+    int32_t abs_x;
+    int32_t abs_y;
+    int32_t rel_z;
+};
+
+/*
+ * Multi-touch event and its sub-types
+ *
+ * All multi-touch event packets have common header:
+ *
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |   event_type   |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ *
+ * event_type - unt8_t, multi-touch event sub-type, XENKBD_MT_EV_???
+ * contact_id - unt8_t, ID of the contact
+ *
+ * Touch interactions can consist of one or more contacts.
+ * For each contact, a series of events is generated, starting
+ * with a down event, followed by zero or more motion events,
+ * and ending with an up event. Events relating to the same
+ * contact point can be identified by the ID of the sequence: contact ID.
+ * Contact ID may be reused after XENKBD_MT_EV_UP event and
+ * is in the [0; XENKBD_FIELD_NUM_CONTACTS - 1] range.
+ *
+ * For further information please refer to documentation on Wayland [1],
+ * Linux [2] and Windows [3] multi-touch support.
+ *
+ * [1] https://cgit.freedesktop.org/wayland/wayland/tree/protocol/wayland.xml
+ * [2] https://www.kernel.org/doc/Documentation/input/multi-touch-protocol.txt
+ * [3] https://msdn.microsoft.com/en-us/library/jj151564(v=vs.85).aspx
+ *
+ *
+ * Multi-touch down event - sent when a new touch is made: touch is assigned
+ * a unique contact ID, sent with this and consequent events related
+ * to this touch.
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |   _MT_EV_DOWN  |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_x                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_y                               | 16
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 20
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * abs_x - int32_t, absolute X position, in pixels
+ * abs_y - int32_t, absolute Y position, in pixels
+ *
+ * Multi-touch contact release event
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |  _MT_EV_UP     |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Multi-touch motion event
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |  _MT_EV_MOTION |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_x                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                               abs_y                               | 16
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 20
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * abs_x - int32_t, absolute X position, in pixels,
+ * abs_y - int32_t, absolute Y position, in pixels,
+ *
+ * Multi-touch input synchronization event - shows end of a set of events
+ * which logically belong together.
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |  _MT_EV_SYN    |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Multi-touch shape event - touch point's shape has changed its shape.
+ * Shape is approximated by an ellipse through the major and minor axis
+ * lengths: major is the longer diameter of the ellipse and minor is the
+ * shorter one. Center of the ellipse is reported via
+ * XENKBD_MT_EV_DOWN/XENKBD_MT_EV_MOTION events.
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |  _MT_EV_SHAPE  |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                               major                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                               minor                               | 16
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 20
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * major - unt32_t, length of the major axis, pixels
+ * minor - unt32_t, length of the minor axis, pixels
+ *
+ * Multi-touch orientation event - touch point's shape has changed
+ * its orientation: calculated as a clockwise angle between the major axis
+ * of the ellipse and positive Y axis in degrees, [-180; +180].
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |  _TYPE_MTOUCH  |  _MT_EV_ORIENT |   contact_id   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 8
+ * +----------------+----------------+----------------+----------------+
+ * |           orientation           |            reserved             | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 16
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 40
+ * +----------------+----------------+----------------+----------------+
+ *
+ * orientation - int16_t, clockwise angle of the major axis
+ */
+
+struct xenkbd_mtouch {
+    uint8_t type;            /* XENKBD_TYPE_MTOUCH */
+    uint8_t event_type;      /* XENKBD_MT_EV_??? */
+    uint8_t contact_id;
+    uint8_t reserved[5];     /* reserved for the future use */
+    union {
+        struct {
+            int32_t abs_x;   /* absolute X position, pixels */
+            int32_t abs_y;   /* absolute Y position, pixels */
+        } pos;
+        struct {
+            uint32_t major;  /* length of the major axis, pixels */
+            uint32_t minor;  /* length of the minor axis, pixels */
+        } shape;
+        int16_t orientation; /* clockwise angle of the major axis */
+    } u;
+};
+
+#define XENKBD_IN_EVENT_SIZE 40
+
+union xenkbd_in_event
+{
+    uint8_t type;
+    struct xenkbd_motion motion;
+    struct xenkbd_key key;
+    struct xenkbd_position pos;
+    struct xenkbd_mtouch mtouch;
+    char pad[XENKBD_IN_EVENT_SIZE];
+};
+
+/*
+ *****************************************************************************
+ *                            Frontend to backend events
+ *****************************************************************************
+ *
+ * Out events may be sent only when requested by backend, and receipt
+ * of an unknown out event is an error.
+ * No out events currently defined.
+
+ * All event packets have the same length (40 octets)
+ * All event packets have common header:
+ *          0         octet
+ * +-----------------+
+ * |       type      |
+ * +-----------------+
+ * type - uint8_t, event code
+ */
+
+#define XENKBD_OUT_EVENT_SIZE 40
+
+union xenkbd_out_event
+{
+    uint8_t type;
+    char pad[XENKBD_OUT_EVENT_SIZE];
+};
+
+/*
+ *****************************************************************************
+ *                            Shared page
+ *****************************************************************************
+ */
+
+#define XENKBD_IN_RING_SIZE 2048
+#define XENKBD_IN_RING_LEN (XENKBD_IN_RING_SIZE / XENKBD_IN_EVENT_SIZE)
+#define XENKBD_IN_RING_OFFS 1024
+#define XENKBD_IN_RING(page) \
+    ((union xenkbd_in_event *)((char *)(page) + XENKBD_IN_RING_OFFS))
+#define XENKBD_IN_RING_REF(page, idx) \
+    (XENKBD_IN_RING((page))[(idx) % XENKBD_IN_RING_LEN])
+
+#define XENKBD_OUT_RING_SIZE 1024
+#define XENKBD_OUT_RING_LEN (XENKBD_OUT_RING_SIZE / XENKBD_OUT_EVENT_SIZE)
+#define XENKBD_OUT_RING_OFFS (XENKBD_IN_RING_OFFS + XENKBD_IN_RING_SIZE)
+#define XENKBD_OUT_RING(page) \
+    ((union xenkbd_out_event *)((char *)(page) + XENKBD_OUT_RING_OFFS))
+#define XENKBD_OUT_RING_REF(page, idx) \
+    (XENKBD_OUT_RING((page))[(idx) % XENKBD_OUT_RING_LEN])
+
+struct xenkbd_page
+{
+    uint32_t in_cons, in_prod;
+    uint32_t out_cons, out_prod;
+};
+
+#endif /* __XEN_PUBLIC_IO_KBDIF_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/netif.h b/include/standard-headers/xen/io/netif.h
new file mode 100644
index 0000000000..00dd258712
--- /dev/null
+++ b/include/standard-headers/xen/io/netif.h
@@ -0,0 +1,1102 @@
+/******************************************************************************
+ * netif.h
+ *
+ * Unified network-device I/O interface for Xen guest OSes.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2003-2004, Keir Fraser
+ */
+
+#ifndef __XEN_PUBLIC_IO_NETIF_H__
+#define __XEN_PUBLIC_IO_NETIF_H__
+
+#include "ring.h"
+#include "../grant_table.h"
+
+/*
+ * Older implementation of Xen network frontend / backend has an
+ * implicit dependency on the MAX_SKB_FRAGS as the maximum number of
+ * ring slots a skb can use. Netfront / netback may not work as
+ * expected when frontend and backend have different MAX_SKB_FRAGS.
+ *
+ * A better approach is to add mechanism for netfront / netback to
+ * negotiate this value. However we cannot fix all possible
+ * frontends, so we need to define a value which states the minimum
+ * slots backend must support.
+ *
+ * The minimum value derives from older Linux kernel's MAX_SKB_FRAGS
+ * (18), which is proved to work with most frontends. Any new backend
+ * which doesn't negotiate with frontend should expect frontend to
+ * send a valid packet using slots up to this value.
+ */
+#define XEN_NETIF_NR_SLOTS_MIN 18
+
+/*
+ * Notifications after enqueuing any type of message should be conditional on
+ * the appropriate req_event or rsp_event field in the shared ring.
+ * If the client sends notification for rx requests then it should specify
+ * feature 'feature-rx-notify' via xenbus. Otherwise the backend will assume
+ * that it cannot safely queue packets (as it may not be kicked to send them).
+ */
+
+/*
+ * "feature-split-event-channels" is introduced to separate guest TX
+ * and RX notification. Backend either doesn't support this feature or
+ * advertises it via xenstore as 0 (disabled) or 1 (enabled).
+ *
+ * To make use of this feature, frontend should allocate two event
+ * channels for TX and RX, advertise them to backend as
+ * "event-channel-tx" and "event-channel-rx" respectively. If frontend
+ * doesn't want to use this feature, it just writes "event-channel"
+ * node as before.
+ */
+
+/*
+ * Multiple transmit and receive queues:
+ * If supported, the backend will write the key "multi-queue-max-queues" to
+ * the directory for that vif, and set its value to the maximum supported
+ * number of queues.
+ * Frontends that are aware of this feature and wish to use it can write the
+ * key "multi-queue-num-queues", set to the number they wish to use, which
+ * must be greater than zero, and no more than the value reported by the backend
+ * in "multi-queue-max-queues".
+ *
+ * Queues replicate the shared rings and event channels.
+ * "feature-split-event-channels" may optionally be used when using
+ * multiple queues, but is not mandatory.
+ *
+ * Each queue consists of one shared ring pair, i.e. there must be the same
+ * number of tx and rx rings.
+ *
+ * For frontends requesting just one queue, the usual event-channel and
+ * ring-ref keys are written as before, simplifying the backend processing
+ * to avoid distinguishing between a frontend that doesn't understand the
+ * multi-queue feature, and one that does, but requested only one queue.
+ *
+ * Frontends requesting two or more queues must not write the toplevel
+ * event-channel (or event-channel-{tx,rx}) and {tx,rx}-ring-ref keys,
+ * instead writing those keys under sub-keys having the name "queue-N" where
+ * N is the integer ID of the queue for which those keys belong. Queues
+ * are indexed from zero. For example, a frontend with two queues and split
+ * event channels must write the following set of queue-related keys:
+ *
+ * /local/domain/1/device/vif/0/multi-queue-num-queues = "2"
+ * /local/domain/1/device/vif/0/queue-0 = ""
+ * /local/domain/1/device/vif/0/queue-0/tx-ring-ref = "<ring-ref-tx0>"
+ * /local/domain/1/device/vif/0/queue-0/rx-ring-ref = "<ring-ref-rx0>"
+ * /local/domain/1/device/vif/0/queue-0/event-channel-tx = "<evtchn-tx0>"
+ * /local/domain/1/device/vif/0/queue-0/event-channel-rx = "<evtchn-rx0>"
+ * /local/domain/1/device/vif/0/queue-1 = ""
+ * /local/domain/1/device/vif/0/queue-1/tx-ring-ref = "<ring-ref-tx1>"
+ * /local/domain/1/device/vif/0/queue-1/rx-ring-ref = "<ring-ref-rx1"
+ * /local/domain/1/device/vif/0/queue-1/event-channel-tx = "<evtchn-tx1>"
+ * /local/domain/1/device/vif/0/queue-1/event-channel-rx = "<evtchn-rx1>"
+ *
+ * If there is any inconsistency in the XenStore data, the backend may
+ * choose not to connect any queues, instead treating the request as an
+ * error. This includes scenarios where more (or fewer) queues were
+ * requested than the frontend provided details for.
+ *
+ * Mapping of packets to queues is considered to be a function of the
+ * transmitting system (backend or frontend) and is not negotiated
+ * between the two. Guests are free to transmit packets on any queue
+ * they choose, provided it has been set up correctly. Guests must be
+ * prepared to receive packets on any queue they have requested be set up.
+ */
+
+/*
+ * "feature-no-csum-offload" should be used to turn IPv4 TCP/UDP checksum
+ * offload off or on. If it is missing then the feature is assumed to be on.
+ * "feature-ipv6-csum-offload" should be used to turn IPv6 TCP/UDP checksum
+ * offload on or off. If it is missing then the feature is assumed to be off.
+ */
+
+/*
+ * "feature-gso-tcpv4" and "feature-gso-tcpv6" advertise the capability to
+ * handle large TCP packets (in IPv4 or IPv6 form respectively). Neither
+ * frontends nor backends are assumed to be capable unless the flags are
+ * present.
+ */
+
+/*
+ * "feature-multicast-control" and "feature-dynamic-multicast-control"
+ * advertise the capability to filter ethernet multicast packets in the
+ * backend. If the frontend wishes to take advantage of this feature then
+ * it may set "request-multicast-control". If the backend only advertises
+ * "feature-multicast-control" then "request-multicast-control" must be set
+ * before the frontend moves into the connected state. The backend will
+ * sample the value on this state transition and any subsequent change in
+ * value will have no effect. However, if the backend also advertises
+ * "feature-dynamic-multicast-control" then "request-multicast-control"
+ * may be set by the frontend at any time. In this case, the backend will
+ * watch the value and re-sample on watch events.
+ *
+ * If the sampled value of "request-multicast-control" is set then the
+ * backend transmit side should no longer flood multicast packets to the
+ * frontend, it should instead drop any multicast packet that does not
+ * match in a filter list.
+ * The list is amended by the frontend by sending dummy transmit requests
+ * containing XEN_NETIF_EXTRA_TYPE_MCAST_{ADD,DEL} extra-info fragments as
+ * specified below.
+ * Note that the filter list may be amended even if the sampled value of
+ * "request-multicast-control" is not set, however the filter should only
+ * be applied if it is set.
+ */
+
+/*
+ * Control ring
+ * ============
+ *
+ * Some features, such as hashing (detailed below), require a
+ * significant amount of out-of-band data to be passed from frontend to
+ * backend. Use of xenstore is not suitable for large quantities of data
+ * because of quota limitations and so a dedicated 'control ring' is used.
+ * The ability of the backend to use a control ring is advertised by
+ * setting:
+ *
+ * /local/domain/X/backend/vif/<domid>/<vif>/feature-ctrl-ring = "1"
+ *
+ * The frontend provides a control ring to the backend by setting:
+ *
+ * /local/domain/<domid>/device/vif/<vif>/ctrl-ring-ref = <gref>
+ * /local/domain/<domid>/device/vif/<vif>/event-channel-ctrl = <port>
+ *
+ * where <gref> is the grant reference of the shared page used to
+ * implement the control ring and <port> is an event channel to be used
+ * as a mailbox interrupt. These keys must be set before the frontend
+ * moves into the connected state.
+ *
+ * The control ring uses a fixed request/response message size and is
+ * balanced (i.e. one request to one response), so operationally it is much
+ * the same as a transmit or receive ring.
+ * Note that there is no requirement that responses are issued in the same
+ * order as requests.
+ */
+
+/*
+ * Link state
+ * ==========
+ *
+ * The backend can advertise its current link (carrier) state to the
+ * frontend using the /local/domain/X/backend/vif/<domid>/<vif>/carrier
+ * node. If this node is not present, then the frontend should assume that
+ * the link is up (for compatibility with backends that do not implement
+ * this feature). If this node is present, then a value of "0" should be
+ * interpreted by the frontend as the link being down (no carrier) and a
+ * value of "1" should be interpreted as the link being up (carrier
+ * present).
+ */
+
+/*
+ * MTU
+ * ===
+ *
+ * The toolstack may set a value of MTU for the frontend by setting the
+ * /local/domain/<domid>/device/vif/<vif>/mtu node with the MTU value in
+ * octets. If this node is absent the frontend should assume an MTU value
+ * of 1500 octets. A frontend is also at liberty to ignore this value so
+ * it is only suitable for informing the frontend that a packet payload
+ * >1500 octets is permitted.
+ */
+
+/*
+ * Hash types
+ * ==========
+ *
+ * For the purposes of the definitions below, 'Packet[]' is an array of
+ * octets containing an IP packet without options, 'Array[X..Y]' means a
+ * sub-array of 'Array' containing bytes X thru Y inclusive, and '+' is
+ * used to indicate concatenation of arrays.
+ */
+
+/*
+ * A hash calculated over an IP version 4 header as follows:
+ *
+ * Buffer[0..8] = Packet[12..15] (source address) +
+ *                Packet[16..19] (destination address)
+ *
+ * Result = Hash(Buffer, 8)
+ */
+#define _XEN_NETIF_CTRL_HASH_TYPE_IPV4 0
+#define XEN_NETIF_CTRL_HASH_TYPE_IPV4 \
+    (1 << _XEN_NETIF_CTRL_HASH_TYPE_IPV4)
+
+/*
+ * A hash calculated over an IP version 4 header and TCP header as
+ * follows:
+ *
+ * Buffer[0..12] = Packet[12..15] (source address) +
+ *                 Packet[16..19] (destination address) +
+ *                 Packet[20..21] (source port) +
+ *                 Packet[22..23] (destination port)
+ *
+ * Result = Hash(Buffer, 12)
+ */
+#define _XEN_NETIF_CTRL_HASH_TYPE_IPV4_TCP 1
+#define XEN_NETIF_CTRL_HASH_TYPE_IPV4_TCP \
+    (1 << _XEN_NETIF_CTRL_HASH_TYPE_IPV4_TCP)
+
+/*
+ * A hash calculated over an IP version 6 header as follows:
+ *
+ * Buffer[0..32] = Packet[8..23]  (source address ) +
+ *                 Packet[24..39] (destination address)
+ *
+ * Result = Hash(Buffer, 32)
+ */
+#define _XEN_NETIF_CTRL_HASH_TYPE_IPV6 2
+#define XEN_NETIF_CTRL_HASH_TYPE_IPV6 \
+    (1 << _XEN_NETIF_CTRL_HASH_TYPE_IPV6)
+
+/*
+ * A hash calculated over an IP version 6 header and TCP header as
+ * follows:
+ *
+ * Buffer[0..36] = Packet[8..23]  (source address) +
+ *                 Packet[24..39] (destination address) +
+ *                 Packet[40..41] (source port) +
+ *                 Packet[42..43] (destination port)
+ *
+ * Result = Hash(Buffer, 36)
+ */
+#define _XEN_NETIF_CTRL_HASH_TYPE_IPV6_TCP 3
+#define XEN_NETIF_CTRL_HASH_TYPE_IPV6_TCP \
+    (1 << _XEN_NETIF_CTRL_HASH_TYPE_IPV6_TCP)
+
+/*
+ * Hash algorithms
+ * ===============
+ */
+
+#define XEN_NETIF_CTRL_HASH_ALGORITHM_NONE 0
+
+/*
+ * Toeplitz hash:
+ */
+
+#define XEN_NETIF_CTRL_HASH_ALGORITHM_TOEPLITZ 1
+
+/*
+ * This algorithm uses a 'key' as well as the data buffer itself.
+ * (Buffer[] and Key[] are treated as shift-registers where the MSB of
+ * Buffer/Key[0] is considered 'left-most' and the LSB of Buffer/Key[N-1]
+ * is the 'right-most').
+ *
+ * Value = 0
+ * For number of bits in Buffer[]
+ *    If (left-most bit of Buffer[] is 1)
+ *        Value ^= left-most 32 bits of Key[]
+ *    Key[] << 1
+ *    Buffer[] << 1
+ *
+ * The code below is provided for convenience where an operating system
+ * does not already provide an implementation.
+ */
+#ifdef XEN_NETIF_DEFINE_TOEPLITZ
+static uint32_t xen_netif_toeplitz_hash(const uint8_t *key,
+                                        unsigned int keylen,
+                                        const uint8_t *buf,
+                                        unsigned int buflen)
+{
+    unsigned int keyi, bufi;
+    uint64_t prefix = 0;
+    uint64_t hash = 0;
+
+    /* Pre-load prefix with the first 8 bytes of the key */
+    for (keyi = 0; keyi < 8; keyi++) {
+        prefix <<= 8;
+        prefix |= (keyi < keylen) ? key[keyi] : 0;
+    }
+
+    for (bufi = 0; bufi < buflen; bufi++) {
+        uint8_t byte = buf[bufi];
+        unsigned int bit;
+
+        for (bit = 0; bit < 8; bit++) {
+            if (byte & 0x80)
+                hash ^= prefix;
+            prefix <<= 1;
+            byte <<=1;
+        }
+
+        /*
+         * 'prefix' has now been left-shifted by 8, so
+         * OR in the next byte.
+         */
+        prefix |= (keyi < keylen) ? key[keyi] : 0;
+        keyi++;
+    }
+
+    /* The valid part of the hash is in the upper 32 bits. */
+    return hash >> 32;
+}
+#endif /* XEN_NETIF_DEFINE_TOEPLITZ */
+
+/*
+ * Control requests (struct xen_netif_ctrl_request)
+ * ================================================
+ *
+ * All requests have the following format:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |    id     |   type    |         data[0]       |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |         data[1]       |         data[2]       |
+ * +-----+-----+-----+-----+-----------------------+
+ *
+ * id: the request identifier, echoed in response.
+ * type: the type of request (see below)
+ * data[]: any data associated with the request (determined by type)
+ */
+
+struct xen_netif_ctrl_request {
+    uint16_t id;
+    uint16_t type;
+
+#define XEN_NETIF_CTRL_TYPE_INVALID               0
+#define XEN_NETIF_CTRL_TYPE_GET_HASH_FLAGS        1
+#define XEN_NETIF_CTRL_TYPE_SET_HASH_FLAGS        2
+#define XEN_NETIF_CTRL_TYPE_SET_HASH_KEY          3
+#define XEN_NETIF_CTRL_TYPE_GET_HASH_MAPPING_SIZE 4
+#define XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING_SIZE 5
+#define XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING      6
+#define XEN_NETIF_CTRL_TYPE_SET_HASH_ALGORITHM    7
+#define XEN_NETIF_CTRL_TYPE_GET_GREF_MAPPING_SIZE 8
+#define XEN_NETIF_CTRL_TYPE_ADD_GREF_MAPPING      9
+#define XEN_NETIF_CTRL_TYPE_DEL_GREF_MAPPING     10
+
+    uint32_t data[3];
+};
+
+/*
+ * Control responses (struct xen_netif_ctrl_response)
+ * ==================================================
+ *
+ * All responses have the following format:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |    id     |   type    |         status        |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |         data          |
+ * +-----+-----+-----+-----+
+ *
+ * id: the corresponding request identifier
+ * type: the type of the corresponding request
+ * status: the status of request processing
+ * data: any data associated with the response (determined by type and
+ *       status)
+ */
+
+struct xen_netif_ctrl_response {
+    uint16_t id;
+    uint16_t type;
+    uint32_t status;
+
+#define XEN_NETIF_CTRL_STATUS_SUCCESS           0
+#define XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     1
+#define XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER 2
+#define XEN_NETIF_CTRL_STATUS_BUFFER_OVERFLOW   3
+
+    uint32_t data;
+};
+
+/*
+ * Static Grants (struct xen_netif_gref)
+ * =====================================
+ *
+ * A frontend may provide a fixed set of grant references to be mapped on
+ * the backend. The message of type XEN_NETIF_CTRL_TYPE_ADD_GREF_MAPPING
+ * prior its usage in the command ring allows for creation of these mappings.
+ * The backend will maintain a fixed amount of these mappings.
+ *
+ * XEN_NETIF_CTRL_TYPE_GET_GREF_MAPPING_SIZE lets a frontend query how many
+ * of these mappings can be kept.
+ *
+ * Each entry in the XEN_NETIF_CTRL_TYPE_{ADD,DEL}_GREF_MAPPING input table has
+ * the following format:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | grant ref             |  flags    |  status   |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * grant ref: grant reference (IN)
+ * flags: flags describing the control operation (IN)
+ * status: XEN_NETIF_CTRL_STATUS_* (OUT)
+ *
+ * 'status' is an output parameter which does not require to be set to zero
+ * prior to its usage in the corresponding control messages.
+ */
+
+struct xen_netif_gref {
+       grant_ref_t ref;
+       uint16_t flags;
+
+#define _XEN_NETIF_CTRLF_GREF_readonly    0
+#define XEN_NETIF_CTRLF_GREF_readonly    (1U<<_XEN_NETIF_CTRLF_GREF_readonly)
+
+       uint16_t status;
+};
+
+/*
+ * Control messages
+ * ================
+ *
+ * XEN_NETIF_CTRL_TYPE_SET_HASH_ALGORITHM
+ * --------------------------------------
+ *
+ * This is sent by the frontend to set the desired hash algorithm.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_SET_HASH_ALGORITHM
+ *  data[0] = a XEN_NETIF_CTRL_HASH_ALGORITHM_* value
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - The algorithm is not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *
+ * NOTE: Setting data[0] to XEN_NETIF_CTRL_HASH_ALGORITHM_NONE disables
+ *       hashing and the backend is free to choose how it steers packets
+ *       to queues (which is the default behaviour).
+ *
+ * XEN_NETIF_CTRL_TYPE_GET_HASH_FLAGS
+ * ----------------------------------
+ *
+ * This is sent by the frontend to query the types of hash supported by
+ * the backend.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_GET_HASH_FLAGS
+ *  data[0] = 0
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED - Operation not supported
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS       - Operation successful
+ *  data   = supported hash types (if operation was successful)
+ *
+ * NOTE: A valid hash algorithm must be selected before this operation can
+ *       succeed.
+ *
+ * XEN_NETIF_CTRL_TYPE_SET_HASH_FLAGS
+ * ----------------------------------
+ *
+ * This is sent by the frontend to set the types of hash that the backend
+ * should calculate. (See above for hash type definitions).
+ * Note that the 'maximal' type of hash should always be chosen. For
+ * example, if the frontend sets both IPV4 and IPV4_TCP hash types then
+ * the latter hash type should be calculated for any TCP packet and the
+ * former only calculated for non-TCP packets.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_SET_HASH_FLAGS
+ *  data[0] = bitwise OR of XEN_NETIF_CTRL_HASH_TYPE_* values
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - One or more flag
+ *                                                     value is invalid or
+ *                                                     unsupported
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = 0
+ *
+ * NOTE: A valid hash algorithm must be selected before this operation can
+ *       succeed.
+ *       Also, setting data[0] to zero disables hashing and the backend
+ *       is free to choose how it steers packets to queues.
+ *
+ * XEN_NETIF_CTRL_TYPE_SET_HASH_KEY
+ * --------------------------------
+ *
+ * This is sent by the frontend to set the key of the hash if the algorithm
+ * requires it. (See hash algorithms above).
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_SET_HASH_KEY
+ *  data[0] = grant reference of page containing the key (assumed to
+ *            start at beginning of grant)
+ *  data[1] = size of key in octets
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - Key size is invalid
+ *           XEN_NETIF_CTRL_STATUS_BUFFER_OVERFLOW   - Key size is larger
+ *                                                     than the backend
+ *                                                     supports
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = 0
+ *
+ * NOTE: Any key octets not specified are assumed to be zero (the key
+ *       is assumed to be empty by default) and specifying a new key
+ *       invalidates any previous key, hence specifying a key size of
+ *       zero will clear the key (which ensures that the calculated hash
+ *       will always be zero).
+ *       The maximum size of key is algorithm and backend specific, but
+ *       is also limited by the single grant reference.
+ *       The grant reference may be read-only and must remain valid until
+ *       the response has been processed.
+ *
+ * XEN_NETIF_CTRL_TYPE_GET_HASH_MAPPING_SIZE
+ * -----------------------------------------
+ *
+ * This is sent by the frontend to query the maximum size of mapping
+ * table supported by the backend. The size is specified in terms of
+ * table entries.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_GET_HASH_MAPPING_SIZE
+ *  data[0] = 0
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED - Operation not supported
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS       - Operation successful
+ *  data   = maximum number of entries allowed in the mapping table
+ *           (if operation was successful) or zero if a mapping table is
+ *           not supported (i.e. hash mapping is done only by modular
+ *           arithmetic).
+ *
+ * XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING_SIZE
+ * -------------------------------------
+ *
+ * This is sent by the frontend to set the actual size of the mapping
+ * table to be used by the backend. The size is specified in terms of
+ * table entries.
+ * Any previous table is invalidated by this message and any new table
+ * is assumed to be zero filled.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING_SIZE
+ *  data[0] = number of entries in mapping table
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - Table size is invalid
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = 0
+ *
+ * NOTE: Setting data[0] to 0 means that hash mapping should be done
+ *       using modular arithmetic.
+ *
+ * XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING
+ * ------------------------------------
+ *
+ * This is sent by the frontend to set the content of the table mapping
+ * hash value to queue number. The backend should calculate the hash from
+ * the packet header, use it as an index into the table (modulo the size
+ * of the table) and then steer the packet to the queue number found at
+ * that index.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING
+ *  data[0] = grant reference of page containing the mapping (sub-)table
+ *            (assumed to start at beginning of grant)
+ *  data[1] = size of (sub-)table in entries
+ *  data[2] = offset, in entries, of sub-table within overall table
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - Table size or content
+ *                                                     is invalid
+ *           XEN_NETIF_CTRL_STATUS_BUFFER_OVERFLOW   - Table size is larger
+ *                                                     than the backend
+ *                                                     supports
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = 0
+ *
+ * NOTE: The overall table has the following format:
+ *
+ *          0     1     2     3     4     5     6     7  octet
+ *       +-----+-----+-----+-----+-----+-----+-----+-----+
+ *       |       mapping[0]      |       mapping[1]      |
+ *       +-----+-----+-----+-----+-----+-----+-----+-----+
+ *       |                       .                       |
+ *       |                       .                       |
+ *       |                       .                       |
+ *       +-----+-----+-----+-----+-----+-----+-----+-----+
+ *       |      mapping[N-2]     |      mapping[N-1]     |
+ *       +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ *       where N is specified by a XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING_SIZE
+ *       message and each  mapping must specifies a queue between 0 and
+ *       "multi-queue-num-queues" (see above).
+ *       The backend may support a mapping table larger than can be
+ *       mapped by a single grant reference. Thus sub-tables within a
+ *       larger table can be individually set by sending multiple messages
+ *       with differing offset values. Specifying a new sub-table does not
+ *       invalidate any table data outside that range.
+ *       The grant reference may be read-only and must remain valid until
+ *       the response has been processed.
+ *
+ * XEN_NETIF_CTRL_TYPE_GET_GREF_MAPPING_SIZE
+ * -----------------------------------------
+ *
+ * This is sent by the frontend to fetch the number of grefs that can be kept
+ * mapped in the backend.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_GET_GREF_MAPPING_SIZE
+ *  data[0] = queue index (assumed 0 for single queue)
+ *  data[1] = 0
+ *  data[2] = 0
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - The queue index is
+ *                                                     out of range
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = maximum number of entries allowed in the gref mapping table
+ *           (if operation was successful) or zero if it is not supported.
+ *
+ * XEN_NETIF_CTRL_TYPE_ADD_GREF_MAPPING
+ * ------------------------------------
+ *
+ * This is sent by the frontend for backend to map a list of grant
+ * references.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_ADD_GREF_MAPPING
+ *  data[0] = queue index
+ *  data[1] = grant reference of page containing the mapping list
+ *            (r/w and assumed to start at beginning of page)
+ *  data[2] = size of list in entries
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - Operation failed
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *
+ * NOTE: Each entry in the input table has the format outlined
+ *       in struct xen_netif_gref.
+ *       Contrary to XEN_NETIF_CTRL_TYPE_DEL_GREF_MAPPING, the struct
+ *       xen_netif_gref 'status' field is not used and therefore the response
+ *       'status' determines the success of this operation. In case of
+ *       failure none of grants mappings get added in the backend.
+ *
+ * XEN_NETIF_CTRL_TYPE_DEL_GREF_MAPPING
+ * ------------------------------------
+ *
+ * This is sent by the frontend for backend to unmap a list of grant
+ * references.
+ *
+ * Request:
+ *
+ *  type    = XEN_NETIF_CTRL_TYPE_DEL_GREF_MAPPING
+ *  data[0] = queue index
+ *  data[1] = grant reference of page containing the mapping list
+ *            (r/w and assumed to start at beginning of page)
+ *  data[2] = size of list in entries
+ *
+ * Response:
+ *
+ *  status = XEN_NETIF_CTRL_STATUS_NOT_SUPPORTED     - Operation not
+ *                                                     supported
+ *           XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER - Operation failed
+ *           XEN_NETIF_CTRL_STATUS_SUCCESS           - Operation successful
+ *  data   = number of entries that were unmapped
+ *
+ * NOTE: Each entry in the input table has the format outlined in struct
+ *       xen_netif_gref.
+ *       The struct xen_netif_gref 'status' field determines if the entry
+ *       was successfully removed.
+ *       The entries used are only the ones representing grant references that
+ *       were previously the subject of a XEN_NETIF_CTRL_TYPE_ADD_GREF_MAPPING
+ *       operation. Any other entries will have their status set to
+ *       XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER upon completion.
+ */
+
+DEFINE_RING_TYPES(xen_netif_ctrl,
+                  struct xen_netif_ctrl_request,
+                  struct xen_netif_ctrl_response);
+
+/*
+ * Guest transmit
+ * ==============
+ *
+ * This is the 'wire' format for transmit (frontend -> backend) packets:
+ *
+ *  Fragment 1: netif_tx_request_t  - flags = NETTXF_*
+ *                                    size = total packet size
+ * [Extra 1: netif_extra_info_t]    - (only if fragment 1 flags include
+ *                                     NETTXF_extra_info)
+ *  ...
+ * [Extra N: netif_extra_info_t]    - (only if extra N-1 flags include
+ *                                     XEN_NETIF_EXTRA_MORE)
+ *  ...
+ *  Fragment N: netif_tx_request_t  - (only if fragment N-1 flags include
+ *                                     NETTXF_more_data - flags on preceding
+ *                                     extras are not relevant here)
+ *                                    flags = 0
+ *                                    size = fragment size
+ *
+ * NOTE:
+ *
+ * This format slightly is different from that used for receive
+ * (backend -> frontend) packets. Specifically, in a multi-fragment
+ * packet the actual size of fragment 1 can only be determined by
+ * subtracting the sizes of fragments 2..N from the total packet size.
+ *
+ * Ring slot size is 12 octets, however not all request/response
+ * structs use the full size.
+ *
+ * tx request data (netif_tx_request_t)
+ * ------------------------------------
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | grant ref             | offset    | flags     |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | id        | size      |
+ * +-----+-----+-----+-----+
+ *
+ * grant ref: Reference to buffer page.
+ * offset: Offset within buffer page.
+ * flags: NETTXF_*.
+ * id: request identifier, echoed in response.
+ * size: packet size in bytes.
+ *
+ * tx response (netif_tx_response_t)
+ * ---------------------------------
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | id        | status    | unused                |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | unused                |
+ * +-----+-----+-----+-----+
+ *
+ * id: reflects id in transmit request
+ * status: NETIF_RSP_*
+ *
+ * Guest receive
+ * =============
+ *
+ * This is the 'wire' format for receive (backend -> frontend) packets:
+ *
+ *  Fragment 1: netif_rx_request_t  - flags = NETRXF_*
+ *                                    size = fragment size
+ * [Extra 1: netif_extra_info_t]    - (only if fragment 1 flags include
+ *                                     NETRXF_extra_info)
+ *  ...
+ * [Extra N: netif_extra_info_t]    - (only if extra N-1 flags include
+ *                                     XEN_NETIF_EXTRA_MORE)
+ *  ...
+ *  Fragment N: netif_rx_request_t  - (only if fragment N-1 flags include
+ *                                     NETRXF_more_data - flags on preceding
+ *                                     extras are not relevant here)
+ *                                    flags = 0
+ *                                    size = fragment size
+ *
+ * NOTE:
+ *
+ * This format slightly is different from that used for transmit
+ * (frontend -> backend) packets. Specifically, in a multi-fragment
+ * packet the size of the packet can only be determined by summing the
+ * sizes of fragments 1..N.
+ *
+ * Ring slot size is 8 octets.
+ *
+ * rx request (netif_rx_request_t)
+ * -------------------------------
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | id        | pad       | gref                  |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * id: request identifier, echoed in response.
+ * gref: reference to incoming granted frame.
+ *
+ * rx response (netif_rx_response_t)
+ * ---------------------------------
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | id        | offset    | flags     | status    |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * id: reflects id in receive request
+ * offset: offset in page of start of received packet
+ * flags: NETRXF_*
+ * status: -ve: NETIF_RSP_*; +ve: Rx'ed pkt size.
+ *
+ * NOTE: Historically, to support GSO on the frontend receive side, Linux
+ *       netfront does not make use of the rx response id (because, as
+ *       described below, extra info structures overlay the id field).
+ *       Instead it assumes that responses always appear in the same ring
+ *       slot as their corresponding request. Thus, to maintain
+ *       compatibility, backends must make sure this is the case.
+ *
+ * Extra Info
+ * ==========
+ *
+ * Can be present if initial request or response has NET{T,R}XF_extra_info,
+ * or previous extra request has XEN_NETIF_EXTRA_MORE.
+ *
+ * The struct therefore needs to fit into either a tx or rx slot and
+ * is therefore limited to 8 octets.
+ *
+ * NOTE: Because extra info data overlays the usual request/response
+ *       structures, there is no id information in the opposite direction.
+ *       So, if an extra info overlays an rx response the frontend can
+ *       assume that it is in the same ring slot as the request that was
+ *       consumed to make the slot available, and the backend must ensure
+ *       this assumption is true.
+ *
+ * extra info (netif_extra_info_t)
+ * -------------------------------
+ *
+ * General format:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |type |flags| type specific data                |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * | padding for tx        |
+ * +-----+-----+-----+-----+
+ *
+ * type: XEN_NETIF_EXTRA_TYPE_*
+ * flags: XEN_NETIF_EXTRA_FLAG_*
+ * padding for tx: present only in the tx case due to 8 octet limit
+ *                 from rx case. Not shown in type specific entries
+ *                 below.
+ *
+ * XEN_NETIF_EXTRA_TYPE_GSO:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |type |flags| size      |type | pad | features  |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * type: Must be XEN_NETIF_EXTRA_TYPE_GSO
+ * flags: XEN_NETIF_EXTRA_FLAG_*
+ * size: Maximum payload size of each segment. For example,
+ *       for TCP this is just the path MSS.
+ * type: XEN_NETIF_GSO_TYPE_*: This determines the protocol of
+ *       the packet and any extra features required to segment the
+ *       packet properly.
+ * features: EN_NETIF_GSO_FEAT_*: This specifies any extra GSO
+ *           features required to process this packet, such as ECN
+ *           support for TCPv4.
+ *
+ * XEN_NETIF_EXTRA_TYPE_MCAST_{ADD,DEL}:
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |type |flags| addr                              |
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * type: Must be XEN_NETIF_EXTRA_TYPE_MCAST_{ADD,DEL}
+ * flags: XEN_NETIF_EXTRA_FLAG_*
+ * addr: address to add/remove
+ *
+ * XEN_NETIF_EXTRA_TYPE_HASH:
+ *
+ * A backend that supports teoplitz hashing is assumed to accept
+ * this type of extra info in transmit packets.
+ * A frontend that enables hashing is assumed to accept
+ * this type of extra info in receive packets.
+ *
+ *    0     1     2     3     4     5     6     7  octet
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ * |type |flags|htype| alg |LSB ---- value ---- MSB|
+ * +-----+-----+-----+-----+-----+-----+-----+-----+
+ *
+ * type: Must be XEN_NETIF_EXTRA_TYPE_HASH
+ * flags: XEN_NETIF_EXTRA_FLAG_*
+ * htype: Hash type (one of _XEN_NETIF_CTRL_HASH_TYPE_* - see above)
+ * alg: The algorithm used to calculate the hash (one of
+ *      XEN_NETIF_CTRL_HASH_TYPE_ALGORITHM_* - see above)
+ * value: Hash value
+ */
+
+/* Protocol checksum field is blank in the packet (hardware offload)? */
+#define _NETTXF_csum_blank     (0)
+#define  NETTXF_csum_blank     (1U<<_NETTXF_csum_blank)
+
+/* Packet data has been validated against protocol checksum. */
+#define _NETTXF_data_validated (1)
+#define  NETTXF_data_validated (1U<<_NETTXF_data_validated)
+
+/* Packet continues in the next request descriptor. */
+#define _NETTXF_more_data      (2)
+#define  NETTXF_more_data      (1U<<_NETTXF_more_data)
+
+/* Packet to be followed by extra descriptor(s). */
+#define _NETTXF_extra_info     (3)
+#define  NETTXF_extra_info     (1U<<_NETTXF_extra_info)
+
+#define XEN_NETIF_MAX_TX_SIZE 0xFFFF
+struct netif_tx_request {
+    grant_ref_t gref;
+    uint16_t offset;
+    uint16_t flags;
+    uint16_t id;
+    uint16_t size;
+};
+typedef struct netif_tx_request netif_tx_request_t;
+
+/* Types of netif_extra_info descriptors. */
+#define XEN_NETIF_EXTRA_TYPE_NONE      (0)  /* Never used - invalid */
+#define XEN_NETIF_EXTRA_TYPE_GSO       (1)  /* u.gso */
+#define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
+#define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
+#define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
+#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
+
+/* netif_extra_info_t flags. */
+#define _XEN_NETIF_EXTRA_FLAG_MORE (0)
+#define XEN_NETIF_EXTRA_FLAG_MORE  (1U<<_XEN_NETIF_EXTRA_FLAG_MORE)
+
+/* GSO types */
+#define XEN_NETIF_GSO_TYPE_NONE         (0)
+#define XEN_NETIF_GSO_TYPE_TCPV4        (1)
+#define XEN_NETIF_GSO_TYPE_TCPV6        (2)
+
+/*
+ * This structure needs to fit within both netif_tx_request_t and
+ * netif_rx_response_t for compatibility.
+ */
+struct netif_extra_info {
+    uint8_t type;
+    uint8_t flags;
+    union {
+        struct {
+            uint16_t size;
+            uint8_t type;
+            uint8_t pad;
+            uint16_t features;
+        } gso;
+        struct {
+            uint8_t addr[6];
+        } mcast;
+        struct {
+            uint8_t type;
+            uint8_t algorithm;
+            uint8_t value[4];
+        } hash;
+        uint16_t pad[3];
+    } u;
+};
+typedef struct netif_extra_info netif_extra_info_t;
+
+struct netif_tx_response {
+    uint16_t id;
+    int16_t  status;
+};
+typedef struct netif_tx_response netif_tx_response_t;
+
+struct netif_rx_request {
+    uint16_t    id;        /* Echoed in response message.        */
+    uint16_t    pad;
+    grant_ref_t gref;
+};
+typedef struct netif_rx_request netif_rx_request_t;
+
+/* Packet data has been validated against protocol checksum. */
+#define _NETRXF_data_validated (0)
+#define  NETRXF_data_validated (1U<<_NETRXF_data_validated)
+
+/* Protocol checksum field is blank in the packet (hardware offload)? */
+#define _NETRXF_csum_blank     (1)
+#define  NETRXF_csum_blank     (1U<<_NETRXF_csum_blank)
+
+/* Packet continues in the next request descriptor. */
+#define _NETRXF_more_data      (2)
+#define  NETRXF_more_data      (1U<<_NETRXF_more_data)
+
+/* Packet to be followed by extra descriptor(s). */
+#define _NETRXF_extra_info     (3)
+#define  NETRXF_extra_info     (1U<<_NETRXF_extra_info)
+
+/* Packet has GSO prefix. Deprecated but included for compatibility */
+#define _NETRXF_gso_prefix     (4)
+#define  NETRXF_gso_prefix     (1U<<_NETRXF_gso_prefix)
+
+struct netif_rx_response {
+    uint16_t id;
+    uint16_t offset;
+    uint16_t flags;
+    int16_t  status;
+};
+typedef struct netif_rx_response netif_rx_response_t;
+
+/*
+ * Generate netif ring structures and types.
+ */
+
+DEFINE_RING_TYPES(netif_tx, struct netif_tx_request, struct netif_tx_response);
+DEFINE_RING_TYPES(netif_rx, struct netif_rx_request, struct netif_rx_response);
+
+#define NETIF_RSP_DROPPED         -2
+#define NETIF_RSP_ERROR           -1
+#define NETIF_RSP_OKAY             0
+/* No response: used for auxiliary requests (e.g., netif_extra_info_t). */
+#define NETIF_RSP_NULL             1
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/protocols.h b/include/standard-headers/xen/io/protocols.h
new file mode 100644
index 0000000000..52b4de0f81
--- /dev/null
+++ b/include/standard-headers/xen/io/protocols.h
@@ -0,0 +1,42 @@
+/******************************************************************************
+ * protocols.h
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2008, Keir Fraser
+ */
+
+#ifndef __XEN_PROTOCOLS_H__
+#define __XEN_PROTOCOLS_H__
+
+#define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
+#define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
+#define XEN_IO_PROTO_ABI_ARM        "arm-abi"
+
+#if defined(__i386__)
+# define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_X86_32
+#elif defined(__x86_64__)
+# define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_X86_64
+#elif defined(__arm__) || defined(__aarch64__)
+# define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_ARM
+#else
+# error arch fixup needed here
+#endif
+
+#endif
diff --git a/include/standard-headers/xen/io/ring.h b/include/standard-headers/xen/io/ring.h
new file mode 100644
index 0000000000..c486c457e0
--- /dev/null
+++ b/include/standard-headers/xen/io/ring.h
@@ -0,0 +1,495 @@
+/******************************************************************************
+ * ring.h
+ *
+ * Shared producer-consumer ring macros.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Tim Deegan and Andrew Warfield November 2004.
+ */
+
+#ifndef __XEN_PUBLIC_IO_RING_H__
+#define __XEN_PUBLIC_IO_RING_H__
+
+/*
+ * When #include'ing this header, you need to provide the following
+ * declaration upfront:
+ * - standard integers types (uint8_t, uint16_t, etc)
+ * They are provided by stdint.h of the standard headers.
+ *
+ * In addition, if you intend to use the FLEX macros, you also need to
+ * provide the following, before invoking the FLEX macros:
+ * - size_t
+ * - memcpy
+ * - grant_ref_t
+ * These declarations are provided by string.h of the standard headers,
+ * and grant_table.h from the Xen public headers.
+ */
+
+#include "../xen-compat.h"
+
+#if __XEN_INTERFACE_VERSION__ < 0x00030208
+#define xen_mb()  mb()
+#define xen_rmb() rmb()
+#define xen_wmb() wmb()
+#endif
+
+typedef unsigned int RING_IDX;
+
+/* Round a 32-bit unsigned constant down to the nearest power of two. */
+#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
+#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
+#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
+#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
+#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
+
+/*
+ * Calculate size of a shared ring, given the total available space for the
+ * ring and indexes (_sz), and the name tag of the request/response structure.
+ * A ring contains as many entries as will fit, rounded down to the nearest
+ * power of two (so we can mask with (size-1) to loop around).
+ */
+#define __CONST_RING_SIZE(_s, _sz) \
+    (__RD32(((_sz) - offsetof(struct _s##_sring, ring)) / \
+	    sizeof(((struct _s##_sring *)0)->ring[0])))
+/*
+ * The same for passing in an actual pointer instead of a name tag.
+ */
+#define __RING_SIZE(_s, _sz) \
+    (__RD32(((_sz) - (long)(_s)->ring + (long)(_s)) / sizeof((_s)->ring[0])))
+
+/*
+ * Macros to make the correct C datatypes for a new kind of ring.
+ *
+ * To make a new ring datatype, you need to have two message structures,
+ * let's say request_t, and response_t already defined.
+ *
+ * In a header where you want the ring datatype declared, you then do:
+ *
+ *     DEFINE_RING_TYPES(mytag, request_t, response_t);
+ *
+ * These expand out to give you a set of types, as you can see below.
+ * The most important of these are:
+ *
+ *     mytag_sring_t      - The shared ring.
+ *     mytag_front_ring_t - The 'front' half of the ring.
+ *     mytag_back_ring_t  - The 'back' half of the ring.
+ *
+ * To initialize a ring in your code you need to know the location and size
+ * of the shared memory area (PAGE_SIZE, for instance). To initialise
+ * the front half:
+ *
+ *     mytag_front_ring_t front_ring;
+ *     SHARED_RING_INIT((mytag_sring_t *)shared_page);
+ *     FRONT_RING_INIT(&front_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
+ *
+ * Initializing the back follows similarly (note that only the front
+ * initializes the shared ring):
+ *
+ *     mytag_back_ring_t back_ring;
+ *     BACK_RING_INIT(&back_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
+ */
+
+#define DEFINE_RING_TYPES(__name, __req_t, __rsp_t)                     \
+                                                                        \
+/* Shared ring entry */                                                 \
+union __name##_sring_entry {                                            \
+    __req_t req;                                                        \
+    __rsp_t rsp;                                                        \
+};                                                                      \
+                                                                        \
+/* Shared ring page */                                                  \
+struct __name##_sring {                                                 \
+    RING_IDX req_prod, req_event;                                       \
+    RING_IDX rsp_prod, rsp_event;                                       \
+    union {                                                             \
+        struct {                                                        \
+            uint8_t smartpoll_active;                                   \
+        } netif;                                                        \
+        struct {                                                        \
+            uint8_t msg;                                                \
+        } tapif_user;                                                   \
+        uint8_t pvt_pad[4];                                             \
+    } pvt;                                                              \
+    uint8_t __pad[44];                                                  \
+    union __name##_sring_entry ring[1]; /* variable-length */           \
+};                                                                      \
+                                                                        \
+/* "Front" end's private variables */                                   \
+struct __name##_front_ring {                                            \
+    RING_IDX req_prod_pvt;                                              \
+    RING_IDX rsp_cons;                                                  \
+    unsigned int nr_ents;                                               \
+    struct __name##_sring *sring;                                       \
+};                                                                      \
+                                                                        \
+/* "Back" end's private variables */                                    \
+struct __name##_back_ring {                                             \
+    RING_IDX rsp_prod_pvt;                                              \
+    RING_IDX req_cons;                                                  \
+    unsigned int nr_ents;                                               \
+    struct __name##_sring *sring;                                       \
+};                                                                      \
+                                                                        \
+/* Syntactic sugar */                                                   \
+typedef struct __name##_sring __name##_sring_t;                         \
+typedef struct __name##_front_ring __name##_front_ring_t;               \
+typedef struct __name##_back_ring __name##_back_ring_t
+
+/*
+ * Macros for manipulating rings.
+ *
+ * FRONT_RING_whatever works on the "front end" of a ring: here
+ * requests are pushed on to the ring and responses taken off it.
+ *
+ * BACK_RING_whatever works on the "back end" of a ring: here
+ * requests are taken off the ring and responses put on.
+ *
+ * N.B. these macros do NO INTERLOCKS OR FLOW CONTROL.
+ * This is OK in 1-for-1 request-response situations where the
+ * requestor (front end) never has more than RING_SIZE()-1
+ * outstanding requests.
+ */
+
+/* Initialising empty rings */
+#define SHARED_RING_INIT(_s) do {                                       \
+    (_s)->req_prod  = (_s)->rsp_prod  = 0;                              \
+    (_s)->req_event = (_s)->rsp_event = 1;                              \
+    (void)memset((_s)->pvt.pvt_pad, 0, sizeof((_s)->pvt.pvt_pad));      \
+    (void)memset((_s)->__pad, 0, sizeof((_s)->__pad));                  \
+} while(0)
+
+#define FRONT_RING_ATTACH(_r, _s, _i, __size) do {                      \
+    (_r)->req_prod_pvt = (_i);                                          \
+    (_r)->rsp_cons = (_i);                                              \
+    (_r)->nr_ents = __RING_SIZE(_s, __size);                            \
+    (_r)->sring = (_s);                                                 \
+} while (0)
+
+#define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
+
+#define BACK_RING_ATTACH(_r, _s, _i, __size) do {                       \
+    (_r)->rsp_prod_pvt = (_i);                                          \
+    (_r)->req_cons = (_i);                                              \
+    (_r)->nr_ents = __RING_SIZE(_s, __size);                            \
+    (_r)->sring = (_s);                                                 \
+} while (0)
+
+#define BACK_RING_INIT(_r, _s, __size) BACK_RING_ATTACH(_r, _s, 0, __size)
+
+/* How big is this ring? */
+#define RING_SIZE(_r)                                                   \
+    ((_r)->nr_ents)
+
+/* Number of free requests (for use on front side only). */
+#define RING_FREE_REQUESTS(_r)                                          \
+    (RING_SIZE(_r) - ((_r)->req_prod_pvt - (_r)->rsp_cons))
+
+/* Test if there is an empty slot available on the front ring.
+ * (This is only meaningful from the front. )
+ */
+#define RING_FULL(_r)                                                   \
+    (RING_FREE_REQUESTS(_r) == 0)
+
+/* Test if there are outstanding messages to be processed on a ring. */
+#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
+    ((_r)->sring->rsp_prod - (_r)->rsp_cons)
+
+#ifdef __GNUC__
+#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
+    unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
+    unsigned int rsp = RING_SIZE(_r) -                                  \
+        ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
+    req < rsp ? req : rsp;                                              \
+})
+#else
+/* Same as above, but without the nice GCC ({ ... }) syntax. */
+#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                \
+    ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
+      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
+     ((_r)->sring->req_prod - (_r)->req_cons) :                         \
+     (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
+#endif
+
+/* Direct access to individual ring elements, by index. */
+#define RING_GET_REQUEST(_r, _idx)                                      \
+    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
+
+#define RING_GET_RESPONSE(_r, _idx)                                     \
+    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
+
+/*
+ * Get a local copy of a request/response.
+ *
+ * Use this in preference to RING_GET_{REQUEST,RESPONSE}() so all processing is
+ * done on a local copy that cannot be modified by the other end.
+ *
+ * Note that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 may cause this
+ * to be ineffective where dest is a struct which consists of only bitfields.
+ */
+#define RING_COPY_(type, r, idx, dest) do {				\
+	/* Use volatile to force the copy into dest. */			\
+	*(dest) = *(volatile __typeof__(dest))RING_GET_##type(r, idx);	\
+} while (0)
+
+#define RING_COPY_REQUEST(r, idx, req)  RING_COPY_(REQUEST, r, idx, req)
+#define RING_COPY_RESPONSE(r, idx, rsp) RING_COPY_(RESPONSE, r, idx, rsp)
+
+/* Loop termination condition: Would the specified index overflow the ring? */
+#define RING_REQUEST_CONS_OVERFLOW(_r, _cons)                           \
+    (((_cons) - (_r)->rsp_prod_pvt) >= RING_SIZE(_r))
+
+/* Ill-behaved frontend determination: Can there be this many requests? */
+#define RING_REQUEST_PROD_OVERFLOW(_r, _prod)                           \
+    (((_prod) - (_r)->rsp_prod_pvt) > RING_SIZE(_r))
+
+/* Ill-behaved backend determination: Can there be this many responses? */
+#define RING_RESPONSE_PROD_OVERFLOW(_r, _prod)                          \
+    (((_prod) - (_r)->rsp_cons) > RING_SIZE(_r))
+
+#define RING_PUSH_REQUESTS(_r) do {                                     \
+    xen_wmb(); /* back sees requests /before/ updated producer index */ \
+    (_r)->sring->req_prod = (_r)->req_prod_pvt;                         \
+} while (0)
+
+#define RING_PUSH_RESPONSES(_r) do {                                    \
+    xen_wmb(); /* front sees resps /before/ updated producer index */   \
+    (_r)->sring->rsp_prod = (_r)->rsp_prod_pvt;                         \
+} while (0)
+
+/*
+ * Notification hold-off (req_event and rsp_event):
+ *
+ * When queueing requests or responses on a shared ring, it may not always be
+ * necessary to notify the remote end. For example, if requests are in flight
+ * in a backend, the front may be able to queue further requests without
+ * notifying the back (if the back checks for new requests when it queues
+ * responses).
+ *
+ * When enqueuing requests or responses:
+ *
+ *  Use RING_PUSH_{REQUESTS,RESPONSES}_AND_CHECK_NOTIFY(). The second argument
+ *  is a boolean return value. True indicates that the receiver requires an
+ *  asynchronous notification.
+ *
+ * After dequeuing requests or responses (before sleeping the connection):
+ *
+ *  Use RING_FINAL_CHECK_FOR_REQUESTS() or RING_FINAL_CHECK_FOR_RESPONSES().
+ *  The second argument is a boolean return value. True indicates that there
+ *  are pending messages on the ring (i.e., the connection should not be put
+ *  to sleep).
+ *
+ *  These macros will set the req_event/rsp_event field to trigger a
+ *  notification on the very next message that is enqueued. If you want to
+ *  create batches of work (i.e., only receive a notification after several
+ *  messages have been enqueued) then you will need to create a customised
+ *  version of the FINAL_CHECK macro in your own code, which sets the event
+ *  field appropriately.
+ */
+
+#define RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(_r, _notify) do {           \
+    RING_IDX __old = (_r)->sring->req_prod;                             \
+    RING_IDX __new = (_r)->req_prod_pvt;                                \
+    xen_wmb(); /* back sees requests /before/ updated producer index */ \
+    (_r)->sring->req_prod = __new;                                      \
+    xen_mb(); /* back sees new requests /before/ we check req_event */  \
+    (_notify) = ((RING_IDX)(__new - (_r)->sring->req_event) <           \
+                 (RING_IDX)(__new - __old));                            \
+} while (0)
+
+#define RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(_r, _notify) do {          \
+    RING_IDX __old = (_r)->sring->rsp_prod;                             \
+    RING_IDX __new = (_r)->rsp_prod_pvt;                                \
+    xen_wmb(); /* front sees resps /before/ updated producer index */   \
+    (_r)->sring->rsp_prod = __new;                                      \
+    xen_mb(); /* front sees new resps /before/ we check rsp_event */    \
+    (_notify) = ((RING_IDX)(__new - (_r)->sring->rsp_event) <           \
+                 (RING_IDX)(__new - __old));                            \
+} while (0)
+
+#define RING_FINAL_CHECK_FOR_REQUESTS(_r, _work_to_do) do {             \
+    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);                   \
+    if (_work_to_do) break;                                             \
+    (_r)->sring->req_event = (_r)->req_cons + 1;                        \
+    xen_mb();                                                           \
+    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);                   \
+} while (0)
+
+#define RING_FINAL_CHECK_FOR_RESPONSES(_r, _work_to_do) do {            \
+    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);                  \
+    if (_work_to_do) break;                                             \
+    (_r)->sring->rsp_event = (_r)->rsp_cons + 1;                        \
+    xen_mb();                                                           \
+    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);                  \
+} while (0)
+
+
+/*
+ * DEFINE_XEN_FLEX_RING_AND_INTF defines two monodirectional rings and
+ * functions to check if there is data on the ring, and to read and
+ * write to them.
+ *
+ * DEFINE_XEN_FLEX_RING is similar to DEFINE_XEN_FLEX_RING_AND_INTF, but
+ * does not define the indexes page. As different protocols can have
+ * extensions to the basic format, this macro allow them to define their
+ * own struct.
+ *
+ * XEN_FLEX_RING_SIZE
+ *   Convenience macro to calculate the size of one of the two rings
+ *   from the overall order.
+ *
+ * $NAME_mask
+ *   Function to apply the size mask to an index, to reduce the index
+ *   within the range [0-size].
+ *
+ * $NAME_read_packet
+ *   Function to read data from the ring. The amount of data to read is
+ *   specified by the "size" argument.
+ *
+ * $NAME_write_packet
+ *   Function to write data to the ring. The amount of data to write is
+ *   specified by the "size" argument.
+ *
+ * $NAME_get_ring_ptr
+ *   Convenience function that returns a pointer to read/write to the
+ *   ring at the right location.
+ *
+ * $NAME_data_intf
+ *   Indexes page, shared between frontend and backend. It also
+ *   contains the array of grant refs.
+ *
+ * $NAME_queued
+ *   Function to calculate how many bytes are currently on the ring,
+ *   ready to be read. It can also be used to calculate how much free
+ *   space is currently on the ring (XEN_FLEX_RING_SIZE() -
+ *   $NAME_queued()).
+ */
+
+#ifndef XEN_PAGE_SHIFT
+/* The PAGE_SIZE for ring protocols and hypercall interfaces is always
+ * 4K, regardless of the architecture, and page granularity chosen by
+ * operating systems.
+ */
+#define XEN_PAGE_SHIFT 12
+#endif
+#define XEN_FLEX_RING_SIZE(order)                                             \
+    (1UL << ((order) + XEN_PAGE_SHIFT - 1))
+
+#define DEFINE_XEN_FLEX_RING(name)                                            \
+static inline RING_IDX name##_mask(RING_IDX idx, RING_IDX ring_size)          \
+{                                                                             \
+    return idx & (ring_size - 1);                                             \
+}                                                                             \
+                                                                              \
+static inline unsigned char *name##_get_ring_ptr(unsigned char *buf,          \
+                                                 RING_IDX idx,                \
+                                                 RING_IDX ring_size)          \
+{                                                                             \
+    return buf + name##_mask(idx, ring_size);                                 \
+}                                                                             \
+                                                                              \
+static inline void name##_read_packet(void *opaque,                           \
+                                      const unsigned char *buf,               \
+                                      size_t size,                            \
+                                      RING_IDX masked_prod,                   \
+                                      RING_IDX *masked_cons,                  \
+                                      RING_IDX ring_size)                     \
+{                                                                             \
+    if (*masked_cons < masked_prod ||                                         \
+        size <= ring_size - *masked_cons) {                                   \
+        memcpy(opaque, buf + *masked_cons, size);                             \
+    } else {                                                                  \
+        memcpy(opaque, buf + *masked_cons, ring_size - *masked_cons);         \
+        memcpy((unsigned char *)opaque + ring_size - *masked_cons, buf,       \
+               size - (ring_size - *masked_cons));                            \
+    }                                                                         \
+    *masked_cons = name##_mask(*masked_cons + size, ring_size);               \
+}                                                                             \
+                                                                              \
+static inline void name##_write_packet(unsigned char *buf,                    \
+                                       const void *opaque,                    \
+                                       size_t size,                           \
+                                       RING_IDX *masked_prod,                 \
+                                       RING_IDX masked_cons,                  \
+                                       RING_IDX ring_size)                    \
+{                                                                             \
+    if (*masked_prod < masked_cons ||                                         \
+        size <= ring_size - *masked_prod) {                                   \
+        memcpy(buf + *masked_prod, opaque, size);                             \
+    } else {                                                                  \
+        memcpy(buf + *masked_prod, opaque, ring_size - *masked_prod);         \
+        memcpy(buf, (unsigned char *)opaque + (ring_size - *masked_prod),     \
+               size - (ring_size - *masked_prod));                            \
+    }                                                                         \
+    *masked_prod = name##_mask(*masked_prod + size, ring_size);               \
+}                                                                             \
+                                                                              \
+static inline RING_IDX name##_queued(RING_IDX prod,                           \
+                                     RING_IDX cons,                           \
+                                     RING_IDX ring_size)                      \
+{                                                                             \
+    RING_IDX size;                                                            \
+                                                                              \
+    if (prod == cons)                                                         \
+        return 0;                                                             \
+                                                                              \
+    prod = name##_mask(prod, ring_size);                                      \
+    cons = name##_mask(cons, ring_size);                                      \
+                                                                              \
+    if (prod == cons)                                                         \
+        return ring_size;                                                     \
+                                                                              \
+    if (prod > cons)                                                          \
+        size = prod - cons;                                                   \
+    else                                                                      \
+        size = ring_size - (cons - prod);                                     \
+    return size;                                                              \
+}                                                                             \
+                                                                              \
+struct name##_data {                                                          \
+    unsigned char *in; /* half of the allocation */                           \
+    unsigned char *out; /* half of the allocation */                          \
+}
+
+#define DEFINE_XEN_FLEX_RING_AND_INTF(name)                                   \
+struct name##_data_intf {                                                     \
+    RING_IDX in_cons, in_prod;                                                \
+                                                                              \
+    uint8_t pad1[56];                                                         \
+                                                                              \
+    RING_IDX out_cons, out_prod;                                              \
+                                                                              \
+    uint8_t pad2[56];                                                         \
+                                                                              \
+    RING_IDX ring_order;                                                      \
+    grant_ref_t ref[];                                                        \
+};                                                                            \
+DEFINE_XEN_FLEX_RING(name)
+
+#endif /* __XEN_PUBLIC_IO_RING_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/usbif.h b/include/standard-headers/xen/io/usbif.h
new file mode 100644
index 0000000000..c0a552e195
--- /dev/null
+++ b/include/standard-headers/xen/io/usbif.h
@@ -0,0 +1,425 @@
+/*
+ * usbif.h
+ *
+ * USB I/O interface for Xen guest OSes.
+ *
+ * Copyright (C) 2009, FUJITSU LABORATORIES LTD.
+ * Author: Noboru Iwamatsu <n_iwamatsu@jp.fujitsu.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __XEN_PUBLIC_IO_USBIF_H__
+#define __XEN_PUBLIC_IO_USBIF_H__
+
+#include "ring.h"
+#include "../grant_table.h"
+
+/*
+ * Detailed Interface Description
+ * ==============================
+ * The pvUSB interface is using a split driver design: a frontend driver in
+ * the guest and a backend driver in a driver domain (normally dom0) having
+ * access to the physical USB device(s) being passed to the guest.
+ *
+ * The frontend and backend drivers use XenStore to initiate the connection
+ * between them, the I/O activity is handled via two shared ring pages and an
+ * event channel. As the interface between frontend and backend is at the USB
+ * host connector level, multiple (up to 31) physical USB devices can be
+ * handled by a single connection.
+ *
+ * The Xen pvUSB device name is "qusb", so the frontend's XenStore entries are
+ * to be found under "device/qusb", while the backend's XenStore entries are
+ * under "backend/<guest-dom-id>/qusb".
+ *
+ * When a new pvUSB connection is established, the frontend needs to setup the
+ * two shared ring pages for communication and the event channel. The ring
+ * pages need to be made available to the backend via the grant table
+ * interface.
+ *
+ * One of the shared ring pages is used by the backend to inform the frontend
+ * about USB device plug events (device to be added or removed). This is the
+ * "conn-ring".
+ *
+ * The other ring page is used for USB I/O communication (requests and
+ * responses). This is the "urb-ring".
+ *
+ * Feature and Parameter Negotiation
+ * =================================
+ * The two halves of a Xen pvUSB driver utilize nodes within the XenStore to
+ * communicate capabilities and to negotiate operating parameters. This
+ * section enumerates these nodes which reside in the respective front and
+ * backend portions of the XenStore, following the XenBus convention.
+ *
+ * Any specified default value is in effect if the corresponding XenBus node
+ * is not present in the XenStore.
+ *
+ * XenStore nodes in sections marked "PRIVATE" are solely for use by the
+ * driver side whose XenBus tree contains them.
+ *
+ *****************************************************************************
+ *                            Backend XenBus Nodes
+ *****************************************************************************
+ *
+ *------------------ Backend Device Identification (PRIVATE) ------------------
+ *
+ * num-ports
+ *      Values:         unsigned [1...31]
+ *
+ *      Number of ports for this (virtual) USB host connector.
+ *
+ * usb-ver
+ *      Values:         unsigned [1...2]
+ *
+ *      USB version of this host connector: 1 = USB 1.1, 2 = USB 2.0.
+ *
+ * port/[1...31]
+ *      Values:         string
+ *
+ *      Physical USB device connected to the given port, e.g. "3-1.5".
+ *
+ *****************************************************************************
+ *                            Frontend XenBus Nodes
+ *****************************************************************************
+ *
+ *----------------------- Request Transport Parameters -----------------------
+ *
+ * event-channel
+ *      Values:         unsigned
+ *
+ *      The identifier of the Xen event channel used to signal activity
+ *      in the ring buffer.
+ *
+ * urb-ring-ref
+ *      Values:         unsigned
+ *
+ *      The Xen grant reference granting permission for the backend to map
+ *      the sole page in a single page sized ring buffer. This is the ring
+ *      buffer for urb requests.
+ *
+ * conn-ring-ref
+ *      Values:         unsigned
+ *
+ *      The Xen grant reference granting permission for the backend to map
+ *      the sole page in a single page sized ring buffer. This is the ring
+ *      buffer for connection/disconnection requests.
+ *
+ * protocol
+ *      Values:         string (XEN_IO_PROTO_ABI_*)
+ *      Default Value:  XEN_IO_PROTO_ABI_NATIVE
+ *
+ *      The machine ABI rules governing the format of all ring request and
+ *      response structures.
+ *
+ * Protocol Description
+ * ====================
+ *
+ *-------------------------- USB device plug events --------------------------
+ *
+ * USB device plug events are send via the "conn-ring" shared page. As only
+ * events are being sent, the respective requests from the frontend to the
+ * backend are just dummy ones.
+ * The events sent to the frontend have the following layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |    portnum     |     speed      | 4
+ * +----------------+----------------+----------------+----------------+
+ *   id - uint16_t, event id (taken from the actual frontend dummy request)
+ *   portnum - uint8_t, port number (1 ... 31)
+ *   speed - uint8_t, device USBIF_SPEED_*, USBIF_SPEED_NONE == unplug
+ *
+ * The dummy request:
+ *         0                1        octet
+ * +----------------+----------------+
+ * |               id                | 2
+ * +----------------+----------------+
+ *   id - uint16_t, guest supplied value (no need for being unique)
+ *
+ *-------------------------- USB I/O request ---------------------------------
+ *
+ * A single USB I/O request on the "urb-ring" has the following layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |         nr_buffer_segs          | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                               pipe                                | 8
+ * +----------------+----------------+----------------+----------------+
+ * |         transfer_flags          |          buffer_length          | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                       request type specific                       | 16
+ * |                               data                                | 20
+ * +----------------+----------------+----------------+----------------+
+ * |                              seg[0]                               | 24
+ * |                               data                                | 28
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |             seg[USBIF_MAX_SEGMENTS_PER_REQUEST - 1]               | 144
+ * |                               data                                | 148
+ * +----------------+----------------+----------------+----------------+
+ * Bit field bit number 0 is always least significant bit, undefined bits must
+ * be zero.
+ *   id - uint16_t, guest supplied value
+ *   nr_buffer_segs - uint16_t, number of segment entries in seg[] array
+ *   pipe - uint32_t, bit field with multiple information:
+ *     bits 0-4: port request to send to
+ *     bit 5: unlink request with specified id (cancel I/O) if set (see below)
+ *     bit 7: direction (1 = read from device)
+ *     bits 8-14: device number on port
+ *     bits 15-18: endpoint of device
+ *     bits 30-31: request type: 00 = isochronous, 01 = interrupt,
+ *                               10 = control, 11 = bulk
+ *   transfer_flags - uint16_t, bit field with processing flags:
+ *     bit 0: less data than specified allowed
+ *   buffer_length - uint16_t, total length of data
+ *   request type specific data - 8 bytes, see below
+ *   seg[] - array with 8 byte elements, see below
+ *
+ * Request type specific data for isochronous request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |            interval             |           start_frame           | 4
+ * +----------------+----------------+----------------+----------------+
+ * |       number_of_packets         |       nr_frame_desc_segs        | 8
+ * +----------------+----------------+----------------+----------------+
+ *   interval - uint16_t, time interval in msecs between frames
+ *   start_frame - uint16_t, start frame number
+ *   number_of_packets - uint16_t, number of packets to transfer
+ *   nr_frame_desc_segs - uint16_t number of seg[] frame descriptors elements
+ *
+ * Request type specific data for interrupt request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |            interval             |                0                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *   interval - uint16_t, time in msecs until interruption
+ *
+ * Request type specific data for control request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                      data of setup packet                         | 4
+ * |                                                                   | 8
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Request type specific data for bulk request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 4
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Request type specific data for unlink request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |           unlink_id             |                0                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *   unlink_id - uint16_t, request id of request to terminate
+ *
+ * seg[] array element layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                               gref                                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |             offset              |             length              | 8
+ * +----------------+----------------+----------------+----------------+
+ *   gref - uint32_t, grant reference of buffer page
+ *   offset - uint16_t, offset of buffer start in page
+ *   length - uint16_t, length of buffer in page
+ *
+ *-------------------------- USB I/O response --------------------------------
+ *
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |          start_frame            | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                              status                               | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                          actual_length                            | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                           error_count                             | 16
+ * +----------------+----------------+----------------+----------------+
+ *   id - uint16_t, id of the request this response belongs to
+ *   start_frame - uint16_t, start_frame this response (iso requests only)
+ *   status - int32_t, USBIF_STATUS_* (non-iso requests)
+ *   actual_length - uint32_t, actual size of data transferred
+ *   error_count - uint32_t, number of errors (iso requests)
+ */
+
+enum usb_spec_version {
+    USB_VER_UNKNOWN = 0,
+    USB_VER_USB11,
+    USB_VER_USB20,
+    USB_VER_USB30,    /* not supported yet */
+};
+
+/*
+ *  USB pipe in usbif_request
+ *
+ *  - port number:      bits 0-4
+ *                              (USB_MAXCHILDREN is 31)
+ *
+ *  - operation flag:   bit 5
+ *                              (0 = submit urb,
+ *                               1 = unlink urb)
+ *
+ *  - direction:        bit 7
+ *                              (0 = Host-to-Device [Out]
+ *                               1 = Device-to-Host [In])
+ *
+ *  - device address:   bits 8-14
+ *
+ *  - endpoint:         bits 15-18
+ *
+ *  - pipe type:        bits 30-31
+ *                              (00 = isochronous, 01 = interrupt,
+ *                               10 = control, 11 = bulk)
+ */
+
+#define USBIF_PIPE_PORT_MASK    0x0000001f
+#define USBIF_PIPE_UNLINK       0x00000020
+#define USBIF_PIPE_DIR          0x00000080
+#define USBIF_PIPE_DEV_MASK     0x0000007f
+#define USBIF_PIPE_DEV_SHIFT    8
+#define USBIF_PIPE_EP_MASK      0x0000000f
+#define USBIF_PIPE_EP_SHIFT     15
+#define USBIF_PIPE_TYPE_MASK    0x00000003
+#define USBIF_PIPE_TYPE_SHIFT   30
+#define USBIF_PIPE_TYPE_ISOC    0
+#define USBIF_PIPE_TYPE_INT     1
+#define USBIF_PIPE_TYPE_CTRL    2
+#define USBIF_PIPE_TYPE_BULK    3
+
+#define usbif_pipeportnum(pipe)                 ((pipe) & USBIF_PIPE_PORT_MASK)
+#define usbif_setportnum_pipe(pipe, portnum)    ((pipe) | (portnum))
+
+#define usbif_pipeunlink(pipe)                  ((pipe) & USBIF_PIPE_UNLINK)
+#define usbif_pipesubmit(pipe)                  (!usbif_pipeunlink(pipe))
+#define usbif_setunlink_pipe(pipe)              ((pipe) | USBIF_PIPE_UNLINK)
+
+#define usbif_pipein(pipe)                      ((pipe) & USBIF_PIPE_DIR)
+#define usbif_pipeout(pipe)                     (!usbif_pipein(pipe))
+
+#define usbif_pipedevice(pipe)                  \
+        (((pipe) >> USBIF_PIPE_DEV_SHIFT) & USBIF_PIPE_DEV_MASK)
+
+#define usbif_pipeendpoint(pipe)                \
+        (((pipe) >> USBIF_PIPE_EP_SHIFT) & USBIF_PIPE_EP_MASK)
+
+#define usbif_pipetype(pipe)                    \
+        (((pipe) >> USBIF_PIPE_TYPE_SHIFT) & USBIF_PIPE_TYPE_MASK)
+#define usbif_pipeisoc(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_ISOC)
+#define usbif_pipeint(pipe)     (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_INT)
+#define usbif_pipectrl(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_CTRL)
+#define usbif_pipebulk(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_BULK)
+
+#define USBIF_MAX_SEGMENTS_PER_REQUEST (16)
+#define USBIF_MAX_PORTNR        31
+#define USBIF_RING_SIZE         4096
+
+/*
+ * RING for transferring urbs.
+ */
+struct usbif_request_segment {
+    grant_ref_t gref;
+    uint16_t offset;
+    uint16_t length;
+};
+
+struct usbif_urb_request {
+    uint16_t id;                  /* request id */
+    uint16_t nr_buffer_segs;      /* number of urb->transfer_buffer segments */
+
+    /* basic urb parameter */
+    uint32_t pipe;
+    uint16_t transfer_flags;
+#define USBIF_SHORT_NOT_OK      0x0001
+    uint16_t buffer_length;
+    union {
+        uint8_t ctrl[8];                 /* setup_packet (Ctrl) */
+
+        struct {
+            uint16_t interval;           /* maximum (1024*8) in usb core */
+            uint16_t start_frame;        /* start frame */
+            uint16_t number_of_packets;  /* number of ISO packet */
+            uint16_t nr_frame_desc_segs; /* number of iso_frame_desc segments */
+        } isoc;
+
+        struct {
+            uint16_t interval;           /* maximum (1024*8) in usb core */
+            uint16_t pad[3];
+        } intr;
+
+        struct {
+            uint16_t unlink_id;          /* unlink request id */
+            uint16_t pad[3];
+        } unlink;
+
+    } u;
+
+    /* urb data segments */
+    struct usbif_request_segment seg[USBIF_MAX_SEGMENTS_PER_REQUEST];
+};
+typedef struct usbif_urb_request usbif_urb_request_t;
+
+struct usbif_urb_response {
+    uint16_t id;           /* request id */
+    uint16_t start_frame;  /* start frame (ISO) */
+    int32_t status;        /* status (non-ISO) */
+#define USBIF_STATUS_OK         0
+#define USBIF_STATUS_NODEV      (-19)
+#define USBIF_STATUS_INVAL      (-22)
+#define USBIF_STATUS_STALL      (-32)
+#define USBIF_STATUS_IOERROR    (-71)
+#define USBIF_STATUS_BABBLE     (-75)
+#define USBIF_STATUS_SHUTDOWN   (-108)
+    int32_t actual_length; /* actual transfer length */
+    int32_t error_count;   /* number of ISO errors */
+};
+typedef struct usbif_urb_response usbif_urb_response_t;
+
+DEFINE_RING_TYPES(usbif_urb, struct usbif_urb_request, struct usbif_urb_response);
+#define USB_URB_RING_SIZE __CONST_RING_SIZE(usbif_urb, USBIF_RING_SIZE)
+
+/*
+ * RING for notifying connect/disconnect events to frontend
+ */
+struct usbif_conn_request {
+    uint16_t id;
+};
+typedef struct usbif_conn_request usbif_conn_request_t;
+
+struct usbif_conn_response {
+    uint16_t id;           /* request id */
+    uint8_t portnum;       /* port number */
+    uint8_t speed;         /* usb_device_speed */
+#define USBIF_SPEED_NONE        0
+#define USBIF_SPEED_LOW         1
+#define USBIF_SPEED_FULL        2
+#define USBIF_SPEED_HIGH        3
+};
+typedef struct usbif_conn_response usbif_conn_response_t;
+
+DEFINE_RING_TYPES(usbif_conn, struct usbif_conn_request, struct usbif_conn_response);
+#define USB_CONN_RING_SIZE __CONST_RING_SIZE(usbif_conn, USBIF_RING_SIZE)
+
+#endif /* __XEN_PUBLIC_IO_USBIF_H__ */
diff --git a/include/standard-headers/xen/io/xenbus.h b/include/standard-headers/xen/io/xenbus.h
new file mode 100644
index 0000000000..927f9db552
--- /dev/null
+++ b/include/standard-headers/xen/io/xenbus.h
@@ -0,0 +1,80 @@
+/*****************************************************************************
+ * xenbus.h
+ *
+ * Xenbus protocol details.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (C) 2005 XenSource Ltd.
+ */
+
+#ifndef _XEN_PUBLIC_IO_XENBUS_H
+#define _XEN_PUBLIC_IO_XENBUS_H
+
+/*
+ * The state of either end of the Xenbus, i.e. the current communication
+ * status of initialisation across the bus.  States here imply nothing about
+ * the state of the connection between the driver and the kernel's device
+ * layers.
+ */
+enum xenbus_state {
+    XenbusStateUnknown       = 0,
+
+    XenbusStateInitialising  = 1,
+
+    /*
+     * InitWait: Finished early initialisation but waiting for information
+     * from the peer or hotplug scripts.
+     */
+    XenbusStateInitWait      = 2,
+
+    /*
+     * Initialised: Waiting for a connection from the peer.
+     */
+    XenbusStateInitialised   = 3,
+
+    XenbusStateConnected     = 4,
+
+    /*
+     * Closing: The device is being closed due to an error or an unplug event.
+     */
+    XenbusStateClosing       = 5,
+
+    XenbusStateClosed        = 6,
+
+    /*
+     * Reconfiguring: The device is being reconfigured.
+     */
+    XenbusStateReconfiguring = 7,
+
+    XenbusStateReconfigured  = 8
+};
+typedef enum xenbus_state XenbusState;
+
+#endif /* _XEN_PUBLIC_IO_XENBUS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/io/xs_wire.h b/include/standard-headers/xen/io/xs_wire.h
new file mode 100644
index 0000000000..4dd6632669
--- /dev/null
+++ b/include/standard-headers/xen/io/xs_wire.h
@@ -0,0 +1,153 @@
+/*
+ * Details of the "wire" protocol between Xen Store Daemon and client
+ * library or guest kernel.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (C) 2005 Rusty Russell IBM Corporation
+ */
+
+#ifndef _XS_WIRE_H
+#define _XS_WIRE_H
+
+enum xsd_sockmsg_type
+{
+    XS_CONTROL,
+#define XS_DEBUG XS_CONTROL
+    XS_DIRECTORY,
+    XS_READ,
+    XS_GET_PERMS,
+    XS_WATCH,
+    XS_UNWATCH,
+    XS_TRANSACTION_START,
+    XS_TRANSACTION_END,
+    XS_INTRODUCE,
+    XS_RELEASE,
+    XS_GET_DOMAIN_PATH,
+    XS_WRITE,
+    XS_MKDIR,
+    XS_RM,
+    XS_SET_PERMS,
+    XS_WATCH_EVENT,
+    XS_ERROR,
+    XS_IS_DOMAIN_INTRODUCED,
+    XS_RESUME,
+    XS_SET_TARGET,
+    /* XS_RESTRICT has been removed */
+    XS_RESET_WATCHES = XS_SET_TARGET + 2,
+    XS_DIRECTORY_PART,
+
+    XS_TYPE_COUNT,      /* Number of valid types. */
+
+    XS_INVALID = 0xffff /* Guaranteed to remain an invalid type */
+};
+
+#define XS_WRITE_NONE "NONE"
+#define XS_WRITE_CREATE "CREATE"
+#define XS_WRITE_CREATE_EXCL "CREATE|EXCL"
+
+/* We hand errors as strings, for portability. */
+struct xsd_errors
+{
+    int errnum;
+    const char *errstring;
+};
+#ifdef EINVAL
+#define XSD_ERROR(x) { x, #x }
+/* LINTED: static unused */
+static struct xsd_errors xsd_errors[]
+#if defined(__GNUC__)
+__attribute__((unused))
+#endif
+    = {
+    XSD_ERROR(EINVAL),
+    XSD_ERROR(EACCES),
+    XSD_ERROR(EEXIST),
+    XSD_ERROR(EISDIR),
+    XSD_ERROR(ENOENT),
+    XSD_ERROR(ENOMEM),
+    XSD_ERROR(ENOSPC),
+    XSD_ERROR(EIO),
+    XSD_ERROR(ENOTEMPTY),
+    XSD_ERROR(ENOSYS),
+    XSD_ERROR(EROFS),
+    XSD_ERROR(EBUSY),
+    XSD_ERROR(EAGAIN),
+    XSD_ERROR(EISCONN),
+    XSD_ERROR(E2BIG)
+};
+#endif
+
+struct xsd_sockmsg
+{
+    uint32_t type;  /* XS_??? */
+    uint32_t req_id;/* Request identifier, echoed in daemon's response.  */
+    uint32_t tx_id; /* Transaction id (0 if not related to a transaction). */
+    uint32_t len;   /* Length of data following this. */
+
+    /* Generally followed by nul-terminated string(s). */
+};
+
+enum xs_watch_type
+{
+    XS_WATCH_PATH = 0,
+    XS_WATCH_TOKEN
+};
+
+/*
+ * `incontents 150 xenstore_struct XenStore wire protocol.
+ *
+ * Inter-domain shared memory communications. */
+#define XENSTORE_RING_SIZE 1024
+typedef uint32_t XENSTORE_RING_IDX;
+#define MASK_XENSTORE_IDX(idx) ((idx) & (XENSTORE_RING_SIZE-1))
+struct xenstore_domain_interface {
+    char req[XENSTORE_RING_SIZE]; /* Requests to xenstore daemon. */
+    char rsp[XENSTORE_RING_SIZE]; /* Replies and async watch events. */
+    XENSTORE_RING_IDX req_cons, req_prod;
+    XENSTORE_RING_IDX rsp_cons, rsp_prod;
+    uint32_t server_features; /* Bitmap of features supported by the server */
+    uint32_t connection;
+};
+
+/* Violating this is very bad.  See docs/misc/xenstore.txt. */
+#define XENSTORE_PAYLOAD_MAX 4096
+
+/* Violating these just gets you an error back */
+#define XENSTORE_ABS_PATH_MAX 3072
+#define XENSTORE_REL_PATH_MAX 2048
+
+/* The ability to reconnect a ring */
+#define XENSTORE_SERVER_FEATURE_RECONNECTION 1
+
+/* Valid values for the connection field */
+#define XENSTORE_CONNECTED 0 /* the steady-state */
+#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
+
+#endif /* _XS_WIRE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/memory.h b/include/standard-headers/xen/memory.h
new file mode 100644
index 0000000000..383a9468c3
--- /dev/null
+++ b/include/standard-headers/xen/memory.h
@@ -0,0 +1,754 @@
+/******************************************************************************
+ * memory.h
+ *
+ * Memory reservation and information.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
+ */
+
+#ifndef __XEN_PUBLIC_MEMORY_H__
+#define __XEN_PUBLIC_MEMORY_H__
+
+#include "xen.h"
+#include "physdev.h"
+
+/*
+ * Increase or decrease the specified domain's memory reservation. Returns the
+ * number of extents successfully allocated or freed.
+ * arg == addr of struct xen_memory_reservation.
+ */
+#define XENMEM_increase_reservation 0
+#define XENMEM_decrease_reservation 1
+#define XENMEM_populate_physmap     6
+
+#if __XEN_INTERFACE_VERSION__ >= 0x00030209
+/*
+ * Maximum # bits addressable by the user of the allocated region (e.g., I/O
+ * devices often have a 32-bit limitation even in 64-bit systems). If zero
+ * then the user has no addressing restriction. This field is not used by
+ * XENMEM_decrease_reservation.
+ */
+#define XENMEMF_address_bits(x)     (x)
+#define XENMEMF_get_address_bits(x) ((x) & 0xffu)
+/* NUMA node to allocate from. */
+#define XENMEMF_node(x)     (((x) + 1) << 8)
+#define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
+/* Flag to populate physmap with populate-on-demand entries */
+#define XENMEMF_populate_on_demand (1<<16)
+/* Flag to request allocation only from the node specified */
+#define XENMEMF_exact_node_request  (1<<17)
+#define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
+/* Flag to indicate the node specified is virtual node */
+#define XENMEMF_vnode  (1<<18)
+#endif
+
+struct xen_memory_reservation {
+
+    /*
+     * XENMEM_increase_reservation:
+     *   OUT: MFN (*not* GMFN) bases of extents that were allocated
+     * XENMEM_decrease_reservation:
+     *   IN:  GMFN bases of extents to free
+     * XENMEM_populate_physmap:
+     *   IN:  GPFN bases of extents to populate with memory
+     *   OUT: GMFN bases of extents that were allocated
+     *   (NB. This command also updates the mach_to_phys translation table)
+     * XENMEM_claim_pages:
+     *   IN: must be zero
+     */
+    XEN_GUEST_HANDLE(xen_pfn_t) extent_start;
+
+    /* Number of extents, and size/alignment of each (2^extent_order pages). */
+    xen_ulong_t    nr_extents;
+    unsigned int   extent_order;
+
+#if __XEN_INTERFACE_VERSION__ >= 0x00030209
+    /* XENMEMF flags. */
+    unsigned int   mem_flags;
+#else
+    unsigned int   address_bits;
+#endif
+
+    /*
+     * Domain whose reservation is being changed.
+     * Unprivileged domains can specify only DOMID_SELF.
+     */
+    domid_t        domid;
+};
+typedef struct xen_memory_reservation xen_memory_reservation_t;
+DEFINE_XEN_GUEST_HANDLE(xen_memory_reservation_t);
+
+/*
+ * An atomic exchange of memory pages. If return code is zero then
+ * @out.extent_list provides GMFNs of the newly-allocated memory.
+ * Returns zero on complete success, otherwise a negative error code.
+ * On complete success then always @nr_exchanged == @in.nr_extents.
+ * On partial success @nr_exchanged indicates how much work was done.
+ *
+ * Note that only PV guests can use this operation.
+ */
+#define XENMEM_exchange             11
+struct xen_memory_exchange {
+    /*
+     * [IN] Details of memory extents to be exchanged (GMFN bases).
+     * Note that @in.address_bits is ignored and unused.
+     */
+    struct xen_memory_reservation in;
+
+    /*
+     * [IN/OUT] Details of new memory extents.
+     * We require that:
+     *  1. @in.domid == @out.domid
+     *  2. @in.nr_extents  << @in.extent_order ==
+     *     @out.nr_extents << @out.extent_order
+     *  3. @in.extent_start and @out.extent_start lists must not overlap
+     *  4. @out.extent_start lists GPFN bases to be populated
+     *  5. @out.extent_start is overwritten with allocated GMFN bases
+     */
+    struct xen_memory_reservation out;
+
+    /*
+     * [OUT] Number of input extents that were successfully exchanged:
+     *  1. The first @nr_exchanged input extents were successfully
+     *     deallocated.
+     *  2. The corresponding first entries in the output extent list correctly
+     *     indicate the GMFNs that were successfully exchanged.
+     *  3. All other input and output extents are untouched.
+     *  4. If not all input exents are exchanged then the return code of this
+     *     command will be non-zero.
+     *  5. THIS FIELD MUST BE INITIALISED TO ZERO BY THE CALLER!
+     */
+    xen_ulong_t nr_exchanged;
+};
+typedef struct xen_memory_exchange xen_memory_exchange_t;
+DEFINE_XEN_GUEST_HANDLE(xen_memory_exchange_t);
+
+/*
+ * Returns the maximum machine frame number of mapped RAM in this system.
+ * This command always succeeds (it never returns an error code).
+ * arg == NULL.
+ */
+#define XENMEM_maximum_ram_page     2
+
+struct xen_memory_domain {
+    /* [IN] Domain information is being queried for. */
+    domid_t domid;
+};
+
+/*
+ * Returns the current or maximum memory reservation, in pages, of the
+ * specified domain (may be DOMID_SELF). Returns -ve errcode on failure.
+ * arg == addr of struct xen_memory_domain.
+ */
+#define XENMEM_current_reservation  3
+#define XENMEM_maximum_reservation  4
+
+/*
+ * Returns the maximum GFN in use by the specified domain (may be DOMID_SELF).
+ * Returns -ve errcode on failure.
+ * arg == addr of struct xen_memory_domain.
+ */
+#define XENMEM_maximum_gpfn         14
+
+/*
+ * Returns a list of MFN bases of 2MB extents comprising the machine_to_phys
+ * mapping table. Architectures which do not have a m2p table do not implement
+ * this command.
+ * arg == addr of xen_machphys_mfn_list_t.
+ */
+#define XENMEM_machphys_mfn_list    5
+struct xen_machphys_mfn_list {
+    /*
+     * Size of the 'extent_start' array. Fewer entries will be filled if the
+     * machphys table is smaller than max_extents * 2MB.
+     */
+    unsigned int max_extents;
+
+    /*
+     * Pointer to buffer to fill with list of extent starts. If there are
+     * any large discontiguities in the machine address space, 2MB gaps in
+     * the machphys table will be represented by an MFN base of zero.
+     */
+    XEN_GUEST_HANDLE(xen_pfn_t) extent_start;
+
+    /*
+     * Number of extents written to the above array. This will be smaller
+     * than 'max_extents' if the machphys table is smaller than max_e * 2MB.
+     */
+    unsigned int nr_extents;
+};
+typedef struct xen_machphys_mfn_list xen_machphys_mfn_list_t;
+DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
+
+/*
+ * For a compat caller, this is identical to XENMEM_machphys_mfn_list.
+ *
+ * For a non compat caller, this functions similarly to
+ * XENMEM_machphys_mfn_list, but returns the mfns making up the compatibility
+ * m2p table.
+ */
+#define XENMEM_machphys_compat_mfn_list     25
+
+/*
+ * Returns the location in virtual address space of the machine_to_phys
+ * mapping table. Architectures which do not have a m2p table, or which do not
+ * map it by default into guest address space, do not implement this command.
+ * arg == addr of xen_machphys_mapping_t.
+ */
+#define XENMEM_machphys_mapping     12
+struct xen_machphys_mapping {
+    xen_ulong_t v_start, v_end; /* Start and end virtual addresses.   */
+    xen_ulong_t max_mfn;        /* Maximum MFN that can be looked up. */
+};
+typedef struct xen_machphys_mapping xen_machphys_mapping_t;
+DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
+
+/* Source mapping space. */
+/* ` enum phys_map_space { */
+#define XENMAPSPACE_shared_info  0 /* shared info page */
+#define XENMAPSPACE_grant_table  1 /* grant table page */
+#define XENMAPSPACE_gmfn         2 /* GMFN */
+#define XENMAPSPACE_gmfn_range   3 /* GMFN range, XENMEM_add_to_physmap only. */
+#define XENMAPSPACE_gmfn_foreign 4 /* GMFN from another dom,
+                                    * XENMEM_add_to_physmap_batch only. */
+#define XENMAPSPACE_dev_mmio     5 /* device mmio region
+                                      ARM only; the region is mapped in
+                                      Stage-2 using the Normal Memory
+                                      Inner/Outer Write-Back Cacheable
+                                      memory attribute. */
+/* ` } */
+
+/*
+ * Sets the GPFN at which a particular page appears in the specified guest's
+ * physical address space (translated guests only).
+ * arg == addr of xen_add_to_physmap_t.
+ */
+#define XENMEM_add_to_physmap      7
+struct xen_add_to_physmap {
+    /* Which domain to change the mapping for. */
+    domid_t domid;
+
+    /* Number of pages to go through for gmfn_range */
+    uint16_t    size;
+
+    unsigned int space; /* => enum phys_map_space */
+
+#define XENMAPIDX_grant_table_status 0x80000000
+
+    /* Index into space being mapped. */
+    xen_ulong_t idx;
+
+    /* GPFN in domid where the source mapping page should appear. */
+    xen_pfn_t     gpfn;
+};
+typedef struct xen_add_to_physmap xen_add_to_physmap_t;
+DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_t);
+
+/* A batched version of add_to_physmap. */
+#define XENMEM_add_to_physmap_batch 23
+struct xen_add_to_physmap_batch {
+    /* IN */
+    /* Which domain to change the mapping for. */
+    domid_t domid;
+    uint16_t space; /* => enum phys_map_space */
+
+    /* Number of pages to go through */
+    uint16_t size;
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040700
+    domid_t foreign_domid; /* IFF gmfn_foreign. Should be 0 for other spaces. */
+#else
+    union xen_add_to_physmap_batch_extra {
+        domid_t foreign_domid; /* gmfn_foreign */
+        uint16_t res0;  /* All the other spaces. Should be 0 */
+    } u;
+#endif
+
+    /* Indexes into space being mapped. */
+    XEN_GUEST_HANDLE(xen_ulong_t) idxs;
+
+    /* GPFN in domid where the source mapping page should appear. */
+    XEN_GUEST_HANDLE(xen_pfn_t) gpfns;
+
+    /* OUT */
+
+    /* Per index error code. */
+    XEN_GUEST_HANDLE(int) errs;
+};
+typedef struct xen_add_to_physmap_batch xen_add_to_physmap_batch_t;
+DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_batch_t);
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040400
+#define XENMEM_add_to_physmap_range XENMEM_add_to_physmap_batch
+#define xen_add_to_physmap_range xen_add_to_physmap_batch
+typedef struct xen_add_to_physmap_batch xen_add_to_physmap_range_t;
+DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_range_t);
+#endif
+
+/*
+ * Unmaps the page appearing at a particular GPFN from the specified guest's
+ * physical address space (translated guests only).
+ * arg == addr of xen_remove_from_physmap_t.
+ */
+#define XENMEM_remove_from_physmap      15
+struct xen_remove_from_physmap {
+    /* Which domain to change the mapping for. */
+    domid_t domid;
+
+    /* GPFN of the current mapping of the page. */
+    xen_pfn_t     gpfn;
+};
+typedef struct xen_remove_from_physmap xen_remove_from_physmap_t;
+DEFINE_XEN_GUEST_HANDLE(xen_remove_from_physmap_t);
+
+/*** REMOVED ***/
+/*#define XENMEM_translate_gpfn_list  8*/
+
+/*
+ * Returns the pseudo-physical memory map as it was when the domain
+ * was started (specified by XENMEM_set_memory_map).
+ * arg == addr of xen_memory_map_t.
+ */
+#define XENMEM_memory_map           9
+struct xen_memory_map {
+    /*
+     * On call the number of entries which can be stored in buffer. On
+     * return the number of entries which have been stored in
+     * buffer.
+     */
+    unsigned int nr_entries;
+
+    /*
+     * Entries in the buffer are in the same format as returned by the
+     * BIOS INT 0x15 EAX=0xE820 call.
+     */
+    XEN_GUEST_HANDLE(void) buffer;
+};
+typedef struct xen_memory_map xen_memory_map_t;
+DEFINE_XEN_GUEST_HANDLE(xen_memory_map_t);
+
+/*
+ * Returns the real physical memory map. Passes the same structure as
+ * XENMEM_memory_map.
+ * Specifying buffer as NULL will return the number of entries required
+ * to store the complete memory map.
+ * arg == addr of xen_memory_map_t.
+ */
+#define XENMEM_machine_memory_map   10
+
+/*
+ * Set the pseudo-physical memory map of a domain, as returned by
+ * XENMEM_memory_map.
+ * arg == addr of xen_foreign_memory_map_t.
+ */
+#define XENMEM_set_memory_map       13
+struct xen_foreign_memory_map {
+    domid_t domid;
+    struct xen_memory_map map;
+};
+typedef struct xen_foreign_memory_map xen_foreign_memory_map_t;
+DEFINE_XEN_GUEST_HANDLE(xen_foreign_memory_map_t);
+
+#define XENMEM_set_pod_target       16
+#define XENMEM_get_pod_target       17
+struct xen_pod_target {
+    /* IN */
+    uint64_t target_pages;
+    /* OUT */
+    uint64_t tot_pages;
+    uint64_t pod_cache_pages;
+    uint64_t pod_entries;
+    /* IN */
+    domid_t domid;
+};
+typedef struct xen_pod_target xen_pod_target_t;
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+#ifndef uint64_aligned_t
+#define uint64_aligned_t uint64_t
+#endif
+
+/*
+ * Get the number of MFNs saved through memory sharing.
+ * The call never fails.
+ */
+#define XENMEM_get_sharing_freed_pages    18
+#define XENMEM_get_sharing_shared_pages   19
+
+#define XENMEM_paging_op                    20
+#define XENMEM_paging_op_nominate           0
+#define XENMEM_paging_op_evict              1
+#define XENMEM_paging_op_prep               2
+
+struct xen_mem_paging_op {
+    uint8_t     op;         /* XENMEM_paging_op_* */
+    domid_t     domain;
+
+    /* IN: (XENMEM_paging_op_prep) buffer to immediately fill page from */
+    XEN_GUEST_HANDLE_64(const_uint8) buffer;
+    /* IN:  gfn of page being operated on */
+    uint64_aligned_t    gfn;
+};
+typedef struct xen_mem_paging_op xen_mem_paging_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_paging_op_t);
+
+#define XENMEM_access_op                    21
+#define XENMEM_access_op_set_access         0
+#define XENMEM_access_op_get_access         1
+/*
+ * XENMEM_access_op_enable_emulate and XENMEM_access_op_disable_emulate are
+ * currently unused, but since they have been in use please do not reuse them.
+ *
+ * #define XENMEM_access_op_enable_emulate     2
+ * #define XENMEM_access_op_disable_emulate    3
+ */
+#define XENMEM_access_op_set_access_multi   4
+
+typedef enum {
+    XENMEM_access_n,
+    XENMEM_access_r,
+    XENMEM_access_w,
+    XENMEM_access_rw,
+    XENMEM_access_x,
+    XENMEM_access_rx,
+    XENMEM_access_wx,
+    XENMEM_access_rwx,
+    /*
+     * Page starts off as r-x, but automatically
+     * change to r-w on a write
+     */
+    XENMEM_access_rx2rw,
+    /*
+     * Log access: starts off as n, automatically
+     * goes to rwx, generating an event without
+     * pausing the vcpu
+     */
+    XENMEM_access_n2rwx,
+    /* Take the domain default */
+    XENMEM_access_default
+} xenmem_access_t;
+
+struct xen_mem_access_op {
+    /* XENMEM_access_op_* */
+    uint8_t op;
+    /* xenmem_access_t */
+    uint8_t access;
+    domid_t domid;
+    /*
+     * Number of pages for set op (or size of pfn_list for
+     * XENMEM_access_op_set_access_multi)
+     * Ignored on setting default access and other ops
+     */
+    uint32_t nr;
+    /*
+     * First pfn for set op
+     * pfn for get op
+     * ~0ull is used to set and get the default access for pages
+     */
+    uint64_aligned_t pfn;
+    /*
+     * List of pfns to set access for
+     * Used only with XENMEM_access_op_set_access_multi
+     */
+    XEN_GUEST_HANDLE(const_uint64) pfn_list;
+    /*
+     * Corresponding list of access settings for pfn_list
+     * Used only with XENMEM_access_op_set_access_multi
+     */
+    XEN_GUEST_HANDLE(const_uint8) access_list;
+};
+typedef struct xen_mem_access_op xen_mem_access_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_access_op_t);
+
+#define XENMEM_sharing_op                   22
+#define XENMEM_sharing_op_nominate_gfn      0
+#define XENMEM_sharing_op_nominate_gref     1
+#define XENMEM_sharing_op_share             2
+#define XENMEM_sharing_op_debug_gfn         3
+#define XENMEM_sharing_op_debug_mfn         4
+#define XENMEM_sharing_op_debug_gref        5
+#define XENMEM_sharing_op_add_physmap       6
+#define XENMEM_sharing_op_audit             7
+#define XENMEM_sharing_op_range_share       8
+#define XENMEM_sharing_op_fork              9
+#define XENMEM_sharing_op_fork_reset        10
+
+#define XENMEM_SHARING_OP_S_HANDLE_INVALID  (-10)
+#define XENMEM_SHARING_OP_C_HANDLE_INVALID  (-9)
+
+/* The following allows sharing of grant refs. This is useful
+ * for sharing utilities sitting as "filters" in IO backends
+ * (e.g. memshr + blktap(2)). The IO backend is only exposed
+ * to grant references, and this allows sharing of the grefs */
+#define XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG   (xen_mk_ullong(1) << 62)
+
+#define XENMEM_SHARING_OP_FIELD_MAKE_GREF(field, val)  \
+    (field) = (XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG | val)
+#define XENMEM_SHARING_OP_FIELD_IS_GREF(field)         \
+    ((field) & XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG)
+#define XENMEM_SHARING_OP_FIELD_GET_GREF(field)        \
+    ((field) & (~XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG))
+
+struct xen_mem_sharing_op {
+    uint8_t     op;     /* XENMEM_sharing_op_* */
+    domid_t     domain;
+
+    union {
+        struct mem_sharing_op_nominate {  /* OP_NOMINATE_xxx           */
+            union {
+                uint64_aligned_t gfn;     /* IN: gfn to nominate       */
+                uint32_t      grant_ref;  /* IN: grant ref to nominate */
+            } u;
+            uint64_aligned_t  handle;     /* OUT: the handle           */
+        } nominate;
+        struct mem_sharing_op_share {     /* OP_SHARE/ADD_PHYSMAP */
+            uint64_aligned_t source_gfn;    /* IN: the gfn of the source page */
+            uint64_aligned_t source_handle; /* IN: handle to the source page */
+            uint64_aligned_t client_gfn;    /* IN: the client gfn */
+            uint64_aligned_t client_handle; /* IN: handle to the client page */
+            domid_t  client_domain; /* IN: the client domain id */
+        } share;
+        struct mem_sharing_op_range {         /* OP_RANGE_SHARE */
+            uint64_aligned_t first_gfn;      /* IN: the first gfn */
+            uint64_aligned_t last_gfn;       /* IN: the last gfn */
+            uint64_aligned_t opaque;         /* Must be set to 0 */
+            domid_t client_domain;           /* IN: the client domain id */
+            uint16_t _pad[3];                /* Must be set to 0 */
+        } range;
+        struct mem_sharing_op_debug {     /* OP_DEBUG_xxx */
+            union {
+                uint64_aligned_t gfn;      /* IN: gfn to debug          */
+                uint64_aligned_t mfn;      /* IN: mfn to debug          */
+                uint32_t gref;     /* IN: gref to debug         */
+            } u;
+        } debug;
+        struct mem_sharing_op_fork {      /* OP_FORK */
+            domid_t parent_domain;        /* IN: parent's domain id */
+/* Only makes sense for short-lived forks */
+#define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
+/* Only makes sense for short-lived forks */
+#define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
+            uint16_t flags;               /* IN: optional settings */
+            uint32_t pad;                 /* Must be set to 0 */
+        } fork;
+    } u;
+};
+typedef struct xen_mem_sharing_op xen_mem_sharing_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_sharing_op_t);
+
+/*
+ * Attempt to stake a claim for a domain on a quantity of pages
+ * of system RAM, but _not_ assign specific pageframes.  Only
+ * arithmetic is performed so the hypercall is very fast and need
+ * not be preemptible, thus sidestepping time-of-check-time-of-use
+ * races for memory allocation.  Returns 0 if the hypervisor page
+ * allocator has atomically and successfully claimed the requested
+ * number of pages, else non-zero.
+ *
+ * Any domain may have only one active claim.  When sufficient memory
+ * has been allocated to resolve the claim, the claim silently expires.
+ * Claiming zero pages effectively resets any outstanding claim and
+ * is always successful.
+ *
+ * Note that a valid claim may be staked even after memory has been
+ * allocated for a domain.  In this case, the claim is not incremental,
+ * i.e. if the domain's total page count is 3, and a claim is staked
+ * for 10, only 7 additional pages are claimed.
+ *
+ * Caller must be privileged or the hypercall fails.
+ */
+#define XENMEM_claim_pages                  24
+
+/*
+ * XENMEM_claim_pages flags - the are no flags at this time.
+ * The zero value is appropriate.
+ */
+
+/*
+ * With some legacy devices, certain guest-physical addresses cannot safely
+ * be used for other purposes, e.g. to map guest RAM.  This hypercall
+ * enumerates those regions so the toolstack can avoid using them.
+ */
+#define XENMEM_reserved_device_memory_map   27
+struct xen_reserved_device_memory {
+    xen_pfn_t start_pfn;
+    xen_ulong_t nr_pages;
+};
+typedef struct xen_reserved_device_memory xen_reserved_device_memory_t;
+DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_t);
+
+struct xen_reserved_device_memory_map {
+#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
+    /* IN */
+    uint32_t flags;
+    /*
+     * IN/OUT
+     *
+     * Gets set to the required number of entries when too low,
+     * signaled by error code -ERANGE.
+     */
+    unsigned int nr_entries;
+    /* OUT */
+    XEN_GUEST_HANDLE(xen_reserved_device_memory_t) buffer;
+    /* IN */
+    union {
+        physdev_pci_device_t pci;
+    } dev;
+};
+typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
+DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+/*
+ * Get the pages for a particular guest resource, so that they can be
+ * mapped directly by a tools domain.
+ */
+#define XENMEM_acquire_resource 28
+struct xen_mem_acquire_resource {
+    /* IN - The domain whose resource is to be mapped */
+    domid_t domid;
+    /* IN - the type of resource */
+    uint16_t type;
+
+#define XENMEM_resource_ioreq_server 0
+#define XENMEM_resource_grant_table 1
+#define XENMEM_resource_vmtrace_buf 2
+
+    /*
+     * IN - a type-specific resource identifier, which must be zero
+     *      unless stated otherwise.
+     *
+     * type == XENMEM_resource_ioreq_server -> id == ioreq server id
+     * type == XENMEM_resource_grant_table -> id defined below
+     */
+    uint32_t id;
+
+#define XENMEM_resource_grant_table_id_shared 0
+#define XENMEM_resource_grant_table_id_status 1
+
+    /*
+     * IN/OUT
+     *
+     * As an IN parameter number of frames of the resource to be mapped.
+     * This value may be updated over the course of the operation.
+     *
+     * When frame_list is NULL and nr_frames is 0, this is interpreted as a
+     * request for the size of the resource, which shall be returned in the
+     * nr_frames field.
+     *
+     * The size of a resource will never be zero, but a nonzero result doesn't
+     * guarantee that a subsequent mapping request will be successful.  There
+     * are further type/id specific constraints which may change between the
+     * two calls.
+     */
+    uint32_t nr_frames;
+    uint32_t pad;
+    /*
+     * IN - the index of the initial frame to be mapped. This parameter
+     *      is ignored if nr_frames is 0.  This value may be updated
+     *      over the course of the operation.
+     */
+    uint64_t frame;
+
+#define XENMEM_resource_ioreq_server_frame_bufioreq 0
+#define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
+
+    /*
+     * IN/OUT - If the tools domain is PV then, upon return, frame_list
+     *          will be populated with the MFNs of the resource.
+     *          If the tools domain is HVM then it is expected that, on
+     *          entry, frame_list will be populated with a list of GFNs
+     *          that will be mapped to the MFNs of the resource.
+     *          If -EIO is returned then the frame_list has only been
+     *          partially mapped and it is up to the caller to unmap all
+     *          the GFNs.
+     *          This parameter may be NULL if nr_frames is 0.  This
+     *          value may be updated over the course of the operation.
+     */
+    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
+};
+typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
+
+/*
+ * XENMEM_get_vnumainfo used by guest to get
+ * vNUMA topology from hypervisor.
+ */
+#define XENMEM_get_vnumainfo                26
+
+/* vNUMA node memory ranges */
+struct xen_vmemrange {
+    uint64_t start, end;
+    unsigned int flags;
+    unsigned int nid;
+};
+typedef struct xen_vmemrange xen_vmemrange_t;
+DEFINE_XEN_GUEST_HANDLE(xen_vmemrange_t);
+
+/*
+ * vNUMA topology specifies vNUMA node number, distance table,
+ * memory ranges and vcpu mapping provided for guests.
+ * XENMEM_get_vnumainfo hypercall expects to see from guest
+ * nr_vnodes, nr_vmemranges and nr_vcpus to indicate available memory.
+ * After filling guests structures, nr_vnodes, nr_vmemranges and nr_vcpus
+ * copied back to guest. Domain returns expected values of nr_vnodes,
+ * nr_vmemranges and nr_vcpus to guest if the values where incorrect.
+ */
+struct xen_vnuma_topology_info {
+    /* IN */
+    domid_t domid;
+    uint16_t pad;
+    /* IN/OUT */
+    unsigned int nr_vnodes;
+    unsigned int nr_vcpus;
+    unsigned int nr_vmemranges;
+    /* OUT */
+    union {
+        XEN_GUEST_HANDLE(uint) h;
+        uint64_t pad;
+    } vdistance;
+    union {
+        XEN_GUEST_HANDLE(uint) h;
+        uint64_t pad;
+    } vcpu_to_vnode;
+    union {
+        XEN_GUEST_HANDLE(xen_vmemrange_t) h;
+        uint64_t pad;
+    } vmemrange;
+};
+typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
+DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
+
+/* Next available subop number is 29 */
+
+#endif /* __XEN_PUBLIC_MEMORY_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/physdev.h b/include/standard-headers/xen/physdev.h
new file mode 100644
index 0000000000..d271766ad0
--- /dev/null
+++ b/include/standard-headers/xen/physdev.h
@@ -0,0 +1,383 @@
+/*
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2006, Keir Fraser
+ */
+
+#ifndef __XEN_PUBLIC_PHYSDEV_H__
+#define __XEN_PUBLIC_PHYSDEV_H__
+
+#include "xen.h"
+
+/*
+ * Prototype for this hypercall is:
+ *  int physdev_op(int cmd, void *args)
+ * @cmd  == PHYSDEVOP_??? (physdev operation).
+ * @args == Operation-specific extra arguments (NULL if none).
+ */
+
+/*
+ * Notify end-of-interrupt (EOI) for the specified IRQ.
+ * @arg == pointer to physdev_eoi structure.
+ */
+#define PHYSDEVOP_eoi                   12
+struct physdev_eoi {
+    /* IN */
+    uint32_t irq;
+};
+typedef struct physdev_eoi physdev_eoi_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_eoi_t);
+
+/*
+ * Register a shared page for the hypervisor to indicate whether the guest
+ * must issue PHYSDEVOP_eoi. The semantics of PHYSDEVOP_eoi change slightly
+ * once the guest used this function in that the associated event channel
+ * will automatically get unmasked. The page registered is used as a bit
+ * array indexed by Xen's PIRQ value.
+ */
+#define PHYSDEVOP_pirq_eoi_gmfn_v1       17
+/*
+ * Register a shared page for the hypervisor to indicate whether the
+ * guest must issue PHYSDEVOP_eoi. This hypercall is very similar to
+ * PHYSDEVOP_pirq_eoi_gmfn_v1 but it doesn't change the semantics of
+ * PHYSDEVOP_eoi. The page registered is used as a bit array indexed by
+ * Xen's PIRQ value.
+ */
+#define PHYSDEVOP_pirq_eoi_gmfn_v2       28
+struct physdev_pirq_eoi_gmfn {
+    /* IN */
+    xen_pfn_t gmfn;
+};
+typedef struct physdev_pirq_eoi_gmfn physdev_pirq_eoi_gmfn_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_pirq_eoi_gmfn_t);
+
+/*
+ * Query the status of an IRQ line.
+ * @arg == pointer to physdev_irq_status_query structure.
+ */
+#define PHYSDEVOP_irq_status_query       5
+struct physdev_irq_status_query {
+    /* IN */
+    uint32_t irq;
+    /* OUT */
+    uint32_t flags; /* XENIRQSTAT_* */
+};
+typedef struct physdev_irq_status_query physdev_irq_status_query_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_irq_status_query_t);
+
+/* Need to call PHYSDEVOP_eoi when the IRQ has been serviced? */
+#define _XENIRQSTAT_needs_eoi   (0)
+#define  XENIRQSTAT_needs_eoi   (1U<<_XENIRQSTAT_needs_eoi)
+
+/* IRQ shared by multiple guests? */
+#define _XENIRQSTAT_shared      (1)
+#define  XENIRQSTAT_shared      (1U<<_XENIRQSTAT_shared)
+
+/*
+ * Set the current VCPU's I/O privilege level.
+ * @arg == pointer to physdev_set_iopl structure.
+ */
+#define PHYSDEVOP_set_iopl               6
+struct physdev_set_iopl {
+    /* IN */
+    uint32_t iopl;
+};
+typedef struct physdev_set_iopl physdev_set_iopl_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_set_iopl_t);
+
+/*
+ * Set the current VCPU's I/O-port permissions bitmap.
+ * @arg == pointer to physdev_set_iobitmap structure.
+ */
+#define PHYSDEVOP_set_iobitmap           7
+struct physdev_set_iobitmap {
+    /* IN */
+#if __XEN_INTERFACE_VERSION__ >= 0x00030205
+    XEN_GUEST_HANDLE(uint8) bitmap;
+#else
+    uint8_t *bitmap;
+#endif
+    uint32_t nr_ports;
+};
+typedef struct physdev_set_iobitmap physdev_set_iobitmap_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_set_iobitmap_t);
+
+/*
+ * Read or write an IO-APIC register.
+ * @arg == pointer to physdev_apic structure.
+ */
+#define PHYSDEVOP_apic_read              8
+#define PHYSDEVOP_apic_write             9
+struct physdev_apic {
+    /* IN */
+    unsigned long apic_physbase;
+    uint32_t reg;
+    /* IN or OUT */
+    uint32_t value;
+};
+typedef struct physdev_apic physdev_apic_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_apic_t);
+
+/*
+ * Allocate or free a physical upcall vector for the specified IRQ line.
+ * @arg == pointer to physdev_irq structure.
+ */
+#define PHYSDEVOP_alloc_irq_vector      10
+#define PHYSDEVOP_free_irq_vector       11
+struct physdev_irq {
+    /* IN */
+    uint32_t irq;
+    /* IN or OUT */
+    uint32_t vector;
+};
+typedef struct physdev_irq physdev_irq_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_irq_t);
+
+#define MAP_PIRQ_TYPE_MSI               0x0
+#define MAP_PIRQ_TYPE_GSI               0x1
+#define MAP_PIRQ_TYPE_UNKNOWN           0x2
+#define MAP_PIRQ_TYPE_MSI_SEG           0x3
+#define MAP_PIRQ_TYPE_MULTI_MSI         0x4
+
+#define PHYSDEVOP_map_pirq               13
+struct physdev_map_pirq {
+    domid_t domid;
+    /* IN */
+    int type;
+    /* IN (ignored for ..._MULTI_MSI) */
+    int index;
+    /* IN or OUT */
+    int pirq;
+    /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
+    int bus;
+    /* IN */
+    int devfn;
+    /* IN (also OUT for ..._MULTI_MSI) */
+    int entry_nr;
+    /* IN */
+    uint64_t table_base;
+};
+typedef struct physdev_map_pirq physdev_map_pirq_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_map_pirq_t);
+
+#define PHYSDEVOP_unmap_pirq             14
+struct physdev_unmap_pirq {
+    domid_t domid;
+    /* IN */
+    int pirq;
+};
+
+typedef struct physdev_unmap_pirq physdev_unmap_pirq_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_unmap_pirq_t);
+
+#define PHYSDEVOP_manage_pci_add         15
+#define PHYSDEVOP_manage_pci_remove      16
+struct physdev_manage_pci {
+    /* IN */
+    uint8_t bus;
+    uint8_t devfn;
+};
+
+typedef struct physdev_manage_pci physdev_manage_pci_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_manage_pci_t);
+
+#define PHYSDEVOP_restore_msi            19
+struct physdev_restore_msi {
+    /* IN */
+    uint8_t bus;
+    uint8_t devfn;
+};
+typedef struct physdev_restore_msi physdev_restore_msi_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_restore_msi_t);
+
+#define PHYSDEVOP_manage_pci_add_ext     20
+struct physdev_manage_pci_ext {
+    /* IN */
+    uint8_t bus;
+    uint8_t devfn;
+    unsigned is_extfn;
+    unsigned is_virtfn;
+    struct {
+        uint8_t bus;
+        uint8_t devfn;
+    } physfn;
+};
+
+typedef struct physdev_manage_pci_ext physdev_manage_pci_ext_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_manage_pci_ext_t);
+
+/*
+ * Argument to physdev_op_compat() hypercall. Superceded by new physdev_op()
+ * hypercall since 0x00030202.
+ */
+struct physdev_op {
+    uint32_t cmd;
+    union {
+        physdev_irq_status_query_t irq_status_query;
+        physdev_set_iopl_t         set_iopl;
+        physdev_set_iobitmap_t     set_iobitmap;
+        physdev_apic_t             apic_op;
+        physdev_irq_t              irq_op;
+    } u;
+};
+typedef struct physdev_op physdev_op_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_op_t);
+
+#define PHYSDEVOP_setup_gsi    21
+struct physdev_setup_gsi {
+    int gsi;
+    /* IN */
+    uint8_t triggering;
+    /* IN */
+    uint8_t polarity;
+    /* IN */
+};
+
+typedef struct physdev_setup_gsi physdev_setup_gsi_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_setup_gsi_t);
+
+/* leave PHYSDEVOP 22 free */
+
+/* type is MAP_PIRQ_TYPE_GSI or MAP_PIRQ_TYPE_MSI
+ * the hypercall returns a free pirq */
+#define PHYSDEVOP_get_free_pirq    23
+struct physdev_get_free_pirq {
+    /* IN */
+    int type;
+    /* OUT */
+    uint32_t pirq;
+};
+
+typedef struct physdev_get_free_pirq physdev_get_free_pirq_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_get_free_pirq_t);
+
+#define XEN_PCI_MMCFG_RESERVED         0x1
+
+#define PHYSDEVOP_pci_mmcfg_reserved    24
+struct physdev_pci_mmcfg_reserved {
+    uint64_t address;
+    uint16_t segment;
+    uint8_t start_bus;
+    uint8_t end_bus;
+    uint32_t flags;
+};
+typedef struct physdev_pci_mmcfg_reserved physdev_pci_mmcfg_reserved_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_pci_mmcfg_reserved_t);
+
+#define XEN_PCI_DEV_EXTFN              0x1
+#define XEN_PCI_DEV_VIRTFN             0x2
+#define XEN_PCI_DEV_PXM                0x4
+
+#define PHYSDEVOP_pci_device_add        25
+struct physdev_pci_device_add {
+    /* IN */
+    uint16_t seg;
+    uint8_t bus;
+    uint8_t devfn;
+    uint32_t flags;
+    struct {
+        uint8_t bus;
+        uint8_t devfn;
+    } physfn;
+    /*
+     * Optional parameters array.
+     * First element ([0]) is PXM domain associated with the device (if
+     * XEN_PCI_DEV_PXM is set)
+     */
+    uint32_t optarr[XEN_FLEX_ARRAY_DIM];
+};
+typedef struct physdev_pci_device_add physdev_pci_device_add_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
+
+#define PHYSDEVOP_pci_device_remove     26
+#define PHYSDEVOP_restore_msi_ext       27
+/*
+ * Dom0 should use these two to announce MMIO resources assigned to
+ * MSI-X capable devices won't (prepare) or may (release) change.
+ */
+#define PHYSDEVOP_prepare_msix          30
+#define PHYSDEVOP_release_msix          31
+struct physdev_pci_device {
+    /* IN */
+    uint16_t seg;
+    uint8_t bus;
+    uint8_t devfn;
+};
+typedef struct physdev_pci_device physdev_pci_device_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
+
+#define PHYSDEVOP_DBGP_RESET_PREPARE    1
+#define PHYSDEVOP_DBGP_RESET_DONE       2
+
+#define PHYSDEVOP_DBGP_BUS_UNKNOWN      0
+#define PHYSDEVOP_DBGP_BUS_PCI          1
+
+#define PHYSDEVOP_dbgp_op               29
+struct physdev_dbgp_op {
+    /* IN */
+    uint8_t op;
+    uint8_t bus;
+    union {
+        physdev_pci_device_t pci;
+    } u;
+};
+typedef struct physdev_dbgp_op physdev_dbgp_op_t;
+DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
+
+/*
+ * Notify that some PIRQ-bound event channels have been unmasked.
+ * ** This command is obsolete since interface version 0x00030202 and is **
+ * ** unsupported by newer versions of Xen.                              **
+ */
+#define PHYSDEVOP_IRQ_UNMASK_NOTIFY      4
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040600
+/*
+ * These all-capitals physdev operation names are superceded by the new names
+ * (defined above) since interface version 0x00030202. The guard above was
+ * added post-4.5 only though and hence shouldn't check for 0x00030202.
+ */
+#define PHYSDEVOP_IRQ_STATUS_QUERY       PHYSDEVOP_irq_status_query
+#define PHYSDEVOP_SET_IOPL               PHYSDEVOP_set_iopl
+#define PHYSDEVOP_SET_IOBITMAP           PHYSDEVOP_set_iobitmap
+#define PHYSDEVOP_APIC_READ              PHYSDEVOP_apic_read
+#define PHYSDEVOP_APIC_WRITE             PHYSDEVOP_apic_write
+#define PHYSDEVOP_ASSIGN_VECTOR          PHYSDEVOP_alloc_irq_vector
+#define PHYSDEVOP_FREE_VECTOR            PHYSDEVOP_free_irq_vector
+#define PHYSDEVOP_IRQ_NEEDS_UNMASK_NOTIFY XENIRQSTAT_needs_eoi
+#define PHYSDEVOP_IRQ_SHARED             XENIRQSTAT_shared
+#endif
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040200
+#define PHYSDEVOP_pirq_eoi_gmfn PHYSDEVOP_pirq_eoi_gmfn_v1
+#else
+#define PHYSDEVOP_pirq_eoi_gmfn PHYSDEVOP_pirq_eoi_gmfn_v2
+#endif
+
+#endif /* __XEN_PUBLIC_PHYSDEV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/sched.h b/include/standard-headers/xen/sched.h
new file mode 100644
index 0000000000..811bd87c82
--- /dev/null
+++ b/include/standard-headers/xen/sched.h
@@ -0,0 +1,202 @@
+/******************************************************************************
+ * sched.h
+ *
+ * Scheduler state interactions
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
+ */
+
+#ifndef __XEN_PUBLIC_SCHED_H__
+#define __XEN_PUBLIC_SCHED_H__
+
+#include "event_channel.h"
+
+/*
+ * `incontents 150 sched Guest Scheduler Operations
+ *
+ * The SCHEDOP interface provides mechanisms for a guest to interact
+ * with the scheduler, including yield, blocking and shutting itself
+ * down.
+ */
+
+/*
+ * The prototype for this hypercall is:
+ * ` long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
+ *
+ * @cmd == SCHEDOP_??? (scheduler operation).
+ * @arg == Operation-specific extra argument(s), as described below.
+ * ...  == Additional Operation-specific extra arguments, described below.
+ *
+ * Versions of Xen prior to 3.0.2 provided only the following legacy version
+ * of this hypercall, supporting only the commands yield, block and shutdown:
+ *  long sched_op(int cmd, unsigned long arg)
+ * @cmd == SCHEDOP_??? (scheduler operation).
+ * @arg == 0               (SCHEDOP_yield and SCHEDOP_block)
+ *      == SHUTDOWN_* code (SCHEDOP_shutdown)
+ *
+ * This legacy version is available to new guests as:
+ * ` long HYPERVISOR_sched_op_compat(enum sched_op cmd, unsigned long arg)
+ */
+
+/* ` enum sched_op { // SCHEDOP_* => struct sched_* */
+/*
+ * Voluntarily yield the CPU.
+ * @arg == NULL.
+ */
+#define SCHEDOP_yield       0
+
+/*
+ * Block execution of this VCPU until an event is received for processing.
+ * If called with event upcalls masked, this operation will atomically
+ * reenable event delivery and check for pending events before blocking the
+ * VCPU. This avoids a "wakeup waiting" race.
+ * @arg == NULL.
+ */
+#define SCHEDOP_block       1
+
+/*
+ * Halt execution of this domain (all VCPUs) and notify the system controller.
+ * @arg == pointer to sched_shutdown_t structure.
+ *
+ * If the sched_shutdown_t reason is SHUTDOWN_suspend then
+ * x86 PV guests must also set RDX (EDX for 32-bit guests) to the MFN
+ * of the guest's start info page.  RDX/EDX is the third hypercall
+ * argument.
+ *
+ * In addition, which reason is SHUTDOWN_suspend this hypercall
+ * returns 1 if suspend was cancelled or the domain was merely
+ * checkpointed, and 0 if it is resuming in a new domain.
+ */
+#define SCHEDOP_shutdown    2
+
+/*
+ * Poll a set of event-channel ports. Return when one or more are pending. An
+ * optional timeout may be specified.
+ * @arg == pointer to sched_poll_t structure.
+ */
+#define SCHEDOP_poll        3
+
+/*
+ * Declare a shutdown for another domain. The main use of this function is
+ * in interpreting shutdown requests and reasons for fully-virtualized
+ * domains.  A para-virtualized domain may use SCHEDOP_shutdown directly.
+ * @arg == pointer to sched_remote_shutdown_t structure.
+ */
+#define SCHEDOP_remote_shutdown        4
+
+/*
+ * Latch a shutdown code, so that when the domain later shuts down it
+ * reports this code to the control tools.
+ * @arg == sched_shutdown_t, as for SCHEDOP_shutdown.
+ */
+#define SCHEDOP_shutdown_code 5
+
+/*
+ * Setup, poke and destroy a domain watchdog timer.
+ * @arg == pointer to sched_watchdog_t structure.
+ * With id == 0, setup a domain watchdog timer to cause domain shutdown
+ *               after timeout, returns watchdog id.
+ * With id != 0 and timeout == 0, destroy domain watchdog timer.
+ * With id != 0 and timeout != 0, poke watchdog timer and set new timeout.
+ */
+#define SCHEDOP_watchdog    6
+
+/*
+ * Override the current vcpu affinity by pinning it to one physical cpu or
+ * undo this override restoring the previous affinity.
+ * @arg == pointer to sched_pin_override_t structure.
+ *
+ * A negative pcpu value will undo a previous pin override and restore the
+ * previous cpu affinity.
+ * This call is allowed for the hardware domain only and requires the cpu
+ * to be part of the domain's cpupool.
+ */
+#define SCHEDOP_pin_override 7
+/* ` } */
+
+struct sched_shutdown {
+    unsigned int reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
+};
+typedef struct sched_shutdown sched_shutdown_t;
+DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
+
+struct sched_poll {
+    XEN_GUEST_HANDLE(evtchn_port_t) ports;
+    unsigned int nr_ports;
+    uint64_t timeout;
+};
+typedef struct sched_poll sched_poll_t;
+DEFINE_XEN_GUEST_HANDLE(sched_poll_t);
+
+struct sched_remote_shutdown {
+    domid_t domain_id;         /* Remote domain ID */
+    unsigned int reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
+};
+typedef struct sched_remote_shutdown sched_remote_shutdown_t;
+DEFINE_XEN_GUEST_HANDLE(sched_remote_shutdown_t);
+
+struct sched_watchdog {
+    uint32_t id;                /* watchdog ID */
+    uint32_t timeout;           /* timeout */
+};
+typedef struct sched_watchdog sched_watchdog_t;
+DEFINE_XEN_GUEST_HANDLE(sched_watchdog_t);
+
+struct sched_pin_override {
+    int32_t pcpu;
+};
+typedef struct sched_pin_override sched_pin_override_t;
+DEFINE_XEN_GUEST_HANDLE(sched_pin_override_t);
+
+/*
+ * Reason codes for SCHEDOP_shutdown. These may be interpreted by control
+ * software to determine the appropriate action. For the most part, Xen does
+ * not care about the shutdown code.
+ */
+/* ` enum sched_shutdown_reason { */
+#define SHUTDOWN_poweroff   0  /* Domain exited normally. Clean up and kill. */
+#define SHUTDOWN_reboot     1  /* Clean up, kill, and then restart.          */
+#define SHUTDOWN_suspend    2  /* Clean up, save suspend info, kill.         */
+#define SHUTDOWN_crash      3  /* Tell controller we've crashed.             */
+#define SHUTDOWN_watchdog   4  /* Restart because watchdog time expired.     */
+
+/*
+ * Domain asked to perform 'soft reset' for it. The expected behavior is to
+ * reset internal Xen state for the domain returning it to the point where it
+ * was created but leaving the domain's memory contents and vCPU contexts
+ * intact. This will allow the domain to start over and set up all Xen specific
+ * interfaces again.
+ */
+#define SHUTDOWN_soft_reset 5
+#define SHUTDOWN_MAX        5  /* Maximum valid shutdown reason.             */
+/* ` } */
+
+#endif /* __XEN_PUBLIC_SCHED_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/trace.h b/include/standard-headers/xen/trace.h
new file mode 100644
index 0000000000..d5fa4aea8d
--- /dev/null
+++ b/include/standard-headers/xen/trace.h
@@ -0,0 +1,341 @@
+/******************************************************************************
+ * include/public/trace.h
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Mark Williamson, (C) 2004 Intel Research Cambridge
+ * Copyright (C) 2005 Bin Ren
+ */
+
+#ifndef __XEN_PUBLIC_TRACE_H__
+#define __XEN_PUBLIC_TRACE_H__
+
+#define TRACE_EXTRA_MAX    7
+#define TRACE_EXTRA_SHIFT 28
+
+/* Trace classes */
+#define TRC_CLS_SHIFT 16
+#define TRC_GEN      0x0001f000    /* General trace            */
+#define TRC_SCHED    0x0002f000    /* Xen Scheduler trace      */
+#define TRC_DOM0OP   0x0004f000    /* Xen DOM0 operation trace */
+#define TRC_HVM      0x0008f000    /* Xen HVM trace            */
+#define TRC_MEM      0x0010f000    /* Xen memory trace         */
+#define TRC_PV       0x0020f000    /* Xen PV traces            */
+#define TRC_SHADOW   0x0040f000    /* Xen shadow tracing       */
+#define TRC_HW       0x0080f000    /* Xen hardware-related traces */
+#define TRC_GUEST    0x0800f000    /* Guest-generated traces   */
+#define TRC_ALL      0x0ffff000
+#define TRC_HD_TO_EVENT(x) ((x)&0x0fffffff)
+#define TRC_HD_CYCLE_FLAG (1UL<<31)
+#define TRC_HD_INCLUDES_CYCLE_COUNT(x) ( !!( (x) & TRC_HD_CYCLE_FLAG ) )
+#define TRC_HD_EXTRA(x)    (((x)>>TRACE_EXTRA_SHIFT)&TRACE_EXTRA_MAX)
+
+/* Trace subclasses */
+#define TRC_SUBCLS_SHIFT 12
+
+/* trace subclasses for SVM */
+#define TRC_HVM_ENTRYEXIT   0x00081000   /* VMENTRY and #VMEXIT       */
+#define TRC_HVM_HANDLER     0x00082000   /* various HVM handlers      */
+#define TRC_HVM_EMUL        0x00084000   /* emulated devices */
+
+#define TRC_SCHED_MIN       0x00021000   /* Just runstate changes */
+#define TRC_SCHED_CLASS     0x00022000   /* Scheduler-specific    */
+#define TRC_SCHED_VERBOSE   0x00028000   /* More inclusive scheduling */
+
+/*
+ * The highest 3 bits of the last 12 bits of TRC_SCHED_CLASS above are
+ * reserved for encoding what scheduler produced the information. The
+ * actual event is encoded in the last 9 bits.
+ *
+ * This means we have 8 scheduling IDs available (which means at most 8
+ * schedulers generating events) and, in each scheduler, up to 512
+ * different events.
+ */
+#define TRC_SCHED_ID_BITS 3
+#define TRC_SCHED_ID_SHIFT (TRC_SUBCLS_SHIFT - TRC_SCHED_ID_BITS)
+#define TRC_SCHED_ID_MASK (((1UL<<TRC_SCHED_ID_BITS) - 1) << TRC_SCHED_ID_SHIFT)
+#define TRC_SCHED_EVT_MASK (~(TRC_SCHED_ID_MASK))
+
+/* Per-scheduler IDs, to identify scheduler specific events */
+#define TRC_SCHED_CSCHED   0
+#define TRC_SCHED_CSCHED2  1
+/* #define XEN_SCHEDULER_SEDF 2 (Removed) */
+#define TRC_SCHED_ARINC653 3
+#define TRC_SCHED_RTDS     4
+#define TRC_SCHED_SNULL    5
+
+/* Per-scheduler tracing */
+#define TRC_SCHED_CLASS_EVT(_c, _e) \
+  ( ( TRC_SCHED_CLASS | \
+      ((TRC_SCHED_##_c << TRC_SCHED_ID_SHIFT) & TRC_SCHED_ID_MASK) ) + \
+    (_e & TRC_SCHED_EVT_MASK) )
+
+/* Trace classes for DOM0 operations */
+#define TRC_DOM0_DOMOPS     0x00041000   /* Domains manipulations */
+
+/* Trace classes for Hardware */
+#define TRC_HW_PM           0x00801000   /* Power management traces */
+#define TRC_HW_IRQ          0x00802000   /* Traces relating to the handling of IRQs */
+
+/* Trace events per class */
+#define TRC_LOST_RECORDS        (TRC_GEN + 1)
+#define TRC_TRACE_WRAP_BUFFER  (TRC_GEN + 2)
+#define TRC_TRACE_CPU_CHANGE    (TRC_GEN + 3)
+
+#define TRC_SCHED_RUNSTATE_CHANGE   (TRC_SCHED_MIN + 1)
+#define TRC_SCHED_CONTINUE_RUNNING  (TRC_SCHED_MIN + 2)
+#define TRC_SCHED_DOM_ADD        (TRC_SCHED_VERBOSE +  1)
+#define TRC_SCHED_DOM_REM        (TRC_SCHED_VERBOSE +  2)
+#define TRC_SCHED_SLEEP          (TRC_SCHED_VERBOSE +  3)
+#define TRC_SCHED_WAKE           (TRC_SCHED_VERBOSE +  4)
+#define TRC_SCHED_YIELD          (TRC_SCHED_VERBOSE +  5)
+#define TRC_SCHED_BLOCK          (TRC_SCHED_VERBOSE +  6)
+#define TRC_SCHED_SHUTDOWN       (TRC_SCHED_VERBOSE +  7)
+#define TRC_SCHED_CTL            (TRC_SCHED_VERBOSE +  8)
+#define TRC_SCHED_ADJDOM         (TRC_SCHED_VERBOSE +  9)
+#define TRC_SCHED_SWITCH         (TRC_SCHED_VERBOSE + 10)
+#define TRC_SCHED_S_TIMER_FN     (TRC_SCHED_VERBOSE + 11)
+#define TRC_SCHED_T_TIMER_FN     (TRC_SCHED_VERBOSE + 12)
+#define TRC_SCHED_DOM_TIMER_FN   (TRC_SCHED_VERBOSE + 13)
+#define TRC_SCHED_SWITCH_INFPREV (TRC_SCHED_VERBOSE + 14)
+#define TRC_SCHED_SWITCH_INFNEXT (TRC_SCHED_VERBOSE + 15)
+#define TRC_SCHED_SHUTDOWN_CODE  (TRC_SCHED_VERBOSE + 16)
+#define TRC_SCHED_SWITCH_INFCONT (TRC_SCHED_VERBOSE + 17)
+
+#define TRC_DOM0_DOM_ADD         (TRC_DOM0_DOMOPS + 1)
+#define TRC_DOM0_DOM_REM         (TRC_DOM0_DOMOPS + 2)
+
+#define TRC_MEM_PAGE_GRANT_MAP      (TRC_MEM + 1)
+#define TRC_MEM_PAGE_GRANT_UNMAP    (TRC_MEM + 2)
+#define TRC_MEM_PAGE_GRANT_TRANSFER (TRC_MEM + 3)
+#define TRC_MEM_SET_P2M_ENTRY       (TRC_MEM + 4)
+#define TRC_MEM_DECREASE_RESERVATION (TRC_MEM + 5)
+#define TRC_MEM_POD_POPULATE        (TRC_MEM + 16)
+#define TRC_MEM_POD_ZERO_RECLAIM    (TRC_MEM + 17)
+#define TRC_MEM_POD_SUPERPAGE_SPLINTER (TRC_MEM + 18)
+
+#define TRC_PV_ENTRY   0x00201000 /* Hypervisor entry points for PV guests. */
+#define TRC_PV_SUBCALL 0x00202000 /* Sub-call in a multicall hypercall */
+
+#define TRC_PV_HYPERCALL             (TRC_PV_ENTRY +  1)
+#define TRC_PV_TRAP                  (TRC_PV_ENTRY +  3)
+#define TRC_PV_PAGE_FAULT            (TRC_PV_ENTRY +  4)
+#define TRC_PV_FORCED_INVALID_OP     (TRC_PV_ENTRY +  5)
+#define TRC_PV_EMULATE_PRIVOP        (TRC_PV_ENTRY +  6)
+#define TRC_PV_EMULATE_4GB           (TRC_PV_ENTRY +  7)
+#define TRC_PV_MATH_STATE_RESTORE    (TRC_PV_ENTRY +  8)
+#define TRC_PV_PAGING_FIXUP          (TRC_PV_ENTRY +  9)
+#define TRC_PV_GDT_LDT_MAPPING_FAULT (TRC_PV_ENTRY + 10)
+#define TRC_PV_PTWR_EMULATION        (TRC_PV_ENTRY + 11)
+#define TRC_PV_PTWR_EMULATION_PAE    (TRC_PV_ENTRY + 12)
+#define TRC_PV_HYPERCALL_V2          (TRC_PV_ENTRY + 13)
+#define TRC_PV_HYPERCALL_SUBCALL     (TRC_PV_SUBCALL + 14)
+
+/*
+ * TRC_PV_HYPERCALL_V2 format
+ *
+ * Only some of the hypercall argument are recorded. Bit fields A0 to
+ * A5 in the first extra word are set if the argument is present and
+ * the arguments themselves are packed sequentially in the following
+ * words.
+ *
+ * The TRC_64_FLAG bit is not set for these events (even if there are
+ * 64-bit arguments in the record).
+ *
+ * Word
+ * 0    bit 31 30|29 28|27 26|25 24|23 22|21 20|19 ... 0
+ *          A5   |A4   |A3   |A2   |A1   |A0   |Hypercall op
+ * 1    First 32 bit (or low word of first 64 bit) arg in record
+ * 2    Second 32 bit (or high word of first 64 bit) arg in record
+ * ...
+ *
+ * A0-A5 bitfield values:
+ *
+ *   00b  Argument not present
+ *   01b  32-bit argument present
+ *   10b  64-bit argument present
+ *   11b  Reserved
+ */
+#define TRC_PV_HYPERCALL_V2_ARG_32(i) (0x1 << (20 + 2*(i)))
+#define TRC_PV_HYPERCALL_V2_ARG_64(i) (0x2 << (20 + 2*(i)))
+#define TRC_PV_HYPERCALL_V2_ARG_MASK  (0xfff00000)
+
+#define TRC_SHADOW_NOT_SHADOW                 (TRC_SHADOW +  1)
+#define TRC_SHADOW_FAST_PROPAGATE             (TRC_SHADOW +  2)
+#define TRC_SHADOW_FAST_MMIO                  (TRC_SHADOW +  3)
+#define TRC_SHADOW_FALSE_FAST_PATH            (TRC_SHADOW +  4)
+#define TRC_SHADOW_MMIO                       (TRC_SHADOW +  5)
+#define TRC_SHADOW_FIXUP                      (TRC_SHADOW +  6)
+#define TRC_SHADOW_DOMF_DYING                 (TRC_SHADOW +  7)
+#define TRC_SHADOW_EMULATE                    (TRC_SHADOW +  8)
+#define TRC_SHADOW_EMULATE_UNSHADOW_USER      (TRC_SHADOW +  9)
+#define TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ    (TRC_SHADOW + 10)
+#define TRC_SHADOW_EMULATE_UNSHADOW_UNHANDLED (TRC_SHADOW + 11)
+#define TRC_SHADOW_WRMAP_BF                   (TRC_SHADOW + 12)
+#define TRC_SHADOW_PREALLOC_UNPIN             (TRC_SHADOW + 13)
+#define TRC_SHADOW_RESYNC_FULL                (TRC_SHADOW + 14)
+#define TRC_SHADOW_RESYNC_ONLY                (TRC_SHADOW + 15)
+
+/* trace events per subclass */
+#define TRC_HVM_NESTEDFLAG      (0x400)
+#define TRC_HVM_VMENTRY         (TRC_HVM_ENTRYEXIT + 0x01)
+#define TRC_HVM_VMEXIT          (TRC_HVM_ENTRYEXIT + 0x02)
+#define TRC_HVM_VMEXIT64        (TRC_HVM_ENTRYEXIT + TRC_64_FLAG + 0x02)
+#define TRC_HVM_PF_XEN          (TRC_HVM_HANDLER + 0x01)
+#define TRC_HVM_PF_XEN64        (TRC_HVM_HANDLER + TRC_64_FLAG + 0x01)
+#define TRC_HVM_PF_INJECT       (TRC_HVM_HANDLER + 0x02)
+#define TRC_HVM_PF_INJECT64     (TRC_HVM_HANDLER + TRC_64_FLAG + 0x02)
+#define TRC_HVM_INJ_EXC         (TRC_HVM_HANDLER + 0x03)
+#define TRC_HVM_INJ_VIRQ        (TRC_HVM_HANDLER + 0x04)
+#define TRC_HVM_REINJ_VIRQ      (TRC_HVM_HANDLER + 0x05)
+#define TRC_HVM_IO_READ         (TRC_HVM_HANDLER + 0x06)
+#define TRC_HVM_IO_WRITE        (TRC_HVM_HANDLER + 0x07)
+#define TRC_HVM_CR_READ         (TRC_HVM_HANDLER + 0x08)
+#define TRC_HVM_CR_READ64       (TRC_HVM_HANDLER + TRC_64_FLAG + 0x08)
+#define TRC_HVM_CR_WRITE        (TRC_HVM_HANDLER + 0x09)
+#define TRC_HVM_CR_WRITE64      (TRC_HVM_HANDLER + TRC_64_FLAG + 0x09)
+#define TRC_HVM_DR_READ         (TRC_HVM_HANDLER + 0x0A)
+#define TRC_HVM_DR_WRITE        (TRC_HVM_HANDLER + 0x0B)
+#define TRC_HVM_MSR_READ        (TRC_HVM_HANDLER + 0x0C)
+#define TRC_HVM_MSR_WRITE       (TRC_HVM_HANDLER + 0x0D)
+#define TRC_HVM_CPUID           (TRC_HVM_HANDLER + 0x0E)
+#define TRC_HVM_INTR            (TRC_HVM_HANDLER + 0x0F)
+#define TRC_HVM_NMI             (TRC_HVM_HANDLER + 0x10)
+#define TRC_HVM_SMI             (TRC_HVM_HANDLER + 0x11)
+#define TRC_HVM_VMMCALL         (TRC_HVM_HANDLER + 0x12)
+#define TRC_HVM_HLT             (TRC_HVM_HANDLER + 0x13)
+#define TRC_HVM_INVLPG          (TRC_HVM_HANDLER + 0x14)
+#define TRC_HVM_INVLPG64        (TRC_HVM_HANDLER + TRC_64_FLAG + 0x14)
+#define TRC_HVM_MCE             (TRC_HVM_HANDLER + 0x15)
+#define TRC_HVM_IOPORT_READ     (TRC_HVM_HANDLER + 0x16)
+#define TRC_HVM_IOMEM_READ      (TRC_HVM_HANDLER + 0x17)
+#define TRC_HVM_CLTS            (TRC_HVM_HANDLER + 0x18)
+#define TRC_HVM_LMSW            (TRC_HVM_HANDLER + 0x19)
+#define TRC_HVM_LMSW64          (TRC_HVM_HANDLER + TRC_64_FLAG + 0x19)
+#define TRC_HVM_RDTSC           (TRC_HVM_HANDLER + 0x1a)
+#define TRC_HVM_INTR_WINDOW     (TRC_HVM_HANDLER + 0x20)
+#define TRC_HVM_NPF             (TRC_HVM_HANDLER + 0x21)
+#define TRC_HVM_REALMODE_EMULATE (TRC_HVM_HANDLER + 0x22)
+#define TRC_HVM_TRAP             (TRC_HVM_HANDLER + 0x23)
+#define TRC_HVM_TRAP_DEBUG       (TRC_HVM_HANDLER + 0x24)
+#define TRC_HVM_VLAPIC           (TRC_HVM_HANDLER + 0x25)
+#define TRC_HVM_XCR_READ64      (TRC_HVM_HANDLER + TRC_64_FLAG + 0x26)
+#define TRC_HVM_XCR_WRITE64     (TRC_HVM_HANDLER + TRC_64_FLAG + 0x27)
+
+#define TRC_HVM_IOPORT_WRITE    (TRC_HVM_HANDLER + 0x216)
+#define TRC_HVM_IOMEM_WRITE     (TRC_HVM_HANDLER + 0x217)
+
+/* Trace events for emulated devices */
+#define TRC_HVM_EMUL_HPET_START_TIMER  (TRC_HVM_EMUL + 0x1)
+#define TRC_HVM_EMUL_PIT_START_TIMER   (TRC_HVM_EMUL + 0x2)
+#define TRC_HVM_EMUL_RTC_START_TIMER   (TRC_HVM_EMUL + 0x3)
+#define TRC_HVM_EMUL_LAPIC_START_TIMER (TRC_HVM_EMUL + 0x4)
+#define TRC_HVM_EMUL_HPET_STOP_TIMER   (TRC_HVM_EMUL + 0x5)
+#define TRC_HVM_EMUL_PIT_STOP_TIMER    (TRC_HVM_EMUL + 0x6)
+#define TRC_HVM_EMUL_RTC_STOP_TIMER    (TRC_HVM_EMUL + 0x7)
+#define TRC_HVM_EMUL_LAPIC_STOP_TIMER  (TRC_HVM_EMUL + 0x8)
+#define TRC_HVM_EMUL_PIT_TIMER_CB      (TRC_HVM_EMUL + 0x9)
+#define TRC_HVM_EMUL_LAPIC_TIMER_CB    (TRC_HVM_EMUL + 0xA)
+#define TRC_HVM_EMUL_PIC_INT_OUTPUT    (TRC_HVM_EMUL + 0xB)
+#define TRC_HVM_EMUL_PIC_KICK          (TRC_HVM_EMUL + 0xC)
+#define TRC_HVM_EMUL_PIC_INTACK        (TRC_HVM_EMUL + 0xD)
+#define TRC_HVM_EMUL_PIC_POSEDGE       (TRC_HVM_EMUL + 0xE)
+#define TRC_HVM_EMUL_PIC_NEGEDGE       (TRC_HVM_EMUL + 0xF)
+#define TRC_HVM_EMUL_PIC_PEND_IRQ_CALL (TRC_HVM_EMUL + 0x10)
+#define TRC_HVM_EMUL_LAPIC_PIC_INTR    (TRC_HVM_EMUL + 0x11)
+
+/* trace events for per class */
+#define TRC_PM_FREQ_CHANGE      (TRC_HW_PM + 0x01)
+#define TRC_PM_IDLE_ENTRY       (TRC_HW_PM + 0x02)
+#define TRC_PM_IDLE_EXIT        (TRC_HW_PM + 0x03)
+
+/* Trace events for IRQs */
+#define TRC_HW_IRQ_MOVE_CLEANUP_DELAY (TRC_HW_IRQ + 0x1)
+#define TRC_HW_IRQ_MOVE_CLEANUP       (TRC_HW_IRQ + 0x2)
+#define TRC_HW_IRQ_BIND_VECTOR        (TRC_HW_IRQ + 0x3)
+#define TRC_HW_IRQ_CLEAR_VECTOR       (TRC_HW_IRQ + 0x4)
+#define TRC_HW_IRQ_MOVE_FINISH        (TRC_HW_IRQ + 0x5)
+#define TRC_HW_IRQ_ASSIGN_VECTOR      (TRC_HW_IRQ + 0x6)
+#define TRC_HW_IRQ_UNMAPPED_VECTOR    (TRC_HW_IRQ + 0x7)
+#define TRC_HW_IRQ_HANDLED            (TRC_HW_IRQ + 0x8)
+
+/*
+ * Event Flags
+ *
+ * Some events (e.g, TRC_PV_TRAP and TRC_HVM_IOMEM_READ) have multiple
+ * record formats.  These event flags distinguish between the
+ * different formats.
+ */
+#define TRC_64_FLAG 0x100 /* Addresses are 64 bits (instead of 32 bits) */
+
+/* This structure represents a single trace buffer record. */
+struct t_rec {
+    uint32_t event:28;
+    uint32_t extra_u32:3;         /* # entries in trailing extra_u32[] array */
+    uint32_t cycles_included:1;   /* u.cycles or u.no_cycles? */
+    union {
+        struct {
+            uint32_t cycles_lo, cycles_hi; /* cycle counter timestamp */
+            uint32_t extra_u32[7];         /* event data items */
+        } cycles;
+        struct {
+            uint32_t extra_u32[7];         /* event data items */
+        } nocycles;
+    } u;
+};
+
+/*
+ * This structure contains the metadata for a single trace buffer.  The head
+ * field, indexes into an array of struct t_rec's.
+ */
+struct t_buf {
+    /* Assume the data buffer size is X.  X is generally not a power of 2.
+     * CONS and PROD are incremented modulo (2*X):
+     *     0 <= cons < 2*X
+     *     0 <= prod < 2*X
+     * This is done because addition modulo X breaks at 2^32 when X is not a
+     * power of 2:
+     *     (((2^32 - 1) % X) + 1) % X != (2^32) % X
+     */
+    uint32_t cons;   /* Offset of next item to be consumed by control tools. */
+    uint32_t prod;   /* Offset of next item to be produced by Xen.           */
+    /*  Records follow immediately after the meta-data header.    */
+};
+
+/* Structure used to pass MFNs to the trace buffers back to trace consumers.
+ * Offset is an offset into the mapped structure where the mfn list will be held.
+ * MFNs will be at ((unsigned long *)(t_info))+(t_info->cpu_offset[cpu]).
+ */
+struct t_info {
+    uint16_t tbuf_size; /* Size in pages of each trace buffer */
+    uint16_t mfn_offset[];  /* Offset within t_info structure of the page list per cpu */
+    /* MFN lists immediately after the header */
+};
+
+#endif /* __XEN_PUBLIC_TRACE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/vcpu.h b/include/standard-headers/xen/vcpu.h
new file mode 100644
index 0000000000..3623af932f
--- /dev/null
+++ b/include/standard-headers/xen/vcpu.h
@@ -0,0 +1,248 @@
+/******************************************************************************
+ * vcpu.h
+ *
+ * VCPU initialisation, query, and hotplug.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
+ */
+
+#ifndef __XEN_PUBLIC_VCPU_H__
+#define __XEN_PUBLIC_VCPU_H__
+
+#include "xen.h"
+
+/*
+ * Prototype for this hypercall is:
+ *  long vcpu_op(int cmd, unsigned int vcpuid, void *extra_args)
+ * @cmd        == VCPUOP_??? (VCPU operation).
+ * @vcpuid     == VCPU to operate on.
+ * @extra_args == Operation-specific extra arguments (NULL if none).
+ */
+
+/*
+ * Initialise a VCPU. Each VCPU can be initialised only once. A
+ * newly-initialised VCPU will not run until it is brought up by VCPUOP_up.
+ *
+ * @extra_arg == For PV or ARM guests this is a pointer to a vcpu_guest_context
+ *               structure containing the initial state for the VCPU. For x86
+ *               HVM based guests this is a pointer to a vcpu_hvm_context
+ *               structure.
+ */
+#define VCPUOP_initialise            0
+
+/*
+ * Bring up a VCPU. This makes the VCPU runnable. This operation will fail
+ * if the VCPU has not been initialised (VCPUOP_initialise).
+ */
+#define VCPUOP_up                    1
+
+/*
+ * Bring down a VCPU (i.e., make it non-runnable).
+ * There are a few caveats that callers should observe:
+ *  1. This operation may return, and VCPU_is_up may return false, before the
+ *     VCPU stops running (i.e., the command is asynchronous). It is a good
+ *     idea to ensure that the VCPU has entered a non-critical loop before
+ *     bringing it down. Alternatively, this operation is guaranteed
+ *     synchronous if invoked by the VCPU itself.
+ *  2. After a VCPU is initialised, there is currently no way to drop all its
+ *     references to domain memory. Even a VCPU that is down still holds
+ *     memory references via its pagetable base pointer and GDT. It is good
+ *     practise to move a VCPU onto an 'idle' or default page table, LDT and
+ *     GDT before bringing it down.
+ */
+#define VCPUOP_down                  2
+
+/* Returns 1 if the given VCPU is up. */
+#define VCPUOP_is_up                 3
+
+/*
+ * Return information about the state and running time of a VCPU.
+ * @extra_arg == pointer to vcpu_runstate_info structure.
+ */
+#define VCPUOP_get_runstate_info     4
+struct vcpu_runstate_info {
+    /* VCPU's current state (RUNSTATE_*). */
+    int      state;
+    /* When was current state entered (system time, ns)? */
+    uint64_t state_entry_time;
+    /*
+     * Update indicator set in state_entry_time:
+     * When activated via VMASST_TYPE_runstate_update_flag, set during
+     * updates in guest memory mapped copy of vcpu_runstate_info.
+     */
+#define XEN_RUNSTATE_UPDATE          (xen_mk_ullong(1) << 63)
+    /*
+     * Time spent in each RUNSTATE_* (ns). The sum of these times is
+     * guaranteed not to drift from system time.
+     */
+    uint64_t time[4];
+};
+typedef struct vcpu_runstate_info vcpu_runstate_info_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
+
+/* VCPU is currently running on a physical CPU. */
+#define RUNSTATE_running  0
+
+/* VCPU is runnable, but not currently scheduled on any physical CPU. */
+#define RUNSTATE_runnable 1
+
+/* VCPU is blocked (a.k.a. idle). It is therefore not runnable. */
+#define RUNSTATE_blocked  2
+
+/*
+ * VCPU is not runnable, but it is not blocked.
+ * This is a 'catch all' state for things like hotplug and pauses by the
+ * system administrator (or for critical sections in the hypervisor).
+ * RUNSTATE_blocked dominates this state (it is the preferred state).
+ */
+#define RUNSTATE_offline  3
+
+/*
+ * Register a shared memory area from which the guest may obtain its own
+ * runstate information without needing to execute a hypercall.
+ * Notes:
+ *  1. The registered address may be virtual or physical or guest handle,
+ *     depending on the platform. Virtual address or guest handle should be
+ *     registered on x86 systems.
+ *  2. Only one shared area may be registered per VCPU. The shared area is
+ *     updated by the hypervisor each time the VCPU is scheduled. Thus
+ *     runstate.state will always be RUNSTATE_running and
+ *     runstate.state_entry_time will indicate the system time at which the
+ *     VCPU was last scheduled to run.
+ * @extra_arg == pointer to vcpu_register_runstate_memory_area structure.
+ */
+#define VCPUOP_register_runstate_memory_area 5
+struct vcpu_register_runstate_memory_area {
+    union {
+        XEN_GUEST_HANDLE(vcpu_runstate_info_t) h;
+        struct vcpu_runstate_info *v;
+        uint64_t p;
+    } addr;
+};
+typedef struct vcpu_register_runstate_memory_area vcpu_register_runstate_memory_area_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_register_runstate_memory_area_t);
+
+/*
+ * Set or stop a VCPU's periodic timer. Every VCPU has one periodic timer
+ * which can be set via these commands. Periods smaller than one millisecond
+ * may not be supported.
+ */
+#define VCPUOP_set_periodic_timer    6 /* arg == vcpu_set_periodic_timer_t */
+#define VCPUOP_stop_periodic_timer   7 /* arg == NULL */
+struct vcpu_set_periodic_timer {
+    uint64_t period_ns;
+};
+typedef struct vcpu_set_periodic_timer vcpu_set_periodic_timer_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_set_periodic_timer_t);
+
+/*
+ * Set or stop a VCPU's single-shot timer. Every VCPU has one single-shot
+ * timer which can be set via these commands.
+ */
+#define VCPUOP_set_singleshot_timer  8 /* arg == vcpu_set_singleshot_timer_t */
+#define VCPUOP_stop_singleshot_timer 9 /* arg == NULL */
+struct vcpu_set_singleshot_timer {
+    uint64_t timeout_abs_ns;   /* Absolute system time value in nanoseconds. */
+    uint32_t flags;            /* VCPU_SSHOTTMR_??? */
+};
+typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
+
+/* Flags to VCPUOP_set_singleshot_timer. */
+ /* Require the timeout to be in the future (return -ETIME if it's passed). */
+#define _VCPU_SSHOTTMR_future (0)
+#define VCPU_SSHOTTMR_future  (1U << _VCPU_SSHOTTMR_future)
+
+/*
+ * Register a memory location in the guest address space for the
+ * vcpu_info structure.  This allows the guest to place the vcpu_info
+ * structure in a convenient place, such as in a per-cpu data area.
+ * The pointer need not be page aligned, but the structure must not
+ * cross a page boundary.
+ *
+ * This may be called only once per vcpu.
+ */
+#define VCPUOP_register_vcpu_info   10  /* arg == vcpu_register_vcpu_info_t */
+struct vcpu_register_vcpu_info {
+    uint64_t mfn;    /* mfn of page to place vcpu_info */
+    uint32_t offset; /* offset within page */
+    uint32_t rsvd;   /* unused */
+};
+typedef struct vcpu_register_vcpu_info vcpu_register_vcpu_info_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_register_vcpu_info_t);
+
+/* Send an NMI to the specified VCPU. @extra_arg == NULL. */
+#define VCPUOP_send_nmi             11
+
+/*
+ * Get the physical ID information for a pinned vcpu's underlying physical
+ * processor.  The physical ID informmation is architecture-specific.
+ * On x86: id[31:0]=apic_id, id[63:32]=acpi_id.
+ * This command returns -EINVAL if it is not a valid operation for this VCPU.
+ */
+#define VCPUOP_get_physid           12 /* arg == vcpu_get_physid_t */
+struct vcpu_get_physid {
+    uint64_t phys_id;
+};
+typedef struct vcpu_get_physid vcpu_get_physid_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_get_physid_t);
+#define xen_vcpu_physid_to_x86_apicid(physid) ((uint32_t)(physid))
+#define xen_vcpu_physid_to_x86_acpiid(physid) ((uint32_t)((physid) >> 32))
+
+/*
+ * Register a memory location to get a secondary copy of the vcpu time
+ * parameters.  The master copy still exists as part of the vcpu shared
+ * memory area, and this secondary copy is updated whenever the master copy
+ * is updated (and using the same versioning scheme for synchronisation).
+ *
+ * The intent is that this copy may be mapped (RO) into userspace so
+ * that usermode can compute system time using the time info and the
+ * tsc.  Usermode will see an array of vcpu_time_info structures, one
+ * for each vcpu, and choose the right one by an existing mechanism
+ * which allows it to get the current vcpu number (such as via a
+ * segment limit).  It can then apply the normal algorithm to compute
+ * system time from the tsc.
+ *
+ * @extra_arg == pointer to vcpu_register_time_info_memory_area structure.
+ */
+#define VCPUOP_register_vcpu_time_memory_area   13
+DEFINE_XEN_GUEST_HANDLE(vcpu_time_info_t);
+struct vcpu_register_time_memory_area {
+    union {
+        XEN_GUEST_HANDLE(vcpu_time_info_t) h;
+        struct vcpu_time_info *v;
+        uint64_t p;
+    } addr;
+};
+typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
+
+#endif /* __XEN_PUBLIC_VCPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/version.h b/include/standard-headers/xen/version.h
new file mode 100644
index 0000000000..17a81e23cd
--- /dev/null
+++ b/include/standard-headers/xen/version.h
@@ -0,0 +1,113 @@
+/******************************************************************************
+ * version.h
+ *
+ * Xen version, type, and compile information.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2005, Nguyen Anh Quynh <aquynh@gmail.com>
+ * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
+ */
+
+#ifndef __XEN_PUBLIC_VERSION_H__
+#define __XEN_PUBLIC_VERSION_H__
+
+#include "xen.h"
+
+/* NB. All ops return zero on success, except XENVER_{version,pagesize}
+ * XENVER_{version,pagesize,build_id} */
+
+/* arg == NULL; returns major:minor (16:16). */
+#define XENVER_version      0
+
+/* arg == xen_extraversion_t. */
+#define XENVER_extraversion 1
+typedef char xen_extraversion_t[16];
+#define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
+
+/* arg == xen_compile_info_t. */
+#define XENVER_compile_info 2
+struct xen_compile_info {
+    char compiler[64];
+    char compile_by[16];
+    char compile_domain[32];
+    char compile_date[32];
+};
+typedef struct xen_compile_info xen_compile_info_t;
+
+#define XENVER_capabilities 3
+typedef char xen_capabilities_info_t[1024];
+#define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
+
+#define XENVER_changeset 4
+typedef char xen_changeset_info_t[64];
+#define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
+
+#define XENVER_platform_parameters 5
+struct xen_platform_parameters {
+    xen_ulong_t virt_start;
+};
+typedef struct xen_platform_parameters xen_platform_parameters_t;
+
+#define XENVER_get_features 6
+struct xen_feature_info {
+    unsigned int submap_idx;    /* IN: which 32-bit submap to return */
+    uint32_t     submap;        /* OUT: 32-bit submap */
+};
+typedef struct xen_feature_info xen_feature_info_t;
+
+/* Declares the features reported by XENVER_get_features. */
+#include "features.h"
+
+/* arg == NULL; returns host memory page size. */
+#define XENVER_pagesize 7
+
+/* arg == xen_domain_handle_t.
+ *
+ * The toolstack fills it out for guest consumption. It is intended to hold
+ * the UUID of the guest.
+ */
+#define XENVER_guest_handle 8
+
+#define XENVER_commandline 9
+typedef char xen_commandline_t[1024];
+
+/*
+ * Return value is the number of bytes written, or XEN_Exx on error.
+ * Calling with empty parameter returns the size of build_id.
+ */
+#define XENVER_build_id 10
+struct xen_build_id {
+        uint32_t        len; /* IN: size of buf[]. */
+        unsigned char   buf[XEN_FLEX_ARRAY_DIM];
+                             /* OUT: Variable length buffer with build_id. */
+};
+typedef struct xen_build_id xen_build_id_t;
+
+#endif /* __XEN_PUBLIC_VERSION_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/standard-headers/xen/xen-compat.h b/include/standard-headers/xen/xen-compat.h
new file mode 100644
index 0000000000..e1c027a95c
--- /dev/null
+++ b/include/standard-headers/xen/xen-compat.h
@@ -0,0 +1,46 @@
+/******************************************************************************
+ * xen-compat.h
+ *
+ * Guest OS interface to Xen.  Compatibility layer.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2006, Christian Limpach
+ */
+
+#ifndef __XEN_PUBLIC_XEN_COMPAT_H__
+#define __XEN_PUBLIC_XEN_COMPAT_H__
+
+#define __XEN_LATEST_INTERFACE_VERSION__ 0x00040e00
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/* Xen is built with matching headers and implements the latest interface. */
+#define __XEN_INTERFACE_VERSION__ __XEN_LATEST_INTERFACE_VERSION__
+#elif !defined(__XEN_INTERFACE_VERSION__)
+/* Guests which do not specify a version get the legacy interface. */
+#define __XEN_INTERFACE_VERSION__ 0x00000000
+#endif
+
+#if __XEN_INTERFACE_VERSION__ > __XEN_LATEST_INTERFACE_VERSION__
+#error "These header files do not support the requested interface version."
+#endif
+
+#define COMPAT_FLEX_ARRAY_DIM XEN_FLEX_ARRAY_DIM
+
+#endif /* __XEN_PUBLIC_XEN_COMPAT_H__ */
diff --git a/include/standard-headers/xen/xen.h b/include/standard-headers/xen/xen.h
new file mode 100644
index 0000000000..e373592c33
--- /dev/null
+++ b/include/standard-headers/xen/xen.h
@@ -0,0 +1,1049 @@
+/******************************************************************************
+ * xen.h
+ *
+ * Guest OS interface to Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004, K A Fraser
+ */
+
+#ifndef __XEN_PUBLIC_XEN_H__
+#define __XEN_PUBLIC_XEN_H__
+
+#include "xen-compat.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+#include "arch-x86/xen.h"
+#elif defined(__arm__) || defined (__aarch64__)
+#include "arch-arm.h"
+#else
+#error "Unsupported architecture"
+#endif
+
+#ifndef __ASSEMBLY__
+/* Guest handles for primitive C types. */
+DEFINE_XEN_GUEST_HANDLE(char);
+__DEFINE_XEN_GUEST_HANDLE(uchar, unsigned char);
+DEFINE_XEN_GUEST_HANDLE(int);
+__DEFINE_XEN_GUEST_HANDLE(uint,  unsigned int);
+#if __XEN_INTERFACE_VERSION__ < 0x00040300
+DEFINE_XEN_GUEST_HANDLE(long);
+__DEFINE_XEN_GUEST_HANDLE(ulong, unsigned long);
+#endif
+DEFINE_XEN_GUEST_HANDLE(void);
+
+DEFINE_XEN_GUEST_HANDLE(uint64_t);
+DEFINE_XEN_GUEST_HANDLE(xen_pfn_t);
+DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
+
+/* Define a variable length array (depends on compiler). */
+#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
+#define XEN_FLEX_ARRAY_DIM
+#elif defined(__GNUC__)
+#define XEN_FLEX_ARRAY_DIM  0
+#else
+#define XEN_FLEX_ARRAY_DIM  1 /* variable size */
+#endif
+
+/* Turn a plain number into a C unsigned (long (long)) constant. */
+#define __xen_mk_uint(x)  x ## U
+#define __xen_mk_ulong(x) x ## UL
+#ifndef __xen_mk_ullong
+# define __xen_mk_ullong(x) x ## ULL
+#endif
+#define xen_mk_uint(x)    __xen_mk_uint(x)
+#define xen_mk_ulong(x)   __xen_mk_ulong(x)
+#define xen_mk_ullong(x)  __xen_mk_ullong(x)
+
+#else
+
+/* In assembly code we cannot use C numeric constant suffixes. */
+#define xen_mk_uint(x)   x
+#define xen_mk_ulong(x)  x
+#define xen_mk_ullong(x) x
+
+#endif
+
+/*
+ * HYPERCALLS
+ */
+
+/* `incontents 100 hcalls List of hypercalls
+ * ` enum hypercall_num { // __HYPERVISOR_* => HYPERVISOR_*()
+ */
+
+#define __HYPERVISOR_set_trap_table        0
+#define __HYPERVISOR_mmu_update            1
+#define __HYPERVISOR_set_gdt               2
+#define __HYPERVISOR_stack_switch          3
+#define __HYPERVISOR_set_callbacks         4
+#define __HYPERVISOR_fpu_taskswitch        5
+#define __HYPERVISOR_sched_op_compat       6 /* compat since 0x00030101 */
+#define __HYPERVISOR_platform_op           7
+#define __HYPERVISOR_set_debugreg          8
+#define __HYPERVISOR_get_debugreg          9
+#define __HYPERVISOR_update_descriptor    10
+#define __HYPERVISOR_memory_op            12
+#define __HYPERVISOR_multicall            13
+#define __HYPERVISOR_update_va_mapping    14
+#define __HYPERVISOR_set_timer_op         15
+#define __HYPERVISOR_event_channel_op_compat 16 /* compat since 0x00030202 */
+#define __HYPERVISOR_xen_version          17
+#define __HYPERVISOR_console_io           18
+#define __HYPERVISOR_physdev_op_compat    19 /* compat since 0x00030202 */
+#define __HYPERVISOR_grant_table_op       20
+#define __HYPERVISOR_vm_assist            21
+#define __HYPERVISOR_update_va_mapping_otherdomain 22
+#define __HYPERVISOR_iret                 23 /* x86 only */
+#define __HYPERVISOR_vcpu_op              24
+#define __HYPERVISOR_set_segment_base     25 /* x86/64 only */
+#define __HYPERVISOR_mmuext_op            26
+#define __HYPERVISOR_xsm_op               27
+#define __HYPERVISOR_nmi_op               28
+#define __HYPERVISOR_sched_op             29
+#define __HYPERVISOR_callback_op          30
+#define __HYPERVISOR_xenoprof_op          31
+#define __HYPERVISOR_event_channel_op     32
+#define __HYPERVISOR_physdev_op           33
+#define __HYPERVISOR_hvm_op               34
+#define __HYPERVISOR_sysctl               35
+#define __HYPERVISOR_domctl               36
+#define __HYPERVISOR_kexec_op             37
+#define __HYPERVISOR_tmem_op              38
+#define __HYPERVISOR_argo_op              39
+#define __HYPERVISOR_xenpmu_op            40
+#define __HYPERVISOR_dm_op                41
+#define __HYPERVISOR_hypfs_op             42
+
+/* Architecture-specific hypercall definitions. */
+#define __HYPERVISOR_arch_0               48
+#define __HYPERVISOR_arch_1               49
+#define __HYPERVISOR_arch_2               50
+#define __HYPERVISOR_arch_3               51
+#define __HYPERVISOR_arch_4               52
+#define __HYPERVISOR_arch_5               53
+#define __HYPERVISOR_arch_6               54
+#define __HYPERVISOR_arch_7               55
+
+/* ` } */
+
+/*
+ * HYPERCALL COMPATIBILITY.
+ */
+
+/* New sched_op hypercall introduced in 0x00030101. */
+#if __XEN_INTERFACE_VERSION__ < 0x00030101
+#undef __HYPERVISOR_sched_op
+#define __HYPERVISOR_sched_op __HYPERVISOR_sched_op_compat
+#endif
+
+/* New event-channel and physdev hypercalls introduced in 0x00030202. */
+#if __XEN_INTERFACE_VERSION__ < 0x00030202
+#undef __HYPERVISOR_event_channel_op
+#define __HYPERVISOR_event_channel_op __HYPERVISOR_event_channel_op_compat
+#undef __HYPERVISOR_physdev_op
+#define __HYPERVISOR_physdev_op __HYPERVISOR_physdev_op_compat
+#endif
+
+/* New platform_op hypercall introduced in 0x00030204. */
+#if __XEN_INTERFACE_VERSION__ < 0x00030204
+#define __HYPERVISOR_dom0_op __HYPERVISOR_platform_op
+#endif
+
+/*
+ * VIRTUAL INTERRUPTS
+ *
+ * Virtual interrupts that a guest OS may receive from Xen.
+ *
+ * In the side comments, 'V.' denotes a per-VCPU VIRQ while 'G.' denotes a
+ * global VIRQ. The former can be bound once per VCPU and cannot be re-bound.
+ * The latter can be allocated only once per guest: they must initially be
+ * allocated to VCPU0 but can subsequently be re-bound.
+ */
+/* ` enum virq { */
+#define VIRQ_TIMER      0  /* V. Timebase update, and/or requested timeout.  */
+#define VIRQ_DEBUG      1  /* V. Request guest to dump debug info.           */
+#define VIRQ_CONSOLE    2  /* G. (DOM0) Bytes received on emergency console. */
+#define VIRQ_DOM_EXC    3  /* G. (DOM0) Exceptional event for some domain.   */
+#define VIRQ_TBUF       4  /* G. (DOM0) Trace buffer has records available.  */
+#define VIRQ_DEBUGGER   6  /* G. (DOM0) A domain has paused for debugging.   */
+#define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
+#define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
+#define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
+#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred          */
+#define VIRQ_ARGO       11 /* G. Argo interdomain message notification       */
+#define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
+#define VIRQ_XENPMU     13 /* V.  PMC interrupt                              */
+
+/* Architecture-specific VIRQ definitions. */
+#define VIRQ_ARCH_0    16
+#define VIRQ_ARCH_1    17
+#define VIRQ_ARCH_2    18
+#define VIRQ_ARCH_3    19
+#define VIRQ_ARCH_4    20
+#define VIRQ_ARCH_5    21
+#define VIRQ_ARCH_6    22
+#define VIRQ_ARCH_7    23
+/* ` } */
+
+#define NR_VIRQS       24
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_mmu_update(const struct mmu_update reqs[],
+ * `                       unsigned count, unsigned *done_out,
+ * `                       unsigned foreigndom)
+ * `
+ * @reqs is an array of mmu_update_t structures ((ptr, val) pairs).
+ * @count is the length of the above array.
+ * @pdone is an output parameter indicating number of completed operations
+ * @foreigndom[15:0]: FD, the expected owner of data pages referenced in this
+ *                    hypercall invocation. Can be DOMID_SELF.
+ * @foreigndom[31:16]: PFD, the expected owner of pagetable pages referenced
+ *                     in this hypercall invocation. The value of this field
+ *                     (x) encodes the PFD as follows:
+ *                     x == 0 => PFD == DOMID_SELF
+ *                     x != 0 => PFD == x - 1
+ *
+ * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command.
+ * -------------
+ * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
+ * Updates an entry in a page table belonging to PFD. If updating an L1 table,
+ * and the new table entry is valid/present, the mapped frame must belong to
+ * FD. If attempting to map an I/O page then the caller assumes the privilege
+ * of the FD.
+ * FD == DOMID_IO: Permit /only/ I/O mappings, at the priv level of the caller.
+ * FD == DOMID_XEN: Map restricted areas of Xen's heap space.
+ * ptr[:2]  -- Machine address of the page-table entry to modify.
+ * val      -- Value to write.
+ *
+ * There also certain implicit requirements when using this hypercall. The
+ * pages that make up a pagetable must be mapped read-only in the guest.
+ * This prevents uncontrolled guest updates to the pagetable. Xen strictly
+ * enforces this, and will disallow any pagetable update which will end up
+ * mapping pagetable page RW, and will disallow using any writable page as a
+ * pagetable. In practice it means that when constructing a page table for a
+ * process, thread, etc, we MUST be very dilligient in following these rules:
+ *  1). Start with top-level page (PGD or in Xen language: L4). Fill out
+ *      the entries.
+ *  2). Keep on going, filling out the upper (PUD or L3), and middle (PMD
+ *      or L2).
+ *  3). Start filling out the PTE table (L1) with the PTE entries. Once
+ *  	done, make sure to set each of those entries to RO (so writeable bit
+ *  	is unset). Once that has been completed, set the PMD (L2) for this
+ *  	PTE table as RO.
+ *  4). When completed with all of the PMD (L2) entries, and all of them have
+ *  	been set to RO, make sure to set RO the PUD (L3). Do the same
+ *  	operation on PGD (L4) pagetable entries that have a PUD (L3) entry.
+ *  5). Now before you can use those pages (so setting the cr3), you MUST also
+ *      pin them so that the hypervisor can verify the entries. This is done
+ *      via the HYPERVISOR_mmuext_op(MMUEXT_PIN_L4_TABLE, guest physical frame
+ *      number of the PGD (L4)). And this point the HYPERVISOR_mmuext_op(
+ *      MMUEXT_NEW_BASEPTR, guest physical frame number of the PGD (L4)) can be
+ *      issued.
+ * For 32-bit guests, the L4 is not used (as there is less pagetables), so
+ * instead use L3.
+ * At this point the pagetables can be modified using the MMU_NORMAL_PT_UPDATE
+ * hypercall. Also if so desired the OS can also try to write to the PTE
+ * and be trapped by the hypervisor (as the PTE entry is RO).
+ *
+ * To deallocate the pages, the operations are the reverse of the steps
+ * mentioned above. The argument is MMUEXT_UNPIN_TABLE for all levels and the
+ * pagetable MUST not be in use (meaning that the cr3 is not set to it).
+ *
+ * ptr[1:0] == MMU_MACHPHYS_UPDATE:
+ * Updates an entry in the machine->pseudo-physical mapping table.
+ * ptr[:2]  -- Machine address within the frame whose mapping to modify.
+ *             The frame must belong to the FD, if one is specified.
+ * val      -- Value to write into the mapping entry.
+ *
+ * ptr[1:0] == MMU_PT_UPDATE_PRESERVE_AD:
+ * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are ORed
+ * with those in @val.
+ *
+ * ptr[1:0] == MMU_PT_UPDATE_NO_TRANSLATE:
+ * As MMU_NORMAL_PT_UPDATE above, but @val is not translated though FD
+ * page tables.
+ *
+ * @val is usually the machine frame number along with some attributes.
+ * The attributes by default follow the architecture defined bits. Meaning that
+ * if this is a X86_64 machine and four page table layout is used, the layout
+ * of val is:
+ *  - 63 if set means No execute (NX)
+ *  - 46-13 the machine frame number
+ *  - 12 available for guest
+ *  - 11 available for guest
+ *  - 10 available for guest
+ *  - 9 available for guest
+ *  - 8 global
+ *  - 7 PAT (PSE is disabled, must use hypercall to make 4MB or 2MB pages)
+ *  - 6 dirty
+ *  - 5 accessed
+ *  - 4 page cached disabled
+ *  - 3 page write through
+ *  - 2 userspace accessible
+ *  - 1 writeable
+ *  - 0 present
+ *
+ *  The one bits that does not fit with the default layout is the PAGE_PSE
+ *  also called PAGE_PAT). The MMUEXT_[UN]MARK_SUPER arguments to the
+ *  HYPERVISOR_mmuext_op serve as mechanism to set a pagetable to be 4MB
+ *  (or 2MB) instead of using the PAGE_PSE bit.
+ *
+ *  The reason that the PAGE_PSE (bit 7) is not being utilized is due to Xen
+ *  using it as the Page Attribute Table (PAT) bit - for details on it please
+ *  refer to Intel SDM 10.12. The PAT allows to set the caching attributes of
+ *  pages instead of using MTRRs.
+ *
+ *  The PAT MSR is as follows (it is a 64-bit value, each entry is 8 bits):
+ *                    PAT4                 PAT0
+ *  +-----+-----+----+----+----+-----+----+----+
+ *  | UC  | UC- | WC | WB | UC | UC- | WC | WB |  <= Linux
+ *  +-----+-----+----+----+----+-----+----+----+
+ *  | UC  | UC- | WT | WB | UC | UC- | WT | WB |  <= BIOS (default when machine boots)
+ *  +-----+-----+----+----+----+-----+----+----+
+ *  | rsv | rsv | WP | WC | UC | UC- | WT | WB |  <= Xen
+ *  +-----+-----+----+----+----+-----+----+----+
+ *
+ *  The lookup of this index table translates to looking up
+ *  Bit 7, Bit 4, and Bit 3 of val entry:
+ *
+ *  PAT/PSE (bit 7) ... PCD (bit 4) .. PWT (bit 3).
+ *
+ *  If all bits are off, then we are using PAT0. If bit 3 turned on,
+ *  then we are using PAT1, if bit 3 and bit 4, then PAT2..
+ *
+ *  As you can see, the Linux PAT1 translates to PAT4 under Xen. Which means
+ *  that if a guest that follows Linux's PAT setup and would like to set Write
+ *  Combined on pages it MUST use PAT4 entry. Meaning that Bit 7 (PAGE_PAT) is
+ *  set. For example, under Linux it only uses PAT0, PAT1, and PAT2 for the
+ *  caching as:
+ *
+ *   WB = none (so PAT0)
+ *   WC = PWT (bit 3 on)
+ *   UC = PWT | PCD (bit 3 and 4 are on).
+ *
+ * To make it work with Xen, it needs to translate the WC bit as so:
+ *
+ *  PWT (so bit 3 on) --> PAT (so bit 7 is on) and clear bit 3
+ *
+ * And to translate back it would:
+ *
+ * PAT (bit 7 on) --> PWT (bit 3 on) and clear bit 7.
+ */
+#define MMU_NORMAL_PT_UPDATE       0 /* checked '*ptr = val'. ptr is MA.      */
+#define MMU_MACHPHYS_UPDATE        1 /* ptr = MA of frame to modify entry for */
+#define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
+#define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
+                                     /* val never translated.                 */
+
+/*
+ * MMU EXTENDED OPERATIONS
+ *
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_mmuext_op(mmuext_op_t uops[],
+ * `                      unsigned int count,
+ * `                      unsigned int *pdone,
+ * `                      unsigned int foreigndom)
+ */
+/* HYPERVISOR_mmuext_op() accepts a list of mmuext_op structures.
+ * A foreigndom (FD) can be specified (or DOMID_SELF for none).
+ * Where the FD has some effect, it is described below.
+ *
+ * cmd: MMUEXT_(UN)PIN_*_TABLE
+ * mfn: Machine frame number to be (un)pinned as a p.t. page.
+ *      The frame must belong to the FD, if one is specified.
+ *
+ * cmd: MMUEXT_NEW_BASEPTR
+ * mfn: Machine frame number of new page-table base to install in MMU.
+ *
+ * cmd: MMUEXT_NEW_USER_BASEPTR [x86/64 only]
+ * mfn: Machine frame number of new page-table base to install in MMU
+ *      when in user space.
+ *
+ * cmd: MMUEXT_TLB_FLUSH_LOCAL
+ * No additional arguments. Flushes local TLB.
+ *
+ * cmd: MMUEXT_INVLPG_LOCAL
+ * linear_addr: Linear address to be flushed from the local TLB.
+ *
+ * cmd: MMUEXT_TLB_FLUSH_MULTI
+ * vcpumask: Pointer to bitmap of VCPUs to be flushed.
+ *
+ * cmd: MMUEXT_INVLPG_MULTI
+ * linear_addr: Linear address to be flushed.
+ * vcpumask: Pointer to bitmap of VCPUs to be flushed.
+ *
+ * cmd: MMUEXT_TLB_FLUSH_ALL
+ * No additional arguments. Flushes all VCPUs' TLBs.
+ *
+ * cmd: MMUEXT_INVLPG_ALL
+ * linear_addr: Linear address to be flushed from all VCPUs' TLBs.
+ *
+ * cmd: MMUEXT_FLUSH_CACHE
+ * No additional arguments. Writes back and flushes cache contents.
+ *
+ * cmd: MMUEXT_FLUSH_CACHE_GLOBAL
+ * No additional arguments. Writes back and flushes cache contents
+ * on all CPUs in the system.
+ *
+ * cmd: MMUEXT_SET_LDT
+ * linear_addr: Linear address of LDT base (NB. must be page-aligned).
+ * nr_ents: Number of entries in LDT.
+ *
+ * cmd: MMUEXT_CLEAR_PAGE
+ * mfn: Machine frame number to be cleared.
+ *
+ * cmd: MMUEXT_COPY_PAGE
+ * mfn: Machine frame number of the destination page.
+ * src_mfn: Machine frame number of the source page.
+ *
+ * cmd: MMUEXT_[UN]MARK_SUPER
+ * mfn: Machine frame number of head of superpage to be [un]marked.
+ */
+/* ` enum mmuext_cmd { */
+#define MMUEXT_PIN_L1_TABLE      0
+#define MMUEXT_PIN_L2_TABLE      1
+#define MMUEXT_PIN_L3_TABLE      2
+#define MMUEXT_PIN_L4_TABLE      3
+#define MMUEXT_UNPIN_TABLE       4
+#define MMUEXT_NEW_BASEPTR       5
+#define MMUEXT_TLB_FLUSH_LOCAL   6
+#define MMUEXT_INVLPG_LOCAL      7
+#define MMUEXT_TLB_FLUSH_MULTI   8
+#define MMUEXT_INVLPG_MULTI      9
+#define MMUEXT_TLB_FLUSH_ALL    10
+#define MMUEXT_INVLPG_ALL       11
+#define MMUEXT_FLUSH_CACHE      12
+#define MMUEXT_SET_LDT          13
+#define MMUEXT_NEW_USER_BASEPTR 15
+#define MMUEXT_CLEAR_PAGE       16
+#define MMUEXT_COPY_PAGE        17
+#define MMUEXT_FLUSH_CACHE_GLOBAL 18
+#define MMUEXT_MARK_SUPER       19
+#define MMUEXT_UNMARK_SUPER     20
+/* ` } */
+
+#ifndef __ASSEMBLY__
+struct mmuext_op {
+    unsigned int cmd; /* => enum mmuext_cmd */
+    union {
+        /* [UN]PIN_TABLE, NEW_BASEPTR, NEW_USER_BASEPTR
+         * CLEAR_PAGE, COPY_PAGE, [UN]MARK_SUPER */
+        xen_pfn_t     mfn;
+        /* INVLPG_LOCAL, INVLPG_ALL, SET_LDT */
+        unsigned long linear_addr;
+    } arg1;
+    union {
+        /* SET_LDT */
+        unsigned int nr_ents;
+        /* TLB_FLUSH_MULTI, INVLPG_MULTI */
+#if __XEN_INTERFACE_VERSION__ >= 0x00030205
+        XEN_GUEST_HANDLE(const_void) vcpumask;
+#else
+        const void *vcpumask;
+#endif
+        /* COPY_PAGE */
+        xen_pfn_t src_mfn;
+    } arg2;
+};
+typedef struct mmuext_op mmuext_op_t;
+DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
+#endif
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_update_va_mapping(unsigned long va, u64 val,
+ * `                              enum uvm_flags flags)
+ * `
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_update_va_mapping_otherdomain(unsigned long va, u64 val,
+ * `                                          enum uvm_flags flags,
+ * `                                          domid_t domid)
+ * `
+ * ` @va: The virtual address whose mapping we want to change
+ * ` @val: The new page table entry, must contain a machine address
+ * ` @flags: Control TLB flushes
+ */
+/* These are passed as 'flags' to update_va_mapping. They can be ORed. */
+/* When specifying UVMF_MULTI, also OR in a pointer to a CPU bitmap.   */
+/* UVMF_LOCAL is merely UVMF_MULTI with a NULL bitmap pointer.         */
+/* ` enum uvm_flags { */
+#define UVMF_NONE           (xen_mk_ulong(0)<<0) /* No flushing at all.   */
+#define UVMF_TLB_FLUSH      (xen_mk_ulong(1)<<0) /* Flush entire TLB(s).  */
+#define UVMF_INVLPG         (xen_mk_ulong(2)<<0) /* Flush only one entry. */
+#define UVMF_FLUSHTYPE_MASK (xen_mk_ulong(3)<<0)
+#define UVMF_MULTI          (xen_mk_ulong(0)<<2) /* Flush subset of TLBs. */
+#define UVMF_LOCAL          (xen_mk_ulong(0)<<2) /* Flush local TLB.      */
+#define UVMF_ALL            (xen_mk_ulong(1)<<2) /* Flush all TLBs.       */
+/* ` } */
+
+/*
+ * ` int
+ * ` HYPERVISOR_console_io(unsigned int cmd,
+ * `                       unsigned int count,
+ * `                       char buffer[]);
+ *
+ * @cmd: Command (see below)
+ * @count: Size of the buffer to read/write
+ * @buffer: Pointer in the guest memory
+ *
+ * List of commands:
+ *
+ *  * CONSOLEIO_write: Write the buffer to Xen console.
+ *      For the hardware domain, all the characters in the buffer will
+ *      be written. Characters will be printed directly to the console.
+ *      For all the other domains, only the printable characters will be
+ *      written. Characters may be buffered until a newline (i.e '\n') is
+ *      found.
+ *      @return 0 on success, otherwise return an error code.
+ *  * CONSOLEIO_read: Attempts to read up to @count characters from Xen
+ *      console. The maximum buffer size (i.e. @count) supported is 2GB.
+ *      @return the number of characters read on success, otherwise return
+ *      an error code.
+ */
+#define CONSOLEIO_write         0
+#define CONSOLEIO_read          1
+
+/*
+ * Commands to HYPERVISOR_vm_assist().
+ */
+#define VMASST_CMD_enable                0
+#define VMASST_CMD_disable               1
+
+/* x86/32 guests: simulate full 4GB segment limits. */
+#define VMASST_TYPE_4gb_segments         0
+
+/* x86/32 guests: trap (vector 15) whenever above vmassist is used. */
+#define VMASST_TYPE_4gb_segments_notify  1
+
+/*
+ * x86 guests: support writes to bottom-level PTEs.
+ * NB1. Page-directory entries cannot be written.
+ * NB2. Guest must continue to remove all writable mappings of PTEs.
+ */
+#define VMASST_TYPE_writable_pagetables  2
+
+/* x86/PAE guests: support PDPTs above 4GB. */
+#define VMASST_TYPE_pae_extended_cr3     3
+
+/*
+ * x86 guests: Sane behaviour for virtual iopl
+ *  - virtual iopl updated from do_iret() hypercalls.
+ *  - virtual iopl reported in bounce frames.
+ *  - guest kernels assumed to be level 0 for the purpose of iopl checks.
+ */
+#define VMASST_TYPE_architectural_iopl   4
+
+/*
+ * All guests: activate update indicator in vcpu_runstate_info
+ * Enable setting the XEN_RUNSTATE_UPDATE flag in guest memory mapped
+ * vcpu_runstate_info during updates of the runstate information.
+ */
+#define VMASST_TYPE_runstate_update_flag 5
+
+/*
+ * x86/64 guests: strictly hide M2P from user mode.
+ * This allows the guest to control respective hypervisor behavior:
+ * - when not set, L4 tables get created with the respective slot blank,
+ *   and whenever the L4 table gets used as a kernel one the missing
+ *   mapping gets inserted,
+ * - when set, L4 tables get created with the respective slot initialized
+ *   as before, and whenever the L4 table gets used as a user one the
+ *   mapping gets zapped.
+ */
+#define VMASST_TYPE_m2p_strict           32
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040600
+#define MAX_VMASST_TYPE                  3
+#endif
+
+/* Domain ids >= DOMID_FIRST_RESERVED cannot be used for ordinary domains. */
+#define DOMID_FIRST_RESERVED xen_mk_uint(0x7FF0)
+
+/* DOMID_SELF is used in certain contexts to refer to oneself. */
+#define DOMID_SELF           xen_mk_uint(0x7FF0)
+
+/*
+ * DOMID_IO is used to restrict page-table updates to mapping I/O memory.
+ * Although no Foreign Domain need be specified to map I/O pages, DOMID_IO
+ * is useful to ensure that no mappings to the OS's own heap are accidentally
+ * installed. (e.g., in Linux this could cause havoc as reference counts
+ * aren't adjusted on the I/O-mapping code path).
+ * This only makes sense as HYPERVISOR_mmu_update()'s and
+ * HYPERVISOR_update_va_mapping_otherdomain()'s "foreigndom" argument. For
+ * HYPERVISOR_mmu_update() context it can be specified by any calling domain,
+ * otherwise it's only permitted if the caller is privileged.
+ */
+#define DOMID_IO             xen_mk_uint(0x7FF1)
+
+/*
+ * DOMID_XEN is used to allow privileged domains to map restricted parts of
+ * Xen's heap space (e.g., the machine_to_phys table).
+ * This only makes sense as
+ * - HYPERVISOR_mmu_update()'s, HYPERVISOR_mmuext_op()'s, or
+ *   HYPERVISOR_update_va_mapping_otherdomain()'s "foreigndom" argument,
+ * - with XENMAPSPACE_gmfn_foreign,
+ * and is only permitted if the caller is privileged.
+ */
+#define DOMID_XEN            xen_mk_uint(0x7FF2)
+
+/*
+ * DOMID_COW is used as the owner of sharable pages */
+#define DOMID_COW            xen_mk_uint(0x7FF3)
+
+/* DOMID_INVALID is used to identify pages with unknown owner. */
+#define DOMID_INVALID        xen_mk_uint(0x7FF4)
+
+/* Idle domain. */
+#define DOMID_IDLE           xen_mk_uint(0x7FFF)
+
+/* Mask for valid domain id values */
+#define DOMID_MASK           xen_mk_uint(0x7FFF)
+
+#ifndef __ASSEMBLY__
+
+typedef uint16_t domid_t;
+
+/*
+ * Send an array of these to HYPERVISOR_mmu_update().
+ * NB. The fields are natural pointer/address size for this architecture.
+ */
+struct mmu_update {
+    uint64_t ptr;       /* Machine address of PTE. */
+    uint64_t val;       /* New contents of PTE.    */
+};
+typedef struct mmu_update mmu_update_t;
+DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
+
+/*
+ * ` enum neg_errnoval
+ * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
+ * `                      uint32_t nr_calls);
+ *
+ * NB. The fields are logically the natural register size for this
+ * architecture. In cases where xen_ulong_t is larger than this then
+ * any unused bits in the upper portion must be zero.
+ */
+struct multicall_entry {
+    xen_ulong_t op, result;
+    xen_ulong_t args[6];
+};
+typedef struct multicall_entry multicall_entry_t;
+DEFINE_XEN_GUEST_HANDLE(multicall_entry_t);
+
+#if __XEN_INTERFACE_VERSION__ < 0x00040400
+/*
+ * Event channel endpoints per domain (when using the 2-level ABI):
+ *  1024 if a long is 32 bits; 4096 if a long is 64 bits.
+ */
+#define NR_EVENT_CHANNELS EVTCHN_2L_NR_CHANNELS
+#endif
+
+struct vcpu_time_info {
+    /*
+     * Updates to the following values are preceded and followed by an
+     * increment of 'version'. The guest can therefore detect updates by
+     * looking for changes to 'version'. If the least-significant bit of
+     * the version number is set then an update is in progress and the guest
+     * must wait to read a consistent set of values.
+     * The correct way to interact with the version number is similar to
+     * Linux's seqlock: see the implementations of read_seqbegin/read_seqretry.
+     */
+    uint32_t version;
+    uint32_t pad0;
+    uint64_t tsc_timestamp;   /* TSC at last update of time vals.  */
+    uint64_t system_time;     /* Time, in nanosecs, since boot.    */
+    /*
+     * Current system time:
+     *   system_time +
+     *   ((((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul) >> 32)
+     * CPU frequency (Hz):
+     *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
+     */
+    uint32_t tsc_to_system_mul;
+    int8_t   tsc_shift;
+#if __XEN_INTERFACE_VERSION__ > 0x040600
+    uint8_t  flags;
+    uint8_t  pad1[2];
+#else
+    int8_t   pad1[3];
+#endif
+}; /* 32 bytes */
+typedef struct vcpu_time_info vcpu_time_info_t;
+
+#define XEN_PVCLOCK_TSC_STABLE_BIT     (1 << 0)
+#define XEN_PVCLOCK_GUEST_STOPPED      (1 << 1)
+
+struct vcpu_info {
+    /*
+     * 'evtchn_upcall_pending' is written non-zero by Xen to indicate
+     * a pending notification for a particular VCPU. It is then cleared
+     * by the guest OS /before/ checking for pending work, thus avoiding
+     * a set-and-check race. Note that the mask is only accessed by Xen
+     * on the CPU that is currently hosting the VCPU. This means that the
+     * pending and mask flags can be updated by the guest without special
+     * synchronisation (i.e., no need for the x86 LOCK prefix).
+     * This may seem suboptimal because if the pending flag is set by
+     * a different CPU then an IPI may be scheduled even when the mask
+     * is set. However, note:
+     *  1. The task of 'interrupt holdoff' is covered by the per-event-
+     *     channel mask bits. A 'noisy' event that is continually being
+     *     triggered can be masked at source at this very precise
+     *     granularity.
+     *  2. The main purpose of the per-VCPU mask is therefore to restrict
+     *     reentrant execution: whether for concurrency control, or to
+     *     prevent unbounded stack usage. Whatever the purpose, we expect
+     *     that the mask will be asserted only for short periods at a time,
+     *     and so the likelihood of a 'spurious' IPI is suitably small.
+     * The mask is read before making an event upcall to the guest: a
+     * non-zero mask therefore guarantees that the VCPU will not receive
+     * an upcall activation. The mask is cleared when the VCPU requests
+     * to block: this avoids wakeup-waiting races.
+     */
+    uint8_t evtchn_upcall_pending;
+#ifdef XEN_HAVE_PV_UPCALL_MASK
+    uint8_t evtchn_upcall_mask;
+#else /* XEN_HAVE_PV_UPCALL_MASK */
+    uint8_t pad0;
+#endif /* XEN_HAVE_PV_UPCALL_MASK */
+    xen_ulong_t evtchn_pending_sel;
+    struct arch_vcpu_info arch;
+    vcpu_time_info_t time;
+}; /* 64 bytes (x86) */
+#ifndef __XEN__
+typedef struct vcpu_info vcpu_info_t;
+#endif
+
+/*
+ * `incontents 200 startofday_shared Start-of-day shared data structure
+ * Xen/kernel shared data -- pointer provided in start_info.
+ *
+ * This structure is defined to be both smaller than a page, and the
+ * only data on the shared page, but may vary in actual size even within
+ * compatible Xen versions; guests should not rely on the size
+ * of this structure remaining constant.
+ */
+struct shared_info {
+    struct vcpu_info vcpu_info[XEN_LEGACY_MAX_VCPUS];
+
+    /*
+     * A domain can create "event channels" on which it can send and receive
+     * asynchronous event notifications. There are three classes of event that
+     * are delivered by this mechanism:
+     *  1. Bi-directional inter- and intra-domain connections. Domains must
+     *     arrange out-of-band to set up a connection (usually by allocating
+     *     an unbound 'listener' port and avertising that via a storage service
+     *     such as xenstore).
+     *  2. Physical interrupts. A domain with suitable hardware-access
+     *     privileges can bind an event-channel port to a physical interrupt
+     *     source.
+     *  3. Virtual interrupts ('events'). A domain can bind an event-channel
+     *     port to a virtual interrupt source, such as the virtual-timer
+     *     device or the emergency console.
+     *
+     * Event channels are addressed by a "port index". Each channel is
+     * associated with two bits of information:
+     *  1. PENDING -- notifies the domain that there is a pending notification
+     *     to be processed. This bit is cleared by the guest.
+     *  2. MASK -- if this bit is clear then a 0->1 transition of PENDING
+     *     will cause an asynchronous upcall to be scheduled. This bit is only
+     *     updated by the guest. It is read-only within Xen. If a channel
+     *     becomes pending while the channel is masked then the 'edge' is lost
+     *     (i.e., when the channel is unmasked, the guest must manually handle
+     *     pending notifications as no upcall will be scheduled by Xen).
+     *
+     * To expedite scanning of pending notifications, any 0->1 pending
+     * transition on an unmasked channel causes a corresponding bit in a
+     * per-vcpu selector word to be set. Each bit in the selector covers a
+     * 'C long' in the PENDING bitfield array.
+     */
+    xen_ulong_t evtchn_pending[sizeof(xen_ulong_t) * 8];
+    xen_ulong_t evtchn_mask[sizeof(xen_ulong_t) * 8];
+
+    /*
+     * Wallclock time: updated by control software or RTC emulation.
+     * Guests should base their gettimeofday() syscall on this
+     * wallclock-base value.
+     * The values of wc_sec and wc_nsec are offsets from the Unix epoch
+     * adjusted by the domain's 'time offset' (in seconds) as set either
+     * by XEN_DOMCTL_settimeoffset, or adjusted via a guest write to the
+     * emulated RTC.
+     */
+    uint32_t wc_version;      /* Version counter: see vcpu_time_info_t. */
+    uint32_t wc_sec;
+    uint32_t wc_nsec;
+#if !defined(__i386__)
+    uint32_t wc_sec_hi;
+# define xen_wc_sec_hi wc_sec_hi
+#elif !defined(__XEN__) && !defined(__XEN_TOOLS__)
+# define xen_wc_sec_hi arch.wc_sec_hi
+#endif
+
+    struct arch_shared_info arch;
+
+};
+#ifndef __XEN__
+typedef struct shared_info shared_info_t;
+#endif
+
+/*
+ * `incontents 200 startofday Start-of-day memory layout
+ *
+ *  1. The domain is started within contiguous virtual-memory region.
+ *  2. The contiguous region ends on an aligned 4MB boundary.
+ *  3. This the order of bootstrap elements in the initial virtual region:
+ *      a. relocated kernel image
+ *      b. initial ram disk              [mod_start, mod_len]
+ *         (may be omitted)
+ *      c. list of allocated page frames [mfn_list, nr_pages]
+ *         (unless relocated due to XEN_ELFNOTE_INIT_P2M)
+ *      d. start_info_t structure        [register rSI (x86)]
+ *         in case of dom0 this page contains the console info, too
+ *      e. unless dom0: xenstore ring page
+ *      f. unless dom0: console ring page
+ *      g. bootstrap page tables         [pt_base and CR3 (x86)]
+ *      h. bootstrap stack               [register ESP (x86)]
+ *  4. Bootstrap elements are packed together, but each is 4kB-aligned.
+ *  5. The list of page frames forms a contiguous 'pseudo-physical' memory
+ *     layout for the domain. In particular, the bootstrap virtual-memory
+ *     region is a 1:1 mapping to the first section of the pseudo-physical map.
+ *  6. All bootstrap elements are mapped read-writable for the guest OS. The
+ *     only exception is the bootstrap page table, which is mapped read-only.
+ *  7. There is guaranteed to be at least 512kB padding after the final
+ *     bootstrap element. If necessary, the bootstrap virtual region is
+ *     extended by an extra 4MB to ensure this.
+ *
+ * Note: Prior to 25833:bb85bbccb1c9. ("x86/32-on-64 adjust Dom0 initial page
+ * table layout") a bug caused the pt_base (3.g above) and cr3 to not point
+ * to the start of the guest page tables (it was offset by two pages).
+ * This only manifested itself on 32-on-64 dom0 kernels and not 32-on-64 domU
+ * or 64-bit kernels of any colour. The page tables for a 32-on-64 dom0 got
+ * allocated in the order: 'first L1','first L2', 'first L3', so the offset
+ * to the page table base is by two pages back. The initial domain if it is
+ * 32-bit and runs under a 64-bit hypervisor should _NOT_ use two of the
+ * pages preceding pt_base and mark them as reserved/unused.
+ */
+#ifdef XEN_HAVE_PV_GUEST_ENTRY
+struct start_info {
+    /* THE FOLLOWING ARE FILLED IN BOTH ON INITIAL BOOT AND ON RESUME.    */
+    char magic[32];             /* "xen-<version>-<platform>".            */
+    unsigned long nr_pages;     /* Total pages allocated to this domain.  */
+    unsigned long shared_info;  /* MACHINE address of shared info struct. */
+    uint32_t flags;             /* SIF_xxx flags.                         */
+    xen_pfn_t store_mfn;        /* MACHINE page number of shared page.    */
+    uint32_t store_evtchn;      /* Event channel for store communication. */
+    union {
+        struct {
+            xen_pfn_t mfn;      /* MACHINE page number of console page.   */
+            uint32_t  evtchn;   /* Event channel for console page.        */
+        } domU;
+        struct {
+            uint32_t info_off;  /* Offset of console_info struct.         */
+            uint32_t info_size; /* Size of console_info struct from start.*/
+        } dom0;
+    } console;
+    /* THE FOLLOWING ARE ONLY FILLED IN ON INITIAL BOOT (NOT RESUME).     */
+    unsigned long pt_base;      /* VIRTUAL address of page directory.     */
+    unsigned long nr_pt_frames; /* Number of bootstrap p.t. frames.       */
+    unsigned long mfn_list;     /* VIRTUAL address of page-frame list.    */
+    unsigned long mod_start;    /* VIRTUAL address of pre-loaded module   */
+                                /* (PFN of pre-loaded module if           */
+                                /*  SIF_MOD_START_PFN set in flags).      */
+    unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     */
+#define MAX_GUEST_CMDLINE 1024
+    int8_t cmd_line[MAX_GUEST_CMDLINE];
+    /* The pfn range here covers both page table and p->m table frames.   */
+    unsigned long first_p2m_pfn;/* 1st pfn forming initial P->M table.    */
+    unsigned long nr_p2m_frames;/* # of pfns forming initial P->M table.  */
+};
+typedef struct start_info start_info_t;
+
+/* New console union for dom0 introduced in 0x00030203. */
+#if __XEN_INTERFACE_VERSION__ < 0x00030203
+#define console_mfn    console.domU.mfn
+#define console_evtchn console.domU.evtchn
+#endif
+#endif /* XEN_HAVE_PV_GUEST_ENTRY */
+
+/* These flags are passed in the 'flags' field of start_info_t. */
+#define SIF_PRIVILEGED    (1<<0)  /* Is the domain privileged? */
+#define SIF_INITDOMAIN    (1<<1)  /* Is this the initial control domain? */
+#define SIF_MULTIBOOT_MOD (1<<2)  /* Is mod_start a multiboot module? */
+#define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
+#define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
+                                   /* P->M making the 3 level tree obsolete? */
+#define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
+
+/*
+ * A multiboot module is a package containing modules very similar to a
+ * multiboot module array. The only differences are:
+ * - the array of module descriptors is by convention simply at the beginning
+ *   of the multiboot module,
+ * - addresses in the module descriptors are based on the beginning of the
+ *   multiboot module,
+ * - the number of modules is determined by a termination descriptor that has
+ *   mod_start == 0.
+ *
+ * This permits to both build it statically and reference it in a configuration
+ * file, and let the PV guest easily rebase the addresses to virtual addresses
+ * and at the same time count the number of modules.
+ */
+struct xen_multiboot_mod_list
+{
+    /* Address of first byte of the module */
+    uint32_t mod_start;
+    /* Address of last byte of the module (inclusive) */
+    uint32_t mod_end;
+    /* Address of zero-terminated command line */
+    uint32_t cmdline;
+    /* Unused, must be zero */
+    uint32_t pad;
+};
+/*
+ * `incontents 200 startofday_dom0_console Dom0_console
+ *
+ * The console structure in start_info.console.dom0
+ *
+ * This structure includes a variety of information required to
+ * have a working VGA/VESA console.
+ */
+typedef struct dom0_vga_console_info {
+    uint8_t video_type; /* DOM0_VGA_CONSOLE_??? */
+#define XEN_VGATYPE_TEXT_MODE_3 0x03
+#define XEN_VGATYPE_VESA_LFB    0x23
+#define XEN_VGATYPE_EFI_LFB     0x70
+
+    union {
+        struct {
+            /* Font height, in pixels. */
+            uint16_t font_height;
+            /* Cursor location (column, row). */
+            uint16_t cursor_x, cursor_y;
+            /* Number of rows and columns (dimensions in characters). */
+            uint16_t rows, columns;
+        } text_mode_3;
+
+        struct {
+            /* Width and height, in pixels. */
+            uint16_t width, height;
+            /* Bytes per scan line. */
+            uint16_t bytes_per_line;
+            /* Bits per pixel. */
+            uint16_t bits_per_pixel;
+            /* LFB physical address, and size (in units of 64kB). */
+            uint32_t lfb_base;
+            uint32_t lfb_size;
+            /* RGB mask offsets and sizes, as defined by VBE 1.2+ */
+            uint8_t  red_pos, red_size;
+            uint8_t  green_pos, green_size;
+            uint8_t  blue_pos, blue_size;
+            uint8_t  rsvd_pos, rsvd_size;
+#if __XEN_INTERFACE_VERSION__ >= 0x00030206
+            /* VESA capabilities (offset 0xa, VESA command 0x4f00). */
+            uint32_t gbl_caps;
+            /* Mode attributes (offset 0x0, VESA command 0x4f01). */
+            uint16_t mode_attrs;
+            uint16_t pad;
+#endif
+#if __XEN_INTERFACE_VERSION__ >= 0x00040d00
+            /* high 32 bits of lfb_base */
+            uint32_t ext_lfb_base;
+#endif
+        } vesa_lfb;
+    } u;
+} dom0_vga_console_info_t;
+#define xen_vga_console_info dom0_vga_console_info
+#define xen_vga_console_info_t dom0_vga_console_info_t
+
+typedef uint8_t xen_domain_handle_t[16];
+
+__DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
+__DEFINE_XEN_GUEST_HANDLE(uint16, uint16_t);
+__DEFINE_XEN_GUEST_HANDLE(uint32, uint32_t);
+__DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
+
+typedef struct {
+    uint8_t a[16];
+} xen_uuid_t;
+
+/*
+ * XEN_DEFINE_UUID(0x00112233, 0x4455, 0x6677, 0x8899,
+ *                 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff)
+ * will construct UUID 00112233-4455-6677-8899-aabbccddeeff presented as
+ * {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
+ * 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};
+ *
+ * NB: This is compatible with Linux kernel and with libuuid, but it is not
+ * compatible with Microsoft, as they use mixed-endian encoding (some
+ * components are little-endian, some are big-endian).
+ */
+#define XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6)            \
+    {{((a) >> 24) & 0xFF, ((a) >> 16) & 0xFF,                           \
+      ((a) >>  8) & 0xFF, ((a) >>  0) & 0xFF,                           \
+      ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                           \
+      ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                           \
+      ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
+                e1, e2, e3, e4, e5, e6}}
+
+#if defined(__STDC_VERSION__) ? __STDC_VERSION__ >= 199901L : defined(__GNUC__)
+#define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
+    ((xen_uuid_t)XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6))
+#else
+#define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
+    XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6)
+#endif /* __STDC_VERSION__ / __GNUC__ */
+
+#endif /* !__ASSEMBLY__ */
+
+/* Default definitions for macros used by domctl/sysctl. */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+#ifndef int64_aligned_t
+#define int64_aligned_t int64_t
+#endif
+#ifndef uint64_aligned_t
+#define uint64_aligned_t uint64_t
+#endif
+#ifndef XEN_GUEST_HANDLE_64
+#define XEN_GUEST_HANDLE_64(name) XEN_GUEST_HANDLE(name)
+#endif
+
+#ifndef __ASSEMBLY__
+struct xenctl_bitmap {
+    XEN_GUEST_HANDLE_64(uint8) bitmap;
+    uint32_t nr_bits;
+};
+typedef struct xenctl_bitmap xenctl_bitmap_t;
+#endif
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+#endif /* __XEN_PUBLIC_XEN_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.35.3


