Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FC44D006
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:26:31 +0100 (CET)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkznK-0006ET-Nb
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkzm1-0005AU-Ix
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:25:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:10998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkzlz-0000VC-3H
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:25:09 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="220036712"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="220036712"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 18:25:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="602445564"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2021 18:25:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 18:25:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 18:25:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 10 Nov 2021 18:24:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2kPvSgqZoETXYRiO+6VB9ZLd3eZS52aWhS4Lm6uE+AKPy8AuxAzN47BbZVgfYzdNWk93HUMJH+ei1vzpHf949y1RFwGxNytmUok3kLxAoMlO7gz+zu5ooh/PXeiN3xQIlYkDQDVZ/nVGjrGErwbsAD/vQMlp90250rs8AgGq8lOS4MzZU+cx4V9e/MW2NPawQBE5zyw75xv3B9oLQ0KzaopNAsI/FAbrwNystsfewLIwsFz9hTB4Nzd1KA0Xhiav0Q5jQn1ud252lsq2WdxHp3T/6s7kzxmjPT6zoPg/juIOLW6QyUfoX8kF2jxNOOz4/WitU2ROKpK0bl4+fTcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnllPCW0cd40XLHWlGaPbf0+R7R7GS8hLNjo+8yk6ug=;
 b=EFa39jWDxFnkZOFMifhOPo1vofc2BGywqjangHhgY+S2bUpvB7zzMY/D+qcj1VCAO0tZNxvzfRlhGqkbt2nmMFCOXVVd82jQg8tBI08ekI6x244Xtz04yl6aReFhTyzZudrAcfBXB6uII9w4wbVj/+qlMBmD1PYCJH65PIU+RAeX68ZBwT6guT0HfilZr6trUcEMGOpL+hbvpVBIzhKebzdi+IjPTBT+KifnyqMZVEq3cJlNofW9qs5Omcv2XgAElVU2v/3P0Utrzud17MucxCT1XR/uoAH69XvGbTpADhIAhr/Bjx3g0S9Hlfjvw/0UuejZ0xX2W2WcTFSTZ05Vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnllPCW0cd40XLHWlGaPbf0+R7R7GS8hLNjo+8yk6ug=;
 b=edqsdK3l3pS6w9XrENpzsL+MKGJaj82UwYfPwxuBjMpalWbm2YJFDpgac5JH53B56+TIdMj4KMaJmFZBm13mLT06Lh3OzxrB5Z/BIbhgZOc6Ulyfa/mE2WHzwchThQCa89UXAJTq3tQ3ZBspD04+cG+MXsjU/O0WDxtYdsTpnPA=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1775.namprd11.prod.outlook.com (2603:10b6:300:10e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 02:24:47 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 02:24:47 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH 2/2] migration/ram.c: Remove the qemu_mutex_lock in
 colo_flush_ram_cache.
Thread-Topic: [PATCH 2/2] migration/ram.c: Remove the qemu_mutex_lock in
 colo_flush_ram_cache.
Thread-Index: AQHX1g9iGPJYna6/dU+X6gOU5owDj6v9mg/A
Date: Thu, 11 Nov 2021 02:24:47 +0000
Message-ID: <MWHPR11MB0031706651DB167DFD75153C9B949@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
 <1636533456-5374-2-git-send-email-lei.rao@intel.com>
In-Reply-To: <1636533456-5374-2-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f85b458d-d1e2-42cf-ae2a-08d9a4ba6e97
x-ms-traffictypediagnostic: MWHPR11MB1775:
x-microsoft-antispam-prvs: <MWHPR11MB1775DD1916FA2FFB76CFE1409B949@MWHPR11MB1775.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jzlvcEoc8bjDKBFDIV6GXjk+oUY4JkAP7vIY+GSNl202z5aGGWK8fNUNw/wzLAVvK3HCtU8ZTkSU45U8OiHqIvmyI3vVgWayWbsALiNsx0swY4jdGCnz82emMGAQ0g3o134tN7bm7WDvX6wiAFoemr2Ib3IwzLBf2QypOc7HopRV7bKmAEXG+cpyDKdSd0TxPPFWVZrm7g1AX5NyXFlhbwq2iqNAxpSSsiib+I+jQMjkC70W5K1iunu03upQ6oxRWJBJxgK1xdBjnbwDACN5aYG4DpHsWRLEeqFLGZsndqgFOFejDw2sGoyOhHRt4INpZG1Miya4jRRO8Aykc10Z8yTqyDMZunThmAp2lnnv7mkShTI5QhIvB3/apCiLFuKq057LMp/W6elTzTXuU8k5JEUKCurIKlDUWBQfzvsh09kNVB1H3B5zkYsy8P2bHMvtdDIWiGWQIq1XtRjOdzVwTtTb1kmg7sWHLQL9LBw/Vvj5fk4laYJRsYC81VRkbixycIFgTioTuhm7gBPuzHmOBoRKvE7RQBxvazk//SEtQ6YjORk3uzuGgaaDz6F9VaDkmo/xK6fRDbDqcdj9lWelXdBvNShBzeiqdQCuB8Q2kNbOYaI9cPJWbsP90xQ+2+pnwPQGFWUeD4ImiXlf/5w7GG+TR4W64FFq/Olfik7oFDuQ826uLw4P1D+PrTp56Ew9WAur2YU8pf+Ib1fMUN+ltg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(86362001)(4326008)(316002)(53546011)(508600001)(110136005)(2906002)(71200400001)(9686003)(7696005)(55016002)(52536014)(122000001)(33656002)(66556008)(8936002)(64756008)(186003)(26005)(76116006)(6506007)(38100700002)(66446008)(8676002)(38070700005)(82960400001)(66946007)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+XCrodFgkW4X660/swxZgzVfFqpww98nPozyi1PfBrYqI76kqGcZVaPQMk/f?=
 =?us-ascii?Q?UJUYoxRP/QGrQogmK7/0Vyp43vjk1cj/AX37JmaUhavc5CNl5NlCexsj+ASj?=
 =?us-ascii?Q?b7KAAj46OGeZR8xIoTuW6b00SHzC6lXBfBMca/ihUAX/A5uTYXnc2zu8FV4l?=
 =?us-ascii?Q?tvf21AHJIU+mGXD8o0iI+nNiHIieg3eUY8BYypBG1eaRlLe19VEeodTbb9ut?=
 =?us-ascii?Q?2z0W4jNw9Qen6T+7x/Tp4a1FC1HBYnd6RhymLYWBIv5i1vPqYB/IM1RUU3ns?=
 =?us-ascii?Q?bFvtTrRxiYtJFSqBMQd/mrNRV0byelxzTrWmHA3DuFEls2ddf9/kMuzhuh5J?=
 =?us-ascii?Q?aeQmDmKRFJjim9YYA2xT+6FTkSBrHfHXWTOSjzD8jg/M/J8o1ops6UOpfdAg?=
 =?us-ascii?Q?eTlT6ZvxGhRgZfeqAy8UCPR05qBUtwHffeN2euLLT4f0A7fP0rRXE8M+cvN5?=
 =?us-ascii?Q?EtFHXmgIpaFIXEZn2BmV7BJzLMf+KGm4UxFZ8ZA/ffmk0drwIrrKIiNEG9Sh?=
 =?us-ascii?Q?ZjO2yHqI/AmuxpEd5++ucD6hQMU/oXfyueejzSrXkU+e8wnTjBlEb0PPQh/Y?=
 =?us-ascii?Q?syswi1usD7Wh2na/oxkpclN+6u1fPelCpiWH+NZO7Raqww4jpb67aGb+rzML?=
 =?us-ascii?Q?C5JY7Eco1L24QQceJ2fqorhWtvgrC7DCwPW5jBga4dqzlHB7xl7uQ1Li+RcI?=
 =?us-ascii?Q?Er8m4iHQ642krJqv/hlddpHJOAKSUW64PXUhKMi0KW8dIJ5+pEgBBqSzeCvx?=
 =?us-ascii?Q?mVwVVjcEmKGEmdJUCyTNqn0fqggknCbPvd55c6Tmj6o1/I6ER9TpNwuv9ViG?=
 =?us-ascii?Q?moJ+K8exRTC8T0Pmx9tdpO2sECJY8Guax7apheandzNXgC76J/k0YFFZ9/fr?=
 =?us-ascii?Q?EEIleHO9KfSP1sXeRNOGKQjdxyKBGSdcLP6xzxr8Y/0MJXDj1a1AZY4E33No?=
 =?us-ascii?Q?Zu6t5IdO7xLKDBofMpK9fzCXRoD70zirrYM65qAdawOXBnmPFdPB7nnpYeu5?=
 =?us-ascii?Q?pZztx8a6u8itxcRNqOE11N9JeLTBr9yE/YPenWw6XMgQXUFHdEE3em2vNsqv?=
 =?us-ascii?Q?BZkzw0DavkqB7u8fW5+j09ivWX7lZ5CuOYzmai+bwnWQiJYG4oBWXu8Px/BN?=
 =?us-ascii?Q?4CWiDulspdtUc2kJUdJ9LYxP6jDc1GsF+yBp+LLGAc5eg5hTJ2UfloRaTyC2?=
 =?us-ascii?Q?FfH763gMjZ43xz9Xzv7hD/njRABDOF6NP2axF8ZHoTj+lB7RPCsr8UvL1hf0?=
 =?us-ascii?Q?qb/8xH2mT9V2782C4uAmOk18jBwe6eYCv7mYUHrJWAX3x6QmeEBd5QqJSbUX?=
 =?us-ascii?Q?yfCwz95gRAA1EucLqyp9DYFgOFZ9YW/w2jCGGMGHMnzcdZLgDFy48EdRxMKw?=
 =?us-ascii?Q?AxaWPd4Sjh9d2ms0dy/KWxdg9V8oZpc8D7cskonZSWRcN3uVpPCdfe2qGteJ?=
 =?us-ascii?Q?C36OTLud35Cy0Mex71pSLYWDEABQxGoqmnrlDY/IvAs11Ysoz55IfSxCknMq?=
 =?us-ascii?Q?WaYleeVpWbXpRT5L/a4QQTgdFOAAX/mI5IglTIzMB5Zbe8cdTctCrjJYG1me?=
 =?us-ascii?Q?dxFNUY20Ae8dn0DznH6mH2MVvUK9ny/wxt/R+FAPVb1Q+QJey1tFTO4Mt0VW?=
 =?us-ascii?Q?RYTCkfA9hZ2fRLZDPS4ORps=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85b458d-d1e2-42cf-ae2a-08d9a4ba6e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 02:24:47.4953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/8wDu9XbR/+ap0FAPVWn8CJMFxRVx4xn6VXy/Be4lsouqxHMPgdelPAneuZkLvQ6vb1Gi4cMiSDeTM2RA43Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Wednesday, November 10, 2021 4:38 PM
> To: Zhang, Chen <chen.zhang@intel.com>;
> zhang.zhanghailiang@huawei.com; quintela@redhat.com;
> dgilbert@redhat.com
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH 2/2] migration/ram.c: Remove the qemu_mutex_lock in
> colo_flush_ram_cache.
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> The code to acquire bitmap_mutex is added in the commit of
> "63268c4970a5f126cc9af75f3ccb8057abef5ec0". There is no need to acquire
> bitmap_mutex in colo_flush_ram_cache(). This is because the
> colo_flush_ram_cache only be called on the COLO secondary VM, which is
> the destination side.
> On the COLO secondary VM, only the COLO thread will touch the bitmap of
> ram cache.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  migration/ram.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c index 863035d..2c688f5 100=
644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3918,7 +3918,6 @@ void colo_flush_ram_cache(void)
>      unsigned long offset =3D 0;
>=20
>      memory_global_dirty_log_sync();
> -    qemu_mutex_lock(&ram_state->bitmap_mutex);
>      WITH_RCU_READ_LOCK_GUARD() {
>          RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>              ramblock_sync_dirty_bitmap(ram_state, block); @@ -3954,7 +39=
53,6
> @@ void colo_flush_ram_cache(void)
>          }
>      }
>      trace_colo_flush_ram_cache_end();
> -    qemu_mutex_unlock(&ram_state->bitmap_mutex);
>  }
>=20
>  /**
> --
> 1.8.3.1


