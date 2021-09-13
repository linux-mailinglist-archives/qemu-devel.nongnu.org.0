Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0278A409E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:55:50 +0200 (CEST)
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPszU-0001Mk-IK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mPsxR-0000R3-Q5
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:53:41 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:14946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mPsxL-0003qC-8S
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631566415; x=1632171215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZvpwn+2dyTlt6izka8Q/4FMKO0JW4UXavdclHSZDGU=;
 b=TC6bYo9/rMxY9qs7mJXIGEN3Am/SPpRaq3wWRaYDEdUt8xkMBbdYwYpv
 mi84t7zNNFo5D0X/uzLLHOcW2O+uHbeH/dlev5HtTuEAi522ntqMfGq3m
 FLI9azfrvPGv4wayC+tPJ6w3HDJr9FQz2Id04ua5kcwA5ai5V+JYaGBgt 8=;
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 20:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvr+mFwLi5zzB3gpT1tpUF8A/3AA6BE7nkaklGuoHhMMIWVfC0fxPkxKyCyFJYAYAVjdF0u0WKiTKhoVKUoeK6K4FhO0JnNS3E0hUbseC19R5OjUWFfc5LXxjsDgFHz/iqi2NCMz9k0TxLRNHaQrm5Eg1SkQMbzkDS63Rvt4H8H4K3ZBmx9/4bb9hal9sqXVcn8Gh1rV0gvQC7yuytnc6sl7TJs7LXx9Uh+4HEopNoER8utYnqqowfDAC7JdW9tdq14GmyMvnrBSR2r4sDu5kR0Pw6Bf49SIwmkx/YSqns6VAcFmZHOY7bb3zuJMKSJKh5LHXSONjZTCh2f9lGxQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yZvpwn+2dyTlt6izka8Q/4FMKO0JW4UXavdclHSZDGU=;
 b=bohRDm/y6IDoMhzaOngSkgB7ZULkim5P0mv/nNOyWJZqKd8OPZ31cdyNFintoJx/DsXBMFOGfwTOJncHpppvzbWoOSwSqBvGcD8zfEupgZjHm/MAJNKckI5HgZ3zmJLFNzlnD+L9E+hIQrkoHGBhJFKZxiI+7QYBV99+od8h5Up97ymeSz7pXsD8wZNNuWIVFoiR4wdTNbaRvVePn5mnHy9EipMhIQu7QBBawtouvfvXoBxjVnNBn4um3TfD4wHNqZGIOc9GsWCDHuiJL/2DD5AcYBglFGZF3tHC4rrja6CEAIJ1X1eieQJxAVumRuuu2vbcmqXY8aiZNjVISHlGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4367.namprd02.prod.outlook.com (2603:10b6:805:aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 20:53:30 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 20:53:29 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "Waksmanski, Lukasz" <Lukasz.Waksmanski@dolby.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [qemu-hexagon] Error mapping file: Invalid argument
Thread-Topic: [qemu-hexagon] Error mapping file: Invalid argument
Thread-Index: AdeozIwi+cc8yHW7R+a4XjyGoi0IxgAEBf2AAAEfmsA=
Date: Mon, 13 Sep 2021 20:53:29 +0000
Message-ID: <SN6PR02MB4205F58D299FB23AE59105CEB8D99@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <BY3PR06MB7922F6CE4B3A9CE21294B359E0D99@BY3PR06MB7922.namprd06.prod.outlook.com>
 <2a203934-a688-f879-17ca-2c59ec40fab0@amsat.org>
In-Reply-To: <2a203934-a688-f879-17ca-2c59ec40fab0@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2a6839c-4724-45aa-c479-08d976f88a95
x-ms-traffictypediagnostic: SN6PR02MB4367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB436771412F906242073595E5B8D99@SN6PR02MB4367.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qe5PB/WNfj1N2TvxOjXi69heKnVXq7z1+YCjNesbeTr2MJ3YrvCaKL97eJaN+gzfULm7DxvT89Yvomfgfsuvb0keRmh8kwC8Ipf6u2N0ioMoUrUMCn482gHzxDDGplAgwg6YjKGroyYKwklBrX0VyjTnPk0yqjXkZmpr3t+Yjiu+jmWlwzS+IZ8O3bN3ugtWLlQyM6xQWvXEfRVrpHcHfJa/wDf/n3cluoEyptKK1cmvER6GOJ3IIvn84GMXHzjcmS3lwJTS1h+tQ9Qd9K6p5ty1LaZ/ZB4CmoVN+fiHWZHFrnOGwBPgLdyz4gmi8WG5GQJT5NaGxkGYmHL9+ktitxp0zCKTYJoTpBPjhSFshkEsXHLSVwO43T/5YerTY0/9Aqe6xitAc7Hy3xXbABfoFP2y5F7uvJIIOWrI6atUkuYksUJQ+ligg65ICxGmpNOSm7QZwTr47YpoNQvPCe5LTF8mk/ASnwtKTSWWPm+TxyuzEErhevD5eMkejBByTpYBhmc3y8geg4NM3trJTAHMolf5k8gg16wku+5N70RLBZ0jGZMqdrBpMfG/8sHNknyTg9RLTFrHPrIN9/VP8bAwiYFE1S83wakAP4TUzx6XXL9fEtlmp8VbAobdw2fN/ePheXCedt6joX+yjNLs6gz6IG0MSPnJXQQ6re2WRW79SrEiP0stKKkg5VUkupVQbNH9PS/e9KqFRcj5VlJLdZxAVbeDH0UySIZPFPg3gmNl79sIjaIF9WmGCLO135YnFb6WIfWu+Wm9xtg2VvsFlhh5TYRfM0YM1V8JWKnfaSxY9Qk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(5660300002)(52536014)(83380400001)(71200400001)(2906002)(38070700005)(478600001)(107886003)(86362001)(966005)(122000001)(110136005)(316002)(53546011)(6506007)(66946007)(55016002)(8936002)(26005)(186003)(33656002)(7696005)(66446008)(64756008)(66556008)(66476007)(9686003)(8676002)(4326008)(76116006)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2lzZktVVHdrdjlUMWdvT1VSY0hOU3N0NXVYV1NQdyszcnpWcHd0Wmc3N2Nt?=
 =?utf-8?B?Z0EzRzA5MVgvdFJaQW5tUFJQNTVJSGJ2YmtIRlhXdzBMd014VUJsbmxJNVMy?=
 =?utf-8?B?bFNIcDV2eHhMcjN6L1MxYkROclNlMGI4eDMwLzJpaFgzYW5WaEUwNlZ2NllL?=
 =?utf-8?B?ejVmdXE0emJsNTBaWjBKcjlhek5IV1dyS2g3aVdhR1NDWkFMMXQxL2NBUm41?=
 =?utf-8?B?c20yTEhoTDl2R1R4YmhicFlmV2dVWHdRWmN1Q1p2cnJrTUxyemVVQVdOZ2o4?=
 =?utf-8?B?R1gzVnRmSmxGSGdhUU92VEhFK3VZemFwM2VtNEMybTRJNWJkZkJQWmdhSGFQ?=
 =?utf-8?B?NXlXL2xSbG5KOHFJU2JELzk0aSswb1V2UkdRTGFqUXA0NFJpM1k0eGZocGt3?=
 =?utf-8?B?UzVRUk5aQTN2VCtQTEgxR3M4ZFRLMER2cFNMb0YvVW1UVk1UTElWZlloR3BJ?=
 =?utf-8?B?MzVOcWRhKzJON2MzZk5YaGFUUHNUSE9LZ2w0UnR5dFArcDVIa3crR3AxdC9s?=
 =?utf-8?B?akl3bWJsblYzODN0dUNiTE1SMmRCY09PZnNCY0ppbFpUN2hZT3dpanBLU09I?=
 =?utf-8?B?WFRKN04rK295RzYvZ1lVS2g1TllpSmVENnlVSkZnaWQ1QkJGaEZFWndLWE1H?=
 =?utf-8?B?Vnhwa3kvTGRMc29mUG1GUXdQckNBTTZQekZZcmNFNEZtM3VYYWI2MmEyY0Y5?=
 =?utf-8?B?SmtseXJwekVDNlIyUXkyUTBLczFhR3ZtdDhRUm5NZzRxeUQ2RFAwR3FGTEZu?=
 =?utf-8?B?NW1rZHBJcEVJb1FweDNMWkJpc3BSTENPaGlQejJLSURGc3lSTEMwSnpSOVhY?=
 =?utf-8?B?UWw5bzFWQ0x4Tm14U3d5QUhUMTZzYzkxbXJXbFRrRFNBRmlVcE15MDhSUGFi?=
 =?utf-8?B?REp6WUJQRDZFSjFya2tiRFNmTVZibEN5WE9hZzFvSWZZL2RIM1greFkycmhi?=
 =?utf-8?B?eE01RzJZa3AvYUQxTXpGcVl4U0ZvMXVsRXVMeDRPV05XUUVCVmVmQytDNWJs?=
 =?utf-8?B?WEpzaE1qQXpMQVpWU1dhb2FWSHBkM0RqQTg2RkQ3YTZ0RGxCTW1qWWNZWTVH?=
 =?utf-8?B?RWpBeUhxbFBhNkNOQno4VHg1ZTlLbGYzcE13WHZMNy93UzYwdFluVnZSWDQy?=
 =?utf-8?B?SDlYVnl4Q1BhSjE1TVVEM3NWQmNRVzYreDlrUGtRamVQNitaMWlqeURHeVNN?=
 =?utf-8?B?VllONmUwa2V5eS9qT0IwMzlUbzNPd1hWUzZKOHd3TG50ckV2cVcrRGVXSER3?=
 =?utf-8?B?YlJnWUhCbVFFZGRyUE5pSEM4YlVmc0Z5Y3R5bHNyNzI5bXpUcDdiOFBQY0Ey?=
 =?utf-8?B?eGpJcmlHT2daZkcyTVJTRTFxK25KTVI1aXo3NVBpRjdsZ3NacDhOd2pCNTBs?=
 =?utf-8?B?RlZpQ3pZdnZHZjZJcDAzUnVSMUI4eGVvRHRaSlhPS01KR2xaNEFUZjdlM3Fj?=
 =?utf-8?B?ZytMaW1kNVBwdXMyU0Z6cVljWjIwTXdNNWcvUWxzdXhEbUZORy9ZNnVCKzdU?=
 =?utf-8?B?dHptZWUrOFVvNTVDS0NOMFBScGNyU2IrVVRTUi9kbnFXRDNJYlRkOVIxUFdR?=
 =?utf-8?B?U293bXQ0RkJIM29peUhCY2VXQ2l5NUpBdnoxZXIreTdwNEduQmRldGZSVkFx?=
 =?utf-8?B?WHA3bGZTWEcyNWZKOTBjZGVUQTV1OTkvSGw0bGhpOWE1Y21BOUNHb3VOckIy?=
 =?utf-8?B?dWl1YWtSbTNSd3dSTXpDdVg1OUIrUXR4Q1F4N0dRU2FyUXBtUGpqN0NBYjhG?=
 =?utf-8?Q?P4HmKbofpj3Hze/rIL1qiYE5y2u7oGQ5AI+jzxH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a6839c-4724-45aa-c479-08d976f88a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 20:53:29.6964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57tbKYWQiIluLs888qtIZVKXB/4McsLxnKDxnfL3gK5aDXp/Ob9pYgUk0LDUwoAZbiaddy60TKVYt1e4xVtJUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4367
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbGlwcGUubWF0aGlldS5kYXVkZUBnbWFpbC5jb20+IE9uDQo+IEJlaGFsZiBPZiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxMywgMjAy
MSAzOjE5IFBNDQo+IFRvOiBXYWtzbWFuc2tpLCBMdWthc3ogPEx1a2Fzei5XYWtzbWFuc2tpQGRv
bGJ5LmNvbT47IHFlbXUtDQo+IGRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW3FlbXUtaGV4YWdvbl0gRXJyb3IgbWFwcGluZyBmaWxlOiBJbnZh
bGlkIGFyZ3VtZW50DQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeSBvZg0KPiBhbnkgbGlua3Mgb3IgYXR0
YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IENjJ2luZyBIZXhhZ29u
IHRlYW0uDQo+IA0KPiBPbiA5LzEzLzIxIDg6MzggUE0sIFdha3NtYW5za2ksIEx1a2FzeiB3cm90
ZToNCi4uLg0KPiA+IFJ1bm5pbmcgaW4gcWVtdSBwcm9kdWNlcyBlcnJvciBzb21ld2hlcmUgaW4g
bW1hcA0KPiA+DQo+ID4g4p6cICB+IHFlbXUtaGV4YWdvbg0KPiA+IC4vdGVzdA0KPiA+DQo+ID4g
cWVtdS1oZXhhZ29uOiAuL3Rlc3Q6IEVycm9yIG1hcHBpbmcgZmlsZTogSW52YWxpZCBhcmd1bWVu
dA0KLi4uDQo+ID4NCj4gPiBDb3VsZCB5b3UgdGVsbCBtZSB3aGVyZSB0aGUgcHJvYmxlbSBpcz8g
SXMgaXQgYmVjYXVzZSBJ4oCZbSBjb21waWxpbmcgZm9yDQo+ID4gUXVSVCwgYW5kIHFlbXUgdXNl
cyBpcyBsaW51eC11c2VyPyBPciBpcyBzb21ldGhpbmcgZWxzZT8NCg0KWWVzLCB0aGF0J3Mgcm91
Z2hseSBpdC4NCg0KSW4gb3JkZXIgdG8gYnVpbGQgTGludXggdXNlcnNwYWNlIGJpbmFyaWVzLCB5
b3UgY2FuIHVzZSB0aGUgdG9vbGNoYWluIGluIHRoZSBRRU1VIGNvbnRhaW5lciBvciB0aGlzIG9u
ZSBodHRwczovL2dpdGh1Yi5jb20vcXVpYy90b29sY2hhaW5fZm9yX2hleGFnb24vcmVsZWFzZXMv
dGFnL3YyMDIxLjA5LjEwDQoNCi1Ccmlhbg0K

