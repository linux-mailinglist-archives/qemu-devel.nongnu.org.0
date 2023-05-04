Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51E6F6842
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVE1-000859-SU; Thu, 04 May 2023 05:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puVDz-00084m-7F
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:26:07 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puVDw-0000aX-Um
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683192364; x=1714728364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TB6pze/ql7BdkzvhiNr/G3enMOEUTKQWhBWVRoPEqy8=;
 b=EbXVJlN9eZxAZ0DZP+J6SZxN8wEwtnNQVvFdkP3mgh1w+PT53Ow+eEPQ
 WiiN3Cpe6pHBCW8zWxP/mQZJHk480/fSPgVE0iLWTJSkq/vr6iYpwZBVN
 MKqxctYEjkVMqXqTauylRtwNheDZ9Hqf953v5Ewsk7/GTbp/sVYRLGXmB
 HgNfzgrAv3u94yyZNDrVOhvzi7qrq8A8yJpjaxUh6Iytmexi3j0bs3tiK
 GuwkaPdcIVPeafVK3Sf1qzLFMYx01UC5mqxCzHCKsmmmnccgE7mh3YH95
 7HZu4zs9z3dA7xTVYmOvp9DA5QbXuyWDZKmimxJO3Z1idZJcnZksECELJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348925484"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348925484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 02:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729721432"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="729721432"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 04 May 2023 02:26:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 02:26:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 02:26:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 02:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJYnRRFUKP3vdRTP4TlI+wDdVW87dZ3CG7fuAtEzI9s/IyguTscPUzWkjMZ8JVX3n+2p6F86uuIQxGQpvWe4ihNRKMtL1siVCNP0M5d1PBeoghXSAnx7LTSP/3AFwJw+PqtzuqaNMXetBLx5kFYMVZdD/5w19lBV8tlJrpXkaXNJ6uvlvuRnKHyETAyjCTvWqNCsmwprJTot6r1lJrTYI2tqh3OKpzvnNYnC15L/pT7UAxS7SDwX8KyPJvWqEX/NXh4azAO0Ua+AWNKfiX/ZGjN8nuIU7K5sdLxsXraqIkmo+2q/47NAyDQo08bESdSrcneYWQUcNSwX1V6KdWhcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z9X6iCslslSsFi4DoL1m/6PMZC71Oc6v4W4dqw6WDM=;
 b=KWUEHB5Oz3fkBQM0/3fcHRogGT5Zh5A/KjHcyJn4luvFtDvc8fVdyo/EHc+fu8dygEk5du4jKQ+qQoyrqJM4rcyeVmEuNPu9zlGWnn9dEMcMUYxVr+sigjbgA7EJV2nKNSKX9JHAG/0P8NscWWfJ0a6WQULs8Ai4b+3puia1qFr5F7r/7oRtK2VNRXRH5LNjc4d/YXJyavj5RvpEswW7Sff4a8mpfsV5EwVRHkGWTHfX39Qj+kVmD0jAFcg69UVFhvd04g0ShhdmmMtOwAYQPkprPB0qG3076NLITvOOAhEfHPGesfEloHnsJfBUZEtKgey/lYG4kW37M2n8i/NvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 09:25:23 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 09:25:23 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Thread-Topic: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Thread-Index: AQHZegsem5DlCMGXNUO9DfneGN0CCa9J3/4A
Date: Thu, 4 May 2023 09:25:23 +0000
Message-ID: <MWHPR11MB003179BB59297E26416CF4869B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-11-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|SN7PR11MB7565:EE_
x-ms-office365-filtering-correlation-id: 3af3c6e7-2278-49b7-638f-08db4c817d3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXJOSpU2FTp3bYeHieetQddnpDPKP2XCva+qCR2p6zhHUUjA4j70Fo6UmoLaLUTA9VMve6G2xMAXGt6jrvKI8CAPHx52MnnhbGAcMkLsU5P9arUHZ4qJFC7mD/a++6ndVWwYNH5vK6S7opiTz8qGA7c+876re12ylHVJID9oYkILjzs7yklsZcn96vQsJj5igsZ+niaZ26P52Ngh4tUoq0WENpuv2Du6pb96inYEUjvAWErRPTcHdrBmbW20ycqmhItROk0TOQXqmIeZdPOwI3Wrnd7W+fGJqTk+53VbNgmPLhyHa147ZnpAeDl/uLfhPD0qpmAv05d8a1rzP55cLEtlcSU9eNdny3eQWBR5ppKyJNPLZWrxMhewEVIxFa1K78oY+BpJ/eqqb6gc39XlUCp7jc5XTCciJ7UJf/PCWIhxrMjH8lDtVcok7biaTvPxYHGJ8MVkdYvPnWo5rf2jfo4bXEi3+ExQ/DbEFOsbcqljllmfbbD5Dqi9DqLOD4HT1w+GOdsEQNu9n2potk6c5OwNU1LT8PS/nEwk+TcuPBwndu50GISp1wsGlVR4A4QU5dojnL4VNCIS74AoVWjlkCG6Pqjp4kNZdC9+rs9KAErHa/WMenaQwKtgvr4VNo43
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(33656002)(82960400001)(86362001)(38070700005)(38100700002)(53546011)(9686003)(6506007)(66476007)(7696005)(54906003)(55016003)(122000001)(83380400001)(26005)(186003)(71200400001)(8676002)(8936002)(478600001)(5660300002)(52536014)(110136005)(76116006)(2906002)(66556008)(41300700001)(66446008)(316002)(4326008)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gf2Cr7HUBjifA5FEqFovrX+ZvO5QyDyhrtivJNCT4DqF/9zzdJt8QmP4Qlqq?=
 =?us-ascii?Q?nkyHI+8SMKmQtU3YfJHYr3Jl0RiTMR3PXWvByDr7zbzxswrvFVrbLc2KGv8c?=
 =?us-ascii?Q?faVJ8UHWCRMZ9ZEdTE9pO+mzZ7FSoD/O6Q2TwE4TflIRXiHW/dk05gtTDnKS?=
 =?us-ascii?Q?N0M+6+VB94Xm7gHF2FafW34vTtp7/053pMDHG/xru5CAwA/3wShE/BUAQP2W?=
 =?us-ascii?Q?9eUz0uLghfWtyy3+wlMY3rhOef6l+Hy1Fw1ByX2nKRD9VCdcUt11MNGsJCk4?=
 =?us-ascii?Q?LBYEuy/+DG3XoSLMuy/Zf6C2tJGh9jEpEDGq6F0pqyEAsLriSi9NUKsO748Q?=
 =?us-ascii?Q?y/ZzCnaTDfHa75/DM2G2xrb4krFTxaRnbOizt48ykbxmkwPAKAPmWC6L0JKL?=
 =?us-ascii?Q?lgx2Jaga3KPhcEAgK7DzYvox2oI0765z816hfkLZu5VX2Pt2oHPxK4ecvvmq?=
 =?us-ascii?Q?yH9DUXubKowmu2VXSAnsNlvBMko781WSOsSekgMhSMDkQsjM01cjhTQunthZ?=
 =?us-ascii?Q?/uWYi3i5xD2rHNenwojX7EYTdDCcEcfFKn42stCQf9T16OltTXjRj8YCQIFF?=
 =?us-ascii?Q?U2jH5O8uFeqizuXmjcXEtDauEav5SsyHjcKMyEJ9N0dMJ1K4rzFpkChwNzZ0?=
 =?us-ascii?Q?hQfb5Et7lpVh9CMHk1u8gabOzYoaAddvx7sJcituV7vbnMy9q9DaaunPyhj1?=
 =?us-ascii?Q?3puQ2MC4qjCA1sTTidQwuiOdblBYLzzGo3D7KWk62uAE2ze0TIZbgabKmOKL?=
 =?us-ascii?Q?1MxI5tm8vTsEtWZZ2+g+Sw1iMkHW2UcE7414GctLOo207+9pcpCpd9tPNmRM?=
 =?us-ascii?Q?O+FmzQlD5dCqs7gbiE5kWUhqhd5kWKeHvw8Q/xbNRvSDDx2V/FOuiZNBv6eD?=
 =?us-ascii?Q?iGS4pEHcb7MU8b5VTo+fI/Bj4s/RRHj8/We+TovCQlM0lRqw/1NQsoYi9d7D?=
 =?us-ascii?Q?XqibGb5RpiavmwgR+a75MwJHvU8qcx8Sm7amFl2F4pbPu9tMYHvKzrCJx/pE?=
 =?us-ascii?Q?EP0NGz1OpFwZGlNW43+918jXc02iRP7WKy0vQPXkktcFbl6KEtZlyJiNozra?=
 =?us-ascii?Q?iNfyEGjCqWslwL19Dgqbp9fuqYvYbbN8wABqhxVwBg1NTFnmq4PrmFOS3jbg?=
 =?us-ascii?Q?l1BKBanCmQB1tFqN1mHe2vHQIjd8XlgqzmTXanbX0plmKFnsEF9acbwRo3kE?=
 =?us-ascii?Q?VTl+4s/SNfpT8DMGkhFWAitqcj0dGynZHpZ7hOJkiaICXnIBiEw8LyFRrnz8?=
 =?us-ascii?Q?/ovPbLGvSil/yTnFc73agLC7fWT7mhOfx9tge6O9lfm54bE4ubCDEe/qTu10?=
 =?us-ascii?Q?CzS0l9tNM0ixmKgvJCgn7R8lwSxE8wLZzUt3el/wV03uasESpDp0Q018iHJ3?=
 =?us-ascii?Q?1dGuVjaN1JyX61lVsUGH/0v7KLhBs9TqWRo+9naTew4dHAUYDwTlmOWOS+gU?=
 =?us-ascii?Q?GJ83vO/G5oIA8OLuIxNd9pFlhDWY8kktTJfwHSrBDe78rQFG32tOS4btSPMm?=
 =?us-ascii?Q?9cGZLRyjWIxOvF6YKGillveF/7OgzlNeKr8973Az0yOP3qm3kdGOIByTZ4Zn?=
 =?us-ascii?Q?WNeOtocQOtqg6lKA6AhKbUohnqo/meKHqJqb5c23?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af3c6e7-2278-49b7-638f-08db4c817d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 09:25:23.8261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUadlrZJtV3rjCQBwOpDJm3BxXN7zN2GypZp//0bssowgsoEgAGfJD8w1YXkYpcFiZaz7YPNTTPGRvrot7EHWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
> Sent: Saturday, April 29, 2023 3:49 AM
> To: qemu-devel@nongnu.org
> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Peter Xu
> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> Subject: [PATCH v4 10/10] migration: block incoming colo when capability =
is
> disabled
>=20
> We generally require same set of capabilities on source and target.
> Let's require x-colo capability to use COLO on target.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

 ---
>  migration/migration.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/migration/migration.c b/migration/migration.c index
> 8c5bbf3e94..5e162c0622 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
>      return -ENOTSUP;
>  #endif
>=20
> +    if (!migrate_colo()) {
> +        error_report("ENABLE_COLO command come in migration stream, but
> c-colo "
> +                     "capability is not set");
> +        return -EINVAL;
> +    }
> +
>      if (ram_block_discard_disable(true)) {
>          error_report("COLO: cannot disable RAM discard");
>          return -EBUSY;
> --
> 2.34.1


