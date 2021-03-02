Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831432A83A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:38:23 +0100 (CET)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8yU-0002Ii-G6
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lH8wg-0000zJ-MK; Tue, 02 Mar 2021 12:36:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lH8we-0003xD-4U; Tue, 02 Mar 2021 12:36:30 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122HZ3dv045087; Tue, 2 Mar 2021 12:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Fu/W4qRlESEolz+jkKl5Kyx4yDvkuSMm5F/M8VKlgWk=;
 b=VV/AeSQ9+Pdnbh/a7GmH3AnB6qEwO0CZvH2hHSxxApZduLLcFlfv25xWynOXGbtWmBJE
 FCAF4RD1+f/jVSWOZKm1WS4ckgzxIKYdGCFcmtFbTZJvA8Wg7GrHtRtIfoO0zlYvxKNs
 0mF0gAuwj73oVCoxUfDHaTTW5IuxeHslgJ6es3YuKTjmwVfy8Q1S8gnHWLqv6slCvtD1
 6eHwgQp/j+eFHf3I7wbwcCx9UFNPDVBZCALoaw15U8HKS6vRSEzvir38TFCYtCfMIeij
 VtsTsTOME426SVabH4YwVlxRZ56wRm1yOyDVj6NIJtN6au9K4bVOnGc5Wcat1a6Zfwrf Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371qdk5u9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 12:36:23 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122HZj7v050638;
 Tue, 2 Mar 2021 12:36:22 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371qdk5u8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 12:36:22 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122HRBoO015654;
 Tue, 2 Mar 2021 17:36:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3712fmh2j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 17:36:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122HaHkE17629668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 17:36:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A026AE04D;
 Tue,  2 Mar 2021 17:36:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAD94AE045;
 Tue,  2 Mar 2021 17:36:16 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 17:36:16 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Date: Tue,  2 Mar 2021 18:35:44 +0100
Message-Id: <20210302173544.3704179-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020136
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Boris Fiuczynski <fiuczy@linux.ibm.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
module, which provides the type virtio-gpu-device, packaging the
hw-display-virtio-gpu module as a separate package that may or may not
be installed along with the qemu package leads to problems. Namely if
the hw-display-virtio-gpu is absent, qemu continues to advertise
virtio-gpu-ccw, but it aborts not only when one attempts using
virtio-gpu-ccw, but also when libvirtd's capability probing tries
to instantiate the type to introspect it.

Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
was chosen because it is not a portable device. Because registering
virtio-gpu-ccw would make non-s390x emulator fail due to a missing
parent type, if built as a module, before registering it, we check
if the ancestor types are already registered.

With virtio-gpu-ccw built as a module, the correct way to package a
modularized qemu is to require that hw-display-virtio-gpu must be
installed whenever the module hw-s390x-virtio-gpu-ccw.

The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
suggestion of Thomas Huth. From interface design perspective, IMHO, not
a good thing as it belongs to the public interface of
css_register_io_adapters(). We did this because CONFIG_KVM requeires
NEED_CPU_H and Thomas, and other commenters did not like the
consequences of that.

Moving the interrupt related declarations to s390_flic.h was suggested
by Cornelia Huck.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---

As explained in [1] the previous idea of type_register_mayfail() does
not work. The next best thing is to check if all types we need are
already registered before registering virtio-gpu-ccw from the module. It
is reasonable to assume that when the module is loaded, the ancestors
are already registered (which is not the case if the device is a
built in one).

The alternatives to this approch I could identify are:
* A poor mans version of this which checks for the parent
* Emulator specific modules:
  * An emulator specific directory within the modules directory which
    is ignored by the other emulators.
  * A way to tell the shared util library the name of this directory,
    and the code to check it if set.
  * Build hw-s390x-virtio-gpu-ccw so it lands in this special directory
    in the build tree, and install it there as well.
  I've spend some time with looking into this, but I came to the
  conclusion that the two latter points look hairy.

[1] https://lore.kernel.org/qemu-devel/20210222125548.346166-1-pasic@linux.ibm.com/T/#maf0608df5479f87b23606f01f732740d2617b458
---
 hw/s390x/meson.build         |  7 ++++-
 hw/s390x/virtio-ccw-gpu.c    |  5 ++++
 include/hw/s390x/css.h       |  7 -----
 include/hw/s390x/s390_flic.h |  3 +++
 include/qom/object.h         | 10 ++++++++
 qom/object.c                 | 50 ++++++++++++++++++++++++++++++++++++
 target/s390x/cpu.h           |  9 ++++---
 util/module.c                |  1 +
 8 files changed, 81 insertions(+), 11 deletions(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 2a7818d94b..7ac972afcf 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
@@ -46,3 +45,9 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
 
 hw_arch += {'s390x': s390x_ss}
+
+hw_s390x_modules = {}
+virtio_gpu_ccw_ss = ss.source_set()
+virtio_gpu_ccw_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: [files('virtio-ccw-gpu.c'), pixman])
+hw_s390x_modules += {'virtio-gpu-ccw': virtio_gpu_ccw_ss}
+modules += {'hw-s390x': hw_s390x_modules}
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index c301e2586b..ccdf6ac20f 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -62,6 +62,11 @@ static const TypeInfo virtio_ccw_gpu = {
 
 static void virtio_ccw_gpu_register(void)
 {
+#ifdef CONFIG_MODULES
+    if (!type_ancestors_registered(&virtio_ccw_gpu)) {
+        return;
+    }
+#endif
     type_register_static(&virtio_ccw_gpu);
 }
 
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 08c869ab0a..7858666307 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -12,7 +12,6 @@
 #ifndef CSS_H
 #define CSS_H
 
-#include "cpu.h"
 #include "hw/s390x/adapter.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/ioinst.h"
@@ -233,12 +232,6 @@ uint32_t css_get_adapter_id(CssIoAdapterType type, uint8_t isc);
 void css_register_io_adapters(CssIoAdapterType type, bool swap, bool maskable,
                               uint8_t flags, Error **errp);
 
-#ifndef CONFIG_KVM
-#define S390_ADAPTER_SUPPRESSIBLE 0x01
-#else
-#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
-#endif
-
 #ifndef CONFIG_USER_ONLY
 SubchDev *css_find_subch(uint8_t m, uint8_t cssid, uint8_t ssid,
                          uint16_t schid);
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index e91b15d2d6..3907a13d07 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -134,6 +134,9 @@ void s390_flic_init(void);
 S390FLICState *s390_get_flic(void);
 QEMUS390FLICState *s390_get_qemu_flic(S390FLICState *fs);
 S390FLICStateClass *s390_get_flic_class(S390FLICState *fs);
+void s390_crw_mchk(void);
+void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
+                       uint32_t io_int_parm, uint32_t io_int_word);
 bool ais_needed(void *opaque);
 
 #endif /* HW_S390_FLIC_H */
diff --git a/include/qom/object.h b/include/qom/object.h
index 6721cd312e..7aa996a042 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -815,6 +815,16 @@ ObjectClass *object_get_class(Object *obj);
  */
 const char *object_get_typename(const Object *obj);
 
+/**
+ * type_ancestors_registered:
+ * @info: The #TypeInfo of the type
+ *
+ * Returns: true if all the ancestor types, that is classes and interfaces this
+ * type inherits form are all already registered, false if there is an ancestor
+ * that ain't registered yet
+ */
+bool type_ancestors_registered(const TypeInfo *info);
+
 /**
  * type_register_static:
  * @info: The #TypeInfo of the new type.
diff --git a/qom/object.c b/qom/object.c
index 491823db4a..03bd9aa2ba 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -281,6 +281,56 @@ static void object_property_free(gpointer data)
     g_free(prop);
 }
 
+static TypeImpl *type_get_parent_const(const TypeImpl *ti)
+{
+    return ti->parent_type ? ti->parent_type : type_get_by_name(ti->parent);
+}
+
+
+static bool __type_ancestors_registered(const TypeImpl *ti)
+{
+    TypeImpl *parent;
+    int i;
+
+    if (!ti) {
+        return false;
+    }
+
+    if (ti->class) {
+        /* fully initialized */
+        return true;
+    }
+
+    for (i = 0; i < ti->num_interfaces; i++) {
+        if (!type_get_by_name(ti->interfaces[i].typename)) {
+            return false;
+        }
+    }
+    if (ti->parent) {
+        parent = type_get_parent_const(ti);
+        if (!parent) {
+            return false;
+        }
+        return __type_ancestors_registered(parent);
+    }
+    return true;
+}
+
+bool type_ancestors_registered(const TypeInfo *info)
+{
+    int i;
+
+    for (i = 0; info->interfaces && info->interfaces[i].type; i++) {
+        if (!type_get_by_name(info->interfaces[i].type)) {
+            return false;
+        }
+    }
+    if (info->parent) {
+        return __type_ancestors_registered(type_get_by_name(info->parent));
+    }
+    return true;
+}
+
 static void type_initialize(TypeImpl *ti)
 {
     TypeImpl *parent;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5ed..b434b905c0 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -40,6 +40,12 @@
 
 #define S390_MAX_CPUS 248
 
+#ifndef CONFIG_KVM
+#define S390_ADAPTER_SUPPRESSIBLE 0x01
+#else
+#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
+#endif
+
 typedef struct PSW {
     uint64_t mask;
     uint64_t addr;
@@ -806,9 +812,6 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
 
 
 /* interrupt.c */
-void s390_crw_mchk(void);
-void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
-                       uint32_t io_int_parm, uint32_t io_int_word);
 #define RA_IGNORED                  0
 void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
 /* service interrupts are floating therefore we must not pass an cpustate */
diff --git a/util/module.c b/util/module.c
index c65060c167..cbe89fede6 100644
--- a/util/module.c
+++ b/util/module.c
@@ -304,6 +304,7 @@ static struct {
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },

base-commit: 1af5629673bb5c1592d993f9fb6119a62845f576
-- 
2.25.1


