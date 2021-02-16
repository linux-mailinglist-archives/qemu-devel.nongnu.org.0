Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B088131C87E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:05:22 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxEP-0007aL-Fz
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lBxCf-00072Q-Ly; Tue, 16 Feb 2021 05:03:33 -0500
Received: from mail-mw2nam08on2054.outbound.protection.outlook.com
 ([40.107.101.54]:61728 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lBxCc-0002s9-U7; Tue, 16 Feb 2021 05:03:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLnErq4qSGY7hFOOVeppNvsk6ExrZuu0yqv7HQlVEcGb8YWkKxZi+xGl7FGm82UP86TumY+iIvAZT7Qrp+GV0yXPSKsHyYMTevNqxKdPIya+3soPl59OuW/x76lOa9qMPxDPns/yV4ZsK2E2FmV1RdM+bM8UrmVLSdUdDUsTvg1qPgQiX8f5O32Ujcnv5H03ZqxspyO+BUYm146mmy0Vu+HH8OIB71S7TTQaUehk+93X74Btf4c40mvoCts06WBdOldfw3V36DsAkGJkRhmMXQvm91Q7UkJe6ODspZFxwVN4Xl9nNjN+mu7mh24Nt/p5C8uu9YMxP+Pa8rVH0E+T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEC0Dz1ezlP82hI9SXfB2RkPodg4hBpbQsYKG1TgPn4=;
 b=dNe4F9U1tMjvE2+JBo0qxZpbDHnWro4jiELi91Kt2E9E70Hw5RDYwEtJv7beeEKzhg1CvfqxJE4zRTHaHDwDbcKfOO45pNLVDaXQF2Pv4zB7a3y/qcx494cVP1Hu1PZX/KNNhTSMMsW5tT0GxTwIU9UC0TA+GZYevc/N4vgKMZmIN6QBIno54B3ZfuPO2j6JVu4gALzigfLnLqefK39qIycfzAfaS7Or6mGrI4pd2yvhj5h3RjHWcAF7ylncB9xDjxKm2Z0TMLbtMZfPI5nuWicDJ735lCjM3Um0GaBeScRW1WZyA3T6/FsIwUjkgiunQTX47tJYswImwzHw97AqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEC0Dz1ezlP82hI9SXfB2RkPodg4hBpbQsYKG1TgPn4=;
 b=ZCGWNlZlsL5NJHRz9i+YeVn3n8m4NazknBbu1LyX8AGb5R0GoviqU/8pLYB8FkJi6WolV8XzRRNuRtgbjxwrHfz9enDKmGHL5XHUnMhx8SipRGDCZ4aJz/8MRO7qJmTf1r/F1VFQBA9ZqoOOcYwpm6d+cTVbFPNzR+c1oMPLC+c=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7536.namprd02.prod.outlook.com (2603:10b6:a03:32a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Tue, 16 Feb
 2021 10:03:24 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 10:03:24 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: RE: [RFC PATCH 09/15] sd: emmc: Add support for emmc erase
Thread-Topic: [RFC PATCH 09/15] sd: emmc: Add support for emmc erase
Thread-Index: AQHXAE21Zc/nzsDU/E++JpTat7bxk6pVFo4AgAV+l+A=
Date: Tue, 16 Feb 2021 10:03:24 +0000
Message-ID: <BY5PR02MB6772EF9F67763D159666351DCA879@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-10-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAKmqyKOZ3VS1n6xCvRzu6_VZb3g2sZS4VbZ6M0aopsXX00mG9Q@mail.gmail.com>
In-Reply-To: <CAKmqyKOZ3VS1n6xCvRzu6_VZb3g2sZS4VbZ6M0aopsXX00mG9Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65b60b60-55e4-478b-e074-08d8d2621967
x-ms-traffictypediagnostic: SJ0PR02MB7536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB753626D9E954A298243F3DFFCA879@SJ0PR02MB7536.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4PIUcIM0sQ5R6V98zGJYsaKCtT/S/jZL8sJtPOrKAVwJa7GoDOpsA9HqsLqtvoVQGaBOa8YfqSo59R+Py0vP9cLW8XKJ4ZzVu5GRaKip/ia9ofstoxTdAUmCJmTUpTOxdey5cE6pxgMSXTsM5g/NCnvRvzBGmmUY+E0SoD1vaz5S4V9hs4+hpEmOfcv/rUhhrsciCM390WNaAsZfzSb+kFPq1Vj1gWhcy1CrT+LIocJLoO9LAktw6mqDpTk8gbR2t+OhgIL19QrQobjIEoSrVkznZnkfYQAnwTELBSvNLKJ4jz/VFpV0Hef9vlBDpcMI0XQehQe4iqWFivrjU4L+dTOZ1FAADcVVEm2rkYSmj/XkqMUYEiZb+c7ob01Q1lhmizIChg3PqdqdTQZtiyvY+dRW9oBUpJneYU0ljmGK3zjOb2gOHt6va6LzzWjaYeCq1PcBGDc39tN4q15LGObPTU6UycnP+y9PTJuuoMX5Ssr8/UmDiEsWtvVCyLOeOzywNv9TcgEc4IIVkzv/HJm9Xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(55016002)(9686003)(71200400001)(66556008)(8936002)(5660300002)(7696005)(7416002)(8676002)(478600001)(83380400001)(66574015)(316002)(2906002)(54906003)(26005)(33656002)(86362001)(6916009)(186003)(64756008)(4326008)(76116006)(52536014)(66476007)(53546011)(66446008)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?K3lQQjU5SlNIblMvUUxTeTA2Q3RvM1hjZXVSNk9nR0Jrb3VTT0xJWmZEbU9I?=
 =?utf-8?B?OS84NUxLWDU0d0U5NE1iNHhTbnYvRUJ4TStlZXU1WEtyZ2M1eVdxbWMxemZJ?=
 =?utf-8?B?VTBpdTJUVDRCM2FwdzdkVHl0TzJ0eEhIRXVJTms4cWpIdlZXZHd5dDJJeXA2?=
 =?utf-8?B?a2FyOU1zdS8rdnluUWxzL2VrS1JrTXV2RGhEc015eUNLa3hRVzRFM0NzZ2Y2?=
 =?utf-8?B?Z0VCMUtYYmg3OXUrY1ZxekRhaGlMMU1iNGt1by9GRVR5VVFQbU81di9OWEYz?=
 =?utf-8?B?QVhndG5wRWJ1Q1Z5Y0c4SFhvQ1FqNmcxdTNBd0xXSjdkRUlwZnRtQXBIL3U4?=
 =?utf-8?B?UFlwSTRZR09Mc2dIOWNna3Ryc092TGZtaFJDSzAzSEUweVl0bnpRTGxPRTJu?=
 =?utf-8?B?TnR4SVIycUZkUm9FUkVJQk1WK2Z5VXJXOFpvdSsrR1B3VWdGZDN5YUtLVkJQ?=
 =?utf-8?B?UXo3R2ZrUWU5UElraWI5THdYLzBOQTVqSzlCZVBXdVhLZ1dkTlBRRG1Mdjdl?=
 =?utf-8?B?NWE4em9uWFVvSHJ4Tnh5VVRaWGN0ZndXNFhQQzBEci9ZNXpBY202M2xEcVhC?=
 =?utf-8?B?b1hMbHc0SjdRS2xUemp3UEV3MncvWGZldGN1MnltVXY2N3FNYklWUS9HZlVo?=
 =?utf-8?B?alZnTG03S2s5YURLcU5qUzVlQVYzMDJwaFVIMHNxTHBMaTg2SGkydFo4aFNE?=
 =?utf-8?B?bEZXenF1elRuZzV3aCtxbmQ0UGhzMThOQklvTVhNUFRIejh4SmhEaldPSEJB?=
 =?utf-8?B?eXZORldRM2FSQW55N21KbTdHcnZrY2pqeW5rdTU3Njh5eFNLNk4wTXMzQWRO?=
 =?utf-8?B?b0ltMnhvTE5aNEdKcE5jQkZ4Y1JpdEdnUm1vSUhFYTVqOVZIbjQ5dmd1Ky9m?=
 =?utf-8?B?S2ljK2ZzMzRxUFJGcUo2NTcrMDd0N2RxR0JvWGN2ajRPWUVMaVJMd1VJU1ZE?=
 =?utf-8?B?aWN6bE9TcDRyVmtNdDdvS3htY2Fqd1ljejRoWVhpNEZkWkNVQ3JsWWVhZDlO?=
 =?utf-8?B?TWRaczhMWm1oQWJoOTJzQ0pod0NMY3ZJTW5PandZUDY5VDlXckdUV2J1N3lN?=
 =?utf-8?B?bUErNTVvTFo1U2VnZ2l1Sm9JeWgvQkdVWkdndm9zZ0ovWXJSNENja3pXZ082?=
 =?utf-8?B?ZlZ6MytxZ1RaRTVKWkRZZkFpcWI1Q3EwY0FFQjJzUU44TFJvb01xc0N4VmFE?=
 =?utf-8?B?NW5xRnhkYWgxQ2N0Q3lwUEZnRmtTWFVjV0N6NjZYWmI5U1BsR0VNWnB4KzBP?=
 =?utf-8?B?MnNic0kxL0pMd05ESUlYaFIxWHVzYVk2Y1YxYVFjYUJ2NU15NGgyNnpiTUgv?=
 =?utf-8?B?Z2xxbTk5UTdsclpWbG1jQWp6cHQ1MW1ubjZJdmZEQ1NCb2ZKbk9Dd2JGWVBU?=
 =?utf-8?B?MldTRmNyVEI5WXNNVHFWM201VGtaTDhyVXdGWi81eTNmOWZxdUFWOVd1OUZL?=
 =?utf-8?B?UjBVOHJmWmRCSUMyQVpDelRDNmxaUnFwVkE2WUtpd1p1bng2NTZJd21FenNr?=
 =?utf-8?B?dDFvWVUwNHJldTdCdnNkeGpQbysvVzBxVXlBMmpyUmE2Y0VtbDZXdlpqZ3Jp?=
 =?utf-8?B?Tkc0b2RMUWtCY1NnWEdUS2NpNGZzRVlZZE4xYVpjNDR1RTlXNzQ1M0IrTitk?=
 =?utf-8?B?OWVzQTNHK2t5ZnJxbG9Idktuak1vUmh1WVpCM3QxNEFUUXhkd09ldnhWdFdx?=
 =?utf-8?B?RHJ2SlJVaG5NMkd2cWR6OUsyVG94N09IVnpkZzdiRm9wcHl4OWtuRlVZZ0dL?=
 =?utf-8?Q?eVl6XDZGiARn/KMpNZJ75vC/CtT6YgTZxniS4yB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b60b60-55e4-478b-e074-08d8d2621967
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 10:03:24.6925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9nF4zibuINtosxBb/old8c4HcRttaRXc3KGI4uTww++k1xI8z81GHOwx/MUxCg9NnVjIxEbA4gPOmCKhWcKLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7536
Received-SPF: pass client-ip=40.107.101.54; envelope-from=saipava@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQWxpc3RhaXIsDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsaXN0
YWlyIEZyYW5jaXMgPGFsaXN0YWlyMjNAZ21haWwuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgRmVi
cnVhcnkgMTMsIDIwMjEgMzozOCBBTQ0KPiBUbzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhp
bGlueC5jb20+DQo+IENjOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBL
ZXZpbiBXb2xmDQo+IDxrd29sZkByZWRoYXQuY29tPjsgTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0
LmNvbT47IFZsYWRpbWlyIFNlbWVudHNvdi0NCj4gT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1
b3p6by5jb20+OyBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47DQo+IEpvZWwgU3Rhbmxl
eSA8am9lbEBqbXMuaWQuYXU+OyBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPjsgVmlu
Y2VudA0KPiBQYWxhdGluIDx2cGFsYXRpbkBjaHJvbWl1bS5vcmc+OyBEci4gRGF2aWQgQWxhbiBH
aWxiZXJ0DQo+IDxkZ2lsYmVydEByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhh
dC5jb20+OyBTdGVmYW4gSGFqbm9jemkNCj4gPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBQZXRlciBN
YXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBBbGlzdGFpcg0KPiBGcmFuY2lzIDxh
bGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5j
b20+OyBMdWMNCj4gTWljaGVsIDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+OyBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsNCj4gU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhp
bGlueC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcgRGV2ZWxvcGVycw0KPiA8cWVtdS1kZXZl
bEBub25nbnUub3JnPjsgUWVtdS1ibG9jayA8cWVtdS1ibG9ja0Bub25nbnUub3JnPg0KPiBTdWJq
ZWN0OiBSZTogW1JGQyBQQVRDSCAwOS8xNV0gc2Q6IGVtbWM6IEFkZCBzdXBwb3J0IGZvciBlbW1j
IGVyYXNlDQo+IA0KPiBPbiBUaHUsIEZlYiAxMSwgMjAyMSBhdCAxMjoxOSBBTSBTYWkgUGF2YW4g
Qm9kZHUNCj4gPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29tPiB3cm90ZToNCj4gPg0KPiA+IEFk
ZCBDTUQzNSBhbmQgQ01EMzYgd2hpY2ggc2V0cyB0aGUgZXJhc2Ugc3RhcnQgYW5kIGVuZC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBQYXZhbiBCb2RkdSA8c2FpLnBhdmFuLmJvZGR1QHhp
bGlueC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogRWRnYXIgRS4gSWdsZXNpYXMgPGVkZ2FyLmln
bGVzaWFzQHhpbGlueC5jb20+DQo+ID4gLS0tDQo+ID4gIGh3L3NkL3NkLmMgfCAyICsrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9o
dy9zZC9zZC5jIGIvaHcvc2Qvc2QuYw0KPiA+IGluZGV4IDIzNmYyYjguLjdhYWI2NDcgMTAwNjQ0
DQo+ID4gLS0tIGEvaHcvc2Qvc2QuYw0KPiA+ICsrKyBiL2h3L3NkL3NkLmMNCj4gPiBAQCAtMTU0
NCw2ICsxNTQ0LDcgQEAgc3RhdGljIHNkX3JzcF90eXBlX3Qgc2Rfbm9ybWFsX2NvbW1hbmQoU0RT
dGF0ZQ0KPiA+ICpzZCwgU0RSZXF1ZXN0IHJlcSkNCj4gPg0KPiA+ICAgICAgLyogRXJhc2UgY29t
bWFuZHMgKENsYXNzIDUpICovDQo+ID4gICAgICBjYXNlIDMyOiAgIC8qIENNRDMyOiAgRVJBU0Vf
V1JfQkxLX1NUQVJUICovDQo+ID4gKyAgICBjYXNlIDM1Og0KPiANCj4gQ2FuIHlvdSBjb21tZW50
IHRoZSBDTUQgaGVyZT8NCltTYWkgUGF2YW4gQm9kZHVdIFN1cmUgSSB3aWxsIHVwZGF0ZSB0aGlz
Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFuDQo+IA0KPiA+ICAgICAgICAgIHN3aXRjaCAoc2QtPnN0
YXRlKSB7DQo+ID4gICAgICAgICAgY2FzZSBzZF90cmFuc2Zlcl9zdGF0ZToNCj4gPiAgICAgICAg
ICAgICAgc2QtPmVyYXNlX3N0YXJ0ID0gcmVxLmFyZzsgQEAgLTE1NTUsNiArMTU1Niw3IEBAIHN0
YXRpYw0KPiA+IHNkX3JzcF90eXBlX3Qgc2Rfbm9ybWFsX2NvbW1hbmQoU0RTdGF0ZSAqc2QsIFNE
UmVxdWVzdCByZXEpDQo+ID4gICAgICAgICAgYnJlYWs7DQo+ID4NCj4gPiAgICAgIGNhc2UgMzM6
ICAgLyogQ01EMzM6ICBFUkFTRV9XUl9CTEtfRU5EICovDQo+ID4gKyAgICBjYXNlIDM2Og0KPiAN
Cj4gYW5kIGhlcmU/DQo+IA0KPiBBbGlzdGFpcg0KPiANCj4gPiAgICAgICAgICBzd2l0Y2ggKHNk
LT5zdGF0ZSkgew0KPiA+ICAgICAgICAgIGNhc2Ugc2RfdHJhbnNmZXJfc3RhdGU6DQo+ID4gICAg
ICAgICAgICAgIHNkLT5lcmFzZV9lbmQgPSByZXEuYXJnOw0KPiA+IC0tDQo+ID4gMi43LjQNCj4g
Pg0KPiA+DQo=

