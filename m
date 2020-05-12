Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8541D001F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 23:06:54 +0200 (CEST)
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYc72-0001VP-Pb
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 17:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rding@gatech.edu>) id 1jYZyH-0000Ay-C8
 for qemu-devel@nongnu.org; Tue, 12 May 2020 14:49:41 -0400
Received: from mail-bn7nam10on2133.outbound.protection.outlook.com
 ([40.107.92.133]:5953 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rding@gatech.edu>) id 1jYZyE-0005ZU-Qe
 for qemu-devel@nongnu.org; Tue, 12 May 2020 14:49:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btO0DsIn2iyoVNuCxh66kHZztKFUDvKJbj32k7K4up/rYwqs071gmZTNlod7FpWiynVY9ZwZeWzKyE42/dDKjrZvj07lvNSnmD9oBXiTJ3p9Uinenh1/2jNKTtcy64BC8IYEQsJA2GoZdgSma2vSXVGiDjTfKfPg+Z0qOX4ZVL8M1uIlLoF+dwZxZDRJJrcIu9zeZirN6p3rUGkuv8ptN7Gye0jijngKWfeMzZmo0XES9YBpXg0qYdXODGndSI7WlzA05IybQqB/Ql2uvrF1h9bS9Lk02inwdTrWdWPBcQ9Ue4ASc6UkQbhWT5672xFLGk9K+qenCCvfewUsxE7Zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZeuSqjqliqqKIcGD/RvuVqtxG5G4+hPQa20roBup5c=;
 b=BTNdGFVwq2bCJTZEdb7SR5HP3lFvw97AzEPvmdImVMnxLAzWFG1IiwlmFOiMNw5SFEqCAoa/LwyfutdTPmuO+ZFCthcm6iszF8mCAgi7nDf+tJ2e7N4QF94wqtZCgQ7ZudGgr0wP76wIZzmjvGhR0QwRB0rDQE164Dth8o6l+n6lnvRQfsqUwrQX02pHcUzHF9FXG+iTU1OC+8EzlI/WktvOJobhhCwgH2CdhMRrokhJxdnZ/zrp2w2g2F4oKmkqHi1V+2tXx6I7eZpxLLjwFhPJJY3mRlAvpnTei+5LLlKzL+Di0nDZzTn6NwDuaY1O1ZEN3dOfhbEHcffjcqqsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gatech.edu; dmarc=pass action=none header.from=gatech.edu;
 dkim=pass header.d=gatech.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gatech.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZeuSqjqliqqKIcGD/RvuVqtxG5G4+hPQa20roBup5c=;
 b=XgLf73HFnTt5PlKesOmab+iLT1IIwvRNFBeUb7ghQl9MkmEi27uvsMV8doHslp6EXNr+FfEIIGouEfAeEispQHpktk1ekdXwZPxBCQFBJ9qZnKsb8qCnRcyjgxqlD8RruF/9xMHpor7jWQi9a/Jrzi9VLQL8Z5B3YTrzYmzAIOE=
Received: from BN6PR07MB3412.namprd07.prod.outlook.com (2603:10b6:405:62::19)
 by BN6PR07MB2898.namprd07.prod.outlook.com (2603:10b6:404:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 18:49:36 +0000
Received: from BN6PR07MB3412.namprd07.prod.outlook.com
 ([fe80::c9dc:66b8:c941:d0c9]) by BN6PR07MB3412.namprd07.prod.outlook.com
 ([fe80::c9dc:66b8:c941:d0c9%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 18:49:36 +0000
From: "Ding, Ren" <rding@gatech.edu>
To: P J P <ppandit@redhat.com>, =?gb2312?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkqKY=?=
 <philmd@redhat.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIDAvMl0gdXNlIHVuc2lnbmVkIHR5cGUgZm9yIE1lZ2Fz?=
 =?gb2312?Q?asState_fields?=
Thread-Topic: [PATCH 0/2] use unsigned type for MegasasState fields
Thread-Index: AQHWJF6W07NroReLN0GJrXmoymoO16ikfYmAgABSZgCAAAGR6A==
Date: Tue, 12 May 2020 18:49:35 +0000
Message-ID: <BN6PR07MB341283EBBF78F86AAA995382CABE0@BN6PR07MB3412.namprd07.prod.outlook.com>
References: <20200507105718.1319187-1-ppandit@redhat.com>
 <26201c24-c483-85a7-2f4b-b3cc56d4b8b7@redhat.com>,
 <nycvar.YSQ.7.76.2005122357030.1451610@xnncv>
In-Reply-To: <nycvar.YSQ.7.76.2005122357030.1451610@xnncv>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=gatech.edu;
x-originating-ip: [2601:c0:c67f:9210:f9d7:cb6c:3753:8635]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 299e4fd6-021c-4201-87e3-08d7f6a537b2
x-ms-traffictypediagnostic: BN6PR07MB2898:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR07MB289863628224C7E583E95E7FCABE0@BN6PR07MB2898.namprd07.prod.outlook.com>
x-gt-tenant: 042d12d7-75fe-4547-b5b6-0573f80f829d
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yo6TBPrchIB9CXkCNZVcpr+syIXELl/+D0Yn+nCOGK2ChhLad90AfYL9132CBP3Po+EQCWZ/RR3a5yk9kBd3oS95uA77hgmmHFL44GG1Qqd5SYip0ql1SW9TIjJ5SB6bp5ITvAokCpWMsPNeMgnL83x2Xm8jEMjk++498jQfMt7kHCQsbqMtR8x3ONkgdzvbT0q8VU/zBQE1s8nujFpo7QCwuncN6ytmi99i9J9ZK/j3RkQRAdwFObg/TPvfngwDNDRooNWwQVSg9iYn90PpU17sjS3j+AdqdTZIvcX8jtOBDo1jCejAJF8uKUYFEdSAT6xBmaEt1WTHjV622GGjxdIu6anQxUWZRAdLiTOcsRxfSMQyzdUIzdQRPjfk/gFplRGhnlbyoBoD6w20G+oQ7eJFoMj/fItossKmikKJ0aNLCub2DTdRumIPqpP1oC6JxYkCojun31VsD/X1865uEPo092blyocywjTny1qzyHYTfeEVCU+X7jkxu2R4xF/cYzUtWRRC1gAXha7eCdxz0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR07MB3412.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(33430700001)(6506007)(186003)(2906002)(33440700001)(110136005)(107886003)(54906003)(316002)(786003)(7696005)(86362001)(33656002)(52536014)(8936002)(76116006)(66556008)(66446008)(55016002)(71200400001)(75432002)(5660300002)(4326008)(9686003)(224303003)(66946007)(66476007)(478600001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3rQws2lhmKyPUwEFesTxonnScqT34+Hfyio3CQRDEXsZDDYJ9dxQ5PrXX1tsmRKNio7l0A8Z0QuhjiolI1frvLeNvWjCw8jMWm6TInnyAKY/QwufOkOROS9IO2jdXdii0UkHaYQKCYRJM445y/rxKVKnsCNUDn7Ym2g2vGatg3c4An0AYF3tFG11+KrJmPbo14I3zZRlSduvXtKdJEhZC5wzgBrEVdlQO+JHdt1RljuVypMAvbaYfw1yDCpCG275YFQJ81aqhP3cD/Ajgj9o9bHQgEfvTLThxtvU8TuWTgw6qnt+ZaoPiaSOwm1MXFWzbH0Frzt4ltwiycnJeykb+ZM+PxURsDwcFsd5gFH871oCJtc6hSB/qy7gvdYDcJR2q9/7vuayVoVmo+MSHPp6vtOa37x/pCf8jhD3Ki7+l+chhXxzlRgfrVif2fgd138+t/ts4G0MEOnh9EIioJYoIC0bcihbn2d+RYoWar+Iqkdcv3Drtp/j3tepvRBXfcVXwNbdjQMpWgRvGgma25jpjLn0Udz3gpC4lHzkZGhlQ9w=
Content-Type: multipart/alternative;
 boundary="_000_BN6PR07MB341283EBBF78F86AAA995382CABE0BN6PR07MB3412namp_"
MIME-Version: 1.0
X-OriginatorOrg: gatech.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 299e4fd6-021c-4201-87e3-08d7f6a537b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 18:49:35.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 482198bb-ae7b-4b25-8b7a-6d7f32faa083
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSHT2hapqnbpMuhUq6A1ZJDzLy6ePfmpb0slGr1Gm0KkhMMP1/+Z1mQIBJbqGaLLFau9QAA4DxjR5EKeXlW1GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB2898
Received-SPF: pass client-ip=40.107.92.133; envelope-from=rding@gatech.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 14:49:37
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: 28
X-Spam_score: 2.8
X-Spam_bar: ++
X-Spam_report: (2.8 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 May 2020 17:05:05 -0400
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Zhao, Hanqing" <hanqing@gatech.edu>,
 =?gb2312?B?TWFyYy1BbmRyqKYgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BN6PR07MB341283EBBF78F86AAA995382CABE0BN6PR07MB3412namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpUbyBjbGFyaWZ5LCB0aGUgYnVnIGhhcyBiZWVuIHJlcG9ydGVkIDYgbW9udGhz
IGFnbyB3aXRoIHRoZSBjb21taXQgdmVyc2lvbiBvZiA5OGIyZTNjOWFiM2FiZmU0NzZhMmIwMmY4
ZjUxODEzZWRiOTBlNzJkLCB3aGljaCB3YXMgdGhlIHVwc3RyZWFtIGJhY2sgdGhlbi4gVGhlIHJl
cHJvZHVjaW5nIGRyaXZlciBhbG9uZyB3aXRoIHRoZSBBU0FOIGxvZyB3ZSBwcm92aWRlZCB3YXMg
Zm9yIHRoYXQgdmVyc2lvbiBzcGVjaWZpY2FsbHkuDQoNClRoYW5rcywNCg0KUmVuDQoNCreivP7I
yzogUCBKIFA8bWFpbHRvOnBwYW5kaXRAcmVkaGF0LmNvbT4NCreiy83KsbzkOiAyMDIwxOo11MIx
MsjVIDE0OjM3DQrK1bz+yMs6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZKimPG1haWx0bzpwaGlsbWRA
cmVkaGF0LmNvbT4NCrOty806IFFFTVUgRGV2ZWxvcGVyczxtYWlsdG86cWVtdS1kZXZlbEBub25n
bnUub3JnPjsgRmFtIFpoZW5nPG1haWx0bzpmYW1AZXVwaG9uLm5ldD47IFBhb2xvIEJvbnppbmk8
bWFpbHRvOnBib256aW5pQHJlZGhhdC5jb20+OyBEaW5nLCBSZW48bWFpbHRvOnJkaW5nQGdhdGVj
aC5lZHU+OyBNYXJjLUFuZHKopiBMdXJlYXU8bWFpbHRvOm1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0
LmNvbT4NCtb3zOI6IFJlOiBbUEFUQ0ggMC8yXSB1c2UgdW5zaWduZWQgdHlwZSBmb3IgTWVnYXNh
c1N0YXRlIGZpZWxkcw0KDQorLS0gT24gVHVlLCAxMiBNYXkgMjAyMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkqKYgd3JvdGUgLS0rDQp8IENjJ2luZyBNYXJjLUFuZHKopiBvdXIgc2lnbmVkL3Vuc2ln
bmVkIGNvbnZlcnNpb24gZXhwZXJ0ICh3aXRoIFBhb2xvKS4NCg0KICBtZWdhc2FzX2luaXRfZmly
bXdhcmUNCiAgICBwYV9sbyA9IGxlMzJfdG9fY3B1KGluaXRxLT5waV9hZGRyX2xvKTsNCiAgICBw
YV9oaSA9IGxlMzJfdG9fY3B1KGluaXRxLT5waV9hZGRyX2hpKTsNCiAgICBzLT5wcm9kdWNlcl9w
YSA9ICgodWludDY0X3QpIHBhX2hpIDw8IDMyKSB8IHBhX2xvOw0KICAgIHMtPnJlcGx5X3F1ZXVl
X2hlYWQgPSBsZGxfbGVfcGNpX2RtYShwY2lkLCBzLT5wcm9kdWNlcl9wYSk7DQoNCklJVUMsIGhl
cmUgbGRsX2xlX3BjaV9kbWEoKSByZXR1cm5zIGFuICd1aW50MzJfdCcgdHlwZSwgYnV0IHNpbmNl
DQoncmVwbHlfcXVldWVfaGVhZCcgaXMgYSBzaWduZWQgaW50LCBsYXJnZSAndWludDMyX3QnIHZh
bHVlIHR1cm5zIG5lZ2F0aXZlLg0KDQp8IERvIHlvdSBoYXZlIGEgcmVwcm9kdWNlcj8NCg0KICBZ
ZXMsIHRoZXJlIGlzIGEgcmVwcm9kdWNlciB3aXRoIEFTQU4sIHRob3VnaCBpdCBkaWQgbm90IHdv
cmsgZm9yIG1lLg0KUmVuKENDJ2QpIGhhZCBzaGFyZWQgdGhpcyB0cmFjZToNCg0KQWRkcmVzc1Nh
bml0aXplcjogaGVhcC1idWZmZXItb3ZlcmZsb3cgb24gYWRkcmVzcyAweDdmOTE1OTA1NDA1OCBh
dCBwYyAweDU1NzYzNTE0YjVjZCBicCAweDdmOTE3OWJkNmQ5MCBzcCAweDdmOTE3OWJkNmQ4OA0K
UkVBRCBvZiBzaXplIDggYXQgMHg3ZjkxNTkwNTQwNTggdGhyZWFkIFQyDQogICMwIDB4NTU3NjM1
MTRiNWNjIGluIG1lZ2FzYXNfbG9va3VwX2ZyYW1lIC9ob21lL3Jlbi90bXAvcmVkYWN0ZWQtZGJn
L3FlbXUvaHcvc2NzaS9tZWdhc2FzLmM6NDQ5OjMwDQogICMxIDB4NTU3NjM1MTMyMDVjIGluIG1l
Z2FzYXNfaGFuZGxlX2Fib3J0IC9ob21lL3Jlbi90bXAvcmVkYWN0ZWQtZGJnL3FlbXUvaHcvc2Nz
aS9tZWdhc2FzLmM6MTkwNDoxNw0KICAjMiAweDU1NzYzNTEyZDBmOCBpbiBtZWdhc2FzX2hhbmRs
ZV9mcmFtZSAvaG9tZS9yZW4vdG1wL3JlZGFjdGVkLWRiZy9xZW11L2h3L3Njc2kvbWVnYXNhcy5j
OjE5NjE6MjQNCiAgIzMgMHg1NTc2MzUxMmJhN2QgaW4gbWVnYXNhc19tbWlvX3dyaXRlIC9ob21l
L3Jlbi90bXAvcmVkYWN0ZWQtZGJnL3FlbXUvaHcvc2NzaS9tZWdhc2FzLmM6MjEyMjo5DQogICM0
IDB4NTU3NjM1MTUyNDdjIGluIG1lZ2FzYXNfcG9ydF93cml0ZSAvaG9tZS9yZW4vdG1wL3JlZGFj
dGVkLWRiZy9xZW11L2h3L3Njc2kvbWVnYXNhcy5jOjIxNzM6NQ0KICAjNSAweDU1NzYzNDYyMWIz
YiBpbiBtZW1vcnlfcmVnaW9uX3dyaXRlX2FjY2Vzc29yIC9ob21lL3Jlbi90bXAvcmVkYWN0ZWQt
ZGJnL3FlbXUvbWVtb3J5LmM6NDgzOjUNCiAgIzYgMHg1NTc2MzQ2MjE3NDEgaW4gYWNjZXNzX3dp
dGhfYWRqdXN0ZWRfc2l6ZSAvaG9tZS9yZW4vdG1wL3JlZGFjdGVkLWRiZy9xZW11L21lbW9yeS5j
OjU0NDoxOA0KICAjNyAweDU1NzYzNDYyMDQ5OCBpbiBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3dy
aXRlIC9ob21lL3Jlbi90bXAvcmVkYWN0ZWQtZGJnL3FlbXUvbWVtb3J5LmM6MTQ4MjoxNg0KICAj
OCAweDU1NzYzNDRiNmI2YyBpbiBmbGF0dmlld193cml0ZV9jb250aW51ZSAvaG9tZS9yZW4vdG1w
L3JlZGFjdGVkLWRiZy9xZW11L2V4ZWMuYzozMTYxOjIzDQogICM5IDB4NTU3NjM0NGE4N2Q5IGlu
IGZsYXR2aWV3X3dyaXRlIC9ob21lL3Jlbi90bXAvcmVkYWN0ZWQtZGJnL3FlbXUvZXhlYy5jOjMy
MDE6MTQNCiAgIzEwIDB4NTU3NjM0NGE4Mzc2IGluIGFkZHJlc3Nfc3BhY2Vfd3JpdGUgL2hvbWUv
cmVuL3RtcC9yZWRhY3RlZC1kYmcvcWVtdS9leGVjLmM6MzI5MToxOA0KICAjMTEgMHg1NTc2MzQ0
YThhZjQgaW4gYWRkcmVzc19zcGFjZV9ydyAvaG9tZS9yZW4vdG1wL3JlZGFjdGVkLWRiZy9xZW11
L2V4ZWMuYzozMzAxOjE2DQogICMxMiAweDU1NzYzNDY4OWUxMCBpbiBrdm1faGFuZGxlX2lvIC9o
b21lL3Jlbi90bXAvcmVkYWN0ZWQtZGJnL3FlbXUvYWNjZWwva3ZtL2t2bS1hbGwuYzoyMDg2OjkN
CiAgIzEzIDB4NTU3NjM0Njg4YTQ1IGluIGt2bV9jcHVfZXhlYyAvaG9tZS9yZW4vdG1wL3JlZGFj
dGVkLWRiZy9xZW11L2FjY2VsL2t2bS9rdm0tYWxsLmM6MjMzMjoxMw0KICAjMTQgMHg1NTc2MzQ1
ZWU3YWEgaW4gcWVtdV9rdm1fY3B1X3RocmVhZF9mbiAvaG9tZS9yZW4vdG1wL3JlZGFjdGVkLWRi
Zy9xZW11L2NwdXMuYzoxMjk5OjE3DQogICMxNSAweDU1NzYzNWExMTUwOSBpbiBxZW11X3RocmVh
ZF9zdGFydCAvaG9tZS9yZW4vdG1wL3JlZGFjdGVkLWRiZy9xZW11L3V0aWwvcWVtdS10aHJlYWQt
cG9zaXguYzo1MTk6OQ0KICAjMTYgMHg3ZjkxOGNlYzI2YjkgaW4gc3RhcnRfdGhyZWFkICgvbGli
L3g4Nl82NC1saW51eC1nbnUvbGlicHRocmVhZC5zby4wKzB4NzZiOSkNCiAgIzE3IDB4N2Y5MThj
NWQ0NDFjIGluIGNsb25lIC9idWlsZC9nbGliYy1MSzVnV0wvZ2xpYmMtMi4yMy9taXNjLy4uL3N5
c2RlcHMvdW5peC9zeXN2L2xpbnV4L3g4Nl82NC9jbG9uZS5TOjEwOQ0KDQoNClRoYW5rIHlvdS4N
Ci0tDQpQcmFzYWQgSiBQYW5kaXQgLyBSZWQgSGF0IFByb2R1Y3QgU2VjdXJpdHkgVGVhbQ0KODY4
NSA1NDVFIEI1NEMgNDg2QiBDNkVCIDI3MUUgRTI4NSA4QjVBIEYwNTAgREU4RA0KDQo=

--_000_BN6PR07MB341283EBBF78F86AAA995382CABE0BN6PR07MB3412namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi a=
ll,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">To c=
larify, the bug has been reported 6 months ago with the commit version of
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">98b2e3c9ab3abfe476a2=
b02f8f51813edb90e72d, which was the upstream back then. The reproducing dri=
ver along with the ASAN log we provided was for that version specifically.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Than=
ks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Ren<=
/span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:SimSun"><o:p>&nbsp;</o:p></span></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>=B7=A2=BC=FE=C8=
=CB<span lang=3D"EN-US">: </span>
</b><span lang=3D"EN-US"><a href=3D"mailto:ppandit@redhat.com">P J P</a><br=
>
</span><b>=B7=A2=CB=CD=CA=B1=BC=E4<span lang=3D"EN-US">: </span></b><span l=
ang=3D"EN-US">2020</span>=C4=EA<span lang=3D"EN-US">5</span>=D4=C2<span lan=
g=3D"EN-US">12</span>=C8=D5<span lang=3D"EN-US"> 14:37<br>
</span><b>=CA=D5=BC=FE=C8=CB<span lang=3D"EN-US">: </span></b><span lang=3D=
"EN-US"><a href=3D"mailto:philmd@redhat.com">Philippe Mathieu-Daud<span lan=
g=3D"EN-US"><span lang=3D"EN-US">=A8=A6</span></span></a><br>
</span><b>=B3=AD=CB=CD<span lang=3D"EN-US">: </span></b><span lang=3D"EN-US=
"><a href=3D"mailto:qemu-devel@nongnu.org">QEMU Developers</a>;
<a href=3D"mailto:fam@euphon.net">Fam Zheng</a>; <a href=3D"mailto:pbonzini=
@redhat.com">
Paolo Bonzini</a>; <a href=3D"mailto:rding@gatech.edu">Ding, Ren</a>; <a hr=
ef=3D"mailto:marcandre.lureau@redhat.com">
Marc-Andr<span lang=3D"EN-US"><span lang=3D"EN-US">=A8=A6 Lureau</span></sp=
an></a><br>
</span><b>=D6=F7=CC=E2<span lang=3D"EN-US">: </span></b><span lang=3D"EN-US=
">Re: [PATCH 0/2] use unsigned type for MegasasState fields</span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:SimSun"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&#43=
;-- On Tue, 12 May 2020, Philippe Mathieu-Daud</span><span style=3D"font-si=
ze:11.0pt">=A8=A6<span lang=3D"EN-US"> wrote --&#43;<br>
| Cc'ing Marc-Andr</span>=A8=A6<span lang=3D"EN-US"> our signed/unsigned co=
nversion expert (with Paolo).<br>
<br>
&nbsp; megasas_init_firmware<br>
&nbsp;&nbsp;&nbsp; pa_lo =3D le32_to_cpu(initq-&gt;pi_addr_lo);<br>
&nbsp;&nbsp;&nbsp; pa_hi =3D le32_to_cpu(initq-&gt;pi_addr_hi);<br>
&nbsp;&nbsp;&nbsp; s-&gt;producer_pa =3D ((uint64_t) pa_hi &lt;&lt; 32) | p=
a_lo;<br>
&nbsp;&nbsp;&nbsp; s-&gt;reply_queue_head =3D ldl_le_pci_dma(pcid, s-&gt;pr=
oducer_pa);<br>
<br>
IIUC, here ldl_le_pci_dma() returns an 'uint32_t' type, but since <br>
'reply_queue_head' is a signed int, large 'uint32_t' value turns negative.<=
br>
<br>
| Do you have a reproducer?<br>
<br>
&nbsp; Yes, there is a reproducer with ASAN, though it did not work for me.=
 <br>
Ren(CC'd) had shared this trace:<br>
<br>
AddressSanitizer: heap-buffer-overflow on address 0x7f9159054058 at pc 0x55=
763514b5cd bp 0x7f9179bd6d90 sp 0x7f9179bd6d88<br>
READ of size 8 at 0x7f9159054058 thread T2<br>
&nbsp; #0 0x55763514b5cc in megasas_lookup_frame /home/ren/tmp/redacted-dbg=
/qemu/hw/scsi/megasas.c:449:30<br>
&nbsp; #1 0x55763513205c in megasas_handle_abort /home/ren/tmp/redacted-dbg=
/qemu/hw/scsi/megasas.c:1904:17<br>
&nbsp; #2 0x55763512d0f8 in megasas_handle_frame /home/ren/tmp/redacted-dbg=
/qemu/hw/scsi/megasas.c:1961:24<br>
&nbsp; #3 0x55763512ba7d in megasas_mmio_write /home/ren/tmp/redacted-dbg/q=
emu/hw/scsi/megasas.c:2122:9<br>
&nbsp; #4 0x55763515247c in megasas_port_write /home/ren/tmp/redacted-dbg/q=
emu/hw/scsi/megasas.c:2173:5<br>
&nbsp; #5 0x557634621b3b in memory_region_write_accessor /home/ren/tmp/reda=
cted-dbg/qemu/memory.c:483:5<br>
&nbsp; #6 0x557634621741 in access_with_adjusted_size /home/ren/tmp/redacte=
d-dbg/qemu/memory.c:544:18<br>
&nbsp; #7 0x557634620498 in memory_region_dispatch_write /home/ren/tmp/reda=
cted-dbg/qemu/memory.c:1482:16<br>
&nbsp; #8 0x5576344b6b6c in flatview_write_continue /home/ren/tmp/redacted-=
dbg/qemu/exec.c:3161:23<br>
&nbsp; #9 0x5576344a87d9 in flatview_write /home/ren/tmp/redacted-dbg/qemu/=
exec.c:3201:14<br>
&nbsp; #10 0x5576344a8376 in address_space_write /home/ren/tmp/redacted-dbg=
/qemu/exec.c:3291:18<br>
&nbsp; #11 0x5576344a8af4 in address_space_rw /home/ren/tmp/redacted-dbg/qe=
mu/exec.c:3301:16<br>
&nbsp; #12 0x557634689e10 in kvm_handle_io /home/ren/tmp/redacted-dbg/qemu/=
accel/kvm/kvm-all.c:2086:9<br>
&nbsp; #13 0x557634688a45 in kvm_cpu_exec /home/ren/tmp/redacted-dbg/qemu/a=
ccel/kvm/kvm-all.c:2332:13<br>
&nbsp; #14 0x5576345ee7aa in qemu_kvm_cpu_thread_fn /home/ren/tmp/redacted-=
dbg/qemu/cpus.c:1299:17<br>
&nbsp; #15 0x557635a11509 in qemu_thread_start /home/ren/tmp/redacted-dbg/q=
emu/util/qemu-thread-posix.c:519:9<br>
&nbsp; #16 0x7f918cec26b9 in start_thread (/lib/x86_64-linux-gnu/libpthread=
.so.0&#43;0x76b9)<br>
&nbsp; #17 0x7f918c5d441c in clone /build/glibc-LK5gWL/glibc-2.23/misc/../s=
ysdeps/unix/sysv/linux/x86_64/clone.S:109<br>
<br>
<br>
Thank you.<br>
--<br>
Prasad J Pandit / Red Hat Product Security Team<br>
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D<o:p></o:p></span></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:SimSun"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BN6PR07MB341283EBBF78F86AAA995382CABE0BN6PR07MB3412namp_--

