Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591E659128
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:21:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyP7-00011V-Dd; Thu, 29 Dec 2022 14:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyP4-0000xR-N6
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:17:22 -0500
Received: from mail-dbaeur03on2114.outbound.protection.outlook.com
 ([40.107.104.114] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyP2-00017Z-Rc
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:17:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An8C5+aHzn8mY7568E2KIQRTGPn1zy36sVbrbChyjXSYguhfBZzHcy6c5vn1kk/HnRy4VzjnoQBsIXKMtjmkhqAX5f8PW43CfzHlJNKobUjDuXrI2M2bYMIfiLj0BxXdNZbf70Hv6O9OVF6Md6p5pJE8+GrTuN1MhgeZG00cB2ZuNHQde9i8QVHrZo8oRzHzGj70nJgziil0PSuUqyVpO5NZjw+7iSs6YQjW6zFhh9X2dT02+Qxif4wRWigMoPRbljFa36kh1UkOZiF8/zzj/gHVflRnT0uNd+RdtuoUEcZFfqEtiGnEYLhNjLuWKinXoAJhTj5lxk7WctlJLzeBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcJFwqvIJZitYtpYfFm1rAnW52hhDzQdSDYkaA+cKwM=;
 b=J31dONKTEsLokv2ZrM6j0dOsWX898t2fcdM1MlMhipm4JUufa1WtiCOst/VSVIyVZY8k4RcCST+QPxuDIa9of3NymVm1zygRi0RuJ1NxpoXvMoI8MVdDRr4AyEsa/gc2xtrgQrHinni2mO3VhiBNRRZWhn+/iH4F0WkRKBv5PFDuCDRwbuEhQTpkuvULvYP2ulZY0/oHcmnQxG+qYMlGauW2YCto8JU78tmhQbwkfc5YChwKGeDH8o5C6pQw0Ebq5j90vnjV9MOKRDTuZnQsue8yzdpNN3eBHWIM8ErXWh6jGLzrAMXBxht/36htk+CESgC6hiLJ5+xYiVq0+0RkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcJFwqvIJZitYtpYfFm1rAnW52hhDzQdSDYkaA+cKwM=;
 b=C7gr9etnec+269oxmQQOKWDtm0n74bDZPsUUYXCQUJmjBQAKIzSIC2SSP12NtSLLPNNSQW8+rd8djyOFXZZMkSwQe6KAGysKJ7MoA+HDxrXIb0IJNQmh7l6g+P8Fno0rHehSaMgOrTKIxvddISWkV9Vfyricczt+o3/e16jQT8I=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:17:16 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:17:16 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Topic: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Index: AQHZFfqLsrcGp8gJukmzNMlOfQdu7q56z/WAgAp4AWA=
Date: Thu, 29 Dec 2022 19:17:15 +0000
Message-ID: <DBBP189MB143342BF93DB130D8B9715EB95F39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
 <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
In-Reply-To: <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS1P189MB1912:EE_
x-ms-office365-filtering-correlation-id: 16b26131-5e1b-4663-a911-08dae9d14c18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grsOApV3A7OhD6w/jWfALCtZW6v0SH/9bHGwk6vkXwakjHHcAp6ba3fM0kWqtDmuHlEfp8lqqYxfHdIyaxdtQ1F8KpcMQEDAW388YgVXuTqhtELD6tnDllcSwId6ZJ6SIR2JviH43C7Iivne99GPbFh5gLecq9pjT15F/lYL09LDrsTnA+s+gbXDr5qFp57KMXwMwnVil1aMYa5VSwPgMDcyWOnX0ytDp4cxXXSNx4fX+9E22ozuKpRO81hwPt/2hssmCX/u7ypADMHmhlwYDoq/NVt8blMchW5Y1YLfP/IPeM735Zf4dMzuTSiPcg7TsBqac9le8dKXC5S1Kx1R3AaZaWpGOxu7y6q+05krzll+u/D6gXrGPPhmm34YyogXeazHW+wVYPDKVO1FeGfTkz+fK+f4sOEQ33H7loDldpxNeBVpKvdOeYMZleEfTWCwnowaRRHHn4JfSPjvHA3pG7qz4uwZgtadSB1yns2uMU+SNsmtNjLovsWdUFAkD/WR40ijIL2Q/LhV/WjTrZXTq7U5OK0zBlFJK55vq3vzSbk13jDvzG4+x60hf1bxNt8Xw50K0yKW4tyhq79bCpYvE+Yxf2h+7h9oYdn7w0H6ZA21jVaRfk3EzYurNUGQbkoZJWdRo5ewEwwoCoSqbtNQZDLAqdK2tANsSH4VSsUAo1B8CPcNmJx1YadXi/u20vmDmNHjIj000dqWyQJf2wwGjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(346002)(366004)(39830400003)(451199015)(54906003)(6916009)(316002)(7696005)(6506007)(478600001)(53546011)(55016003)(9686003)(33656002)(186003)(26005)(71200400001)(44832011)(86362001)(41300700001)(38070700005)(66476007)(66556008)(76116006)(8676002)(66946007)(66446008)(38100700002)(64756008)(122000001)(4326008)(2906002)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ni82c1hRaDI0bVdSWHMydFJ6dVVaSE9jT0FiTkJBQy96U1ZtS2dHekdZWVdC?=
 =?utf-8?B?WmFuVkFod085RGVsQXN4TWtDRlZqTXJBVndJMmJJS2tId0xxeFB1MGNjNXV6?=
 =?utf-8?B?NTFhZXRnM0VvRDl0YmVhQnhYWmc2QzlJcnpJaU56MmpRVVdaWXV2RmY3R3pK?=
 =?utf-8?B?RUpsVlRqY1U0YnVHcWd6aVp4M1hpTVB6dGtPc2hta2ZPRU5MTjZmUjRER1lB?=
 =?utf-8?B?aDFxamZNdm9jVE5iT0IrSU5CaEhQNHZBelYzZVJIcjRPRU9JZmRGSExjM3cr?=
 =?utf-8?B?WEFLM0RPeVF4enlqekowRFdnL0hEMktkdG1mRjdPRlB1WkNvbUoxTTMraTU4?=
 =?utf-8?B?QUJaSVJ1Z2hUSG5YS09MMjZhblJKa1BPbFhueFppb1FWS3VHTExiTmRRNVFU?=
 =?utf-8?B?QWczcmRJeG81bnAyMURvSUtEOWdEWXhvQUU5TWVtdVhOVExERVRSSFgrU1BU?=
 =?utf-8?B?R1VOVE0wSFhnZ1krQjduVGtXRFpsL25PNEVibEEvL1JsZGZQTEJwaXpHTXhW?=
 =?utf-8?B?S3NFU1FxcWlWaEhONEJlS25nNk40VGRzSkdURjlwWThGY3FEZXJ6QnhiN0JP?=
 =?utf-8?B?OVR2SE5EcUF1VWNCZk8zdFNYdXk5R3FPVzc3cGFmM1ovcHUvNU5IZlV4UDBD?=
 =?utf-8?B?b2loT1pKbjI4YmNMajkzYnBWcGtZK2MxM045NTJCQzB0SWh3RVYzQVdNa09R?=
 =?utf-8?B?dlpiazVkTWR4RjlielZPVGFYQkFKUTVZK1A5a0hpSGV6R2FXZDlMSThzbnVn?=
 =?utf-8?B?QzkrMzFza1A5SnJPTXdmRTM3V1pMVVJhRGd1OE00ckExU0xDeWNreGxoZ3BE?=
 =?utf-8?B?emlxRlIxWkpZZm9tcEpQakdyZ0g2SFBlNm9lODRRajdFbjkyaXpLeXhFZmRO?=
 =?utf-8?B?dGx2ZDMza0xVTGVyd3BlbU5uRlV5WkJZM3RabmRSR3NXWm93Tm84WFAyeG1W?=
 =?utf-8?B?OWIyRmJhS3NuY1BlVjhqVnZkVUlWQTByWEwxVVhYZUJySzEzOC80a2pJRnUz?=
 =?utf-8?B?UUNob3QxMkVNNHRsT25zNmU3T0pqQU5oazMyekkxWGI0RU5iWVRacnVNSFlw?=
 =?utf-8?B?UmRHdktXVWJRcGlyaWlpblB4Q2hNcE1YME13WTY5TXJVN2h2V003bUMvWDU5?=
 =?utf-8?B?OXRHcjBNaG9WUlVIb0dTV3kzVS84K3RFUzVMVk9uU08wQ2dlcytZUlJxRVRO?=
 =?utf-8?B?ODhsODFuWkFMVlpwSU0zNGJaWDZMT1cvTDFvaWJRRU50YWZTU1RFZUJFdzlO?=
 =?utf-8?B?QTJIeGhoeGZnT1lQYkFYNC9lcTUxNnNKODQ4bXk2WUlKSTlrTnZRL29XTFF4?=
 =?utf-8?B?d0FxelMxc243VmF1ek1kdlNTa1B0MDE4SEpCZUVhYmdlQXJnNVZvVVZsZ3JV?=
 =?utf-8?B?aU5EMHh1a1hyVWlRclNsSjBOVnZVR1JCVjMzTWJwNUlQWmVjenpMQ1grZDVr?=
 =?utf-8?B?YW1MM1JWRGRyVW1ONzQwUkhDMXJWVkNFSFk5cUZNTTA1MjJWam9SM29rOVlr?=
 =?utf-8?B?QmZTMVZaaVZZL1kraDhYa1JZQ1N3US9aY1g4cXh4bUduMjB2OXFocndIS3ZX?=
 =?utf-8?B?TlBrRFlLRm9ISUNaUGR2SXU4V3hlemVYeTJnQU9ySW9EOUFaalFzY1ZhcFlv?=
 =?utf-8?B?cDZ2Sm5GSmpzb1pvMzhWOUZQN2FkbTd2bHZ6WUFNZHJ2WUkvTEFnM0d5VUl6?=
 =?utf-8?B?bUZHZS9kTDZmRHVzMGEvRVMycmt6UlQ2K0I4OGpJQnBQdnNrVlNhNGZMbUFQ?=
 =?utf-8?B?SnI0WVFvYnUzd0VxTVlHL0kyOVpOVHJTZVhSekFmMjB2MlZ5VHVLdlZIMjM2?=
 =?utf-8?B?TjhidDc3MEhBY28yc3Vpb2NIL0JYSjhlNk5rQng3OUsySjBGbkZ1Q2pxRFJS?=
 =?utf-8?B?MWdxeGFrbWl1R0N2QU0rNWNyRzF3aDRjcFB1SGhYSU04WnVZczhQSjF4QU1k?=
 =?utf-8?B?bFNlem80cXdCNWlacXZHdVZYa3hDOWVJYXVOdlRmVnh1SjJhMlpya1ZPeTl5?=
 =?utf-8?B?QXZuK1VramNtRERmZXFqTVNrOFBxejN2dk9NaURVZFRhVW9KcjJBTGVsc1dT?=
 =?utf-8?B?VVVRcktGMDJsT3c3QWJJMW11dks3V0FUS2VuZXlvTjZkcWdSaXVPQXBwYmw2?=
 =?utf-8?Q?34hneFhJtHywZ/H+7DrlxzInV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b26131-5e1b-4663-a911-08dae9d14c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 19:17:15.9999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWXyfqPdqEKqjKzWOdoFwEF36leDaO3EgoOC4Tb4+SS09IgZ59BJRhpLq2NebrGuFdPdFs1UYDalX/6//59+zeFKcZj9Lnp3+6g+sYnqnk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
Received-SPF: pass client-ip=40.107.104.114;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIDIzIERlY2VtYmVyIDIwMjIgMDQ6MjQNCj4g
VG86IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NCj4gQ2M6
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgRG1pdHJ5IEZsZXl0bWFuDQo+IDxkbWl0cnkuZmxleXRt
YW5AZ21haWwuY29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ow0KPiBN
YXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwLzVdIGh3L25ldC9pZ2I6IGVtdWxhdGVkIG5ldHdvcmsgZGV2aWNlIHdpdGgg
U1ItSU9WDQo+IA0KPiBPbiBUaHUsIERlYyAyMiwgMjAyMiBhdCA3OjQzIFBNIFNyaXJhbSBZYWdu
YXJhbWFuDQo+IDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4gd3JvdGU6DQo+ID4NCj4gPiBB
IG5ldyBhdHRlbXB0IGF0IGFkZGluZyBzdXBwb3J0IGZvciBJbnRlbCA4MjU3NiBHaWdhYml0IEV0
aGVybmV0DQo+ID4gYWRhcHRlciB3aXRoIFNSLUlPViBzdXBwb3J0Lg0KPiA+DQo+ID4gU3RhcnQg
cWVtdSB3aXRoIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVycy4NCj4gPiAgICBxZW11LXN5c3RlbS14
ODZfNjQgLWVuYWJsZS1rdm0gLU0gcTM1IFwNCj4gPiAgICAuLi4NCj4gPiAgICAtZGV2aWNlIHBj
aWUtcm9vdC1wb3J0LHNsb3Q9MyxpZD1wY2llX3BvcnQuMyBcDQo+ID4gICAgLW5ldGRldg0KPiB0
YXAsaWQ9bmV0MyxzY3JpcHQ9bm8sZG93bnNjcmlwdD0vdG1wL3JtdGFwLGlmbmFtZT14Y2JyM190
MixxdWV1ZXM9MSBcDQo+ID4gICAgLWRldmljZSBpZ2IsYnVzPXBjaWVfcG9ydC4zLG5ldGRldj1u
ZXQzLG1hYz0wMDowMDowMDowMTowMzowMg0KPiA+DQo+ID4gTG9hZCBJR0IvSUdCVkYgbW9kdWxl
cyBpZiBuZWVkZWQuDQo+ID4gbW9kcHJvYmUgaWdiDQo+ID4gbW9kcHJvYmUgaWdidmYNCj4gPg0K
PiA+IENyZWF0ZSBWRnMgdmlhIC9zeXMNCj4gPiBscyAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAw
OjAxOjAwLjAvDQo+ID4gZWNobyAyID4gL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMDowMTowMC4w
L3NyaW92X251bXZmcw0KPiA+DQo+ID4gU3JpcmFtIFlhZ25hcmFtYW4gKDUpOg0KPiA+ICAgcGNp
ZTogYWRkIGhlbHBlciBmdW5jdGlvbiB0byBnZXQgbnVtYmVyIG9mIFZGcw0KPiA+ICAgaHcvbmV0
L25ldF90eF9wa3Q6IGhlbHBlciBmdW5jdGlvbiB0byBnZXQgbDIgaGRyDQo+ID4gICBody9uZXQv
aWdiOiByZWdpc3RlciBkZWZpbml0aW9ucw0KPiA+ICAgaHcvbmV0L2lnYjogZW11bGF0ZWQgaW50
ZWwgSUdCICg4MjU3NkVCKSBuZXR3b3JrIGRldmljZQ0KPiA+ICAgaHcvbmV0L2lnYjogYnVpbGQg
c3VwcG9ydCBmb3IgaWdiL2lnYnZmIGRldmljZXMNCj4gDQo+IEhhdmVuJ3QgcmV2aWV3ZWQgdGhp
cyBzZXJpZXMgYnV0IEkgdGhpbmsgd2UnZCBoYXZlIHR3byBtb3JlIHRoaW5nczoNCj4gDQo+IDEp
IHVwZGF0ZSB0aGUgTUFJTlRBSU5FUlMNCkFueSBzdWdnZXN0aW9ucyBvbiB3aG8gc2hvdWxkL3dp
bGwgbWFpbnRhaW4gdGhpcz8gDQoNCj4gMikgYSBxdGVzdCBmb3IgaWdiIChoYXZpbmcgYSBxdGVz
dCBmb3Igc3ItaW92IHdvdWxkIGJlIGV2ZW4gYmV0dGVyKQ0KPiANCj4gVGhhbmtzDQo+IA0KPiA+
DQo+ID4gIGh3L2kzODYvS2NvbmZpZyAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+ICBody9uZXQv
S2NvbmZpZyAgICAgICAgICAgICAgfCAgICA1ICsNCj4gPiAgaHcvbmV0L2UxMDAwX3JlZ3MuaCAg
ICAgICAgIHwgIDM1NyArKystDQo+ID4gIGh3L25ldC9lMTAwMHhfY29tbW9uLmMgICAgICB8ICAg
MTMgKw0KPiA+ICBody9uZXQvZTEwMDB4X2NvbW1vbi5oICAgICAgfCAgIDI4ICsNCj4gPiAgaHcv
bmV0L2lnYi5jICAgICAgICAgICAgICAgIHwgIDYyNyArKysrKysNCj4gPiAgaHcvbmV0L2lnYi5o
ICAgICAgICAgICAgICAgIHwgIDE4NCArKw0KPiA+ICBody9uZXQvaWdiX2NvcmUuYyAgICAgICAg
ICAgfCAzNzgyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGh3L25l
dC9pZ2JfY29yZS5oICAgICAgICAgICB8ICAyMTYgKysNCj4gPiAgaHcvbmV0L2lnYnZmLmMgICAg
ICAgICAgICAgIHwgIDI2MiArKysNCj4gPiAgaHcvbmV0L21lc29uLmJ1aWxkICAgICAgICAgIHwg
ICAgMiArDQo+ID4gIGh3L25ldC9uZXRfdHhfcGt0LmMgICAgICAgICB8ICAgMTcgKy0NCj4gPiAg
aHcvbmV0L25ldF90eF9wa3QuaCAgICAgICAgIHwgICAgOCArDQo+ID4gIGh3L25ldC90cmFjZS1l
dmVudHMgICAgICAgICB8ICAxOTAgKysNCj4gPiAgaHcvcGNpL3BjaWVfc3Jpb3YuYyAgICAgICAg
IHwgICAgNiArDQo+ID4gIGluY2x1ZGUvaHcvcGNpL3BjaWVfc3Jpb3YuaCB8ICAgIDUgKw0KPiA+
ICAxNiBmaWxlcyBjaGFuZ2VkLCA1NjcxIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKSAg
Y3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgaHcvbmV0L2lnYi5jICBjcmVhdGUgbW9kZSAxMDA2NDQg
aHcvbmV0L2lnYi5oICBjcmVhdGUgbW9kZQ0KPiA+IDEwMDY0NCBody9uZXQvaWdiX2NvcmUuYyAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2JfY29yZS5oICBjcmVhdGUNCj4gPiBtb2RlIDEw
MDY0NCBody9uZXQvaWdidmYuYw0KPiA+DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KDQo=

