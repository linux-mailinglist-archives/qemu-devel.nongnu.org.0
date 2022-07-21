Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCD57D4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:17:34 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcbz-0002dQ-Mi
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhou.zhao@intel.com>)
 id 1oEYeD-0007KC-Bn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:03:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:10678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhou.zhao@intel.com>)
 id 1oEYeA-0008Fu-3v
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658419410; x=1689955410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yEK7JGkKAoUlWDwYrJb2EO4l5RskQjupQIBE7Xdgqjk=;
 b=Dgpwy+O7Yfj6TEukJJ5HWn6tVE0/QBEvGsDiNYY5+6jpLcTL7W/f+jW2
 48pf9AtJ+6w27qOA3PMk09YG5/WdLWc7kvvpsLVmwc3j8srTlx3WlgAn9
 eTFfjaBvaragPyl3YnIt57uf6XG2DMmL+2SfWiVsP/U8gw/6c22O2NX0c
 OaooeDoVY4VbXzh5N8gJovyRJ0dYRRzgOLOzCToNj5Fkvb0N50OfXX1RY
 M7lE6VdibTKdVNan1BHNOyHRXWPMrz0GXG/UsaHNFa/yiecpwOKA0OWa7
 yKYfzuhEHJ1mCLRErC0xQlcCjwinaAEd65A1yTxQ9S8LD2giwNazF5JbK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="266864722"
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; d="scan'208";a="266864722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 09:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; d="scan'208";a="573798455"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 21 Jul 2022 09:02:52 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 09:02:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 21 Jul 2022 09:02:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Jul 2022 09:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0Dy3BopxsQJo2E2sgQTs6JFvLjVthM7KTk/v6MxuIByVwFhmHHQZ22yaLBrtSxbosD2PDswKzndz4ZGO+8t3zxe0oR1H2lvEXe2fYrmk1dz8JsAxsx/n8MW/6S3wzz0tC6stdIRrddyUTRQBh4q9cHL+/LOK9uz3Eyz1I+f9vKdZO9GHHjBiQnPqdn5iEZuZTkBUsPqQms0JjVAsw//fnoJO6Z7n1dTyg34jdJQnshWHSrCvP5dn570DrOcwIO1pPj22hy00vl4Hba6iRwC1Hy4e+ZVkjOSIYOBrK/fzTqXmajWEYpPUP0WkTNsQ88wqL+2YR+wgBb0WFNYDwT6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEK7JGkKAoUlWDwYrJb2EO4l5RskQjupQIBE7Xdgqjk=;
 b=QD8DTw5///BAptYKJJRZWEezG2XvTao++yaScm0z7AuZQlzZ+DvylGsqUrXX5Q2ZetKnWxKtVx4mccSZSRcE87QkO1oRkaMAS8Rp8EHD3/MagKviz6WtvsxYySrRJm3tP+mX1JhF3I694Rzzibn5/FmFyu+RIf1bksGx9xGVTtBtZFqSrMdF0HHLBFHRIOehFkquLg5lzmAKxMO4r7oDZT3mE9T2qCDz542mbVO0mWIzkIRgSnmQ6FMWOol3xh+zA7GF3b0NC8JOgRhWDw+pUu/v9SYxTib7DCytF8NbyKkh6hPAuLEzSXUN4IOvyVEtAr5lJj22qOR05tZDHKO0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2812.namprd11.prod.outlook.com (2603:10b6:5:c4::24) by
 BN6PR1101MB2178.namprd11.prod.outlook.com (2603:10b6:405:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 16:02:49 +0000
Received: from DM6PR11MB2812.namprd11.prod.outlook.com
 ([fe80::4850:998b:d433:d16c]) by DM6PR11MB2812.namprd11.prod.outlook.com
 ([fe80::4850:998b:d433:d16c%3]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 16:02:49 +0000
From: "Zhao, Zhou" <zhou.zhao@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Xu,
 Ling1" <ling1.xu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, "Jin, Jun
 I" <jun.i.jin@intel.com>
Subject: RE: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Thread-Topic: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Thread-Index: AQHYnO0hY/C3ktnTJUm0ttjYyLU5ba2I7lEAgAAM9pA=
Importance: high
X-Priority: 1
Date: Thu, 21 Jul 2022 16:02:49 +0000
Message-ID: <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
References: <20220721103147.96608-1-ling1.xu@intel.com>
 <20220721103147.96608-2-ling1.xu@intel.com> <YtlshIteVijWePbd@redhat.com>
In-Reply-To: <YtlshIteVijWePbd@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 196c0bac-a396-4d7c-5e3a-08da6b3275f3
x-ms-traffictypediagnostic: BN6PR1101MB2178:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EGbpBLCR2SFRKhWf+eaff3rsSajwwQzBZo0j7438yk2jwheEwNV919q0lJbzWGBe55WlBJeLxPlND113v89dmRAIF/hVL9YHO0s//DGAIIQLKw7vhjgp+chL12XcnqRM33bVMpWmC5+6kGhtSJw5/kxIEqMBFlnViZ+SynCrNjQM43ws48gnFT0dECVXhmULHwdtguM0UQ8aKcXc3YEFWoaQ1E7ZoEV762Oc27gYCi4ef2C7wjY4U99D4P6mJcb2v7fmnYJPQH8I1EYWs43bopb8PNrplnaeBmrjHf3QpBNx5UUuBhvOH8SHj7+C0vNBQXqZ1b8dykqu5vt2dfnYmuYvV8+umuKDD+V5qYoVvUwHBVQqKXNfR+whMjdnEaolhIGDGKAUA5Vysk5/y4g7ZVHrvv0pG1ZFA6UnUnRGbza8bEqVrVwQjA9G9u9RGKYVul3cVLN/pTrS1f8LfpkGsTFSkTF2rpf3QkOmiObHtJ3/CHxthdLosgtSptHMm/C+ABKlVjeEoufurjrEr3qZJhIbhBBcGI/pUIMw7I76o2CPDKnOQYsKvC0F1QI9WMMO1cAr2v8Fpy9SdnbbqiSeDns9N0EQHSVuKbfastbA0p3quF1s12aHTUZAJcXlUB0xyJsjeSE4Im35Eqbk8hufSsU05qZfwUdwYUwSGc1SOmzFkJQ7Lm7hpscovDiS6HNtNg2wRNHOsd+H/owoU/bO613ENz6x3jE53VXDQzyiLACjIjY08/wGikLWLmJ8NqJlZ7XaPey974pT4pHu60s2oEpNQk3aEHWob27v6SDhMMEsnxmrTzTaTevLY4yMfktdGMsYI48fDR1TORRcHAMEnnuHz0CBgrYEQDVAAwFfrpGGKNu37Nta2yLgxbhqrbct
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2812.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(136003)(346002)(366004)(8676002)(66946007)(38070700005)(38100700002)(2906002)(82960400001)(122000001)(64756008)(316002)(6636002)(66556008)(54906003)(76116006)(66476007)(86362001)(110136005)(55016003)(4326008)(9686003)(107886003)(66446008)(33656002)(186003)(41300700001)(83380400001)(5660300002)(26005)(53546011)(71200400001)(966005)(478600001)(52536014)(7696005)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUsvTGgyTGY1K2VDd3REWHZESFhIRUJseDM2RjNOMWZNL0dnM0VrQVU3WlRa?=
 =?utf-8?B?aStBT1FKeEZJL3pETVV1LytZK1l3ZElIbTg1cGRTL2o3TUlJYTAyYlFBTDA0?=
 =?utf-8?B?N3BWRlhNdjM1dkNIQlVSWStsa2QzUFQ5WFZNbWV1NU16V0JDWTgwdXY1ZCtH?=
 =?utf-8?B?VEZtalI1YVN5Sml2VU1EeFp6aGd4eXZ4TlNUaEs3b3haMnhLTDdaOFQ1ZFY3?=
 =?utf-8?B?RUdoTUdUd1l6MDQ4VmdFYXJDQ2lEeGh5SEF2cWxBT1liMEl1SE5jeTZkZ0E0?=
 =?utf-8?B?T0lobHA4WFZGdXNNbWRBR1llVjlCRUl4RTdBQXo2ejh1aEpjOU9FUU9VbkNw?=
 =?utf-8?B?RmkwNGtVeUQrNG1SMXB5aFQvRTEzdURHcEJ0ZXQ0ZjFoYjZtTTYwYkpGZjBO?=
 =?utf-8?B?Z2JzbnRXWDM2TTdoL0JSNHRzQnVuY1crMWJYUGsrOVp2am9MZURwa1RyRmZi?=
 =?utf-8?B?ZEIwWXdyY3RJUC9qR3ppQ0NsNklnOG1Nd1o0Tm5vdkpLaEVnc2l4K1hzOGV4?=
 =?utf-8?B?Ym9ad1JLRDZONHN5dlIzSUR3SWtQQ1NtdHplY0d0S2xWVE1BZ2dIQnlRNmhr?=
 =?utf-8?B?U3c3S0lrN2ZlczV1SExhMThHUnR1MXU0MFlyeGFNSkg3U2djWEFNRnR1K09V?=
 =?utf-8?B?dzJBVVByQTYwRXExdnhRSndLRmprOU92azhES05YYno2ZmRieUVhOWlTdmZs?=
 =?utf-8?B?czJKYm1kSkRPdlNsVVR5MWEwOC9JanVqS1FpL2hJcnpGenFSZ1VST2swSzhn?=
 =?utf-8?B?ZUQ3OHNQOEhlcjZoazJQYXlYUjluKzNzZFFwY3BkQWFvSGFuVnJ6bkt3WVpm?=
 =?utf-8?B?YldvREd0RFN2WWZETkV2MUI2TkRscE83aFdkc3EwNEEzeWRMMTZldUtCWlBm?=
 =?utf-8?B?ZVJzVVZIMzFQYzBGSlkra0YvdXlHbGFuS1MyNFJPelh5R3dDYU9CaHpiQURE?=
 =?utf-8?B?aWFIS2dDTVhEalE3Q3hta0tva3U4SG9RSmtCdExMdkFBZjBpRDBCckF3V2lj?=
 =?utf-8?B?ais4WTgzT1dnaHl1ZmpKZW01c2RrbXcwd3RHRkVuM0tMOU81aktXaGY2citT?=
 =?utf-8?B?Wm56Y05Xako5UCtRVW5lb0huTGFIVThZRXFjUjNWODhiMTNqN0c5Ni9iUW8y?=
 =?utf-8?B?NTRZWUVoTWVwOWc4QjNjVkFQRFF5UDc4d3B2NkFHcTVMZ2kzUjhLeDVmWHhZ?=
 =?utf-8?B?ZjZZMHpWb3ZSb2I3SFdFdytjNWF6eTF0LzZUOXdFdldLWWsxSGRFQmdmMmw0?=
 =?utf-8?B?d1NFZ2hiRTZyNHRHT1VIS2VkWEVSNFJUMkdoQzRwR3d3UHZ2UmZMak90MDgx?=
 =?utf-8?B?V3o4dGNBVXNpV1djQ3UwWmIvZTVhcnNCTmlPeWltcElMck1MUGVJM0JCQUkv?=
 =?utf-8?B?cXV4V1FBQ3VOcXdvVjdFRFQxTXhPMld5cWFJN3ozMGI0NzNFdVVYMEJsbXBk?=
 =?utf-8?B?UXdLUDBhc3hXSGZCRFMwQUZoK1VPa3RNRzlYODlNZHpOZzhPOWExNnc5R3FT?=
 =?utf-8?B?Z2pVOTVya3cwWFN1U1FqaXBmR1BhdmU3Q243UHRhVzhzNnhuS0tlVzIvMk9O?=
 =?utf-8?B?dmw5SWp2TUQ1L1Z0Q1BwSzJYMUdjNkwrcmJNK3lNYko4UC9paEo5QUxqWFBj?=
 =?utf-8?B?NGtrbGZoMitBNTdjeGNwMnJtMS9aMitXT1FlY3J4TW44NDBVUXVzUENrQ2s1?=
 =?utf-8?B?L2sveG5rNUt3c0I2SFpLTEFNRi9ub3gxOVhxV2dIcHhTY0lNQkp4aVJMSmd2?=
 =?utf-8?B?OE9sQlBEaFhQak00SkVEZWtkVWxUbmFXZXZRd1BPRC8vMFYrNjdTRlNKZFZR?=
 =?utf-8?B?ak9RZVJCdFM5VWFJQjZZcUVFc084V01aZnVNSEhaa1ZlT1VleERJbDJwdmVr?=
 =?utf-8?B?alhuMjUwdWkvUnRkTFF4NU5ZS3pKSitvUHBkOEVZT2xpYzl5RnhiR3cvQWNp?=
 =?utf-8?B?bUFzL3ZHRFRlVEVkUVNWZ3lTUXlta2xWNkhuVE5sWE53eTZPSENpZmhwc3JR?=
 =?utf-8?B?WStlTjkybFd3VXB2eW42eXd5M2lGWnlYNVk5MCtNcFZhMEdTOTYvVnVEUC8r?=
 =?utf-8?B?U3d2dDZxR3l3K1hYSCtreG5KMHdWOGU3aGM0MThYcURGS0YxTGdQeHQ3TmIv?=
 =?utf-8?Q?71kKX29W1iBO0SEP9ulRD4ivm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2812.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196c0bac-a396-4d7c-5e3a-08da6b3275f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 16:02:49.7298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hepbcvBNR3sliVnVeD3mmlEauLvFTv28ymBkQpNlJ/WZu2FRbyjJUZL/OYumHBw3cXOVXraWNjCgHkmhMyxz6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2178
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=zhou.zhao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 16:12:41 -0400
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

SGkgZGFpbmVsOg0KICBDYXVzZSBvdXIgY29kZSBkZXBlbmQgb24gaW50ZWwgaW50cmluc2ljcyBs
aWIgaW1wbGVtZW50LiBBbmQgdGhpcyBsaWIgZGVwZW5kIG9uIG1hY3JvIGxpa2UgICIgQVZYNTEy
QlcgIi4gVGhpcyBtYWNybyBuZWVkIGNvbXBpbGUgdGltZSBjaGVjayB0byBlbmFibGUgc29tZSBt
YWNoaW5lIG9wdGlvbnMgLiBpZiB5b3Ugb25seSB1c2UgdGhhdCB1dGlsaXR5IHRvIGRvIHJ1bnRp
bWUgY2hlY2sgLHlvdSB3aWxsIG1ldCBjb21waWxlIGlzc3VlLiBBbmQgYWxzbyBpZiB3ZSB3YW50
IHRvIHNhdmUgY3B1IHRpbWUgLCB3ZSdkIGJldHRlciBjaGVjayBpdCBpbiBjb21waWxlIHRpbWUu
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8Op
IDxiZXJyYW5nZUByZWRoYXQuY29tPiANClNlbnQ6IFRodXJzZGF5LCBKdWx5IDIxLCAyMDIyIDEx
OjExIFBNDQpUbzogWHUsIExpbmcxIDxsaW5nMS54dUBpbnRlbC5jb20+DQpDYzogcWVtdS1kZXZl
bEBub25nbnUub3JnOyBxdWludGVsYUByZWRoYXQuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOyBa
aGFvLCBaaG91IDx6aG91LnpoYW9AaW50ZWwuY29tPjsgSmluLCBKdW4gSSA8anVuLmkuamluQGlu
dGVsLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8xXSBBZGQgQVZYNTEyIHN1cHBvcnQgZm9y
IHhienJsZV9lbmNvZGVfYnVmZmVyIGZ1bmN0aW9uDQoNCk9uIFRodSwgSnVsIDIxLCAyMDIyIGF0
IDA2OjMxOjQ3UE0gKzA4MDAsIGxpbmcgeHUgd3JvdGU6DQo+IFRoaXMgY29tbWl0IGFkZHMgQVZY
NTEyIGltcGxlbWVudGF0aW9uIG9mIHhienJsZV9lbmNvZGVfYnVmZmVyIA0KPiBmdW5jdGlvbiB0
byBhY2NlbGVyYXRlIHhienJsZSBlbmNvZGluZyBzcGVlZC4gQ29tcGFyZWQgd2l0aCBDIHZlcnNp
b24gDQo+IG9mIHhienJsZV9lbmNvZGVfYnVmZmVyIGZ1bmN0aW9uLA0KPiBBVlg1MTIgdmVyc2lv
biBjYW4gYWNoaWV2ZSBhbG1vc3QgNjAlLTcwJSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBvbiB1
bml0IHRlc3QgcHJvdmlkZWQgYnkgcWVtdS4NCj4gSW4gYWRkaXRpb24sIHdlIHByb3ZpZGUgb25l
IG1vcmUgdW5pdCB0ZXN0IGNhbGxlZCANCj4gInRlc3RfZW5jb2RlX2RlY29kZV9yYW5kb20iLCBp
biB3aGljaCBkaXJ0eSBkYXRhIGFyZSByYW5kb21seSBsb2NhdGVkIGluIDRLIHBhZ2UsIGFuZCB0
aGlzIGNhc2UgY2FuIGFjaGlldmUgYWxtb3N0IDE0MCUgcGVyZm9ybWFuY2UgZ2Fpbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IGxpbmcgeHUgPGxpbmcxLnh1QGludGVsLmNvbT4NCj4gQ28tYXV0aG9y
ZWQtYnk6IFpob3UgWmhhbyA8emhvdS56aGFvQGludGVsLmNvbT4NCj4gQ28tYXV0aG9yZWQtYnk6
IEp1biBKaW4gPGp1bi5pLmppbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgY29uZmlndXJlICAgICAg
ICAgICAgICAgIHwgNDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0K
PiAgbWlncmF0aW9uL3JhbS5jICAgICAgICAgIHwgICA2ICsNCj4gIG1pZ3JhdGlvbi94YnpybGUu
YyAgICAgICB8IDE3NyArKysrKysrKysrKysrKysrDQo+ICBtaWdyYXRpb24veGJ6cmxlLmggICAg
ICAgfCAgIDQgKw0KPiAgdGVzdHMvdW5pdC90ZXN0LXhienJsZS5jIHwgMzA3ICsrKysrKysrKysr
KysrKysrKysrKysrKystLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA5MDggaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pDQoNCj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9yYW0uYyBiL21pZ3Jh
dGlvbi9yYW0uYyBpbmRleCANCj4gMDFmOWNjMWQ3Mi4uM2I5MzFjMzI1ZiAxMDA2NDQNCj4gLS0t
IGEvbWlncmF0aW9uL3JhbS5jDQo+ICsrKyBiL21pZ3JhdGlvbi9yYW0uYw0KPiBAQCAtNzQ3LDkg
Kzc0NywxNSBAQCBzdGF0aWMgaW50IHNhdmVfeGJ6cmxlX3BhZ2UoUkFNU3RhdGUgKnJzLCB1aW50
OF90ICoqY3VycmVudF9kYXRhLA0KPiAgICAgIG1lbWNweShYQlpSTEUuY3VycmVudF9idWYsICpj
dXJyZW50X2RhdGEsIFRBUkdFVF9QQUdFX1NJWkUpOw0KPiAgDQo+ICAgICAgLyogWEJaUkxFIGVu
Y29kaW5nIChpZiB0aGVyZSBpcyBubyBvdmVyZmxvdykgKi8NCj4gKyAgICAjaWYgZGVmaW5lZChf
X3g4Nl82NF9fKSAmJiBkZWZpbmVkKF9fQVZYNTEyQldfXykNCj4gKyAgICBlbmNvZGVkX2xlbiA9
IHhienJsZV9lbmNvZGVfYnVmZmVyXzUxMihwcmV2X2NhY2hlZF9wYWdlLCBYQlpSTEUuY3VycmVu
dF9idWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQVJHRVRf
UEFHRV9TSVpFLCBYQlpSTEUuZW5jb2RlZF9idWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBUQVJHRVRfUEFHRV9TSVpFKTsNCj4gKyAgICAjZWxzZQ0KPiAgICAg
IGVuY29kZWRfbGVuID0geGJ6cmxlX2VuY29kZV9idWZmZXIocHJldl9jYWNoZWRfcGFnZSwgWEJa
UkxFLmN1cnJlbnRfYnVmLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgVEFSR0VUX1BBR0VfU0laRSwgWEJaUkxFLmVuY29kZWRfYnVmLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVEFSR0VUX1BBR0VfU0laRSk7DQo+ICsgICAgI2Vu
ZGlmDQoNClNob3VsZG4ndCB3ZSBiZSBkZWNpZGluZyB3aGljaCBpbXBsIHVzaW5nIGEgcnVudGlt
ZSBjaGVjayBvZiB0aGUgY3VycmVudCBDUFVJRCwgcmF0aGVyIHRoYW4gYSBjb21waWxlIHRpbWUg
Y2hlY2sgPyBJJ20gdGhpbmtpbmcgYWxvbmcgdGhlIGxpbmVzIG9mIHdoYXQgdXRpbC9idWZmZXJp
c3plcm8uYyBkb2VzIHRvIHNlbGVjdCBkaWZmZXJlbnQgb3B0aW1pemVkIHZlcnNpb25zIGJhc2Vk
IG9uIENQVUlELiBUaGUgYnVpbGQgaG9zdCBDUFUgZmVhdHVyZXMgY2FuJ3QgYmUgZXhwZWN0ZWQg
dG8gbWF0Y2ggdGhlIHJ1bnRpbWUgaG9zdCBDUFUgZmVhdHVyZXMuDQoNCg0KV2l0aCByZWdhcmRz
LA0KRGFuaWVsDQotLSANCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBz
Oi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KfDogaHR0cHM6Ly9saWJ2aXJ0
Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29t
IDp8DQp8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cu
aW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwNCg0K

