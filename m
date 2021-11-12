Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411A44E0C8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:26:56 +0100 (CET)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlNDL-0008Nz-64
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlNBV-0006rg-W4
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:25:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:49352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlNBT-0005l7-A0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:25:01 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319269463"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="319269463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 19:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="602853045"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 11 Nov 2021 19:24:57 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 19:24:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 19:24:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 11 Nov 2021 19:24:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3+89Zri8I8mMcEfrbPp6NLIG0G95ej9kmGgWMwfFg6HUAbnmrm3mwN7nQu2oBcHr50Uo0ZUufIy6FS/3wkXK5AbtNp0IdV2yjmJBSrcv4Ln24T+2qdXbHKyDGsU/RKBbOtitmNUpZ7omiOm7lVn10ZnM54Qt7XkT6Tq5wyzl7NkL6ZNw90zdGAK0nP7oT90tviJafH8GFbavlCmbRS7EFCCD1lmBrPHOPCBZiw5iyzr26cgEAMhJMMax7roUIEhgEhJlHXQC3357t0vFvdjpEZIiWGgMzATl0A8hdoBOGLyZu58TA2NuW0Yzlol0abdJZ2Buzg/LDLBEQCCtWYQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVBtIaee4+PuhqisaM17rKQmaMwn2koIOIlEA4uxApc=;
 b=Athc0joV6G8lxCJChRmfbP8scw+U1CXCaJA6gyVT6JyiFTZxPd7WsA2Aima2njieIEdk9+wyonSDLSy+o3itSoD0S7dksA55FQAfyFIZGWLAVvkocvf3UP2puveQmPnSs3VaGqO2Md+Dhauw6KKX9fgKOQZTg5XUVIDFp7QwL1j/SJOWgp8PiIKZVCY+5SBzd/LuaCylqmWNm9LEtbi5iSC5XefihvToLR3wzAuxTqCDeUD4qOTNqdlVzAFjqBwe0WS+sApposexdTFu72qZpga9YyleRb7VKmdkTryDuaIRo0bKBEgvtXA6T7xN+p+gMF3sEpN8n4AQ8GJ/+QDcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVBtIaee4+PuhqisaM17rKQmaMwn2koIOIlEA4uxApc=;
 b=UQ2W0CbMXu0s4Xvx8ih62Mel1/xby4ttrKH7vC8bBMjnkPjYhN2v6xadCuLzNUiR0jxQhJd1kQ1q8DwlBE8TVbGgWPMzy8Abec3zpkrOBuehDxFrsZ1pryduU00UKDCmo66KEfGqzh29E577zXgW6utBwWdNunCcRbF0B+LIlAU=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Fri, 12 Nov
 2021 03:24:55 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 03:24:55 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Topic: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Index: AQHX1d14LCgu6/0Qh0SCPdXTBPAUvav8NfnPgAABTACAABNY8IAAAHQAgAAlQPuAAs04AA==
Date: Fri, 12 Nov 2021 03:24:55 +0000
Message-ID: <MWHPR11MB003163F078A2DDDED981AAFB9B959@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
 <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87v9104jlb.fsf@dusky.pond.sub.org>
 <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87czn82ys4.fsf@dusky.pond.sub.org>
In-Reply-To: <87czn82ys4.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55ce0268-8955-49bd-3c48-08d9a58bffae
x-ms-traffictypediagnostic: CO1PR11MB5010:
x-microsoft-antispam-prvs: <CO1PR11MB501035945744548771DD3D449B959@CO1PR11MB5010.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MgbolxhkJ4P3sU8H3mq1aKS0wHIXmyRhe0t11u4d6xnbcF7l0own9uRQ992Q20m2ekR87MEUAOcS4iDKxuz6E0eqcgndrhdLJuj/Qju33P9vrA/TRmFB0bq0yIsVbBwTjY3USHNl6uihDddnZ2dTy6tq2/nrGYrTCeNecOd0W3EWJ+k9OXE+okcAxDHMA7KIFAL00F3JP0CkPo90DANct5PylK0gCA2gMpxsOBCi/akGvTStl4zs307/kfvGOrBdExhqwwcN7rRlzwhMMZz4sXLZuXW+4D/w5b2F0RPeVih6P2m8/Q5z1CclM03v7R2JVVMY5CqNn3gplT0p+Xixayn3xav7HxCReTIDKgtwLReMX5lUZALMG67HBP+vgfXWt/BDUA/JvOnF9PFplIA5h5A97NtHMTjTjnhLCBxNWs8iwYZCxM8mDhSKaHOI/tC9j/BRhXEzmgzD5gMNnqNskKFn6DKShkGRVEaBHtYsYQE5TlVbjEfL+Jx0BVm3wg1rM6G9mWk3rsUO8f5TeYj8EELJYXuQCcwfh3jLSLwUTxfEGUwkUNr4m6PWRlTry58FG5TYvxqAtNifa/qqF15ICPaMC+JmxSrnZWNTUtrFgjaW2GO8Wc450hQH70HuQs6V9l6/ymhOs3I/gJrXd7iE4bKgLVwoXQTykPVA442xwlYZXPoVhC0GTHsykldJasCqdM4qy4ymiEKcNw6jMpZdFr7urA6SDDmwHxukZtJBJUkCab2VM4NgoDFIUhGDF1IZWXUzTtFIAMS0BJTdUkO9pEGeaNqbhsgnxen2HwCY2O4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(6506007)(83380400001)(86362001)(2906002)(64756008)(55016002)(508600001)(66446008)(7696005)(4326008)(52536014)(316002)(26005)(33656002)(186003)(5660300002)(66556008)(9686003)(82960400001)(66476007)(76116006)(66946007)(38100700002)(53546011)(122000001)(54906003)(966005)(38070700005)(71200400001)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jmogQTa6mJVI522m1zTkZPfL6CjBzPlXk+qq6zvA1rNjkEPhqu58Rgd585B8?=
 =?us-ascii?Q?JQ7naBa+jLHbgDalSleDMo6ZQkCMCFGw8p+SKQiEO9AnsbMQJsSdWXLpt/Sz?=
 =?us-ascii?Q?jy3zRA1FstV+KsWBK9cbLt0+L7IkYbx2VIqQYg0yblFtNd9feagq69F48hQ5?=
 =?us-ascii?Q?h3F3Lr24N6aj0RRIeoeWVzVCFsIJp5MRtlKhiGZm82PdvnJb1lhxCZBtQOm+?=
 =?us-ascii?Q?1rVWebW1I9/xpHfqMb782pDMU4FYBaRGxWTi0yc2D4bH3D0Ex37RknxFw/rw?=
 =?us-ascii?Q?2QsDo/p48EDtHoXGg6L3K2oj2LnYHtJa0d6EK05JrTfHMtNY15LyFAbst/DL?=
 =?us-ascii?Q?cvD4+F93sX+foVpbSKv8OXvfu4Ehig/zTCZvmSUwRv8e0UJgLqvHxsvM5W0u?=
 =?us-ascii?Q?CtDme8hedNmKc5Hs+LFcFvJ86dXZmeFSVtdo8U3t2y+esONdY8hliHKmwRJ7?=
 =?us-ascii?Q?jeVZG2FEJv+RHReyMTAQNcnvqcyiCBmFDhZCtLD1ERLQGsWXI6TI7+6aB4MM?=
 =?us-ascii?Q?tJIKXIH8xEQmpePty9yD8dA1nU+fsfmPlpbh6ZZFcVKbOnmNICLHT6QTmdpt?=
 =?us-ascii?Q?3AZYWObKp06dCy/hf1dX5+llFvFMhzhTAiVhixxQ2UADdWHGFVqHff6M7gQn?=
 =?us-ascii?Q?xImQG4v657+Ms76gOX9YjZjpGEeEGS+VIpIvt8jbQZ0HdLXAVW5Y4l2BUsDU?=
 =?us-ascii?Q?vJ2kPkS0/X+NMjmZ4nMzY5L7o9/37oWzy7ePMp6YSl53FbFvdVxxp9rYIgNx?=
 =?us-ascii?Q?vcwDOWfJTbsHHOgo8A/PX/XudLiZougwTPWQJzjmnrxWTptDlpPfMTxJB8mi?=
 =?us-ascii?Q?jLvTyXYb7sLwvt1iXBONGEiBoJzISXY1nHeOHkFRbLeyTRRy+qapmeRxNvQw?=
 =?us-ascii?Q?RiZ6sXWAYPMbu0kPeWL1MkI2G4jql8jBns5LUyXoE07vAwRyAY8FR0LmxKHA?=
 =?us-ascii?Q?GoYqJddg6RHg6WVy24BMG0HnyDeq7xxhQyaJIMyvav5EBEmGPurDQD6gHnPZ?=
 =?us-ascii?Q?DhRRSZlCdMBZFk9IF6q8zlC4h54ec8iNULyU/o/O8ELeB1J+MeBOaYjMl4KA?=
 =?us-ascii?Q?AlPvLXog1oqwRlDW4CHswZYfKBcGvA/pnxFFoagsk0agJjVF0PXBb7N6Y8qW?=
 =?us-ascii?Q?heEVQOpP8rBSu2iR4fzjMjhYOVtfMsUeNXJqjM6+qRuHKmhJWAZtjYR5xIGN?=
 =?us-ascii?Q?ZIVwvEltDfSkpFomDlgR6ovz2SP83g8GyJVIuEokKkr+U9h6h5GSMRSEQmYE?=
 =?us-ascii?Q?Y8qBVABS+jmo1wNEsHirDyvmIRnZeofotvrCuoZRqHDMS1iLOBOGT2tPRtvk?=
 =?us-ascii?Q?nhoWEoUCgp/C9B69I/OG8HBjH+rnl07AIL3LBXFiTgxTQTRRNes8ovXc9D1T?=
 =?us-ascii?Q?fklMnGZLdH0f+a6XH2Km36M9k9GEWbWw84DNsR01pDj/sZH2EK+XFysScgR8?=
 =?us-ascii?Q?z16Iw2Exfbl74KAyPMz09abpQHXBkb4eNWhB9OE23AurEkMNY2rnCEqvXqpR?=
 =?us-ascii?Q?pF40mtiyiY9pxfhLRVeeJHRwlPmGuhrN0k/VM4doXxhv9Z2bMqAzLjwhdBdn?=
 =?us-ascii?Q?xWf4BaUgo6fVYXJfb0Ez/hwjPtJpVPOYms0HjJjNijLkdJTCC5MKsUNT5X70?=
 =?us-ascii?Q?MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ce0268-8955-49bd-3c48-08d9a58bffae
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 03:24:55.7422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNazx/B/vxI9tV9JS4ib1auIg7Beilp7n3+YczosugLujkAdj3wMn4Ip4Cu36GV+01aNYORxf64n33klwCyWnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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
> Sent: Wednesday, November 10, 2021 4:36 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
>=20
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>=20
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Sent: Wednesday, November 10, 2021 2:21 PM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by
> >> default
> >>
> >> "Zhang, Chen" <chen.zhang@intel.com> writes:
> >>
> >> >> -----Original Message-----
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> >> Sent: Wednesday, November 10, 2021 1:07 PM
> >> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> >> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by
> >> >> default
> >> >>
> >> >> Zhang Chen <chen.zhang@intel.com> writes:
> >> >>
> >> >> > This patch make filters and colo-compare module support vnet_hdr
> >> >> > by default. And also support -device non-virtio-net(like e1000.).
> >> >> > But it can't avoid user manual configuration error between
> >> >> > different filters when enable/disable virtio-net-pci.
> >> >> >
> >> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> >> >>
> >> >> Have you considered backward compatibility?  Can it break usage
> >> >> that now works?
> >> >
> >> > Yes, this patch fully guarantees the compatibility as Jason's commen=
ts.
> >> > Original usage still works.
> >>
> >> Worth a brief explanation in the commit message?
> >
> > OK. Add following statement to commit message:
> > This patch make filters and colo-compare module support vnet_hdr by
> > default. And also support -device non-virtio-net(like e1000.). Because
> > when enabled the support will make the vnet_hdr_len field become
> > must-delivery part of filter transfer protocol(even 0 in use -device
> > e1000). It fully guarantees the compatibility for management layer like
> libvirt.
> > But it still can't avoid user manual configuration error between
> > different filters connected when enable/disable vnet_hdr_support.
> >
> > How about this explanation?
>=20
> I'm deferring to Jason, because I can't judge this for technical accuracy=
.
>=20
> > By the way, please let me know your comments on filter passthrough
> series:
> > https://mail.gnu.org/archive/html/qemu-devel/2021-08/msg01393.html
> > If OK, I will update it.
>=20
> Uh, I was under the impression that you'd respin with my comments
> addressed as per your reply to my review.
>=20
> It's too late for 6.2 now.  Suggest to respin, and adjust the "since:"
> tags to 7.0.


Already update the " [PATCH for 7.0 V10 0/6] Add passthrough support to obj=
ect with network processing function"
I think this version already addressed your comments, please review again.

Thanks
Chen




