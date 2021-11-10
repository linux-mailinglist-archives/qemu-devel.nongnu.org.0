Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8744BAF6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:16:41 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkfyS-0008Om-U5
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkfxG-0007d6-ST
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:15:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkfxE-00020I-5U
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:15:26 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="318807293"
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="318807293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 21:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="503817458"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 09 Nov 2021 21:15:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 21:15:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 21:15:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 21:15:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP1tm8vME7X9KQ7gQbjYwNlseYV5JgOYNet4jSGk+oTstyAhZWSnNecCzhprEyUiLgNfbHUpny7Jvy/Iu63gDiCa3a7FbDCEv1JsYc8e9cBsKCBrZF0bj+5UNXt/HF7yMt2WFdfWZ057aKX/QLEqeIetKDQDDk3ihURbTdraxlo9HF892eoqMML+eeDt8q3KwV+ouyJ0q8PA372EIEcYgxQj0Sfllst43zUcx9WVB0tP6vLTRPlQRZQ6ilQoS4mpKqGDwyu+XKmfnU/8X/sDDlwHKEBiHFR0i7WCfSw1FuAeQGrD8qPUrDETz56QhFBn4FXKZFd7q5/bCcoPpWWqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YN+1LvqpKIlgOuHBtippjzAkXYw6rN07l05vpN+3T4=;
 b=XZGB4019umKeqX/jjG6Dd8OOTLPwfBWOfmETVv3KfZVVQTNTk7lQNIz28FsIwFz8zNqM6MAtWGOKhrG1I1jrT4lH4YqT8BYxjWMa6GePgM1CPqtRO7f2VNyo/boawm88iFB3pJCaDb0jAm832BYFS7fm1fpVB+YdDoD25MM4uAB/hZTir/yHW0BLfxkwd7dM2zrSn4coT7RqavuLG1uyE/fbeWfHIxFn+UgiWuDTfpzU3XuN/AC72E+SsvKiQo2u9H/B4wCniPPC6BMQk2Xam31v6I0pzuR3mv9p1YzrY0j5YCyJBwUdvAGJAlYmajbDNKYm8aaoF/3YHXgHq0cnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YN+1LvqpKIlgOuHBtippjzAkXYw6rN07l05vpN+3T4=;
 b=Xi3HJuHLHhFfajAI9P6/QVUIlGIqDNNV9e2/mHt0FPylXzSL5H9T/m1nnNaAiol6naZXRFq6R1WrfMOaUhExk1IPlXQjLsPIiFhhGnqPuGyr+pXkJNFoFOgV/xKTjnVwPWEgxvEqmADDcLnGe6h1NjogsgZw3znkqcABfzCOcp4=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1839.namprd11.prod.outlook.com (2603:10b6:300:10e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 05:15:15 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 05:15:14 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Topic: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Index: AQHX1d14LCgu6/0Qh0SCPdXTBPAUvav8NfnPgAABTAA=
Date: Wed, 10 Nov 2021 05:15:14 +0000
Message-ID: <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
In-Reply-To: <87czn88uqc.fsf@dusky.pond.sub.org>
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
x-ms-office365-filtering-correlation-id: b44fa37f-2b28-49da-b48d-08d9a409142d
x-ms-traffictypediagnostic: MWHPR11MB1839:
x-microsoft-antispam-prvs: <MWHPR11MB18397B108B1880AB68EE03F49B939@MWHPR11MB1839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aRgHwvtpJ1z0lw2LSbZzYaHhMccILpJCE5MAwfNMyzd5zaLau054me7bycpUG6Dvm27xfoKwM+ArA6I79IXD9oBPXMOu5J65Hr7hXJ3R3a2WOGwz7J8iXJRgw+QjEhyB69AWDqkTXIBmRZWvRiZA9olqUPrIyhOSL/46gCFxR3gFExQhbJRSfaUR3JR7h36syYYL2W3/+1HpAd2rKVKkmNdvii01+JsE6Z6BSLVDUNsn1Xg/h6dM328+Ld5mP9m93YdnpxTbMJW78ISPyM787E0g9dFMLKDxE85+8epuxvCdUT+aB6l7twnd5kn+DiAOc5PvOgvO6GfJpNWotPNngqbkJmNxfPlHjqclPXteXIOnWc2xTnCDBbwJo5b0CPpuIOUTKpnSLfdontPyyrAKFi0SjVqdWbu2bM3FG3jy35eZa/jgugKWVwwL15TolXI79oRGRqFNQdaPBSSBhAF+4+UAgciTmbR3BfQGh4KwMGDFol9IecfyD3bWe+E/bgR0cMTZwmAOr0NvuvpGX+sLn0KEs/fe1UcVC2sBaXH0lEW0wRPC4GIWinEKXjBFAAErYzOyQn8NtMyzN6cosAocSsZb8ric7RIjTfvxJq+bDspi646zQ/jnxayxOPgvTDMMD9mq2XOrRhBtADrPp+O2aXS4YNiePZ02X2YQw/mKgfwobo/Qrk1khOg5mzjMNz3tY/AGfsTmJgxay3gYfLVb6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(7696005)(52536014)(82960400001)(54906003)(4744005)(66556008)(83380400001)(66476007)(33656002)(122000001)(76116006)(2906002)(5660300002)(6916009)(64756008)(186003)(86362001)(38100700002)(316002)(9686003)(53546011)(8936002)(6506007)(4326008)(38070700005)(71200400001)(8676002)(55016002)(26005)(508600001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CiZhh9Wg0nG1UTmJ0SPMPz4tBVGJ7iwIkm4lk8lWfV4MNWL2Ys1HWw5cmuJk?=
 =?us-ascii?Q?0iFYTx/9jZZkSuxoHZ0SxdsLM0on8uJ7/+W3E6a+Rdy9PHqM5DEr7sqDOEmK?=
 =?us-ascii?Q?yS5OV84qfFLluROkM6v3uTKXsuD1fxYc5vI7rtU1BCo4jJ2HaVNbBQaxTkUX?=
 =?us-ascii?Q?ozt4oba42tJAMufrd1NOfWvCJIi5X4l62E3z6hUicKMLnOMRZ+BLLG9u0fFN?=
 =?us-ascii?Q?VOtfdsWgmp/BOtr69PYct2F942Uzk+yuNIHhLeMRzQYkXRefDr2VTkUvCSji?=
 =?us-ascii?Q?Z6Tq1AaKUgX1GwXk4VlHjB+80aashqRiJ4VfZcKmU8v+ME86NYxQLjBAAp16?=
 =?us-ascii?Q?2jqi4bVTgp2tb0HmhRTgZ0VYl5Vc17WHgJqUVi+f8HeC3M1GhMt9CDBZkPfm?=
 =?us-ascii?Q?N4H4+esJrKvmvSvAcgCiJsSoCp/Wp58TCZu5C9KH60YqQU3cnMTu3DV/OF6t?=
 =?us-ascii?Q?5U34IChcYdnVkuDTvUEbYWrFtN56GD4E/PVgNyaKZpaxdGBI9HMj1NDabtni?=
 =?us-ascii?Q?uzwWiVynws8XbY7vpZtX7mK7ETtH69RYbLkcly0mQAbIQpNyQc9poQq4k16c?=
 =?us-ascii?Q?QynJ93SrSx7Yz555g2a6edcfDu2auofHw09RpX4htuPnUpbANrBDYLbi33dK?=
 =?us-ascii?Q?hyDIvUY5Vonj/QH8+1JMycRIXh6ubW1M4Fd5JzYyPZKAcXcmHaFQa0uMeeM3?=
 =?us-ascii?Q?kjeuncYFLv1mNaaTcuPqmWYC7YNE3ww96TJ8DOeTcvAUmCRi8UmUS8xA+Eu9?=
 =?us-ascii?Q?NIgqcN3JEHvFod0Q341X01V5vyU+J2PGcDly80ow2YLedCIzh9pRfFIxon4u?=
 =?us-ascii?Q?Yj0hlmAvdWPn8nadtKaDT1a/JjtOmrG1fZNFnqOupC0IAB9leVuO6IkbsRbg?=
 =?us-ascii?Q?jO4sSMUY0YjALfFqhewXYrpTb3ZQlR51p9kphOR87nlTp5PUQyZBBhlEtcbC?=
 =?us-ascii?Q?Nu0KyCEWhvcAxdomWmmpCtqq38RJJYyTncgvY1cn7LqbFFXJFRedeSMt4zup?=
 =?us-ascii?Q?LzdpPshnoLFZEI7unXOV6Nmc4jvVYHQ+mQPdinX7zDPmviIkd2SL63Y1yLh4?=
 =?us-ascii?Q?qKBBp/0ueg6hESTJ7F7Qq+j2iiRfjroQgFBNdhJ826/cvTiVoM0knBmo3/DN?=
 =?us-ascii?Q?1rPpD6o1EE1vXqnHDoSM1KCgFWW8224GOSXgOWpDGJGtl9ObFnwpe9gGbly7?=
 =?us-ascii?Q?gF8qiwRZkhCXc6r1P6qH8QtRoZGUVswcSx84v+d/BdveqaBvk1B2fj8WvYgj?=
 =?us-ascii?Q?WvyEM7UQxvUImxuAWJSuyi8mNbzo59cSxaisryknUZETb30A2AbKbCuOuzxq?=
 =?us-ascii?Q?pcDq2bf3bEiWHTBlzISx5UsC2+D57+ypjADLcAiRVK7YvQcgII8fn3sKPdKu?=
 =?us-ascii?Q?MuX1WdtfQa7kc6/qvLuAqwHL52W4AN8x+pcl2r0kl6yEPdAp97iI7nu8aaX7?=
 =?us-ascii?Q?5eJu/KKMYKKqPhCzoDRtdJ7ngSoXajPMEMl2gYIfEVr28H7lprS8CafwnfPe?=
 =?us-ascii?Q?ujSxRZWU0atVYJI1btEmUPCWDBxwt6egStXuCNDLL4M6RBrdmzu4zZc3MNHY?=
 =?us-ascii?Q?6426KrDf3h0Zqtzf0MdJZ0+intkgjD6iuaCTLhUuejJsupw2kiWux5BjPYlX?=
 =?us-ascii?Q?Thkr0iw8SJ+dCJ3hY2gw1g0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44fa37f-2b28-49da-b48d-08d9a409142d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 05:15:14.8557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPaBzw/YbBeB/obMxnwgPKpLFYWIPjGsgtCFj6Cqgangz3h8NwA3xN27UAf3Ch0CtDfifLLYoMSQXV2jVKCgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1839
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, Li
 Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Wednesday, November 10, 2021 1:07 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > This patch make filters and colo-compare module support vnet_hdr by
> > default. And also support -device non-virtio-net(like e1000.).
> > But it can't avoid user manual configuration error between different
> > filters when enable/disable virtio-net-pci.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>=20
> Have you considered backward compatibility?  Can it break usage that now
> works?

Yes, this patch fully guarantees the compatibility as Jason's comments.
Original usage still works.

Thanks
Chen=20


