Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF656F65C5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:33:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTRf-0001YV-Kn; Thu, 04 May 2023 03:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTRa-0001YE-8d; Thu, 04 May 2023 03:32:02 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTRX-0008FY-Fv; Thu, 04 May 2023 03:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185519; x=1714721519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O1PONya4PEsVKVjvB9mTJ9H6XdVPH2Zg0if3IjnDC8A=;
 b=IixFcOxs4w27r9m3EPzGz419bke8GOFSaYiUx+HmOi+GPzk7WUg81+VR
 1j+VfTsDwyDJt8IKJ8XNP60Cul2FFA0zXh83BASPDGSFw04YKb1b0TicH
 LkSrDWYFAEnn7g0anBAXOVBXba3674JdOt6qljdW3Sq9A5BSsJHgo7YGH
 oCH1o7NH9bTI6NTzlieatNl0IMDSofUueNO+ggn//TALmib61Eriaq8Xj
 rherudIAk1+PUgprzYyENyAoMIx5Me7ozSNfCRmjOi/dAAocbdRqtCNlH
 A186daVwcQ/XSu1Og8Znro4rRbPl89Ba4XtGwS+O53cYb+uVuNR9Vt81O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333227007"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333227007"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="821060113"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="821060113"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 04 May 2023 00:31:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:31:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:31:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:31:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rsxzpd0qKSW3Hf7fiTC2zhxO4lJvM95k7A8R7hScJEmOoaAauSrwxxoM6m72dZEaWppn+GlkDtXfiNp1Xf8rXVpto+Tn5Yd2FewNED4+CWXk3PMlgxlA9HQ0FN2xMr1Mp7ofXBuTWJygaVXiQaAaX3FpQ1euUYXetVa8bswmTo6GNHF4gacRwRTCogxtrfj2738TFVXeuxUZJxLWgPr0/2PziDyD7GpevqMqe5ygRgTs3IS/zYfBdNpMEYxDyhlDLr2Yb4G6dCRxhgAJXL0ediXMyE5iMJ2Bc6Hzk72C93NzpTWNI3dwQU8Xb81mJtF5Ikh3kODkT4NXoj5QXWySfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1PONya4PEsVKVjvB9mTJ9H6XdVPH2Zg0if3IjnDC8A=;
 b=YvU/XUfXBMHt8BIwdZAxl28t0vL6yaTjYk0JWpQ1Llu+ZI+yzvIZLdlqRU8MRkDuB+HIpFjom/jTN17L/X49um0Vc5NGfSUnZw1d+UmWf8zmQBtTJnDU6kno4y93nWN813QhwfffmzQrBoZ/4t5keWJkHOw3hkddaPpHMk+AmbW9nmnzI7IYVPEFxTK/p9YzANX6RaEpQeGYSS9sNP3RQ758DHh4vWY6FU/YapnwmjSGVArjB3+UTnRog3sYspsQrrT7/YemqFi6z4Hp8nV17RXFYvxjU0oK2JJJGylhmv/dmywFlv67GSEYpdB5CsKCC7euEvpqwh5Q7QoAvCckGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:31:45 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:31:45 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: RE: [PATCH v4 01/10] block/meson.build: prefer positive condition for
 replication
Thread-Topic: [PATCH v4 01/10] block/meson.build: prefer positive condition
 for replication
Thread-Index: AQHZegtBZDTqxoif3kGVDaAfYtMQba9JvxfQ
Date: Thu, 4 May 2023 07:31:44 +0000
Message-ID: <MWHPR11MB0031B8B07C530BA4548349F59B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-2-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-2-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|MN2PR11MB4533:EE_
x-ms-office365-filtering-correlation-id: 28863280-f65e-40b0-d2c6-08db4c719cd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y40BKcnnMjhUB5gekQgEB3y+QRao6eVAELzREKjcqftS1t7Jap+wOG22wGWveHrkRN4BQDXx4WjnTONKKdhNBWOw/BPYO+D5ojDFwiAjDjJRH3QdwxB/XQmPHHLHT/iClGsNKnSYDlTi+Dbp8TcDkGdkAcR1nm/YYt26+u0NSD8ZZzhJTN8y9FJYUflx5QXtcG5RIScMpVkanTUDQKB3l/x8o8+CZsbenc3I4T18/W1701zO0ekuvBfeCfpE1QQrWFOfFlO1blvoH59kpzYivnqgDILWLWeKrXmIDxJiKexKXy6EzvR/TRatb6mVpCmd1/uf9Qv4JfwTpDm2G2lHHS/DpyIK/0q4taxlqH+kViGXC8gDu0Nd7XJfYnhJwr/GaBjebJWiPPLEuD7dILMtehTQy/Ar1pZC4Ux6w08a4+/KkqoKCGULOygrXxC2KPaSzXHy6l7Z8qy+/Dwnv/87bJuMFtoCFbMgOvL5CahDJoJGfd5hCVSsVrppSyJ0RIGA0HSWUx05z0AzsxqCoVdOsiBfnR3msmJDphJewqJ2nPnx9ulJk1weqA6PptuFrG/e//Jqlie9ewOX3uihwWEuQ8PatssFWJZDdpDyw8YMZfSciRBUqMG7xYtFCNnlgg88
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(86362001)(8676002)(8936002)(55016003)(82960400001)(122000001)(33656002)(66946007)(64756008)(66476007)(66446008)(66556008)(316002)(4326008)(76116006)(38100700002)(38070700005)(478600001)(110136005)(71200400001)(54906003)(7696005)(41300700001)(2906002)(52536014)(5660300002)(53546011)(26005)(9686003)(6506007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGNyZ051c0N6Q3hwbTBTOTE4enk4QTRFZWZjVUU4UVpkWkY0azQrb0dkQnZS?=
 =?utf-8?B?OE1PRHFDVXkvTU5ua1ZUK1QxTVJ0OWRXNUE3MnZjT2kxVVBmNlVna0NhTUM5?=
 =?utf-8?B?ZjJCNXRpV3Z6VE1RMXJQeW42YzdocXl4eVpIQlFWbUxjRlFNNzg2bSsrRDRu?=
 =?utf-8?B?OG14MTNwQXROUTdYaVgrWGFhRlgrUmt2UURRN0psWHNyTElsa251b2xKc0lX?=
 =?utf-8?B?ajUwTjBabFJVM0gvK29FWEI0OXRjNGh2ZWtENC90ck9QS1NFNEY4aHgwNXNu?=
 =?utf-8?B?NXdYTmRzbTczcmJrTllXZktaS2I1SVUyTEhBRW81eW1tR09HemZzellOUFgv?=
 =?utf-8?B?M25EWThnaXJWQWRkQll3U1llRmNEemtxMFRLN3lNdWJiVHdDV3FtUEFpRStk?=
 =?utf-8?B?MVpKTjhjTWN2L3Jsa2VUNzUvVEZrQWJINzU4VTFKTEhHWkZhSkJ4b1NOSHQx?=
 =?utf-8?B?TGVWdVhXK3dYd2J4cFZGcEU4SEtQYjV3YWVlYU41d24zWERSQ2RQZm9tSFlG?=
 =?utf-8?B?dFo4WS9mU2d1aUxnV004NWdPdGd2NDJ3WkhodEE4L3ZNZkpSUXVqbTFYcDg4?=
 =?utf-8?B?dUFKdE5kWVdxTHcvdEx3YStuVnFZdkMzdkp1cnh0enN1bVhhUWMyVzJWMnpt?=
 =?utf-8?B?ZEJqcTlYNmhKVEg3Q3RmK2xPN2txVmk5eDdxL2RXYXcxR0tLclBBV0N4dFdZ?=
 =?utf-8?B?MXV6MnlCV1JMK2tVOEJVOEt5OWZmSFpPSWpDTHdGalBteTRaem1BRy9CR2h2?=
 =?utf-8?B?STdPWENMMERzKzBLOFAwd3VqSm9DTERTMG1aV2pHLzk5dm9rbm5jakNmSDda?=
 =?utf-8?B?NERDVzdqT05jY2YvK2JlUkJnejBMNXBDTVU5dFRpOFplWkRablFmU0pjbmR6?=
 =?utf-8?B?dkhidUtlZDRDUnBvNmNoUFdtR3ZZUVg4eElNbTJBZkpjS05MVjBIODlhUUZC?=
 =?utf-8?B?M0dwOGhYa3BYbTBXc2plNnBvQTRuSzQ5VFhQYkllRnk2U3IvQk1DM1prQXZU?=
 =?utf-8?B?bTJyTEZiRHJEd0VOSWh4RE9OSFM1c040UmdGTEoyOWNYK08zMXZvL2NvamQ2?=
 =?utf-8?B?U2VmbWxZUGxhVExSUzdtQlJVMXpUZFJEa2ZQM0JCT2tESms0REtzUlQ2WVVw?=
 =?utf-8?B?dmdNcTc4dHUzcXNJODJ6V0llZ0tFZFBWR2dqbmRvcEhUdnVlRHlnVmJrcHJy?=
 =?utf-8?B?aFJwc0pZcGIzb3Fwem9WQmtsL014SWp1RW9rRUFReGdoYUlYNjZXbU02Umww?=
 =?utf-8?B?VWhrZnVYSFVXc0xETmFiaCs5UkZqM3RGbUUwb0c1QlZBRUYva282eFZzOFFG?=
 =?utf-8?B?ckhiVWEvSzF3cTN5SUswaWtWbURVVHVvSGo0aWtOWUVzWmdlSjVTNGhQNEJV?=
 =?utf-8?B?Q001OVJRWHVRanI3cnptRi9Da0h1WnpxQWJSa1FkR3dTb3NIclQwUXBGVEsx?=
 =?utf-8?B?WjZoS21sNlFHZE1NTWRqM2hnUjFHeWkzT2cxOFdrZ0wvZ0Y0eFR4NzJDckdr?=
 =?utf-8?B?blAzWDZiSHFzQWVsdGNlODFLbllvaVFtY2UwV2RKNm5hTGJOWkNuWGU3ZWRx?=
 =?utf-8?B?aGY0WjhLT3czVHljejRHVmJTMk9pb09xRm4vT01PYXBoaFI3Zm85M1VXaWhJ?=
 =?utf-8?B?YU1NajZ2SDl0aXVvaFR6RHdjbUZtUVo5RUE3R3QyZjhmcmxJcFFsK2ltYkVG?=
 =?utf-8?B?eDhORXkwZG9RUDdIMGxmZGlGT2RqQ3R4a1lWMWF6Q2JPQkMxQUZyaFg3T3U1?=
 =?utf-8?B?eTgzNHdlNnBYZEpadyswYXN0VFFFWlE4UmhtMXc5VnV0NUthSjRiSjd1Nngr?=
 =?utf-8?B?djNuekJ4SXlXdHlXNEljTFNRMHFZTitnUlB0d1R0ZWE5K282UytON1FkZjdZ?=
 =?utf-8?B?dUNFRWxQekJhZVVZdlJTTXpRYis4U0FsM3d0dHlrWEJkUDFPMFV0STh3QThD?=
 =?utf-8?B?UlFLOFJNdC9sa29iUDJCZmtrd0tWQy85QUdralJKa3pVL1ZsWWY1aXova3p6?=
 =?utf-8?B?L2UyMWwxeEN6YXFDc0M0NCs5aFY1eGRoenJhWTFWYmtiRTAya3hON3hvM1cv?=
 =?utf-8?B?UHhnZ05ndmVhY2ZIZEtZalFtM3NjTGNKbmoycHphOGZhV3MwcXMzNHVhelAr?=
 =?utf-8?Q?Gtmn8uy5Oe0UTazILKY6l8/zT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28863280-f65e-40b0-d2c6-08db4c719cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:31:44.9149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkNIkMDmXooT3IPkVXXgxDEGImmmWwh6yBvmImKJDFhjMNtO1vNFvguMPkFJLxyFKAuKCUgZxXoV0un7bNzFqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogU2F0dXJk
YXksIEFwcmlsIDI5LCAyMDIzIDM6NDkgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
PiBDYzogbHVrYXNzdHJhdWIyQHdlYi5kZTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsgWmhhbmcsIENo
ZW4NCj4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgdnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydTsg
UGhpbGlwcGUgTWF0aGlldS0NCj4gRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IEtldmluIFdv
bGYgPGt3b2xmQHJlZGhhdC5jb20+OyBIYW5uYSBSZWl0eg0KPiA8aHJlaXR6QHJlZGhhdC5jb20+
OyBvcGVuIGxpc3Q6QmxvY2sgbGF5ZXIgY29yZSA8cWVtdS1ibG9ja0Bub25nbnUub3JnPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjQgMDEvMTBdIGJsb2NrL21lc29uLmJ1aWxkOiBwcmVmZXIgcG9zaXRp
dmUgY29uZGl0aW9uIGZvcg0KPiByZXBsaWNhdGlvbg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmxh
ZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4g
UmV2aWV3ZWQtYnk6IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+DQo+IFJldmll
d2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFJl
dmlld2VkLWJ5OiBMdWthcyBTdHJhdWIgPGx1a2Fzc3RyYXViMkB3ZWIuZGU+DQoNClJldmlld2Vk
LWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCg0KVGhhbmtzDQpDaGVuDQoN
Cj4gLS0tDQo+ICBibG9jay9tZXNvbi5idWlsZCB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Jsb2NrL21l
c29uLmJ1aWxkIGIvYmxvY2svbWVzb24uYnVpbGQgaW5kZXgNCj4gMzgyYmVjMGU3ZC4uYjlhNzJl
MjE5YiAxMDA2NDQNCj4gLS0tIGEvYmxvY2svbWVzb24uYnVpbGQNCj4gKysrIGIvYmxvY2svbWVz
b24uYnVpbGQNCj4gQEAgLTg0LDcgKzg0LDcgQEAgYmxvY2tfc3MuYWRkKHdoZW46ICdDT05GSUdf
V0lOMzInLCBpZl90cnVlOiBmaWxlcygnZmlsZS0NCj4gd2luMzIuYycsICd3aW4zMi1haW8uYycp
DQo+ICBibG9ja19zcy5hZGQod2hlbjogJ0NPTkZJR19QT1NJWCcsIGlmX3RydWU6IFtmaWxlcygn
ZmlsZS1wb3NpeC5jJyksIGNvcmVmLCBpb2tpdF0pDQo+ICBibG9ja19zcy5hZGQod2hlbjogbGli
aXNjc2ksIGlmX3RydWU6IGZpbGVzKCdpc2NzaS1vcHRzLmMnKSkNCj4gIGJsb2NrX3NzLmFkZCh3
aGVuOiAnQ09ORklHX0xJTlVYJywgaWZfdHJ1ZTogZmlsZXMoJ252bWUuYycpKSAtaWYgbm90DQo+
IGdldF9vcHRpb24oJ3JlcGxpY2F0aW9uJykuZGlzYWJsZWQoKQ0KPiAraWYgZ2V0X29wdGlvbign
cmVwbGljYXRpb24nKS5hbGxvd2VkKCkNCj4gICAgYmxvY2tfc3MuYWRkKGZpbGVzKCdyZXBsaWNh
dGlvbi5jJykpDQo+ICBlbmRpZg0KPiAgYmxvY2tfc3MuYWRkKHdoZW46IGxpYmFpbywgaWZfdHJ1
ZTogZmlsZXMoJ2xpbnV4LWFpby5jJykpDQo+IC0tDQo+IDIuMzQuMQ0KDQo=

