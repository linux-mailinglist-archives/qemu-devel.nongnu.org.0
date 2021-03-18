Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57733FCA5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 02:23:31 +0100 (CET)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMhNp-0004px-Un
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 21:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMhMh-0003up-6v
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:22:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:2669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMhMe-0001jF-J2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:22:18 -0400
IronPort-SDR: +a2FzAL7jTpc7kv5+8XHLYQsOKJGQYEGTXFbAKMmr4c9cgSjkOwEDY2kYN4Ju/hpqkDnxyN+hj
 xx8XqWiahs1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="187213350"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="187213350"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 18:22:14 -0700
IronPort-SDR: D+pLUpDpFO/YACaqbSExA6SXfft3Etltv51M7KMBfaTO1WOiMOe8wX9h6aflCc/YYKBQkem2IW
 dw23AqUCd5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="523075555"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2021 18:22:14 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 18:22:13 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 09:22:11 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 09:22:11 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Thread-Topic: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Thread-Index: AQHWu0ExhVAh760nyEuorB9Pl/fGMKnKXocwgL6MiQCAAMZA4A==
Date: Thu, 18 Mar 2021 01:22:11 +0000
Message-ID: <ea3c4558ebad42c8b12210c9b1b552de@intel.com>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <2cee934e177e4a778b3bcc8d5085f4f0@intel.com>
 <20210317222358.31864ded@gecko.fritz.box>
In-Reply-To: <20210317222358.31864ded@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Sorry for the delay. Current COLO tree just merged this series,
I originally wanted to merge other COLO related patches(Lei or me) and subm=
it it together to Jason.

Hi Jason, do you need me to send this series first or do you want to do it =
together?

Thanks
Chen

> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Thursday, March 18, 2021 5:24 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: qemu-devel <qemu-devel@nongnu.org>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
>=20
> Hi,
> This hasn't been merged yet.
>=20
> Regards,
> Lukas Straub
>=20
> On Mon, 16 Nov 2020 07:32:22 +0000
> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>=20
> > Queued this series to COLO tree.
> >
> > Thanks
> > Chen
> >
> > > -----Original Message-----
> > > From: Lukas Straub <lukasstraub2@web.de>
> > > Sent: Sunday, November 15, 2020 7:19 PM
> > > To: qemu-devel <qemu-devel@nongnu.org>
> > > Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
> > > <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> > > Subject: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp
> > > packet
> > >
> > > Hello Everyone,
> > > This fixes a memory leak for non-tcp packets and optimizes the
> > > removal from the queue.
> > >
> > > Lukas Straub (2):
> > >   net/colo-compare.c: Fix memory leak for non-tcp packet
> > >   net/colo-compare.c: Optimize removal of secondary packet
> > >
> > >  net/colo-compare.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.20.1
>=20
>=20
>=20
> --


