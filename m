Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901332B366
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 04:59:26 +0100 (CET)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHIfV-00018m-Bl
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 22:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lHIe5-0000bz-Ov; Tue, 02 Mar 2021 22:57:59 -0500
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com
 ([40.107.94.51]:35040 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lHIe3-00068I-1p; Tue, 02 Mar 2021 22:57:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVtC6AuvakafDoxCQFzupsh3ikuBnr75FxYj8ZB9nsCygbAzZd0zDUqtmYIHK+J3lJBZuKUeAXZHGfrAuNzENIoD8kNFBop9XzI8AgtkbnqmtQ61jPZqw0BpTcg6mXJIXFydDQhlthBrQkOggVb7IhwWWYX3U8zTjkAi2AOdye8fQOMpkvCwql/JXnhsVZwEkv+Bwi6YrqvFspOLb21OVqeFR4avyIfF1ofBZP48bLyVPDQ/GOJuaQeC5F96TwhQ2o0g5zqVn+8NEDtXwWVSFQBrBMkvYeFAsXNaR0pkpi4q8tm8/25tiQ2K67SUyw7dsV1nNT80RpCKqeaiWau2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhDPdj9QMCv8787hxDM51EvFTj5l1ev4LqFgvNY34KE=;
 b=b1S790Ift2PtYEfbA+9HZy+QlaQUt56Rc9VOGzopfWOQfAsFcjES43HhxwvNC0IHOlDW7U8oJom2Zuv/HpA/vhbjxGBRf975qOn0eOYOaRX9z+d+QZPiIIbgvXPkg+nkou3EJ92nsygb41Y2ceMI8HI1bLsC+jPC+ulr0ZttHTxGGoyHg0LJwrkU8OtOAnPSItm/4ELEpfX7k8YL5g7ucSuXxKjFn8XBrfUoGsM9XTp3lOvEY6UuBzskqLPy7tCSLbrR2M0D67/lakxHTSst1u40hmyT1Gk36TG7N1Ahl2PX+zNkKTwufvyFe5nRBO48D7DyvKBZ3Co4MwgAOU+QwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhDPdj9QMCv8787hxDM51EvFTj5l1ev4LqFgvNY34KE=;
 b=cOQq1hPrW+SuXW6IZPvUhGIzDOCznnrd28iPQs3exvkINwHbHIPSB0tmiWWGb5biti1T4Tqsylss+ctgn1pmuw39m7wKJfKLfNW8hbEvRCRwenp2Al6blXr1D3t3dJQNV43PmZhv+80vsnq3lCBGfPPihg1N7cFWNh+sujJ7xW0=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7183.namprd02.prod.outlook.com (2603:10b6:a03:292::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 03:57:50 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::9452:d0d8:c17b:a3d6]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::9452:d0d8:c17b:a3d6%8]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 03:57:50 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, Edgar Iglesias <edgari@xilinx.com>, Luc
 Michel <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH v3 02/21] sd: emmc: Add support for eMMC cards
Thread-Topic: [PATCH v3 02/21] sd: emmc: Add support for eMMC cards
Thread-Index: AQHXDggEX8nXt1TP10mYWQk6R/Ns0apu+KUAgAKtVoA=
Date: Wed, 3 Mar 2021 03:57:50 +0000
Message-ID: <BY5PR02MB677285688FE35B025718687BCA989@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-3-git-send-email-sai.pavan.boddu@xilinx.com>
 <8485f4b6-376a-9f2e-aa05-b7fcef84c790@kaod.org>
In-Reply-To: <8485f4b6-376a-9f2e-aa05-b7fcef84c790@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10fa4132-e806-4342-03db-08d8ddf883c9
x-ms-traffictypediagnostic: SJ0PR02MB7183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7183019639BA3DF1BE9B62CCCA989@SJ0PR02MB7183.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x+C4hm7EszyMr6kprdS3F92TFyfKWhcmJUJj0Wtk5GCxPP7fSEoBE079cedzv/BffEbU16L8wFFR8dikup44pTfCGp6DrhYp+/1O/ejES1CVTskvtI2QRzb8jQDfM7+FhEkvcn1Xp8Vpv5tN4KgGZu4sWa6bi8iFOfJdU8Bx834pRGYfZtcVZZmFVUNtiVORzMbdiU6+gSxrAZw/fMCdkuIIC7uS1JOPc7traNpqMpbK+JJqZk1apa5dr9m1PkLUxjol86h3Xn/dRmRpTvC5UHUEjJBOF99OMl90d+kR+kEWa5By5o1RLyvQH92glzpB6VMPGYd0jpoFGYJ8eQf9a7RYgFR2P/E+HtA8miPvbtjnW1807FJz5nieQNtyC+ydXDDwi8J+R1he2P6u/QSyBQH9/yFHil5AEt/2aig7aOAr5oVM63MVLEYAkxKvQZQpdLU37ej25zzYMLhaL/P9WYg5FUh3PbZQtRpQl6fGdDn/4Fr4P+shWcGIxBxWXCmGwKHkgzIDGs6PyfCKRXCbg+rS8gMJ84pYIBQy2+7UrD5NmoOzWMu8QkXd3koAyOGK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(86362001)(4326008)(2906002)(921005)(53546011)(66946007)(83380400001)(76116006)(66556008)(66446008)(66476007)(64756008)(6506007)(9686003)(55016002)(33656002)(478600001)(7416002)(7696005)(8936002)(8676002)(110136005)(71200400001)(52536014)(54906003)(5660300002)(26005)(186003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHdOa3ZINk5STHJiS1NCVjNvVTUwdTk2NDYwYzNBaU9NUnl5eHo0YnlWMU9m?=
 =?utf-8?B?N2E4UGVLV2JXMnUzMFRsaUhDMTQyZmRwRTBqZyt4dDFlRmd0RGJBdytsTkR4?=
 =?utf-8?B?VE81MmZrV0xROXNRTmR0c3Iza2VUOE00U2hValk1Nm4yRzZrYlBUYW1NUS9w?=
 =?utf-8?B?QUxTbmI0OXBsN0JzUE9IL0M5ZjRUM1hDWnNkWWtub1JYZ2Y0bytBZk94M2FW?=
 =?utf-8?B?U3hlNmJxZ1B5Y0RrNU9odSs4c1dvMVY3NzU1WUlOMGUvU1FoQ0JuUmRtTjQ2?=
 =?utf-8?B?YUV3amlDTm5kZXJtWXJ3UG83ajcyNVdkNHZseU5TaEtlRzNXSjFHQ0ZGSEly?=
 =?utf-8?B?L2E1ZGJFY1l1cjNlNGpJOERZNXRTSnhxS2p4THA2QTc2V1FHSFVFRmpiM2ZY?=
 =?utf-8?B?RDBFYVE1bjV2UFFXUzB2NEhIRWtQSTNiQnJiWGRYQ2tVWTJISDJ0RXZBK0wz?=
 =?utf-8?B?UjdBN244RmFKeTl4aUxCcHZKRFNGNlI5czhjOFJwdGRLUmIrNUJtMkFXb3FM?=
 =?utf-8?B?TGlSMjRjc1RJcGNra2NsZ2Y5UEJPZWNXR3lXWVJqKzJFOUhKa3F3V09HY292?=
 =?utf-8?B?Y3krcVFhRUNNTXk2TCtobTVvd2tFcVZ2U1MxcVRkcGliRWNtYTRJeHdmMCtp?=
 =?utf-8?B?S1U0aWZQd214bGhQbTViOWhDdi9xWFNtNndNWVh6eWhFczJzZzBjbDRtaEkz?=
 =?utf-8?B?OUNPTWRqS2ozY3FpMmIrb0NxdndsQkxrcEZwTTJuYUt2Nk5LTXdwNW1UVUcr?=
 =?utf-8?B?Z1lkL1I0RkpMTzFFRFhQNWs2N2FjRTdFMDQ2OFlpbkluZ2Z1Y0thYUVMcThO?=
 =?utf-8?B?UlhkcWFZYnErR1UxZ3owUSt0TnUxb3ZDNjBZazMxb20zcFkweUIwWEMzUDBY?=
 =?utf-8?B?YTdseHJTdys2dk0wRmRwc2VrZTBGVy81WmJKVkZXRkFSZWNYSkoranVTSEls?=
 =?utf-8?B?OGRrNG42RnV1eDZ4aFNnS012REM3UUQwbTk3OTNoNC81bnhzRlAvcXJDSEdN?=
 =?utf-8?B?ZWU5QmNBN3BCVTFLeFVLb3lJTWpneWZPU0JoRTlJUE5idkphcGZWRExTcHdr?=
 =?utf-8?B?cktvSmd4RXc0QmZGVy9odlhLbTlUM0xoT3ZBTDdsY2NNbjFISzgrRlpXeGtu?=
 =?utf-8?B?YVBBRjFzN3FRRzVndWZTdGpGbWN2K3Y0eGNPdnBPNWpRUHlXdmNlaU5oTTV3?=
 =?utf-8?B?OFhxK1FObWFYK3RUUnFONFp2RnNGSm1BcHl1YWZTNVdTZ0JPRUZKTWs4YllW?=
 =?utf-8?B?UkJ5akVHa2Q1R1VLRzh2cWl3MWZrYUNySVBLWForNmtOd3h3QktxaUVlMlVE?=
 =?utf-8?B?NE4yTG5jZUdIZ0JPV0dhYkdQOVZpdFIxRENyNHBhZUh2clhZQWFWcHUyY3pM?=
 =?utf-8?B?eko4dVlDTWRiSTVEV2lnbk1KallqdWk1Njg5OFFEaU5weE8yWk15b0FxbFlF?=
 =?utf-8?B?OTU4cWJhSUhFOUE3SmFDMGR2aSs1WTRTZ0Z4VXdDeU5KQ2JJbWdKYWtydjF6?=
 =?utf-8?B?bmZieS9NaXJ5M0gzVzJJQkNILzJrYWQ3OGpSdGV6UEU2dmhyR2VRSmdIQVFO?=
 =?utf-8?B?YTJRQUM2UGFTa05pczdaZzQvald3T25sM3lZNXc2N0FwOHhYKzlwdHJiU2NQ?=
 =?utf-8?B?QXZXMytSSU50ZFMyTThER01GYXJvMjNNaXlVeDAvZ3Y1a0NkZHdBaFZjNHgy?=
 =?utf-8?B?RGZmU01LYUR6Mjg1MTVhQUNRc0FpQlpJU3U1aU1EN051MHFQeGp2QU5zMlgv?=
 =?utf-8?Q?xZZE4lhyAS5cxoU43nAbZGsDfgVTkcPw4PoN5y4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fa4132-e806-4342-03db-08d8ddf883c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 03:57:50.2266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dy8bJakVm9Icw5Dk1j5iPI6CpgA9XW5bEyQ16NDufUJkZ5XLm9c44gK61DCKX3PzDmF3/7Z+RoNuyTk+TOqpRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7183
Received-SPF: pass client-ip=40.107.94.51; envelope-from=saipava@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQ2VkcmljLA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDw6lkcmlj
IExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDEsIDIwMjEg
NDozMiBQTQ0KPiBUbzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhpbGlueC5jb20+OyBNYXJr
dXMgQXJtYnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+OyBLZXZpbiBXb2xmIDxrd29sZkBy
ZWRoYXQuY29tPjsgTWF4IFJlaXR6DQo+IDxtcmVpdHpAcmVkaGF0LmNvbT47IFZsYWRpbWlyIFNl
bWVudHNvdi1PZ2lldnNraXkNCj4gPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT47IEVyaWMgQmxh
a2UgPGVibGFrZUByZWRoYXQuY29tPjsgSm9lbCBTdGFubGV5DQo+IDxqb2VsQGptcy5pZC5hdT47
IFZpbmNlbnQgUGFsYXRpbiA8dnBhbGF0aW5AY2hyb21pdW0ub3JnPjsgRHIuIERhdmlkIEFsYW4N
Cj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IFRob21hcyBIdXRoIDx0aHV0aEByZWRo
YXQuY29tPjsgU3RlZmFuDQo+IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsNCj4gQWxpc3RhaXIgRnJhbmNpcyA8
YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPjsgRWRnYXIgSWdsZXNpYXMgPGVkZ2FyaUB4aWxpbngu
Y29tPjsNCj4gTHVjIE1pY2hlbCA8bHVjLm1pY2hlbEBncmVlbnNvY3MuY29tPjsgUGFvbG8gQm9u
emluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251Lm9y
ZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBTYWkgUGF2YW4gQm9kZHUNCj4gPHNhaXBhdmFAeGls
aW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMi8yMV0gc2Q6IGVtbWM6IEFkZCBz
dXBwb3J0IGZvciBlTU1DIGNhcmRzDQo+IA0KPiBPbiAyLzI4LzIxIDg6MzMgUE0sIFNhaSBQYXZh
biBCb2RkdSB3cm90ZToNCj4gPiBBZGQgZU1NQyBkZXZpY2UgYnVpbHQgb24gdG9wIG9mIFNEIGNh
cmQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWkgUGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5i
b2RkdUB4aWxpbnguY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2h3L3NkL3NkLmggfCAgMiAr
Kw0KPiA+ICBody9zZC9zZC5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2h3L3NkL3NkLmggYi9pbmNsdWRlL2h3L3NkL3NkLmggaW5kZXgNCj4gPiAwNWVm
OWI3Li5iNDAyZGFkIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvaHcvc2Qvc2QuaA0KPiA+ICsr
KyBiL2luY2x1ZGUvaHcvc2Qvc2QuaA0KPiA+IEBAIC05MCw2ICs5MCw4IEBAIHR5cGVkZWYgc3Ry
dWN0IHsNCj4gPiAgfSBTRFJlcXVlc3Q7DQo+ID4NCj4gPg0KPiA+ICsjZGVmaW5lIFRZUEVfRU1N
QyAiZW1tYyINCj4gPiArT0JKRUNUX0RFQ0xBUkVfU0lNUExFX1RZUEUoRU1NQ1N0YXRlLCBFTU1D
KQ0KPiA+ICAjZGVmaW5lIFRZUEVfU0RfQ0FSRCAic2QtY2FyZCINCj4gPiAgT0JKRUNUX0RFQ0xB
UkVfVFlQRShTRFN0YXRlLCBTRENhcmRDbGFzcywgU0RfQ0FSRCkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9ody9zZC9zZC5jIGIvaHcvc2Qvc2QuYw0KPiA+IGluZGV4IDc0YjkxNjIuLmEyM2FmNmQg
MTAwNjQ0DQo+ID4gLS0tIGEvaHcvc2Qvc2QuYw0KPiA+ICsrKyBiL2h3L3NkL3NkLmMNCj4gPiBA
QCAtMTA4LDYgKzEwOCw3IEBAIHN0cnVjdCBTRFN0YXRlIHsNCj4gPiAgICAgIHVpbnQ4X3Qgc3Bl
Y192ZXJzaW9uOw0KPiA+ICAgICAgQmxvY2tCYWNrZW5kICpibGs7DQo+ID4gICAgICBib29sIHNw
aTsNCj4gPiArICAgIGJvb2wgZW1tYzsNCj4gPg0KPiA+ICAgICAgLyogUnVudGltZSBjaGFuZ2Vh
YmxlcyAqLw0KPiA+DQo+ID4gQEAgLTE0Myw2ICsxNDQsMTAgQEAgc3RydWN0IFNEU3RhdGUgew0K
PiA+ICAgICAgYm9vbCBjbWRfbGluZTsNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdHJ1Y3QgRU1NQ1N0
YXRlIHsNCj4gPiArICAgIFNEU3RhdGUgcGFyZW50Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3Rh
dGljIHZvaWQgc2RfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApOw0KPiA+
DQo+ID4gIHN0YXRpYyBjb25zdCBjaGFyICpzZF9zdGF0ZV9uYW1lKGVudW0gU0RDYXJkU3RhdGVz
IHN0YXRlKSBAQCAtMjEwNSw2DQo+ID4gKzIxMTAsMTMgQEAgc3RhdGljIHZvaWQgc2RfaW5zdGFu
Y2VfaW5pdChPYmplY3QgKm9iaikNCj4gPiAgICAgIHNkLT5vY3JfcG93ZXJfdGltZXIgPSB0aW1l
cl9uZXdfbnMoUUVNVV9DTE9DS19WSVJUVUFMLA0KPiA+IHNkX29jcl9wb3dlcnVwLCBzZCk7ICB9
DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgZW1tY19pbnN0YW5jZV9pbml0KE9iamVjdCAqb2JqKSB7
DQo+ID4gKyAgICBTRFN0YXRlICpzZCA9IFNEX0NBUkQob2JqKTsNCj4gPiArDQo+ID4gKyAgICBz
ZC0+ZW1tYyA9IHRydWU7DQo+ID4gK30NCj4gSSB0aGluayBmaWVsZCAnZW1tYycgd291bGQgZml0
IGJldHRlciBpbiBTRENhcmRDbGFzcyBzaW5jZSBpdCBpcyBhIGRldmljZSBjb25zdGFudC4NCj4g
WW91IHNob3VsZCBub3QgbmVlZCAnc3RydWN0IEVNTUNTdGF0ZScuIFNvIHNvbWV0aGluZyBsaWtl
IGJlbG93Lg0KPiBUaGVuIHlvdSBjYW4gYWRkIGhhbmRsZXJzIGZvciBzcGVjaWZpYyBlbW1jIGNv
bW1hbmRzLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCj4gDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody9zZC9zZC5oIGIvaW5jbHVkZS9ody9zZC9zZC5oIGluZGV4DQo+IDQ3MzYwYmE0
ZWU5OC4uODBlN2NkNTI2YTU3IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2h3L3NkL3NkLmgNCj4g
KysrIGIvaW5jbHVkZS9ody9zZC9zZC5oDQo+IEBAIC05Myw2ICs5Myw4IEBAIHR5cGVkZWYgc3Ry
dWN0IHsNCj4gICNkZWZpbmUgVFlQRV9TRF9DQVJEICJzZC1jYXJkIg0KPiAgT0JKRUNUX0RFQ0xB
UkVfVFlQRShTRFN0YXRlLCBTRENhcmRDbGFzcywgU0RfQ0FSRCkNCj4gDQo+ICsjZGVmaW5lIFRZ
UEVfRU1NQyAiZW1tYyINCj4gKw0KPiAgc3RydWN0IFNEQ2FyZENsYXNzIHsNCj4gICAgICAvKjwg
cHJpdmF0ZSA+Ki8NCj4gICAgICBEZXZpY2VDbGFzcyBwYXJlbnRfY2xhc3M7DQo+IEBAIC0xMjQs
NiArMTI2LDggQEAgc3RydWN0IFNEQ2FyZENsYXNzIHsNCj4gICAgICB2b2lkICgqZW5hYmxlKShT
RFN0YXRlICpzZCwgYm9vbCBlbmFibGUpOw0KPiAgICAgIGJvb2wgKCpnZXRfaW5zZXJ0ZWQpKFNE
U3RhdGUgKnNkKTsNCj4gICAgICBib29sICgqZ2V0X3JlYWRvbmx5KShTRFN0YXRlICpzZCk7DQo+
ICsNCj4gKyAgICBib29sIGVtbWM7DQo+ICB9Ow0KPiANCj4gICNkZWZpbmUgVFlQRV9TRF9CVVMg
InNkLWJ1cyINCj4gZGlmZiAtLWdpdCBhL2h3L3NkL3NkLmMgYi9ody9zZC9zZC5jDQo+IGluZGV4
IDY2MDAyNmYyYTY2Ny4uOTU2MDhmMTFiMzZlIDEwMDY0NA0KPiAtLS0gYS9ody9zZC9zZC5jDQo+
ICsrKyBiL2h3L3NkL3NkLmMNCj4gQEAgLTI0NDcsOSArMjQ0NywyNCBAQCBzdGF0aWMgY29uc3Qg
VHlwZUluZm8gc2RfaW5mbyA9IHsNCj4gICAgICAuaW5zdGFuY2VfZmluYWxpemUgPSBzZF9pbnN0
YW5jZV9maW5hbGl6ZSwgIH07DQo+IA0KPiArc3RhdGljIHZvaWQgZW1tY19jbGFzc19pbml0KE9i
amVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkgew0KPiArICAgIFNEQ2FyZENsYXNzICpzYyA9
IFNEX0NBUkRfQ0xBU1Moa2xhc3MpOw0KPiArDQo+ICsgICAgc2MtPmVtbWMgPSB0cnVlOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgY29uc3QgVHlwZUluZm8gZW1tY19pbmZvID0gew0KPiArICAgIC5u
YW1lID0gVFlQRV9FTU1DLA0KPiArICAgIC5wYXJlbnQgPSBUWVBFX1NEX0NBUkQsDQo+ICsgICAg
Lmluc3RhbmNlX3NpemUgPSBzaXplb2YoU0RTdGF0ZSksDQo+ICsgICAgLmNsYXNzX2luaXQgPSBl
bW1jX2NsYXNzX2luaXQsDQo+ICt9Ow0KPiArDQpbU2FpIFBhdmFuIEJvZGR1XSBZZXMsIEkgc2Vl
IHlvdXIgcG9pbnQuIExldCBtZSB0cnksIEkgd2FzIHByZWZlcnJpbmcgYSBzaW1wbGVyIGFwcHJv
YWNoIGp1c3QgdG8gbm90IGRpc3R1cmIgdGhlIGNvZGUgbXVjaCBidXQgbGV0cyBzZWUgaG93IHRo
aXMgd29ya291dC4NCg0KVGhhbmtzLA0KU2FpIFBhdmFuDQo+ICBzdGF0aWMgdm9pZCBzZF9yZWdp
c3Rlcl90eXBlcyh2b2lkKQ0KPiAgew0KPiAgICAgIHR5cGVfcmVnaXN0ZXJfc3RhdGljKCZzZF9p
bmZvKTsNCj4gKyAgICB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmZW1tY19pbmZvKTsNCj4gIH0NCj4g
DQo+ICB0eXBlX2luaXQoc2RfcmVnaXN0ZXJfdHlwZXMpDQoNCg==

