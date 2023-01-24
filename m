Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925667912D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 07:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKCzg-0006Nc-Bi; Tue, 24 Jan 2023 01:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pKCzd-0006N9-MI
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 01:41:17 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pKCzZ-0006nW-IH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 01:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674542473; x=1706078473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2F8vycVWhLjKyhQeUSjSZ0R9AOXCj9srne19tcgXHBc=;
 b=W/Hg03cgwVpIMCnsNbfWfO7MqosdK6Rg089B8xSwvRlkBd+Q+NeDmd8L
 VQz8746XkCYKHezXqBAdu7MP6LLjBez1poVRpBKZeFDyT0QrCA7uJiHQt
 vF/0Vvp+BJgq5FXTo2DLplU0HClHy/ssDD4X8dYzjHDB7Hd3KKOIpeMvk
 NJLQ7FHDC0L8OZpjvB7o5mbHTv5+AEA2FdsEKdoc34jVeHuNmKq/X3L/v
 xP70B+fWhOkPK5b00pbwQT2SjdnjoRvI3VB4S389G/E+nTrwJlvMYOItP
 7RFZXsqELWYIAncsumpWnmYnZ6y9X/MaEaj/w0lBmRs8VrRUoZ+FGprmv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328324908"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="328324908"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 22:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663964800"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="663964800"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 22:41:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 22:41:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 22:41:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 22:41:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfVyKa81M4FlPKIFzU6+81IOZyxuFrfhe0d1JamYilX00J9gIDkOdp94AhH4+UUHlVViUuhlZjesGGtvfcwjlLLRb3w9vb0lDyyXq4Hgbk7hyBs9izFMD+KKVn8myIvmYsoWIPcjY5o2nyXUu0cFk02a5jPFZMjg/yxWsXTiagfcA17gzfqnu0T1FNdg9nxUiRAbSRyG7WUXgbuaqQ+RImoSWqhv4fxPFIZozSloAJITLrFfNaNPxFXrLNKQTMP7ejrd1PtM29eysRORkMfcyzyBuJUjLxSDwBXIxSc33vFfuTs0fjrc7EWge7QueVT0RRsUQgn6RODxb5kj8fDHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F8vycVWhLjKyhQeUSjSZ0R9AOXCj9srne19tcgXHBc=;
 b=Qxk4zCGVxdvaiORhvRquOp5vUQtCpWDigNrFmkDc7Gj1KRYx0BEQcBgK2+h4/zV3WBoW9ov90TVpGvRFPrmX6y0vRd+lrEgacKbkYvxRb17zFyMNq5i1KBMCKGbdF6ot2ZIIZe63eYCPfAVzNcHwHpMDEIRhx+alBS1C7D7zbtCV2wdqx9VKShsmbmjxokw+w+Rtu9jZRMHE5+BgfKBXM4twy7D2uWhCO76nLBmfGfHCnwZQ4/YOZWjaI/56EpY/Yti3feumit8Btn+6dlta/+IfbNVabcqyEi+rX+VP3kxTZyHx4O+mbAspsinYhZJMJBgVF9npPa1KL6/WDq3O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 06:41:01 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 06:41:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, Frediano Ziglio <freddy77@gmail.com>
Subject: RE: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Thread-Topic: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Thread-Index: AQHZLwi/ohMFZLve1U+7V6+NDJjAF66rxsUAgACavbA=
Date: Tue, 24 Jan 2023 06:41:00 +0000
Message-ID: <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
 <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
In-Reply-To: <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7779:EE_
x-ms-office365-filtering-correlation-id: c6a2668b-df50-4186-c768-08dafdd5f4ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tOaA4eOcepN5+GYQdABw6BkYKDK3r3QApEelaP8PbDRlR6qQkHq1SSEA0YApKbzhBH6dJg1iPLpFfo7K4CWIXBVE9rCJ0I5tHYUbKvLWvpQI0WXqoILAb2kUobQaoIEYQFQ7d5Ipw80XjA1VZn6dM7pAffZyTOui6wvv6xGvo4dpWwldCf9cGE7/1uJ2bkiVurr1ZVmIdwTi/I95Sf6FcuTvRoQHtOOPIwDz7j5WAFgMq1L3p97Nl1SzX1zQfW7ZSrr2UwZBMa0mS6gM/gMdiLdQ9A72Czp0/LSu/F3M3Gc/GL99txRJ0vNwD/E3SiGVMlFnScGc/EmbrX+SEJsghKkktNtzaFNZV0Gw2mASXnV2NXGgvf5V0gge5nW2/IGU8lViEmeAPQMnYvhTjgg+L7HoSIyH0IQejoze+MCSJZdj5btixGw5q9BLex8F1YokJoaku5HQ6VPVjapQFNgBhzm+3U8A/hbKC471m98Bm2+qv+UGufhlZopqumCMqYO/b1Wr33BsLBWXwrQlFYpD6ojq55BKJIcxeIGM/ZSpmRvSW+Ve2X6/WRZeGtBGk5Bbu2qEeiBlKq0uM4JqQeqSi3j2zGHSIbqMnNTp16z6Iaj4CAj8xGbGPwRT0L/W7STPg1s1d/uZY6gbmvKUnTYV0o68+erSeayeUKwRCmajGg14VTwoeDtbuWJTzesy/cQNPpnSSTVo0M5sRNCkwGVvzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(66899015)(38070700005)(2906002)(5660300002)(38100700002)(82960400001)(52536014)(8936002)(4326008)(41300700001)(122000001)(83380400001)(86362001)(33656002)(66446008)(71200400001)(478600001)(7696005)(66476007)(6916009)(6506007)(26005)(186003)(9686003)(316002)(55016003)(8676002)(76116006)(66946007)(54906003)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2tFWmpYaDAwd3RxbUkrUGFRZWF4ZHZOdGRVQU5iKzcvNEJIcm4wUXlYeW5H?=
 =?utf-8?B?VW40ZWpoTmM2ZU1uazk0dmxEV2pSN2JFaE5nVUlCMWorbVBYeTlWSU5iSW9Z?=
 =?utf-8?B?TEU2UjEvRjU5SFZDWTF4bG1HSVYxak1Kd1Y3OXJhMkYxVmhkeUExajkxci9m?=
 =?utf-8?B?Q3NCUWxTd0VGeG1CNDNvVk5XVlZFdm94UFpVcXlRL1IyU05rZ1RudG13Z0lz?=
 =?utf-8?B?T0FqdGhQakhUMUp0eGM1WU1vRTdCdzhtZGhsdWZ3TkFYcjNBNlNDcjVQbDdz?=
 =?utf-8?B?S28raVRLcm1rbStwYzFsT0x1eDdYNjRTZVpNcWQzTVJSVUJEV1FBOXYrK0JY?=
 =?utf-8?B?T29VejhHdXl4YWM3cDg4c2RwWXpVODg2U3RYMnFId2tESVNNN3JkY0czajhz?=
 =?utf-8?B?MStPNXN4c0U2eFpGeGF3bC9YWHlFanl5emF0QWo5RWNtRzVOb3J4QTc5WFpI?=
 =?utf-8?B?dzdVcDZaMFU5UGtHak5XOWsxd05rR2NTT08wTFdHQmJhYlhxdENMbUd4Rk5J?=
 =?utf-8?B?RTFzdzlsaUdvVjJjNVZDUWsxTTkxY0NFVFFINUxNUkdlWXMrYTBTWTFJUEdQ?=
 =?utf-8?B?U3E3c1QxOTF4OGxWME4yRm1ldytuamEreERBSWl3enJ5WENNbDY3c21NSHU1?=
 =?utf-8?B?VkxpcFhxVEhBSjkzRVlJdEtWREdKRmtJTUs4UlBuVEV2aXg5UFlWaXRtc2tR?=
 =?utf-8?B?RnRIZ1FBSi84RUlBRzdXQ3RBMmREaVlobVZKZE13UktoRGpqWVY5UnAxT29D?=
 =?utf-8?B?Z0FDbDBGYUFZRVJVSDV4Wk1ZbTNMWVRQOFE4cFVsS0dFTkMreTEzYk0yY2ZG?=
 =?utf-8?B?Rm92WjNmNjJQY3RPd3RRYzVMUWE2RTl3cmF6ZzNOclFvOEpuckI1UXJYVmtQ?=
 =?utf-8?B?ZnBYRkJMMG55a1hXaklPcnRsSHRKZnBFcXNmU0loU243NmRrNzhsTFdDUnRO?=
 =?utf-8?B?Vys0K2dCNnpvSzE3OTdVVi8zTzhxYUMwcFJQUHJDcGZQVzJYdkcyQTR1T3V3?=
 =?utf-8?B?TU9ZTVpzaStyRENhemJYZlRMZUVJamtIekU3eGhEdmIzSWVqRWpnVStPaU1S?=
 =?utf-8?B?TTV0VDlGSjBRYVZoNGFDS1AvOThpbjFFR0JVRURySTRPcTNxSjU2NDNNZHYx?=
 =?utf-8?B?UUlmOVRrR3FOQy90V25SYlA3OVBkZm00Z3ZkTThtdEk0UDNaSG1SY0xlRkJO?=
 =?utf-8?B?NTV0cWxIbVgwL0dMNWFLRjFDOGZsWjZUNzRiU1pnaHg3Zk5OOXlBbGpFTmFy?=
 =?utf-8?B?MUQ4YVI5Q0pXOURFV2RhNXZTZHVQdXFGKytIRWRGSVpsdTZrR2t3bHlzTDB0?=
 =?utf-8?B?T2RSU1c5NU5hSlJPa0pOZ2FRaTlXcG9iUHhOcE1GSjQvK0wyRisyNFlvSjBx?=
 =?utf-8?B?aWxaS1lwdUt2Q3Zsb014Zk1raFZCT0xGWjE3MGZtUjVtbEhKMmRoblBrd1p2?=
 =?utf-8?B?REFxOFZIWlRsZ09SM1p2dm96amNBZU5pVnkrTWZaSk5SSlpxL0dsZzZnbG1Y?=
 =?utf-8?B?bUQ1UzhXYXhlLzlwcUVVTnBpUDlRU3FiQlhKYVpOVVkvTWRYLzJjd0Ria2VQ?=
 =?utf-8?B?cExMY2R1TXVBRkc1b1UrVWxva3Frd0VnYTVnQ01rTkZTNkY1b21HcWJ3NkhY?=
 =?utf-8?B?M0VndDFXbG13MFpOWGdaa2tPTGU0S3hlU1JzdHhNWkNsVnhiY2prbzRRbVpR?=
 =?utf-8?B?dS95eCtxdG1PS2VDZzNxbjJ1REEzbEY5RE9HTFNSYloyZ3NxM0tXUTA3UVNn?=
 =?utf-8?B?ZGVuM3hsWS9Idk0vOU1pVFEzOHpoUlgwYUZoSFBzU05lalkwUEl5bllyNDV2?=
 =?utf-8?B?ZXJXK1VkczM1LzlnYStTVVZPZzZRUXlXMFdDZGxOSVJWV1BHVU9vYVFiMk9X?=
 =?utf-8?B?YWpWSTBoNmFhYnpTSlYyUWVsSkxDY3hGNFoybGx5MUhMWlhnNjFvV2hFVmc3?=
 =?utf-8?B?SENmWWRFWjdkOGpoU0I2SktkSVZKc1BmaUVHQ2Z3SlpYN2lnVDRXQWtVQzYr?=
 =?utf-8?B?UlppbGtBVUg0aFRiaTFRZDJMOTVFWWlEU3pxZTB3TUpaYzZOSEZSZFVmemdG?=
 =?utf-8?B?U20vdE9jSGlHck5qVklEcXA1R3o4am8wMFRwZUlUM3NvQTJoMlM5aEcrdGdY?=
 =?utf-8?B?R3BUV1RtUjRjSURnWE41R2FKY2RDeUs2WWxDRDFnRGdpdWhYdU5UVk5TNktI?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a2668b-df50-4186-c768-08dafdd5f4ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 06:41:00.5028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrqxOPSvmthXcfw4nMzGSatiRA9u4rAKuKjnoSb5pFSAMzM2YAKmFomqVf2On745WbaBBCQwBDrHLkcrE6/bDrbZXS6D0nclBYTEgy8Ms9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

KyBGcmVkaWFubw0KDQpIaSBHZXJkLA0KDQo+IA0KPiAgIEhpLA0KPiANCj4gPiBIZXJlIGlzIHRo
ZSBmbG93IG9mIHRoaW5ncyBmcm9tIHRoZSBRZW11IHNpZGU6DQo+ID4gLSBDYWxsIGdsX3NjYW5v
dXQgKHRvIHVwZGF0ZSB0aGUgZmQpIGFuZCBnbF9kcmF3X2FzeW5jIGp1c3QgbGlrZQ0KPiA+ICAg
aW4gdGhlIGxvY2FsIGRpc3BsYXkgY2FzZS4NCj4gDQo+IE9rLg0KPiANCj4gPiAtIEFkZGl0aW9u
YWxseSwgY3JlYXRlIGFuIHVwZGF0ZSB3aXRoIHRoZSBjbWQgc2V0IHRvIFFYTF9DTURfRFJBVw0K
PiA+ICAgdG8gdHJpZ2dlciB0aGUgY3JlYXRpb24gb2YgYSBuZXcgZHJhd2FibGUgKGFzc29jaWF0
ZWQgd2l0aCB0aGUgZmQpDQo+ID4gICBieSB0aGUgU3BpY2Ugc2VydmVyLg0KPiA+IC0gV2FpdCAo
b3IgYmxvY2spIHVudGlsIHRoZSBFbmNvZGVyIGlzIGRvbmUgZW5jb2RpbmcgdGhlIGNvbnRlbnQu
DQo+ID4gLSBVbmJsb2NrIHRoZSBwaXBlbGluZSBvbmNlIHRoZSBhc3luYyBjb21wbGV0aW9uIGNv
b2tpZSBpcyByZWNlaXZlZC4NCj4gDQo+IENhcmUgdG8gZXhwbGFpbj8gIEZvciBxZW11IGl0IHNo
b3VsZCBtYWtlIGEgZGlmZmVyZW5jZSB3aGF0IHNwaWNlLXNlcnZlcg0KPiBkb2VzIHdpdGggdGhl
IGRtYS1idWZzIHBhc3NlZCAobG9jYWwgZGlzcGxheSAvIGVuY29kZSB2aWRlbyArIHNlbmQgdG8N
Cj4gcmVtb3RlKS4NCltLYXNpcmVkZHksIFZpdmVrXSBJIGFncmVlIHRoYXQgUWVtdSBzaG91bGRu
J3QgY2FyZSB3aGF0IHRoZSBzcGljZS1zZXJ2ZXIgZG9lcw0Kd2l0aCB0aGUgZG1hYnVmIGZkcyBi
dXQgc29tZWhvdyBhIGRyYXdhYmxlIGhhcyB0byBiZSBjcmVhdGVkIGluIHRoZSByZW1vdGUgY2xp
ZW50DQpjYXNlLiBUaGlzIGlzIG5lZWRlZCBhcyBtb3N0IG9mIHRoZSBjb3JlIGZ1bmN0aW9ucyBp
biB0aGUgc2VydmVyIChhc3NvY2lhdGVkIHdpdGgNCmRpc3BsYXktY2hhbm5lbCwgdmlkZW8tc3Ry
ZWFtLCBlbmNvZGVyLCBldGMpIG9wZXJhdGUgb24gZHJhd2FibGVzLiBUaGVyZWZvcmUsIEkNCmZp
Z3VyZWQgc2luY2UgUWVtdSBhbHJlYWR5IHRlbGxzIHRoZSBzZXJ2ZXIgdG8gY3JlYXRlIGEgZHJh
d2FibGUgaW4gdGhlIG5vbi1nbCBjYXNlDQooYnkgY3JlYXRpbmcgYW4gdXBkYXRlIHRoYXQgaW5j
bHVkZXMgYSBRWExfQ01EX0RSQVcgY21kKSwgdGhlIHNhbWUgdGhpbmcNCmNhbiBiZSBkb25lIGlu
IHRoZSBnbCArIHJlbW90ZSBjbGllbnQgY2FzZSBhcyB3ZWxsLg0KDQpBbHRlcm5hdGl2ZWx5LCB3
ZSBjb3VsZCBtYWtlIHRoZSBzZXJ2ZXIgY3JlYXRlIGEgZHJhd2FibGUgYXMgYSByZXNwb25zZSB0
byBnbF9zY2Fub3V0LA0Kd2hlbiBpdCBkZXRlY3RzIGEgcmVtb3RlIGNsaWVudC4gSUlVQywgSSB0
aGluayB0aGlzIGNhbiBiZSBkb25lIGJ1dCBzZWVtcyByYXRoZXIgbWVzc3kNCmdpdmVuIHRoYXQg
Y3VycmVudGx5LCB0aGUgc2VydmVyIG9ubHkgY3JlYXRlcyBhIGRyYXdhYmxlIChpbnNpZGUgcmVk
X3Byb2Nlc3NfZGlzcGxheSkNCmluIHRoZSBjYXNlIG9mIFFYTF9DTURfRFJBVyBzZW50IGJ5IFFl
bXUvYXBwbGljYXRpb25zOg0KICAgICAgICBzd2l0Y2ggKGV4dF9jbWQuY21kLnR5cGUpIHsNCiAg
ICAgICAgY2FzZSBRWExfQ01EX0RSQVc6IHsNCiAgICAgICAgICAgIGF1dG8gcmVkX2RyYXdhYmxl
ID0gcmVkX2RyYXdhYmxlX25ldyh3b3JrZXItPnF4bCwgJndvcmtlci0+bWVtX3Nsb3RzLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4dF9jbWQuZ3Jv
dXBfaWQsIGV4dF9jbWQuY21kLmRhdGEsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZXh0X2NtZC5mbGFncyk7IC8vIHJldHVybnMgd2l0aCAxIHJlZg0K
DQogICAgICAgICAgICBpZiAocmVkX2RyYXdhYmxlKSB7DQogICAgICAgICAgICAgICAgZGlzcGxh
eV9jaGFubmVsX3Byb2Nlc3NfZHJhdyh3b3JrZXItPmRpc3BsYXlfY2hhbm5lbCwgc3RkOjptb3Zl
KHJlZF9kcmF3YWJsZSksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB3b3JrZXItPnByb2Nlc3NfZGlzcGxheV9nZW5lcmF0aW9uKTsNCiAgICAgICAgICAgIH0N
Cg0KVGhlIG90aGVyIG9wdGlvbiBJIGNhbiB0aGluayBvZiBpcyB0byBqdXN0IG5vdCBkZWFsIHdp
dGggZHJhd2FibGVzIGF0IGFsbCBhbmQgc29tZWhvdw0KZGlyZWN0bHkgc2hhcmUgdGhlIGRtYWJ1
ZiBmZCB3aXRoIHRoZSBFbmNvZGVyLiBUaGlzIHNvbHV0aW9uIGFsc28gc2VlbXMgdmVyeSBtZXNz
eQ0KYW5kIGludmFzaXZlIHRvIG1lIGFzIHdlJ2Qgbm90IGJlIGFibGUgdG8gbGV2ZXJhZ2UgdGhl
IGV4aXN0aW5nIEFQSXMgKGluIGRpc3BsYXktY2hhbm5lbCwNCnZpZGVvLXN0cmVhbSwgZXRjKSB0
aGF0IGNyZWF0ZSBhbmQgbWFuYWdlIHN0cmVhbXMgZWZmaWNpZW50bHkuDQoNCj4gDQo+ID4gICNp
ZmRlZiBIQVZFX1NQSUNFX0dMDQo+ID4gKyAgICAgICAgfSBlbHNlIGlmIChzcGljZV9kbWFidWZf
ZW5jb2RlKSB7DQo+ID4gKyAgICAgICAgICAgIGlmIChnX3N0cmNtcDAocHJlZmVycmVkX2NvZGVj
LCAiZ3N0cmVhbWVyOmgyNjQiKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgZXJyb3JfcmVwb3J0
KCJkbWFidWYtZW5jb2RlPW9uIGN1cnJlbnRseSBvbmx5IHdvcmtzIGFuZCB0ZXN0ZWQiDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIndpdGggZ3N0cmVhbWVyOmgyNjQiKTsNCj4g
PiArICAgICAgICAgICAgICAgIGV4aXQoMSk7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gDQo+IElN
SE8gd2Ugc2hvdWxkIG5vdCBoYXJkLWNvZGUgdG9kYXlzIHNwaWNlLXNlcnZlciBjYXBhYmlsaXRp
ZXMgbGlrZSB0aGlzLg0KPiBGb3Igc3RhcnRlcnMgdGhpcyBpc24ndCB0cnVlIGZvciBzcGljZS1z
ZXJ2ZXIgdmVyc2lvbnMgd2hpY2ggZG9uJ3QgKHlldCkNCj4gaGF2ZSB5b3VyIHBhdGNoZXMuICBB
bHNvIHRoZSBjYXBhYmlsaXR5IG1pZ2h0IGRlcGVuZCBvbiBoYXJkd2FyZQ0KPiBzdXBwb3J0LiAg
SU1ITyB3ZSBuZWVkIHNvbWUgZmVhdHVyZSBuZWdvdGlhdGlvbiBiZXR3ZWVuIHFlbXUgYW5kIHNw
aWNlDQo+IGhlcmUuDQpbS2FzaXJlZGR5LCBWaXZla10gT2ssIEkgY2FuIGdldCByaWQgb2YgdGhp
cyBjaHVuayBpbiB2My4gSG93ZXZlciwgZ2l2ZW4gdGhlIG51bWVyb3VzDQpmZWF0dXJlcyBzdXBw
b3J0ZWQgYnkgdGhlIFNwaWNlIHNlcnZlciwgSSBzdXNwZWN0IGltcGxlbWVudGluZyBmZWF0dXJl
IG5lZ290aWF0aW9uDQptaWdodCBnZXQgcmVhbGx5IGNoYWxsZW5naW5nLiBJcyB0aGVyZSBhbnkg
b3RoZXIgd2F5IGFyb3VuZCB0aGlzIHRoYXQgeW91IGNhbiB0aGluayBvZj8NCg0KVGhhbmtzLA0K
Vml2ZWsNCg0KPiANCj4gdGFrZSBjYXJlLA0KPiAgIEdlcmQNCg0K

