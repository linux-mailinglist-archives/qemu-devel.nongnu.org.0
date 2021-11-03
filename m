Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8E443D79
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 07:59:53 +0100 (CET)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miAFU-0002yo-AS
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 02:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1miAE7-0001jL-Lg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:58:27 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1miAE4-0004Mw-CE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:58:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkcxK313Kz1DJ6x;
 Wed,  3 Nov 2021 14:56:05 +0800 (CST)
Received: from dggpemm100008.china.huawei.com (7.185.36.125) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 14:58:07 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100008.china.huawei.com (7.185.36.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 14:58:07 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.015;
 Wed, 3 Nov 2021 14:58:07 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v4 6/6] vfio: defer to commit kvm irq routing when enable
 msi/msix
Thread-Topic: [PATCH v4 6/6] vfio: defer to commit kvm irq routing when enable
 msi/msix
Thread-Index: AQHXwJVVD8XLlFVa70m12/QixeY9hKvdc34AgBQIqkA=
Date: Wed, 3 Nov 2021 06:58:07 +0000
Message-ID: <d5235f149bf240d8bf2703d91825c7dc@huawei.com>
References: <20211014004852.1293-1-longpeng2@huawei.com>
 <20211014004852.1293-7-longpeng2@huawei.com>
 <20211021145114.3fc4436e.alex.williamson@redhat.com>
In-Reply-To: <20211021145114.3fc4436e.alex.williamson@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Friday, October 22, 2021 4:51 AM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: pbonzini@redhat.com; qemu-devel@nongnu.org; kvm@vger.kernel.org; Gong=
lei
> (Arei) <arei.gonglei@huawei.com>
> Subject: Re: [PATCH v4 6/6] vfio: defer to commit kvm irq routing when en=
able
> msi/msix
>=20
> On Thu, 14 Oct 2021 08:48:52 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > In migration resume phase, all unmasked msix vectors need to be
> > setup when loading the VF state. However, the setup operation would
> > take longer if the VM has more VFs and each VF has more unmasked
> > vectors.
> >
> > The hot spot is kvm_irqchip_commit_routes, it'll scan and update
> > all irqfds that are already assigned each invocation, so more
> > vectors means need more time to process them.
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
> > We can reduce the cost by only committing once outside the loop.
> > The routes are cached in kvm_state, we commit them first and then
> > bind irqfd for each vector.
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
> > The optimization can be applied to msi type too.
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >  hw/vfio/pci.c | 129
> ++++++++++++++++++++++++++++++++++++++++++++++------------
> >  hw/vfio/pci.h |   1 +
> >  2 files changed, 105 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 0bd832b..dca2d0c 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -413,8 +413,6 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev,=
 bool
> msix)
> >  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector
> *vector,
> >                                    int vector_n, bool msix)
> >  {
> > -    int virq;
> > -
> >      if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
> >          return;
> >      }
> > @@ -423,20 +421,31 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *=
vdev,
> VFIOMSIVector *vector,
> >          return;
> >      }
> >
> > -    virq =3D kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pde=
v);
> > -    if (virq < 0) {
> > +    vector->virq =3D kvm_irqchip_add_deferred_msi_route(kvm_state, vec=
tor_n,
> > +                                                      &vdev->pdev);
> > +    if (vector->virq < 0) {
> >          event_notifier_cleanup(&vector->kvm_interrupt);
> > +        vector->virq =3D -1;
>=20
> Nit, it seems like all negative values are equivalent here, I don't
> think we need to explicitly set virq to -1 given that it's already < 0.
>=20

OK.

> > +        return;
> > +    }
> > +
> > +    if (vdev->defer_kvm_irq_routing) {
> > +        /*
> > +         * The vector->virq will be reset to -1 if we fail to add the
> > +         * corresponding irqfd in vfio_commit_kvm_msi_virq_batch().
> > +         */
> >          return;
> >      }
> >
> > +    kvm_irqchip_commit_routes(kvm_state);
> > +
> >      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> &vector->kvm_interrupt,
> > -                                       NULL, virq) < 0) {
> > -        kvm_irqchip_release_virq(kvm_state, virq);
> > +                                           NULL, vector->virq) < 0) {
> > +        kvm_irqchip_release_virq(kvm_state, vector->virq);
> >          event_notifier_cleanup(&vector->kvm_interrupt);
> > +        vector->virq =3D -1;
> >          return;
> >      }
> > -
> > -    vector->virq =3D virq;
> >  }
> >
> >  static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
> > @@ -501,11 +510,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pde=
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
> > @@ -567,6 +578,46 @@ static void vfio_msix_vector_release(PCIDevice *pd=
ev,
> unsigned int nr)
> >      }
> >  }
> >
> > +static void vfio_prepare_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
> > +{
> > +    assert(!vdev->defer_kvm_irq_routing);
> > +    vdev->defer_kvm_irq_routing =3D true;
> > +}
> > +
> > +static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
> > +{
> > +    VFIOMSIVector *vector;
> > +    int i;
> > +
> > +    if (!vdev->defer_kvm_irq_routing) {
> > +        return;
> > +    }
> > +
> > +    vdev->defer_kvm_irq_routing =3D false;
> > +
> > +    if (!vdev->nr_vectors) {
> > +        return;
> > +    }
> > +
> > +    kvm_irqchip_commit_routes(kvm_state);
> > +
> > +    for (i =3D 0; i < vdev->nr_vectors; i++) {
> > +        vector =3D &vdev->msi_vectors[i];
> > +
> > +        if (!vector->use || vector->virq < 0) {
> > +            continue;
> > +        }
> > +
> > +        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> > +                                               &vector->kvm_interrupt,
> > +                                               NULL, vector->virq) < 0=
) {
> > +            kvm_irqchip_release_virq(kvm_state, vector->virq);
> > +            event_notifier_cleanup(&vector->kvm_interrupt);
> > +            vector->virq =3D -1;
> > +        }
>=20
> I started trying to get rid of this code that largely duplicates the
> error case of vfio_add_kvm_msi_virq() and questioned why we setup the
> notifier separate from connecting it to the irqfd.  If we setup the
> notifier and irqfd in the same function we can clean things up a bit
> more and confine the deferred state tests in the vector-use code.  I
> think we can also assert if we have an unmatched batch commit call and
> we probably don't need to test both that a vector is in use and has a
> virq, one should not be true without the other.
>=20
> Does this look like an improvement to you and would you like to roll it
> into this patch?  Thanks,
>=20

Sure, it looks neater! I've tested it for about two days in local and it
works well. I'll send them (v5) out later. Thanks.

> Alex
>=20
>  pci.c |   58 ++++++++++++++++++++++------------------------------------
>  1 file changed, 22 insertions(+), 36 deletions(-)
>=20
> commit 6fb9336e3fe9e3775b0a0e7aadaff781fb52c0e7
> Author: Alex Williamson <alex.williamson@redhat.com>
> Date:   Thu Oct 21 13:35:12 2021 -0600
>=20
>     cleanup
>=20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 1792c30049da..5b3a86dd5292 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -417,35 +417,33 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vd=
ev,
> VFIOMSIVector *vector,
>          return;
>      }
>=20
> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
> -        return;
> -    }
> -
>      vector->virq =3D kvm_irqchip_add_deferred_msi_route(kvm_state, vecto=
r_n,
>                                                        &vdev->pdev);
> +}
> +
> +static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector)
> +{
>      if (vector->virq < 0) {
> -        event_notifier_cleanup(&vector->kvm_interrupt);
> -        vector->virq =3D -1;
>          return;
>      }
>=20
> -    if (vdev->defer_kvm_irq_routing) {
> -        /*
> -         * The vector->virq will be reset to -1 if we fail to add the
> -         * corresponding irqfd in vfio_commit_kvm_msi_virq_batch().
> -         */
> -        return;
> +    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
> +        goto fail_notifier;
>      }
>=20
> -    kvm_irqchip_commit_routes(kvm_state);
> -
>      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> &vector->kvm_interrupt,
>                                             NULL, vector->virq) < 0) {
> -        kvm_irqchip_release_virq(kvm_state, vector->virq);
> -        event_notifier_cleanup(&vector->kvm_interrupt);
> -        vector->virq =3D -1;
> -        return;
> +        goto fail_kvm;
>      }
> +
> +    return;
> +
> +fail_kvm:
> +    event_notifier_cleanup(&vector->kvm_interrupt);
> +fail_notifier:
> +    kvm_irqchip_release_virq(kvm_state, vector->virq);
> +    vector->virq =3D -1;
> +    return;
>  }
>=20
>  static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
> @@ -501,6 +499,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev,
> unsigned int nr,
>      } else {
>          if (msg) {
>              vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> +            if (!vdev->defer_kvm_irq_routing) {
> +                kvm_irqchip_commit_routes(kvm_state);
> +                vfio_connect_kvm_msi_virq(vector);
> +            }
>          }
>      }
>=20
> @@ -586,13 +588,9 @@ static void vfio_prepare_kvm_msi_virq_batch(VFIOPCID=
evice
> *vdev)
>=20
>  static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
>  {
> -    VFIOMSIVector *vector;
>      int i;
>=20
> -    if (!vdev->defer_kvm_irq_routing) {
> -        return;
> -    }
> -
> +    assert(vdev->defer_kvm_irq_routing);
>      vdev->defer_kvm_irq_routing =3D false;
>=20
>      if (!vdev->nr_vectors) {
> @@ -602,19 +600,7 @@ static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDe=
vice
> *vdev)
>      kvm_irqchip_commit_routes(kvm_state);
>=20
>      for (i =3D 0; i < vdev->nr_vectors; i++) {
> -        vector =3D &vdev->msi_vectors[i];
> -
> -        if (!vector->use || vector->virq < 0) {
> -            continue;
> -        }
> -
> -        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> -                                               &vector->kvm_interrupt,
> -                                               NULL, vector->virq) < 0) =
{
> -            kvm_irqchip_release_virq(kvm_state, vector->virq);
> -            event_notifier_cleanup(&vector->kvm_interrupt);
> -            vector->virq =3D -1;
> -        }
> +        vfio_connect_kvm_msi_virq(&vdev->msi_vectors[i]);
>      }
>  }
>=20


