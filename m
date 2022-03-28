Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10184E90ED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:17:13 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlUu-0005Jg-KZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:17:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nYlRq-0003kk-Rs
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:14:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:5410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nYlRn-00073u-Rz
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648458839; x=1679994839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2cQT400LrZ8twX3WtOPKr5ywxMzf36ZDoY4pEPEJ+v4=;
 b=FW88IHEXOdjadBKTsN15VGapGGY2C7HDCXmNOwgWMh05bE5OdfO8NkhN
 TDkfZgPax4YNaAyalZBrxHjbk8BD79Z2bhDFd4A8bv0R1vl0Kp/mnvQj9
 Jg4QZ6ES32OIPNrlVDF0GAdGLfkvLmP75ZK1OATGzxMV4pgcN1jiAP1Bb
 rSH1ync6xi5O8EcAh3B/SlC3vz22pI3WKJgROlb3cGmOelYFnlKOODkCk
 nQ61l9jyEA5n3XNqVcAiDhkj8TUrC4wt+3mlENjrNG+8p7yO6tbmZeD6Q
 Kk5ACYzYKqZVsNFUmPINopKt6GJWt+XJT2+Xv8bjMgC47Zp8pgC/7lyo2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="256529718"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="256529718"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="517947494"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 28 Mar 2022 02:13:55 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 02:13:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 02:13:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 02:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6GCVMA81Pzl5Nq3cRNvjXLbuH72XmYl4BwshWqvdptYbXXLIW5HuhKIyin8e318YSbUVFwntID9Udsuj7e61seW0HyoUy+oV5mTHoSAPVyXNeh9S1bb/NssfG0FVLP1xLphWHlejrjTNgd95cYgsXqiIYVWRb48gzx89KVFS+rK9mP+cc6/auwLUZKH0Fu1YYGbbYuPPePNm6SHEfJXXqEqaYeh15uXVJUBm5I6m9SR6OAx/ZO8PoxdzdHmUGUXgh8d7MzDqDvfrha6a8Og37Ce6Af5KY8mDxKmDd9BKYA0cHc83AzFM1+T/WV5zmGlxHD8S76agKJv1/m5VYXmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cQT400LrZ8twX3WtOPKr5ywxMzf36ZDoY4pEPEJ+v4=;
 b=MPYdDHOnKs8ohpxtICDPmLDMbGjnsFa4mRjMuFTGLHzmXvWNnuYnsR6FGFokzMC+PhGdcC+oJB3UCcbKFzveuQjY1zBWVNV6k0yQV4axPH6hljQJrXZYFvdcjK0fXx1OZQf5hAoHcRKoZusGAuP5sMls57q6PulKBBGkefawxtQjKnuR7tT7nj0L3T/a0JoStSDXCTuIWqBBtuaa3AWeI5jLLVC8oArKope5oNDOpuzBLcmFxMOf5pHnie7pCpIrtUJhuYoaNPN6j/sdTs1vJZpyWLtReSIgWC2TPJuVvFA6Z3lyH2/+zXuD1F+cw9WbIskUVCsvrolrBYvL1jqGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 09:13:54 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940%3]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:13:54 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, Jason Wang
 <jasowang@redhat.com>
Subject: RE: [PATCH 2/4] net/colo: Fix a "double free" crash to clear the
 conn_list
Thread-Topic: [PATCH 2/4] net/colo: Fix a "double free" crash to clear the
 conn_list
Thread-Index: AQHYM5Ld/ZBTaR+FHEOsslVs2t4r5azJOeUAgAtlrnA=
Date: Mon, 28 Mar 2022 09:13:54 +0000
Message-ID: <MWHPR11MB003111C4853637DDEDA6A43F9B1D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
 <20220309083858.58117-3-chen.zhang@intel.com>
 <7c2e8f9f-6718-90bb-da83-4360e9de91b6@fujitsu.com>
In-Reply-To: <7c2e8f9f-6718-90bb-da83-4360e9de91b6@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85a126f4-7e82-4325-ada6-08da109b482f
x-ms-traffictypediagnostic: CO1PR11MB5025:EE_
x-microsoft-antispam-prvs: <CO1PR11MB50258E5753B680C43B134B279B1D9@CO1PR11MB5025.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4R2B8/uQQ0axAiUFw2PLdJJP5bedGKL/RJt4H22PLPmyKSpGRkeoEs5WG03tDo14dOfxlJ59UJEOB//qPIBpQ6fBKjWVnKF8/nGQLtfWzZcIYxF7jIztsXMCkSfk507qLcXSItMOMDJhclFcUqIlsucIcNl7FqZ0L+seifQ1Xuf1e4XVlwo0GkunvnId0Y00bPF8s4TRSjuCmax4FPA8mez2Mfx1T/VRv+smRw7HiXvYfAr6kya6kcr+XKmC2WpD/OoGgb68hWoCtZ8XP8e8qEjfCp9BU6l7HSTVKraj+yJVpGm4+VOO7Qu2BJ2auuQXCmTsaiMzNBx1j14idqKvsoJZfVu2D2+D9dkLklWn9O+OUj1QsKOYhydbRqLA4IbSHh34f9Kxf6PQDAjeMtJ1I3oMSDcn1g/KSFM8p1Cytjg3sGXY7HFaU0+CTN19SvgihCOSWsAN+NJoxwWzTJbrQ4BtnJvrVP3yzxEIFqMsPMTeQJhjunnYFG3iTbpOcdpz3v749BzH2D+NFyH/YJ/LRS7v8TbG1lC4fS7E7fzW6ooytmlYFB5hjJ5XPHjc+3aPTWAH0fqICWiCu56Fv1ra36/eqBX45sDiD8S4wV+jd+2SAiWRe0p6TjDBugYKAqedt5G3L8RUwVGsiekY9V9pS87BIXwStQjrkHbxrmRVB5kjPGafSOfHyhL+u6ceaGyPKxmDQXfP9Z8OZtP8LKxIsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(33656002)(508600001)(8676002)(4326008)(316002)(71200400001)(66556008)(66476007)(66446008)(76116006)(66946007)(64756008)(122000001)(110136005)(54906003)(38100700002)(55016003)(82960400001)(52536014)(5660300002)(8936002)(86362001)(38070700005)(26005)(186003)(83380400001)(7696005)(53546011)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUt5SzZsMjlxaVBzNHNtaXFYVGtYQ2JNVEczNUd6ZTc4U2NmNzZMWklEZFF1?=
 =?utf-8?B?SzAxSGs4YXFSYklYZWJsYTNDcXJpUStObTZLaDVrbG9TM3VnVkJxR1Vac0Ja?=
 =?utf-8?B?NUVFYUV0K2FxRklManUrTFZqcm5GV1NuakpiTUwyQVRDT0N0SnlmZ014aUxa?=
 =?utf-8?B?Mm5FUlRUTDhnaCtDSXMrSFN4M1NOZVVMSnhucTM4cnFDYXFoS202QTJVNnEw?=
 =?utf-8?B?NS9meVl2bzE5L2xXVUFaVExzQkh4N0ZENTUrWEtQbkRRR3lIdGVHRVFYTDhR?=
 =?utf-8?B?Y0ZzV1N3VTd5YkxmV0ZXYmg5a0lpdGR0bU0yc3Z3eWlGVzlUd21NeXdLTUR0?=
 =?utf-8?B?Ym5YMUM2WWYyR002bXRGM0YxUUZ3RlVKY3Vha05sM2lwZ1JucDFSQjYvVHNp?=
 =?utf-8?B?VVF1dFFUOFNQbjUrOUVzUEtMMXJTVmdzeHd1eVZ4TnNaUWl5UGQwS0JieERN?=
 =?utf-8?B?VTloUGdxL3QyR2VyOEtJbXZjdkM5U0xYZTVzc1lacCtPRUI2VU85cW9kMnpt?=
 =?utf-8?B?UTFiakNqQmQ0SlJsUGM3WU8zV0g0SFRha1JwV3FyQ2pZMWt4ZTN3QkNiNVJV?=
 =?utf-8?B?ZHo3cGpXWjNZa1JXY1BTYk1yQUc1VGdkSG8yWE1xS25lT2E2cXFxSmxmbGts?=
 =?utf-8?B?M3JRQUo5bW1Qa0owcWRQeGVwNlZnd0xHZVVoRGtJdklHNXhYYkcrdTZrMHBX?=
 =?utf-8?B?QUxCSkdnelB1RWJrYkpERENuOUZLSStrN1Mzcy9zTmtFRGFMOWpaeUg0R1VU?=
 =?utf-8?B?SUFUZFBiSTNyOXFmWDRpRG1QY0xFL0RQUG5LcTVBWnJQcXpoU1ZrUisvTC9n?=
 =?utf-8?B?MHVzT25RZDN1Q1QrVHgzMzFZeU51LzZVVFVIN0pHRUFPemp0M2wrWmE2V2p6?=
 =?utf-8?B?R091SVhPalIzMHNqV3dVMS82ZzFPbFVzbGd1TUhyWVJ4eUVieHdTZGEweks1?=
 =?utf-8?B?WFM5YjlxQTluQnNWYy9OT04yRGhwVEx6UlVPVGVMRXlTQjB2dDVVNkc2bnB0?=
 =?utf-8?B?Sy9IQ2IzOEZnWjhzZnNFaW1yTlRwdmtwL2RJQ0pPQy9XYlRBdVpwRWtYTzE1?=
 =?utf-8?B?eTY3RG5LTFpJZmRjSXNkekd3bVFrZkJXZExDRWNnTm1DOUtFTXdIczEycVhY?=
 =?utf-8?B?Ym9xSTgvQkhSSm1SRDR0WGhGUS85cGZQc2I5aTA2cUd4RXRUSnBiSUFjZWJL?=
 =?utf-8?B?akUwb2gxdUFRY1daeHBmaXVmL0laYnoyaHlzb21jS1RDb2h3MEk0Y0wxVHFK?=
 =?utf-8?B?MUx1NUV6c0NURVJ2VXdNU0pLampaUzNzUVFva1pQUnVuWUJ3djN1bS9rNkpQ?=
 =?utf-8?B?UmtnMHhEOU9RM1oxSThIb3l4dWRXNytUSGR1S2JoWWtYS2d1RTUvMWxrQWgv?=
 =?utf-8?B?UUtOZHBUM1dEK2ZVWkh5bVpLRjNBbE1DL2wzQXdlKzFxTk1FZkdMOGFaREpB?=
 =?utf-8?B?d0gwOTdBcHl2TDFaSXlPanlKUmhYRHYrbXJRN3JUTkRkbWMzTHVNaFRLWGRt?=
 =?utf-8?B?bGo1M3kvK05HSTlmZHlCZmxiMkIvVjlPRTNhZU1BMFN3OUpyNlJBT1MzbjJP?=
 =?utf-8?B?OFNNaXh6L09Gd2VWKzdDS1FaU2ZWMk9FRTBzZXJHRkt2OTZjM3lhZWxmMW4y?=
 =?utf-8?B?T3c2QkFSbXlPUHBzWUdYL3E3K3NYQXdLYll5TUtoVEZvOHdJUlNFdFlybWN2?=
 =?utf-8?B?Uko3VklLNVd4ZGNTU2o2UUhMVmoydldCUlVjSC9Db0xkdXViM3QzK2tjTENU?=
 =?utf-8?B?VVZzWGJ2OTE1UWVyYjhyQm9JUTF4Z0dnSG0vRGVCT3hhbmRXcFhzTnJZaGw5?=
 =?utf-8?B?RVRlUXYwK2huU3AxVzBzK00zVk1wTVdkNWQ4b1BYN2RMQ3hLTFBDczZMZWw5?=
 =?utf-8?B?MUJZY2pZVUpIZ2xrVFJyWklHaXlCOFFsUzR6QXhLd1ZYWWVvYnlWaG42amd5?=
 =?utf-8?B?eStmYlBNVVVmQ2pPcTl6Y2FTU1ZIWHJPS2pXYzFxSGpsQlNSTjNMcFd1WldD?=
 =?utf-8?B?QWl0amQ1Z05UeEs1UWlzekNzNW5PUGtWQjNyOTYrNzFwMXE4cTEvVkt6VWVa?=
 =?utf-8?B?Q2gxdldsdmlWbWtYek05TnJwbHVNbXAvTk8xNUg3b1NRNjlTeVFFUlVxY0FK?=
 =?utf-8?B?blJDTjJURUQ3VUYxQVJGZ2x6Mmc1TmpZOXVvVDZVUGRrRzF5eTR2MnFqTSsy?=
 =?utf-8?B?VkZYMG02b0NMMEVSVUEySm5sNmY0ZlIyeFRvQkZ1V2VCaXI1eVBqR2tVL2J4?=
 =?utf-8?B?a0prc2JZeVRyMm5rbCtjWjVzRkg2R245ek5VL3ZySG1hazNKZTl5WmxUWThF?=
 =?utf-8?B?TmoyRjlaZmVLVTFaV3E1Zk8zSnlnM3dPQndmK3RteFVtNWhHTDRCQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a126f4-7e82-4325-ada6-08da109b482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 09:13:54.2312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNSI2qIK2+eaqZGhGAeqr3pCOHj2t7YUaksQb6rRuUi8pvfOL8zZvrtCAJ3dSjLfsYdZCAO+EJrsvC5i/X2N/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGl6aGlqaWFuQGZ1aml0
c3UuY29tIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjEs
IDIwMjIgMTE6MDYgQU0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47
IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBsaXpoaWppYW5AZnVqaXRzdS5j
b20NCj4gQ2M6IHFlbXUtZGV2IDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBMaWtlIFh1IDxsaWtl
Lnh1QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIG5ldC9jb2xv
OiBGaXggYSAiZG91YmxlIGZyZWUiIGNyYXNoIHRvIGNsZWFyIHRoZQ0KPiBjb25uX2xpc3QNCj4g
DQo+IA0KPiANCj4gT24gMDkvMDMvMjAyMiAxNjozOCwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiBX
ZSBub3RpY2UgdGhlIFFFTVUgbWF5IGNyYXNoIHdoZW4gdGhlIGd1ZXN0IGhhcyB0b28gbWFueSBp
bmNvbWluZw0KPiA+IG5ldHdvcmsgY29ubmVjdGlvbnMgd2l0aCB0aGUgZm9sbG93aW5nIGxvZzoN
Cj4gPg0KPiA+IDE1MTk3QDE1OTM1Nzg2MjIuNjY4NTczOmNvbG9fcHJveHlfbWFpbiA6IGNvbG8g
cHJveHkgY29ubmVjdGlvbg0KPiA+IGhhc2h0YWJsZSBmdWxsLCBjbGVhciBpdA0KPiA+IGZyZWUo
KTogaW52YWxpZCBwb2ludGVyDQo+ID4gWzFdICAgIDE1MTk1IGFib3J0IChjb3JlIGR1bXBlZCkg
IHFlbXUtc3lzdGVtLXg4Nl82NCAuLi4uDQo+ID4NCj4gPiBUaGlzIGlzIGJlY2F1c2Ugd2UgY3Jl
YXRlIHRoZSBzLT5jb25uZWN0aW9uX3RyYWNrX3RhYmxlIHdpdGgNCj4gPiBnX2hhc2hfdGFibGVf
bmV3X2Z1bGwoKSB3aGljaCBpcyBkZWZpbmVkIGFzOg0KPiA+DQo+ID4gR0hhc2hUYWJsZSAqIGdf
aGFzaF90YWJsZV9uZXdfZnVsbCAoR0hhc2hGdW5jIGhhc2hfZnVuYywNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHRXF1YWxGdW5jIGtleV9lcXVhbF9mdW5jLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdEZXN0cm95Tm90aWZ5IGtleV9kZXN0cm95X2Z1bmMsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgR0Rlc3Ryb3lOb3RpZnkgdmFsdWVfZGVzdHJveV9mdW5jKTsNCj4g
Pg0KPiA+IFRoZSBmb3VydGggcGFyYW1ldGVyIGNvbm5lY3Rpb25fZGVzdHJveSgpIHdpbGwgYmUg
Y2FsbGVkIHRvIGZyZWUgdGhlDQo+ID4gbWVtb3J5IGFsbG9jYXRlZCBmb3IgYWxsICdDb25uZWN0
aW9uJyB2YWx1ZXMgaW4gdGhlIGhhc2h0YWJsZSB3aGVuIHdlDQo+ID4gY2FsbCBnX2hhc2hfdGFi
bGVfcmVtb3ZlX2FsbCgpIGluIHRoZSBjb25uZWN0aW9uX2hhc2h0YWJsZV9yZXNldCgpLg0KPiA+
DQo+ID4gSXQncyB1bm5lY2Vzc2FyeSBiZWNhdXNlIHdlIGNsZWFyIHRoZSBjb25uX2xpc3QgZXhw
bGljaXRseSBsYXRlciwgYW5kDQo+ID4gaXQncyBidWdneSB3aGVuIG90aGVyIGFnZW50cyB0cnkg
dG8gY2FsbCBjb25uZWN0aW9uX2dldCgpIHdpdGggdGhlDQo+ID4gc2FtZSBjb25uZWN0aW9uX3Ry
YWNrX3RhYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGlrZSBYdSA8bGlrZS54dUBsaW51
eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0Bp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBuZXQvY29sby1jb21wYXJlLmMgICAgfCAyICstDQo+
ID4gICBuZXQvZmlsdGVyLXJld3JpdGVyLmMgfCAyICstDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9u
ZXQvY29sby1jb21wYXJlLmMgYi9uZXQvY29sby1jb21wYXJlLmMgaW5kZXgNCj4gPiA2MjU1NGI1
YjNjLi5hYjA1NGNmZDIxIDEwMDY0NA0KPiA+IC0tLSBhL25ldC9jb2xvLWNvbXBhcmUuYw0KPiA+
ICsrKyBiL25ldC9jb2xvLWNvbXBhcmUuYw0KPiA+IEBAIC0xMzI0LDcgKzEzMjQsNyBAQCBzdGF0
aWMgdm9pZA0KPiBjb2xvX2NvbXBhcmVfY29tcGxldGUoVXNlckNyZWF0YWJsZSAqdWMsIEVycm9y
ICoqZXJycCkNCj4gPiAgICAgICBzLT5jb25uZWN0aW9uX3RyYWNrX3RhYmxlID0NCj4gZ19oYXNo
X3RhYmxlX25ld19mdWxsKGNvbm5lY3Rpb25fa2V5X2hhc2gsDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0aW9uX2tleV9l
cXVhbCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdfZnJlZSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29ubmVjdGlvbl9kZXN0cm95KTsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7DQo+IA0K
PiANCj4gMjAyIC8qIGlmIG5vdCBmb3VuZCwgY3JlYXRlIGEgbmV3IGNvbm5lY3Rpb24gYW5kIGFk
ZCB0byBoYXNoIHRhYmxlICovDQo+IDIwMyBDb25uZWN0aW9uICpjb25uZWN0aW9uX2dldChHSGFz
aFRhYmxlICpjb25uZWN0aW9uX3RyYWNrX3RhYmxlLA0KPiAyMDTCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ29ubmVjdGlvbktleSAqa2V5LA0K
PiAyMDXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgR1F1ZXVlICpjb25uX2xpc3QpDQo+IDIwNiB7DQo+IDIwN8KgwqDCoMKgIENvbm5lY3Rpb24g
KmNvbm4gPSBnX2hhc2hfdGFibGVfbG9va3VwKGNvbm5lY3Rpb25fdHJhY2tfdGFibGUsDQo+IGtl
eSk7DQo+IDIwOA0KPiAyMDnCoMKgwqDCoCBpZiAoY29ubiA9PSBOVUxMKSB7DQo+IDIxMMKgwqDC
oMKgwqDCoMKgwqAgQ29ubmVjdGlvbktleSAqbmV3X2tleSA9IGdfbWVtZHVwKGtleSwgc2l6ZW9m
KCprZXkpKTsNCj4gMjExDQo+IDIxMsKgwqDCoMKgwqDCoMKgwqAgY29ubiA9IGNvbm5lY3Rpb25f
bmV3KGtleSk7DQo+IDIxMw0KPiAyMTTCoMKgwqDCoMKgwqDCoMKgIGlmIChnX2hhc2hfdGFibGVf
c2l6ZShjb25uZWN0aW9uX3RyYWNrX3RhYmxlKSA+DQo+IEhBU0hUQUJMRV9NQVhfU0laRSkgew0K
PiAyMTXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhY2VfY29sb19wcm94eV9tYWluKCJjb2xv
IHByb3h5IGNvbm5lY3Rpb24gaGFzaHRhYmxlIGZ1bGwsIg0KPiAyMTbCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiIGNs
ZWFyIGl0Iik7DQo+IDIxNyBjb25uZWN0aW9uX2hhc2h0YWJsZV9yZXNldChjb25uZWN0aW9uX3Ry
YWNrX3RhYmxlKTsNCj4gDQo+IDE5NyB2b2lkIGNvbm5lY3Rpb25faGFzaHRhYmxlX3Jlc2V0KEdI
YXNoVGFibGUgKmNvbm5lY3Rpb25fdHJhY2tfdGFibGUpDQo+IDE5OCB7DQo+IDE5OSBnX2hhc2hf
dGFibGVfcmVtb3ZlX2FsbChjb25uZWN0aW9uX3RyYWNrX3RhYmxlKTsNCj4gMjAwIH0NCj4gDQo+
IElJVUMswqAgYWJvdmUgc3Vicm91dGluZSB3aWxsIGRvIHNvbWUgY2xlYW51cCBleHBsaWNpdGx5
LiBBbmQgYmVmb3JlIHlvdXINCj4gcGF0Y2gsIGNvbm5lY3Rpb25faGFzaHRhYmxlX3Jlc2V0KCkg
d2lsbCByZWxlYXNlIGFsbCBrZXlzIGFuZCB0aGVpciB2YWx1ZXMgaW4NCj4gdGhpcyBoYXNodGFi
bGUuIEJ1dCBub3csIHlvdSByZW1vdmUgYWxsIGtleXMgYW5kIGp1c3Qgb25lIHZhbHVlKGNvbm5f
bGlzdCkNCj4gaW5zdGVhZC4gRG9lcyBpdCBtZWFucyBvdGhlciB2YWx1ZXMgd2lsbCBiZSBsZWFr
ZWQgPw0KDQpUaGFua3MgWmhpamlhbi4gUmUtdGhpbmsgYWJvdXQgaXQuIFllcywgSSB0aGluayB5
b3UgYXJlIHJpZ2h0Lg0KSXQgbG9va3MgbmVlZCBhIGxvY2sgdG8gYXZvaWQgaW50byBjb25uZWN0
aW9uX2dldCgpIHdoZW4gdHJpZ2dlcmVkIHRoZSBjbGVhciBoYXNodGFibGUgb3BlcmF0aW9uLg0K
V2hhdCBkbyB5b3UgdGhpbms/DQoNClRoYW5rcw0KQ2hlbg0KDQoNCj4gDQo+IA0KPiAyMTggLyoN
Cj4gMjE5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBjbGVhciB0aGUgY29ubl9saXN0DQo+
IDIyMCAqLw0KPiAyMjHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKCFnX3F1ZXVlX2lz
X2VtcHR5KGNvbm5fbGlzdCkpIHsNCj4gMjIyIGNvbm5lY3Rpb25fZGVzdHJveShnX3F1ZXVlX3Bv
cF9oZWFkKGNvbm5fbGlzdCkpOw0KPiAyMjMgfQ0KPiAyMjQgfQ0KPiAyMjUNCj4gMjI2wqDCoMKg
wqDCoMKgwqDCoCBnX2hhc2hfdGFibGVfaW5zZXJ0KGNvbm5lY3Rpb25fdHJhY2tfdGFibGUsIG5l
d19rZXksIGNvbm4pOw0KPiAyMjcgfQ0KPiAyMjgNCj4gMjI5wqDCoMKgwqAgcmV0dXJuIGNvbm47
DQo+IDIzMCB9DQo+IA0KPiANCj4gVGhhbmtzDQo+IFpoaWppYW4NCj4gDQo+ID4NCj4gPiAgICAg
ICBjb2xvX2NvbXBhcmVfaW90aHJlYWQocyk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbmV0L2Zp
bHRlci1yZXdyaXRlci5jIGIvbmV0L2ZpbHRlci1yZXdyaXRlci5jIGluZGV4DQo+ID4gYmYwNTAy
M2RjMy4uYzE4YzRjMjAxOSAxMDA2NDQNCj4gPiAtLS0gYS9uZXQvZmlsdGVyLXJld3JpdGVyLmMN
Cj4gPiArKysgYi9uZXQvZmlsdGVyLXJld3JpdGVyLmMNCj4gPiBAQCAtMzgzLDcgKzM4Myw3IEBA
IHN0YXRpYyB2b2lkIGNvbG9fcmV3cml0ZXJfc2V0dXAoTmV0RmlsdGVyU3RhdGUgKm5mLA0KPiBF
cnJvciAqKmVycnApDQo+ID4gICAgICAgcy0+Y29ubmVjdGlvbl90cmFja190YWJsZSA9DQo+IGdf
aGFzaF90YWJsZV9uZXdfZnVsbChjb25uZWN0aW9uX2tleV9oYXNoLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdGlvbl9r
ZXlfZXF1YWwsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnX2ZyZWUsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rpb25fZGVzdHJveSk7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOw0K
PiA+ICAgICAgIHMtPmluY29taW5nX3F1ZXVlID0NCj4gcWVtdV9uZXdfbmV0X3F1ZXVlKHFlbXVf
bmV0ZmlsdGVyX3Bhc3NfdG9fbmV4dCwgbmYpOw0KPiA+ICAgfQ0KPiA+DQo=

