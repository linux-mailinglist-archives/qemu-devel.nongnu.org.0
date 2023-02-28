Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28FE6A5729
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxY3-0006LB-7c; Tue, 28 Feb 2023 05:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWxXx-0006Kc-Oe
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:49:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWxXu-0004Iv-Rj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:49:25 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PQvBG6Y5pz688J2;
 Tue, 28 Feb 2023 18:44:22 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 28 Feb
 2023 10:49:17 +0000
Date: Tue, 28 Feb 2023 10:49:16 +0000
To: =?ISO-8859-1?Q?J=F8rgen?= Hansen <Jorgen.Hansen@wdc.com>
CC: Gregory Price <gregory.price@memverge.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>
Subject: Re: [RFC] CXL: TCG/KVM instruction alignment issue discussion default
Message-ID: <20230228104916.00003d9a@Huawei.com>
In-Reply-To: <b066510e-8420-26ba-019b-fef2b255634e@wdc.com>
References: <Y/Cm5nuJl3G2CG2p@memverge.com>
 <b066510e-8420-26ba-019b-fef2b255634e@wdc.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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

On Mon, 27 Feb 2023 11:06:47 +0000
J=F8rgen Hansen <Jorgen.Hansen@wdc.com> wrote:

> On 2/18/23 11:22, Gregory Price wrote:
> > Breaking this off into a separate thread for archival sake.
> >=20
> > There's a bug with handling execution of instructions held in CXL
> > memory - specifically when an instruction crosses a page boundary.
> >=20
> > The result of this is that type-3 devices cannot use KVM at all at the
> > moment, and require the attached patch to run in TCG-only mode.
> >=20
> >=20
> > CXL memory devices are presently emulated as MMIO, and MMIO has no
> > coherency guarantees, so TCG doesn't cache the results of translating
> > an instruction, meaning execution is incredibly slow (orders of
> > magnitude slower than KVM).
> >=20
> >=20
> > Request for comments:
> >=20
> >=20
> > First there's the stability issue:
> >=20
> > 0) TCG cannot handle instructions across a page boundary spanning ram a=
nd
> >     MMIO. See attached patch for hotfix.  This basically solves the page
> >     boundary issue by reverting the entire block to MMIO-mode if the
> >     problem is detected.
> >=20
> > 1) KVM needs to be investigated.  It's likely the same/similar issue,
> >     but it's not confirmed. =20
>=20
> I ran into an issue with KVM as well. However, it wasn't a page boundary=
=20
> spanning issue, since I could hit it when using pure CXL backed memory=20
> for a given application. It turned out that (at least) certain AVX=20
> instructions didn't handle execution from MMIO when using qemu. This=20
> generated an illegal instruction exception for the application. At that=20
> point, I switched to tcg, so I didn't investigate if running a non-AVX=20
> system would work with KVM.

Short term I'm wondering if we should attempt to error out on KVM
unless some override parameter is used alongside the main cxl=3Don

>=20
> > Second there's the performance issue:
> >=20
> > 0) Do we actually care about performance? How likely are users to
> >     attempt to run software out of CXL memory?
> >=20
> > 1) If we do care, is there a potential for converting CXL away from the
> >     MMIO design?  The issue is coherency for shared memory. Emulating
> >     coherency is a) hard, and b) a ton of work for little gain.
> >=20
> >     Presently marking CXL memory as MMIO basically enforces coherency by
> >     preventing caching, though it's unclear how this is enforced
> >     by KVM (or if it is, i have to imagine it is).  =20
>=20
> Having the option of doing device specific processing of accesses to a=20
> CXL type 3 device (that the MMIO based access allows) is useful for=20
> experimentation with device functionality, so I would be sad to see that=
=20
> option go away. Emulating cache line access to a type 3 device would be=20
> interesting, and could potentially be implemented in a way that would=20
> allow caching of device memory in a shadow page in RAM, but that it a=20
> rather large project.

Absolutely agree.  Can sketch a solution that is entirely in QEMU and
works with KVM on a white board, but it doesn't feel like a small job
to actually implement it and I'm sure there are nasty corners
(persistency is going to be tricky)=20

If anyone sees this as a 'fun challenge' and wants to take it on though
that would be great!

Jonathan

>=20
> > It might be nice to solve this for non-shared memory regions, but
> > testing functionality >>> performance at this point so it might not
> > worth the investment. =20
>=20
> Thanks,
> Jorgen


