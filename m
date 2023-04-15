Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DF6E334A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:13:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlKE-0004yC-5L; Sat, 15 Apr 2023 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlKC-0004y3-UX
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:12:40 -0400
Received: from mail-db5eur02on2070f.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::70f]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlKB-0008A7-0a
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:12:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+jsRB6a5d6mBZaHrQ5ygxcaPF974sDOCbX3y9MHFhzqfGHTNyPY8ZRtwvs2SnmHtRGi91e6ebF73sq5ZH9VYa3c1eBMgYbIcRaDoca+0gWNCk1iQBbo45+fSeya/AyTmhRYENpx3IA8SxHhUGq/+ReywPwHSsauqLSiI56NlfzmWJsFegp6WpXCh10ESDj9lBpm+TkDNZGTxLcHfGuFUCtyU9FLkaiDGSHuqocNS9O4xUlXvNNzuslviYaNqpdWAZzQLeTpE/grgNRc11D5mCa582hu1zlQvxn7ma5lBYZ+0dO36mO6Qtpd3upimdCIA04/eDb54UaqhIU6IT6ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IUQR0EBD7Tjy7xyVbZxkoTWSOf5mDoArhPKsvFm2u8=;
 b=Mxb6dt26TEAy3AOSxrn5c4RVMeC8E0EC3OR6KVrpJiQG4vMS17mqo1tugKwu7XIWUJgnOlSCQMdy4HbnoI5gPdcQ4ccZTxk8pGiMyXREIVCgAZv7zZjrg1RTKJMVzoE0zjaFhWEikTH7W9jn6fG6lb3YnTyiP9okJ9DpQ+UPFaBtoEvwmuP8sKdLpkUjZ+hnzRoUcX5w76vDN4T4gSnaS73ckCf4cqP0i+y/EdBnkRJJUOp2alPSbUhquOx99VtnQB2mCNwdxGkIAnSU4AmdWy0fb7dtQ10DtNQkceiCDIxoXSgmWYWc2mhDDJz5bqAKqVFhuBzKGEMcSX+JkEG75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IUQR0EBD7Tjy7xyVbZxkoTWSOf5mDoArhPKsvFm2u8=;
 b=T4PKTc+g3YGelDMWX75bz0TL0qIqXV2HOT3YAU2nWIR8+2I+TgbyH5aay2NXXYS/Fe0aflt32y4mldwcqzPW50rSPtQ91fDww7/5kWcT7ynw7NYLLx17cew/Cr/s0WLcH0iKqvWbP3N+dGw+I5seb0QqXCV11fvu8WSE0aCKXuA=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:12:04 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:12:04 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 29/40] igb: Implement MSI-X single vector mode
Thread-Topic: [PATCH 29/40] igb: Implement MSI-X single vector mode
Thread-Index: AQHZbsXXiPD1hr/RAEifre3HgDTgla8svoBA
Date: Sat, 15 Apr 2023 19:12:04 +0000
Message-ID: <DBBP189MB1433764A5DFA31A359321BE2959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-30-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-30-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 3c48c251-9282-4daa-37aa-08db3de54ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MKz5pYYk0LrJ9OJZUI1v0Kl2o9nzV1JFSq0GJ6NyNATbO0Wi/sfJLhDrkcD1Kzv6VrOCZHXNOidKJ0gfqZqk0i4MtcnBXTfxM/mH2I3aP6VRrRC7exih91hUTKUN2oJk9e9A4KKzITQtPSxQ7qZ2haH2kWpG6Oj8k9CpiIOc4gksSUpTkEmd46LhDHUksmiBinbr7sxQbtJ50ua4DdL/PbUw/xtASYimyreN/jv5vTT9PpIzX+FkL9Cx2+VbqD6Rbtn4mRIRZFXbKNd/MR+eSS5Sj/vYZRDfFQlIqnpS7x30GDiZJgC56B5k7CMlfIw5pfq9ZAmbVRpftFmrI+lJMnWti5gTwstJUVAtVHTJNOP+i2CJhmty8ndoquomKGlFee7FMe/AZxFEkJN2twjBrUJ8njbNUSUuIxPX3XKxLbYLjU1SJ07vPpB3Fnt9t16Z8fyAYHceNK1XBQOXEf7ZEEpiBVdQNoTSKuOBZVkax85eVb8jpVXDtZsoAFpxv99Dmb3V5TJKb+rnSvM83iBBzzHbQN53krPJ5rtYLmw6d6z+jEL12lHmhghxKJ4Ws/F7TVfSCn31BbN8DT6JZIwOJ310Zj//KoEI6Bi/35Z4/Ofn25tLx+i+a/PExNXGWEaU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(346002)(39840400004)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME9rM1hhQmdlN25QWThKWC9xdXVPTGU3cUdwaWcrcnVSOVJJSWZsRHlmeDF6?=
 =?utf-8?B?d3JIZUdEWTVoL05TSDZQcktVaTRLckxsb0t2aTdHKytMWEF2MTR3Sm4wVk83?=
 =?utf-8?B?ekVPTmFSQVJIU2ZFOHZRb3hDL0h6OVRxOG9iNzNpTGNBSnhSM1NqYzNVQzdB?=
 =?utf-8?B?VWlTK0lEQS9rVzUybmNGVXdiaFhnRWdLbGxlUncxNThXU0grd28xRjVBNThn?=
 =?utf-8?B?U0xHTEh1b3VLWVhMM2Q4MnF4SkJpaDJTRXc4YmdDY1diVHdTc2tBVzJVaW5F?=
 =?utf-8?B?VmptMUdQMTA2K082T1dZUm9zb0s1QjAwS0pYdHFQVTJEM1dQNmFJVFJrVU5i?=
 =?utf-8?B?ajV1d294Zkl0RlJUb1hhSFFFUzV6dCs5bWIwUDdKOTBCdjR2eHdVcU5veElK?=
 =?utf-8?B?dC9kbHNWSGJtM0txNUN0b2RXSUVJNjN5REtmK0JrTzZCU2ptMlV1UThPbFZK?=
 =?utf-8?B?R2Y4UTRMYlNJYTJmN3p4VUY3ZEoxUVJzU0N0THpxNHU4VVVXSWx4Ymo5V2ox?=
 =?utf-8?B?c1ZFRUNyNk5FOFZtdzRITmlUTzltMm1TMXJKRm5JY0p5RmY0dXp2NUFHSXEw?=
 =?utf-8?B?bXY4OEVTb1p4RDBlZjZqRlZMa0c3eVUzM0V6NmhmbGNrTXEvdHJhNWd0Nmcx?=
 =?utf-8?B?ckxFVlpsY05PczNzNlRBNkU0dVpDd1ZKVzlyT3E5Z0N6SGRSSlVUaWhFYlg4?=
 =?utf-8?B?MWtiQzhFSnFiUTd1UTJneld4YTQzS1p1MktWTWJGY1lTcFNQeUQ0YkVNYktl?=
 =?utf-8?B?azF3eE9lYm9lOEk3NDEzTTNsUmJ1VDBoa0MzMDdZRGVvRXlsSE1Pb1NMM2M2?=
 =?utf-8?B?NFZ3V01UVUdzT3h4bkRwbmNIS0h5Uy9LczUyOC81cC80T2h4VVhmbGpTRCto?=
 =?utf-8?B?TVpkNFFla09ZdWYrdUUrYmw4Y0NXUklNalIxVlJpTklRbnYzdGZOV2RSaWR4?=
 =?utf-8?B?TnF6VkMyMGtXVXoxWkxMOFBRUjcrNU5sMlk5WFZVQXpZdU93TjA4bEsxWXFF?=
 =?utf-8?B?UzU2OWpCdVVnMHVhZDdHSFFkNVE0ZTAzSjZmS1hwMzJtMXRxVVFvcXJJalVR?=
 =?utf-8?B?d2pybjRLczhTcGl5ektXK0FVT3pTSERTMkNhc1NlWDVWYVQyUWE4SGF5UXhP?=
 =?utf-8?B?WGVuOGEvTjlHOU5Fbm5qOHdXbm5kMzhzL24ybGlXVGk2ZW96R1Vwc0JkVzgv?=
 =?utf-8?B?RUxGbmtROUg5SCsvM0Y3Q2ZtcXBvckdpY0N2aVJPbktoTXN3cFA1dXlYRmNN?=
 =?utf-8?B?em5vVHAyRk4vc1I4M09QRDg4QXRZemVQcHNWRWVUMEwzam5McGMwRUVZdjBh?=
 =?utf-8?B?b282elFocXBKTlV6cVREVkR5b1ZYdC8rcnROQjlxbU9GdUZIWUtvd3UrVGR0?=
 =?utf-8?B?b3VtQnVtaW9VVDdPM253M1RobUt3UnpVNkp0R3dFTjZOMEdZUHhxZXpMdVBw?=
 =?utf-8?B?LzNGa2llSFNDTUVSUnZLcXV1VHJDZU45RTlnV2ZINDArcDJ3ZnZ2UmJYcHJ6?=
 =?utf-8?B?NUU0R3RwT3VpQmZVZ1RxcmkyUGQwN1Vuc3FZdnFRVGFycjhXbklRbGRCOE1U?=
 =?utf-8?B?c056czd2dnhFQjNWNytLMHEzN29pMDQ5Uk9GcVZib2ZTWXVhOGVIdkJtT2or?=
 =?utf-8?B?RnJ6UHFRbkJiNGJlVkhYZDRrM3JyaEp5L2s5K3J1eWljamsrTFFHNzU0WFVJ?=
 =?utf-8?B?RXFWL0NpWTI4RTBrLzhvZ0ZwWXplakpFc2FEaURQZFN0MDhlMVZDQnNxN3lX?=
 =?utf-8?B?WkpmbzlPSk1hOWVrWmFzS1VLRlFPR2hjVzhFZCt6NlNtaUpUMTh4TWZUSFd6?=
 =?utf-8?B?Q2VOVFFBTCtlZ2x2eFNrb3JiVDBzYWd0aG1WMTB0QUYxRG5KVlZmcGg1SWV2?=
 =?utf-8?B?dDFDN0xjVi80bFFBRjNqcGVnOXFZZm1SQ0ZtV2c1L1dOcmRyRGNjaVVEVUp0?=
 =?utf-8?B?eFRNY0dCZ05GODJsaDM4T0pFcHJoYmluRGZVelcwVFU1Q1E0ZmNLSEMwV0ph?=
 =?utf-8?B?Q1NyNFAxN1NqaHBjNVl6LzZXbzI0L01yeFU5bzVDQ01hK0paK0ZJOGEzbE1P?=
 =?utf-8?B?TGN4Rjd0bnU0TTh4dGdobFVTVmE4aGxld3Qxd05LVXF4NHVNdWNTYmhCakxZ?=
 =?utf-8?Q?Qe3k7Ps1TvAnRZZKTxNobeKBy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c48c251-9282-4daa-37aa-08db3de54ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:12:04.4835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdo2WyzTs7bF0fOq5vV2RfqmINC37le9Ipxi9oJhLHJoOFbwza84nrqOEYz3ZxXu1ia9IEyjr9UbjCYgftumYZPymAU67OOGtXSTtFfp3Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::70f;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogRnJpZGF5LCAxNCBBcHJpbCAyMDIzIDEz
OjM3DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47DQo+IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IFRob21hcyBIdXRoDQo+IDx0
aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWluZXJz
bUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVyIFJv
c2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQu
Y29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMjkvNDBdIGlnYjogSW1wbGVtZW50IE1TSS1YIHNpbmdsZSB2ZWN0
b3IgbW9kZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFr
aUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgOSArKysrKysrLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9uZXQvaWdiX2NvcmUuYyBpbmRl
eA0KPiA0MjliMGViYzAzLi4yMDEzYTlhNTNkIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX2Nv
cmUuYw0KPiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBAQCAtMTg3MCw3ICsxODcwLDcgQEAg
aWdiX3VwZGF0ZV9pbnRlcnJ1cHRfc3RhdGUoSUdCQ29yZSAqY29yZSkNCj4gDQo+ICAgICAgaWNy
ID0gY29yZS0+bWFjW0lDUl0gJiBjb3JlLT5tYWNbSU1TXTsNCj4gDQo+IC0gICAgaWYgKG1zaXhf
ZW5hYmxlZChjb3JlLT5vd25lcikpIHsNCj4gKyAgICBpZiAoY29yZS0+bWFjW0dQSUVdICYgRTEw
MDBfR1BJRV9NU0lYX01PREUpIHsNCj4gICAgICAgICAgaWYgKGljcikgew0KPiAgICAgICAgICAg
ICAgY2F1c2VzID0gMDsNCj4gICAgICAgICAgICAgIGlmIChpY3IgJiBFMTAwMF9JQ1JfRFJTVEEp
IHsgQEAgLTE5MDUsNyArMTkwNSwxMiBAQA0KPiBpZ2JfdXBkYXRlX2ludGVycnVwdF9zdGF0ZShJ
R0JDb3JlICpjb3JlKQ0KPiAgICAgICAgICB0cmFjZV9lMTAwMGVfaXJxX3BlbmRpbmdfaW50ZXJy
dXB0cyhjb3JlLT5tYWNbSUNSXSAmIGNvcmUtPm1hY1tJTVNdLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3JlLT5tYWNbSUNSXSwgY29yZS0+bWFjW0lN
U10pOw0KPiANCj4gLSAgICAgICAgaWYgKG1zaV9lbmFibGVkKGNvcmUtPm93bmVyKSkgew0KPiAr
ICAgICAgICBpZiAobXNpeF9lbmFibGVkKGNvcmUtPm93bmVyKSkgew0KPiArICAgICAgICAgICAg
aWYgKGljcikgew0KPiArICAgICAgICAgICAgICAgIHRyYWNlX2UxMDAwZV9pcnFfbXNpeF9ub3Rp
ZnlfdmVjKDApOw0KPiArICAgICAgICAgICAgICAgIG1zaXhfbm90aWZ5KGNvcmUtPm93bmVyLCAw
KTsNCj4gKyAgICAgICAgICAgIH0NCj4gKyAgICAgICAgfSBlbHNlIGlmIChtc2lfZW5hYmxlZChj
b3JlLT5vd25lcikpIHsNCj4gICAgICAgICAgICAgIGlmIChpY3IpIHsNCj4gICAgICAgICAgICAg
ICAgICBtc2lfbm90aWZ5KGNvcmUtPm93bmVyLCAwKTsNCj4gICAgICAgICAgICAgIH0NCj4gLS0N
Cj4gMi40MC4wDQoNClJldmlld2VkLWJ5OiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25h
cmFtYW5AZXN0LnRlY2g+DQoNCg==

