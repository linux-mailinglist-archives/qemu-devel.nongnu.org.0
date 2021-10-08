Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B37426202
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:27:55 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYefy-0005TI-BA
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYef4-0004j6-TX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:26:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYef0-0002tW-PU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:26:58 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HQVqb4dRZz1DHQt;
 Fri,  8 Oct 2021 09:25:15 +0800 (CST)
Received: from dggpemm100011.china.huawei.com (7.185.36.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:26:45 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100011.china.huawei.com (7.185.36.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:26:45 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.008;
 Fri, 8 Oct 2021 09:26:45 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 7/9] vfio: add infrastructure to commit the deferred
 kvm routing
Thread-Topic: [PATCH v3 7/9] vfio: add infrastructure to commit the deferred
 kvm routing
Thread-Index: AQHXrnOMPSigY+pQpkiHLIe464yflKu+TmOAgAoVKTA=
Date: Fri, 8 Oct 2021 01:26:45 +0000
Message-ID: <8f33cf0934b04b1d9d95d8868509c4d2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-8-longpeng2@huawei.com>
 <20211001170435.36024305.alex.williamson@redhat.com>
In-Reply-To: <20211001170435.36024305.alex.williamson@redhat.com>
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
> Subject: Re: [PATCH v3 7/9] vfio: add infrastructure to commit the deferr=
ed kvm
> routing
>=20
> On Tue, 21 Sep 2021 07:02:00 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > 'defer_kvm_irq_routing' indicates whether we should defer to commit
> > the kvm routing.
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >  hw/vfio/pci.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
> >  hw/vfio/pci.h |  1 +
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 8e97ca93cf..8fe238b11d 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -423,12 +423,24 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *=
vdev,
> VFIOMSIVector *vector,
> >          return;
> >      }
> >
> > -    virq =3D kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pde=
v);
> > +    virq =3D kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n,
> &vdev->pdev);
> >      if (virq < 0) {
> >          event_notifier_cleanup(&vector->kvm_interrupt);
> >          return;
> >      }
> >
> > +    if (vdev->defer_kvm_irq_routing) {
> > +        /*
> > +         * Hold the allocated virq in vector->virq temporarily, will
> > +         * reset it to -1 when we fail to add the corresponding irqfd
> > +         * in vfio_commit_kvm_msi_virq().
>=20
> s/when/if/
>=20

OK, thanks.

> > +         */
> > +        vector->virq =3D virq;
>=20
> Do we need to make this unique to the deferred case or could we use
> vector->virq directly and fill it with -1 on all error paths like we do
> on a failure in vfio_commit_kvm_msi_virq()?
>=20

OK, I will use vector->irq directly, it looks neater.

>=20
> > +        return;
> > +    }
> > +
> > +    kvm_irqchip_commit_routes(kvm_state);
> > +
> >      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> &vector->kvm_interrupt,
> >                                         NULL, virq) < 0) {
> >          kvm_irqchip_release_virq(kvm_state, virq);
> > @@ -567,6 +579,35 @@ static void vfio_msix_vector_release(PCIDevice *pd=
ev,
> unsigned int nr)
> >      }
> >  }
> >
> > +/* TODO: invoked when enclabe msi/msix vectors */
>=20
> "enclabe"?  Is this meant to be "enable"?
>=20

Yes, it's a typo.

> > +static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDe=
vice
> *vdev)
>=20
> I'd move this function, if not this entire change, to patch 9 rather
> than adding these attributes for an unused function.  Thanks,
>=20

OK. I think I should merge this patch into patch 9 entirely if we decide to
move this function.

> Alex
>=20
> > +{
> > +    int i;
> > +    VFIOMSIVector *vector;
> > +
> > +    if (!vdev->defer_kvm_irq_routing || !vdev->nr_vectors) {
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
> > +    }
> > +}
> > +
> >  static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >  {
> >      PCIDevice *pdev =3D &vdev->pdev;
> > diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> > index 64777516d1..d3c5177d37 100644
> > --- a/hw/vfio/pci.h
> > +++ b/hw/vfio/pci.h
> > @@ -171,6 +171,7 @@ struct VFIOPCIDevice {
> >      bool no_kvm_ioeventfd;
> >      bool no_vfio_ioeventfd;
> >      bool enable_ramfb;
> > +    bool defer_kvm_irq_routing;
> >      VFIODisplay *dpy;
> >      Notifier irqchip_change_notifier;
> >  };


