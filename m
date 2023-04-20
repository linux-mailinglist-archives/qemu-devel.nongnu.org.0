Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AD6E9978
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3h-0004n7-FJ; Thu, 20 Apr 2023 12:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3f-0004mH-Nm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:55 -0400
Received: from mail-db8eur05on2071f.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71f]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3b-0001Vz-Rh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuRfWQoNgrRALNJ1Ux2xQK+Adzxb/lvbBoT2+eC1cXk5W8oq9Fn60xC+KBiPaSGwWQKkoVv1u8xXGdn79FdvxpUpuLnTMjY+KJCccB5GXMJPgVP4YqNQsWS2rroSekPD6xhjhpyGFYyMyUMVZrR+xsGJtO0NtQYuClaQO206gY3BrlHwvBhP0eWV2SXY+iG+mS8f4gn3kJJWXB88OLh+bw7ftRM40WiQFZx027lQ3Zvdbyz1vBt49RvGCsx/JHE7RJuM0b8fCxD0FvmBDiFUqHQYM6tLUeza8pshreJ8poUQjS68lr7Qt5sn+U3PrnkoPGE0XGt/6/HWxZqZvknQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9eaaFmjRzP3fl9WZsInxSS0GpGP9yN4FvcYYzM68vw=;
 b=lCLHtZ4EkD2yRBdWFmDHz7/mShvOdhsEuRMBgVqFpMzPGuZRKFpotORQLGq71y9L1CP/l90MFncTZFAiCEk16DkawO4Gm/gMNsR1kmbu1ib4tbZdSLHXjsk/J7XJbYPHl9wQiUfcjNGptOxi0MfTRFdkfLqhle4iV2okZbJGfVAoa6M6KPag2m9TOHxnL3JO4wiVlnqMgRr5brjN0U/xVVkcWhalcxVC6Zi5dqY3Mw/ETxE7IhSPWx0K9zmBcBL6gxS+2kcnT5bG4rqAAKvxR9ySsgnobwtJjhxXvEENIv2q8UipUCypIwgtYlquz1mMsVsVAXOeNWJ/oWyQko0TqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9eaaFmjRzP3fl9WZsInxSS0GpGP9yN4FvcYYzM68vw=;
 b=bkWPLAzQw1ZJJ5vHUCJwvsUIjLBV08WfuY5YGcwS4m94WugonfAGZpGquy3eZAXrNEpXiCiz9AWML8axElzRTiqGiIDFpLUo2R9LKWAKrbgAFH4PtqPNIddrMMgnt02VSJRZi95OP7ZFJXy6yqqrmn0Sxp7GuQZpzhKBzGpZreA=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2103.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 16:22:17 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:17 +0000
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
Subject: RE: [PATCH v2 04/41] igb: Fix Rx packet type encoding
Thread-Topic: [PATCH v2 04/41] igb: Fix Rx packet type encoding
Thread-Index: AQHZc0umiHuXZj4mTkSstTCxzK7Jt680V9dg
Date: Thu, 20 Apr 2023 16:22:17 +0000
Message-ID: <DBBP189MB143352FE222B8F48F2C4DC8595639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-5-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-5-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|GVXP189MB2103:EE_
x-ms-office365-filtering-correlation-id: 6e2f655a-928d-4dbd-1788-08db41bb6876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zmG8owgD/reAcHvjGVTMcCeUm7UhkbjiSU3dyvtASf1fZtTJZgKkp/LIpxggcsOJ4mZp6ZEzUfkCeop0b9gjEzh5if/APhbkMvLeqe0eHP3D/ohoi2a2wu41J8huLouffMlFExBOVcdRhF29WW9eGqJnjsGY5dThWERBEYIdCyi7/pICBReq16G6A35j4vWSo6cmKlkQlNo/8PW3xB+osTAnMnQis9OjXMwBVq2Vn+2gbGExipHm5TbWq2E5jTAOhu73VvfJWRtNeUb92XEFb/rj/w9JXsrk75dib9sK7xBMt57DeIGQmsxhiJsaOqPYTFHkw+5yBFnsk4NZzmX8IZ9TW5wAhm5kgFwX3sBmkJcyKt5qToRvahEhQr9YauCW/QMKrGDBQePEwLOae2nARINiY6zrD1wxLIMuoxMxgQowZYXxnWeZCgmWcfh0afa5HD16eLP4PrRMeceLdKFub7Ax0MaOGHG9PVnlcfzUXiUyVq6eeKOmGt2AJQBA5Pbh7wZa6/XQ3YoaPYTal1wrWq76zgTFOLmcnzG9vB2SBHaL2EVwpZttWr5o06NG0A0nX96ZegtEo6NSipUJSz77ERPN3zjes/lzgDW8WXL+Ml9dK0J9IGzRVUF8z+MQ42sj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39840400004)(366004)(346002)(396003)(451199021)(122000001)(8936002)(6916009)(4326008)(316002)(54906003)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(41300700001)(7696005)(478600001)(71200400001)(52536014)(5660300002)(55016003)(8676002)(38070700005)(7416002)(4744005)(86362001)(2906002)(33656002)(9686003)(6506007)(38100700002)(26005)(186003)(83380400001)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjF4UFZ1SnJaLzdyVFY2MTFDQWRKVm02cG02RS9ibmQwTldlcWtUcnBKTUky?=
 =?utf-8?B?Nm9iWGZpR1BsTmdzQ1BTSW1IWmx6QkJMQUIxVzN1cGE5ODJNNERudEowS1Fh?=
 =?utf-8?B?aVpJU3g3b1g0aUpiN0RPTlVvY2ZvdEZRN0pXQXRMYmQzYWY2NitiQXlEcXhh?=
 =?utf-8?B?UEE5aFpxTng1QTFNNzNhK1A5RjJ3SUJ1K24rS3M0MkZUaWdSZXNNK1JkekNK?=
 =?utf-8?B?QUJhQTloNU5hbFR1V0x1U2FWQ1dVc0NCcTBURTVvRnJubGM3TzBMUzdSRTF1?=
 =?utf-8?B?MHl3U0F2OGxLeDF6aStRcHV6RW4zdEdtbVgyOFRVakUxTk1WZ1pCWHE4dVBF?=
 =?utf-8?B?amVEclJYcE5tUXVGc3hONXdodnE3eklUamJCMmlYSFhNdVZSZlBEYzNGdnc1?=
 =?utf-8?B?M2IrUXZIV3Q3SHFXKzJnOWVoVUdkNVlZUytSdHNycmQrYmU3M2JWaTUrL1R6?=
 =?utf-8?B?RzF4dy8wSkoxcWdTbFJsZGRRTjlaRDV5akpheUdyL3N1UWJRKysyaHpGZCto?=
 =?utf-8?B?UkZsV3pNeFVZak05TDRla01jd1I4ZEg0aU1mUFpLejNTT0U2bzFnZXBQZjl1?=
 =?utf-8?B?SDFKUy92WDVuQ09XQmFrNDgyRU0rRjZFS2ZZSlZQaG5xZXRlWmNZcUpja2s1?=
 =?utf-8?B?SUxPR0JpczRxK3F2TGdHVFNwbVh0TVliZ0JTbURqcVpJeUZaTExwamI5aWRk?=
 =?utf-8?B?OWR3RnF0eGxVRjhBYlBhbHhHemVwVVJ2QnVleS9ZRXJselo1ekE4cHJZZHZj?=
 =?utf-8?B?cmR4QTN6Y2VxekcrTDM1aHFpWTE0ditGUGx5S3BzZ2o0OVpUWU9ISlFIYndH?=
 =?utf-8?B?cnd1b3dLdk45M2VZaWRScDhEanZ3bjFqNVUrakl6S2Iva1VyWUNyRWcwanNX?=
 =?utf-8?B?RmNvMHpldnJsNGFDdzluTm1zQ1dHTFRIK1RUclhUeXNKclhITmMwaUdpOHU0?=
 =?utf-8?B?VXZjVlp6cDV5ZFBZUGsvWndaeUVESkN5SmZ0UUMzbXB4MTZFdHl0Z2FCTWd6?=
 =?utf-8?B?TzM5VGpJdlVvU1hsKzF2N3hiR0h4SVVhdVc1VkdJRDRVQlB5VlR1Q01RWjQ2?=
 =?utf-8?B?RlNJbGJXMFZZVUo2TzlCcWZQK29HaXo4cHFLVC9sbGpqbUw3MmxEa096MzhX?=
 =?utf-8?B?Vk1JL3AzWWNmbzRYam9ZSTkrS0N5SFJxbmFiaFVoR2pMWlRCcENydjJRNzZz?=
 =?utf-8?B?SFVCakhBaVVCdjYzTllTM3VTK3lsZG01R08wMHpnQk1EbUZlWEkrbjBGeVdm?=
 =?utf-8?B?cGZna2Jqck5IdzJxUGNHcG9kWmtUYUJOZkRacy9FbXNpd2V4ZDZMVUhkT1NS?=
 =?utf-8?B?TTZZWGNsc081dTYxcHYzQk1UQWRPazRJR0RzNVpuMzJoeC9WSTJZaVlMSVJT?=
 =?utf-8?B?ZDYwQndsaW1ZQk5nUERvZUFQV3VtbEV3eHNPR0pYdE8vbitwaVJJeTd6KzVj?=
 =?utf-8?B?cmRLN1FtZTRpRjNybE1yVVlPczlKclM5YjNVbWFVTmJvbUFlU0lWUk5mZW10?=
 =?utf-8?B?dzZIVjVzSzZtS082WFk2Q1JOZTlvNVZjd01WSlZoWHhua2RyUW9OdFVzUlp5?=
 =?utf-8?B?LzIzSnc1ckpMN0E5OEErQ0V5RXJYOHZXTjFXNHdrS21oNXBYT1VNZHdlejZD?=
 =?utf-8?B?UU5OUmhncDZHQUZqNGRvd1Y3VXJZYU8zd09ZN2ljZzRadk5OYWEwYjBuTjhU?=
 =?utf-8?B?ZWZ5cTBuNjQwMzNmNHpNUGlEUnFPSm1LT1pBb21XL1dKYmUvS1ovdXkyMjV6?=
 =?utf-8?B?RkRPVUxRVkNXdnlxVHdPMFpHbWM0NVpjbFBITXJaZVNDSTlqbURWRE52MFNK?=
 =?utf-8?B?WkN1Nk81VmR3eVJqeFJFZ3kvNjB4a2hLMDJCR2NxYy9xYy9hRXJvNC9JeXY4?=
 =?utf-8?B?c3hYZUpNOERmQkU1R3JRY0pIY3dVR29Fc2JTS0MxbkVYdys3T1lZK0VFNWR0?=
 =?utf-8?B?K2ZSYmd0bDBQTUFmeTNBMU9ST25BN01ZM3k2RWFBV21FVllzcUJKQ2hwVDh0?=
 =?utf-8?B?V1VYbzdmaFJRNDA3K0o3NWhDZWRncXFJTWJ0ekkraWxRR0JObG15OWJqbTZO?=
 =?utf-8?B?YTBDeFY3b3Q1akxBVFdFQXZ6c2gxZjhPSzBYM2RheGNTZldSS2J0c1VhYzY2?=
 =?utf-8?Q?f6i4OiAwb3PiGdPXOkLe4Rpjn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2f655a-928d-4dbd-1788-08db41bb6876
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:17.0292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCbgEdu01AYjgqBKSdSDOlDY6reGWiZ0jPkqiSZHBywTnnCUuJks6HApDs8vPm5xaF5L3b+nEogJqHx10TZBA/8kkytsci6DuJoJd1EvfQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2103
Received-SPF: pass client-ip=2a01:111:f400:7e1a::71f;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
MyAwNzo0Ng0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
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
Cj4gU3ViamVjdDogW1BBVENIIHYyIDA0LzQxXSBpZ2I6IEZpeCBSeCBwYWNrZXQgdHlwZSBlbmNv
ZGluZw0KPiANCj4gaWdiJ3MgYWR2YW5jZWQgZGVzY3JpcHRvciB1c2VzIGEgcGFja2V0IHR5cGUg
ZW5jb2RpbmcgZGlmZmVyZW50IGZyb20gb25lIHVzZWQNCj4gaW4gZTEwMDBlJ3MgZXh0ZW5kZWQg
ZGVzY3JpcHRvci4gRml4IHRoZSBsb2dpYyB0byBlbmNvZGUgUnggcGFja2V0IHR5cGUNCj4gYWNj
b3JkaW5nbHkuDQo+IA0KPiBGaXhlczogM2E5NzdkZWViZSAoIkludHJkb2N1ZSBpZ2IgZGV2aWNl
IGVtdWxhdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rh
a2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX3JlZ3MuaCB8ICA1ICsrKysrDQo+
ICBody9uZXQvaWdiX2NvcmUuYyB8IDM4ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFy
YW1hbkBlc3QudGVjaD4NCg==

