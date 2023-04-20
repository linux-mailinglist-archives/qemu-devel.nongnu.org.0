Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A96E9976
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3U-0004g5-R5; Thu, 20 Apr 2023 12:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3S-0004fg-JX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:42 -0400
Received: from mail-he1eur01on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::718]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3R-0001R3-4d
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2SFilkt+0K6wS+BwN9ANzSvxM+nxjECHO4AXgET6PGOW/tKrcI84DQ592y1WEiUZTQ5+pI5QYhQ6epy2kOJ8G0VNjqFMVfjh71mBW8PGf8j5ye6/9LdGCa+YtFWq2F9lb1NrTO9OyDxdUaQG5xjK4OD3IJX2+9V7exG4KdYGW03X+yEuKgcvn470fQGSk7z9FCWmlHTvlgAdlEjsnbhypdtUI+NwtWIO2U8S1/lF2B7L2CeJpPGaU0XOjafmuHH1/3Qq0W1EjObsT1e9WDYsNNoROtTH59ZusHn4FnjVVxWX6WcwMNhVgqZg05/9WqrxPfGvDxm6a5V69wVp3EROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK3MMgpZaqHO/OZBt9KasYG5Y9I1zs8zKZ0dsZ8IUtU=;
 b=HIrc9mmFd/HTBY1RYjzEbARuSImZOrhOCL6PGnSzwB65EtSNWjVi1FY/ykn9I4XMuBD7ywT7PEqxrFsmFSCdFM6OM6NJhYbVlfxgTLNPPH/lJ7DVFV0ZmyujhBaugmJCyNHVWXEy89iyiH0fQR8Yz5vLsx7LHci/jaB/EbEDLtExsbn2uBegAbCFGRIgKnqDwWi2HUCjK9U1/qegk31u0/akK0snDrV67Yt//lb888wFuHZAZsXTn6sf/+ZvA6xNz2/3Vas4MjZM/RWCCWzhV4gHqJm5HTTs66tj3DniT99aACZX4Y+sVkfiGA6M+/+cichfdpCqjDl6LNPN0CCBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK3MMgpZaqHO/OZBt9KasYG5Y9I1zs8zKZ0dsZ8IUtU=;
 b=WDB7wb33uu4FOw9Xr6HHXMqUtdgNw3ik8hs47NUI/sCEOmPGS5D8N028KNIG/EjDbNILLDOl5TmTlBx4FbMOBVSkNPzVk6Qg/f56TwrpfUPQlqamjJtX5fdkXWgwbqok/lHFyLEqqeWv2xnA4Fdma6i18BG6Hh6JthllRCDXbJ8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB1867.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:347::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 16:22:34 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:34 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: RE: [PATCH v2 31/41] igb: Use UDP for RSS hash
Thread-Topic: [PATCH v2 31/41] igb: Use UDP for RSS hash
Thread-Index: AQHZc0veG4KbrgqAsUuX6bxqv24h5K80XDXQ
Date: Thu, 20 Apr 2023 16:22:34 +0000
Message-ID: <DBBP189MB14332AAD8C2211ACE54217B595639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-32-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-32-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DU0P189MB1867:EE_
x-ms-office365-filtering-correlation-id: 700b81d9-a70c-45f0-a13c-08db41bb72c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FzcfI9++4hAePBHyZJEnzep6lN04UzTDTUFOwnSC0dyeMCphhCNaqeIAQqfYXXICcDO2ssFsuXK+hNL914f6PfcuGaOm87VfffteXOdc5cRNJ0bbJpDuW4PeN5QHNWS5cPQNEXuVRs8TkhI1bplDWeepXL5W9eNiINgF4Arw5lQY4mz5I4o8fDMxuF93Vy+JUka5Ob0FuuSo817Wk5cFoICDxP7xkG7Nug9DPJnm2FYfCYDRPh3RrPbybtLfmkyIFiErxsnTdvMXsPu59Koo7EFcLW1Kwe1mpAFhuYjlq1NVS26kG9A6ESu6htGpVPoCR3UnMYBDXcNAv+jlsgpqa5hD9PT+XAFmbsIyaZFfNgLgKuctYhdBx7vY6ESZ3AnnFCMoj8uoK4gOFYvyVgnQXfWlpNiJx7gbIyRI+pnnih1d5GyarfMesgS3IIjI9Attp4qiNxX+BlAjJpShhFpf9Fn08zh8ziMWEI3TA8ODT/KpSvBrcDKDFqauxCpo3EFLcg4qUNdOS/8k657+MzH/m/EvyFCrQMmUlWG7B0qi1zbXVaT15nTWzHRnzPovIYec/HpvkAMPpJTPCXloAKFDiC7pVVhguKhqJN1tY/aOakdvMCokFWhICl51B4pN/M/y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(39840400004)(346002)(451199021)(33656002)(6916009)(4326008)(54906003)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(186003)(478600001)(71200400001)(7696005)(55016003)(8936002)(41300700001)(5660300002)(8676002)(52536014)(2906002)(7416002)(44832011)(4744005)(38070700005)(86362001)(122000001)(38100700002)(9686003)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlZqeGpHSytNNFZrTVBtOUJ2bytWZGtDTHV0UDI1YnBPQ2pDbXNaMnN3M1Zn?=
 =?utf-8?B?YTNNdzl6ZUQzTHcvQ0g3LzR0NjFmbXlZT2tpTE9VaVIzc2RUOGZKeW92SGtN?=
 =?utf-8?B?N1FSY05hNWU2a0RXRDg5QkpqdGJwZ3Z6MXV0d1c5TklEQTdwVU02MVAyWVFh?=
 =?utf-8?B?TmRtazArdTFWcDZoN1F5U2F5Zm10VTJUVEpSOFBHcHczWGlRdGc1eHgvL1g4?=
 =?utf-8?B?b3E5c3FZMUs5clBONytubmJJUEx2ME9VRFlHcU05K3N1aG80WXNsZllyYmlw?=
 =?utf-8?B?bEQvTkVBbEYxVnJsUzRqK3RkbnZVZXduVnNmMVBTUjNGM3NWNlpudHdFWHNJ?=
 =?utf-8?B?RE1iOEF4TU1uVi9yWHZDTHBrZ2JUSndHK2NFYkRVVWcxaU0yVlRhdnRkN0JY?=
 =?utf-8?B?ZmlrT1V2a1AyUUJ6SDc5OG02VStlNmJqWUVIaXBsQjNUTTA4TmVVUUVqZWRo?=
 =?utf-8?B?NFV4Uml4eGN2NURpRG01Uk00dDVhanVpbjdQby9UR3dYUC9RV1ZkcElpcmMv?=
 =?utf-8?B?bEdmc2IyRkhUcDdTczBvcmw1MFBjSnk4TDVaMUR3clNKQ0tTN0J3ZysweWNp?=
 =?utf-8?B?Rm9IVTA1cjB1TDlMUVVVSGNpVHFEbzZKMitDcTQwN01YMjVGMUlEcy8rNVd0?=
 =?utf-8?B?MksrMnk4bWF4ZTJlRkcyZk9uQ0FBNEY5Y1oyQkhFei90aGU5NWxrZzNlQ3ln?=
 =?utf-8?B?RWVkOFBJUlhqakUrWHdjY0pzb05wR0dFZ2U1dHJPZ0dSdGZSaE11S0MzU3Nx?=
 =?utf-8?B?Wk9MUWNxTTZ3bkZrSXBnWWZSSDM0RzhGczQraVlkalUrUlFIbnFlWjA4bHlw?=
 =?utf-8?B?SWJ5UCtHSWJMUnNQYVdMczM3U0E4K1lOMWNOL0cvOE05aXJpN0RBbVZYNDdy?=
 =?utf-8?B?RWV6UHJaNzBsQ2sxUjJPK1lGR0JSMC9IaG1UTktzU3Z0VUR0Z1l3RzFkTVJq?=
 =?utf-8?B?dmRMeXhUcmh1NXNDZmh4OE5MNmZxLzB6Vy96Y2NaU3Y1Qk9MdnVhVllya2xi?=
 =?utf-8?B?OEo3WFk1T0I2QVpwOEVneC9PV0dwWnBNZUNnU0JPV08xNGo1OHdDZzZDakVl?=
 =?utf-8?B?WituSytyc1pONUJWeE1HRkZReXFFbS9qZzlUYnJadTkwclJLMXc0K2N5U3By?=
 =?utf-8?B?dmx4RmVKS3dtT1FiYkJlMUZ3K1E4Vkg4Q05tc2ZsMGErc0w2cno0T2pHM3N3?=
 =?utf-8?B?QTkrRlFpeS9JMXVITWpucm9PYXVFMXNNRUtjb2djM3BVeFl6QTNUVHdqSjVw?=
 =?utf-8?B?dW5aSldaUzdFaUtkZmdDY3VZTEpwamxseGc4TkNqLzBVWW82cWRud1psdDJu?=
 =?utf-8?B?UXVXMkZlMnZTckRCRm5KTFRVWXMwQmxBUDB1bTd4K1pHRGhhS3pWQ3hIaDlq?=
 =?utf-8?B?ZjJ4UURGQ1h1UGsyVTIvS1ZuSmZiUkM2dDIzcFBvVkhjbVJmQllPUUhpdDNy?=
 =?utf-8?B?Y2xIQysyeDI5c3lKRHM2Qlc2UDN6QXpXbTIvajZjUGhEdVdJZXpOb1dFSFVD?=
 =?utf-8?B?amdtNVFwVndYMTNuVjFReEtFSS9RRVZZS05KaWNycXpCRUpjZSs5cXEyUFNy?=
 =?utf-8?B?WVlnTC9hS2J1dHAzUWJNMUdIRGs0YU1aMEc5NWNzbHlWTWowT3VrNSttcWVi?=
 =?utf-8?B?OThIRnhNT2FCTXliNlFwQVNpMFI4aVhNTmswOVZWVmU1MnBLMi9FVG5qemFK?=
 =?utf-8?B?YkQ4dkRpbHJOZnFNUEc3cmpmUUdlc2dkdENlWElkREhqU0R1RFNxdnNFYzZI?=
 =?utf-8?B?dlA5MklhZVZ3MVlyU3oxb3BVZ21kZ2Vsa014L2o4UUU5bmdlMHFMVDY1V0p5?=
 =?utf-8?B?VkVRb29HOTlweUR5aXB3VkMyOU9oUHRJZXZya1h4MnNPclFDS0JocXNqTTNU?=
 =?utf-8?B?eXpjdjBUTlJIcVhFQjFCeG1ndWtDUGVkS1NRQmNnRG90VjlyTklvYmlZcVpP?=
 =?utf-8?B?NzhrWFl1dk81dUxkekswZjZ2dnErcW0vSzI3aytyMnRPT095YjNiYVMzeWgy?=
 =?utf-8?B?V1g2L0lrNG45S2tHcTZKUDA2VE1wTDV0ck91TnhEakZWUnJkTWxnRGpiejhy?=
 =?utf-8?B?OWZPSDlWeVJVOEdoRTl3VHM2VTBwWDRMQ1BrMlVkN29CT09LOGpQVXdFTjJ1?=
 =?utf-8?Q?h5nRkUoHX346OPwP7lNvx3M1X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 700b81d9-a70c-45f0-a13c-08db41bb72c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:34.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hav5LzfoR/039CqXrxzxQMOyiBuOtlpbLRc7/JI2ojxvbFD7GzNHmxpt66xcY1clLeUq7bymsb/02bFeQ6/VxdkZPqNTm/P2csM4rSCy9Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1867
Received-SPF: pass client-ip=2a01:111:f400:fe1e::718;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBUaHVyc2RheSwgMjAgQXByaWwgMjAy
MyAwNzo0Nw0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPjsgSmFzb24gV2FuZw0KPiA8amFzb3dhbmdAcmVkaGF0LmNvbT47IERtaXRyeSBGbGV5dG1h
biA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47DQo+IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsg
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsNCj4gVGhvbWFzIEh1
dGggPHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdh
aW5lcnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGVi
ZXIgUm9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJl
ZGhhdC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnOyBUb21hc3ogRHppZWNpb2wNCj4gPHQuZHppZWNpb2xAcGFydG5lci5z
YW1zdW5nLmNvbT47IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIHYyIDMxLzQxXSBpZ2I6IFVzZSBVRFAgZm9yIFJTUyBoYXNoDQo+
IA0KPiBlMTAwMGUgZG9lcyBub3Qgc3VwcG9ydCB1c2luZyBVRFAgZm9yIFJTUyBoYXNoLCBidXQg
aWdiIGRvZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9k
YWtpQGRheW5peC5jb20+DQo+IC0tLQ0KPiAgaHcvbmV0L2lnYl9yZWdzLmggfCAgMyArKysNCj4g
IGh3L25ldC9pZ2JfY29yZS5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspDQo+IA0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFt
YW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0K

