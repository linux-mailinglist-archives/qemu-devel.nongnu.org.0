Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D556955BAA0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:01:48 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5qFG-0005k7-Od
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o5qDA-0004vl-LF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:59:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o5qD8-0006oy-24
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:59:36 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LWrRR429cz6H7nW;
 Mon, 27 Jun 2022 22:57:07 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 27 Jun 2022 16:59:21 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 27 Jun
 2022 15:59:20 +0100
Date: Mon, 27 Jun 2022 15:59:19 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Ben Widawsky
 <ben.widawsky@intel.com>
Subject: Re: [PULL v2 28/86] hw/cxl/component: Add utils for interleave
 parameter encoding/decoding
Message-ID: <20220627155919.0000477a@Huawei.com>
In-Reply-To: <CAFEAcA-Zoi+7barPqmfuOc1OQoEpSSPmyB6wyiAmuCrM0WrNeA@mail.gmail.com>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-29-mst@redhat.com>
 <CAFEAcA-Zoi+7barPqmfuOc1OQoEpSSPmyB6wyiAmuCrM0WrNeA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 27 Jun 2022 14:29:19 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 16 May 2022 at 21:51, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> >
> > Both registers and the CFMWS entries in CDAT use simple encodings
> > for the number of interleave ways and the interleave granularity.
> > Introduce simple conversion functions to/from the unencoded
> > number / size.  So far the iw decode has not been needed so is
> > it not implemented.
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > Message-Id: <20220429144110.25167-27-Jonathan.Cameron@huawei.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/hw/cxl/cxl_component.h |  8 ++++++++
> >  hw/cxl/cxl-component-utils.c   | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_compon=
ent.h
> > index 7d8f395cbe..4f69688c47 100644
> > --- a/include/hw/cxl/cxl_component.h
> > +++ b/include/hw/cxl/cxl_component.h
> > @@ -210,4 +210,12 @@ static inline int cxl_decoder_count_enc(int count)
> >      return 0;
> >  }
> >
> > +uint8_t cxl_interleave_ways_enc(int iw, Error **errp);
> > +uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
> > +
> > +static inline hwaddr cxl_decode_ig(int ig)
> > +{
> > +    return 1 << (ig + 8);
> > +} =20
>=20
> Hi; Coverity warns about this (CID 1488868) because the shift
> is calculated with 32-bit arithmetic but the function returns
> a 64-bit result. I assume that 'ig' is supposed to never be
> large enough that the result is >4GB, but we can make Coverity
> happy by using "1ULL" here.
>=20
You are correct on range never hitting that.

Will send a fix in next few days.

Jonathan

> thanks
> -- PMM


