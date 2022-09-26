Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668E5EB030
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:38:49 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oct0C-0004Bq-JO
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrb2-0005w8-92
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocraz-0005bo-QP
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxhS9Yc+kc70x0fRAz2hAdmcBPBDa7REituSr6kYQHo=;
 b=UZt63+cwAEh+vzW9iVCC/Cxeu3hOTWBaUkuPRG8jeZUtlKLMM+c4Pc28iFE5Ln7+1a9xyE
 IqmH1dma5XzqZcTjRbwCrwV/+msZ8DogGTa9S4bGOhziLmR0Yd2ThmvgI5Qh7LMPYjEZ6g
 Rkp2RuOKFtyv+Pa/KhbfeFTK1u7/lKU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-ESlEBkyROF-Gu3gppRVeLw-1; Mon, 26 Sep 2022 13:08:37 -0400
X-MC-Unique: ESlEBkyROF-Gu3gppRVeLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5078D380451D;
 Mon, 26 Sep 2022 17:08:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F204140EBF4;
 Mon, 26 Sep 2022 17:08:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PULL 13/14] s390x/s390-virtio-ccw: add zpcii-disable machine property
Date: Mon, 26 Sep 2022 19:08:03 +0200
Message-Id: <20220926170804.453855-14-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

The zpcii-disable machine property can be used to force-disable the use
of zPCI interpretation facilities for a VM.  By default, this setting
will be off for machine 7.2 and newer.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20220902172737.170349-9-mjrosato@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[thuth: Fix contextual conflict in ccw_machine_7_1_instance_options()]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/s390-virtio-ccw.h |  1 +
 hw/s390x/s390-pci-kvm.c            |  4 +++-
 hw/s390x/s390-virtio-ccw.c         | 24 ++++++++++++++++++++++++
 util/qemu-config.c                 |  4 ++++
 qemu-options.hx                    |  8 +++++++-
 5 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 3331990e02..8a0090a071 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -27,6 +27,7 @@ struct S390CcwMachineState {
     bool aes_key_wrap;
     bool dea_key_wrap;
     bool pv;
+    bool zpcii_disable;
     uint8_t loadparm[8];
 };
 
diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
index 9134fe185f..5eb7fd12e2 100644
--- a/hw/s390x/s390-pci-kvm.c
+++ b/hw/s390x/s390-pci-kvm.c
@@ -22,7 +22,9 @@
 
 bool s390_pci_kvm_interp_allowed(void)
 {
-    return kvm_s390_get_zpci_op() && !s390_is_pv();
+    return (kvm_s390_get_zpci_op() && !s390_is_pv() &&
+            !object_property_get_bool(OBJECT(qdev_get_machine()),
+                                      "zpcii-disable", NULL));
 }
 
 int s390_pci_kvm_aif_enable(S390PCIBusDevice *pbdev, ZpciFib *fib, bool assist)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e18b816aba..03855c7231 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -645,6 +645,21 @@ static inline void machine_set_dea_key_wrap(Object *obj, bool value,
     ms->dea_key_wrap = value;
 }
 
+static inline bool machine_get_zpcii_disable(Object *obj, Error **errp)
+{
+    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
+
+    return ms->zpcii_disable;
+}
+
+static inline void machine_set_zpcii_disable(Object *obj, bool value,
+                                             Error **errp)
+{
+    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
+
+    ms->zpcii_disable = value;
+}
+
 static S390CcwMachineClass *current_mc;
 
 /*
@@ -740,6 +755,13 @@ static inline void s390_machine_initfn(Object *obj)
             "Up to 8 chars in set of [A-Za-z0-9. ] (lower case chars converted"
             " to upper case) to pass to machine loader, boot manager,"
             " and guest kernel");
+
+    object_property_add_bool(obj, "zpcii-disable",
+                             machine_get_zpcii_disable,
+                             machine_set_zpcii_disable);
+    object_property_set_description(obj, "zpcii-disable",
+            "disable zPCI interpretation facilties");
+    object_property_set_bool(obj, "zpcii-disable", false, NULL);
 }
 
 static const TypeInfo ccw_machine_info = {
@@ -804,10 +826,12 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
     static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_1 };
+    S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
 
     ccw_machine_7_2_instance_options(machine);
     s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
     s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
+    ms->zpcii_disable = true;
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 433488aa56..5325f6bf80 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -236,6 +236,10 @@ static QemuOptsList machine_opts = {
             .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
                     " converted to upper case) to pass to machine"
                     " loader, boot manager, and guest kernel",
+        },{
+            .name = "zpcii-disable",
+            .type = QEMU_OPT_BOOL,
+            .help = "disable zPCI interpretation facilities",
         },
         { /* End of list */ }
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index d8b5ce5b43..7c61868b68 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -37,7 +37,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
     "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
-    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
+    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
+    "                zpcii-disable=on|off disables zPCI interpretation facilities (default=off)\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -157,6 +158,11 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
+
+    ``zpcii-disable=on|off``
+        Disables zPCI interpretation facilties on s390-ccw hosts.
+        This feature can be used to disable hardware virtual assists
+        related to zPCI devices. The default is off.
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-- 
2.31.1


