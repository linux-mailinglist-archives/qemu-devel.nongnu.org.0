Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56884E607B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:39:19 +0100 (CET)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJ02-0001W5-Om
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:39:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXIj9-0008Pd-AE
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:21:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:60255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXIj6-00041x-Dy
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648110108; x=1679646108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yV0zlTqpRVz3A8zAFonAfNq+gyraQieFlALV+fTGLuA=;
 b=A+iJFoSh912WdTbT5Vnf4ncOyCQ3kGwem+Ntryy8zE0xb88deXC07kz4
 kt0ZX9FU9LA+CDNGxh2AqBpUkxUmAOB6PAW6j6NDo8e1WvaNBGWlpyncS
 KTDTvRZa+TAeR83hMni6kZJC/OqhJxREhRdxdVUciNdovcXoZQgsEkwMP
 y3U0Xz/2BGquvidfESJFPB8b7BBg4UDLE2rFekCJKt+DTrXAJIgZY/Hqu
 dAOn3i3ky8FEkRmG7JmdhSwEOqCt/qhQN/acMWzU4WPWIqzL/SisRsJ8w
 RxRRYPN7Pp4vu1IgtyGyc8d6ydv6WudqppkDtTebQSwWwbwpqFxGm+/DY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="344749004"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="344749004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="601610043"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2022 01:21:42 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:21:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:21:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 01:21:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 01:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enn2fLb3+aBbl1up8muP26bRcOEw9yFcw1zKkBUivQO7yErojLxwEFMpCNF2GooC0URvnHttvCmONQdpF+U+/OnbMAIjrrKC8ERszug6ceItBYqqY+jDL0ZKxobnRCMUu1ZNgsCUTE5+5pmo4JIjzl98OMQ0YpnUsSYtmOlJRXcDLrl9P5Owqse/amZwZmk1mY8BXEpPEQXcGlq5dUCWgQi1QT9Zq4khPPr1/Cv97SiKVsMGToI0YmiSiRXG1gDNYzgwSFz2g32DKpbGcw3Iy7UHAhMli1bU2iZ2KwnW3MAyqutFXAHsUJpEoM9z636MWMYxcjXAN+IEmuI/dnMWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nReDYt8jFaKKWE246KCZ5SARzAONbPijjx7LSdC/c10=;
 b=Aav3hFyDuCKXIPM3tsteA9k0SGOtmpKrX4CZkwiVIGJ3O7V8W6aw0plcpnJ7zrnHoGGqavjxg80Xk8JcmEo3N/K7gt4qdFR1N2+01hPc75xb1Id1BBJajZRm4pU3I7iAybdn7MOQYRc2+vMtOJr84iJYBorVLOxtuOtF2n/y8yPhYbH0BcCbrNCuD7zffCsY/uDxs44WOeI4rQ58XYRsdpGyEgLaumHo8FdcgRS82lW4Oy4CRPFKfwsA0pyNU4JH2W2ZbYvLy48L8nPETtfCFow8cNFwzbQSY0JGNsUTZNR2mJ/XkHiDHfHLijpVPUGscEBwpFLOanmNhXugVnJw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3529.namprd11.prod.outlook.com (2603:10b6:5:63::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 24 Mar
 2022 08:21:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:21:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Topic: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Index: AQHYPOo/2I7lnnOXbUWYdLsoevjaqqzOM3AA
Date: Thu, 24 Mar 2022 08:21:40 +0000
Message-ID: <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
In-Reply-To: <20220321055429.10260-2-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35909205-cbdc-4fed-7c14-08da0d6f5271
x-ms-traffictypediagnostic: DM6PR11MB3529:EE_
x-microsoft-antispam-prvs: <DM6PR11MB35292807EC24849381381E678C199@DM6PR11MB3529.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8K2qhJuIx252LSmcFYt82zsHrNcETFtdGx9ZT/9s51SFuEr0boB6nbFhJh3LfDxRSedItSWRSKv2+pWiKD4BGjt3ryvq6hbMb4sitKcU0+J+MF5r+no6U5jyvN4d4Iyf5nu8avx85vrlGtS3RYYuwToEqD7T54KHdH4WX9i3C19fTG/P7axFHDFAJB2c3C/u1rcB53IIa0HBMz8qRxClshU+RB3ZQmsdkMMUM/c7HrdcI+6VQkt5YOu1l5/c3eaZXVYP5Eiz1rBeQ8dDwAFxaP3ncmy4OT6YVo3pVCyIeFT0O0ON2ZHV2GMrDwD43qXXJAIzG3MAZIB5Ls1m5r/2eu3IixDFGY2lJiRfkETosOK1HOyWzV9Fh5hlwSoZ1+I8JRe8fmkO2SMdpEr4TTLiAo789A8zPfGWSV5zBwTl0tRGtwi0UNbvy6BfMqcmGjzpkIQkT3mYV+N15yXNXhU+4SPrOTKEX8K5vZPGUFiMBBk4B9a6r+9otXLT4o+cMUmfCGixMIhwVkX8+n9Sx0RtJP2GdFbXj5WZ0Uz0I9NEOxsvVTytt4ruyI/Cy2qnRh7MqAjCJThqN4MCCA/anJq2YlBrbdaI/CM2a8RoYJ4XhHm82MwLVkOgjPfHcBDaSELKCJ/pMtNidPM35KcwUeFlfF4KT0dCXzZl4Ma4sBnEP3muwF5zXuxtgacTBb+RboPK+rms7nYbc0ySUNduc/tvxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(66446008)(5660300002)(110136005)(54906003)(316002)(9686003)(7696005)(6506007)(2906002)(71200400001)(508600001)(83380400001)(52536014)(186003)(26005)(4326008)(82960400001)(8676002)(86362001)(38070700005)(33656002)(66556008)(66476007)(76116006)(38100700002)(66946007)(55016003)(64756008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oo+kRsV/QX6k3jSUIwSzp17aPXVeB2LbShfPNQsV7PUgVbuEu+eQAXHcZYT3?=
 =?us-ascii?Q?+NTHYZX6AUqkbgmfXwXWCejYIx/pTG/6L39eKFdFrMkZqRkQ0tauAK4nNgwl?=
 =?us-ascii?Q?iYTSm8zCfF4o3F+OL0VBakdfuunNyYw8uxCfh/cRATY+GWAKrn+XIeXPpMhN?=
 =?us-ascii?Q?I0J/BjGOK7gbAac3MbAqKETE2yNDZI57hnJVh4PwKWxr1KQGsuL8ysfdmSn5?=
 =?us-ascii?Q?aqBn00rIHGEAfcq18q6cFgrJd2O95wwx7r447EkhTscpRjT3D4ISzegNpVej?=
 =?us-ascii?Q?YvCplCMxhqBSRHz6IS6ZmdpP2XJkJW6CBBOA4QdSfB51b+6Y4+Ivp5paylTf?=
 =?us-ascii?Q?qXWAmzmJE+Rjw6e/jau74tnewiT4XqIt93Snwy0qfoc6wBp4dhudCExM5YTX?=
 =?us-ascii?Q?Lu1EajnTsJV02jnToIqe/RqmsqxWiimexc3PxOi9AjfUgyoB01p2ic/MMK4f?=
 =?us-ascii?Q?6EyfAQX15N91dF+IboOR7CsoBaf32QW58Y8MabsHZUK6KiWcw8H1b0pKSXhV?=
 =?us-ascii?Q?MbpmEPrt58Hm/CYVltdsopQ+juk4sLmXYsjsD/zFButpct/wuSn0alCJXCHB?=
 =?us-ascii?Q?TskMbNGyR6A7WpZVz3YJmq5geUOcnIeiFdhIGEpDgg9EYqk2zdMvbe7NKKWQ?=
 =?us-ascii?Q?LMIGHP5XnjAlmttQoL9kMFsrct6hNxauvlw6nNPjMX3+W6lAy9a8VZoHVH4a?=
 =?us-ascii?Q?c4ZzLWwO4n8gMxEScny6IaQvLpjf1zReW6w7gJcl/zGGmYPBIZkZpeiEJSUl?=
 =?us-ascii?Q?Hy1qpGhHWC6EACHGsPajdnC1z+xbQw+G4HaPDtIbPa+/McMf8xL9jpTCEg7s?=
 =?us-ascii?Q?9M8cv05rcEBKu5zlMjZ1PSe/+ItSzGZXTXKzJabBzyb6GqtdTxFE+W2/xBtP?=
 =?us-ascii?Q?ZpSkNyq0PPdxC4Wxv/rorfgdAswFofDqOoZHjHH7R+EArqMbtbExD3kW7eM2?=
 =?us-ascii?Q?Dvb/u3N8jup9yBuSZ+fExbx4AkTab+PU3N3e/riyvLGhDgqNiPDtkNFy7fCx?=
 =?us-ascii?Q?QgPxtZjZqAEAzye1kpLp8K6f2453BAnoRGD9InAHYkMHnIhd6/QmMGhRo6mY?=
 =?us-ascii?Q?adrM2H0QTSM3T49e90tA3z0abo0XAkAWpWggp3+E5hpH/XYkCXRKTuNB1sPE?=
 =?us-ascii?Q?ZWh4cnCrftKBCEjB1NWrClOc8Ut788SlIGA9OEFRyKbA7g6USenYAeBH+ZHd?=
 =?us-ascii?Q?tFDoBEYFQslSseuj67TyYU4EujVR//t7RiTIAuf7znQuiucOgHMNA+jOaeyd?=
 =?us-ascii?Q?t/26QI3qjeO1l31SVHDzpJigBNwty/WsmPccGetsJVjCa5SiF8OWaLUlced6?=
 =?us-ascii?Q?ZwV/xzAPPZK50ENYu14/TUahBAs716f8gZnjBFZlpIVSVpbMlNcqeCbi5sFd?=
 =?us-ascii?Q?L4iL9XGX1wk//4V8QfcScSlyI0OfhDy3n4gZmW0lPo+9gTmi3K/GfBBjbFRS?=
 =?us-ascii?Q?2jmOERXonCbPGtk/E1R1pYp7TTTO/UYb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35909205-cbdc-4fed-7c14-08da0d6f5271
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 08:21:40.1265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNPT+Pu456YzpoD9QWx2JGUN9eWlK0oGtYhYD/ZMTET6dynnd/rhN8WRRWpZBKv816dCt2bUn9tV8bsV2U7yvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3529
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=kevin.tian@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Jason Wang
> Sent: Monday, March 21, 2022 1:54 PM
>=20
> We use to warn on wrong rid2pasid entry. But this error could be
> triggered by the guest and could happens during initialization. So
> let's don't warn in this case.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 874d01c162..90964b201c 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState
> *s, VTDContextEntry *ce)
>      if (s->root_scalable) {
>          ret =3D vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>          if (ret) {
> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"P=
RId32,
> -                              __func__, ret);
> +            /*
> +             * This error is guest triggerable. We should assumt PT
> +             * not enabled for safety.
> +             */

suppose a VT-d fault should be queued in this case besides returning false:

SPD.1: A hardware attempt to access the scalable-mode PASID-directory=20
entry referenced through the PASIDDIRPTR field in scalable-mode=20
context-entry resulted in an error

SPT.1: A hardware attempt to access a scalable-mode PASID-table entry
referenced through the SMPTBLPTR field in a scalable-mode PASID-directory
entry resulted in an error.

Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
problematic. According to VT-d spec, RID2PASID field is effective only
when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
see ecap.rps is set, neither is it checked in that function. It works possi=
bly
just because Linux currently programs 0 to RID2PASID...

>              return false;
>          }
>          return (VTD_PE_GET_TYPE(&pe) =3D=3D VTD_SM_PASID_ENTRY_PT);
> --
> 2.25.1
>=20


