Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15DF6B3D01
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:56:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paaPH-0001xy-1l; Fri, 10 Mar 2023 05:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1265cd07cee6da11af5a+7138+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paaOx-0001nl-CE
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:55:09 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1265cd07cee6da11af5a+7138+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paaOs-0001Ky-Fk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zIRKENNHfTDZF/EfquPyUHjRgqqud531QLhbV2qR3eM=; b=jrvq5mM7FaeUTyltUwOk7qMqS2
 MUyki4g2oK0d52TKVTOpZbc4XpZXPoRU9M4/5DfmLdrijvTXUyAFu1tCyN9PFBxZaN90MFQFghztJ
 YGbppESEJg6TGXXQi3O9zG0c512wa3xF4AFG5VhRdmfUGfCsDZLhM3v7cv3KrM3XTWWzzY9oPOPqg
 jJyiMnC8wE1p6p+Lrg8ZP27KVH4PLp4OsfBQO/Rsbf+faDNeh2Xsf+S/ByLLrlWTP+iXUnwtibXbE
 /K5TVTITEryF6fLWPBWFAxSykKl5CDtjByh2skKxAXj4pUKq8rUYKcw5XcPcnc/M/oOCe8KFBBUY+
 CL3ziDDw==;
Received: from [2001:8b0:10b:5:fea5:d438:64bd:2b44]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1paaOc-009JqB-Le; Fri, 10 Mar 2023 10:54:47 +0000
Message-ID: <4bae59aba8f3016afe295b2525ab76bb51ac3229.camel@infradead.org>
Subject: [PATCH] hw/xen: Simplify emulated Xen platform init
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Claudio Fontana <cfontana@suse.de>,
 Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  armbru@redhat.com, Stefano
 Stabellini <sstabellini@kernel.org>,  vikram.garhwal@amd.com
Date: Fri, 10 Mar 2023 10:54:45 +0000
In-Reply-To: <7d6e4ef2-1f27-f210-0378-879852a70024@redhat.com>
References: <20230301135223.988336-1-dwmw2@infradead.org>
 <20230301135223.988336-16-dwmw2@infradead.org>
 <96e49428-0c2a-2a50-42e0-31c8e553a34b@intel.com>
 <ae5ce529ef1e492e4f8b06eece6528990ca965e6.camel@infradead.org>
 <7d6e4ef2-1f27-f210-0378-879852a70024@redhat.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-i8gwMM4upyjwZHHYgb/Q"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1265cd07cee6da11af5a+7138+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-i8gwMM4upyjwZHHYgb/Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

I initially put the basic platform init (overlay pages, grant tables,
event channels) into mc->kvm_type because that was the earliest place
that could sensibly test for xen_mode=3D=3DXEN_EMULATE.

The intent was to do this early enough that we could then initialise the
XenBus and other parts which would have depended on them, from a generic
location for both Xen and KVM/Xen in the PC-specific code, as seen in
https://lore.kernel.org/qemu-devel/20230116221919.1124201-16-dwmw2@infradea=
d.org/

However, then the Xen on Arm patches came along, and *they* wanted to
do the XenBus init from a 'generic' Xen-specific location instead:
https://lore.kernel.org/qemu-devel/20230210222729.957168-4-sstabellini@kern=
el.org/

Since there's no generic location that covers all three, I conceded to
do it for XEN_EMULATE mode in pc_basic_devices_init().

And now there's absolutely no point in having some of the platform init
done from pc_machine_kvm_type(); we can move it all up to live in a
single place in pc_basic_devices_init(). This has the added benefit that
we can drop the separate xen_evtchn_connect_gsis() function completely,
and pass just the system GSIs in directly to xen_evtchn_create().

While I'm at it, it does no harm to explicitly pass in the *number* of
said GSIs, because it does make me twitch a bit to pass an array of
impicit size. During the lifetime of the KVM/Xen patchset, that had
already changed (albeit just cosmetically) from GSI_NUM_PINS to
IOAPIC_NUM_PINS.

And document a bit better that this is for the *output* GSI for raising
CPU0's events when the per-CPU vector isn't available. The fact that
we create a whole set of them and then only waggle the one we're told
to, instead of having a single output and only *connecting* it to the
GSI that it should be connected to, is still non-intuitive for me.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 40 ++++++++++++++++++++--------------------
 hw/i386/kvm/xen_evtchn.h |  3 +--
 hw/i386/pc.c             | 13 ++++---------
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 98a7b85047..f4204949fb 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -146,7 +146,10 @@ struct XenEvtchnState {
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
-    qemu_irq gsis[IOAPIC_NUM_PINS];
+
+    /* Connected to the system GSIs for raising callback as GSI / INTx */
+    unsigned int nr_callback_gsis;
+    qemu_irq *callback_gsis;
=20
     struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
=20
@@ -298,7 +301,7 @@ static void gsi_assert_bh(void *opaque)
     }
 }
=20
-void xen_evtchn_create(void)
+void xen_evtchn_create(unsigned int nr_gsis, qemu_irq *system_gsis)
 {
     XenEvtchnState *s =3D XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
                                                         -1, NULL));
@@ -309,8 +312,19 @@ void xen_evtchn_create(void)
     qemu_mutex_init(&s->port_lock);
     s->gsi_bh =3D aio_bh_new(qemu_get_aio_context(), gsi_assert_bh, s);
=20
-    for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
-        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
+    /*
+     * These are the *output* GSI from event channel support, for
+     * signalling CPU0's events via GSI or PCI INTx instead of the
+     * per-CPU vector. We create a *set* of irqs and connect one to
+     * each of the system GSIs which were passed in from the platform
+     * code, and then just trigger the right one as appropriate from
+     * xen_evtchn_set_callback_level().
+     */
+    s->nr_callback_gsis =3D nr_gsis;
+    s->callback_gsis =3D g_new0(qemu_irq, nr_gsis);
+    for (i =3D 0; i < nr_gsis; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->callback_gsis[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
     }
=20
     /*
@@ -335,20 +349,6 @@ void xen_evtchn_create(void)
     xen_evtchn_ops =3D &emu_evtchn_backend_ops;
 }
=20
-void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-{
-    XenEvtchnState *s =3D xen_evtchn_singleton;
-    int i;
-
-    if (!s) {
-        return;
-    }
-
-    for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
-    }
-}
-
 static void xen_evtchn_register_types(void)
 {
     type_register_static(&xen_evtchn_info);
@@ -429,8 +429,8 @@ void xen_evtchn_set_callback_level(int level)
         return;
     }
=20
-    if (s->callback_gsi && s->callback_gsi < IOAPIC_NUM_PINS) {
-        qemu_set_irq(s->gsis[s->callback_gsi], level);
+    if (s->callback_gsi && s->callback_gsi < s->nr_callback_gsis) {
+        qemu_set_irq(s->callback_gsis[s->callback_gsi], level);
         if (level) {
             /* Ensure the vCPU polls for deassertion */
             kvm_xen_set_callback_asserted();
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index bfb67ac2bc..b740acfc0d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,10 +16,9 @@
=20
 typedef uint32_t evtchn_port_t;
=20
-void xen_evtchn_create(void);
+void xen_evtchn_create(unsigned int nr_gsis, qemu_irq *system_gsis);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
-void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
 void xen_evtchn_set_callback_level(int level);
=20
 int xen_evtchn_set_port(uint16_t port);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1489abf010..25584cb8f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1319,7 +1319,10 @@ void pc_basic_device_init(struct PCMachineState *pcm=
s,
=20
 #ifdef CONFIG_XEN_EMU
     if (xen_mode =3D=3D XEN_EMULATE) {
-        xen_evtchn_connect_gsis(gsi);
+        xen_overlay_create();
+        xen_evtchn_create(IOAPIC_NUM_PINS, gsi);
+        xen_gnttab_create();
+        xen_xenstore_create();
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
@@ -1868,14 +1871,6 @@ static void pc_machine_initfn(Object *obj)
=20
 int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
 {
-#ifdef CONFIG_XEN_EMU
-    if (xen_mode =3D=3D XEN_EMULATE) {
-        xen_overlay_create();
-        xen_evtchn_create();
-        xen_gnttab_create();
-        xen_xenstore_create();
-    }
-#endif
     return 0;
 }
=20
--=20
2.34.1



--=-i8gwMM4upyjwZHHYgb/Q
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzEwMTA1NDQ1WjAvBgkqhkiG9w0BCQQxIgQg+Vw8X9KF
OQiHtOLw08ZkdkdN3bpXr+zw0AM2Qryk94Uwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAS8O6JQnPqFx8TU6QaDe5qsacklF9I3WvQ
+2kM5wLzPP5fbNnl4k66Bo10KY3fgtyDz5Y54QDFEWkWqIMBAUCXO1Op6XJF4VqexNiA4mbCL8NU
Y2rI56g3PaML8Q3JlwXUxTf2yUfzV0l5BMEi8kmZzQ5mMK/i5URBc/Jqt4Hw8+oAsLgBw8HRvegd
h8bVCzRzinPGLslKLV+zY/A6KQjJxWdWQB6PA/75b98q6GfI1VOMgTjDlbQL2vRKfaxso5vkpLzg
chBUHh/1HhxchAhjIqsAPWbSlQ7UFSNWTWt/1GmlhjsJYRtCzEIdpWXS9Rx3V7Uw5KbCUomOvLxw
/NZYxwbsz9idUyiTnZ66OQhdPZACcvkdWhtIg98OdGpG9CDKA3R7iM50Gdr6AB8ZGANaHb93ZDlN
ZX2xUlopl+nYmsl3IZANivEwKOtUEuLkyyF/8/BeImXOt/VU1duP4mpFvkzFVBUT9Vwad1IU5WSa
72vH5Xp2vFkzA59nIgc3XvZ0MQhKiAHCoIwExSb7uFqajAiez0bZEWsqXJGdbuMWuve4wzm8w5Mr
IDQtPLLsovYS0S/BB3xyDb0afQlC3iXM5b6zwJ+fahSPb3SsaYeZKDiV1RednhW4SkApvEbGGeJ9
+JMuz2XgBjtbNcqv1keWeZ6QqDgaMwg02JenDEWnFwAAAAAAAA==


--=-i8gwMM4upyjwZHHYgb/Q--

