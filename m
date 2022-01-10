Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA0489348
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:45 +0100 (CET)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6q1o-0008JT-Cf
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:27:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6pyF-00073g-4J
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:24:03 -0500
Received: from mga04.intel.com ([192.55.52.120]:24573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6pyD-00030n-2m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641803041; x=1673339041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ViOPYSTP+aDKEr/vqmqdWQopRmwMM+g2/P/QmKiurr0=;
 b=YrQcKkLTjf9U0+cShgFIh34I6cI87SXF9SXogTQLuLjV7llB6mzqhxQ2
 ew5v2I492fsYHwSfEnN6UNHSJw2HtZbRB6dM6itIGaihFJ04W1etiV9GV
 HSOLLC/QGeTunSHpois74NMuCzPhj/spa16rypb3hIF9qmBnlqHhlMUAF
 E65GcUGzc5RcVZTo1ay3+WJYxnm5zObQp9WNVzjvrUqPHBMAMo5Z5SuBJ
 zcJm4r/cZ91LTVvRqNXn7zYALIDRrnxuztuQIqHGE7oNXylP+3d4CdzaS
 WJxuXuzy20Viwb6gGIkh7gF3FyCkQFxkCYqFQJnqS636SuqXnxSRXc/vQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="241992706"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="241992706"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 00:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="575748826"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2022 00:23:51 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:23:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 00:23:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 00:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEjV0+YfQLDHNxu1D8wAurygisRIwiLlaKBXyWW+7m3x1Q7QR5oZRbV4bxQCz+Rn1cfxLX7Xh2bK5pCcQDs03YfCOmG1UZ9krUC6BNB0CXCeoP4AoKQT+t+Q+FncBFtGuRMVZpT924ap3Vt7tgDLIGgXYLVvOTUQ7I3GLZ4O8gywnUYzp95L8HLvzmQ2zyeh1pCXcsix6HLyiNVyl9HOkemVuYjHZxNbwJ1lm94L4qIIc1O7215cfo+qJPybeWgQGDQ2cdzrKXHguwMqGZpZgYMPlT+rkwYePWp1bCqV+Hgt7t7Dz44/XmjXjam/PeWQQy4Qq4gVZ5TlL4GCnSmfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9w833eB3nB4G0qQvlHqduCe9yQArVBEdfl8Bm2k4a4=;
 b=ZjzjWshdnUgwwcUMSVDpDs03GR3n1bNblPVA6uI39BC+7lkrurREv7AIM5u3phk96iFaVP0+V04N7VJbyU0Odw5bDd5YcAGZCM/XL3UiktuxABeI5pkXhB7Z5oeXe0rwv5ekw8K8uSU9bec06pnT8NvsfSae7J7Thg2AL6775ns/P5vcOywGZw2J9Z3o7x2CDb9LTj6Xbf/6O6PqGwGzmh57srqI/nNn7A94CdVKQEmPDj7eX/7X7eCozfZ7mGPLmqw73IWxUP1CVvKB1d7XEGgUvPWq105FiaeyH8B6HhoWtAVfSuxnTVuHoFw04YGxXRl+sjMIgkW0Z2fA8wmKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1649.namprd11.prod.outlook.com (2603:10b6:405:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 08:23:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:23:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Thread-Topic: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Thread-Index: AQHYA6lmt6EqhUzLCEms3y0n9nyZfaxb7q3g
Date: Mon, 10 Jan 2022 08:23:47 +0000
Message-ID: <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-3-yang.zhong@intel.com>
In-Reply-To: <20220107093134.136441-3-yang.zhong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 372d9189-d645-477e-6c7d-08d9d412865f
x-ms-traffictypediagnostic: BN6PR11MB1649:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB1649186EFEB2AB2EAC31E7008C509@BN6PR11MB1649.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zRwetS5SyxLUm+Yss8IZZh4NeKQi7MH/smV5Fu7T7zgdXQYAJQntXO8yfR87AUaOlJiRcggYmMt5jbnHBSQQgSNKyLPXhwEtiV5TSu8ShiyNrfXnVMRCvZbzZt9bivhU0EIoGEDUrdXO4lJSmPmnzAQX59Z66RfAQmggUQcbaSfHWqPlsrdTjJQcUMWU/2WXZktfeWUiNZ5pfheP7GUPfssTv/XoZPlVrc25q8d7wUvYDNZnj9LrvC0AtD+hOib5lgerO9GtDagrCMQDo0AkaQ1lpx4F8yhHMHUJiQ4DPvvMLRtjxR0JojCmThNMUMQTe+5ZRb9mU9xBoid76NnF0wLoeCVicNfhy1t+yr8zviv2LGhjG6BB+w5emYz9CFIOcAKWNtPOi/0GrN0B0DAzmj0rl77tNVWDRduHkZ5+LQ3XwwWQWv6SsIZNPewClp2WD3gqR5w7mLuAEhQAiwXU3E1Z5oeaMgAjGh85Kcx7a7aw1C7lpubyLmVuhW+6aH3rqfFuNPSqQ056geFN1I5PN9y81JkHAPV+D39QmrACnL+q35PnktlsT3zcIIC/VwjPsp7/mwKl+uvwmCxIJPcHuWWjV4k/ZMNEBssuD739/eQf7Tq6JQg3HHTzhzTr1wlpJxtOJ+Nrb+GBj2bjWHb3JCKNNcFLg4FTvI8vVan3KIipYLkd6p7HRBi2UjynhH65w6qlmN8X7JZmTN8Dcrzdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(122000001)(9686003)(66946007)(76116006)(33656002)(8676002)(8936002)(110136005)(38100700002)(4326008)(55016003)(186003)(26005)(5660300002)(82960400001)(316002)(86362001)(83380400001)(38070700005)(71200400001)(508600001)(6506007)(66446008)(64756008)(7696005)(66476007)(66556008)(54906003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?API05/m3WJpeHUpqCOarNxUNJf07siLjaEVRSJcuKRwmfQH5jgOOV224zurQ?=
 =?us-ascii?Q?LoGD/VPslYEcF1HmXhKdMv/DV+UtK7+OcLnarWB9ebuwDcMKeGLU7ddjC6h9?=
 =?us-ascii?Q?mWpCtVwKxmYwoMCPvSc1P4DHaq1E8Yf031dUtDmc7tCHDDbTy40/AeoDMJsV?=
 =?us-ascii?Q?PYfNuBeH+zZKOXrpi0uQp1GiqPreWGoah1Ndb9a5ELH08JntItftVT1ZTNx3?=
 =?us-ascii?Q?utCkt4pC7POhBFKnhZyyupxLOtT6FpYkFjU5K0pi2rEKFcP//6LtLQcC7YaS?=
 =?us-ascii?Q?DkTCIRrdJlDpXt0wMBP+E0Z5ADz8jgOLMXfnrS8ZYV0FJVLKa/j3Zhyi1Ywk?=
 =?us-ascii?Q?fLhXVCRlS5aEQdea5wXSnpFuX2aBcNZtR8Oi+WCgEmNR7DhbSvqURYiHFgZM?=
 =?us-ascii?Q?q16DkKe/z+jaQfdDcOSl6IzyOBd+5QG+jcbDjQdIQEupz24w6hMn5WE+mYlt?=
 =?us-ascii?Q?H2gErnwAr7e4pY0n4qMZtRGVvn2ySx8dwmycRO+zI582yQYjyl6DoJ05du3y?=
 =?us-ascii?Q?wtpdC3TymqT/dzhP470B1jL5K3t9bOdxgnaC+6TS+jAkWbTVIfVX8PZmndw6?=
 =?us-ascii?Q?Srh/meJqZrV6+ytvaz342RqlIhBfXMm7pKSDd/8spGekzVrlwCYKZnwBbmIb?=
 =?us-ascii?Q?fk0mL48xfXSLfmkz4hHl6YyA4o6BqLWBE2PLZ5mx6EKAn6qcfLWUQu/G/dy4?=
 =?us-ascii?Q?bhEeHTBNLGDyK3e5ZZ5XpMtspffMR3c7mZWcdCXRVafAei25Mc2TJ4pOJkQz?=
 =?us-ascii?Q?ujrJDzl64BSwrfLmiT/FbL1ANg7v4uR6BgaqHvBUF+ZE4irNgsRCW0LnsJCT?=
 =?us-ascii?Q?kcn7hIzf4/k66AUg2gL3ZNdiSk34dhCiaJR+EtFciUS3Sm3ouR2Mo6D32dRE?=
 =?us-ascii?Q?88zv9kV6yxOZu4t9PBhKP/LjrvR5LiHZoM6QL8wsMorpGf8Zc5WyND8ZwFDL?=
 =?us-ascii?Q?/83eihD+PKR79dr3dl+/H51rjaVIImGKM7j/N+fNxtpvf3tbjPoOJfA8LgVt?=
 =?us-ascii?Q?D7uWBOO6wZWtnlODfckIGTcLazujdJp9r0ekyCHDX1ZCNJZMo+15vUAcYmr4?=
 =?us-ascii?Q?cDlHLGIg5GpGTTxGLFeetfbPIuLYQo+Sx0dYyVmWmKCEJ29ycO07l8w16m39?=
 =?us-ascii?Q?lfK62kMVxkthcG6PGIdDHCpd4rTrakkRoB1/8AjaABIjj8OaaR/MeuCyvgNE?=
 =?us-ascii?Q?9o2G3gIMP1CpveA6m+z258g8Ycens8ENmvllNGbe8LHPEjiQ7ANtz6+Gb5Up?=
 =?us-ascii?Q?rhV4jc+M5u5WQVC8iRWE1Mah5Z/Qd0o+xnX4+QHe2i271st3AoH18QgElwg4?=
 =?us-ascii?Q?Sed87lmUh69TkxBqvY7di/4AWpSuVrJHJwblBf+qOq2r1Bnw+9KxvLvQD0O3?=
 =?us-ascii?Q?p9Jr7tBQg1SJaa0Ed8R3teaQo+E6tSigizIYlHXciEKf9ka8YGYTvjdbIJJX?=
 =?us-ascii?Q?jXx3uaTR1qaGgchIiNshSLXxFKyOosa0r2Tmya2NxSKqxr77/JoAi6uLSrYX?=
 =?us-ascii?Q?+DPXV+Gv0bL5aduLSEd/q+AxSHnuWxarF/QdX7Jh3ecm4tz0CdZkyv6AwqWa?=
 =?us-ascii?Q?++ugvACd5pVCJIjfOAmjDLK14s90dD1bqbS3nET6pDZkMFqnaewbJxL4yRo7?=
 =?us-ascii?Q?ewKYEz5Yp6I4dAKzQ2ivACA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372d9189-d645-477e-6c7d-08d9d412865f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:23:47.7809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnpvT+VC15lDktg07JUHpGzedJdhE0wDgU8+dxx26chOjDJ1DLoohDrKuDiZpec61n6sLD2HYqyCvDaDgFGEGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1649
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=kevin.tian@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Zeng,
 Guang" <guang.zeng@intel.com>, "Christopherson, , Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Zhong, Yang <yang.zhong@intel.com>
> Sent: Friday, January 7, 2022 5:31 PM
>=20
> From: Jing Liu <jing2.liu@intel.com>
>=20
> AMX XTILECFG and XTILEDATA are managed by XSAVE feature
> set. State component 17 is used for 64-byte TILECFG register
> (XTILECFG state) and component 18 is used for 8192 bytes
> of tile data (XTILEDATA state).

to be consistent, "tile data" -> "TILEDATA"

>=20
> Add AMX feature bits to x86_ext_save_areas array to set
> up AMX components. Add structs that define the layout of
> AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
> structs sizes.
>=20
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.h | 16 +++++++++++++++-
>  target/i386/cpu.c |  8 ++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 7f9700544f..768a8218be 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -537,6 +537,8 @@ typedef enum X86Seg {
>  #define XSTATE_ZMM_Hi256_BIT            6
>  #define XSTATE_Hi16_ZMM_BIT             7
>  #define XSTATE_PKRU_BIT                 9
> +#define XSTATE_XTILE_CFG_BIT            17
> +#define XSTATE_XTILE_DATA_BIT           18
>=20
>  #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
>  #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
> @@ -1343,6 +1345,16 @@ typedef struct XSavePKRU {
>      uint32_t padding;
>  } XSavePKRU;
>=20
> +/* Ext. save area 17: AMX XTILECFG state */
> +typedef struct XSaveXTILE_CFG {

remove "_"?

> +    uint8_t xtilecfg[64];
> +} XSaveXTILE_CFG;
> +
> +/* Ext. save area 18: AMX XTILEDATA state */
> +typedef struct XSaveXTILE_DATA {

ditto

> +    uint8_t xtiledata[8][1024];
> +} XSaveXTILE_DATA;
> +
>  QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) !=3D 0x100);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) !=3D 0x40);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) !=3D 0x40);
> @@ -1350,6 +1362,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) !=3D
> 0x40);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) !=3D 0x200);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) !=3D 0x400);
>  QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) !=3D 0x8);
> +QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_CFG) !=3D 0x40);
> +QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_DATA) !=3D 0x2000);
>=20
>  typedef struct ExtSaveArea {
>      uint32_t feature, bits;
> @@ -1357,7 +1371,7 @@ typedef struct ExtSaveArea {
>      uint32_t need_align;
>  } ExtSaveArea;
>=20
> -#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
> +#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
>=20
>  extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
>=20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 47bc4d5c1a..dd2c919c33 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1401,6 +1401,14 @@ ExtSaveArea
> x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] =3D {
>      [XSTATE_PKRU_BIT] =3D
>            { .feature =3D FEAT_7_0_ECX, .bits =3D CPUID_7_0_ECX_PKU,
>              .size =3D sizeof(XSavePKRU) },
> +    [XSTATE_XTILE_CFG_BIT] =3D {
> +        .feature =3D FEAT_7_0_EDX, .bits =3D CPUID_7_0_EDX_AMX_TILE,
> +        .size =3D sizeof(XSaveXTILE_CFG),
> +    },
> +    [XSTATE_XTILE_DATA_BIT] =3D {
> +        .feature =3D FEAT_7_0_EDX, .bits =3D CPUID_7_0_EDX_AMX_TILE,
> +        .size =3D sizeof(XSaveXTILE_DATA),
> +    },
>  };
>=20
>  static uint32_t xsave_area_size(uint64_t mask)

