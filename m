Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8032F2E21
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:38:41 +0100 (CET)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI0W-0004rJ-QC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kzHPK-0004Dj-Ko; Tue, 12 Jan 2021 06:00:14 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kzHPG-0008Mz-K5; Tue, 12 Jan 2021 06:00:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E8E827AFD0B7;
 Tue, 12 Jan 2021 12:00:05 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 12 Jan
 2021 12:00:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002aa6424c8-1bae-4fd3-90b2-bb0287a7b3cc,
 D7A3512486C53AB1907B5452A8D2CB06296403FA) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 12 Jan 2021 11:59:59 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 05/13] confidential guest support: Rework the
 "memory-encryption" property
Message-ID: <20210112115959.2c042dbb@bahia.lan>
In-Reply-To: <20210112044508.427338-6-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-6-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ffca4688-4df4-4ccc-a6b2-4ca9940b29dd
X-Ovh-Tracer-Id: 9310347805589936479
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehjuhhnrdhnrghkrghjihhmrgesihhnthgvlhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, qemu-s390x@nongnu.org,
 jun.nakajima@intel.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 15:45:00 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> Currently the "memory-encryption" property is only looked at once we
> get to kvm_init().  Although protection of guest memory from the
> hypervisor isn't something that could really ever work with TCG, it's
> not conceptually tied to the KVM accelerator.
> 
> In addition, the way the string property is resolved to an object is
> almost identical to how a QOM link property is handled.
> 
> So, create a new "confidential-guest-support" link property which sets
> this QOM interface link directly in the machine.  For compatibility we
> keep the "memory-encryption" property, but now implemented in terms of
> the new property.
> 

Do we really want to keep "memory-encryption" in the long term ? If
not, then maybe engage the deprecation process and add a warning in
machine_set_memory_encryption() ?

Apart from that, LGTM:

Reviewed-by: Greg Kurz <groug@kaod.org>

> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  accel/kvm/kvm-all.c  |  5 +++--
>  accel/kvm/sev-stub.c |  5 +++--
>  hw/core/machine.c    | 43 +++++++++++++++++++++++++++++++++++++------
>  include/hw/boards.h  |  2 +-
>  include/sysemu/sev.h |  2 +-
>  target/i386/sev.c    | 32 ++------------------------------
>  6 files changed, 47 insertions(+), 42 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 260ed73ffe..28ab126f70 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2181,8 +2181,9 @@ static int kvm_init(MachineState *ms)
>       * if memory encryption object is specified then initialize the memory
>       * encryption context.
>       */
> -    if (ms->memory_encryption) {
> -        ret = sev_guest_init(ms->memory_encryption);
> +    if (ms->cgs) {
> +        /* FIXME handle mechanisms other than SEV */
> +        ret = sev_kvm_init(ms->cgs);
>          if (ret < 0) {
>              goto err;
>          }
> diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
> index 5db9ab8f00..3d4787ae4a 100644
> --- a/accel/kvm/sev-stub.c
> +++ b/accel/kvm/sev-stub.c
> @@ -15,7 +15,8 @@
>  #include "qemu-common.h"
>  #include "sysemu/sev.h"
>  
> -int sev_guest_init(const char *id)
> +int sev_kvm_init(ConfidentialGuestSupport *cgs)
>  {
> -    return -1;
> +    /* SEV can't be selected if it's not compiled */
> +    g_assert_not_reached();
>  }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8909117d80..94194ab82d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -32,6 +32,7 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/global_state.h"
>  #include "migration/vmstate.h"
> +#include "exec/confidential-guest-support.h"
>  
>  GlobalProperty hw_compat_5_2[] = {};
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> @@ -427,16 +428,37 @@ static char *machine_get_memory_encryption(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
>  
> -    return g_strdup(ms->memory_encryption);
> +    if (ms->cgs) {
> +        return g_strdup(object_get_canonical_path_component(OBJECT(ms->cgs)));
> +    }
> +
> +    return NULL;
>  }
>  
>  static void machine_set_memory_encryption(Object *obj, const char *value,
>                                          Error **errp)
>  {
> -    MachineState *ms = MACHINE(obj);
> +    Object *cgs =
> +        object_resolve_path_component(object_get_objects_root(), value);
> +
> +    if (!cgs) {
> +        error_setg(errp, "No such memory encryption object '%s'", value);
> +        return;
> +    }
>  
> -    g_free(ms->memory_encryption);
> -    ms->memory_encryption = g_strdup(value);
> +    object_property_set_link(obj, "confidential-guest-support", cgs, errp);
> +}
> +
> +static void machine_check_confidential_guest_support(const Object *obj,
> +                                                     const char *name,
> +                                                     Object *new_target,
> +                                                     Error **errp)
> +{
> +    /*
> +     * So far the only constraint is that the target has the
> +     * TYPE_CONFIDENTIAL_GUEST_SUPPORT interface, and that's checked
> +     * by the QOM core
> +     */
>  }
>  
>  static bool machine_get_nvdimm(Object *obj, Error **errp)
> @@ -836,6 +858,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "suppress-vmdesc",
>          "Set on to disable self-describing migration");
>  
> +    object_class_property_add_link(oc, "confidential-guest-support",
> +                                   TYPE_CONFIDENTIAL_GUEST_SUPPORT,
> +                                   offsetof(MachineState, cgs),
> +                                   machine_check_confidential_guest_support,
> +                                   OBJ_PROP_LINK_STRONG);
> +    object_class_property_set_description(oc, "confidential-guest-support",
> +                                          "Set confidential guest scheme to support");
> +
> +    /* For compatibility */
>      object_class_property_add_str(oc, "memory-encryption",
>          machine_get_memory_encryption, machine_set_memory_encryption);
>      object_class_property_set_description(oc, "memory-encryption",
> @@ -1158,9 +1189,9 @@ void machine_run_board_init(MachineState *machine)
>                      cc->deprecation_note);
>      }
>  
> -    if (machine->memory_encryption) {
> +    if (machine->cgs) {
>          /*
> -         * With memory encryption, the host can't see the real
> +         * With confidential guests, the host can't see the real
>           * contents of RAM, so there's no point in it trying to merge
>           * areas.
>           */
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 17b1f3f0b9..1acd662fa5 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -270,7 +270,7 @@ struct MachineState {
>      bool iommu;
>      bool suppress_vmdesc;
>      bool enable_graphics;
> -    char *memory_encryption;
> +    ConfidentialGuestSupport *cgs;
>      char *ram_memdev_id;
>      /*
>       * convenience alias to ram_memdev_id backend memory region
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 7335e59867..3b5b1aacf1 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -16,7 +16,7 @@
>  
>  #include "sysemu/kvm.h"
>  
> -int sev_guest_init(const char *id);
> +int sev_kvm_init(ConfidentialGuestSupport *cgs);
>  int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>                               uint64_t gpa, Error **errp);
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 2a4b2187d6..5399a136ad 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -335,26 +335,6 @@ static const TypeInfo sev_guest_info = {
>      }
>  };
>  
> -static SevGuestState *
> -lookup_sev_guest_info(const char *id)
> -{
> -    Object *obj;
> -    SevGuestState *info;
> -
> -    obj = object_resolve_path_component(object_get_objects_root(), id);
> -    if (!obj) {
> -        return NULL;
> -    }
> -
> -    info = (SevGuestState *)
> -            object_dynamic_cast(obj, TYPE_SEV_GUEST);
> -    if (!info) {
> -        return NULL;
> -    }
> -
> -    return info;
> -}
> -
>  bool
>  sev_enabled(void)
>  {
> @@ -682,10 +662,9 @@ sev_vm_state_change(void *opaque, int running, RunState state)
>      }
>  }
>  
> -int
> -sev_guest_init(const char *id)
> +int sev_kvm_init(ConfidentialGuestSupport *cgs)
>  {
> -    SevGuestState *sev;
> +    SevGuestState *sev = SEV_GUEST(cgs);
>      char *devname;
>      int ret, fw_error;
>      uint32_t ebx;
> @@ -698,13 +677,6 @@ sev_guest_init(const char *id)
>          return -1;
>      }
>  
> -    sev = lookup_sev_guest_info(id);
> -    if (!sev) {
> -        error_report("%s: '%s' is not a valid '%s' object",
> -                     __func__, id, TYPE_SEV_GUEST);
> -        goto err;
> -    }
> -
>      sev_guest = sev;
>      sev->state = SEV_STATE_UNINIT;
>  


