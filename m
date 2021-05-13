Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042337F886
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:18:42 +0200 (CEST)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBEe-0008UC-Sh
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lhAyl-00008y-Fa
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:16 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lhAyi-0008Nh-4R
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:15 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Fgs2m1gKhz70gTr;
 Thu, 13 May 2021 20:50:40 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 15:02:02 +0200
Received: from localhost (10.52.125.147) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 13 May
 2021 14:02:01 +0100
Date: Thu, 13 May 2021 14:00:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
Message-ID: <20210513140018.00004560@Huawei.com>
In-Reply-To: <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
References: <20210513124737.00002b2d@Huawei.com>
 <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
 <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.125.147]
X-ClientProxiedBy: lhreml753-chm.china.huawei.com (10.201.108.203) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, David
 Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Chris Browy <cbrowy@avery-design.com>,
 Linuxarm <linuxarm@huawei.com>, Peter Xu <peterx@redhat.com>, QEMU
 Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 14:36:27 +0200
Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:

> On 5/13/21 2:23 PM, Peter Maydell wrote:
> > On Thu, 13 May 2021 at 12:49, Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote: =20
> >> My initial suggestion was to fix this by adding the relatively
> >> simple code needed in the driver to implement byte read / write,
> >> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
> >> says
> >> "
> >> .impl.min_access_size, .impl.max_access_size define the access sizes
> >>    (in bytes) supported by the *implementation*; other access sizes wi=
ll be
> >>    emulated using the ones available. For example a 4-byte write will =
be
> >>    emulated using four 1-byte writes, if .impl.max_access_size =3D 1.
> >> "
> >>
> >> This isn't true when we have the situation where
> >> .valid.min_access_size < .imp.min_access_size
> >>
> >> So change the docs or try to make this work? =20
>=20
> See also this patch from Francisco:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg636935.html
>=20
> And full unaligned access support from Andrew:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg461247.html

Thanks - that's very similar to what I was carrying, but I think it
only covers the read case.  That's backed up by the comment:
/* XXX: Can't do this hack for writes */

>=20
> > I don't (yet) have a view on what the in-principle right thing
> > should be, but in practice: how many devices do we have which
> > set .valid.min_access_size < .imp.min_access_size ? If we want
> > to change the semantics we'd need to look at those to see if they
> > need to be adjusted (or if they're just currently buggy and would
> > be fixed by the change).

I'm only aware of this one CXL emulated device (+ the proposed code in
the ADC in the above patch set).  For the CXL device, working around
this limitation is straight forward if that's the right option
+ updating the docs to slightly reduced chances of this being hit in
the future.

Thanks,

Jonathan

> >=20
> > thanks
> > -- PMM
> >  =20
>=20


