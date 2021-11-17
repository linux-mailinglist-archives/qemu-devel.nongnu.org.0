Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1F45429E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:28:14 +0100 (CET)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGIg-0006j8-0X
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:28:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mnGDl-0000c3-LF
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:23:09 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:10599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mnGDj-0001ZL-CN
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1637137387; x=1637742187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=soXDe1sKOmynnfUlQ0/vkfm0hWnzgh5ek/vhspMBEf4=;
 b=nEgm/P9UzNUt5P6Kg8kUDU3jf2gZ5WsSM8hHJAcOwyQHOxkEr1cc4POZ
 6ll+FxFv6Z92N2MkV7EpTMO9KPDSzdownR91k3KrgnMeivjiM5JsdSwR5
 OxSAYVfn1XSxzPReoY7QwQNt7qH0LCP6bY25QLYTZs2hRVIaHv3s+3fni Q=;
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 08:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2Y29IcRgkNFSIo3aiKFOSRsKcXBlNlMTjpxEkzziAa8JPTDiko5CHs7FzE2jK6fx2s+2ltrdNbXJ2oGDnjo29HGR47HQDwdJ0ClQzHGmIKgCXEqv1VSCBqSZa9YCYmOk+2Bbbze31gmbTXY1bVs8EJSO/r0iHyJW1cG+hPLqqBJvwbiXtx4h4RSyfTPjsyJRZnovta38mCQFmfVuRxrVu9WJ24nnj+n3MPC1jcMEcwDh0l+Q/hAm0shG48GVNJf+Ihg1v6R7I7vmu3CISRb1Rm51UQL+rJhqhQbcOHO570VJb/u2xkKYo0CJT1vT4WPntsWl08ckCDnb9/DAKwk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soXDe1sKOmynnfUlQ0/vkfm0hWnzgh5ek/vhspMBEf4=;
 b=UQ3ym8mv8Qtf+8lNUcdQPRu8YPUv9Cff8f4rFjZe6shpkbOPf1hs3ONy9ZPtcH73R/Eho3nSb6ikIFO529ra1MHfTz2H/uoCluiSRCWLcvjOuAUGf8lvimOTUrsdrGY7Jin0DaN7dFjT+8V29WH1UqqKITgX1mjabhk+DDzuc03KaOH3U8fIScry24/7w9XvuhVUbNFfyJ284UcBSOS0lUFc6bOiS9qOkROxExXQneTkGpU3naBT1d4f/RnI2PQjyl18GLZQWm6BFPGOWBzcR2+OPHcAtB+QpH8Otp0zZO21s4/+9fV5dkQX1Epti81Vs3W/6Ud0N0PzSs4izuSm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4479.namprd02.prod.outlook.com
 (2603:10b6:805:a3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 08:23:02 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%6]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 08:23:02 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Thread-Topic: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Thread-Index: AQHX2y48l8lD0rnGCkm14LWNDIvaJawHUByAgAARwoA=
Date: Wed, 17 Nov 2021 08:23:01 +0000
Message-ID: <SN4PR0201MB88085CC9F0BD63814F5DC5CEDE9A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211116210919.2823206-1-f4bug@amsat.org>
 <f9c0e14e-6aee-06ea-dc5a-3e96e29bb2f6@linaro.org>
In-Reply-To: <f9c0e14e-6aee-06ea-dc5a-3e96e29bb2f6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adbc9a7d-312a-46b7-dfb7-08d9a9a378c3
x-ms-traffictypediagnostic: SN6PR02MB4479:
x-microsoft-antispam-prvs: <SN6PR02MB4479BA398E958AE501E04886DE9A9@SN6PR02MB4479.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:198;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bfz5Z9Jbhfwweym6Xzcfjad4vChTwP4pmnm5Bz+pa6BGkvc4IMp3mSORjekVWNlOLZMyCmWGw1shiEELmT9d7f07cBXZzBmDOR0bBMRQljVQu6z0S7znHUXNO6B4Sp5co+4/IgLeL96PnbYEBiHriyipzEMqYK+XUbMcZMDHIcubYjJ3wgjd0ZUJX6+aDCzG7ycrAZ+yGi71MSHUkS7at5G4LtPNHGPkP5QcDhJbpdRVoF9faxCSEogv1jaX5dfBntPs88r5ZL9qNevLNNIgrYe52StM2+2hleNcqDk+5O4DKUYU9yAOT8EekHHwMF/dic0t++6lTHS4zyrTK9Ype1IW1SiJNmOYXOcrjEqxF254XSP7unW2m23fOyh5MkVGkx2QYzb/dDXHsdRdP+ElQzt7ShivSqLRTRQ85rwldscbTqavvRCVDkVTQQ1h9AteEnz9e3jIOeil9DDAZ4aOpY+ES5HIh7I7uiz+U5S5NDCg3ERfmFgDNUpQemXBlc+21Q2wZ6ZnR+iDuCEKPz1FxvhXrpKwCC773E/p14dDEOGKzkJf66psA2IhuNAG2RcqBhMjoe39Tw6tgS4sOHJl46tfZpwgoPMpjwCDyYkoKP17DRUhyl2ridwyw0smomy6Gd/hF3CRfpFE1uMrJ9x3ozRgYr6VP/8ee3pdESj7sCCt9ejjKS+RoiTpmwfs4+2XxkLkwmPapE31iIFKzfhEJqKWoBciKnR3nWqhaWW4DIwAOgANaOUPOV6FIp7bfpuYbBufQIn3tlxXJG/L+kkUTg7F8H+Yl7Vy5KA3jiLyCOwb59B6dXX9gHGRiE9NvJn1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(83380400001)(55016002)(71200400001)(5660300002)(122000001)(2906002)(508600001)(8936002)(38100700002)(33656002)(66446008)(38070700005)(53546011)(110136005)(66556008)(64756008)(316002)(52536014)(6506007)(8676002)(66476007)(66946007)(76116006)(86362001)(186003)(4326008)(7696005)(26005)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE1UcjJhSE1GbTBUa0h4OEN1cmtNTzhWMFFrbHMvUXhRVWt0d2tucXozUWdX?=
 =?utf-8?B?TithSTA1dVFiY292VHkxNEE3ZVRPMTdRNDNpOVRvLzdRRVl5TEdBaEFiQVNP?=
 =?utf-8?B?TDQ1NWg3bWoweXphWkJTc1RiZGxQbnlVMTljUnBWTmpERjVMakYwMzcwU0cz?=
 =?utf-8?B?OWVoWVk5Q3BUVDhGam9yWjIrVXIzTGtBNW50NlVsMWpGYXp1RWo0YTQvK0Vs?=
 =?utf-8?B?OE5oUVFCS1AxbzRhelpQN1BHWXduQ1crM0xOTVhUZFZzOHg3WDFHSm9jMEpC?=
 =?utf-8?B?NXNNMEVxcEFkM2k2SGFEY3VRWENZMEdJUkhtVTkzVjJPZ2dXQ0pvRTZ5VXJo?=
 =?utf-8?B?S3ZsVGhydFd2NE1qRm1pZjNmaTI0U2tKMWVFaXRUT2NUbVJTemlUc3RUc2NL?=
 =?utf-8?B?UE8zamJYQ0doK3VxWS9nSmQ5Y3ZGbFVoYmhWZWozM0FnWDROUUJGbUdJMXF3?=
 =?utf-8?B?VDd0OUFLd0pWZSs2VXV6bXd3UDZ4ejlycnMxd2F1LzlkUFdBRkJXMXNNbVZT?=
 =?utf-8?B?ZHdsdmV3d3FMcytqY1JmeE54M01OSDR5L3BoS0NyNmxxRDZBNW93a1hwWjk0?=
 =?utf-8?B?Q29adWxHdXV0N0l5dVFWNUFQQjN4anJzbGN2QnQrN1E2Qjlrbnc4WjQ5YTcw?=
 =?utf-8?B?MFZDTFZTN3RWRDdjUFBkaHlPWjVPNVBuWitQSW15d01iZVNaYjhINWYvWmJm?=
 =?utf-8?B?aG5yVVFZWUwzNHduUXJqa1I2V0pwNVF3aVJmN08zR1d3eW95TS9RZW1RMng0?=
 =?utf-8?B?aW1jeHpvT0d3OUtSaUYvbFUxV0tRMStwcENndkdlOVBpOGt1a3FsakFmZWk5?=
 =?utf-8?B?RDJjNjhEUllUamhHOVZGK2JiaEtQZlJJUytXcGZ5MXpiRnlMV3FKZzdWWmhn?=
 =?utf-8?B?NE9IMHd2emR1TnZiYXBMeGhJNjFPSmUyemZiNE9GS0tEYkNtQWpJNWwxcW4x?=
 =?utf-8?B?ODhiaHMwZXZ4ZmNWdUd3ajVOanVUSTdxR0VtQjE0Lzg2bHlkR1plcGRZclhF?=
 =?utf-8?B?QlpoYUFZY0J1eWFaOVJEemkrK3lNcFhtU2c3K3RORUU5Zm1neHdnbXQ4VmFm?=
 =?utf-8?B?MkF2bzYwaE9uY3RBSUlMemJlYWgvL1h6MzJwdXg3Zk5yV3lvTDQ2dzU1ZkdJ?=
 =?utf-8?B?b0FJaFp6UVdRNEk1TkJucXcyMnBDU3NhUDVobUl5RlRWV2VyZ0x0VG9xdVVy?=
 =?utf-8?B?ZmNNNlZQVDRocDVlZzZWQ09BU3Z6ZmM1eEZNQS9BcE5PSVNaNjIzSlZkZDVq?=
 =?utf-8?B?d0QrV2Z5dCtFL0RNOGI0VWVIN05OS0FqVG0yb0NNSDJIWkltMFdJQVNCV1Ar?=
 =?utf-8?B?QlhNOEUzNk9XU0NDcFVaZ0tmZ1BVQXZSRmdGdkFkWWx4QXE4T3VHeDdEVzRY?=
 =?utf-8?B?RnN3UEFLNnhOdFZJcUxNQVlFdkZYcFFIdGhSeE9tZ1N2b3lkbHkrRmFCQ20w?=
 =?utf-8?B?UWRqZElzL3lzQzFsaU0rdHlOdW9OQm95VEJaM3A0bkl3cTNSSnJFdk1UUGo0?=
 =?utf-8?B?VWFZa2JJZmlscHYyWWl4am54QkRUbzRMVVE0MUtnalNONnRTM0t1U0VkTmlq?=
 =?utf-8?B?c2E0RUpWbHdaYS9hZkQ2V1MyemNXTGMzaVRya2NiQ2JNemFYYmk2K1EzMWl3?=
 =?utf-8?B?Q3doM1RyL3JnaXJRYVRBNjl4QlVwalZBRzBqaWF0TUJKdWVNUU51QVJwZVFm?=
 =?utf-8?B?N1o3ZlpWemJTV0ptaGNVTGpKUitab1Vvd01FVVl4VjhSNVRDQjdqRlZlaVla?=
 =?utf-8?B?K3Q0cVJUVHJLWXdBai9aWUtwcGVyWGdQa04yUnhyaTFEdE9sNzBpMExHZmlT?=
 =?utf-8?B?cUdLbkdIWFVrSlByeGZVYVhUaEtpQ0JXaWZtS2hmaThpc2QyYzd5Sm9MUHZ0?=
 =?utf-8?B?UURsTWJHMjYwbldzeEtoODBST3Y3VW8xWTVSVEZDS2RpYlR0cUxtazFaTFVW?=
 =?utf-8?B?a3NvL1FMTkYrcDZqQmk4dVp5NTZ2SjNxSUZ2K0NRWHkrRTJuSTNlbmhRaWxo?=
 =?utf-8?B?UmpJc212N2tOdXZiaHh3ejRZaWRSaDBlTVJvZ01LV0IyR1FFdE5sWmNMVkY1?=
 =?utf-8?B?U3pWVER6YW9vMkQvTVF5bllheTFLeTA4OWdkQnY2QkN1eTViblUzU0o3Tzd6?=
 =?utf-8?B?OVBCNmxpODBUcTRCRTJVMG9JNDhnK3BYRTJrWTIwMktBay9WWHJoRDRmKzU4?=
 =?utf-8?Q?et5bwuCiS4Kue1H0sR7FuZ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbc9a7d-312a-46b7-dfb7-08d9a9a378c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 08:23:01.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2OHvWrFha/n0ofQP9rIC/vhI3jsBjzNICi+qlw/Y0tibxSUI8f9ACjsUrV/5iXGn/9ogli5ZYrgysQ73HotnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4479
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92
ZW1iZXIgMTcsIDIwMjEgMToxOCBBTQ0KPiBUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0
YnVnQGFtc2F0Lm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogTGF1cmVudCBWaXZp
ZXIgPGxhdXJlbnRAdml2aWVyLmV1PjsgVGF5bG9yIFNpbXBzb24NCj4gPHRzaW1wc29uQHF1aWNp
bmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBsaW51eC11c2VyL2hleGFnb246IFVzZSBn
ZW5lcmljIHRhcmdldF9zdGF0NjQNCj4gc3RydWN0dXJlDQo+IA0KPiBPbiAxMS8xNi8yMSAxMDow
OSBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ID4gTGludXggSGV4YWdvbiBw
b3J0IGRvZXNuJ3QgZGVmaW5lIGEgc3BlY2lmaWMgJ3N0cnVjdCBzdGF0Jw0KPiA+IGJ1dCB1c2Vz
IHRoZSBnZW5lcmljIG9uZSAoc2VlIExpbnV4IGNvbW1pdCA2MTAzZWM1NmM2NWMgWypdDQo+ID4g
ImFzbS1nZW5lcmljOiBhZGQgZ2VuZXJpYyBBQkkgaGVhZGVycyIgd2hpY2ggcHJlZGF0ZXMgdGhl
IGludHJvZHVjdGlvbg0KPiA+IG9mIHRoZSBIZXhhZ29uIHBvcnQpLg0KPiA+DQo+ID4gUmVtb3Zl
IHRoZSB0YXJnZXQgc3BlY2lmaWMgdGFyZ2V0X3N0YXQgKHdoaWNoIGluIGZhY3QgaXMgdGhlDQo+
ID4gdGFyZ2V0X3N0YXQ2NCBzdHJ1Y3R1cmUgYnV0IHVzZXMgaW5jb3JyZWN0IHRhcmdldF9sb25n
IGFuZCBBQkkgdW5zYWZlDQo+ID4gbG9uZyBsb25nIHR5cGVzKSBhbmQgdXNlIHRoZSBnZW5lcmlj
IHRhcmdldF9zdGF0NjQgaW5zdGVhZC4NCj4gPg0KPiA+IFsqXWh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9jb21taXQvNjEwM2VjNTZjNjVjMyNkaWZmLTVmNTliMDcNCj4gPiBiMzgy
NzNiN2Q2YTc0MTkzYmM4MWE4Y2QxODkyOGM2ODgyNzZlYWUyMGNiMTBjNTY5ZGUzMjUzZWUNCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpPGY0YnVnQGFtc2F0
Lm9yZz4NCj4gPiAtLS0NCj4gPiAgIGxpbnV4LXVzZXIvc3lzY2FsbF9kZWZzLmggfCAyOCArKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gDQo+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRl
cnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NClRlc3RlZC1ieTogVGF5bG9yIFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KDQo=

