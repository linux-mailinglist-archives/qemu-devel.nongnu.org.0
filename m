Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C9620F2D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMrc-0004Ck-M7; Tue, 08 Nov 2022 06:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMrP-00049S-2V
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMrJ-0005eN-5x
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667907202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZIvs4DLcC6U9lzsc8lv6PrgmwvvgpC5Aev1B1EuRTk=;
 b=H7n6Md7NjG5ywt7Taetq9JKsoeyeMRCB63ojAjH/VTVjoppnHNtGS3tsWzquEiaPkFnl2I
 X2U7WNVgujULPIOuPok9NCTzw42hUKWjbjXWB2dQ3CxWSMLdNtO9J8N9grGg+CZayfNfMt
 y1hjQFUsZxj2094kcpHOUSUVW7KtdG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611--Z8BjqTnNUq5q9-GQYqDZQ-1; Tue, 08 Nov 2022 06:33:19 -0500
X-MC-Unique: -Z8BjqTnNUq5q9-GQYqDZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 786523814580;
 Tue,  8 Nov 2022 11:33:18 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C5B40C2086;
 Tue,  8 Nov 2022 11:33:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, kraxel@redhat.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PULL 1/5] Revert "s390x/s390-virtio-ccw: add zpcii-disable machine
 property"
Date: Tue,  8 Nov 2022 12:33:09 +0100
Message-Id: <20221108113313.467923-2-thuth@redhat.com>
In-Reply-To: <20221108113313.467923-1-thuth@redhat.com>
References: <20221108113313.467923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20221107161349.1032730-2-clg@kaod.org>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
index dbdf9c301b..8b8a4a5d01 100644
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
2.31.1


