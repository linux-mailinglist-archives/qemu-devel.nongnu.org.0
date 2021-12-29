Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AE480E71
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 02:16:27 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2NZp-0006wY-IY
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 20:16:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n2NWA-0005Sm-Lv
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 20:12:39 -0500
Received: from mga18.intel.com ([134.134.136.126]:11028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n2NW8-0001kz-AR
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 20:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640740356; x=1672276356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOGTU/xkoHeTT1muGA09UIfHuizEa2psEcYr/CDRZGU=;
 b=OZymhqqJmh1/Zml95a/ooGGDvy78xBnL5XclXtdb9W49WwmhoSky9aVK
 boNCdZgmQGo2/25CvFnL8Y0i1tLhyXkXCf1F9ePVcSiZhLn9KroClaCoE
 sLHL8F3IDaOHUDmcLqFbXc7jOfbH/rt4K+vABAATV+R3INa7qujYDbKiT
 4YAxHHylDcAAo67+cGWwbqF7LKoPx7QDtCm8CmjqRDAyOB9GNiTzT4W6c
 PsHJGKNH3MESCDo81UFz3qW+E+TGXcHhBrrsdeRRrP3w3FKeg5INgNtOI
 JlWWFylX9TkVGDnAh4cizdd38mGWUvoDWsRlufjC385VOBo9UsmtdofGo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="228272800"
X-IronPort-AV: E=Sophos;i="5.88,243,1635231600"; d="scan'208";a="228272800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 17:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,243,1635231600"; d="scan'208";a="572459306"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2021 17:12:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:12:31 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:12:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 28 Dec 2021 17:12:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 28 Dec 2021 17:12:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJVAv3taa9l2FhKzrzHPRmekSaUDm4M/HDmgTKqLdUWKqb7ImC0yW0DqSeaPUf2NwyQipWDaciZcmweKPoQHnnofMT2M7wgC6WckvGTwQRAOq/D3u2UeZ+ni0AvCJ1lHftKzfMPwddsjTZfUjD7Y3SS2nbsw8knJmzg087jiFGiqyeUDdSzrMB4Qfhob6pcFprL4sjuO865JQxHFwOSfPMoqve28C+oqmq5jE/M6kllisJOeFas0hncZD3ORHDQTM8Q1EsC00/EejSk/iuRLqc7zJjB1RqjQIjWsp+SOZyyWhUpXVae1CHj42xr3pTSkG8VemGPPLSf3euAE8u0q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN77Vz9U4XEidMsLDzuhGPwOyXYiZohKKDIDfTqQ+nA=;
 b=VY6jP6xzvAZeqA4rVtl5mnqaa/j8hXBR6WVuOhTrqAFeVN1dLkHPU9kn9Aqyo8Gy19Wz6ctXxz7gDpKD38P6KDRF5HdF2s4tRJCj2a1Z+ZsQ2WNG5djlYMTz25hpEHMGPXlZYwdSvN5FiIU/KArFDKoBVHbkBMCX88+pzes99tAoffNzi5mXVAGhkWvGXf4ryeLwzHhBhi2Uu2UJwd0Ag8Ok8Bc3y2usBClieWdoTquMVk5nmxEXXIv8lus+d5VaonIIGyVkNj/4sHs34TYxQOUI0SgPc/N2FOXcmnl0Mqswg9kTN99kR2kOZOKXQFEj8l2WlNI3j7FLUIxTPilwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1775.namprd11.prod.outlook.com (2603:10b6:300:10e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 01:12:23 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::cc10:db9c:6cb8:d54c]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::cc10:db9c:6cb8:d54c%5]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 01:12:23 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "zhanghailiang@xfusion.com"
 <zhanghailiang@xfusion.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH] migration/colo.c: Add missed return in error handling
Thread-Topic: [PATCH] migration/colo.c: Add missed return in error handling
Thread-Index: AQHX+72N+lAD7CHi2U68Xg93e5Ef56xIqrbA
Date: Wed, 29 Dec 2021 01:12:23 +0000
Message-ID: <MWHPR11MB00315CF4D5986D6899114EDF9B449@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211228073517.88193-1-lei.rao@intel.com>
In-Reply-To: <20211228073517.88193-1-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb348503-5915-44a0-96d7-08d9ca684562
x-ms-traffictypediagnostic: MWHPR11MB1775:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1775B01B549EC957A3FF71749B449@MWHPR11MB1775.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nzHypqE+7LQ/qpnr+WqUvCEu9nb9l+URGBIsa1TrnA1clYMe7uOjPR8cD5pNizYcDzLcIS1TekwSQrogk7LodYTNcqAPjMraapz7dgnKATu9BLgBz9HUPlxeKtMYQlNB48eiQBeTgvUbXe38IY1JRcXTY5jyFYPxILMPveS5+AtJl+5tE+jMz6C/Wtgwtx9kMVrg7JJjYtXX9SrhlQxNGrDPwzcJIN13hwRtL7/dHzFPTXyhjFEawKrgocuLyzsmy5f1dlJDtztSyDBdTkkHlE7ZDIsXJjMlg7cL61T74oY0ejeDUlM6pcu4uvYYuZm2VK0AUSw3y9qH1nm42Uc+drOHTyh5L/bwNvd3N/o76t2mddQw8YexeNf6KY4TUOFeav5gredjvJSsuMbKs9HEY9h5aAJ4v9thawVQWqRyk2uOfgBOY5Q3WtYl42WrmGCl9qPuFPZhfeFrOa/e6Hrmq81fjd9j+u8Ql15asz7q2VW1BOlH9gOZuCHYPvYDr1WdSP1obmdCK0L+ZHpKIoYlQnB2pRZdU2ASwqQMgH9R53Xqqvd84BOq9ZKpq7bEpoT1djT0bSZ2yRh02EC8AJHN2qHpJoIU+2KzpL3hmJF0YZ910lh2/l10uhaAJJoMFw4TRWYadZbvS+7P9W2aA5/79dKar/dWi7wpFLgR+hcMpMNN/zDqBZtFHp7w2TLdomj7lYwIBOLZ42olsuy8d5J5Gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(5660300002)(9686003)(2906002)(66446008)(8676002)(76116006)(6506007)(53546011)(66476007)(66556008)(64756008)(66946007)(33656002)(26005)(4326008)(71200400001)(8936002)(110136005)(38070700005)(316002)(7696005)(122000001)(38100700002)(55016003)(82960400001)(86362001)(52536014)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?woRFzbjjMalS5HJGEeEvShGdmDkZVJjji0c1oqBnlDTzZgnEqEsFbAL7fyZL?=
 =?us-ascii?Q?JXjvVkkCWQlALhs7EsPlK0LdDPHYlK5/p1YfJpdIIuVm8sqbB0f3XPGHln0k?=
 =?us-ascii?Q?DPFXsyLet2oIEs9yv1AoQvC1XOC5JqOq02S/fF1rL+z+jLov8GXkswaMp5If?=
 =?us-ascii?Q?PJsk6XW0Nz8yPbt4Dws0k/G4EZP0uEFd33C7lJS8YyCTRasxQ0RKbfXwZf/N?=
 =?us-ascii?Q?u5vhOIypzU5eDqxmayt0c2eB71VgbJ8kwqNU0cKtkpcqrBEs8FK8C2RMFBCv?=
 =?us-ascii?Q?qwmO/3X+aW8Rf8iF+Hg+bpH8O/98+r4ZuPelnZVklBI3ZqQz+4mRF4MO4X9g?=
 =?us-ascii?Q?d6xJ5lvQeKxaXBCxKrELGQJRfx1QmMdYPb0XodK9qPgioeib58ZVUh4D2abw?=
 =?us-ascii?Q?RbDex3eLtkCHxn8BFrkA5RK2FrxLr3tmMAYC+4Xx+L6vlo9l0yAmHwOTXeph?=
 =?us-ascii?Q?K/VjlRRh1LxXFqc2HKXSM86VABPYK9n9p6RyTMTKKKWP0prKT2bzcUo2n/SO?=
 =?us-ascii?Q?6D+KlN6hzx4c7bwgzjCfTnrxbN/fwqMhu7IQ+es0r+AwYvTSB9RvoDvCqhz3?=
 =?us-ascii?Q?WaG1WjFvhXuciMhGqF65Li7uieQl3RPDvgq+X4nRLD81d5ji4SqwmxrBwfsd?=
 =?us-ascii?Q?FEe1wA7fpdKXr5ksB7WnFlIpBlWIKJaKw90USXWbvepNKj0ua1rUIlss1roM?=
 =?us-ascii?Q?zF00Bmkt+j9S7vqLmPlDW/zwhSdmCBzkDkbyDf+f5YyeZqZmdSonJHMiPSPb?=
 =?us-ascii?Q?uXgwQ6zNp5y3vVlfIzx6qrFNVDCYCowF6KmHA3HbZzn3rO2lsa10zxDQsf7N?=
 =?us-ascii?Q?gR8ZvsQbC2eJQb2iTCupu7sa+9dW+cyfiTpOFf9u+s5mCJ2Jdy3YSci59wIc?=
 =?us-ascii?Q?AO3my9KAMYyy5n2pUcGmgbWzAzb8DroCzuvCTp/PzYp+Z5eNMVdIF1ZXt9aQ?=
 =?us-ascii?Q?oO0C3QDNjQIjSb6WnfA0wbxFlsbTbq9SuA928Jez3ZgNzHjQtFRmAEgKlIkj?=
 =?us-ascii?Q?xbv1AWlzMcAwmpSZm78zFA0J7C2SFg9uaqevsjoPvMYJppjQCCiaEsNQ3DI6?=
 =?us-ascii?Q?4I6tfrE6MU8h2AQkPTZRo+JltKPb9BZxcMgEmcl0oHtFKGgq1GU/ZH5rULfS?=
 =?us-ascii?Q?pl1ZeByLCwhu9mhj8FxxgrdmIFnkSGxoH0wkV70X9yPw+tFGU1/SyqdKTCRS?=
 =?us-ascii?Q?M1brnz7ofvETVTI7TeddEaqIEVDezh6KWowAq48QmHmb4F2gUVrwsAKUBxGc?=
 =?us-ascii?Q?wCsfcb6FzXJPpiYeK/Yz0QHUxLPZxU/apV5OcZAZtU8ZqHbwQsf4Rt1ai6wr?=
 =?us-ascii?Q?T0P6x7PRX0nXpOSZjvJs75y+tEnOih2jvqUQxUtsJpvCNhJmmZxQR6SJjdUC?=
 =?us-ascii?Q?NY/CzzZxLQAiqlpESssGS6p6EcwfUNyDsv7DM4h+Ley1K1ZqbRp+82I7sqVB?=
 =?us-ascii?Q?e/BT6uec7yIRMckVPX/soRgcy+S5O/XcQ/s0bW64PFBTy3H4Twq0Or53qxEz?=
 =?us-ascii?Q?uBl2csaSLlAEW1FYR1kTJF3DsNe3wXDbNuOZ8+HvE6JQ7b4ckz+wRUJwOqDQ?=
 =?us-ascii?Q?jAiSv7fpk5o293PQS7HAyuKeBOMrrPk4czNWiGOYj/bC7Fh9/P+2JMWzNwL0?=
 =?us-ascii?Q?kA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb348503-5915-44a0-96d7-08d9ca684562
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 01:12:23.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IP6L30hp/gJp1gA7EIx2EyxYmZWMShk+NPMOJPd1g4OpEQLTqt2HcwONYPxpLiq/doV0KcXUCYhoyZEPdDbegw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
> Sent: Tuesday, December 28, 2021 3:35 PM
> To: Zhang, Chen <chen.zhang@intel.com>; zhanghailiang@xfusion.com;
> quintela@redhat.com; dgilbert@redhat.com
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH] migration/colo.c: Add missed return in error handling
>=20
> When doing failover and checkpoint, some returns are missed in error
> handling. Let's add it.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  migration/colo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index 5f7071b3cd..014d3c=
ba01
> 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -94,12 +94,15 @@ static void secondary_vm_do_failover(void)
>      if (local_err) {
>          error_report_err(local_err);
>          local_err =3D NULL;
> +        return;
>      }
>=20
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_FAILOVER, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
> +        local_err =3D NULL;
> +        return;
>      }
>=20
>      if (!autostart) {
> @@ -178,6 +181,7 @@ static void primary_vm_do_failover(void)
>      if (local_err) {
>          error_report_err(local_err);
>          local_err =3D NULL;
> +        return;
>      }
>=20
>      /* Notify COLO thread that failover work is finished */ @@ -507,12 +=
511,11
> @@ static int colo_do_checkpoint_transaction(MigrationState *s,
>          goto out;
>      }
>=20
> -    ret =3D 0;
> -
>      qemu_mutex_lock_iothread();
>      vm_start();
>      qemu_mutex_unlock_iothread();
>      trace_colo_vm_state_change("stop", "run");
> +    return 0;
>=20
>  out:
>      if (local_err) {
> --
> 2.32.0


