Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0D666125
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFeS6-0004dA-Ae; Wed, 11 Jan 2023 11:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFeS1-0004cb-SN
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:59:45 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFeRy-0003i3-T8
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:59:45 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NsYkJ6gXwz67NQt;
 Thu, 12 Jan 2023 00:56:56 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 16:59:32 +0000
Date: Wed, 11 Jan 2023 16:59:31 +0000
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 "Ira Weiny" <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>
Subject: Re: [PATCH 6/8] qemu/bswap: Add const_le64()
Message-ID: <20230111165931.00001b0c@huawei.com>
In-Reply-To: <8cb2447b-a2e6-f137-5cb3-a5439a35bb7f@linaro.org>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
 <8cb2447b-a2e6-f137-5cb3-a5439a35bb7f@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 11 Jan 2023 17:40:46 +0100
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> On 11/1/23 15:24, Jonathan Cameron via wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> >=20
> > Gcc requires constant versions of cpu_to_le* calls.
> >=20
> > Add a 64 bit version.
> >=20
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >   include/qemu/bswap.h | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >=20
> > diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> > index 346d05f2aa..e1eca22f25 100644
> > --- a/include/qemu/bswap.h
> > +++ b/include/qemu/bswap.h
> > @@ -187,6 +187,15 @@ CPU_CONVERT(le, 64, uint64_t)
> >    * used to initialize static variables.
> >    */
> >   #if HOST_BIG_ENDIAN
> > +# define const_le64(_x)                          \
> > +    ((((_x) & 0x00000000000000ffU) << 56) |      \
> > +     (((_x) & 0x000000000000ff00U) << 40) |      \
> > +     (((_x) & 0x0000000000ff0000U) << 24) |      \
> > +     (((_x) & 0x00000000ff000000U) <<  8) |      \
> > +     (((_x) & 0x000000ff00000000U) >>  8) |      \
> > +     (((_x) & 0x0000ff0000000000U) >> 24) |      \
> > +     (((_x) & 0x00ff000000000000U) >> 40) |      \
> > +     (((_x) & 0xff00000000000000U) >> 56)) =20
>=20
> So looking back at=20
> https://lore.kernel.org/qemu-devel/20200917163106.49351-4-philmd@redhat.c=
om/
> this patch missed to update the function description:
>=20
>   /*
> - * Same as cpu_to_{be,le}{16,32} described below, except that gcc will
> + * Same as cpu_to_{be,le}{16,32,64} described below, except that gcc will
>    * figure the result is a compile-time constant if you pass in a consta=
nt.
>    * So this can be used to initialize static variables.
>    */

Good point.  The context is a little difference as your series had combined
several comments into one, but I've put in a similar update.

Obviously if your series lands first we can drop this one, but I'll carry
it forwards for now.

Thanks,

Jonathan

>=20
>=20


