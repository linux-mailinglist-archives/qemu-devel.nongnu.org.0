Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC701E0BCF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 12:28:25 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdALH-00079C-Sk
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 06:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jdAKS-0006JC-60
 for qemu-devel@nongnu.org; Mon, 25 May 2020 06:27:32 -0400
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:51936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jdAKQ-00081D-PA
 for qemu-devel@nongnu.org; Mon, 25 May 2020 06:27:31 -0400
Received: from player787.ha.ovh.net (unknown [10.110.208.144])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 27505140C1C
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 12:27:19 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id B759F12DA05A1;
 Mon, 25 May 2020 10:27:01 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d606502f-2cb2-4bc0-ba2d-7477a65ac1ca,22A89661A4361147AF88D80C9EA00EFFECB1F326)
 smtp.auth=groug@kaod.org
Date: Mon, 25 May 2020 12:26:55 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC v2 11/18] guest memory protection: Handle memory encrption
 via interface
Message-ID: <20200525122655.0488cc3d@bahia.lan>
In-Reply-To: <20200521034304.340040-12-david@gibson.dropbear.id.au>
References: <20200521034304.340040-1-david@gibson.dropbear.id.au>
 <20200521034304.340040-12-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11351041387843197414
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvtddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueekjeekiefffedtveeukedvteejgeeivefhgfejgfdtleduvdfgfeelkeeuveeunecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.72.44; envelope-from=groug@kaod.org;
 helo=9.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:27:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 mdroth@linux.vnet.ibm.com, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


s/encrption/encryption

On Thu, 21 May 2020 13:42:57 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> At the moment AMD SEV sets a special function pointer, plus an opaque
> handle in KVMState to let things know how to encrypt guest memory.
>=20
> Now that we have a QOM interface for handling things related to guest
> memory protection, use a QOM method on that interface, rather than a bare
> function pointer for this.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  accel/kvm/kvm-all.c                    | 23 +++----
>  accel/kvm/sev-stub.c                   |  5 --
>  include/exec/guest-memory-protection.h |  2 +
>  include/sysemu/sev.h                   |  6 +-
>  target/i386/sev.c                      | 84 ++++++++++++++------------
>  5 files changed, 63 insertions(+), 57 deletions(-)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index d06cc04079..40997de38c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -45,6 +45,7 @@
>  #include "qapi/qapi-types-common.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "sysemu/reset.h"
> +#include "exec/guest-memory-protection.h"
> =20
>  #include "hw/boards.h"
> =20
> @@ -119,8 +120,7 @@ struct KVMState
>      QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
> =20
>      /* memory encryption */
> -    void *memcrypt_handle;
> -    int (*memcrypt_encrypt_data)(void *handle, uint8_t *ptr, uint64_t le=
n);
> +    GuestMemoryProtection *guest_memory_protection;
> =20
>      /* For "info mtree -f" to tell if an MR is registered in KVM */
>      int nr_as;
> @@ -172,7 +172,7 @@ int kvm_get_max_memslots(void)
> =20
>  bool kvm_memcrypt_enabled(void)
>  {
> -    if (kvm_state && kvm_state->memcrypt_handle) {
> +    if (kvm_state && kvm_state->guest_memory_protection) {
>          return true;
>      }
> =20
> @@ -181,10 +181,13 @@ bool kvm_memcrypt_enabled(void)
> =20
>  int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
>  {
> -    if (kvm_state->memcrypt_handle &&
> -        kvm_state->memcrypt_encrypt_data) {
> -        return kvm_state->memcrypt_encrypt_data(kvm_state->memcrypt_hand=
le,
> -                                              ptr, len);
> +    GuestMemoryProtection *gmpo =3D kvm_state->guest_memory_protection;
> +
> +    if (gmpo) {
> +        GuestMemoryProtectionClass *gmpc =3D
> +            GUEST_MEMORY_PROTECTION_GET_CLASS(gmpo);
> +
> +        return gmpc->encrypt_data(gmpo, ptr, len);
>      }
> =20
>      return 1;
> @@ -2101,13 +2104,11 @@ static int kvm_init(MachineState *ms)
>       * encryption context.
>       */
>      if (ms->memory_encryption) {
> -        kvm_state->memcrypt_handle =3D sev_guest_init(ms->memory_encrypt=
ion);
> -        if (!kvm_state->memcrypt_handle) {
> +        kvm_state->guest_memory_protection =3D sev_guest_init(ms->memory=
_encryption);
> +        if (!kvm_state->guest_memory_protection) {
>              ret =3D -1;
>              goto err;
>          }
> -
> -        kvm_state->memcrypt_encrypt_data =3D sev_encrypt_data;
>      }
> =20
>      ret =3D kvm_arch_init(ms, s);
> diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
> index 4f97452585..4a5cc5569e 100644
> --- a/accel/kvm/sev-stub.c
> +++ b/accel/kvm/sev-stub.c
> @@ -15,11 +15,6 @@
>  #include "qemu-common.h"
>  #include "sysemu/sev.h"
> =20
> -int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
> -{
> -    abort();
> -}
> -
>  void *sev_guest_init(const char *id)
>  {
>      return NULL;

This requires some extra care:

accel/kvm/sev-stub.c:18:7: error: conflicting types for =E2=80=98sev_guest_=
init=E2=80=99
 void *sev_guest_init(const char *id)
       ^~~~~~~~~~~~~~
In file included from accel/kvm/sev-stub.c:16:0:
include/sysemu/sev.h:21:24: note: previous declaration of =E2=80=98sev_gues=
t_init=E2=80=99 was here
 GuestMemoryProtection *sev_guest_init(const char *id);
                        ^~~~~~~~~~~~~~
rules.mak:69: recipe for target 'accel/kvm/sev-stub.o' failed

> diff --git a/include/exec/guest-memory-protection.h b/include/exec/guest-=
memory-protection.h
> index 38e9b01667..eb712a5804 100644
> --- a/include/exec/guest-memory-protection.h
> +++ b/include/exec/guest-memory-protection.h
> @@ -30,6 +30,8 @@ typedef struct GuestMemoryProtection GuestMemoryProtect=
ion;
> =20
>  typedef struct GuestMemoryProtectionClass {
>      InterfaceClass parent;
> +
> +    int (*encrypt_data)(GuestMemoryProtection *, uint8_t *, uint64_t);
>  } GuestMemoryProtectionClass;
> =20
>  #endif /* QEMU_GUEST_MEMORY_PROTECTION_H */
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 98c1ec8d38..7735a7942e 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -16,6 +16,8 @@
> =20
>  #include "sysemu/kvm.h"
> =20
> -void *sev_guest_init(const char *id);
> -int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
> +typedef struct GuestMemoryProtection GuestMemoryProtection;
> +
> +GuestMemoryProtection *sev_guest_init(const char *id);
> +
>  #endif
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index d273174ad3..986c2fee51 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -28,6 +28,7 @@
>  #include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "migration/blocker.h"
> +#include "exec/guest-memory-protection.h"
> =20
>  #define TYPE_SEV_GUEST "sev-guest"
>  #define SEV_GUEST(obj)                                          \
> @@ -281,26 +282,6 @@ sev_guest_set_sev_device(Object *obj, const char *va=
lue, Error **errp)
>      sev->sev_device =3D g_strdup(value);
>  }
> =20
> -static void
> -sev_guest_class_init(ObjectClass *oc, void *data)
> -{
> -    object_class_property_add_str(oc, "sev-device",
> -                                  sev_guest_get_sev_device,
> -                                  sev_guest_set_sev_device);
> -    object_class_property_set_description(oc, "sev-device",
> -            "SEV device to use");
> -    object_class_property_add_str(oc, "dh-cert-file",
> -                                  sev_guest_get_dh_cert_file,
> -                                  sev_guest_set_dh_cert_file);
> -    object_class_property_set_description(oc, "dh-cert-file",
> -            "guest owners DH certificate (encoded with base64)");
> -    object_class_property_add_str(oc, "session-file",
> -                                  sev_guest_get_session_file,
> -                                  sev_guest_set_session_file);
> -    object_class_property_set_description(oc, "session-file",
> -            "guest owners session parameters (encoded with base64)");
> -}
> -
>  static void
>  sev_guest_instance_init(Object *obj)
>  {
> @@ -319,20 +300,6 @@ sev_guest_instance_init(Object *obj)
>                                     OBJ_PROP_FLAG_READWRITE);
>  }
> =20
> -/* sev guest info */
> -static const TypeInfo sev_guest_info =3D {
> -    .parent =3D TYPE_OBJECT,
> -    .name =3D TYPE_SEV_GUEST,
> -    .instance_size =3D sizeof(SevGuestState),
> -    .instance_finalize =3D sev_guest_finalize,
> -    .class_init =3D sev_guest_class_init,
> -    .instance_init =3D sev_guest_instance_init,
> -    .interfaces =3D (InterfaceInfo[]) {
> -        { TYPE_USER_CREATABLE },
> -        { }
> -    }
> -};
> -
>  static SevGuestState *
>  lookup_sev_guest_info(const char *id)
>  {
> @@ -670,7 +637,7 @@ sev_vm_state_change(void *opaque, int running, RunSta=
te state)
>      }
>  }
> =20
> -void *
> +GuestMemoryProtection *
>  sev_guest_init(const char *id)
>  {
>      SevGuestState *sev;
> @@ -748,16 +715,16 @@ sev_guest_init(const char *id)
>      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
>      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
> =20
> -    return sev;
> +    return GUEST_MEMORY_PROTECTION(sev);
>  err:
>      sev_guest =3D NULL;
>      return NULL;
>  }
> =20
> -int
> -sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
> +static int
> +sev_encrypt_data(GuestMemoryProtection *opaque, uint8_t *ptr, uint64_t l=
en)
>  {
> -    SevGuestState *sev =3D handle;
> +    SevGuestState *sev =3D SEV_GUEST(opaque);
> =20
>      assert(sev);
> =20
> @@ -769,6 +736,45 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_=
t len)
>      return 0;
>  }
> =20
> +static void
> +sev_guest_class_init(ObjectClass *oc, void *data)
> +{
> +    GuestMemoryProtectionClass *gmpc =3D GUEST_MEMORY_PROTECTION_CLASS(o=
c);
> +
> +    object_class_property_add_str(oc, "sev-device",
> +                                  sev_guest_get_sev_device,
> +                                  sev_guest_set_sev_device);
> +    object_class_property_set_description(oc, "sev-device",
> +        "SEV device to use");
> +    object_class_property_add_str(oc, "dh-cert-file",
> +                                  sev_guest_get_dh_cert_file,
> +                                  sev_guest_set_dh_cert_file);
> +    object_class_property_set_description(oc, "dh-cert-file",
> +        "guest owners DH certificate (encoded with base64)");
> +    object_class_property_add_str(oc, "session-file",
> +                                  sev_guest_get_session_file,
> +                                  sev_guest_set_session_file);
> +    object_class_property_set_description(oc, "session-file",
> +        "guest owners session parameters (encoded with base64)");
> +
> +    gmpc->encrypt_data =3D sev_encrypt_data;
> +}
> +
> +/* sev guest info */
> +static const TypeInfo sev_guest_info =3D {
> +    .parent =3D TYPE_OBJECT,
> +    .name =3D TYPE_SEV_GUEST,
> +    .instance_size =3D sizeof(SevGuestState),
> +    .instance_finalize =3D sev_guest_finalize,
> +    .class_init =3D sev_guest_class_init,
> +    .instance_init =3D sev_guest_instance_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_GUEST_MEMORY_PROTECTION },
> +        { TYPE_USER_CREATABLE },
> +        { }
> +    }
> +};
> +
>  static void
>  sev_register_types(void)
>  {


