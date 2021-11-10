Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56644BBD6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:54:37 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkhVD-0005bW-RI
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkhTz-0004Zx-F5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:53:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:21070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkhTu-0002H7-N1
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:53:18 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293445732"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="293445732"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 22:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="452189695"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2021 22:53:11 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 22:53:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 22:53:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 22:53:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQh5a/hb3ZPpoHMZHB/bid7Y6xbEtOsZdn02lPo0TMtzklEzu+vuz9gOgjrEih3sT2esMKQXYtLTtOQGT+4Sqm7kuhVMeLtTsVaK0ZBeSi6Q8JFr7E8QC1f62DLURRkAxQViS5W9H9CzEbBw+Dc7ZjP6qsHsatUxM0YYlZ+pufPwMiClmare3447GxrZEnUrbzkl7O2Pd1vEPf3eN/Tql8BEuTbVGI+CcUhkV5nNIjhOJeynq6fy1lTLs4TCqmuYVFFmm3dh9vTdu0o1/wOhxEqkG8vPBcHAqo9z4UfQDg12veCPCG0gkMgSoIYs1Y/+aRvphGRtnlOaNFMjyhNhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMOTweJfh9PPdkyEnAQ1f1hj9kFnyTZ/kGovRz8EiZs=;
 b=SPYFRiFdZ7+hfpnFxU1r+CWsNSSB4JmQHLJvJHa9ZwyDliot+xO1hrDBKcsJWcsQJz+fKWBqfPXhQcb8C0d18XY3UIfv3e3IlwY9Q7rIwpb3KS7nSa/kUAu614bGHMHQKEN/sW1nyM5suJvCqeHHdNybe1GmPqP2l1YEGyMgkEcfXwaoLm0gx9Du6xJRJvvtJql2mlXPU91FDa/TcrcPt5C24BXvAzMjEMrw24MTxAHVs58M1u93SnhUJhBrH3AJpx3gwgAO2iZKXGsyEitwibxPBl/AyJFeRuzUsKuqe9WLu+w2HB/Hi9rdoGbID6cUGy5Q0+mJ0YdwgyFLL/FXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMOTweJfh9PPdkyEnAQ1f1hj9kFnyTZ/kGovRz8EiZs=;
 b=e59xMHWu65drTmkvEsDd9EIOqVo+pri67SOK9A0n7dklcUWAzNZ+NPTIq2/2ks8cA28v//l3dL0AjUX2B/0baSrJXPG2pFQ6JXOOesvaZp/V6/qgdAJxqIeT3YNfYbeAMeiT3h5TEr6/OuFg/eHF5cwGg9RbZgVMgIKG3hpnCdc=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 06:53:03 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 06:53:03 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Topic: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Index: AQHX1d14LCgu6/0Qh0SCPdXTBPAUvav8NfnPgAABTACAABNY8IAAAHQA
Date: Wed, 10 Nov 2021 06:53:03 +0000
Message-ID: <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
 <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87v9104jlb.fsf@dusky.pond.sub.org>
In-Reply-To: <87v9104jlb.fsf@dusky.pond.sub.org>
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
x-ms-office365-filtering-correlation-id: 1eec0003-0710-4af5-23a6-08d9a416bdeb
x-ms-traffictypediagnostic: MW4PR11MB5872:
x-microsoft-antispam-prvs: <MW4PR11MB5872E7A80519B5E6E8F4C44D9B939@MW4PR11MB5872.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cheNTfHA111sX0fzzKlWvg0mG3PT1ppzAVWDhcKEfJ052rN0fb7lNEhaHvRUM0nS1uwrvxQjwyIELGLxWgV1q0esnLImit8VIGRNZutQ6J9jXnFyadVdE5tkYdCGe1Qkz+wH4WA4hbF3BgIahKkwXMtjvWERFg0CKBM+UZJJeIOMVaY8UnIiUANtbUBVumnJw6v+HOi/da5kpjWZlmmGkfQyj7kgMM1oqQ5aDlr7KuHU+pid5cUPAC35kJJtAaR+mMvv+pkAewX9FqiJDPEgi8yC7HYGS3gnEbzAEw9u90ln3LGRsHggGln7DuUDy5VnyGK//y5+KlE9I0C4dTIQAAPBHYXng124Z+3CWRW5kVtw+FqSBoDQ918dv4gplPv2WDXNZUJ6fxWE3B84hqJzfTjobN71YieUzrslfFE5eh/FZDWLa3bQiV/NRZFiVUf0enTsqddOL/tCevvO/ytxkvm03dGg9rgQPSirTgypUQrPn07PoiahraIdQGj1qfW7f3obx9+DG3lkGDmZolT+dqu0or3MEaEl9ziCNbTU3El+POlQfVwnGelCNXRvldL9AdKYbNIuBvrg60wm+gqd81K7cmq9cyELi8WAWMxFURSS9qaZzKxnDQ1ZcC0L+UdvCCVKNKtaStPxKB+ftNifSc1WWqzVrSyixS4p67Q1SiY6PApZJSYxqbRdHPKM2+IRUqO14QptXuFvkXbeAYirCbxhn1xZ1zSVC7LMAF0EP8nMdzBOMuNyXAHSrx0y5Oy2POrfADuv6nSzJ8vR+kC5+npGCQwUSYQixo7nyYUuufg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(8676002)(508600001)(71200400001)(966005)(8936002)(4326008)(33656002)(26005)(186003)(66476007)(6916009)(66446008)(76116006)(66946007)(9686003)(64756008)(66556008)(53546011)(316002)(52536014)(6506007)(7696005)(86362001)(2906002)(55016002)(38100700002)(83380400001)(82960400001)(54906003)(122000001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?62M/9TpAS6pfv50SfX+Vhi7nMx4sw9+PeRSYChDr8sRwnI9sMClXAr3fkkGe?=
 =?us-ascii?Q?GOQB4mV0ycN4HR03SU3uhZRpXW6UbROvXyIdlPNRWH5UZZXo4GKDGSFNl3lO?=
 =?us-ascii?Q?Ap0dxOgC0QLqHI3b3KhZTwgNIbKLU130k0PL3h65s7ee/Cioy/Q5hmcFCpmH?=
 =?us-ascii?Q?Nt67Qpts6FnFL0Jv+IAJEODs0PS+kl1xOil+eZNjAfFrI5FQKn0P4D8y0JYC?=
 =?us-ascii?Q?ewndmoIYdzoksxvN3S9Wu6FD6TGVXRpfysCVvfEDgDNKOcOEs4IaRfxc1QfL?=
 =?us-ascii?Q?5F5rA3fzi6fpuZ1Mbjt6GaquTWYpJmkFCO642ciCoEm8o+1PHMO80IMFAR89?=
 =?us-ascii?Q?CFoyxHe2yjqVuZWSSILK6MR6f1CSgOmNm1Ot71bQbGeLDtqk3dNPIKh5+B5a?=
 =?us-ascii?Q?YDNH0jdhN6FK2x4KK5c2exDnAI7LvGhEgr3YzG5y3rxITnjC5zWtYPzO/0Ln?=
 =?us-ascii?Q?Th1pS/Uk/wUfCCuk2l8snhKNh4k4PCo8APYMtsi35c/B7FfxP3g+XlTzH73V?=
 =?us-ascii?Q?pHMxmNDhaIjNrFiwELFpC/Ol8+EPTSIz39f1eHR7Diy4XHdwA0Lz24FNQHqH?=
 =?us-ascii?Q?pBlAs+77Iez6KN2HXdWF1DLdD4enZ6BgYBg24T0A6KJSaOxpx55m3pVutN3D?=
 =?us-ascii?Q?O6j11TBACF1H5KDzapBbNvpDQKiaM4xnGItRMb+evw5Tu2gtqGeJAX6ngeT/?=
 =?us-ascii?Q?L6M/DkWU2HeeyXjY1ibZU9L4bAVNXeNH5uCV5HmRXiFQGS1TgjPxY/Yqdhr7?=
 =?us-ascii?Q?6NXn4BtOzj6pCLm+pzV7vdAtDiqFPF1nrOgGl5o5s5pkOxolmmVUSINxbAc3?=
 =?us-ascii?Q?gZ+ebwUt8PbjIp+rFylwQmrXcjFg6GsuNMMqJjnQnMx3sTsK3YBl5f6X9o/z?=
 =?us-ascii?Q?3iB9NBoqk96b7p49oBRDR4VEhxW3xKpdVfoCZSxVVH3yBoHKl4wswG6JtgiD?=
 =?us-ascii?Q?HpJ85vWou8SrXAB2+37YZ4eXMRoGb9xuRfPxRz361nuVo0BDdFWlXb7kPyWq?=
 =?us-ascii?Q?70gxWJ3fiN5LtJE5dqYWea+KpmL4nrbOFX9M62QlL40rRO0zp/dNHK6IIRIv?=
 =?us-ascii?Q?JtxonQA15Q4AL1gZZPNtuU8YdajiGVi4Q7vPw+uRFQ5GM1vaZc6U4OeSsn+E?=
 =?us-ascii?Q?DWCokZ6JZmEFIuhwBeejSXFQo154wo6q9ml3k9zRbOAFO+sZgsa3qHNJB8dH?=
 =?us-ascii?Q?vSFumA2JstfS/KfM1fij6nxgpHxuVA6fWpo7pTGbwkEbfzf50pbIwohBuauG?=
 =?us-ascii?Q?lNZTzDhX7odXNunILyFQkLp+pwHoHYW5+49OZwow7E/pTlEC7L3kLq+hqNSY?=
 =?us-ascii?Q?9EfOhNygtD0fZ9WNbOs7wZifcQ6WFU/6Zj0lqui/5k0vzacj4FBpmvjELJfJ?=
 =?us-ascii?Q?Jf886REgCYjbRYmGbhGHiGGiag5cJBUudu8qsJAuRy0UKu6GbmvDaDrMDhh7?=
 =?us-ascii?Q?n67vilJItS1X8RPNtT+myk2IvH5qfUDZ53N0rHZGuv47Oduocq5Mjp5Gl6ip?=
 =?us-ascii?Q?dhUNCe+OJ7HXRCRAN4PCAyS6YKkT67zgk2NjnlPJDRUjTmGnubFKYGi/ocWq?=
 =?us-ascii?Q?R9H2Ho+O2+vPxraSCr4tqShdvwLwGWr1emuLyD0eGTR0BNOCaMnMI/k4hCFp?=
 =?us-ascii?Q?JYmLRFbFMJOzCr7pray1fyc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eec0003-0710-4af5-23a6-08d9a416bdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 06:53:03.1036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eizQQrU3UBxQKYMdvs0pXvom9SBkuPRQH8DyzvH86HLuEwznBeORPCzjtdx3ShW1o+rcAwbVuWtfd37SGRqmoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Sent: Wednesday, November 10, 2021 2:21 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
>=20
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>=20
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Sent: Wednesday, November 10, 2021 1:07 PM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by
> >> default
> >>
> >> Zhang Chen <chen.zhang@intel.com> writes:
> >>
> >> > This patch make filters and colo-compare module support vnet_hdr by
> >> > default. And also support -device non-virtio-net(like e1000.).
> >> > But it can't avoid user manual configuration error between
> >> > different filters when enable/disable virtio-net-pci.
> >> >
> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> >>
> >> Have you considered backward compatibility?  Can it break usage that
> >> now works?
> >
> > Yes, this patch fully guarantees the compatibility as Jason's comments.
> > Original usage still works.
>=20
> Worth a brief explanation in the commit message?

OK. Add following statement to commit message:
This patch make filters and colo-compare module support vnet_hdr by
default. And also support -device non-virtio-net(like e1000.). Because
when enabled the support will make the vnet_hdr_len field become must-deliv=
ery
part of filter transfer protocol(even 0 in use -device e1000). It fully gua=
rantees the
compatibility for management layer like libvirt.
But it still can't avoid user manual configuration error between
different filters connected when enable/disable vnet_hdr_support.

How about this explanation?

By the way, please let me know your comments on filter passthrough series:
https://mail.gnu.org/archive/html/qemu-devel/2021-08/msg01393.html
If OK, I will update it.

Thanks
Chen








