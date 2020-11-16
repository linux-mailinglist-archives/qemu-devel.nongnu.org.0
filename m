Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A7C2B44E8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:45:23 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeos-0005qY-2i
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1keen2-0004iC-AL; Mon, 16 Nov 2020 08:43:32 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:52393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1keemy-0005i2-PE; Mon, 16 Nov 2020 08:43:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 7E86E730213A;
 Mon, 16 Nov 2020 14:43:13 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 14:43:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0037feb3e37-944c-484b-8f30-ac1768c8a5b4,
 4C8231DAC7BA0B5668AD0293EB9EBEB96F7691F2) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-5.2] spapr/xive: Create IPIs in KVM on demand
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <160528045027.804522.6161091782230763832.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8e600620-8721-c9fe-08bf-df3138437200@kaod.org>
Date: Mon, 16 Nov 2020 14:43:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160528045027.804522.6161091782230763832.stgit@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 549d0f34-9821-4d49-811f-fcc57f1f37fd
X-Ovh-Tracer-Id: 9363265104130247462
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeffieefueejhfegvdevvddvleeikeefveeljefghfdujeelvdegkefhleekueeknecuffhomhgrihhnpehlrghunhgthhhprggurdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:43:14
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Satheesh Rajendran <sathnaga@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 4:14 PM, Greg Kurz wrote:
> Recent commit acbdb9956fe9 introduced a dedicated path to create
> IPIs in KVM. This is done from under kvmppc_xive_cpu_connect() with
> the assumption that the IPI number is equal to the vCPU id. The
> latter is wrong: the guest chooses an arbitrary LISN from the
> "ibm,xive-lisn-ranges" and assigns it to a target vCPU with the
> H_INT_SET_SOURCE_CONFIG hcall. This went unnoticed so far because
> IPI numbers and vCPU ids happen to match by default. This is no
> longer the case though when setting the VSMT machine property to
> a value that is different from (ie. bigger than) the number of
> vCPUs per core (ie. -smp threads). Wrong IPIs end up being created
> in KVM but the guest still uses the ones it has allocated and gets
> very confused (see BugLink below).
> 
> Fix this by creating the IPI at the only place where we have
> its appropriate number : when the guest allocates it with the
> H_INT_SET_SOURCE_CONFIG hcall. We detect this is an IPI because
> it is < SPAPR_XIRQ_BASE and we get the vCPU id from the hcall
> arguments. The EAS of the IPI is tracked in the kvm_enabled_cpus
> list. It is now used instead of vcpu_id to filter unallocated IPIs
> out in xive_source_is_valid(). It also allows to only reset the
> IPI on the first call to H_INT_SET_SOURCE_CONFIG.
> 
> Restore unmasked IPIs from the vCPU contexts in kvmppc_xive_post_load().
> Masked ones will be created when the guests eventually unmask them
> with H_INT_SET_SOURCE_CONFIG.
> 
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other sources")
> BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
> Cc: clg@kaod.org
> Signed-off-by: Greg Kurz <groug@kaod.org>


I am quite certain this is correct but the complexity looks like a 
potential source of bugs. So I think it is simpler to revert the 
optimization introduced by acbdb9956fe9 and find a better solution 
covering SMT also. 

Thanks,

C.



> ---
>  hw/intc/spapr_xive_kvm.c |  141 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 127 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 66bf4c06fe55..4e5871c3aac2 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -30,6 +30,7 @@
>   */
>  typedef struct KVMEnabledCPU {
>      unsigned long vcpu_id;
> +    XiveEAS *ipi_eas;
>      QLIST_ENTRY(KVMEnabledCPU) node;
>  } KVMEnabledCPU;
>  
> @@ -55,6 +56,7 @@ static void kvm_cpu_enable(CPUState *cs)
>  
>      enabled_cpu = g_malloc(sizeof(*enabled_cpu));
>      enabled_cpu->vcpu_id = vcpu_id;
> +    enabled_cpu->ipi_eas = NULL;
>      QLIST_INSERT_HEAD(&kvm_enabled_cpus, enabled_cpu, node);
>  }
>  
> @@ -156,26 +158,29 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, Error **errp)
>   */
>  typedef struct {
>      SpaprXive *xive;
> +    uint32_t lisn;
>      Error *err;
>      int rc;
>  } XiveInitIPI;
>  
>  static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data arg)
>  {
> -    unsigned long ipi = kvm_arch_vcpu_id(cs);
>      XiveInitIPI *s = arg.host_ptr;
> +    unsigned long ipi = s->lisn;
>      uint64_t state = 0;
>  
>      s->rc = kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, ipi,
>                                &state, true, &s->err);
>  }
>  
> -static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error **errp)
> +static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, uint32_t lisn,
> +                                 Error **errp)
>  {
>      XiveInitIPI s = {
>          .xive = xive,
>          .err  = NULL,
>          .rc   = 0,
> +        .lisn = lisn,
>      };
>  
>      run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&s));
> @@ -214,12 +219,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>          return ret;
>      }
>  
> -    /* Create/reset the vCPU IPI */
> -    ret = kvmppc_xive_reset_ipi(xive, tctx->cs, errp);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
>      kvm_cpu_enable(tctx->cs);
>      return 0;
>  }
> @@ -228,6 +227,62 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>   * XIVE Interrupt Source (KVM)
>   */
>  
> +static bool spapr_xive_is_ipi(uint32_t lisn)
> +{
> +    return lisn < SPAPR_XIRQ_BASE;
> +}
> +
> +static bool kvm_ipi_is_enabled(SpaprXive *xive, uint32_t lisn)
> +{
> +    KVMEnabledCPU *enabled_cpu;
> +
> +    g_assert(spapr_xive_is_ipi(lisn));
> +
> +    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
> +        if (enabled_cpu->ipi_eas == &xive->eat[lisn]) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static int kvm_ipi_enable(SpaprXive *xive, uint32_t lisn, uint32_t vcpu_id,
> +                          Error **errp)
> +{
> +    KVMEnabledCPU *enabled_cpu;
> +
> +    g_assert(spapr_xive_is_ipi(lisn));
> +
> +    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
> +        if (enabled_cpu->vcpu_id == vcpu_id) {
> +            CPUState *cs = CPU(spapr_find_cpu(vcpu_id));
> +            XiveEAS *eas = &xive->eat[lisn];
> +
> +            /* No change ? */
> +            if (enabled_cpu->ipi_eas && enabled_cpu->ipi_eas == eas) {
> +                return 0;
> +            }
> +
> +            /* XXX: abort ? */
> +            if (!cs) {
> +                break;
> +            }
> +
> +            /* Create/reset the vCPU IPI */
> +            int ret = kvmppc_xive_reset_ipi(xive, cs, lisn, errp);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +
> +            enabled_cpu->ipi_eas = eas;
> +            return 0;
> +        }
> +    }
> +
> +    error_setg(errp, "vCPU #%d not found", vcpu_id);
> +    return -ESRCH;
> +}
> +
>  int kvmppc_xive_set_source_config(SpaprXive *xive, uint32_t lisn, XiveEAS *eas,
>                                    Error **errp)
>  {
> @@ -248,6 +303,14 @@ int kvmppc_xive_set_source_config(SpaprXive *xive, uint32_t lisn, XiveEAS *eas,
>  
>      spapr_xive_end_to_target(end_blk, end_idx, &server, &priority);
>  
> +    if (spapr_xive_is_ipi(lisn)) {
> +        /* Create the vCPU IPI */
> +        int ret = kvm_ipi_enable(xive, lisn, server, errp);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
>      kvm_src = priority << KVM_XIVE_SOURCE_PRIORITY_SHIFT &
>          KVM_XIVE_SOURCE_PRIORITY_MASK;
>      kvm_src |= server << KVM_XIVE_SOURCE_SERVER_SHIFT &
> @@ -280,7 +343,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>      assert(xive->fd != -1);
>  
>      /*
> -     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
> +     * The vCPU IPIs are now allocated in kvmppc_xive_set_source_config()
>       * and not with all sources in kvmppc_xive_source_reset()
>       */
>      assert(srcno >= SPAPR_XIRQ_BASE);
> @@ -300,12 +363,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>   * To be valid, a source must have been claimed by the machine (valid
>   * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
>   * have been enabled, which means the IPI has been allocated in
> - * kvmppc_xive_cpu_connect().
> + * kvmppc_xive_set_source_config().
>   */
>  static bool xive_source_is_valid(SpaprXive *xive, int i)
>  {
>      return xive_eas_is_valid(&xive->eat[i]) &&
> -        (i >= SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
> +        (!spapr_xive_is_ipi(i) || kvm_ipi_is_enabled(xive, i));
>  }
>  
>  static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
> @@ -314,8 +377,8 @@ static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
>      int i;
>  
>      /*
> -     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
> -     * connected in kvmppc_xive_cpu_connect()
> +     * Skip the vCPU IPIs. These are created/reset on-demand in
> +     * kvmppc_xive_set_source_config().
>       */
>      for (i = SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
>          int ret;
> @@ -724,7 +787,57 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
>      }
>  
>      /* Restore the EAT */
> -    for (i = 0; i < xive->nr_irqs; i++) {
> +
> +    /* IPIs are restored from the appropriate vCPU context */
> +    CPU_FOREACH(cs) {
> +        /*
> +         * The EAT has valid entries to accomodate all possible vCPUs,
> +         * but we only want to allocate in KVM the IPIs that were
> +         * actually allocated before migration. Let's consider the full
> +         * list of IPIs to find an EAS that matches the vCPU id.
> +         *
> +         * If an IPI appears unmasked in the EAT, it is a proof that the
> +         * guest did successfully call H_INT_SET_SOURCE_CONFIG and we
> +         * should thus create the IPI at the KVM level if the END index
> +         * matches the vCPU id.
> +         *
> +         * If an IPI appears masked in the EAT, then we don't know exactly
> +         * what happened before migration but we don't care. The IPI will
> +         * be created when the guest eventually unmasks it with a subsequent
> +         * call to H_INT_SET_SOURCE_CONFIG.
> +         */
> +        for (i = 0; i < SPAPR_XIRQ_BASE; i++) {
> +            XiveEAS *eas = &xive->eat[i];
> +            uint32_t end_idx;
> +            uint32_t end_blk;
> +            uint8_t priority;
> +            uint32_t server;
> +
> +            if (!xive_eas_is_valid(eas)) {
> +                continue;
> +            }
> +
> +            if (xive_eas_is_masked(eas)) {
> +                continue;
> +            }
> +
> +            end_idx = xive_get_field64(EAS_END_INDEX, eas->w);
> +            end_blk = xive_get_field64(EAS_END_BLOCK, eas->w);
> +            spapr_xive_end_to_target(end_blk, end_idx, &server, &priority);
> +            if (server != kvm_arch_vcpu_id(cs)) {
> +                continue;
> +            }
> +
> +            ret = kvmppc_xive_set_source_config(xive, i, eas, &local_err);
> +            if (ret < 0) {
> +                goto fail;
> +            }
> +            break;
> +        }
> +    }
> +
> +    /* Now restore non-IPIs */
> +    for (i = SPAPR_XIRQ_BASE; i < xive->nr_irqs; i++) {
>          if (!xive_source_is_valid(xive, i)) {
>              continue;
>          }
> 
> 


