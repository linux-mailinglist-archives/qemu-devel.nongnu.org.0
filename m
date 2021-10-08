Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3F426189
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:04:15 +0200 (CEST)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYeJ4-0003Pg-Ab
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYeHj-0002fj-B4
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:02:51 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYeHg-0004jR-7W
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:02:51 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQVD94hL6zbcxN;
 Fri,  8 Oct 2021 08:58:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:02:22 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:02:22 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.008;
 Fri, 8 Oct 2021 09:02:22 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 4/9] msix: simplify the conditional in
 msix_set/unset_vector_notifiers
Thread-Topic: [PATCH v3 4/9] msix: simplify the conditional in
 msix_set/unset_vector_notifiers
Thread-Index: AQHXrnOLaq78VwPZS0aFoB9Zocngjqu+Tj+AgAoVApA=
Date: Fri, 8 Oct 2021 01:02:22 +0000
Message-ID: <6fd74c74cc50462da1dd68e19cef3989@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-5-longpeng2@huawei.com>
 <20211001170405.085fa9e1.alex.williamson@redhat.com>
In-Reply-To: <20211001170405.085fa9e1.alex.williamson@redhat.com>
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
> Sent: Saturday, October 2, 2021 7:04 AM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: philmd@redhat.com; pbonzini@redhat.com; marcel.apfelbaum@gmail.com;
> mst@redhat.com; qemu-devel@nongnu.org; Gonglei (Arei)
> <arei.gonglei@huawei.com>; chenjiashang <chenjiashang@huawei.com>
> Subject: Re: [PATCH v3 4/9] msix: simplify the conditional in
> msix_set/unset_vector_notifiers
>=20
> On Tue, 21 Sep 2021 07:01:57 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > 'msix_function_masked' is synchronized with the device's config,
> > we can use it to replace the complex conditional statementis in
> > msix_set/unset_vector_notifiers.
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >  hw/pci/msix.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> > index ae9331cd0b..67682289af 100644
> > --- a/hw/pci/msix.c
> > +++ b/hw/pci/msix.c
> > @@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
> >      dev->msix_vector_release_notifier =3D release_notifier;
> >      dev->msix_vector_poll_notifier =3D poll_notifier;
> >
> > -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> > -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) =3D=3D MSIX_ENABLE_MAS=
K) {
> > +    if (!dev->msix_function_masked) {
> >          for (vector =3D 0; vector < dev->msix_entries_nr; vector++) {
> >              ret =3D msix_set_notifier_for_vector(dev, vector);
> >              if (ret < 0) {
> > @@ -622,8 +621,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
> >      assert(dev->msix_vector_use_notifier &&
> >             dev->msix_vector_release_notifier);
> >
> > -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> > -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) =3D=3D MSIX_ENABLE_MAS=
K) {
> > +    if (!dev->msix_function_masked) {
> >          for (vector =3D 0; vector < dev->msix_entries_nr; vector++) {
> >              msix_unset_notifier_for_vector(dev, vector);
> >          }
>=20
> This appears to be a cleanup that's not required for the functionality
> of this series.  I'd suggest proposing it separately.  Same for the
> patch 5/9 in this series.  If it makes a functional difference it
> should be described in the commit log.  Thanks,
>=20

OK, will remove these two patches in the v4, thanks.

> Alex


