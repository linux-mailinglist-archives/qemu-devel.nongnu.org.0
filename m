Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07773B9CA5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 08:56:36 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzD6J-0000LC-9K
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 02:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzD4N-0007hR-Db
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:54:36 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:45474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzD4K-0007u0-Pp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625208864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2qZ0eqWF9jUzySTFpcNKvdSbcXgsYIwJ1bBTX3KIIY=;
 b=FrfbWuqBXRCOAPogii74QY6mPyBg4Qg2lpGXl0WB3qywJWlgEcppjrB2hdcRDVxom560ih
 QSKv9DazxMeBpc4CrqMH0S1ALx2ifTtqF19W4uu3uzxdZ77QsgYXEiK6m3/qO3tLi7SYTA
 YaFjc7RQP5pAQxAk4saZIWgCF4WHPP4=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-f9v0w3M8MP-2cdh-hTu5dA-1; Fri, 02 Jul 2021 08:54:23 +0200
X-MC-Unique: f9v0w3M8MP-2cdh-hTu5dA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZBPHqAsIvJAZmM2dfab0z0MjcHlE1EUEDEzcW5GFh4Hn/kwyCclGbnnjWSqE/Lr67hRzbFPUS34nm+nduYG2ni7igSoArb1wqQLBqoqKWTv54Qznbme3y0fLpKeUqe4N0iXxalpm+jcNYM3rg1sghUZV+8D4TAsIBwMLRQahd8/ZB6QGfGs/piqDaqcnE7ZB5g8e1cpSjgnWYoCbcWuWSP4pTbvt4rwhBFzgq9KoyuvbIGdOTS+0m6wHVLrbX0vXkl5+jHjJ3aIfj133qyhVYL9K5oeXDEeKsI/RIN8cniusiAncmezuT8SvlGVpLfX89Z2975Gvwg6Hz4rPd6F9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2qZ0eqWF9jUzySTFpcNKvdSbcXgsYIwJ1bBTX3KIIY=;
 b=DGGaILidZJQbuOo7fK39tfy5MpPnRvv27nvV1aaUNzqDRz/SP1WJMNUsPKNA10MaNY8y27ss0mFs4ig3z2+3PLr7eoA+1rK5AphjMXzAn3asBoYbzrlxb0Pg6S3MAEZFXCzVxas16QF+PK8fw4zbbW9RArkhHbUIob4hirl/POH3mjRpiKC6ndropfZEw4Ua6BDkXu9ItTXFZ7yfnkbUCrBCOPDEu/9rpGzxC4Rz0QsebvgfFlyO/erFacM+4YnHNQ33enyVZ75NZBB0VhtXis4wprNeft754vnP8wAyfb0WUANksvIkhyjDPt50e74SibjcOqeglSGpmL+nIHUO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Fri, 2 Jul
 2021 06:54:21 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Fri, 2 Jul 2021
 06:54:21 +0000
From: Al Cho <ACho@suse.com>
To: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: "david@redhat.com" <david@redhat.com>, Claudio Fontana
 <Claudio.Fontana@suse.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?= <jose.ziviani@suse.com>,
 "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [RFC v6 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
Thread-Topic: [RFC v6 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
Thread-Index: AQHXbPHRVULeDLTx2kKYySHsgDQZPqst6PUAgAFbUQA=
Date: Fri, 2 Jul 2021 06:54:20 +0000
Message-ID: <a4eb24a555fc779e0e75460de737d2a446dc52de.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-3-acho@suse.com>
 <f5f54248-170d-db7d-583e-811e0197b2de@redhat.com>
In-Reply-To: <f5f54248-170d-db7d-583e-811e0197b2de@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c0876bd-099e-451a-32f3-08d93d263842
x-ms-traffictypediagnostic: VI1PR04MB7007:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7007E8701CB22DB0E5B6DDF5A01F9@VI1PR04MB7007.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fce7tctLLj5MYBocjT731L+Cx77+VCKnVVGLnPIrbTjz2WRR/YvIpsuYsEq4n1B6WDRwJWcwLkUwsd7zcTnNaebX7gqi5AAuvCoVxWVZnrRZvn8gQzlpTVSMthiTSxvB2UZuQzJ243L7yquVlg+lHxetVy2WHYJ+IsOe21VnaYd/rJEJzZEL24YaENivGPwOtww739KMVsyEGEPjHcXR5L/IesMvQT0F5YZQC7cjNfhN7GiwvtAHccF9iwOqUai1mbgl8i0Dt8IbJsNG9vB0KUkYaW5tfHK9Ba2Jaw4XK8jqExSQpa7u1gil6moXc7MJNREZ1Btg0cDsOXoGDZ0KvG2sHc4kkel7IC6Vv4SdVyBx6bp/XO06l9BzZwrbl5bfBvjUkRUJR+Z5HyxlpUUizxF0WZSlEcwv78KNehbennJZwAwppJ+QhTP7dQARxmVJpkEut3k0dDxSw8Sg8Jj8DJbzPSBi+hbJO30eFJiyOL5r58TwYztqBD66kB7ALv/xTkJUa7RllslEV9u9KgfMGp8fcgiRt4W8VwgDplNWJU/cuLzX6V7qnJ4MfXpnlEluq4b8TSbBRC0xW5bJncfZuLovDxjZjRCbhnDYzp+x2JcFYiisG2ZSUj0Wn7rEL1ZXXbperO+d8EA0G3Hd7wp1dQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(136003)(396003)(366004)(346002)(2616005)(110136005)(64756008)(66446008)(36756003)(26005)(5660300002)(478600001)(54906003)(186003)(66556008)(6486002)(6512007)(66476007)(8936002)(71200400001)(316002)(66946007)(2906002)(76116006)(83380400001)(6506007)(122000001)(4326008)(86362001)(91956017)(8676002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VjOGE2aDl1OXRoTGxvbkpVZG1LU1B3dHZZQkpVQkxhTFBReWFjSkQ3Wk1k?=
 =?utf-8?B?M2JycW1IOHpJYjVqRlZiUGc2NHgyRk5YQWNSMGZZQ0VjZG5XejZRMkVpWjI5?=
 =?utf-8?B?YS9VUUVWOE92aUVSTHJiR0o1c3NlQkEvVmFvWDUvNjBJMXpXK3QxLzRlUXJn?=
 =?utf-8?B?Yk9pWnRpR1lqYmJwQmt4QmZNdGFHMks1MWVDQWhTVVhQSmRZdEhtL0JLVXZ4?=
 =?utf-8?B?cW5pYXVMOWpBL3YvRTdoaDJ4K0hCc1MvU1cvQ3dhbjR1MldWT0dSQm1QOGZn?=
 =?utf-8?B?QitVS3E5RUoxb2FIektJbjR3NDFsZDNReFI2S0NzRWZWTU5DUlVTNDBQREt3?=
 =?utf-8?B?R0c5NTJHTk5yYjJydXJyeStneWRKZ3Y2NGhWcEh1V09BMkJ0T212eWFDSno3?=
 =?utf-8?B?d0NxR3hKODZxTGdKMWxrYU9ha2pneE9YUDJZWkczaVBab20zT3M2UlhENTVX?=
 =?utf-8?B?ODNKRGJhQVhzMUpMZ0luUko3d3k5eks0dWxJNkZxZW1wb21ZU1BUdnZ2Q2R4?=
 =?utf-8?B?Wk1Va3BFWHNQR3VLUTlRVnZ0RHNpWGgyT2FnRGt2Tlg5Q2c1eWkzb3hZQktx?=
 =?utf-8?B?OHpLUVA1ZXczMzEyRit0ajlyamdBTFJpTnJRRjFKRjdiY3FOVlV0a0p4TE14?=
 =?utf-8?B?dzI3RDh5cDVNZ2lBWUw0S0diK1RzUzI5eGlybEZmVE0waEtCMGFtL2NWVEt5?=
 =?utf-8?B?NzVyYXoyQmtvZVFlYmVPMFJBdjVKVUZhT1VpeEp1VDRjdDBZbkhOWjdoUEEx?=
 =?utf-8?B?VjBGRVZUZFlsZFQ4ZXpVclJTT3FLcGlMWEFLRklMOXpjNitXSktTeGVHY3RI?=
 =?utf-8?B?bTk5em54a2xFT2Mwbi81RVU4Qjd1c0RqZ0hTc3hQYm81OFhuR0ljQ0RpMG5q?=
 =?utf-8?B?UFhITEZ0eVRLcjM4aXZKUytybDBZWGlZd1pzeDNjYzM3amZUb0FZS0lkQTk2?=
 =?utf-8?B?dTBBYkZraGcwUVJaQ0E5aTBuaXhtSzNLR1lzNkFwZHo4NWxjM2gxRVR1OGhD?=
 =?utf-8?B?bVpTWTg1aTFXejdDTVJUZTZSdzhmVlhJVStpSE5KRERMVHU5SWxXWDk1aTNU?=
 =?utf-8?B?amhzRzhlUEV4cm1QTTBJQmZiVmxwcnh1SDJoZ21YL1pOYWVIYVhXK0RvYk40?=
 =?utf-8?B?S2o3YmpVV285YWZlWHFSR2lydHZlb2tRbUt2MTNQenFpU2FnY0FUTEVVMjVh?=
 =?utf-8?B?TGh2ZUIrV1BSUStPZHRBT0ZZdUZWTmhhUFlrZDJ0MGs4c1FIdExSVmtlNS9X?=
 =?utf-8?B?Ykx4VmZIb2t6cGNLODM2OU9oM0hMQ1JZZWhFUWQ1ZGp0ZnVPR1hlY2lYVzc0?=
 =?utf-8?B?UDhyWm9xVVVaMjVIbHIxb2VQV0xxbWsvNVZRZjhZYmtTZm1tZzBoTkFHZlM2?=
 =?utf-8?B?RXhXYTRhV2N0aEFuSHMwK0ROMnk5U0Z6YmJLQml4Q0tGUzNKL0Fab0xSSCth?=
 =?utf-8?B?WnZwY09qQ0JCQnNpVThxRTNhTWlKNHFMSzI1K3I1TEtqUEZrcHJtM1hGNWJN?=
 =?utf-8?B?RERWcjkzOFoyZlJ6cFRLUGxoQkJ6eHU5MFBaQTRiTzI0S0kxMVpCNlFqbm9x?=
 =?utf-8?B?ZkRtT3haY28rM1d6QUZsZnp4dFVSanhSNURhVTFoK0NmdGljbVdtN2hvL2hO?=
 =?utf-8?B?U1hpcDhJaUJROFQxOXhqZnowdDJ1SkxmZU5hemJEYk4vNHFBUHRyU1hzSVJJ?=
 =?utf-8?B?NDg4dFdLd1NVQ3RlSmh5bXQ2TExxNVRmc3JPeXJ1WHViZ2JoK2FpK2dTN291?=
 =?utf-8?Q?fsKvkvsqo+ICegYQmq8Rolrz4VDaWHYgZARY2q4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <838943F9F216AF409DC3CEF034B855E6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0876bd-099e-451a-32f3-08d93d263842
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 06:54:21.0000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJI98S60tMZ13QLzpavLaY7kKcAnEgk7bDKRZX9GEnkU2awmWG3emdp6SQVZJ8yj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDEyOjExICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
T24gMjkvMDYvMjAyMSAxNi4xOSwgQ2hvLCBZdS1DaGVuIHdyb3RlOg0KPiA+IHdlIHN0b3Agc2hv
cnQgb2YgcmVuYW1pbmcgdGhlIGFjdHVhbCBxb20gb2JqZWN0IHRob3VnaCwNCj4gPiBzbyB0eXBl
IHJlbWFpbnMgVFlQRV9RRU1VX1MzOTBfVE9ELCBpZSAiczM5MC10b2QtcWVtdSIuDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpbyBGb250YW5hIDxjZm9udGFuYUBzdXNlLmRlPg0KPiA+
IFJldmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQ2hvLCBZdS1DaGVuIDxhY2hvQHN1c2UuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIGh3
L3MzOTB4L21lc29uLmJ1aWxkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0NCj4g
PiDCoCBody9zMzkweC97dG9kLXFlbXUuYyA9PiB0b2QtdGNnLmN9IHwgMA0KPiA+IMKgIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiDCoCByZW5hbWUg
aHcvczM5MHgve3RvZC1xZW11LmMgPT4gdG9kLXRjZy5jfSAoMTAwJSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvaHcvczM5MHgvbWVzb24uYnVpbGQgYi9ody9zMzkweC9tZXNvbi5idWlsZA0KPiA+
IGluZGV4IDMyN2U5YzkzYWYuLjAyZTgxYTk0NjcgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvczM5MHgv
bWVzb24uYnVpbGQNCj4gPiArKysgYi9ody9zMzkweC9tZXNvbi5idWlsZA0KPiA+IEBAIC0xNiw3
ICsxNiw3IEBAIHMzOTB4X3NzLmFkZChmaWxlcygNCj4gPiDCoMKgwqAgJ3NjbHAuYycsDQo+ID4g
wqDCoMKgICdzY2xwY3B1LmMnLA0KPiA+IMKgwqDCoCAnc2NscHF1aWVzY2UuYycsDQo+ID4gLcKg
ICd0b2QtcWVtdS5jJywNCj4gPiArwqAgJ3RvZC10Y2cuYycsDQo+ID4gwqDCoMKgICd0b2QuYycs
DQo+ID4gwqAgKSkNCj4gPiDCoCBzMzkweF9zcy5hZGQod2hlbjogJ0NPTkZJR19LVk0nLCBpZl90
cnVlOiBmaWxlcygNCj4gPiBkaWZmIC0tZ2l0IGEvaHcvczM5MHgvdG9kLXFlbXUuYyBiL2h3L3Mz
OTB4L3RvZC10Y2cuYw0KPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiA+IHJlbmFtZSBmcm9t
IGh3L3MzOTB4L3RvZC1xZW11LmMNCj4gPiByZW5hbWUgdG8gaHcvczM5MHgvdG9kLXRjZy5jDQo+
IA0KPiBNaWdodCBiZSB3b3J0aCB0aGUgZWZmb3J0IHRvIGFsc28gY2hhbmdlIHRoZSBjb21tZW50
IGF0IHRoZSB0b3Agb2YNCj4gdGhlIGZpbGUgDQo+ICgiVENHIGltcGxlbWVudGF0aW9uIiBpbnN0
ZWFkIG9mICJRRU1VIGltcGxlbWVudGF0aW9uIikuDQo+IA0KDQpyaWdodCwgd2lsbCBjaGFuZ2Ug
aXQuDQoNClRoYW5rcywNCiAgICAgIEFMDQoNCj4gQW55d2F5Og0KPiBSZXZpZXdlZC1ieTogVGhv
bWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+DQo+IA0KDQo=


