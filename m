Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992A6B6DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 04:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbYmp-00029X-GK; Sun, 12 Mar 2023 23:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pbYmk-00028z-L2
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 23:23:44 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pbYmi-0000PW-OK
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 23:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678677820; x=1710213820;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E0lYsVOx5LFvT5hhXrHpoVQj+CuJARGAaIduiVj7G5Q=;
 b=XVnoVmXHjszST5oOpv+5D63Nx/n0yk9whDUwej0XTER/98ImEwrIKEvK
 TTTTDOYsKHnubg/vgw0wtLTvRb3dnk8SL5OMMaZXLoMGevT7wzeetRz3O
 8/wKoKG5kjtutJIsISYcLmiiSQ+lLqTkXqZoy3uqq/raUAt2HesoN0tKu
 vwwYzhj4gH7Tg3SzafHpqG19HjcnRNM2++vl3E+1u6tO+ODu8j/1kLXmW
 fxvkvZNARcf17e1vadO40QeOcuJZF66SID4CFwvTiAaqCEl/tHo3ynyiF
 dKJPGPncxOFQEvyQaHBucC9ogSkez4W7Ul2zKPvwNWwGVWDK5Xj8H90kK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320903171"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; d="scan'208";a="320903171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2023 20:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="710962285"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; d="scan'208";a="710962285"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 12 Mar 2023 20:23:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 12 Mar 2023 20:23:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 12 Mar 2023 20:23:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 12 Mar 2023 20:23:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 12 Mar 2023 20:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXwfkG4ibN3GJwL8iNjKoOX+1A/6d2Y0jVLvLvSvHfIx8WvGuplztbNnJqoYPu9aEkYwccahy6KFR1d7qKjPOVOORga6f7F3RM+TAzU/rYkCPllT7jXcsOak5Ol1E1anh23GjggQuhXMgU2MOcdQhff4Ci980rcItDTBCMmWFNcKEiy0Z5XfVwHuaN0JiEFUgcbZiwBziLiRI5rTilZ01FFUB7nIQvBfjDquL7pOC/3cBmK0FGFLH4lphid6BDIU1ezfobkXIA5OeMD7YyNDXOBsCEdalKWeM88OZrny9wqoC2JvxBW4o3ljpuxGwvDG68dhJj01F2c7nm0pNJGSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0lYsVOx5LFvT5hhXrHpoVQj+CuJARGAaIduiVj7G5Q=;
 b=gZkb9tjhVaa4mJh4BnZCba8l6BLCGwDPoREs1mkq9QPjO1Nn6mq2yh0MQKmtk0f/ldCVG2kISfqr+XF632qzHuZ8iaL/L14mpCJy6f2yoB7LT4KiSqPwow4/Wnnnhuq323Cm0o7dwlczIksHsfwjvBgCeWxdtTRID4cEiieOs2/0vckI8CVTAZHpvGOrElr3WUtC8ixUulDZfW75lyDZh5qzaKnG5DI16cXYMZc3PKmhsuyyp8qztGSI5E/7rl84kMa9io+jGm+ItCee8RqapsNryrxPzWjofkogHWhz3NhcGhzFjqciYMAcNp3re/YAqqUFwkE9t7hvbh0A5GtkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 03:23:33 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::d6fc:3f71:9b08:2883]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::d6fc:3f71:9b08:2883%6]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 03:23:32 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Peter Xu <peterx@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Topic: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Index: AQHZUmkAJvqz/de/VUKAoez6hBj/y67yiciAgAC9meCAAM0hAIAD+/QQ
Date: Mon, 13 Mar 2023 03:23:32 +0000
Message-ID: <SJ0PR11MB67445BC98BB16305475E0D1A92B99@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
 <ZAnzkfM8QSth9bXc@x1n>
 <SJ0PR11MB6744FE6A53BEB85BD7FD452E92BA9@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <ZAs+sPoujXt7hr5i@x1n>
In-Reply-To: <ZAs+sPoujXt7hr5i@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|PH0PR11MB5579:EE_
x-ms-office365-filtering-correlation-id: a5d29820-ef78-4c4b-3597-08db23725297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FrNvPvQboFZ/rZrzpHMLd1OzyXQifBpbyfK1MXPJfGExJkQjou1Aezx4xiOS+Z7LePhm9o1R9s+T1bWdj2hMqIaf4AmKSIdKFC+cOTCUXR+C3ndFDFZlRPSJD4+1JExiCuvxDsbiivnJqB8cLDdrmUfEG8Yd5gqkk6vJ1Q4O8ZfIL7eNH1tVHVo2NNMOJpV2Y1Xpe0sp4QVIsTCbM2oHPsel7XdNMb/WfGbyRgmaBQ2ocYfn0rH5wht8s2rIaWk8MHgyOqsfNKufMFtXnPNCjMd+LwpCVFT5euF02giV5azXVnFlSsOdgAAQdjjSWYnJWV+o2L0MkFI6mzLyxAzzWxUr0l6vBtzR4zzZ/C/HbPjUOLgCZcb4vl1ospNf7AxCMTIjHP0LfqQvwGUz9G7OlHU/7PpePkBGheV5cZP9c6H2ziHm5i94gwUBepmfx/1e42mLL1NydrQHCJPqy3ro40XZn+8gbIUNgXK+aZRmuqxTIMy4PZtyf38HNvAfyMMlNzUq6fosY55iWqKedvknT+YNCZqZUuzzR+0HiruhJjVLSUpZ0SMp5keB9rENk9888agz16Qa1ijBAvA8JIvOqF0qYizi932Czuue5a4xhAZbEsYH67oFTBAvrxS6ZShrbuK+kjUW9pOnVO4HMLtIA1jq8Dwmy9gNjMfgnAu0u/Lqc1qAxSa8/lFGLYEFgyXY1JgE/TC/ix3q0rbS84Vjeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199018)(186003)(9686003)(6506007)(26005)(52536014)(83380400001)(8936002)(38070700005)(82960400001)(38100700002)(4744005)(5660300002)(66556008)(55016003)(64756008)(66446008)(66476007)(33656002)(4326008)(8676002)(7696005)(2906002)(76116006)(71200400001)(6916009)(66946007)(41300700001)(122000001)(478600001)(316002)(54906003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHhLTVJYcWU5ZGdXOGo2VlBhbVJkbnhXNTVIcUxHTGFxWmo0a1JhVTVVWGQ2?=
 =?utf-8?B?eDI1bm9MNGJIb0ZRMzFaT3hTYS9IZ0dqYnFEbEI0S1dmSkY4MHNyWjFGK1BN?=
 =?utf-8?B?QmtkZUp5TGtIcnNxTWdUNjJQR1NUMHp0WHVxa1Rpam5Kd0RCZ0hSOFQrQUZL?=
 =?utf-8?B?S0wvQzBmcEtscS9xVzZxeG5MTVVLY2Q3NVZQNm0yQXoyWlRmempJU1FJNklM?=
 =?utf-8?B?L0Z3dWpiaGlsemNuNzZ3cmxXK2lBcDZ0ckphUzdHTXVHZXJiRjZobWFnQjlL?=
 =?utf-8?B?RndNVDZOeVJwZ1FxZjVhRjN5dUNvQVpTSnlPUEpjaWt1S3lIWWd0TVJuMFFU?=
 =?utf-8?B?Y0Z0VkNYZEdWZmxxSUNnMEo3WEhIaXBqWWI5MExVL294RitMNjRrL2QzUmFM?=
 =?utf-8?B?NWFZeGVQS0g3em1UWjlhTFIzY3dQV2FndWdiNHVDM2NDWVptUUc3WVMzdXEz?=
 =?utf-8?B?VHlCRlJsa0I0WTFFWUJtUzYya3pQQ2Ftb3RkRTQ1NEl1NnJTVTRPa3ZEcWRw?=
 =?utf-8?B?MXErdjZWdWY5bmliemZQVFFadHZLcXVNMUYwbnQ5TVdsUG10VzBUV25CUy83?=
 =?utf-8?B?U0RsZ0pjUmVFSGsrd21vRUMvbGlialRETFk0RXBsT0pBN3UxaVgyK3JxSGVY?=
 =?utf-8?B?U3o5c0ZvWTE3bS9YYVhSeUF1S2pXYzVKdVdsQjVXNTBERGI5ckptY3l6Nk1w?=
 =?utf-8?B?TksrUXV3aDRnamwvcXprenhjTkxqYkFBR3lkTE0ydHJVSnBVR3FxV2lpb2I0?=
 =?utf-8?B?NkNJM0huMEsyaVRvUStPUEcvdFNlV29WYXlSdFNlZVBmWHNDQ2V6THNoNnNx?=
 =?utf-8?B?MDY2cjg4ejVvMm5CYnlXb3B5SFdjRUFmVFBzNGZtOWR6STZ1cnRhaDBWTmQx?=
 =?utf-8?B?ZTZlUmFxSFdzZkVOYXZwejRBb0NXZC8vVkpkbHdLTU5HWFpFNGFYZ3JzVmFW?=
 =?utf-8?B?eVZsckh3M2FOYkpvK2JybkRDU0VBcTlnaTE3L3pWTjN6akM0UEt2ZldSaDNE?=
 =?utf-8?B?d3NqQit1SUxCU1Qvc3RvMmxQWUc3N2FrbW05b3hEa0VQcEZVeWN1NDNMUDZN?=
 =?utf-8?B?aGNPMUMraHExTFJJd3FYWnVzSFlyUThTZkNBWEs2VDRxNmdHd05Ucys3OXpZ?=
 =?utf-8?B?c0RGM1pBZVZnam9GK0kweFRWVE1GbVVxWHFkeE1TVElTVDY4SFpmUVdGZjZq?=
 =?utf-8?B?Rms3NlFPby9LR1lXV1dQUVgxVEF2YXFLQ1kzTGVZL3hZbXpuRHArc0tydkEz?=
 =?utf-8?B?QkNKTmNTVmhrazZ5aGMvemhXcmNCUTR0VDlKUFZ1T0h0WEFWcUFhT2hqK0g2?=
 =?utf-8?B?Ynl1L0pBSU1PZ1Q3OGdwdWFUbU9zTVIrWHgrdjNlMk91eXJjYWpmSjh6ZHN1?=
 =?utf-8?B?eExwVUpMUUs5ams5L0k4cTMyNk9Fcm5wZGtXSXY1M1laR3BwK2hxV05YTXFM?=
 =?utf-8?B?dGRkMU1kZ2JzeG9JZXp5S3BmZ28xS0w3NDQ0MnVpaFhXa016L3htSis4VVBQ?=
 =?utf-8?B?Q2hZUHNnZmdBWGlSbEUvK08rdXpScDlSbVNIYUYybkVzTnkzOEV6SWN1dkRR?=
 =?utf-8?B?WUg4eEwvcUpVRnQ3a2J0TUlDTWRkUkNIckJYdldXekVwYkJVZHg5UFI4K0l1?=
 =?utf-8?B?YlJBNzl6Sm9oR0hjS0dOMWxNOXgrOE13M0M5RVNPK3JOalRJQm9Fa2Q2T1ZK?=
 =?utf-8?B?YTJKQndETkNMWUt4UFB0dUZVV0d3d0g2RHZnOUNUemxXeWhJaVY2K1M5elZC?=
 =?utf-8?B?bXpLYTVQVmE3VFExZTdjbTEwNStUdHJScStpcktqQUlKM3NqeTNFTzBuQmor?=
 =?utf-8?B?Y1VzUzljZ3M5SkVqNXRmUnRwRDBRd05HS1lCY3Z2VnZWNG5DQ05HRWl3anNv?=
 =?utf-8?B?bld1bmIrMWN3QTE1cVR3Vkk4QVYzVjdWeG5FbHhqSkFiSG1JaWQ3bnkwWDhu?=
 =?utf-8?B?V0xwam1LRUZWNngwdEU1SnlBa2phdlp0OHEvWHNmSGdIMTAyaGM2N1lYRG1H?=
 =?utf-8?B?czlBbTg5VXJWSDhITmEvT2FJRHEwQmo4T21rR2hEMGM0dDlGMkFqRVpyOXdS?=
 =?utf-8?B?TWRlOC92Q3R5RGJwYS9LK1Q3d1dtSEZDcEhQbXhielNNUnJ0NjVmbldHUysz?=
 =?utf-8?Q?CAgmwb0xDA20HFSh+YBMJWQ0u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d29820-ef78-4c4b-3597-08db23725297
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 03:23:32.1473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+qH3Zn/8kQjyGCp4Ojq4eTvjG4ozFcSMrVvLKkA9FkDTZ1HWGOJcQgGilXTKyCRGXlKdFAKHgrxK6R3t5etX0r8iZX5q8R9KVr+y/4MRDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5579
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJl
ZGhhdC5jb20+DQo+U2VudDogRnJpZGF5LCBNYXJjaCAxMCwgMjAyMyAxMDoyOSBQTQ0KPlRvOiBE
dWFuLCBaaGVuemhvbmcgPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj5DYzogcWVtdS1kZXZl
bEBub25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsNCj5wYm9u
emluaUByZWRoYXQuY29tOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBlZHVhcmRvQGhh
Ymtvc3QubmV0Ow0KPm1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tDQo+U3ViamVjdDogUmU6IFtQ
QVRDSF0gaW50ZWwtaW9tbXU6IFNldCBzdGF0dXMgYml0IGFmdGVyIG9wZXJhdGlvbiBjb21wbGV0
ZWQNCj4NCj5PbiBGcmksIE1hciAxMCwgMjAyMyBhdCAwMjozMjoxM0FNICswMDAwLCBEdWFuLCBa
aGVuemhvbmcgd3JvdGU6DQo+PiBJIHRoaW5rIGl0IG1heSBicmVhayB3aXRoIHNwZWNpYWwgZGVz
aWduZWQgZ3Vlc3QgT1MsDQo+PiBFLng6IEltYWdpbmUgYSBndWVzdCB3cml0ZSBHQ01EX1JFRyBh
bmQgc3RhcnQgYSBuZXcgdGhyZWFkIHRvIGRvIGZ1cnRoZXINCj53b3JrLg0KPj4gTmV3IHRocmVh
ZCBmaW5kIHN0YXR1cyBiaXQgaW4gR1RTX1JFRyBzZXQgYW5kIGdvIGFoZWFkLCBidXQgdGhlDQo+
PiBhZGRyZXNzIHNwYWNlIHN3aXRjaCBtYXkgbm90IGZpbmlzaCB5ZXQgaWYgZ3Vlc3QgbWVtb3J5
IGlzIGJpZywgd2hpY2ggbWF5DQo+dHJpZ2dlciBhIHBvdGVudGlhbCByYWNlLg0KPg0KPklNSE8g
aXQncyBmaW5lLiAgRm9yIE1NSU8gUUVNVSB0YWtlcyB0aGUgQlFMIHNvIGlmIGFub3RoZXIgdGhy
ZWFkIHJlYWRzIHRoZQ0KPnN0YXR1cyByZWcgaXQgc2hvdWxkIGJlIHNlcmlhbGl6ZWQgdW50aWwg
dGhlIGN1cnJlbnQgdmNwdSBmaW5pc2hlcy4NCj4NCj5TZWUgcHJlcGFyZV9tbWlvX2FjY2Vzcygp
LiAgVGhhbmtzLA0KWW91IGFyZSByaWdodCwganVzdCBrbm93IHRoaXMsIHRoYW5rcyBQZXRlci4N
Cg0KUmVnYXJkcw0KWmhlbnpob25nDQo=

