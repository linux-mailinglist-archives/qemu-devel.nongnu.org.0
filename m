Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08123F7D40
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:39:23 +0200 (CEST)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzgA-00069U-NQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIzeI-0004aW-Mj; Wed, 25 Aug 2021 16:37:26 -0400
Received: from mail-eopbgr820090.outbound.protection.outlook.com
 ([40.107.82.90]:24064 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIzeG-0003tT-6q; Wed, 25 Aug 2021 16:37:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzIUNzOEPTbJJl7q6/89tG1cL4yNEHhaBXrp2fhH8KKDHgxJvkoO8z1Uuc3dIBo6D5DmtPEHwgQls9V3DmsT3/4BG26mE1tknbAr3dh1LwVWKhVmotoiC79bmngtA+VVbk1bo7UbMZsGkCQkKHb2AyeMA7AWwARfDIT/D3ihNUgGfSBRS0q0cDAKr6UbcmSIU4yr1hoxBDFEShWVPw4kFQ3jj4gZ096rSMX5/GFBzYtICGseeB7oJC21rdmi9pBp27k4pCLT5021t74aYTbAPZEASymJCNsSOqCOguREau4H0lNVusBZdQ5Un8csk8n/iz6EsOuRNmYvFkmHnqfjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl1lvesDR0idTDIBJQGG9ckgUiilC7GMlUKXMRZ0wbM=;
 b=aTztxqiUzogUlsknLpTd/nuT76DMge7tuP8YV+GgO4+DMNWg/7xgqGPoZJyPmJXwcJIlELsoXxYgvNLlE/+C4zk0q314i+w0+f+20qM5sqI4OBMUiL+g6bGYckpbU5o4i8l8hA6jwI7M4+QMH7bbKK/NsLqoMujMCpekz3oZbm/aJf/Zssb3xah1BzNBGs6PyQedwVG6gDDlc88oZdhhLOIbUgAIaZGMph7+l/D7noZvKW5mjwPd32fiUEG5VQ+hNo8Dh6cByEePbWD5z80W1nTn2qxnTbSdj5cw6xgVU/lfQUnWQ/jwxCiSiaCeomS3qAyZh8qONlRCHF11vBOR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl1lvesDR0idTDIBJQGG9ckgUiilC7GMlUKXMRZ0wbM=;
 b=CG1O11121UKYgr3mUYmRjGnz+RhxlP4rqhg3LFZsDM9yZbgXNQAX6TlAN9tEx4CIU/IoTOHfTYji7lXs0LxeFuj+hJG1kyVA3/ZqqWRH5117YpcHENCSoEx5rPRYIZuYkv1AxtzqwwdcAMm9EYn9cnxYoWFOFU7FdwAj55eQqdBZoh7gRdKLyCc0cvlxRglsWKV0cu/rng6uNg8pIT71IYsw75mt4eMAVoBt4z/y7+4u8gUkQ1/b8VKaQ1yI5sPKBpwiuScMXxxElXlPta8S+1BSwOewCIUTIos0SnD1j4ITEL1jTAE5LpmP0jxwAFWgQ6EzP6wJn2jMJABWX5wz0w==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4707.lamprd80.prod.outlook.com (2603:10d6:102:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 20:37:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89%7]) with mapi id 15.20.4415.025; Wed, 25 Aug 2021
 20:37:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: RE: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Topic: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Index: AQHXmPRAdENEpSrR8kmmTHTdl92jxauDlL0AgACYYqCAAH/7AIAAAOPA
Date: Wed, 25 Aug 2021 20:37:17 +0000
Message-ID: <CP2PR80MB3668D3C0F23858EE7D4610F5DAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br> <YSW8TigYwJVIrd5w@yekko>
 <CP2PR80MB36683DC7E9BEEA136FD0DD5EDAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825202638.2vtjxcsau2cghbr3@habkost.net>
In-Reply-To: <20210825202638.2vtjxcsau2cghbr3@habkost.net>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7a71f39-a7db-4bc2-b7d5-08d96808213b
x-ms-traffictypediagnostic: CP2PR80MB4707:
x-microsoft-antispam-prvs: <CP2PR80MB47078B2FE8F41D4385EAE025DAC69@CP2PR80MB4707.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oAFv0ASPt3qXLic53IrsJXqnlSb0V9e4RfEXBbGbMuk+z6xeqyYOhK4PXM2kPx6XuyyfQuC3y3bdlBa3IXCCB0uNOyP/ecZ+n2FvnyD2ahe+41u6+lNvT7KGg90n13/WePT8t0seDzkvvZk9x08VQnyZlbj8aw2oX4wsONZbu8HDW1ex6IfTXzzq6bQZkWgkalhRcAKjlNog06MWflWMR6GW5V3kcPVyFX7q1N3TAamCZDVaoUgkwZiVVwZS8bZ0z46oXHqvOSQW7yKCp4sJEDEfEvWdLM8+zwNcvGq17yjM7T7MDlvAxMloZMgf0iWIXdX+0w0v5p1/j2kU9BW372hFJ1/4K09Kx7l5imHRaoRmycEwcu82VDJUcqBDsH4ISMcFzLiA6tgaveubpHxFu8iB6VSutCPou5sI4xZ5QMJ3b/Bh/+sG1rFp1dfPvJz3DfcoeZd/9NeufuKIfCv9fa67DunTQBIUZXjCDofxw9NKlq4yb2G9AFWW3R5FpqCspZDMl5clfdCuwu7g3rHoOvlREjjnAdIeIHGAlkChWhy3Pwz7QA+RXDE0taxkjwb68yrvLJ8EMXNv7CJEmvbpYaBGLSMNJ5L/gwXmZC919aIy7iFROSRcaqIxOcjoRhzUXIt+FVG7r7+aVXjWxLLVW0NSQGo1LRdclxZ7kbm6w3mCKVIEbqgKKuGFDzAp6brzt0ugWx3Dn43FSocdCHtFRfWteS1QpXkp458JCQjRWuJx4VDW+UEf7GIYyCeEP6n1NbAUEexNZ88UFY8cfMna6uJ4lceKkr8AeRwbwIbmz3c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(366004)(136003)(346002)(376002)(478600001)(71200400001)(316002)(38070700005)(7696005)(52536014)(54906003)(8936002)(2906002)(26005)(5660300002)(186003)(6916009)(9686003)(76116006)(55016002)(4744005)(83380400001)(6506007)(4326008)(66946007)(66446008)(64756008)(66556008)(66476007)(86362001)(122000001)(55236004)(38100700002)(8676002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?by96Rmd0OTZzQWhtN1Y0NjRpQzRFY2F0ZXI3Y3RZNTJGRFNUdVo0Z0NSTWdF?=
 =?utf-8?B?aDdtbGNwYU9qbDBFek42anM4SXFMNnJXZXFBbVVGbnp4bmJsc1pKSnozTGor?=
 =?utf-8?B?YTJsMzlPZDJ5aDJ5VUkyUVpxYjcrQ3dodUdaSVVUSGUxNFBpY2poOFZFN1Za?=
 =?utf-8?B?WkFnUitER2ppQ2Y3L3czSlgyNTJnbFUvdlRqZ3lmZWd1OUtaZUNiZDBFdER1?=
 =?utf-8?B?R1RPUlFjNVR1c2tCUUZBc1VMN0FLb2NLWUQ0anM4YU50ekh6WDZjeU16cDVt?=
 =?utf-8?B?MWJWQThSTVhNcS9pVWxWdHBHSzNraUVMUjVGU0VWOUF2dEREVU9maHNhNnl4?=
 =?utf-8?B?L29LcXJjeklOcmpzc3R6K09ML3JUcURGSldjUU11SXFxR05JbXdpUS8xMW5s?=
 =?utf-8?B?VS8xT3hRZ0JxKzNDaGcyRnJjamRaUkRZb0tPMG0rYjN0RWhhbHhKK0RZNExR?=
 =?utf-8?B?RVIyYlRXa3ZIeFYwMGFoNlJDRFl2WFhIa3UxV3RhaTkrV2Q0Rmo4d0Z6SHA4?=
 =?utf-8?B?TjhkY3E4M1M2WUN5SmVSdFgvbmk0S0kzWllFL20vZjh2UG9iZW91V3NBdU0r?=
 =?utf-8?B?bXkwKyt2SngyVmYwR21ReTFXMlV4MmNJOHFzaXpQNWZDNWFmQjcrYmpCSU5N?=
 =?utf-8?B?cG9lVkN1YmFlb1c3bFJ6Yks2TENhRlZINHpHVGMzU0lQUmp0TjVzYTk1d0ZU?=
 =?utf-8?B?clk1aUQyZWszRzFxYVRVdlFhVndIQ3VqdnlLWFVKYW5tbHA3a051YmxHVVYv?=
 =?utf-8?B?WTlodWRSQ1V3OFdUMk1XSXNGMmpOYU12WkloakdhS0xmcmd0dDJidUVSNENw?=
 =?utf-8?B?VzhnZXV4UmtJeXY2SEJNRi9zNTdENFRDMTEzMElsY0paVG9BZ1RaRnRYTzNw?=
 =?utf-8?B?QytvY2wyOTRrNGdLK08wUmpvNXJJNEJZSzV5eVFsVEZVQzRFeFh4UG4yM3FK?=
 =?utf-8?B?VFlJTW5TTjREQzVaalgwMmR0UkM1VSs5NDZJdkxKTC9icDd5akxFeUtVZHFT?=
 =?utf-8?B?NmR2RGw2NFUzSnJOdEdSeXZWVGdlME5zUGI4Zi95cE9TeE1uNzlzZzZ4MkU5?=
 =?utf-8?B?RXBscVhGUFE4QkZFT2JvRjdudDNWSjZtV2tMck5kazdPWHVZNkZWUXVXNlJ5?=
 =?utf-8?B?d2Z1ZUwwdnhFT3p2RkNpT0xiZU80eXExY01jSkUwWEhwYTdGTis5N1NmT2FW?=
 =?utf-8?B?R2U2Ym1NZTV6QVBIMEpMRXJRYWxSVEVuTTJTaTgyK1h3Wi8za0xxNFBGSU14?=
 =?utf-8?B?NGhQTHVSRjFwYmh1bzBFYnJOZ2xWb1JhenRERTRRejQyVE1nY2hpK083MkNX?=
 =?utf-8?B?UklBekhrVVlPbi9vUUdSWTRvMmJzSlE0ODdyeXJ4TnpGOENHdVh3TDdWdnR5?=
 =?utf-8?B?ZzBXSHZEK21jN1RQSzN2Zm9WS0ZmRm9VTnV2WVJZejRFOE1nTUdSQVM0SWJK?=
 =?utf-8?B?V09OT1dZN1cvRkFvck01cHc1amRaam9CSTJ4UWFma3ZRMDFIN1JKaktaNXpH?=
 =?utf-8?B?UFgvWHExbDl4cFhTRjhGMm8ybXJ3d3A5bjhSS3Fzdm53UHZobytGdXhyQjdZ?=
 =?utf-8?B?dlo4STh2L1pkdjFNcjJTZ05TS0Z5Y3RBTjNsK2NpRlExaHhZUGZBZnR5WTNV?=
 =?utf-8?B?Uzh0ZnlnU0daQ2Z5NFdSVFNQUTZZSUV1THVJMHMraDJyTEJOd25qWDdiOFUv?=
 =?utf-8?B?NklJcGMzVkt0cWRHY052UTZFOHVCSWo1c1ZEUUZCZWU0aVd1bzFvYTZSMmRN?=
 =?utf-8?Q?6BQZvoTg/hw3FoozTcsY70mfdDpD1fTsxNb2dKw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a71f39-a7db-4bc2-b7d5-08d96808213b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 20:37:17.4905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgqVubw67orA06csOcydyBuhmNZ8mo+XkuCgD9wROf7r3cIpR7E2F5XUfo426naaObiu5r+1fr63x1v1wnQnCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4707
Received-SPF: pass client-ip=40.107.82.90;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRWR1YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPg0KDQo+ID4gUmlnaHQs
IHRoYXQncyB0cnVlIG9mIGFueSBzdGFuZGFyZCBpbXBsZW1lbnRhdGlvbiBvZiBhYnMoKS4NCj4g
PiBJIHRob3VnaHQgYWJvdXQgbWFraW5nIGl0IHJldHVybiB1aW50NjRfdCwgYnV0IHRoYXQgY291
bGQgbWFrZSBpdA0KPiA+IHdlaXJkIGZvciBvdGhlciB1c2VzIG9mIGFiczY0KCksIHdoZXJlIGNh
bGxlcnMgd291bGRuJ3QgZXhwZWN0IGEgdHlwZQ0KPiA+IGNoYW5nZSBmcm9tIGludDY0X3QgdG8g
dWludDY0X3QuIE1heWJlIGNyZWF0ZSBhIHNlcGFyYXRlIHVhYnM2NCgpIHRoYXQNCj4gPiByZXR1
cm5zIHVpbnQ2NF90PyBPciBpcyB0aGF0IGV2ZW4gd2VpcmRlcj8gOikNCj4gDQo+IFdoaWNoIHVz
ZXJzIG9mIGFiczY0IHdvdWxkIGV4cGVjdCBpdCB0byByZXR1cm4gaW50NjRfdD8NCj4ga3ZtX3Bp
dF91cGRhdGVfY2xvY2tfb2Zmc2V0KCkgZG9lc24ndCBzZWVtIHRvLg0KDQpPaCwgSSB3YXNuJ3Qg
cmVmZXJyaW5nIHRvIGFueSBzcGVjaWZpYyB1c2Vycy4gV2hhdCBJIG1lYW50IGlzIHRoYXQsIGlm
IHdlIG1ha2UgYWJzNjQoKSBnZW5lcmljYWxseSBhdmFpbGFibGUgZnJvbSBob3N0LXV0aWxzLCBj
YWxsZXJzIGNvdWxkIGV4cGVjdCBpdCB0byBiZWhhdmUgdGhlIHNhbWUgd2F5IGFzIGFicygpIGlu
IHN0ZGxpYiwgZm9yIGV4YW1wbGUuDQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVz
cXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVs
ZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

