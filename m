Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C930DFBE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:29:39 +0100 (CET)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7L2A-0004Dm-51
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l7Kse-000456-Vo; Wed, 03 Feb 2021 11:19:50 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:38073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l7KsY-00025n-MX; Wed, 03 Feb 2021 11:19:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 72A3D23B7AA;
 Wed,  3 Feb 2021 17:19:37 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:19:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004775c84c0-6db0-4b93-9b08-aca2e22130d3,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 17:19:32 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 08/13] confidential guest support: Move SEV
 initialization into arch specific code
Message-ID: <20210203171932.1aff3727@bahia.lan>
In-Reply-To: <20210202041315.196530-9-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
 <20210202041315.196530-9-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 83a069bd-f82f-4408-9952-fe465c7bfbce
X-Ovh-Tracer-Id: 14778843655363598687
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegvhhgrsghkohhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, mtosatti@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, borntraeger@de.ibm.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 pragyansri.pathi@intel.com, andi.kleen@intel.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  2 Feb 2021 15:13:10 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> While we've abstracted some (potential) differences between mechanisms for
> securing guest memory, the initialization is still specific to SEV.  Given
> that, move it into x86's kvm_arch_init() code, rather than the generic
> kvm_init() code.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  accel/kvm/kvm-all.c   | 14 --------------
>  accel/kvm/sev-stub.c  |  4 ++--
>  target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
>  target/i386/sev.c     |  7 ++++++-
>  4 files changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 3d820d0c7d..7150acdbcc 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2180,20 +2180,6 @@ static int kvm_init(MachineState *ms)
>  
>      kvm_state = s;
>  
> -    /*
> -     * if memory encryption object is specified then initialize the memory
> -     * encryption context.
> -     */
> -    if (ms->cgs) {
> -        Error *local_err = NULL;
> -        /* FIXME handle mechanisms other than SEV */
> -        ret = sev_kvm_init(ms->cgs, &local_err);
> -        if (ret < 0) {
> -            error_report_err(local_err);
> -            goto err;
> -        }
> -    }
> -
>      ret = kvm_arch_init(ms, s);
>      if (ret < 0) {
>          goto err;
> diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
> index 512e205f7f..9587d1b2a3 100644
> --- a/accel/kvm/sev-stub.c
> +++ b/accel/kvm/sev-stub.c
> @@ -17,6 +17,6 @@
>  
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
> -    /* SEV can't be selected if it's not compiled */
> -    g_assert_not_reached();
> +    /* If we get here, cgs must be some non-SEV thing */
> +    return 0;
>  }
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 6dc1ee052d..4788139128 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -42,6 +42,7 @@
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/i386/e820_memory_layout.h"
> +#include "sysemu/sev.h"
>  
>  #include "hw/pci/pci.h"
>  #include "hw/pci/msi.h"
> @@ -2135,6 +2136,25 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      uint64_t shadow_mem;
>      int ret;
>      struct utsname utsname;
> +    Error *local_err = NULL;
> +
> +    /*
> +     * Initialize SEV context, if required
> +     *
> +     * If no memory encryption is requested (ms->cgs == NULL) this is
> +     * a no-op.
> +     *
> +     * It's also a no-op if a non-SEV confidential guest support
> +     * mechanism is selected.  SEV is the only mechanism available to
> +     * select on x86 at present, so this doesn't arise, but if new
> +     * mechanisms are supported in future (e.g. TDX), they'll need
> +     * their own initialization either here or elsewhere.
> +     */
> +    ret = sev_kvm_init(ms->cgs, &local_err);
> +    if (ret < 0) {
> +        error_report_err(local_err);
> +        return ret;
> +    }
>  
>      if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
>          error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index f9e9b5d8ae..11c9a3cc21 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -664,13 +664,18 @@ sev_vm_state_change(void *opaque, int running, RunState state)
>  
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
> -    SevGuestState *sev = SEV_GUEST(cgs);
> +    SevGuestState *sev
> +        = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);
>      char *devname;
>      int ret, fw_error;
>      uint32_t ebx;
>      uint32_t host_cbitpos;
>      struct sev_user_data_status status = {};
>  
> +    if (!sev) {
> +        return 0;
> +    }
> +
>      ret = ram_block_discard_disable(true);
>      if (ret) {
>          error_report("%s: cannot disable RAM discard", __func__);


