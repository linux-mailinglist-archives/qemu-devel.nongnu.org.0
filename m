Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482D58F84F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:28:48 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2cZ-0006Er-8q
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oM2XI-0002jK-3j
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 03:23:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oM2XA-0000Hw-Ov
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 03:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660202592; x=1691738592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wX0810zYdAgqvAW4/kFrN5A69tDRI2gGWZVvAydVcGU=;
 b=EDqlI4oXB5eKsNPFoDsZmD17uJ3AUK4DcG2qlLOydHiLFHU2av0swYRj
 ZYLsvyOVfGsDqkFBweVKYKG3Z7D+fssh9n0rPHMUG/WScaD74grmW8S59
 0AyFYEnPlhDPLpr2bHx4LqdLTZ7g0msxxaOfPF3Qqe0dmmfd2xjeyxZii
 krycVQpb1h82T/kzYaUKKo4Pwp8JFukAAkV2Xr6kYvqVBMbSUyVf2kVaA
 ssdFEqp8rR7aoJu6LTkNOW1+JZDdvWJo3kQwYFAnBRN610LIztanfj+x7
 JcX0/7Vs4i+hA6hdQrAIVXpL9AMoELMBiDYGVplaGqQufeZQe1Xt6lhQr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="291280364"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="291280364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 00:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="665254078"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2022 00:23:07 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 00:23:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 00:23:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 00:23:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 11 Aug 2022 00:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlbBEnGqDge1n1ej7KltldDw5ADM6jVM0TJu7tiMiRXDlNRdhUwHf9u/L1lL0+thLQjA+1LcycpDe7pHM1frnpKJ10qg0reZDYsYoxfhSWy7BvGmyXmcU6vH3MAKx7uuuRAlOhERHJ1o1xopG6Nx86/nKVcNCM4i+EiSTFDbH5sAAkKmk7JJVufjJ+hfMMupI4YxWz0jYq4jyCix6g2A14VXn2RuvdgaPn9PS7jR7j/GmL52mgqkWwYrQ3DoNKnP9KVUb4ImeQ99Fa0HraNrJPpw+i/X9KMP8/WxjVISs5SsF2kgClRdsZEVPkKT7WwkZmec/FUel41wF6NH8AelXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX0810zYdAgqvAW4/kFrN5A69tDRI2gGWZVvAydVcGU=;
 b=Q+2XjMVoQKZIv+WeoqnyAxASgEik9mGBm8ezcJ2b5tC5yjlteBkSQsKHItq0B83evUGVJgwRJ/DzOkVnhnJFLJ2LK/sOb16EZvmyOwuEco4wCaJWaJRrQ6oLZ/YiyfwaSSILp1U+PJqkPHrZyNazz/lCWQYyYiJwEaaxdzP3JwDdltaI2A1EQqe8EqkyHVbExmy829FmMWpsKblRdd98D3kYa3t1wxjtmTbgEAPZRpLbXPM+KC+jKWWQf2ys7nEfCoaaZwUd/LsULF49glUPZHhjY0d1IS5L+3I9f1B+pHn75Gam87tW2goIm7SDtzIziKAEPSnguHGV+dkV0d6WPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by BYAPR11MB2584.namprd11.prod.outlook.com (2603:10b6:a02:c8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 07:23:04 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 07:23:04 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, "quintela@redhat.com"
 <quintela@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Thread-Topic: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Thread-Index: AQHYqvtR83p2CXICBUa41v3J1Hp0xa2k+z13gAEx6xCAALebAIACZovw
Date: Thu, 11 Aug 2022 07:23:04 +0000
Message-ID: <BN9PR11MB5465D2D75777C71D3374507DD1649@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-2-ling1.xu@intel.com> <87r11qnakk.fsf@secure.mitica>
 <BN9PR11MB54652B6666F9C3DA62E02D53D1629@BN9PR11MB5465.namprd11.prod.outlook.com>
 <2e872d0e-c164-2898-e5ac-85a359e2de58@linaro.org>
In-Reply-To: <2e872d0e-c164-2898-e5ac-85a359e2de58@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49f212ca-2dcd-4fed-fae6-08da7b6a54cc
x-ms-traffictypediagnostic: BYAPR11MB2584:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lw+J1heiXrZu1lq1LV6V0nS9MyaI2bnKEuvhiWVw9YGpWIlyc2aYkmI5kMR5hjWfwLMWW9+c9IkBBO7CSdt8bxEqlr5u4XwKe3e9l6RmFZVYeoBaHr6cm6NQdAg3zth5SZUbxTdPjVox7BwHmuRpnUMvmb74xylfUupTkD8ySQkqX93xX08xXP+byqFRv0uy3my3oV2rHuga/eqBVVo2EztZjmWcTggzW5NTzziIajiscwC+kAoS+8vl9MBRQ4E/lR5S55pUfw7rsDls4SdHnjkZEEjd5MP7zDCcJYHsE4xm4i/x0Ivcp6p+3pSBGlzqySYiJqFhws1lwus7MEIje8yxCAOLa6gjsEFkgzO7R6DXqQLr+md/VgI0r+WbiyeIWp11UyDXz7Mp3gRbUi/LwRey0pvrRzbhs39GOcpirUmnrEIlh+YoNc1eDlfl2FiuEEYD2Hk3aN4sQx5k9L9P5US6Pu382cZYT5fWWSGHXVUqRofuVJ4Wj2FGmBa+/urFRgxJ+f7XeYjGgIOoOIlgUp756hF2oNaof38xaHo85WRjimuS5iriDSrSbH9rfR39860MLFtzqpfizVB+st5RZLNi9cuiz55tRVjj67cW5KTWJ9gTxE+vAaftZuynfH39oTe6yIsMy9FMOwO1/O78cRsCiKtdmmpP216gsaKoU9y9uEJka+obj9FCsyBF8SJn1iS08+oBg1ezVRhd9aaZKmMAg+OpWfTv8n/vfBgzDcat4pLXkE5I8uc1swyc+elhlOUaYPtMENfcYYhu7k7VpoZvftenBbBzb8x+a2sfYncBDwaUjbhibMvizAEr98OD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(396003)(39860400002)(376002)(346002)(107886003)(83380400001)(5660300002)(52536014)(71200400001)(7696005)(66556008)(186003)(38100700002)(110136005)(4744005)(86362001)(122000001)(54906003)(8936002)(316002)(82960400001)(66446008)(66946007)(76116006)(53546011)(9686003)(8676002)(64756008)(15650500001)(55016003)(66476007)(4326008)(41300700001)(6506007)(33656002)(478600001)(38070700005)(2906002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzlXanVZZmo2eGZadTdYbUtLTm05YWFXcHY4TjM5TVArNDJvUGpQdGlMVTFR?=
 =?utf-8?B?UXhCcStsMnhEdlk0Z3pTUlNHMERKM0VhQmlKeC83TWZocHVnSGl6NHZPaDdZ?=
 =?utf-8?B?YUpmY1p1azZ4UUg1MVdhUkp3M3dmV2xic1FSTnZOazZMZlZyU3lhbnlGTXZG?=
 =?utf-8?B?RjRmMlJvbE5lUExQTVVtdGllUmdvMGZqODNGMDlYa0ZZdTBUcXhrVTE5N3J0?=
 =?utf-8?B?MG9VdThPWHlIK04yVHF1T2ppa2xsQTF4OTFNVEhEY3ludGtaTitoQVRYcGhU?=
 =?utf-8?B?Q2szL3JxRzJvdE1UWDVJaEdLdU5Pb3dzTno0SGxaaHhYdFk4YjNscFVvbUMv?=
 =?utf-8?B?Rmh2Vkp6cnI0SmVmcXdVRXpMeXpueXovaTRqV0czNzNGK1NkNXJtendRSjZ0?=
 =?utf-8?B?RUZra3JhT2JuRTh4Y3lCem1sT1gxZDZpTHpBZ044bFh1RkdoT0twWk9pUlc1?=
 =?utf-8?B?MnhiL3p5ODdYWmh2SlhCNGZIb0k3c1AwSVZEcERPMXZzbkI1RzlvRVVjQ3ZY?=
 =?utf-8?B?QXN6SlJuVDN5WDJXYUlVSFJ0anNkdURTMHVBYTRYbGRHbEF3c2l5NlJPbDJJ?=
 =?utf-8?B?cFdWT2piVkZsLzVldFJ6Ym9ic21aeThSKzJLUFV5QTBuckpvSy8rVFlyUGdV?=
 =?utf-8?B?WGg1Z3JEb0ZjcXI1dElnRk80UmdvYXg3QXpQVXN6RTE0V2pEZWJNYTRwNDJu?=
 =?utf-8?B?dXhWMm1PanhvbGFhdzE1K0V2NkIwbE0wSG0xNTJpU2FrdHBiM0pXZWdSVUpQ?=
 =?utf-8?B?dUZ3MmFFTU91QmUvbTNXK2RlRjBGSEVSc21FQWFsem02YU9vSGJ4L2g2N2ZM?=
 =?utf-8?B?RUl2Snp6eTJJTkJyaCsrbGxvRHdES2VCRHQyTGtSSTBVemYzcExWRnFlWVk2?=
 =?utf-8?B?NVFlTGY3Mk9NMUR3NVVzSHJidXVmRDkvOFB1YUw2SUtiUW9zUlc3ejgxOE5h?=
 =?utf-8?B?VWw4VHNCSkkwdDZiaDhDTS80RCsyVTY0RStneWtqL0lIdVljY3hRT0FPVW4r?=
 =?utf-8?B?bWNmMElJTS9hMEZrU3ZZRDhIRnBHSW5CU1hIdnpUdFJlWGdmSGVZSHJmNTY3?=
 =?utf-8?B?WTlIS3lkMGxieHpsS1dlL3BUQm1DVVJzeGRiZXN6NUx0YlgrcUluOVNtRmFZ?=
 =?utf-8?B?N0lYOG9IR1JlZkJsSHpkQWRrWkpoS05na0toalEzclRzbDNWbkxvcVlIN0ZM?=
 =?utf-8?B?VndHUkt3YXZjUTlQTTdaVXVRY29zNVZveTVoUS9sL09IU2dySlR3UVpna2Z0?=
 =?utf-8?B?UTN5cWhuaWxGd09jeFF4cXFjQmd6aUZkeTRxb0IydjhmWllSUVFwNWlKMWJp?=
 =?utf-8?B?dm1veHFDYkhjQWpaUG9CdG9GTTl0SkZaWHFNcVBvSTJ6UE16eXNsSDJQNlJN?=
 =?utf-8?B?ZTlhMkU2NWxoVnRMaTNNaHpFRmU4OHYvdDg3ak04Z0JCRjZxd1EzK01jempC?=
 =?utf-8?B?ZGdSb3BHajZWcEV5Uit4VWMrNXhUWEN3eXNUZG9vUzBVV2lvZGp5WTJvaUU1?=
 =?utf-8?B?WEFXTkduVVEvYURabnFReGtZb0E2UE9FWnVYSXNiTm91VjhDNjQ3ODE0TjdP?=
 =?utf-8?B?cXNpdEc0T3dyZk1Vbjk5RllIWDk1aC9MUHFmSHdpdUtDSndDNmRPZGxObG9u?=
 =?utf-8?B?TnM5R3ovNTRBelMrN2VUZTZOL3ExQUZDMkpjSWZ3WDBHZ2ZsczJBNXF0WC9W?=
 =?utf-8?B?QkttQUdvYnhOSkRWbVl1ZDJXM3lRYlNYODR1cm9paTlzQnlMdTlXN09NcSs4?=
 =?utf-8?B?alpnSDRMeHQ0OHM1dkZUcVpFZzZIaDJBcGQ1eksrRGdkMXNhYjV6eHlvSXBF?=
 =?utf-8?B?L0ZVMmhMVFhtUXB6dWpPbGJVaW9xR3N5amdvSUNPbjdacFFRYVIzTGZ2a2ox?=
 =?utf-8?B?QTRGaERGWDVyL0kzSGVEbVJFWFZLOS91ZHlsMC9VSWpCeDZlZUVpdVlNVkh2?=
 =?utf-8?B?cmlOVVNYL0I5bWMwekxwbWFXSlhGaEFjM2kya2JiTGtwMWFhVnNia3hoZXdI?=
 =?utf-8?B?Z2pFOEhtLzhmaWh1Q2xCN3N5a3JEUXdxY3k1ZHhlY1loamxzUEw3YnZ1YjBU?=
 =?utf-8?B?YWE0TGt5RE1ERm5NcDNibXptS2diWC9BNGNqc0VWODFRMzNPa3NQMHVtR2lt?=
 =?utf-8?Q?31//47aPI7KhaAJDj8ztMzKQ6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f212ca-2dcd-4fed-fae6-08da7b6a54cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 07:23:04.5503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nppFO/nR1H6lpsnZmaf6ZvEO7uu3RcIGvqycPeq2ySDaAAteyGvjuzXxpOgQ0eX8S7tZglYJgoaXrgcG0groIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2584
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=ling1.xu@intel.com;
 helo=mga14.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksIFJpY2hhcmQsDQogICAgICBUaGFua3MgZm9yIHlvdXIgbmljZSBjb21tZW50cyEgWW91ciBz
dWdnZXN0aW9ucyBhcmUgdmVyeSBoZWxwZnVsLiBXZSBoYXZlIHJldmlzZWQgY29kZSBpbiByYW0u
YyBhY2NvcmRpbmcgdG8geW91ciBjb21tZW50cy4gQXMgZm9yICJ1bnJvbGwgcmVzaWR1YWwgZnJv
bSBtYWluIGxvb3AiIHByb2JsZW0gaW4gYWxnb3JpdGhtLCB3ZSB3aWxsIGZpeCB0aGlzIGxhdGVy
LiBUaGFua3MgZm9yIHlvdXIgdGltZSBhbmQgcGF0aWVuY2V+DQoNCkJlc3QgUmVnYXJkcywNCkxp
bmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0
IDEwLCAyMDIyIDI6MjUgQU0NClRvOiBYdSwgTGluZzEgPGxpbmcxLnh1QGludGVsLmNvbT47IHF1
aW50ZWxhQHJlZGhhdC5jb20NCkNjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IGRnaWxiZXJ0QHJl
ZGhhdC5jb207IFpoYW8sIFpob3UgPHpob3Uuemhhb0BpbnRlbC5jb20+OyBKaW4sIEp1biBJIDxq
dW4uaS5qaW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzJdIFVwZGF0ZSBB
Vlg1MTIgc3VwcG9ydCBmb3IgeGJ6cmxlX2VuY29kZV9idWZmZXIgZnVuY3Rpb24NCg0KT24gOC85
LzIyIDAwOjUxLCBYdSwgTGluZzEgd3JvdGU6DQo+IEhpLCBKdWFuLA0KPiAgICAgICAgVGhhbmtz
IGZvciB5b3VyIGFkdmljZS4gV2UgaGF2ZSByZXZpc2VkIG91ciBjb2RlIGluY2x1ZGluZzogMSkg
Y2hhbmdlICJJU19DUFVfU1VQUE9SVF9BVlg1MTJCVyIgdG8gImlzX2NwdV9zdXBwb3J0X2F2eDUx
MmJ3IiB0byBpbmRpY2F0ZSB0aGF0IHZhcmlhYmxlIGlzbid0IGdsb2JhbCB2YXJpYWJsZTsNCg0K
WW91IGNhbiByZW1vdmUgdGhpcyB2YXJpYWJsZSBlbnRpcmVseS4uLg0KDQo+IDIpIHVzZSBhIGZ1
bmN0aW9uIHBvaW50ZXIgdG8gc2ltcGxpZnkgY29kZSBpbiByYW0uYzsNCg0KLi4uIGJlY2F1c2Ug
aXQncyByZWR1bmRhbnQgd2l0aCB0aGUgZnVuY3Rpb24gcG9pbnRlci4NCg0KDQpyfg0K

