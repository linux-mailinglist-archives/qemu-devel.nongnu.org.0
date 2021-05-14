Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08F38066B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 11:42:36 +0200 (CEST)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhUL5-000195-Fg
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 05:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lhUK3-0000U6-Bl
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:41:31 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lhUJy-0006WL-Kr
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:41:31 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FhNkg3wyjzBvS1;
 Fri, 14 May 2021 17:38:35 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 17:41:17 +0800
Received: from localhost (10.52.120.239) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 14 May
 2021 10:41:14 +0100
Date: Fri, 14 May 2021 10:39:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
Message-ID: <20210514103928.000045a1@Huawei.com>
In-Reply-To: <9cfae992-da4a-4829-bf1c-ce1efb230504@www.fastmail.com>
References: <20210513124737.00002b2d@Huawei.com>
 <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
 <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
 <20210513140018.00004560@Huawei.com>
 <9cfae992-da4a-4829-bf1c-ce1efb230504@www.fastmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.120.239]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=jonathan.cameron@huawei.com; helo=szxga07-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, Chris
 Browy <cbrowy@avery-design.com>, Linuxarm <linuxarm@huawei.com>,
 Peter Xu <peterx@redhat.com>, Cameron Esfahani via <qemu-devel@nongnu.org>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 May 2021 11:35:57 +0930
"Andrew Jeffery" <andrew@aj.id.au> wrote:

> On Thu, 13 May 2021, at 22:30, Jonathan Cameron wrote:
> > On Thu, 13 May 2021 14:36:27 +0200
> > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> >  =20
> > > On 5/13/21 2:23 PM, Peter Maydell wrote: =20
> > > > On Thu, 13 May 2021 at 12:49, Jonathan Cameron
> > > > <Jonathan.Cameron@huawei.com> wrote:   =20
> > > >> My initial suggestion was to fix this by adding the relatively
> > > >> simple code needed in the driver to implement byte read / write,
> > > >> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
> > > >> says
> > > >> "
> > > >> .impl.min_access_size, .impl.max_access_size define the access siz=
es
> > > >>    (in bytes) supported by the *implementation*; other access size=
s will be
> > > >>    emulated using the ones available. For example a 4-byte write w=
ill be
> > > >>    emulated using four 1-byte writes, if .impl.max_access_size =3D=
 1.
> > > >> "
> > > >>
> > > >> This isn't true when we have the situation where
> > > >> .valid.min_access_size < .imp.min_access_size
> > > >>
> > > >> So change the docs or try to make this work?   =20
> > >=20
> > > See also this patch from Francisco:
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg636935.html
> > >=20
> > > And full unaligned access support from Andrew:
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg461247.html =20
>=20
> Much better to use lore.kernel.org:
>=20
> https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew@aj.id.au/
>=20
> because...
>=20
> >=20
> > Thanks - that's very similar to what I was carrying, but I think it
> > only covers the read case.  That's backed up by the comment:
> > /* XXX: Can't do this hack for writes */ =20
>=20
> It becomes easier to find Paolo's suggestion to fix that here:
>=20
> https://lore.kernel.org/qemu-devel/cd1aba90-176f-9ec6-3e2b-d1135156a96d@r=
edhat.com/
>=20
> Would love to see this resolved! Unfortunately I haven't had the=20
> bandwidth to fix it all up for ... a long time now.
>=20

There is a bigger issue with writes.  You have to do a RMW cycle
because we only want to update part of a larger region.

It would worry me that this might have unexpected side effects
in some device implementations. It also looks a bit fiddly to do given
we'll need to pass the read callbacks to the write functions.

So the read path is straight forwards, but write less so.

Jonathan


> Andrew


