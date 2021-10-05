Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C6422781
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:13:13 +0200 (CEST)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkFr-0006rY-TT
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mXkDO-0005bM-Ml
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:10:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mXkDL-0005Ks-EU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:10:38 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HNyWY6sJ3zR5d4;
 Tue,  5 Oct 2021 21:06:01 +0800 (CST)
Received: from dggpemm100010.china.huawei.com (7.185.36.24) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 5 Oct 2021 21:10:24 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100010.china.huawei.com (7.185.36.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 5 Oct 2021 21:10:23 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.008;
 Tue, 5 Oct 2021 21:10:23 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 9/9] vfio: defer to commit kvm irq routing when enable
 msi/msix
Thread-Topic: [PATCH v3 9/9] vfio: defer to commit kvm irq routing when enable
 msi/msix
Thread-Index: AQHXrnONHiKCXIwRCUOphlOy9vZqwqu+TnUAgASlXOA=
Date: Tue, 5 Oct 2021 13:10:23 +0000
Message-ID: <db9632eb7ce3440c9cea55eacfdd7f42@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-10-longpeng2@huawei.com>
 <20211001170450.0a46c4a0.alex.williamson@redhat.com>
In-Reply-To: <20211001170450.0a46c4a0.alex.williamson@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: chenjiashang <chenjiashang@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Saturday, October 2, 2021 7:05 AM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: philmd@redhat.com; pbonzini@redhat.com; marcel.apfelbaum@gmail.com;
> mst@redhat.com; qemu-devel@nongnu.org; Gonglei (Arei)
> <arei.gonglei@huawei.com>; chenjiashang <chenjiashang@huawei.com>
> Subject: Re: [PATCH v3 9/9] vfio: defer to commit kvm irq routing when en=
able
> msi/msix
>=20
> On Tue, 21 Sep 2021 07:02:02 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > In migration resume phase, all unmasked msix vectors need to be
> > setup when load the VF state. However, the setup operation would
>=20
> s/load/loading/
>=20
> > take longer if the VM has more VFs and each VF has more unmasked
> > vectors.
> >
> > The hot spot is kvm_irqchip_commit_routes, it'll scan and update
> > all irqfds that already assigned each invocation, so more vectors
>=20
> s/that/that are/
>=20
> > means need more time to process them.
> >
> > vfio_pci_load_config
> >   vfio_msix_enable
> >     msix_set_vector_notifiers
> >       for (vector =3D 0; vector < dev->msix_entries_nr; vector++) {
> >         vfio_msix_vector_do_use
> >           vfio_add_kvm_msi_virq
> >             kvm_irqchip_commit_routes <-- expensive
> >       }
> >
> > We can reduce the cost by only commit once outside the loop. The
>=20
> s/commit/committing/
>=20

OK, will fix in the next version, thanks.

> > routes is cached in kvm_state, we commit them first and then bind
>=20
> s/is/are/
>=20

OK.

> > irqfd for each vector.
> >
> > The test VM has 128 vcpus and 8 VF (each one has 65 vectors),
> > we measure the cost of the vfio_msix_enable for each VF, and
> > we can see 90+% costs can be reduce.
> >
> > VF      Count of irqfds[*]  Original        With this patch
> >
> > 1st           65            8               2
> > 2nd           130           15              2
> > 3rd           195           22              2
> > 4th           260           24              3
> > 5th           325           36              2
> > 6th           390           44              3
> > 7th           455           51              3
> > 8th           520           58              4
> > Total                       258ms           21ms
> >
> > [*] Count of irqfds
> > How many irqfds that already assigned and need to process in this
> > round.
> >
> > The optimition can be applied to msi type too.
>=20
> s/optimition/optimization/
>=20

OK, thanks.

> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >  hw/vfio/pci.c | 36 ++++++++++++++++++++++++++++--------
> >  1 file changed, 28 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 2de1cc5425..b26129bddf 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -513,11 +513,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pde=
v,
> unsigned int nr,
> >       * increase them as needed.
> >       */
> >      if (vdev->nr_vectors < nr + 1) {
> > -        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX=
);
> >          vdev->nr_vectors =3D nr + 1;
> > -        ret =3D vfio_enable_vectors(vdev, true);
> > -        if (ret) {
> > -            error_report("vfio: failed to enable vectors, %d", ret);
> > +        if (!vdev->defer_kvm_irq_routing) {
> > +            vfio_disable_irqindex(&vdev->vbasedev,
> VFIO_PCI_MSIX_IRQ_INDEX);
> > +            ret =3D vfio_enable_vectors(vdev, true);
> > +            if (ret) {
> > +                error_report("vfio: failed to enable vectors, %d", ret=
);
> > +            }
> >          }
> >      } else {
> >          Error *err =3D NULL;
> > @@ -579,8 +581,7 @@ static void vfio_msix_vector_release(PCIDevice *pde=
v,
> unsigned int nr)
> >      }
> >  }
> >
> > -/* TODO: invoked when enclabe msi/msix vectors */
> > -static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDe=
vice
> *vdev)
> > +static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
> >  {
> >      int i;
> >      VFIOMSIVector *vector;
> > @@ -610,6 +611,9 @@ static __attribute__((unused)) void
> vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev
> >
> >  static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >  {
> > +    PCIDevice *pdev =3D &vdev->pdev;
> > +    int ret;
> > +
> >      vfio_disable_interrupts(vdev);
> >
> >      vdev->msi_vectors =3D g_new0(VFIOMSIVector, vdev->msix->entries);
> > @@ -632,11 +636,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >      vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> >      vfio_msix_vector_release(&vdev->pdev, 0);
> >
> > -    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> > -                                  vfio_msix_vector_release, NULL)) {
>=20
> A comment would be useful here, maybe something like:
>=20
>     /*
>      * Setting vector notifiers triggers synchronous vector-use
>      * callbacks for each active vector.  Deferring to commit the KVM
>      * routes once rather than per vector provides a substantial
>      * performance improvement.
>      */
>=20

Will add in the next version.

> > +    vdev->defer_kvm_irq_routing =3D true;
> > +
> > +    ret =3D msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_us=
e,
> > +                                    vfio_msix_vector_release, NULL);
> > +    if (ret < 0) {
> >          error_report("vfio: msix_set_vector_notifiers failed");
> > +    } else if (!pdev->msix_function_masked) {
> > +        vfio_commit_kvm_msi_virq(vdev);
> > +        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX=
);
>=20
> Couldn't we also optimize the do_use/release on vector 0 above to avoid
> this gratuitous disable here? We only want to make sure MSIX is always

The disable here seems can be removed directly, because we already disable
interrupts at the beginning of the vfio_msix_enable() ?

> enabled on the device when we exit this function, so maybe that code
> becomes an "else" branch below?
>=20

Do you mean something like:

if (ret < 0) {
    ....
} else if (!pdev->msix_function_masked) {
    ....
    ret =3D vfio_enable_vectors(vdev, true);
    ....
} else {
    /* do_use/release on vector 0 */
}

We'll get '-EINVAL' if invoke vfio_enable_vectors with vdev->nr_vectors=3D0=
,
this cannot happen before but it can now in this way. So maybe the "else if=
"
conditional expression should be convert to
"!pdev->msix_function_masked && vdev->nr_vectors" ?


> > +        ret =3D vfio_enable_vectors(vdev, true);
> > +        if (ret) {
> > +            error_report("vfio: failed to enable vectors, %d", ret);
> > +        }
> >      }
> >
> > +    vdev->defer_kvm_irq_routing =3D false;
> >      trace_vfio_msix_enable(vdev->vbasedev.name);
> >  }
> >
> > @@ -645,6 +660,7 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
> >      int ret, i;
> >
> >      vfio_disable_interrupts(vdev);
> > +    vdev->defer_kvm_irq_routing =3D true;
> >
> >      vdev->nr_vectors =3D msi_nr_vectors_allocated(&vdev->pdev);
> >  retry:
> > @@ -671,6 +687,8 @@ retry:
> >          vfio_add_kvm_msi_virq(vdev, vector, i, false);
> >      }
> >
> > +    vfio_commit_kvm_msi_virq(vdev);
> > +
> >      /* Set interrupt type prior to possible interrupts */
> >      vdev->interrupt =3D VFIO_INT_MSI;
> >
> > @@ -697,9 +715,11 @@ retry:
> >           */
> >          error_report("vfio: Error: Failed to enable MSI");
> >
> > +        vdev->defer_kvm_irq_routing =3D false;
> >          return;
> >      }
> >
> > +    vdev->defer_kvm_irq_routing =3D false;
>=20
> Why wouldn't we clear the flag in vfio_commit_kvm_msi_virq()?  It
> almost feels like there should be a vfio_prepare_kvm_msi_virq_batch()
> that enables the flag and an unconditional
> vfio_commit_kvm_msi_virq_batch() that clears the flag and decides if
> further work is necessary.  Thanks,
>=20
> Alex
>=20
> >      trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
> >  }
> >


