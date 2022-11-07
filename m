Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEA61F8B9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os4lN-0006hn-JU; Mon, 07 Nov 2022 11:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org>)
 id 1os4lK-0006gR-La; Mon, 07 Nov 2022 11:14:15 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org>)
 id 1os4lI-0003Ri-1r; Mon, 07 Nov 2022 11:14:14 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4N5brl5SxQz4xGj;
 Tue,  8 Nov 2022 03:13:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5brj3GP2z4x1G;
 Tue,  8 Nov 2022 03:13:57 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH for 7.2 1/2] Revert "s390x/s390-virtio-ccw: add zpcii-disable
 machine property"
Date: Mon,  7 Nov 2022 17:13:48 +0100
Message-Id: <20221107161349.1032730-2-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107161349.1032730-1-clg@kaod.org>
References: <20221107161349.1032730-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Cédric Le Goater <clg@redhat.com>

This reverts commit 59d1ce44396e3ad2330dc3261ff3da7ad3a16184.

The "zpcii-disable" machine property is redundant with the "interpret"
zPCI device property. Remove it for clarification.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/s390x/s390-virtio-ccw.h |  1 -
 hw/s390x/s390-pci-kvm.c            |  4 +---
 hw/s390x/s390-virtio-ccw.c         | 24 ------------------------
 util/qemu-config.c                 |  4 ----
 qemu-options.hx                    |  8 +-------
 5 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 4f8a39abda..9bba21a916 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -27,7 +27,6 @@ struct S390CcwMachineState {
     bool aes_key_wrap;
     bool dea_key_wrap;
     bool pv;
-    bool zpcii_disable;
     uint8_t loadparm[8];
 };
 
diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
index 5eb7fd12e2..9134fe185f 100644
--- a/hw/s390x/s390-pci-kvm.c
+++ b/hw/s390x/s390-pci-kvm.c
@@ -22,9 +22,7 @@
 
 bool s390_pci_kvm_interp_allowed(void)
 {
-    return (kvm_s390_get_zpci_op() && !s390_is_pv() &&
-            !object_property_get_bool(OBJECT(qdev_get_machine()),
-                                      "zpcii-disable", NULL));
+    return kvm_s390_get_zpci_op() && !s390_is_pv();
 }
 
 int s390_pci_kvm_aif_enable(S390PCIBusDevice *pbdev, ZpciFib *fib, bool assist)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 560ddbb6fb..bb98d40792 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -627,21 +627,6 @@ static inline void machine_set_dea_key_wrap(Object *obj, bool value,
     ms->dea_key_wrap = value;
 }
 
-static inline bool machine_get_zpcii_disable(Object *obj, Error **errp)
-{
-    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
-
-    return ms->zpcii_disable;
-}
-
-static inline void machine_set_zpcii_disable(Object *obj, bool value,
-                                             Error **errp)
-{
-    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
-
-    ms->zpcii_disable = value;
-}
-
 static S390CcwMachineClass *current_mc;
 
 /*
@@ -778,12 +763,6 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
             "Up to 8 chars in set of [A-Za-z0-9. ] (lower case chars converted"
             " to upper case) to pass to machine loader, boot manager,"
             " and guest kernel");
-
-    object_class_property_add_bool(oc, "zpcii-disable",
-                                   machine_get_zpcii_disable,
-                                   machine_set_zpcii_disable);
-    object_class_property_set_description(oc, "zpcii-disable",
-            "disable zPCI interpretation facilties");
 }
 
 static inline void s390_machine_initfn(Object *obj)
@@ -792,7 +771,6 @@ static inline void s390_machine_initfn(Object *obj)
 
     ms->aes_key_wrap = true;
     ms->dea_key_wrap = true;
-    ms->zpcii_disable = false;
 }
 
 static const TypeInfo ccw_machine_info = {
@@ -857,12 +835,10 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
     static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_1 };
-    S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
 
     ccw_machine_7_2_instance_options(machine);
     s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
     s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
-    ms->zpcii_disable = true;
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 5325f6bf80..433488aa56 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -236,10 +236,6 @@ static QemuOptsList machine_opts = {
             .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
                     " converted to upper case) to pass to machine"
                     " loader, boot manager, and guest kernel",
-        },{
-            .name = "zpcii-disable",
-            .type = QEMU_OPT_BOOL,
-            .help = "disable zPCI interpretation facilities",
         },
         { /* End of list */ }
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index 911d82afa5..1e140e99e1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -37,8 +37,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
     "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
-    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
-    "                zpcii-disable=on|off disables zPCI interpretation facilities (default=off)\n",
+    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -158,11 +157,6 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
-
-    ``zpcii-disable=on|off``
-        Disables zPCI interpretation facilties on s390-ccw hosts.
-        This feature can be used to disable hardware virtual assists
-        related to zPCI devices. The default is off.
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-- 
2.38.1


