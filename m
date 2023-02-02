Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527A687914
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW46-0004af-UG; Thu, 02 Feb 2023 04:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNW43-0004Zv-DI
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:39:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNW40-0005Zb-F8
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:39:31 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P6txq1Bwpz6J9ds;
 Thu,  2 Feb 2023 17:38:07 +0800 (CST)
Received: from localhost (10.81.211.68) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 09:39:12 +0000
Date: Thu, 2 Feb 2023 09:39:11 +0000
To: Richard Henderson <richard.henderson@linaro.org>
CC: =?ISO-8859-1?Q?J=F8rgen?= Hansen <Jorgen.Hansen@wdc.com>, Ajay Joshi
 <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>, Sid Manning
 <sidneym@quicinc.com>
Subject: Re: An issue with x86 tcg and MMIO
Message-ID: <20230202093911.000053cb@Huawei.com>
In-Reply-To: <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
 <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.81.211.68]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Feb 2023 11:50:50 -1000
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 2/1/23 05:24, J=F8rgen Hansen wrote:
> > Hello Richard,
> >=20
> > We are using x86 qemu to test some CXL stuff, and in that process we are
> > running into an issue with tcg. In qemu, CXL memory is mapped as an MMIO
> > region, so when using CXL memory as part of the system memory,
> > application code and data can be spread out across a combination of DRAM
> > and CXL memory (we are using the Linux tiered memory numa balancing,
> > that will migrate individual pages between DRAM and CXL memory based on
> > access patterns). When we are running memory intensive applications, we
> > hit the following assert in translator_access:
> >=20
> >                /* We cannot handle MMIO as second page. */
> >                assert(tb->page_addr[1] !=3D -1);
> >=20
> > introduced in your commit 50627f1b. This is using existing applications
> > and standard Linux. We discussed this with Alistair Francis and he
> > mentioned that it looks like a load across a page boundary is happening,
> > and it so happens that the first page is DRAM and second page MMIO. We
> > tried - as a workaround - to return NULL instead of the assert to
> > trigger the slow path processing, and that allows the system to make
> > forward progress, but we aren't familiar with tcg, and as such aren't
> > sure if that is a correct fix.
> >=20
> > So we'd like to get your input on this - and understand whether the
> > above usage isn't supported at all or if there are other possible
> > workarounds. =20
>=20
> Well, this may answer my question in
>=20
> https://lore.kernel.org/qemu-devel/1d6b1894-9c45-2d70-abde-9c10c1b3b93f@l=
inaro.org/
>=20
> as to how this could occur.
>=20
> Until relatively recently, TCG would refuse to execute out of MMIO *at al=
l*.  This was=20
> relaxed to support Arm m-profile, which needs to execute a few instructio=
ns out of MMIO=20
> during the boot process, before jumping into flash.
>=20
> This works by reading one instruction, translating it, executing it, and =
immediately=20
> discarding the translation.  It could be possible to adjust the translato=
r to allow the=20
> second half of an instruction to be in MMIO, such that we execute and dis=
card, however...
>=20
> What is it about CXL that requires modeling with MMIO?  If it is intended=
 to be used=20
> interchangeably with RAM by the guest, then you really won't like the per=
formance you will=20
> see with TCG executing out of these regions.

To be honest I wasn't aware of this restriction.

I 'thought' it was necessary to support interleaving as we need some callba=
cks
in the read / write paths to map through to the right address space.
So performance will suck even if we can model as memory (I'm not sure how t=
o do
whilst maintaining the interleaving code).

To have anything approaching accurate modeling we need to apply a memory de=
coders
in the host, host-bridge and switches.  We could have faked all this and ma=
pped directly
through to a single memory backend, but that would then have been useless f=
or actually
testing the interleaving.

Specifically what happens in cxl_cfmws_find_device()
https://elixir.bootlin.com/qemu/latest/source/hw/cxl/cxl-host.c#L129

If we can do that for other types of region then I'm fine with changing it.

>=20
> Could memory across the CXL link be modeled as a ROM device, similar to f=
lash?  This does=20
> not have the same restrictions as MMIO.

Not sure - if we can do the handling above then sure we could make that cha=
nge.
I can see there is a path to register the callbacks but I'd kind of assumed
ROM meant read only...

Jonathan

>=20
>=20
> r~
>=20


