Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786096632AA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 22:19:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEzXZ-0002ZF-H1; Mon, 09 Jan 2023 16:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pEzXU-0002Z7-Pu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:18:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pEzXS-0002ve-B1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4f1sIhcGlksQEWAJDA4Crs/CH5X5vJ6N4+QI50sjSbY=; b=HN82nllrEIMbU6RDwob0rWoNfl
 K25jW3wTEo47HKEr1x5HoMFwhF1I/dSxlqUzh8GYHnAytQ6qnRkSK3wRgMiBflFuyVZt3c4O2AaBU
 dX/KSfKdTB5yExRWXIWbA0HvGCrJ6hP45k2ydLNZuR7l50dIXyB4z66XWpgSgpnv0mjrT0OK8FUs+
 XQh6nqo9siPKNfS2589fbxnm4hWhFM8zbzVc9GnBD58G/8kclRYn9j4ufiSDlhbfUgJ+9vWaMCYGW
 WSBvGuHr9LdVk33+0XmJ1YtoaoeiAzDUT7jzElMpampMv4UQL/3gPu+z75Vr6hVSI/cfLgMZXwe23
 KePH41Og==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pEzXY-002dhJ-Oh; Mon, 09 Jan 2023 21:18:44 +0000
Message-ID: <e01807f69df95883de9c5ae75af5afd5a57da399.camel@infradead.org>
Subject: Re: [RFC PATCH v5 28/52] i386/xen: Add support for Xen event
 channel delivery to vCPU
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Joao
 Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Date: Mon, 09 Jan 2023 21:18:31 +0000
In-Reply-To: <20221230121235.1282915-29-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-29-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-LexYA2qrgFlJoMiYW/Cr"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-LexYA2qrgFlJoMiYW/Cr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-12-30 at 12:12 +0000, David Woodhouse wrote:
>=20
> +static void *gpa_to_hva(uint64_t gpa)
> +{
> +=C2=A0=C2=A0=C2=A0 MemoryRegionSection mrs;
> +
> +=C2=A0=C2=A0=C2=A0 mrs =3D memory_region_find(get_system_memory(), gpa, =
1);
> +=C2=A0=C2=A0=C2=A0 return !mrs.mr ? NULL : qemu_map_ram_ptr(mrs.mr->ram_=
block,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mrs.offset_within_region);
> +}
> +
> +void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
> +{
> +=C2=A0=C2=A0=C2=A0 CPUState *cs =3D qemu_get_cpu(vcpu_id);
> +=C2=A0=C2=A0=C2=A0 CPUX86State *env;
> +=C2=A0=C2=A0=C2=A0 uint64_t gpa;
> +
> +=C2=A0=C2=A0=C2=A0 if (!cs) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 env =3D &X86_CPU(cs)->env;
> +
> +=C2=A0=C2=A0=C2=A0 gpa =3D env->xen_vcpu_info_gpa;
> +=C2=A0=C2=A0=C2=A0 if (gpa =3D=3D INVALID_GPA) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpa =3D env->xen_vcpu_info_de=
fault_gpa;
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 if (gpa =3D=3D INVALID_GPA) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return gpa_to_hva(gpa);
> +}

Hm, no. That leaks a refcount on the MemoryRegion each time, doesn't
it?

Fixing it up something like this, by caching the HVA (and the
MemoryRegion so we can unref it later)...=C2=A0

I'll send the incremental patch to allow for specific review without it
getting lost in the noise:

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1a411e1b49..b579f0f0f8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1791,6 +1791,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    MemoryRegion *xen_vcpu_info_mr;
+    void *xen_vcpu_info_hva;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 6c0f180059..aa2c00e0b9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -320,6 +320,35 @@ static void do_set_vcpu_callback_vector(CPUState *cs, =
run_on_cpu_data data)
     }
 }
=20
+static int set_vcpu_info(CPUState *cs, uint64_t gpa)
+{
+    X86CPU *cpu =3D X86_CPU(cs);
+    CPUX86State *env =3D &cpu->env;
+    MemoryRegionSection mrs;
+    int ret;
+
+    ret =3D kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gp=
a);
+    if (ret || gpa =3D=3D INVALID_GPA) {
+    fail:
+        if (env->xen_vcpu_info_mr) {
+            memory_region_unref(env->xen_vcpu_info_mr);
+            env->xen_vcpu_info_mr =3D NULL;
+        }
+        env->xen_vcpu_info_hva =3D NULL;
+        return ret;
+    }
+
+    mrs =3D memory_region_find(get_system_memory(), gpa, sizeof(struct vcp=
u_info));
+    if (!mrs.mr || !mrs.mr->ram_block || mrs.size < sizeof(struct vcpu_inf=
o) ||
+        !(env->xen_vcpu_info_hva =3D qemu_map_ram_ptr(mrs.mr->ram_block,
+                                                    mrs.offset_within_regi=
on))) {
+        ret =3D -EINVAL;
+        goto fail;
+    }
+    env->xen_vcpu_info_mr =3D mrs.mr;
+    return 0;
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data dat=
a)
 {
     X86CPU *cpu =3D X86_CPU(cs);
@@ -329,8 +358,7 @@ static void do_set_vcpu_info_default_gpa(CPUState *cs, =
run_on_cpu_data data)
=20
     /* Changing the default does nothing if a vcpu_info was explicitly set=
. */
     if (env->xen_vcpu_info_gpa =3D=3D INVALID_GPA) {
-        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                              env->xen_vcpu_info_default_gpa);
+        set_vcpu_info(cs, env->xen_vcpu_info_default_gpa);
     }
 }
=20
@@ -341,55 +369,30 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on=
_cpu_data data)
=20
     env->xen_vcpu_info_gpa =3D data.host_ulong;
=20
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                          env->xen_vcpu_info_gpa);
-}
-
-static void *gpa_to_hva(uint64_t gpa)
-{
-    MemoryRegionSection mrs;
-
-    mrs =3D memory_region_find(get_system_memory(), gpa, 1);
-    return !mrs.mr ? NULL : qemu_map_ram_ptr(mrs.mr->ram_block,
-                                             mrs.offset_within_region);
-}
-
-static void *vcpu_info_hva_from_cs(CPUState *cs)
-{
-    CPUX86State *env =3D &X86_CPU(cs)->env;
-    uint64_t gpa =3D env->xen_vcpu_info_gpa;
-
-    if (gpa =3D=3D INVALID_GPA) {
-        gpa =3D env->xen_vcpu_info_default_gpa;
-    }
-    if (gpa =3D=3D INVALID_GPA) {
-        return NULL;
-    }
-
-    return gpa_to_hva(gpa);
+    set_vcpu_info(cs, env->xen_vcpu_info_gpa);
 }
=20
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
 {
     CPUState *cs =3D qemu_get_cpu(vcpu_id);
-
     if (!cs) {
             return NULL;
     }
=20
-    return vcpu_info_hva_from_cs(cs);
+    return X86_CPU(cs)->env.xen_vcpu_info_hva;
 }
=20
 void kvm_xen_maybe_deassert_callback(CPUState *cs)
 {
-    struct vcpu_info *vi =3D vcpu_info_hva_from_cs(cs);
+    CPUX86State *env =3D &X86_CPU(cs)->env;
+    struct vcpu_info *vi =3D env->xen_vcpu_info_hva;
     if (!vi) {
             return;
     }
=20
     /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
     if (!vi->evtchn_upcall_pending) {
-        X86_CPU(cs)->env.xen_callback_asserted =3D false;
+        env->xen_callback_asserted =3D false;
         xen_evtchn_set_callback_level(0);
     }
 }
@@ -519,7 +522,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu=
_data data)
     env->xen_singleshot_timer_ns =3D 0;
     memset(env->xen_virq, 0, sizeof(env->xen_virq));
=20
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GP=
A);
+    set_vcpu_info(cs, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
@@ -1572,7 +1575,7 @@ int kvm_put_xen_state(CPUState *cs)
     }
=20
     if (gpa !=3D INVALID_GPA) {
-        ret =3D kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO=
, gpa);
+        ret =3D set_vcpu_info(cs, gpa);
         if (ret < 0) {
             return ret;
         }


--=-LexYA2qrgFlJoMiYW/Cr
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTA5MjExODMxWjAvBgkqhkiG9w0BCQQxIgQgcJ68AFN+
p7fg0kKdxG/n7TOOhPvbnBxT12No4Ej+Lz4wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBnRWVv7yjJPasaA29VoIMJ0LxwrNAG65wH
y22iM0zgy0iYMcBH4W1GA6HpXEFo2WBKSe0l0FU09ttlQ8lzYwn7IQ0WXkx+9nNZUUT6XaWdchI2
ttF+edUUS/QpqblRU6KSjp5fmeV0EC3f8BXvIxQOVt+JlBTENIqVKmK+RMAM8ejWwUyyD0iVn1Bw
9i35K2EWu2OlGTw9EQMqsPlqcVRz54vc/SX4lshfJ1Vo9AinVqn+nLjLuqsXfB4G1FSsJfXTR2LI
Tl9DfERMD6xkov1FlXPQSn9HNUpLuuZiTSKnH4Q6scc3udtGurxyOHX4zwcBDt6uC9cwD1dsa5BK
/FsIdFO6L4tx3ggTzRx5vhP4LJ+R7Qlbuwo7VSviDsSQ5GiMGw9Pa2AzX+fVnXCq0AEz+qaWwps6
3P/LID/VwpTFvlI1myAdv7otpW35gHKmFY04uOx3lT1Or9FfgKu5XJ+nDBXKugvMi9KkbIIi0/2d
nDJV7kt0urIi9+BwcDvhUbKP12qTVAgNJ/62VDEa0MmrwLfMgnJi8FEnnvDDdgZPzGcjxAeLFiKq
CZsxJuZFUuycKhGTOxuJ+wzN4GQubBSgyN+75lIzslgwn6r8TBEs+6O5oRod0iONiJ3BEyXudLZO
Ta/2tMMfeQUxPJDi0cIhfqwuah6Qiyra/H9sgUOIGwAAAAAAAA==


--=-LexYA2qrgFlJoMiYW/Cr--

