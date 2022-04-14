Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511345003DD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 03:54:33 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neogp-0002ti-Ru
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 21:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1neoel-00021x-35
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 21:52:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:3997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1neoec-0004S5-8P
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 21:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649901134; x=1681437134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RgEYC54peD+EYiy8lgWi+N+szuehWCHr3ksV01UXc2w=;
 b=iEjjB1DXvs9NifJBmXPdIaIIYSR5uwLs8Bc9a6owWj7nedKgFzNWI5wb
 G7Slywn/C84MtPY0aBqpBDZz4vJ0GRDpiL4J5EAUSE71l9qz+myionEPm
 zfkHaNMUGIyqD5l7gTicoFTwmp2gpWd3O9todJZ2h/Dp9sAiqZsLCjfMH
 h+W+l90kyag/zOo0RN5IxEFzw1hUwTNQl4zDwTTbmzQFLnzB7J+/dqG+K
 PO6xzN3EEWD03OXz5oCsBoz0zeYFNW9g5HrvAdkL3S2UqGVPyWwyqUduI
 lQiALUWCCkSvM//lm/Yd/JuP/eDjimachj5YnfqliftzTfDiFHFPaxCHh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="260417325"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="260417325"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 18:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="725156088"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 13 Apr 2022 18:52:08 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 18:52:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 18:52:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 18:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNGFoG5i1GscUqahVNLGPebZrws6sXuBAaBj4vYd/crKmh4BTxKmc2jefcoo10pW/BP2ErtjhTMb1kLqg8uW7fFDBgB/c3OO7eMnO1EZ7jxCO3/9Qja9RmOsnsDNbcJ6ZbjhdZNWYKitLJDT3MjMXT3jMjQYNFAeyUhvmFiOaG3zhxJtQBhSK5pPzRSm1C3NG/UVdcDnR3MMlV3RSlC1v7BNf5rlo5s5Z95d47hKBf1uKODrpgG/4marCkeOIfVgxEmBy4Xt22YO9ImizTlCqwosiIqyYkC4/KUs7/YUCAWTmzy9F6N20Ulu+eGhGnP8u91WF09noOkzFkQwdfi3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZl5dLV/iwAPV1Jc+U1YTnp8V0nR0SljPs5zPWEU6+s=;
 b=GLQdYmtnjpkFz0RwntM00JuKrGp96+O/5sheHZN/USCCHjnJgE2NiNfUSQoAZ6iyp4F8Ri9x3qP2AA9QczZ5PVTtRBhlGgsYUF8/BWbR0JcwmKYv49da/adzutZvoOnKs4QLQwKyL1zRCEuLUFLOj0bLrN73nT1SucCZLBKP7Mk+iwaNtQdqmcdfjUvSidCqSavD1Gn7JVulY9WAteN9NO7C7vvW6ZGXdy3LsT3l4LID1lPwYlD0y++aJ92uyGYNaoycGtqIDkdEvvct+GAzZ1G740aBhh5Gy+Qz8Q0ZBJ/2r1wrp2f3DsdAc/hGmB/XtPfDvb63ggV5Eqqzwzp38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1646.namprd11.prod.outlook.com (2603:10b6:301:c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 01:52:06 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940%3]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 01:52:06 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: RE: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
Thread-Topic: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
Thread-Index: AQHYRXzl+GS3uwjhJkKd6PjaLQ1UUKzuuRwQ
Date: Thu, 14 Apr 2022 01:52:06 +0000
Message-ID: <MWHPR11MB00314CD6EF6407DD7CFB2FC89BEF9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
In-Reply-To: <20220401034702.687057-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 464e1ab0-55d3-4d53-50e6-08da1db96164
x-ms-traffictypediagnostic: MWHPR11MB1646:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1646C645040BC138176054F99BEF9@MWHPR11MB1646.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9cdm9Lja4FQiBtkZ5UgDeCsa0UQb0blQ97yFr8tPG24TlV/XVacDsTKJGqB7w13mPLiPeKWn7hHOdq6hPZqWFtWB5UUrxSvuii1trK/T06KeD2q4Vz498YQn67FBdnjfKJwsjn0z/ZNq/JYbotLnsnlpbeXax0i1c+vjHMgA4V7vlEukcNJUH3gZzDURZX4mGE3BObZSxPJyjHBJ2Mzh1b05pLzAH8krQb0tyoQaQ/PaGLrUfy1B+mDtcnlopgdoq4ezII4QShrurNFwiRgWovXYZFOGfe1kIgXUmYfbinfaGcT7LXYqyAVMJ2hhUpDOxKRURc9wUyZO/eMEEuruA+0s8EVrIm+sHuUaktbkLp0fvJBmtx60NBrb/3Klhax8QBAlyrv9+dTP8dyJKSpavk+Ss75wzVYMUyjloEDcP1GjrZnEjFgvUV9X420Q4/+KeZYiXkOmfwD05+gWKOOmEgHMIdLnKlM2ZhBuvLKTh8veA8uC1oxOpKLLAzPUbWeHBech7kaQ4aTc/KJ4Addq1jIJkA4o0+A+NddZK7f1y7QFxZDQXbpJI2bBqlt/rW3zoDaUwoyPbVQMUiRLiGaPuugpzoyPAlRo6/P9SBmpQwIjQoPFQF1ugyhlEN7YseXSWYVPEaQNz79KXjutrnM3avmJARVgO+zA2qoqs3hVmoP4ZOeKr/8MTgbPPAhhCjyU6NYXGcgKFDwHjxu4qNUMnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(82960400001)(508600001)(5660300002)(110136005)(9686003)(55016003)(316002)(52536014)(122000001)(8936002)(2906002)(38100700002)(33656002)(66946007)(53546011)(6506007)(4744005)(7696005)(26005)(186003)(66446008)(66476007)(4326008)(71200400001)(76116006)(86362001)(83380400001)(8676002)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bR2n3saCYFlNKE2Z1qsrYdLEeBt9HjZTv6CV6xWxnX9F3p6J5apR+dwrzqka?=
 =?us-ascii?Q?vzPUdyKWcPbl7h3XLgHr4I+sCH6cvk2D5DLQ4ExQqG+6jh/DULY/eAXPiA+I?=
 =?us-ascii?Q?onipreSyMulVJVBm3W9kB8dbCqURzJ8wZRPhEBkyC5MQH1o+K3eiXYEQ/cMj?=
 =?us-ascii?Q?gSZ2VzzERn4SQbXzVkzaVxveHKrnSUWSrhX8LrfWZoarDK1JVrDBVsqKLbc5?=
 =?us-ascii?Q?sQufhCKdjguQoFWhK7ino3ObjSa0xxUb43WXEtN3eHCggOaUPC/LT9avQGPX?=
 =?us-ascii?Q?F6TLbPXwiPK7yDCIdT/PeQQ7qh2YzguXPCUWq2M1SPlVUBJU8N6uMhso3tCR?=
 =?us-ascii?Q?/Fd66seLB+HteWS8LQjO6oiW5eIDs8TQF72ZlEo6pBs321T87rNTRMZu/qGu?=
 =?us-ascii?Q?cT8+RgBlIkqHg+wFguBu3LhJaTdDOqS5MTKriK4p9soSomvRShhblYIk5fKC?=
 =?us-ascii?Q?a6i29I4B32y0h8XP9TYPgnrcLZjq5P+DuBMV58LtMIFudQE/ocvkY6jotLMn?=
 =?us-ascii?Q?SjP2omd1GwdXwKiwelZVvx2c6O0iE99iuYanKr489zVOHypE1hN10x96lo1b?=
 =?us-ascii?Q?95jtLRQfiW1actM3aRppDWF4KyTd+gSpKZXHf+hTt/Jf5x6erI8Z3tAFu7Pc?=
 =?us-ascii?Q?sFDoudtpGMkvb92y22OE7e7rdP2xCfMIUqo3nJPl20nhLK20ciH2QrS/WZA0?=
 =?us-ascii?Q?i66noCaOjKS8CnbN2DTs7Zr/RhDjGfohbVkw3OBC5KtXOckwDgbvenM6Czfe?=
 =?us-ascii?Q?q5PwuZTWpfWeWsYmtWGIPagaEvXowOvg7KsEISPtBHTE9SuqWaY+4Xpok55a?=
 =?us-ascii?Q?XaVZ97lWmm3iCma6bIQKfjknnWkZ18RFluQuzyr/dRkOtF28etBVlNR/MIhj?=
 =?us-ascii?Q?2VlJ2a8NSdSI8+bv08krOhEchC2cVEKwam3MXCPhGFo2x9iUtNCVbX8EVAPd?=
 =?us-ascii?Q?zDOE47UuSeyKo705K37h6CHcBYb4fjxlxdwTAYeSNz7nzWX9/YPkDTbmOkY0?=
 =?us-ascii?Q?egAUyqj0c/VuORu8W2YxPVVDota7NOUmwIPWiRffcRKMRvIQyAyf3uBcwk+/?=
 =?us-ascii?Q?5Bx+Z9LkedzPvH1pvkD7lO+m2S9+ZTPC82A9RAoWFn9bsG5TPSgrdgQmbBFF?=
 =?us-ascii?Q?CR8y6D72VWUX8K8gGiEudc/GbRUE8gKuTPLNw+QO/KvUJMRRVcl6mnofznW7?=
 =?us-ascii?Q?puf+UG/heiHyzSyCEdCcWeIbFUpodrpR0MY2jN78JIhqmmWHfCzrISl58gMO?=
 =?us-ascii?Q?Y38iDtAEhdy2zRlFFZ7ofKrFVdC9ybuVE+jmtk7z3yarCgD7pZTZU68MieFh?=
 =?us-ascii?Q?zjobxAsb/TXrvbUrtj5aAVU/gGewOpWnqBqeOBj0NlTBZohak9ta3WYi/UGm?=
 =?us-ascii?Q?pv0N/A/oI3DqipIYnupx08Dg709iADfK7MjJZvKx1PPcFpnLZ5dY4MwSEI6o?=
 =?us-ascii?Q?jW12QniN3yz+OZe9Y2hiLzXjTaNcOfnsNPNuT8LnfjRvYph/IT2osksk8PPf?=
 =?us-ascii?Q?eUInS9t70OnNVPzLMI32KJ5phT9ufWS4QvCT33H0gvdY1aQ7embqLJ6nNdmD?=
 =?us-ascii?Q?BQZMD8zeNofK7nV+QDlUpBW4buD2uJQRzg9YZfRkyBEhoqt3VJTUSKKk44vy?=
 =?us-ascii?Q?VwpYzbY2BdOXNWQuQ8mW8f0qxJ4Uh/LKcnAMZwMG/cZBL9X3z5vtT+60EwGQ?=
 =?us-ascii?Q?Ozy1yOKU1/fJ3D6+7Ggo6vpOgO2F1OeDoHcFwY1pXvPneRDHRWCbDBrJcSa7?=
 =?us-ascii?Q?khAi5D26Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464e1ab0-55d3-4d53-50e6-08da1db96164
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 01:52:06.5997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shekZBXXoEFz8uX2eMtyBCV7BlE3WN8aXaGNSu3ULCcmciIviwvGjEBULj0x+Y3ikCcaixOlkFVbhOUp49dRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No update for a while. Ping...

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Friday, April 1, 2022 11:47 AM
> To: Jason Wang <jasowang@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.co=
m>
> Cc: Zhang, Chen <chen.zhang@intel.com>; qemu-dev <qemu-
> devel@nongnu.org>
> Subject: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
>=20
> This series fix some COLO related issues in internal stress testing.
>=20
>  - V2:
>     - Add more comments in patch 2/4 commit log.
>=20
> Zhang Chen (4):
>   softmmu/runstate.c: add RunStateTransition support form COLO to
>     PRELAUNCH
>   net/colo: Fix a "double free" crash to clear the conn_list
>   net/colo.c: No need to track conn_list for filter-rewriter
>   net/colo.c: fix segmentation fault when packet is not parsed correctly
>=20
>  net/colo-compare.c    |  2 +-
>  net/colo.c            | 11 +++++++++--
>  net/filter-rewriter.c |  2 +-
>  net/trace-events      |  1 +
>  softmmu/runstate.c    |  1 +
>  5 files changed, 13 insertions(+), 4 deletions(-)
>=20
> --
> 2.25.1


