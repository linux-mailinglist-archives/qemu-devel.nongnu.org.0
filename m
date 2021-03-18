Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F28233FDCD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:27:29 +0100 (CET)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMjJo-0006Ll-Aa
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMjIg-0005Yj-2O
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:26:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:52955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMjId-0006oZ-Ar
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:26:17 -0400
IronPort-SDR: n9/MSP2Z7h26onbDNuLhbIPyjDdxLplYgbvrEoKSP5Cx0pyOWrJPFw88Hi9QvQFGtlzf1ZTBLP
 VIq9K0ARGVXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="186237903"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="186237903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:26:08 -0700
IronPort-SDR: Ol5fniZCnmhnY6aRbhMyH9dYD8og+nIAB1uk7RSXoFl/I1j6nmo2Hw+YNfL9R/MtQ2rKB5G/Ij
 XbBw/DBbYXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="374397737"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2021 20:26:08 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 20:26:07 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 11:26:05 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 11:26:05 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Thread-Topic: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Thread-Index: AQHWu0ExhVAh760nyEuorB9Pl/fGMKnKXocwgL6MiQCAAMZA4P//klqAgACRrtA=
Date: Thu, 18 Mar 2021 03:26:05 +0000
Message-ID: <7670f2bcb341449f9427be0fd7677daf@intel.com>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <2cee934e177e4a778b3bcc8d5085f4f0@intel.com>
 <20210317222358.31864ded@gecko.fritz.box>
 <ea3c4558ebad42c8b12210c9b1b552de@intel.com>
 <e50552b2-d9d5-97f0-5d5a-d162266b2084@redhat.com>
In-Reply-To: <e50552b2-d9d5-97f0-5d5a-d162266b2084@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Thursday, March 18, 2021 10:41 AM
> To: Zhang, Chen <chen.zhang@intel.com>; Lukas Straub
> <lukasstraub2@web.de>
> Cc: qemu-devel <qemu-devel@nongnu.org>; Li Zhijian
> <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
>=20
>=20
> =1B$B:_=1B(B 2021/3/18 =1B$B>e8a=1B(B9:22, Zhang, Chen =1B$B<LF;=1B(B:
> > Sorry for the delay. Current COLO tree just merged this series, I
> > originally wanted to merge other COLO related patches(Lei or me) and
> submit it together to Jason.
> >
> > Hi Jason, do you need me to send this series first or do you want to do=
 it
> together?
>=20
>=20
> We're in soft freeze, so if you can collect all the patches before hard f=
ree,
> that would be better.
>=20

OK, I will send this series first.

Thanks
Chen

> Thanks
>=20
>=20
> >
> > Thanks
> > Chen
> >
> >> -----Original Message-----
> >> From: Lukas Straub <lukasstraub2@web.de>
> >> Sent: Thursday, March 18, 2021 5:24 AM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: qemu-devel <qemu-devel@nongnu.org>; Li Zhijian
> >> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> >> Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp
> >> packet
> >>
> >> Hi,
> >> This hasn't been merged yet.
> >>
> >> Regards,
> >> Lukas Straub
> >>
> >> On Mon, 16 Nov 2020 07:32:22 +0000
> >> "Zhang, Chen" <chen.zhang@intel.com> wrote:
> >>
> >>> Queued this series to COLO tree.
> >>>
> >>> Thanks
> >>> Chen
> >>>
> >>>> -----Original Message-----
> >>>> From: Lukas Straub <lukasstraub2@web.de>
> >>>> Sent: Sunday, November 15, 2020 7:19 PM
> >>>> To: qemu-devel <qemu-devel@nongnu.org>
> >>>> Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
> >>>> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> >>>> Subject: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp
> >>>> packet
> >>>>
> >>>> Hello Everyone,
> >>>> This fixes a memory leak for non-tcp packets and optimizes the
> >>>> removal from the queue.
> >>>>
> >>>> Lukas Straub (2):
> >>>>    net/colo-compare.c: Fix memory leak for non-tcp packet
> >>>>    net/colo-compare.c: Optimize removal of secondary packet
> >>>>
> >>>>   net/colo-compare.c | 3 ++-
> >>>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> --
> >>>> 2.20.1
> >>
> >>
> >> --


