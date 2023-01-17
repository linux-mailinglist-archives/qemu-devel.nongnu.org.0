Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D168F66DE54
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlb7-00049t-1Q; Tue, 17 Jan 2023 08:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHlau-00044R-GU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:01:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHlar-0004EZ-Df
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SPtc1wPWQe+BBgRkeihLmApG2f7GNdP6TMZMmK0umNk=; b=W5UMhLUhoUVpxUA818gQKyJip5
 yiAyCfbbIORntqCcAtc2f5tFP5tbUXdqq/Pm9M+vbKdHZ4aWzA9p7oUTCNpJ+Wbpu8ussBo4B/CTP
 sDnZvfwQ9167zhaLLXpf+1HMrtz7kGb3/LCLEj+JYQCMnyRSbKFMYnVJPOOBkWNaryZr5I0hyLIQV
 zYeaV3hFNI31iBj4qnTz9Xse3THtLG6aKruGpj0fnBJ7TPjjnt3hZKOnigaeDMHasmyijDRMRthZf
 Uxym1fpBz6vJ+PooZM1dDsbep+BFkCG+ORozjWICow+HD7/n653j5IC75ozvZLd+IudxoRXMWmPeq
 7chkGd3A==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHlaw-009hG8-SQ; Tue, 17 Jan 2023 13:01:43 +0000
Message-ID: <f8861955e45966f12c9febbadc633cd527a51fe2.camel@infradead.org>
Subject: [PATCH v7.1 26/51] hw/xen: Add xen_evtchn device for event channel
 emulation
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Julien Grall <julien@xen.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  armbru@redhat.com
Date: Tue, 17 Jan 2023 13:01:27 +0000
In-Reply-To: <59f4e3c3-0939-134b-596b-ebfc5d06a11d@xen.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-27-dwmw2@infradead.org>
 <ea0a98e2-14e4-620a-60ee-86cfbe76403e@xen.org>
 <8ab2cfafa5636d7f084e8a75d273d7bf7b6b7579.camel@infradead.org>
 <726f2f63-dc74-619e-4cb0-205f9a542b99@xen.org>
 <f5fe9f4e6bc301e4fa0065e17cc0bbdcb3e06668.camel@infradead.org>
 <6234afac-b260-37ab-6f3b-17ed5e3ba6a2@xen.org>
 <555a94eb3b65d45bae7d2da6571d072e773c2d50.camel@infradead.org>
 <59f4e3c3-0939-134b-596b-ebfc5d06a11d@xen.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-rB46Jgo1vmXv+aNJX4KL"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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


--=-rB46Jgo1vmXv+aNJX4KL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

Include basic support for setting HVM_PARAM_CALLBACK_IRQ to the global
vector method HVM_PARAM_CALLBACK_TYPE_VECTOR, which is handled in-kernel
by raising the vector whenever the vCPU's vcpu_info->evtchn_upcall_pending
flag is set.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build   |   5 +-
 hw/i386/kvm/xen_evtchn.c  | 154 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  18 +++++
 hw/i386/pc.c              |   2 +
 target/i386/kvm/xen-emu.c |  15 ++++
 5 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/kvm/xen_evtchn.c
 create mode 100644 hw/i386/kvm/xen_evtchn.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 6165cbf019..cab64df339 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -4,6 +4,9 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c=
'))
 i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
 i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
-i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
+  'xen_overlay.c',
+  'xen_evtchn.c',
+  ))
=20
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
new file mode 100644
index 0000000000..57aa72a3ab
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -0,0 +1,154 @@
+/*
+ * QEMU Xen emulation: Event channel support
+ *
+ * Copyright =C2=A9 2022 Amazon.com, Inc. or its affiliates. All Rights Re=
served.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "exec/target_page.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_evtchn.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+#include <linux/kvm.h>
+
+#include "standard-headers/xen/memory.h"
+#include "standard-headers/xen/hvm/params.h"
+
+#define TYPE_XEN_EVTCHN "xen-evtchn"
+OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
+
+struct XenEvtchnState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint64_t callback_param;
+    bool evtchn_in_kernel;
+
+    QemuMutex port_lock;
+};
+
+struct XenEvtchnState *xen_evtchn_singleton;
+
+/* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) *=
/
+#define CALLBACK_VIA_TYPE_SHIFT 56
+
+static int xen_evtchn_post_load(void *opaque, int version_id)
+{
+    XenEvtchnState *s =3D opaque;
+
+    if (s->callback_param) {
+        xen_evtchn_set_callback_param(s->callback_param);
+    }
+
+    return 0;
+}
+
+static bool xen_evtchn_is_needed(void *opaque)
+{
+    return xen_mode =3D=3D XEN_EMULATE;
+}
+
+static const VMStateDescription xen_evtchn_vmstate =3D {
+    .name =3D "xen_evtchn",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D xen_evtchn_is_needed,
+    .post_load =3D xen_evtchn_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(callback_param, XenEvtchnState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_evtchn_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->vmsd =3D &xen_evtchn_vmstate;
+}
+
+static const TypeInfo xen_evtchn_info =3D {
+    .name          =3D TYPE_XEN_EVTCHN,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(XenEvtchnState),
+    .class_init    =3D xen_evtchn_class_init,
+};
+
+void xen_evtchn_create(void)
+{
+    XenEvtchnState *s =3D XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
+                                                        -1, NULL));
+    xen_evtchn_singleton =3D s;
+
+    qemu_mutex_init(&s->port_lock);
+}
+
+static void xen_evtchn_register_types(void)
+{
+    type_register_static(&xen_evtchn_info);
+}
+
+type_init(xen_evtchn_register_types)
+
+int xen_evtchn_set_callback_param(uint64_t param)
+{
+    XenEvtchnState *s =3D xen_evtchn_singleton;
+    struct kvm_xen_hvm_attr xa =3D {
+        .type =3D KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
+        .u.vector =3D 0,
+    };
+    bool in_kernel =3D false;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
+        xa.u.vector =3D (uint8_t)param,
+
+        ret =3D kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
+            in_kernel =3D true;
+        }
+        break;
+    }
+    default:
+        ret =3D -ENOSYS;
+        break;
+    }
+
+    if (!ret) {
+        /* If vector delivery was turned *off* then tell the kernel */
+        if ((s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) =3D=3D
+            HVM_PARAM_CALLBACK_TYPE_VECTOR && !xa.u.vector) {
+            kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        }
+        s->callback_param =3D param;
+        s->evtchn_in_kernel =3D in_kernel;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
new file mode 100644
index 0000000000..c9b7f9d11f
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Xen emulation: Event channel support
+ *
+ * Copyright =C2=A9 2022 Amazon.com, Inc. or its affiliates. All Rights Re=
served.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_EVTCHN_H
+#define QEMU_XEN_EVTCHN_H
+
+void xen_evtchn_create(void);
+int xen_evtchn_set_callback_param(uint64_t param);
+
+#endif /* QEMU_XEN_EVTCHN_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0ddae2f6ad..8f668a5138 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -90,6 +90,7 @@
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1850,6 +1851,7 @@ int pc_machine_kvm_type(MachineState *machine, const =
char *kvm_type)
 #ifdef CONFIG_XEN_EMU
     if (xen_mode =3D=3D XEN_EMULATE) {
         xen_overlay_create();
+        xen_evtchn_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c302304b3e..6a134bd854 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,7 @@
 #include "sysemu/runstate.h"
=20
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
=20
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
@@ -507,6 +508,10 @@ static bool handle_set_param(struct kvm_xen_exit *exit=
, X86CPU *cpu,
     }
=20
     switch (hp.index) {
+    case HVM_PARAM_CALLBACK_IRQ:
+        err =3D xen_evtchn_set_callback_param(hp.value);
+        xen_set_long_mode(exit->u.hcall.longmode);
+        break;
     default:
         return false;
     }
@@ -712,6 +717,16 @@ static int kvm_xen_soft_reset(void)
     CPUState *cpu;
     int err;
=20
+    /*
+     * Zero is the reset/startup state for HVM_PARAM_CALLBACK_IRQ. Strictl=
y,
+     * it maps to HVM_PARAM_CALLBACK_TYPE_GSI with GSI#0, but Xen refuses =
to
+     * to deliver to the timer interrupt and treats that as 'disabled'.
+     */
+    err =3D xen_evtchn_set_callback_param(0);
+    if (err) {
+        return err;
+    }
+
     CPU_FOREACH(cpu) {
         async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
     }
--=20
2.34.1


>=20


--=-rB46Jgo1vmXv+aNJX4KL
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTE3MTMwMTI3WjAvBgkqhkiG9w0BCQQxIgQgkVaz9Xve
gXWOAVvMKfojtesgazhR69jKKbsl2BMGsL0wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCPsxbv9sqeDzdh7fRD/UP4/M93Nzjbntlu
6fvkl2Cx/Kxw62eygR791jfBSaab+aq8Z3hb6qJ2IiKUNmYlqakkWsylQs0NI+WlLKNG6qNqasBH
VoTJJSs8atBMuu4dCipXH/lQx3qWn5lJJYfkO+mInRR4i6MkfO3TYPzAYpc0IbKFuYW4EOP4KNEw
s3+Dg6Yv2gNAzdHyEEU82WRLpZWR/UIDCIsUNQIp2YqkA6tyvAief81NRuIyFwKf/f90OeGinBeH
8RoT0OmqmZzdfmTW9uwrwocp71rUif7WRYoBfvAsO0swnpHRHDl7nxy7r4Trm5F4LdnAGGyvCU3x
7Nogzd8Y1cQykoHZVpdyS+hNRNB9pGLBQBaQsGZQY0vNEL1EUdI5flmPCrV5LVXEvk4fJYJtaAK9
qQjQzdZdHLr4felqvrearMrGwgmBYNuQVOiPBZx25s7qEGIYoHXyEY5moMu0Jk32yBh4ajOvy9OS
PtM+lnMbB28UApiWDXDgF5QrTFPmqh0EW5oAkJ5NhetXPRllg69COYFBtCqFdpE4JmIAyYFTruqX
aO66zN5zbC5xqZgw3TyVbKOloL1/BlP+1sVlXvmMGgDGmNA3A44FUiyjTZEHV4IM249hQLbLZvPi
WH7nOp8uy9BXEH5U8B74gN2E/hme8pf65xGCDG6H1QAAAAAAAA==


--=-rB46Jgo1vmXv+aNJX4KL--

