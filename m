Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF872B457F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:06:36 +0100 (CET)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kef9P-0008Ea-O0
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kef7M-0006cD-6D
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:04:28 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:35216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kef7G-0004lH-1Y
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:04:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id BF478235D5F;
 Mon, 16 Nov 2020 15:04:17 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 15:04:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e54e454a-196b-499e-a844-78be99e293ab,
 5DC1A71B4DA47E6A258F2FD66590EA27958A2DF2) smtp.auth=groug@kaod.org
Date: Mon, 16 Nov 2020 15:04:15 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.2] spapr/xive: Create IPIs in KVM on demand
Message-ID: <20201116150415.60438951@bahia.lan>
In-Reply-To: <8e600620-8721-c9fe-08bf-df3138437200@kaod.org>
References: <160528045027.804522.6161091782230763832.stgit@bahia.lan>
 <8e600620-8721-c9fe-08bf-df3138437200@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 932563ca-85c6-4e9c-b6c0-d15986b0cc68
X-Ovh-Tracer-Id: 9719049473078303014
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqheftdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehleeutefhgfegkedvveehueeuveethedvledufeektdehtdekiefhgedtgeeftdenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 09:04:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Satheesh Rajendran <sathnaga@linux.ibm.com>,
 Gustavo Romero <gromero@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 14:43:12 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/13/20 4:14 PM, Greg Kurz wrote:
> > Recent commit acbdb9956fe9 introduced a dedicated path to create
> > IPIs in KVM. This is done from under kvmppc_xive_cpu_connect() with
> > the assumption that the IPI number is equal to the vCPU id. The
> > latter is wrong: the guest chooses an arbitrary LISN from the
> > "ibm,xive-lisn-ranges" and assigns it to a target vCPU with the
> > H_INT_SET_SOURCE_CONFIG hcall. This went unnoticed so far because
> > IPI numbers and vCPU ids happen to match by default. This is no
> > longer the case though when setting the VSMT machine property to
> > a value that is different from (ie. bigger than) the number of
> > vCPUs per core (ie. -smp threads). Wrong IPIs end up being created
> > in KVM but the guest still uses the ones it has allocated and gets
> > very confused (see BugLink below).
> >=20
> > Fix this by creating the IPI at the only place where we have
> > its appropriate number : when the guest allocates it with the
> > H_INT_SET_SOURCE_CONFIG hcall. We detect this is an IPI because
> > it is < SPAPR_XIRQ_BASE and we get the vCPU id from the hcall
> > arguments. The EAS of the IPI is tracked in the kvm_enabled_cpus
> > list. It is now used instead of vcpu_id to filter unallocated IPIs
> > out in xive_source_is_valid(). It also allows to only reset the
> > IPI on the first call to H_INT_SET_SOURCE_CONFIG.
> >=20
> > Restore unmasked IPIs from the vCPU contexts in kvmppc_xive_post_load().
> > Masked ones will be created when the guests eventually unmask them
> > with H_INT_SET_SOURCE_CONFIG.
> >=20
> > Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the =
other sources")
> > BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
> > Cc: clg@kaod.org
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
>=20
> I am quite certain this is correct but the complexity looks like a=20
> potential source of bugs. So I think it is simpler to revert the=20
> optimization introduced by acbdb9956fe9 and find a better solution=20
> covering SMT also.=20
>=20

I tend to agree. Even if I could successfully test various scenarios
around hotplug and migration, I'm really not super confident to merge
this in an RC. I'll post a series that reverts acbdb9956fe9 ASAP.

> Thanks,
>=20
> C.
>=20
>=20
>=20
> > ---
> >  hw/intc/spapr_xive_kvm.c |  141 ++++++++++++++++++++++++++++++++++++++=
+++-----
> >  1 file changed, 127 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > index 66bf4c06fe55..4e5871c3aac2 100644
> > --- a/hw/intc/spapr_xive_kvm.c
> > +++ b/hw/intc/spapr_xive_kvm.c
> > @@ -30,6 +30,7 @@
> >   */
> >  typedef struct KVMEnabledCPU {
> >      unsigned long vcpu_id;
> > +    XiveEAS *ipi_eas;
> >      QLIST_ENTRY(KVMEnabledCPU) node;
> >  } KVMEnabledCPU;
> > =20
> > @@ -55,6 +56,7 @@ static void kvm_cpu_enable(CPUState *cs)
> > =20
> >      enabled_cpu =3D g_malloc(sizeof(*enabled_cpu));
> >      enabled_cpu->vcpu_id =3D vcpu_id;
> > +    enabled_cpu->ipi_eas =3D NULL;
> >      QLIST_INSERT_HEAD(&kvm_enabled_cpus, enabled_cpu, node);
> >  }
> > =20
> > @@ -156,26 +158,29 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *t=
ctx, Error **errp)
> >   */
> >  typedef struct {
> >      SpaprXive *xive;
> > +    uint32_t lisn;
> >      Error *err;
> >      int rc;
> >  } XiveInitIPI;
> > =20
> >  static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data=
 arg)
> >  {
> > -    unsigned long ipi =3D kvm_arch_vcpu_id(cs);
> >      XiveInitIPI *s =3D arg.host_ptr;
> > +    unsigned long ipi =3D s->lisn;
> >      uint64_t state =3D 0;
> > =20
> >      s->rc =3D kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, =
ipi,
> >                                &state, true, &s->err);
> >  }
> > =20
> > -static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error =
**errp)
> > +static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, uint32=
_t lisn,
> > +                                 Error **errp)
> >  {
> >      XiveInitIPI s =3D {
> >          .xive =3D xive,
> >          .err  =3D NULL,
> >          .rc   =3D 0,
> > +        .lisn =3D lisn,
> >      };
> > =20
> >      run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&=
s));
> > @@ -214,12 +219,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error =
**errp)
> >          return ret;
> >      }
> > =20
> > -    /* Create/reset the vCPU IPI */
> > -    ret =3D kvmppc_xive_reset_ipi(xive, tctx->cs, errp);
> > -    if (ret < 0) {
> > -        return ret;
> > -    }
> > -
> >      kvm_cpu_enable(tctx->cs);
> >      return 0;
> >  }
> > @@ -228,6 +227,62 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error =
**errp)
> >   * XIVE Interrupt Source (KVM)
> >   */
> > =20
> > +static bool spapr_xive_is_ipi(uint32_t lisn)
> > +{
> > +    return lisn < SPAPR_XIRQ_BASE;
> > +}
> > +
> > +static bool kvm_ipi_is_enabled(SpaprXive *xive, uint32_t lisn)
> > +{
> > +    KVMEnabledCPU *enabled_cpu;
> > +
> > +    g_assert(spapr_xive_is_ipi(lisn));
> > +
> > +    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
> > +        if (enabled_cpu->ipi_eas =3D=3D &xive->eat[lisn]) {
> > +            return true;
> > +        }
> > +    }
> > +    return false;
> > +}
> > +
> > +static int kvm_ipi_enable(SpaprXive *xive, uint32_t lisn, uint32_t vcp=
u_id,
> > +                          Error **errp)
> > +{
> > +    KVMEnabledCPU *enabled_cpu;
> > +
> > +    g_assert(spapr_xive_is_ipi(lisn));
> > +
> > +    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
> > +        if (enabled_cpu->vcpu_id =3D=3D vcpu_id) {
> > +            CPUState *cs =3D CPU(spapr_find_cpu(vcpu_id));
> > +            XiveEAS *eas =3D &xive->eat[lisn];
> > +
> > +            /* No change ? */
> > +            if (enabled_cpu->ipi_eas && enabled_cpu->ipi_eas =3D=3D ea=
s) {
> > +                return 0;
> > +            }
> > +
> > +            /* XXX: abort ? */
> > +            if (!cs) {
> > +                break;
> > +            }
> > +
> > +            /* Create/reset the vCPU IPI */
> > +            int ret =3D kvmppc_xive_reset_ipi(xive, cs, lisn, errp);
> > +            if (ret < 0) {
> > +                return ret;
> > +            }
> > +
> > +            enabled_cpu->ipi_eas =3D eas;
> > +            return 0;
> > +        }
> > +    }
> > +
> > +    error_setg(errp, "vCPU #%d not found", vcpu_id);
> > +    return -ESRCH;
> > +}
> > +
> >  int kvmppc_xive_set_source_config(SpaprXive *xive, uint32_t lisn, Xive=
EAS *eas,
> >                                    Error **errp)
> >  {
> > @@ -248,6 +303,14 @@ int kvmppc_xive_set_source_config(SpaprXive *xive,=
 uint32_t lisn, XiveEAS *eas,
> > =20
> >      spapr_xive_end_to_target(end_blk, end_idx, &server, &priority);
> > =20
> > +    if (spapr_xive_is_ipi(lisn)) {
> > +        /* Create the vCPU IPI */
> > +        int ret =3D kvm_ipi_enable(xive, lisn, server, errp);
> > +        if (ret < 0) {
> > +            return ret;
> > +        }
> > +    }
> > +
> >      kvm_src =3D priority << KVM_XIVE_SOURCE_PRIORITY_SHIFT &
> >          KVM_XIVE_SOURCE_PRIORITY_MASK;
> >      kvm_src |=3D server << KVM_XIVE_SOURCE_SERVER_SHIFT &
> > @@ -280,7 +343,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, =
int srcno, Error **errp)
> >      assert(xive->fd !=3D -1);
> > =20
> >      /*
> > -     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
> > +     * The vCPU IPIs are now allocated in kvmppc_xive_set_source_confi=
g()
> >       * and not with all sources in kvmppc_xive_source_reset()
> >       */
> >      assert(srcno >=3D SPAPR_XIRQ_BASE);
> > @@ -300,12 +363,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc=
, int srcno, Error **errp)
> >   * To be valid, a source must have been claimed by the machine (valid
> >   * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
> >   * have been enabled, which means the IPI has been allocated in
> > - * kvmppc_xive_cpu_connect().
> > + * kvmppc_xive_set_source_config().
> >   */
> >  static bool xive_source_is_valid(SpaprXive *xive, int i)
> >  {
> >      return xive_eas_is_valid(&xive->eat[i]) &&
> > -        (i >=3D SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
> > +        (!spapr_xive_is_ipi(i) || kvm_ipi_is_enabled(xive, i));
> >  }
> > =20
> >  static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
> > @@ -314,8 +377,8 @@ static int kvmppc_xive_source_reset(XiveSource *xsr=
c, Error **errp)
> >      int i;
> > =20
> >      /*
> > -     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
> > -     * connected in kvmppc_xive_cpu_connect()
> > +     * Skip the vCPU IPIs. These are created/reset on-demand in
> > +     * kvmppc_xive_set_source_config().
> >       */
> >      for (i =3D SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
> >          int ret;
> > @@ -724,7 +787,57 @@ int kvmppc_xive_post_load(SpaprXive *xive, int ver=
sion_id)
> >      }
> > =20
> >      /* Restore the EAT */
> > -    for (i =3D 0; i < xive->nr_irqs; i++) {
> > +
> > +    /* IPIs are restored from the appropriate vCPU context */
> > +    CPU_FOREACH(cs) {
> > +        /*
> > +         * The EAT has valid entries to accomodate all possible vCPUs,
> > +         * but we only want to allocate in KVM the IPIs that were
> > +         * actually allocated before migration. Let's consider the full
> > +         * list of IPIs to find an EAS that matches the vCPU id.
> > +         *
> > +         * If an IPI appears unmasked in the EAT, it is a proof that t=
he
> > +         * guest did successfully call H_INT_SET_SOURCE_CONFIG and we
> > +         * should thus create the IPI at the KVM level if the END index
> > +         * matches the vCPU id.
> > +         *
> > +         * If an IPI appears masked in the EAT, then we don't know exa=
ctly
> > +         * what happened before migration but we don't care. The IPI w=
ill
> > +         * be created when the guest eventually unmasks it with a subs=
equent
> > +         * call to H_INT_SET_SOURCE_CONFIG.
> > +         */
> > +        for (i =3D 0; i < SPAPR_XIRQ_BASE; i++) {
> > +            XiveEAS *eas =3D &xive->eat[i];
> > +            uint32_t end_idx;
> > +            uint32_t end_blk;
> > +            uint8_t priority;
> > +            uint32_t server;
> > +
> > +            if (!xive_eas_is_valid(eas)) {
> > +                continue;
> > +            }
> > +
> > +            if (xive_eas_is_masked(eas)) {
> > +                continue;
> > +            }
> > +
> > +            end_idx =3D xive_get_field64(EAS_END_INDEX, eas->w);
> > +            end_blk =3D xive_get_field64(EAS_END_BLOCK, eas->w);
> > +            spapr_xive_end_to_target(end_blk, end_idx, &server, &prior=
ity);
> > +            if (server !=3D kvm_arch_vcpu_id(cs)) {
> > +                continue;
> > +            }
> > +
> > +            ret =3D kvmppc_xive_set_source_config(xive, i, eas, &local=
_err);
> > +            if (ret < 0) {
> > +                goto fail;
> > +            }
> > +            break;
> > +        }
> > +    }
> > +
> > +    /* Now restore non-IPIs */
> > +    for (i =3D SPAPR_XIRQ_BASE; i < xive->nr_irqs; i++) {
> >          if (!xive_source_is_valid(xive, i)) {
> >              continue;
> >          }
> >=20
> >=20
>=20


