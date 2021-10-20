Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01E4343A2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:54:21 +0200 (CEST)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md1kC-0005JJ-E3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1md1iy-0004cl-QE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:53:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:39397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1md1iv-0007Wt-4i
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:53:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="292140028"
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="292140028"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 19:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="532469635"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2021 19:52:55 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 19:52:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 19:52:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 19:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZR7z6EBcuFjOq845sNWGcjRKGPUPwAuX4HjjuU1VZwW5m0Tc6wotehQv/jVTZWJkQuKc+wXUB28Zq+8ybafZjBrAOTJe4bcl6Dqgm2uG+flCkpE0ZtPs9QceV4Ig2Z5VPt7osuMknO2uwAOkJ/v3E2QPILTxUKyM41rwssXtrFPHUEfBQqemnW2D21j+QCTFh8YdtMyqCXYQoALtyqgTXECUktNggBG63PPtLCT96igVZs/2nr8STuP50pkxgQgzfY6mnZVEf3mW09jENLEagoM41iYPEwQJFjJzBmJbHh69zItFNUKrqtp5gRhcWThsqZ5QW7DUbB5I8NRJhayRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa25VQfePSxyhbd6Dy4bctBdUcnp5xshpULV+9oeKBA=;
 b=SutWYdfTFJ+iuhO9QKKZbpLbEUZN5XJfM2Yb6YTJwVbAfJUWkxFM+NkbcEBnQjp74Caae3xBNz0MwUFh5QMWYF8jAdDf9YHdHD4yXPVoHP1UeDODJnrHaF4Ek6YRtAdxXSp6WCZUaAI63tACaJMC0EkuT9m0U882D6E2gKjlz9Kn9urLftjAUa9+agaeN4eExQ36lA9jzSKUiWipu7ZhcMsgSvmAH40lk6HtufVXVG2/4h+qNdIEW4DnoJwZNgFl/iKDbEksWin8HjzX6J4VNGX2PW4SYtKwaX9khEXHO4KsblPWUvIG8gWCYeAoXGFasy6BlWYONzKqYaW4pcAUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa25VQfePSxyhbd6Dy4bctBdUcnp5xshpULV+9oeKBA=;
 b=rwDzBMIwS2L+5Z1hk9PDaFc8b6s4KzWU3sTXwpoKATW6kZ0/h7Idi3++NXHw7TomNokZeg+06p+BTpC+os6eoU/uzRK90802JjAlDbzdv/pJ3b5CY198g06Ajy0sI+dQJukKxeoQC12Qe0lhXe1fJVFBokcY2kOPABCoDopV5dA=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1885.namprd11.prod.outlook.com (2603:10b6:300:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 02:52:53 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 02:52:53 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: RE: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Topic: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Index: AQHXrDLO3JQqRwvCjkWRAZN8QKPL1qvaIEuAgAE7vSA=
Date: Wed, 20 Oct 2021 02:52:52 +0000
Message-ID: <MWHPR11MB00316C47878D3EEA430424419BBE9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20210918020437.1822937-1-chen.zhang@intel.com>
 <3f1ead6c-4429-3edc-75cd-d48ecac317fc@redhat.com>
In-Reply-To: <3f1ead6c-4429-3edc-75cd-d48ecac317fc@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b890976-949c-495d-6d2a-08d99374b624
x-ms-traffictypediagnostic: MWHPR11MB1885:
x-microsoft-antispam-prvs: <MWHPR11MB1885C8BC64B09D42C92E74869BBE9@MWHPR11MB1885.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ww80KPG6sKp2GxHN9/LoyJAi9q5F5WuC04v/+ZnkOd1l+koMz2pjf+0DM5TISYZ0uzawM6kBv9t5zYitdrp870E9pjk8rrRokRMyYfK9/oDDg3FDpuURAitrIeN3ww+E3z4+A0AJaCci1pG6FFlKKUM73kre9PpOyB7ZmWpyGRAtASpWVA7KxBZcSlN3BUfYBh9DJPJDU7axCCKQGWMOlAxMcbPXZyc+n24IrTp9Sr0Gav4e1vHrPvkRqzYdSSImssfH41VZ10f0D4Ag8rbXnoQ80NoNBjyPKhwLtH5n9aWDH9GPuv4oiM4fcI/Q0TNhMWCgAheHIArbVA2QPpAOID9H5cJQUYzRyefAbXy3fVZpnFg7O7ZQMJ8hk0LmqpkX2f4/dchQgMkQL6+qVvme65/biYjiGDcl84oTHoSEy8uFcQLDtv/9vDVijeNPpPGhMV8ijhMAguZuWIKZIxXo6SpCE87/YXUc0ToogcWhPVny6MqgkRXBiwa29etlY5ZLFQfQwNQgssQ6pz6zirTgrWYHSA8e2e2Gl67Q10BBpWXWjqxe6YUPDtQYKergSmI/Xcat09cN/lX3SWf+jekH27YcuCXlDqCo5SqztUWQoQuSbGLjHAEtYakRo6U8eyNSEqMg6bPXWy6DrYzNqvamyJngLQtiYHz7SxyY5ouNI/2IKajjSBBQrst5ybYOCZyy9olRIGDrwgUjy26MCXZSTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(83380400001)(4326008)(7696005)(508600001)(71200400001)(55016002)(5660300002)(30864003)(66446008)(2906002)(76116006)(316002)(52536014)(122000001)(54906003)(9686003)(64756008)(38100700002)(66476007)(38070700005)(66946007)(110136005)(26005)(53546011)(86362001)(8936002)(82960400001)(186003)(8676002)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OGxmY05FbkFXTWhjSExhMHMxRFZZQzVPZSsrUXFTbmx6QlcxdHJ2K1o5?=
 =?iso-2022-jp?B?eUcrbURjRFVxOHlkcTIwalZpblpPVTVMRDd4dU9IeFZ4UHdiU2dTd3NP?=
 =?iso-2022-jp?B?Qk1vd3FNeGZYYjJ4N2hYYW56SVhDUmZTVXdQOUozekt1b2RCc0RnM0Jk?=
 =?iso-2022-jp?B?SHdsNEJwbUswRzNvRjZJUElPZktzWlJnKytIalBpN1lDbWZ4NVFGc3I5?=
 =?iso-2022-jp?B?UGdqMHFoci9wUzJhckJORW5GZW9kd2hhZ0ZyMS9jaFEwWlhaODFtUkRP?=
 =?iso-2022-jp?B?V0t5YzBEQitKRTRYdXNHcG1uVDZDOHNVbXRXcGtPVjdhY0NpL0xtbGRJ?=
 =?iso-2022-jp?B?QmhMMkN0QlNDdVBuRHRheEFjU0pER0JrUjZmcmc1eGZ4QnRYNE96QzBM?=
 =?iso-2022-jp?B?OXU2THUramlISG1QaW5vdTNpYzRmczM5ZXpXQ3g3akY4WGJEVm5saEVv?=
 =?iso-2022-jp?B?K0YwT0Y2SHBocVQxVUpJaTU5dnJMOVhDbnVXbGdNNWFXdDdtUXFXRURP?=
 =?iso-2022-jp?B?UlA2R3JKN2dGMVFSRFRWYlNQUThMUUFsQU1XL2w3Wi9MUVl5UGtiVFNw?=
 =?iso-2022-jp?B?Rk1DdDVrazVPQXo1dE03V2RQSThVeHBvdHBhQk1RSXJlcWszTjYrVVM5?=
 =?iso-2022-jp?B?cWtKZndMWUVNZkpIaTJYalM3cFpTQmdsUlNHK1R5RXJ2bDljcTJVV3hP?=
 =?iso-2022-jp?B?c0xFOStuODJxbldvNzV3Um1WTVdwUC9uZ2ROMlpMVHpxTnpaTTZ0UkpZ?=
 =?iso-2022-jp?B?c2xUQjZnZnZWbnF3ZG1ubWhQQUtRbFFuWGdZa1Z6cXU0UkRCSkpyNDA1?=
 =?iso-2022-jp?B?bjFEenR4UEJXcFRSdFpEdHo2TlNoWnNKY1ZvT2NWckUvNmtSZ05GTkRX?=
 =?iso-2022-jp?B?dUw2Zy8wcTA3Um5acUtHQlVkUEhJditnL1l1RG8wRXVCRzJHbUtpN092?=
 =?iso-2022-jp?B?bXVjNXlRVGhyNGtpRWpVUmEyM1ltOHNHcUZWQklQSHNSSGJkTGJZM2Uz?=
 =?iso-2022-jp?B?OWFTZmtoellnU0l4TmxFdmdEdk5seEpoMThSUGhhWTYxeWJUTDc5UjE2?=
 =?iso-2022-jp?B?UmFyOERNV2dZT2R1VEJKOHRMQzh0b21uK1psSDRvbWFlSy9pMUVGVXVi?=
 =?iso-2022-jp?B?VjVrLzVpZ2FOaGtrNjAreUYrUXMxK2VNQWVUQkFuR2lrV2pTYlJ3THNi?=
 =?iso-2022-jp?B?ZlYxZW1pUDl6Zms1NDRGdVh3eHJOM0RPblZYckUzM3ZJRUg5RGVacGMx?=
 =?iso-2022-jp?B?am1BamkrbDBYT3lxRmgydDh0NmNSWnlOTng5Rm9GY2tHMTVRUEJlajZn?=
 =?iso-2022-jp?B?Z1Q2ZTZUVkFITzVJR2xRL0s4SUhGenhPNTFwbVVnRzM0dk1KbldOSCtF?=
 =?iso-2022-jp?B?amc2aDhOK2dkeUNCTld5ZzJReW9sNG8vVlZ6bnpOZlJHMlk2L0pZZ2Fk?=
 =?iso-2022-jp?B?RktqZXF5NFpPZ3hDK3M1QS81Ym5XbDdsSWw5bHJqYjgxRkN3eXZuOXBX?=
 =?iso-2022-jp?B?dC9yMnlZZ2xIeEt1UGFJQlBCUWo4dkMyK2tOV0JXSFV4ekdjYkp5OHdt?=
 =?iso-2022-jp?B?VHhsb09YejBINVhieGtYbmt5M2F0WmhxQ1IvR2JQVFBDN2F5MTZoN2dY?=
 =?iso-2022-jp?B?a2hxRy9qdzBndUNOQzdKWWZIZFFycit6MWVUcTR3YXJEUWFXN1ZhUTlz?=
 =?iso-2022-jp?B?QnJaU0VxTHNKRnllVTRwUitydWp0M2g4TGhwdXZuMlJDbk10cXBOc2FD?=
 =?iso-2022-jp?B?MUUvMVYwS0VBZ08rK3czdlIwQTNacUdXZmxiVnNSaHJKdzJZc01tQXRk?=
 =?iso-2022-jp?B?ckk2M3hwZ1gxaUVaSlJnbmw0M0JRSU9PM1pwMlBmNjRWQitKUElKVktC?=
 =?iso-2022-jp?B?TGtJQmw1MURCMm5NT2pBT2RIaE9BPQ==?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b890976-949c-495d-6d2a-08d99374b624
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 02:52:53.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ybs6yYvYq3fu3XXJGQVn1o97YgglHWa6BzDPbLpCfqi6q426GOPD6WFGSv4nPjH6tKqRDeGfMdaE+b7IulYqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1885
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Tuesday, October 19, 2021 3:39 PM
> To: Zhang, Chen <chen.zhang@intel.com>; Eric Blake <eblake@redhat.com>;
> Markus Armbruster <armbru@redhat.com>
> Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Lukas Straub <lukasstraub2@web.de>; Tao Xu
> <tao3.xu@intel.com>
> Subject: Re: [PATCH V3] net/colo: check vnet_hdr_support flag when using
> virtio-net
>=20
>=20
> =1B$B:_=1B(B 2021/9/18 =1B$B>e8a=1B(B10:04, Zhang Chen =1B$B<LF;=1B(B:
> > When COLO use only one vnet_hdr_support parameter between COLO
> network
> > filter(filter-mirror, filter-redirector or filter-rewriter and
> > colo-compare, packet will not be parsed correctly. Acquire network
> > driver related to COLO, if it is nirtio-net,
>=20
>=20
> Typo.

Oh~ will fix in next version.

>=20
>=20
> >   check vnet_hdr_support flag of COLO network filter and colo-compare.
> >
> > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >
> > Changelog:
> > v3:
> >      Fix some typos.
> >      Rebased for Qemu 6.2.
> >
> > v2:
> >      Detect virtio-net driver and apply vnet_hdr_support
> >      automatically. (Jason)
> > ---
> >   net/colo-compare.c    | 57
> +++++++++++++++++++++++++++++++++++++++++++
> >   net/colo.c            | 20 +++++++++++++++
> >   net/colo.h            |  4 +++
> >   net/filter-mirror.c   | 21 ++++++++++++++++
> >   net/filter-rewriter.c | 10 ++++++++
> >   qapi/qom.json         |  6 +++++
> >   qemu-options.hx       |  6 +++--
> >   7 files changed, 122 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > b100e7b51f..870bd05a41 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -110,6 +110,7 @@ struct CompareState {
> >       char *sec_indev;
> >       char *outdev;
> >       char *notify_dev;
> > +    char *netdev;
> >       CharBackend chr_pri_in;
> >       CharBackend chr_sec_in;
> >       CharBackend chr_out;
> > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> >       return COMPARE_READ_LEN_MAX;
> >   }
> >
> > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *colo_obj_type, *netdev_from_filter;
> > +    char **netdev =3D (char **)opaque;
> > +
> > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > +
> > +    if (colo_obj_type &&
> > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > +        if (*netdev =3D=3D NULL) {
> > +            *netdev =3D g_strdup(netdev_from_filter);
> > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > +            warn_report("%s is using a different netdev from other COL=
O "
> > +                        "component", colo_obj_type);
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> >   /*
> >    * Called from the main thread on the primary for packets
> >    * arriving over the socket from the primary.
> > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
> >       s->vnet_hdr =3D value;
> >   }
> >
> > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    return g_strdup(s->netdev);
> > +}
> > +
> > +static void compare_set_netdev(Object *obj, const char *value, Error
> > +**errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    g_free(s->netdev);
> > +    s->netdev =3D g_strdup(value);
> > +}
> > +
> >   static char *compare_get_notify_dev(Object *obj, Error **errp)
> >   {
> >       CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> >           max_queue_size =3D MAX_QUEUE_SIZE;
> >       }
> >
> > +    if (!s->netdev) {
> > +        /* Set default netdev as the first colo netfilter found */
> > +        qemu_opts_foreach(qemu_find_opts("object"),
> > +                          colo_set_default_netdev, &s->netdev, NULL);
> > +    }
> > +
> >       if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> >           !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> >           return;
> > @@ -1289,6 +1333,16 @@ static void
> colo_compare_complete(UserCreatable *uc, Error **errp)
> >           return;
> >       }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, s->netdev, NULL)) {
> > +        /*
> > +         * colo compare needs 'vnet_hdr_support' when it works on virt=
io-net,
> > +         * add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >       net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_h=
dr);
> >       net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > s->vnet_hdr);
> >
> > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> >       s->vnet_hdr =3D false;
> >       object_property_add_bool(obj, "vnet_hdr_support",
> compare_get_vnet_hdr,
> >                                compare_set_vnet_hdr);
> > +    /* colo compare can't varify that netdev is correct */
> > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > +                            compare_set_netdev);
> >   }
> >
> >   void colo_compare_cleanup(void)
> > diff --git a/net/colo.c b/net/colo.c
> > index 3a3e6e89a0..4a03780f45 100644
> > --- a/net/colo.c
> > +++ b/net/colo.c
> > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > *connection_track_table,
> >
> >       return conn ? true : false;
> >   }
> > +
> > +/* check the network driver related to COLO, return 1 if it is
> > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *driver_type, *netdev_from_driver;
> > +    char *netdev_from_filter =3D (char *)opaque;
> > +
> > +    driver_type =3D qemu_opt_get(opts, "driver");
> > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > +
> > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> > +        return 0;
> > +    }
> > +
> > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
> > diff --git a/net/colo.h b/net/colo.h
> > index d91cd245c4..d401fc76b6 100644
> > --- a/net/colo.h
> > +++ b/net/colo.h
> > @@ -18,6 +18,9 @@
> >   #include "qemu/jhash.h"
> >   #include "qemu/timer.h"
> >   #include "net/eth.h"
> > +#include "qemu/option.h"
> > +#include "qemu/option_int.h"
> > +#include "qemu/config-file.h"
> >
> >   #define HASHTABLE_MAX_SIZE 16384
> >
> > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int
> vnet_hdr_len);
> >   Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
> >   void packet_destroy(void *opaque, void *user_data);
> >   void packet_destroy_partial(void *opaque, void *user_data);
> > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> >
> >   #endif /* NET_COLO_H */
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..69ca9c9839 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -12,6 +12,7 @@
> >   #include "qemu/osdep.h"
> >   #include "net/filter.h"
> >   #include "net/net.h"
> > +#include "net/colo.h"
> >   #include "qapi/error.h"
> >   #include "qom/object.h"
> >   #include "qemu/main-loop.h"
> > @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf=
,
> Error **errp)
> >           return;
> >       }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter mirror needs 'vnet_hdr_support' when colo filter mod=
ules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >       qemu_chr_fe_init(&s->chr_out, chr, errp);
> >   }
> >
> > @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState
> *nf, Error **errp)
> >           }
> >       }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter redirector needs 'vnet_hdr_support' when colo filter=
 modules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >       net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> >
> >       if (s->indev) {
> > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > cb3a96cde1..637ef4ce71 100644
> > --- a/net/filter-rewriter.c
> > +++ b/net/filter-rewriter.c
> > @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState *nf=
,
> Error **errp)
> >   {
> >       RewriterState *s =3D FILTER_REWRITER(nf);
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter rewriter needs 'vnet_hdr_support' when colo filter m=
odules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >       s->connection_track_table =3D
> g_hash_table_new_full(connection_key_hash,
> >                                                         connection_key_=
equal,
> >                                                         g_free, diff
> > --git a/qapi/qom.json b/qapi/qom.json index a25616bc7a..5760107160
> > 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -241,6 +241,11 @@
> >   # @notify_dev: name of the character device backend to be used to
> communicate
> >   #              with the remote colo-frame (only for Xen COLO)
> >   #
> > +# @netdev: id of the network device backend to colo-compare. Although
> > +#          colo-compare doesn't depend on network device directly, thi=
s
> > +#          parameter helps colo-compare know what network driver it is
> > +#          working on.(since 6.2)
>=20
>=20
> This looks kind of not elegant. We don't want to couple COLO with netdev.
>=20
> I wonder if we can do this without adding netdev.

Yes, current COLO is not bind to netdev, but here we want to auto fix confi=
guration issue.
To avoid wrong setting other non-colo related existing filter,  COLO need k=
now the colo-effect netdev to setup.
And this parameter is optional, this patch will setup default colo-effect n=
etdev in colo_set_default_netdev().
Or any good idea?

Thanks
Chen

>=20
> Thanks
>=20
>=20
> > +#
> >   # @compare_timeout: the maximum time to hold a packet from
> @primary_in for
> >   #                   comparison with an incoming packet on @secondary_=
in in
> >   #                   milliseconds (default: 3000)
> > @@ -264,6 +269,7 @@
> >               'outdev': 'str',
> >               'iothread': 'str',
> >               '*notify_dev': 'str',
> > +            '*netdev': 'str',
> >               '*compare_timeout': 'uint64',
> >               '*expired_scan_cycle': 'uint32',
> >               '*max_queue_size': 'uint32', diff --git
> > a/qemu-options.hx b/qemu-options.hx index 8f603cc7e6..250937fbbf
> > 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4964,12 +4964,14 @@ SRST
> >           stored. The file format is libpcap, so it can be analyzed wit=
h
> >           tools such as tcpdump or Wireshark.
> >
> > -    ``-object colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
chard
> evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeout=
=3D@
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> > +    ``-object
> > + colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][,n=
otify
> > +
> _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,
> m
> > + ax_queue_size=3D@var{size}]``
> >           Colo-compare gets packet from primary\_in chardevid and
> >           secondary\_in, then compare whether the payload of primary pa=
cket
> >           and secondary packet are the same. If same, it will output
> >           primary packet to out\_dev, else it will notify COLO-framewor=
k to do
> > -        checkpoint and send primary packet to out\_dev. In order to
> > +        checkpoint and send primary packet to out\_dev. Although colo-
> compare
> > +        does not depend on network device directly, netdevid helps
> > +        colo-compare know what network driver it is working on. In
> > + order to
> >           improve efficiency, we need to put the task of comparison in
> >           another iothread. If it has the vnet\_hdr\_support flag,
> >           colo compare will send/recv packet with vnet\_hdr\_len.


