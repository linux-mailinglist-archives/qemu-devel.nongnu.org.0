Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38586590CC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:17:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyMg-0000CY-FX; Thu, 29 Dec 2022 14:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyMe-0000CA-A5
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:14:52 -0500
Received: from mail-vi1eur05on2094.outbound.protection.outlook.com
 ([40.107.21.94] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyMc-000807-7V
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:14:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9eVYos33M904QdSdOPHO7e8hn7P+b7aRr68BpZIhHc3NYp/hdjIehVJrcUACda8AeRbGBzQkaCg4zhvPOdBGf1Ug8EgluHLoyNhcXnApBpVnYRMUZ1Lz7TE5aBuors1z00rr7FmuzbokgyfJyOavMYOTgLpl7i12HCF3b1VV+Sz68QPpUK3u0kpUhWkcw6fyozwqea8iftuzGfQ0Ncb8z4JNN3YxKuyKdP3lezswPBNNgHfmmi14oP/S9zjSaJkiI10qHKs3V0IbyC3dx4rxEuO8YZFver51T1YYmIvpmEPgh5BVlPcbUwn3b+EjFmTyosaHcrv7o/1nT5/swB2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNglE4HOLkbjDJgTmhRFGxD02vZjTJr/C0ao2UKFbEo=;
 b=PzlQFPIfd1JfDW6dVYNK3YJAJP2MQYJyU/2pyaadsv7rmYC7Gj8yndcBlJrDcbWGZiibummV2XY+TRehSmNwQFRkHcUjDmS0aMgtqWJTUi/nt9HfB8MWhAc1qd+BQziYqeyUPJFxEtVxV5Q208QipGosMPMDSUs/wfvxc9SyyG4txoi6vOPQF7UhgEORit4ec2LOROmJGR8lHNtNFrS06KFQDjc8mzm3FveGTnkhnoV/fZI+jR7Ky+8lO0bg7+eAxQdt7cnD8xWWNRDkRmMwZ5xbmVYce6y8xpEjrCjddwOu7vdjc+MrJxnqAqCAbq0dp3H2+eew183mx+QgoFKaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNglE4HOLkbjDJgTmhRFGxD02vZjTJr/C0ao2UKFbEo=;
 b=B5tmZ838YU2mBX+CZcudgFwIYRhcSlEERwKaxOzdDhy4yN8QRCOw5qhvM9tBnLg4atZDf/EXUTBx71owW78akY164u1quFIezGUTSU0mzP8GD10fboKfeEcxqEMfxPnHKANaHdqvCJbSyIVumAwlPUPzgeLMSXR1G/C1V49z6gw=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:14:45 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:14:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@gmail.com>, Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Yan Vugenfirer <yan@daynix.com>
Subject: RE: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Topic: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Index: AQHZFfqLsrcGp8gJukmzNMlOfQdu7q56z/WAgAlieQCAAF4swA==
Date: Thu, 29 Dec 2022 19:14:45 +0000
Message-ID: <DBBP189MB1433417CB9CCAB3EEB0A989795F39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
 <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
 <34526159-762f-46ba-016e-5b9b0eae59bf@gmail.com>
In-Reply-To: <34526159-762f-46ba-016e-5b9b0eae59bf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS1P189MB1912:EE_
x-ms-office365-filtering-correlation-id: dcee2a31-bf85-44bc-66bb-08dae9d0f241
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fI/EkpHbwJOOJ244lp408slUTf0LQAEap7AHq6oOyxwqftANTKpiBmFhhm4KIJk6rIsMA5kqDsinEpo39v83NjfNcQ5m2pQItakNuxTstv8gkjRSlt3G31+px7K7gR3VUhSWY/KxTNQbeVFQYSMeLyIGwa6EfvIdgYd7T5Tq8RqGDUiCQIJ5pP64rP8sHqjxxlbqM4uvvVFK32+qbwUbvE+Cem7was8z/w9NpaZXFX7q1GkhPsdOBVCllZbgnLcyedY6cZT3vS39QmMlVOzzWO5sReCtJa1ldaJ29ApcKIaRKD+DNm2kdjbLu02WBTTBbFUNXjjh5TXIFn98tfGEPD1tCwyG0sxL4ZXNQmxKwAxy3cQT2bFZu+Q7fdLtSZ0m4caXZftXUoavs9XfJIG++BfMppQ7k96pDp0SYy+5nVy+e9wMbbvjWvrPB7D5H5bA1elLhcXRONC0Ep8reuW0m5D2+wbTo808Ot0iIPCAcfAdaArA9bZx4GqLNAVM8akKCXe7suO7RBWugLhVb4MT3V2Pf/IK+haSeiC3gVhu1s6ervMj4gUNfHK2XtrfvBqKCndL6FYQGispMNU22sWXseL5kQoBhMl+s1XYRnekBK3+KJXieeLSgpcbLx+eWroB91V6oj6F12MwyQCyAb6HsR0Wp9ll8P4fktkp4k1BzGn/IPSITMw2lC2TMjZUJ1f/Xj3AYfbwg+IG1nE7nW0rSWYN/RgEzbBWZ6kSP7vGuVY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(346002)(366004)(39830400003)(451199015)(54906003)(110136005)(316002)(966005)(7696005)(6506007)(478600001)(53546011)(55016003)(9686003)(33656002)(186003)(26005)(71200400001)(44832011)(86362001)(41300700001)(38070700005)(66476007)(66556008)(76116006)(8676002)(66946007)(66446008)(38100700002)(64756008)(122000001)(4326008)(2906002)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkdBNk10d1hQQVZ6N3p4R2VOLzl6VU5KekdVYno5MlR1bVBVNzA3YTUwZ3NM?=
 =?utf-8?B?R21zZG80RDNOZ1lLUElhK3lWK1BRdVhFdEh5LzY5OHNUUVZHNjhXbTJVSFQy?=
 =?utf-8?B?WFBlRGpPZTQvbWdGaE56b2Uvd3A1V091MmNHVkVXZjJ3dnBmQ3FaVm9Pcnd3?=
 =?utf-8?B?NmNDb1RKOU54UXh5empNTm0vanhNQkxKK0ZjS21IN1NDTE0ySC9sVVU4UVVm?=
 =?utf-8?B?VnF1b1dGUkcwZ0hXd3hLTWpYc1NhYmhHRXFVTFR0U0kwNVAvd25WNHBheXZq?=
 =?utf-8?B?MnlzalBKOVB5NUZlUU9od3Ara1ZiR090Tyt3dHZwL1dheDZzZGZ3b21PenZR?=
 =?utf-8?B?a1BKdmdjVVlIQ0VlMlEyQmRhUmpqVTFTSU1kMWdGSGJMME5pSkJGQ241K2J2?=
 =?utf-8?B?b3B2OVpyMytnNUxNQTFvSFJQblZLa0h4aFJqc2VjVUpQZVl4RVRCL2VtQUVh?=
 =?utf-8?B?eG1KSEZMWjdGUGhHMC9jcWU0SzJUNWN0ZGZUbnJiZEhTTmE1VEpBdkJlTUZl?=
 =?utf-8?B?Y29tdktHWnRNSkg3ci83SUNPc2lQbFBvdWRjRWtSSUt5RTF5WGtFVWtwT0NM?=
 =?utf-8?B?VUhrSnBqb3N1cGI1ajI1bTFlVEE1Y3Z6cjZvbHQ2NnFQeWRGZ2p4UDkyakww?=
 =?utf-8?B?K2g4OW5wZ2hUNk1GNnpqRGN4QmNpUUNibnlOUCtsRDBSR1N6TTI4T254OXRZ?=
 =?utf-8?B?bXp1aUpYSzk4akF4RzNPTFJtRUV6WGl0bU5wTmRQbVVuOEJwOUppT1UweGR4?=
 =?utf-8?B?SDFVODFPRlRQemtURi9aUTRRblZ1TG9DaEdScUJTZ0hIbXIrU21EQy9HeUE4?=
 =?utf-8?B?SWhOWitYK24yVENsc1VSaUFQUnh1RzM5WTdvRktYRkRveXhySDVNWERlZ01J?=
 =?utf-8?B?dWJRaTg4UHQ4YzMrZlhxd2FQdy9KUjk2UksvVzgwalZCeWFPSHczc1lRV0d3?=
 =?utf-8?B?V040SWx6dURIUG5xKzhmVXZScldCTUw3K2JJbThCZzBVR0xmcXNWZGg5MjlD?=
 =?utf-8?B?YldWVnZiZzcrQWtuOFpJeXJ3M1E2QUtOZDU4WU5hWVI1WWlrZGNwdjZzdzVt?=
 =?utf-8?B?ektoTnlPMnVHd1JQWVVWTCt5TjB1QkZ2WUp0K3R5bURLMmZWRFZFclBvRE1v?=
 =?utf-8?B?cnc0Wks4YWExeCtEVHhUTXRlWVF0MmdoNHpsMXNCYmJWNURUeWQrVmxoOTBy?=
 =?utf-8?B?bUkzcThIK3hRS1BIUXRCTzRHejRuMzd3MFQ5bjNxenlxRjAyMW1qRlZSN1Yz?=
 =?utf-8?B?S0xTUGtaa0ZsUGgyZWpHUUZxK0RRNDlQVkVxUUpPaWVTYWlRalZnSklZVSta?=
 =?utf-8?B?V0tuYmhzWnhPcElIcFMyZUNuK0tEeWJvZytrUzB1NUFRWlBSWWZtQk9LQUhx?=
 =?utf-8?B?c2RPWmVqaWpNempsQ0h1YXJTeUw4WXFyZE9xTjd0UkMxNFVKK0k4L1JIS3I1?=
 =?utf-8?B?Q1hXTlJUTklNUnFwb2hIa3ZRZEdCeW9NUkdDUXZIbTYwYUJ5aUJhaXhtcjlE?=
 =?utf-8?B?a2hyenpUTWtzdHhXRjQ3SFFrcDFsSTloQTkzTTVjQ0FmdG4ybU5uS3lUQTNV?=
 =?utf-8?B?MnVMaVNIR2ZLcS9RbnlSeGJtdm5kTFZ3bDFLbloxWVJKdXVOc1ZVRHhNcFho?=
 =?utf-8?B?NVBtVEk1MUtsOHhyWXVaWE84dFF0RThzUlM2MS9uRk8vZWVFN3cwdytENUJI?=
 =?utf-8?B?eXY1MXc1RDZ3dWdnSHJ3S2czTHVBYmhyOTdON3RYaWpwZ1pWME9zUXhNTGJr?=
 =?utf-8?B?anNON3NDU1JmVlptNFhLTjdqRXEzYzBGelhENDVwZ3MxaXlPZ2dYekJ1S2JB?=
 =?utf-8?B?bGp1M01IS3E4ZENON0lxTnFpNFZJUWZlb2lmZkJ2YTRLbXlMSzV1a1lNc01K?=
 =?utf-8?B?Y3lVbkdvTWZjRTVZa1QvV1JTY2hNWDlXTlgwUUVkczc5SzFWMzVwRDVzZlNK?=
 =?utf-8?B?L2lJNDFudm8walI2amQ1TjRSV2o0Q2xtMHlDWGwveXpOQ0lEd1JvVG5IM2RS?=
 =?utf-8?B?ZlZJZFBMcUJpZjFTaW51QWdJbGZGTmlFOVJBWTZ2SXBqckFLZDFWS3d0K0t2?=
 =?utf-8?B?T0ZTbncrNHc0cnNTVVNFQ0UrVEluR3lhT29TUGFDc1RSSndEZzFTaEZMNVBE?=
 =?utf-8?Q?Yh2VFjhuZGteFKQL3TQYczVGK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dcee2a31-bf85-44bc-66bb-08dae9d0f241
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 19:14:45.2719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtCda1sE+Bb4jaqkyAIH/hi6hey+UGFnnENaAcbP/z4Ta9Mw31xxYUScEwrSgRa4tdMjshYdRC6QAk3gDS0yBZMERORhfEBxE+dJ6utT5Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
Received-SPF: pass client-ip=40.107.21.94;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDI5IERlY2VtYmVyIDIwMjIg
MDM6NDMNCj4gVG86IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBTcmlyYW0gWWFn
bmFyYW1hbg0KPiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+DQo+IENjOiBxZW11LWRldmVs
QG5vbmdudS5vcmc7IERtaXRyeSBGbGV5dG1hbg0KPiA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNv
bT47IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPjsNCj4gTWFyY2VsIEFwZmVs
YmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+OyBZYW4gVnVnZW5maXJlcg0KPiA8eWFu
QGRheW5peC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC81XSBody9uZXQvaWdiOiBlbXVs
YXRlZCBuZXR3b3JrIGRldmljZSB3aXRoIFNSLUlPVg0KPiANCj4gT24gMjAyMi8xMi8yMyAxMjoy
MywgSmFzb24gV2FuZyB3cm90ZToNCj4gPiBPbiBUaHUsIERlYyAyMiwgMjAyMiBhdCA3OjQzIFBN
IFNyaXJhbSBZYWduYXJhbWFuDQo+ID4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPiB3cm90
ZToNCj4gPj4NCj4gPj4gQSBuZXcgYXR0ZW1wdCBhdCBhZGRpbmcgc3VwcG9ydCBmb3IgSW50ZWwg
ODI1NzYgR2lnYWJpdCBFdGhlcm5ldA0KPiA+PiBhZGFwdGVyIHdpdGggU1ItSU9WIHN1cHBvcnQu
DQo+ID4+DQo+ID4+IFN0YXJ0IHFlbXUgd2l0aCB0aGUgZm9sbG93aW5nIHBhcmFtZXRlcnMuDQo+
ID4+ICAgICBxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLU0gcTM1IFwNCj4gPj4gICAg
IC4uLg0KPiA+PiAgICAgLWRldmljZSBwY2llLXJvb3QtcG9ydCxzbG90PTMsaWQ9cGNpZV9wb3J0
LjMgXA0KPiA+PiAgICAgLW5ldGRldg0KPiB0YXAsaWQ9bmV0MyxzY3JpcHQ9bm8sZG93bnNjcmlw
dD0vdG1wL3JtdGFwLGlmbmFtZT14Y2JyM190MixxdWV1ZXM9MSBcDQo+ID4+ICAgICAtZGV2aWNl
IGlnYixidXM9cGNpZV9wb3J0LjMsbmV0ZGV2PW5ldDMsbWFjPTAwOjAwOjAwOjAxOjAzOjAyDQo+
ID4+DQo+ID4+IExvYWQgSUdCL0lHQlZGIG1vZHVsZXMgaWYgbmVlZGVkLg0KPiA+PiBtb2Rwcm9i
ZSBpZ2INCj4gPj4gbW9kcHJvYmUgaWdidmYNCj4gPj4NCj4gPj4gQ3JlYXRlIFZGcyB2aWEgL3N5
cw0KPiA+PiBscyAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwOjAxOjAwLjAvDQo+ID4+IGVjaG8g
MiA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6MDE6MDAuMC9zcmlvdl9udW12ZnMNCj4gPj4N
Cj4gPj4gU3JpcmFtIFlhZ25hcmFtYW4gKDUpOg0KPiA+PiAgICBwY2llOiBhZGQgaGVscGVyIGZ1
bmN0aW9uIHRvIGdldCBudW1iZXIgb2YgVkZzDQo+ID4+ICAgIGh3L25ldC9uZXRfdHhfcGt0OiBo
ZWxwZXIgZnVuY3Rpb24gdG8gZ2V0IGwyIGhkcg0KPiA+PiAgICBody9uZXQvaWdiOiByZWdpc3Rl
ciBkZWZpbml0aW9ucw0KPiA+PiAgICBody9uZXQvaWdiOiBlbXVsYXRlZCBpbnRlbCBJR0IgKDgy
NTc2RUIpIG5ldHdvcmsgZGV2aWNlDQo+ID4+ICAgIGh3L25ldC9pZ2I6IGJ1aWxkIHN1cHBvcnQg
Zm9yIGlnYi9pZ2J2ZiBkZXZpY2VzDQo+ID4NCj4gPiBIYXZlbid0IHJldmlld2VkIHRoaXMgc2Vy
aWVzIGJ1dCBJIHRoaW5rIHdlJ2QgaGF2ZSB0d28gbW9yZSB0aGluZ3M6DQo+ID4NCj4gPiAxKSB1
cGRhdGUgdGhlIE1BSU5UQUlORVJTDQo+ID4gMikgYSBxdGVzdCBmb3IgaWdiIChoYXZpbmcgYSBx
dGVzdCBmb3Igc3ItaW92IHdvdWxkIGJlIGV2ZW4gYmV0dGVyKQ0KPiA+DQo+ID4gVGhhbmtzDQo+
ID4NCj4gPj4NCj4gPj4gICBody9pMzg2L0tjb25maWcgICAgICAgICAgICAgfCAgICAxICsNCj4g
Pj4gICBody9uZXQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgICA1ICsNCj4gPj4gICBody9uZXQv
ZTEwMDBfcmVncy5oICAgICAgICAgfCAgMzU3ICsrKy0NCj4gPj4gICBody9uZXQvZTEwMDB4X2Nv
bW1vbi5jICAgICAgfCAgIDEzICsNCj4gPj4gICBody9uZXQvZTEwMDB4X2NvbW1vbi5oICAgICAg
fCAgIDI4ICsNCj4gPj4gICBody9uZXQvaWdiLmMgICAgICAgICAgICAgICAgfCAgNjI3ICsrKysr
Kw0KPiA+PiAgIGh3L25ldC9pZ2IuaCAgICAgICAgICAgICAgICB8ICAxODQgKysNCj4gPj4gICBo
dy9uZXQvaWdiX2NvcmUuYyAgICAgICAgICAgfCAzNzgyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4+ICAgaHcvbmV0L2lnYl9jb3JlLmggICAgICAgICAgIHwgIDIxNiAr
Kw0KPiA+PiAgIGh3L25ldC9pZ2J2Zi5jICAgICAgICAgICAgICB8ICAyNjIgKysrDQo+ID4+ICAg
aHcvbmV0L21lc29uLmJ1aWxkICAgICAgICAgIHwgICAgMiArDQo+ID4+ICAgaHcvbmV0L25ldF90
eF9wa3QuYyAgICAgICAgIHwgICAxNyArLQ0KPiA+PiAgIGh3L25ldC9uZXRfdHhfcGt0LmggICAg
ICAgICB8ICAgIDggKw0KPiA+PiAgIGh3L25ldC90cmFjZS1ldmVudHMgICAgICAgICB8ICAxOTAg
KysNCj4gPj4gICBody9wY2kvcGNpZV9zcmlvdi5jICAgICAgICAgfCAgICA2ICsNCj4gPj4gICBp
bmNsdWRlL2h3L3BjaS9wY2llX3NyaW92LmggfCAgICA1ICsNCj4gPj4gICAxNiBmaWxlcyBjaGFu
Z2VkLCA1NjcxIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQ0KPiA+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBody9uZXQvaWdiLmMNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbmV0
L2lnYi5oDQo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2JfY29yZS5jDQo+ID4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2JfY29yZS5oDQo+ID4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGh3L25ldC9pZ2J2Zi5jDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuMzQuMQ0KPiA+
Pg0KPiA+DQo+ID4NCj4gDQo+IEhpIFNyaXJhbSBhbmQgSmFzb24sDQo+IA0KPiBDb2luY2lkZW50
YWxseSB3ZSBoYXMgYWxzbyBiZWVuIHdvcmtpbmcgb24gaWdiIGVtdWxhdGlvbi4gT3VyIHRyZWUg
aXMNCj4gYXZhaWxhYmxlIGF0Og0KPiBodHRwczovL2dpdGh1Yi5jb20vZGF5bml4L3FlbXUvdHJl
ZS9ha2loaWtvZGFraS9pZ2Jfc3Jpb3ZfcmViYXNlDQo+IA0KPiBCcmllZmx5IGxvb2tpbmcgYXQg
U3JpcmFtJ3Mgc2VyaWVzLCBpdCBzZWVtcyB0byBoYXZlIGJldHRlciBmZWF0dXJlIGNvdmVyYWdl
LCBidXQNCj4gdGhlcmUgYXJlIHNvbWUgY2hhbmdlcyBwcmVzZW50IG9ubHkgaW4gb3VyIHRyZWUg
YXMgd2VsbC4NCj4gRm9yIGluc3RhbmNlLCBvdXIgdHJlZSBpbmNsdWRlcyBhIHF0ZXN0IHRob3Vn
aCBpdCBkb2VzIG5vdCB0ZXN0IFNSLUlPVg0KPiBmdW5jdGlvbmFsaXR5Lg0KPiANCj4gSSdkIGxp
a2UgdG8gc3VnZ2VzdCB5b3UgdG8gcmV2aWV3IGFuZCBtZXJnZSBTcmlyYW0ncyBzZXJpZXMgZmly
c3QsIGFuZCBJIGNhbg0KPiByZWJhc2Ugb3VyIHRyZWUgdG8gZXh0cmFjdCBjaGFuZ2VzIHByZXNl
bnQgb25seSBpbiBvdXIgdHJlZSwgaW5jbHVkaW5nIHF0ZXN0LiBPcg0KPiBpdCBjYW4gYmUgdGhl
IG90aGVyIHdheSBhcm91bmQ7IEkgdGhpbmsgSSBjYW4gZmluaXNoIG15IHNlcmllcyBpbiB3ZWVr
cyBzbyBJIG1heQ0KPiBzdWJtaXQgaXQgb25jZSBpdCBpcyByZWFkeSwgYW5kIHlvdSBjYW4gYXBw
bHkgY2hhbmdlcyBpbiBTcmlyYW0ncyBzZXJpZXMgb24gdG9wDQo+IGl0LiBJJ2QgbGlrZSB0byBo
ZWFyIHdoaWNoIGlzIG1vcmUgY29udmVuaWVudCBmb3IgeW91LCBvciBhbm90aGVyIGlkZWEgaWYg
eW91DQo+IGhhdmUuDQo+IA0KR3JlYXQgdG8ga25vdyB0aGVyZSBhcmUgb3RoZXIgcGVvcGxlIHdv
cmtpbmcgb24gdGhpcyBhdCB0aGUgc2FtZSB0aW1lLiANCkkganVzdCBzZW50IGEgdjIgdmVyc2lv
biB3aXRoIGEgcXRlc3QgdmVyeSBzaW1pbGFyIHRvIGUxMDAwZS10ZXN0Lg0KDQpJIHNlZSB0aGF0
IHlvdXIgdHJlZSBoYXMgZ29vZCBkb2N1bWVudGF0aW9uIGFuZCBhIHZlcnkgbmljZSBpZGVhIHRv
IHRyYW5zbGF0ZQ0KYmV0d2VlbiBQRiBhbmQgVkYgYWRkcmVzc2VzLiBXb3VsZCBiZSBnb29kIHRv
IGdldCB0aG9zZSBjaGFuZ2VzIGFzIHdlbGwuDQoNCj4gUmVnYXJkcywNCj4gQWtpaGlrbyBPZGFr
aQ0K

