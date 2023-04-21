Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B86EA21F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 05:03:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pph2b-0003GT-Tu; Thu, 20 Apr 2023 23:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pph2Z-0003G3-RD; Thu, 20 Apr 2023 23:02:28 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pph2X-0000IB-6H; Thu, 20 Apr 2023 23:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682046145; x=1713582145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k4lnM7+tSG0liRjYJfEwNFdKknBMfOFD1RcB84kX/VQ=;
 b=TK5mHgPWyZuQnEtLCgMQSaxUvSRnr10aviNgVkxeXOGYLWRLHRTpb2nw
 yaErB9UHyl9v66fpqj4kzXSl/ZzefNBUNTCV4TKXQgAOfrz8IMqOtw77K
 HTg4ILnJfRas/1csR8TxUkMnLyLKMj4cSB0XXNs41XNFiDQCLQoTknSkB
 gfrYHHXYgZrtU9S63eTgouKg3Biphl8fB/jubg6Kp9wRmww+9nfqL6LiQ
 GwUYHvA2UyppG7OwS8bhiJoSfCS5bIaHdWOlN76IrsNFc9Lme18TgqPRe
 mBRXt/RW9AePL4FSV+JOqTNyVQLuD9M8HbxvYjmQ0pxOk1R8P+OMVE6HN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348695598"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="348695598"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 20:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803566813"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="803566813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2023 20:02:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 20:02:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 20:02:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 20:02:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 20:02:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXd1Xmt/5O3fH4esWbRaQKmjeMVOd4lQ+iNwW99EVdMZjZGhCA61UaG6Dsnx7sp6w0MLDbfcRJDp4G9fio5eIevZeLfijv+5/QjHgrAdODBSL/mUpMHqNooIgJMntUCNrYG1e7bCq3HYr36KpZzZ1XGbovEKIgMr1Tn4UjvxhCgb8R4HORQRy6SpkTA6vWxTdLTP1uET25/QdwfTALjCSFvGZPspYrgSxdPIGDw0OfQG1C1gaPGkKPgQOegI8s9xe81URuc92g2wHIWfVvqiVWLXxkyfOrjvL//sh0AvjyiI8R3U3/xXibSlRQwcYFziwANedEOB0nwmUF3RVk5APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs0xcl1pbvAVd/6OVPUEOLBZ8h9xS6kToOSytaPbbN8=;
 b=WOITaZU3cbCmRSUjoABBDqQ9/cv54fxQFR1gOhtgQbs/yqaGhda6wT0Vi/vlBGQCmIX/khL87wScUGtu05mYIRtU+/3Y0M/UhVMI1hx3wrJiOAIPR5nT12XFFZxGGOhnO4gvdMZXH/qamJCCP57LZKfNrOWm3w+WpuLpkZAmz1veAlu+1uRAIpnHuNfWYwsBnajOvrnq1rxRGKAX0Qvq48KYhYTtSM0zs2nGs/KAoN6m9njSX8JWtQXcYFMgEGHRwkCfoVjhrO8K3pRT1EFS9BAaDE0x9zG09xOqpIGhl6jrn+B3VBL7eZtuxAjPKTosvkUWaqVFDK34uAYsVoBhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 03:02:06 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 03:02:06 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Thread-Topic: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Thread-Index: AQHZcxHC5ikhiRjXHUOjE4y+bokfjK81DdIQ
Date: Fri, 21 Apr 2023 03:02:06 +0000
Message-ID: <MWHPR11MB00312BC202A9B93E260F58369B609@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
In-Reply-To: <20230419225232.508121-4-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|SJ0PR11MB5053:EE_
x-ms-office365-filtering-correlation-id: bcbe0edb-6fce-4e26-c4ee-08db4214ca1a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ii2pC/gKIOnCh25aDABE65fXxyXtnTeK31RbqW15+uotD/a0P6ds7S0qlIsI27OvHrgs21nYLzqgu+xo2p0XZdV0S5iomi3jIl5kCBVg2o8D9VkzWfcTX35QhrsP37GB6VWckc/lAk1QqylLYWxop9aJqtlaIS3TL/LYnbeIFTxmp1QOeRiuLExJMVW6NvRVgi/K3vBuBmLeFV5IiQQDOPOxfdErH9K/oKRfPG2lBeNx5vpCHCDXehX9L1L+cVm35RPsZJ9AS1ObDBG/hUd17HRE4ic3rlesLlhudpgmVAKpWQU4HQl+5CKGo2BCO33gA2wBtKArL9pX8OdgbVg9Mw83q6GUrevQua2ntfA+ieBjUDutWDJ09pWl5gQYC95m6dSg9K7kbLJi/ns/VkuX2V1Lia0WN3Ff+unsFvfxx9vkUMApQNJYlb/aPmVUQsWdbuUWten7TPh006yFXHLURP+wj6cebNY3ZvHiE+pXPp5wPF7Am8ZiaF+ppihN5ivZw1IGTeYa0cidvUyAXUU+HegzgRgPCyc7FEXdvO58Dxknb9KvfepJTAxu8SudmYR/qR1UKyWlrCS5uW7upSKUe+YzxgH4t5UsB46DltL3Jo0ZMZruDlmxwaGtObvn/efB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(110136005)(54906003)(4326008)(316002)(41300700001)(8676002)(8936002)(66446008)(64756008)(66476007)(76116006)(66946007)(66556008)(71200400001)(7696005)(5660300002)(52536014)(7416002)(2906002)(9686003)(26005)(6506007)(186003)(53546011)(83380400001)(478600001)(86362001)(33656002)(55016003)(38070700005)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BAG5s37G0GZ841Cr3rQAr3D42RKoxYyMPLKfvlgJdmKxF/tZmQK+SThB8fFt?=
 =?us-ascii?Q?CUFDZjaBsozYA9Zb3P81W20E1uXi6eCzIQy8wmct+47BAIbygAEvpyME4JX8?=
 =?us-ascii?Q?zknenMWuW9w2GzesaVWEgRALbzQ/WL7pHrxLet1HIQPr5XouZQxcvV8FJKdt?=
 =?us-ascii?Q?fqGDs3w/wbbbup0dwOtw22F2hOnedqUPTcBUWGgKUJgclzi1D4ckxtjwhTi3?=
 =?us-ascii?Q?8GAj19C71WcOiAyOIdGshpHSLNaLmRQMfmD6O3b4vA5zdf8RmEPTOQai+e6+?=
 =?us-ascii?Q?7gfWJvYtbvxBqQ13FY4v+Fzc36BiURdF7/pQ9ya/KxQXVWHVtTL8Ifwdjaar?=
 =?us-ascii?Q?FRLNLFBuXxoRBVqFh5Wmt4n4mA3McSpeIK9qmIob1wFYsUsKF8DTg1jGUU4N?=
 =?us-ascii?Q?REzWknZZSjPEc1/lVsu3/PE5lJWkV3xJxnJ+8tqvpoauh/3A6HscJOihZDyh?=
 =?us-ascii?Q?UAqWre2waF/i6+5NivJQmVlo3FupKIYArp2qal5F5DD656+cesxqzHKlOw9P?=
 =?us-ascii?Q?HFML4/AyRf5U/ryCpPVR+Gn5do6+kRSkahpDsKcNg81SYEs8wIdBRsEvpf+o?=
 =?us-ascii?Q?l/5yeoZoqsuUuXGGsOR8etHTGanfFXa9OdFfmPhj/v6/Ephf/zQv7QEAmFiQ?=
 =?us-ascii?Q?+LFhgchHpCDiUGakRXrydOklD3Y6xHShiFAZxQY10haiLIriNv3b8e1UOtTf?=
 =?us-ascii?Q?BnVb7XRJSlUVvib40eqVpJNU2+jAflygVpJIw4j/1WAovgSPZBuacUAguGdm?=
 =?us-ascii?Q?vP2i04yL3JsgmswhUCtEPOxnepdRNRTvoWN2kFrVMZGXJ3V+sOyfLzxp1v7a?=
 =?us-ascii?Q?x5VteqWTs8DmnoTXkEIMdwCNvwI8ETlu0YEWwvwBXtkI3wm3Jg8WmAxmQvRG?=
 =?us-ascii?Q?1IgWx3d7Hcz8GVqESjkuyOcqYs1f9zKjrupsygc3NYvCnyqfkr+iZl7umO6F?=
 =?us-ascii?Q?8SQDNS2zNI5xNxWDWvJP7zYcqn5F8I7ila/V9bn798Ues4/kb/WXyrJR2zFa?=
 =?us-ascii?Q?krLfO87YSdWiW4O/ibg7udeg8dHlgNIdIi9q5dAuIZ1POTkKzZwufaHOVH8H?=
 =?us-ascii?Q?0dqnNlr9IQqNCOZpwYE88x0Mx7ULUsMym6JsUbcP7hx+xZL5Qzh5QN/2TM3g?=
 =?us-ascii?Q?pOvPCu8nlRpr2bQG1KgGlyN13tF2O9vwzz3eOaCigJ+k9LHnF/n7ZkDEC0c+?=
 =?us-ascii?Q?4/F+BX7eYIg5GFJV6mbLl28tplauv9pjNCOQv5+osbxGj3hjBrk8Rv7laJ3U?=
 =?us-ascii?Q?qveEZGmpcEaGwnWqlBz/PK3OQD10OBEk0bN8C7hSYptw2NzdoJdQ90HYRcJP?=
 =?us-ascii?Q?7PzlsLfODPsmQ+WEIwx4gmX6r6aAvaslgEjjhmTb6v5Q8RahT3YujafVVM+A?=
 =?us-ascii?Q?c2WHexut6O0yAxYKuxEuGYA9fFE5jaxUjr8W05hEzA2asSeJ2G0/bh+104IX?=
 =?us-ascii?Q?KxjL8kchWJ0MZCC2tbJZHMHuj06K3CZBcmdlV74ky4ltcM4iIjhcKRv9IsWf?=
 =?us-ascii?Q?QfQ7QrHGrtZ1gg8RQVk1hfFivJgSCEdnaWYJTOxLLFO08Iuc5tHRjYvx+u8c?=
 =?us-ascii?Q?vdC5HMJOlXaxOGKs06M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbe0edb-6fce-4e26-c4ee-08db4214ca1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 03:02:06.0462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mCf+pG8M6yPRNjxRM8rLciq0SPZfsZc4HwwcLJQOpaoFiVNOyYvMMr6G9fDnVnJoiNFBwT97z9eZGLdh+VEIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Thursday, April 20, 2023 6:53 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org; michael.roth@amd.com; armbru@redhat.com;
> eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com; Zhang,
> Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
> thuth@redhat.com; berrange@redhat.com; marcandre.lureau@redhat.com;
> pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
> kwolf@redhat.com; Zhang, Chen <chen.zhang@intel.com>;
> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy <vsementsov@yandex-
> team.ru>
> Subject: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>=20
> We don't allow to use x-colo capability when replication is not configure=
d. So,
> no reason to build COLO when replication is disabled, it's unusable in th=
is
> case.

Yes, you are right for current status. Because COLO best practices is repli=
cation + colo live migration + colo proxy.
But doesn't mean it has to be done in all scenarios as I explanation in V1.
The better way is allow to use x-colo capability firstly, and separate this=
 patch
with two config options: --disable-replication  and --disable-x-colo.

Thanks
Chen

>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hmp-commands.hx                |  2 ++
>  migration/colo.c               |  6 +++++
>  migration/meson.build          |  6 +++--
>  migration/migration-hmp-cmds.c |  2 ++
>  migration/migration.c          | 19 +++-----------
>  net/meson.build                |  5 +++-
>  qapi/migration.json            | 12 ++++++---
>  stubs/colo.c                   | 47 ++++++++++++++++++++++++++++++++++
>  stubs/meson.build              |  1 +
>  9 files changed, 78 insertions(+), 22 deletions(-)  create mode 100644
> stubs/colo.c
>=20
> diff --git a/hmp-commands.hx b/hmp-commands.hx index
> bb85ee1d26..fbd0932232 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1035,6 +1035,7 @@ SRST
>    migration (or once already in postcopy).
>  ERST
>=20
> +#ifdef CONFIG_REPLICATION
>      {
>          .name       =3D "x_colo_lost_heartbeat",
>          .args_type  =3D "",
> @@ -1043,6 +1044,7 @@ ERST
>                        "a failover or takeover is needed.",
>          .cmd =3D hmp_x_colo_lost_heartbeat,
>      },
> +#endif
>=20
>  SRST
>  ``x_colo_lost_heartbeat``
> diff --git a/migration/colo.c b/migration/colo.c index
> 0716e64689..089c491d70 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -196,6 +196,12 @@ COLOMode get_colo_mode(void)
>      }
>  }
>=20
> +bool migrate_colo_enabled(void)
> +{
> +    MigrationState *s =3D migrate_get_current();
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
> +}
> +
>  void colo_do_failover(void)
>  {
>      /* Make sure VM stopped while failover happened. */ diff --git
> a/migration/meson.build b/migration/meson.build index
> 0d1bb9f96e..3fccf79f12 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
>    'channel-block.c',
> -  'colo-failover.c',
> -  'colo.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> @@ -29,6 +27,10 @@ softmmu_ss.add(files(
>    'threadinfo.c',
>  ), gnutls)
>=20
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-failover.c', 'colo.c')) endif
> +
>  softmmu_ss.add(when: rdma, if_true: files('rdma.c'))  if
> get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-
> cmds.c index 72519ea99f..4601c48f41 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -640,6 +640,7 @@ void hmp_migrate_start_postcopy(Monitor *mon,
> const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>=20
> +#ifdef CONFIG_REPLICATION
>  void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)  {
>      Error *err =3D NULL;
> @@ -647,6 +648,7 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon,
> const QDict *qdict)
>      qmp_x_colo_lost_heartbeat(&err);
>      hmp_handle_error(mon, err);
>  }
> +#endif
>=20
>  typedef struct HMPMigrationStatus {
>      QEMUTimer *timer;
> diff --git a/migration/migration.c b/migration/migration.c index
> bda4789193..2382958364 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -165,7 +165,9 @@
> INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
> +#ifdef CONFIG_REPLICATION
>      MIGRATION_CAPABILITY_X_COLO,
> +#endif
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>      MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>=20
> @@ -1329,15 +1331,6 @@ static bool migrate_caps_check(bool *cap_list,
>      }
>  #endif
>=20
> -#ifndef CONFIG_REPLICATION
> -    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
> -        error_setg(errp, "QEMU compiled without replication module"
> -                   " can't enable COLO");
> -        error_append_hint(errp, "Please enable replication before COLO.\=
n");
> -        return false;
> -    }
> -#endif
> -
>      if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>          /* This check is reasonably expensive, so only when it's being
>           * set the first time, also it's only the destination that needs=
 @@ -
> 3577,12 +3570,6 @@ fail:
>                        MIGRATION_STATUS_FAILED);  }
>=20
> -bool migrate_colo_enabled(void)
> -{
> -    MigrationState *s =3D migrate_get_current();
> -    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
> -}
> -
>  typedef enum MigThrError {
>      /* No error detected */
>      MIG_THR_ERR_NONE =3D 0,
> @@ -4537,7 +4524,9 @@ static Property migration_properties[] =3D {
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram",
> MIGRATION_CAPABILITY_POSTCOPY_RAM),
>      DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
>                          MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
> +#ifdef CONFIG_REPLICATION
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
> +#endif
>      DEFINE_PROP_MIG_CAP("x-release-ram",
> MIGRATION_CAPABILITY_RELEASE_RAM),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>      DEFINE_PROP_MIG_CAP("x-return-path",
> MIGRATION_CAPABILITY_RETURN_PATH),
> diff --git a/net/meson.build b/net/meson.build index
> 87afca3e93..38d50b8c96 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,7 +1,6 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo-compare.c',
>    'colo.c',
>    'dump.c',
>    'eth.c',
> @@ -19,6 +18,10 @@ softmmu_ss.add(files(
>    'util.c',
>  ))
>=20
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-compare.c'))
> +endif
> +
>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>=20
>  if have_l2tpv3
> diff --git a/qapi/migration.json b/qapi/migration.json index
> c84fa10e86..93863fa88c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -486,7 +486,8 @@
>  { 'enum': 'MigrationCapability',
>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
>             'compress', 'events', 'postcopy-ram',
> -           { 'name': 'x-colo', 'features': [ 'unstable' ] },
> +           { 'name': 'x-colo', 'features': [ 'unstable' ],
> +             'if': 'CONFIG_REPLICATION' },
>             'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',=
 @@ -1409,7
> +1410,8 @@  #  ##  { 'command': 'x-colo-lost-heartbeat',
> -  'features': [ 'unstable' ] }
> +  'features': [ 'unstable' ],
> +  'if': 'CONFIG_REPLICATION' }
>=20
>  ##
>  # @migrate_cancel:
> @@ -1685,7 +1687,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>=20
>  ##
>  # @query-colo-status:
> @@ -1702,7 +1705,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
>=20
>  ##
>  # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c new file mode 100644 index
> 0000000000..45c8ac0cc6
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,47 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +void colo_compare_cleanup(void)
> +{
> +    abort();
> +}
> +
> +void colo_shutdown(void)
> +{
> +    abort();
> +}
> +
> +void *colo_process_incoming_thread(void *opaque) {
> +    abort();
> +}
> +
> +void colo_checkpoint_notify(void *opaque) {
> +    abort();
> +}
> +
> +void migrate_start_colo_process(MigrationState *s) {
> +    abort();
> +}
> +
> +bool migration_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migration_incoming_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migrate_colo_enabled(void)
> +{
> +    return false;
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build index
> b2b5956d97..8412cad15f 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
> +stub_ss.add(files('colo.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
> --
> 2.34.1


