Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20432537AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:48:16 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveoh-0004h8-6g
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naoya.horiguchi@nec.com>)
 id 1nvXer-00037x-VX
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:09:38 -0400
Received: from mail-os0jpn01on20620.outbound.protection.outlook.com
 ([2a01:111:f403:700c::620]:42851
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naoya.horiguchi@nec.com>)
 id 1nvXep-0001yC-OI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:09:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc+ln6PL7bLmRtcnrljUTsyJcxuZZAEdLitT42KgPgu7mgTVHEW+1UNrLCyTeDwFTu6S+VYfHIQdb7ZXxhMP5Wi/QvcHqMNWsFiCMsvtFU34S4BcgP0xWKp3pbyDrPoenWzLF4r0om+7VwmlcGEl0mJhq+xZOI94Outnekmb/4bneTcHQ1PQt+uxtSpDqytqBkCzGDHnRD6FNsDtSkzy/sXat+ZsqjMLN3Ypy/w37Hk23DzY+u9JliySK/vFN9GNFTNmIcbcol6l/eHFKnSnvQPTDIeXSE4mRnFZiJBM0T8sASGYguDWSIttyWE21SOMhZs7r8C3snVjLG0pvNEw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UNZ6G3f40SLFeCSh2kMc5mT8kdqk9xVrvXcJYjxzLw=;
 b=QAiTdfCrbckLb5VraSSewsJiuUsDbiK3YRDAJCnbxvVVad/BH1yP8tFYpms90mmsQRyfv+kDCNjHSJk2pvZOfnk8RPMbn5ISt42BHnJL2+d/uPmbzdAnVyWBqb93a8Hh4rn2ES2yWaKT0M1HTKrcFxrGm+kA1FlRW52YallO5ANUF7aE0WJYnClXtQTyswNfe0g3olFBax+IGmZ1Qj1THa/S5+mLcz0/0Gsw89EjuH6wXVveAd79DJjrEvc/ZKuzmfnZjpwKjaP1b5mXcPGn5RgsJQ4T52bdtzpWgcg9Xf0IzISzPJLNNodUPrT+HIpBEBTixttnVIa82BhpExC1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UNZ6G3f40SLFeCSh2kMc5mT8kdqk9xVrvXcJYjxzLw=;
 b=b+Shm6dq6QAPlEJ01/1nRrKQx0zVh6E4vpftYIRG9lTRXOomSYHUhjFWlRAm8FPho58xK+3VHTk6jfIKMpgHNPLlPtfUhJQj8jiuDpm1S2a1NDI1ZV/GTXLt21grEkDfAmOJePBx7vvNsB8R/dfhltk+QDC9StEaI75DHAdCiKo=
Received: from TYWPR01MB8591.jpnprd01.prod.outlook.com (2603:1096:400:13c::10)
 by OSBPR01MB3301.jpnprd01.prod.outlook.com (2603:1096:604:2e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 05:09:30 +0000
Received: from TYWPR01MB8591.jpnprd01.prod.outlook.com
 ([fe80::246b:9355:73ad:b995]) by TYWPR01MB8591.jpnprd01.prod.outlook.com
 ([fe80::246b:9355:73ad:b995%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 05:09:30 +0000
From: =?utf-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPo+OAgOebtOS5nyk=?=
 <naoya.horiguchi@nec.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mst@redhat.com"
 <mst@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/3] memory-failure: Introduce memory failure notifier
Thread-Topic: [PATCH 1/3] memory-failure: Introduce memory failure notifier
Thread-Index: AQHYbBjLKPskpwTuSEOz7qzOATgGQK027q+A
Date: Mon, 30 May 2022 05:09:30 +0000
Message-ID: <20220530050929.GA1041165@hori.linux.bs1.fc.nec.co.jp>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-2-pizhenwei@bytedance.com>
In-Reply-To: <20220520070648.1794132-2-pizhenwei@bytedance.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40d2f815-3343-4d00-4d14-08da41fa93d1
x-ms-traffictypediagnostic: OSBPR01MB3301:EE_
x-microsoft-antispam-prvs: <OSBPR01MB3301751E222BB1F13DCAA624E7DD9@OSBPR01MB3301.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QndV2KH55UGBgTyhwfVI25i8OFwGFAumfOnVmEBfAeySi9Qjlv37Y4+sZt/H5mT8aLJsoMdogAmXIUFX6Q1qsISJKIkbqhOerLEWOV2N3t4Ow6Ux4PlsEyos8+KNSsHNSoEvK9zS638N4rCKquTydjx0X4o65njh/bP2QNgy+/DSk51QCY//eRMYut7nuWo3k21q5HN3xvK7Sn4c8Ud8JPwFriOtca0Cwb2yGMtMlTvOzPoZya0XpUqVwe0Oa7x/RjyEs+x70A7t4kSgN4+whA7Iq7i9L4f6VxY3DB3At4Dpa0Ej+b9O8eOz7iQdx9TrrwB72gN+ouJY0jyp9gJFYKpBr9YzfGgCv30fEXsh7NE13f6KPGRvLoQB+5mIhmIpkinRCCWS6Olsd6Iav1vURNj8B/S+4fTAupkqDlFc14hdzqsyU5AGyLcRA7yEst35N+005t+AlFRfMTU2Yts/hfuphoxBuqvoGFovYd5Vy7u7Az2W5jHvEl/jVyeKP3fTFz/9BOruJQ108WVZrPCvddaay1fVlUW5EiMxnz8CkgDm8GAUoCC5nvQhj1vLt+XqJt0V5vMerE8V0PedfpuCNNOh7lwULcLOKN1xMqZ6z/9mOtMxgXYy+cKgq0W1b5U5s3c/9FCai2no0/ysG4796WvGKIIbr+lOY2PmbGQE0PgXC4Fj5/whXuisxBV/rPXpf864LkBNc0xgL3ZYoMFYFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB8591.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(66446008)(4326008)(4744005)(8676002)(66556008)(66946007)(66476007)(122000001)(76116006)(86362001)(1076003)(38100700002)(38070700005)(54906003)(6916009)(83380400001)(33656002)(85182001)(82960400001)(316002)(71200400001)(5660300002)(6512007)(55236004)(6506007)(508600001)(186003)(26005)(7416002)(6486002)(2906002)(9686003)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXBrbmxLS2liSGU2MVcxejNqVklaUDg5R3ZTYjdLR3FKQ0FyQmE1QmxPSXdn?=
 =?utf-8?B?VHdSbHpzNzlHYUFURUpEd2lEdGFYU25qYUlyNU1RNmVTS2Q1NmZ0TjRXZFoz?=
 =?utf-8?B?SmU0cjJIVVUxTnlZanZqa0JIRCtOdTc2OHVGT1U4NXpyREp5TE4rdFhuMjdK?=
 =?utf-8?B?T0hTeWZmN0lTaGNpU2VSc0dFd0M4RjhPQnY1M3p3Nmo2OXZYZkd6b1NFTmhZ?=
 =?utf-8?B?bVU1RkhyWTJ3ZHJldUJFUmJBR0RqNkg2YXJ0RnBxTzM4SktQSTlBd2tVR3Fv?=
 =?utf-8?B?RlZBMnhmTEFSS1o1eEE1TXovZGdHSWI0THd6a3p3QjJpK01pQXFoc2xjZDN1?=
 =?utf-8?B?VGwyL0FBWHgzYzB4Q21RSjVVQmltRVgvbXdkdFVEZGQxMnozNXByRFNCOVBD?=
 =?utf-8?B?blJyNEpBWHQyTGxJcm53ZitWZ1lmU2JSTXpGZ0dnUytFcGIwNTBQU1FCRG4r?=
 =?utf-8?B?RzE2ajE3S3NOQUZrelIyVUFEM1pmdUd0N0xpZlVoZWpNZ2JyY3N2K3pMbFFN?=
 =?utf-8?B?N1l5UDVkNDh2MkxWa1FmdytmeHl3c2xRMDJGM2xuZml6VU54aGRjUm1QWUxo?=
 =?utf-8?B?bzBWeVJXWVY0U3hzM2NOTnNaeU40RGZlQXBYdXlDWHl0WDlrOStlOWdXSUMw?=
 =?utf-8?B?c1paRXovQnpsVGMxQW96TS9uMWZDUVo4eFVnb2xzalIxYnJsYlgxUUFXVnU1?=
 =?utf-8?B?ZWc1YnQ1Z3N6UU9SUklFRENlcnp1cytLMDk2M3JWNFNQRXoxK3FYeHd2bUhF?=
 =?utf-8?B?MVhreHZMNWxsV0tBa0orRTlhQmRoWjJ2TFFKOVNTdE56c3VSNnJOMVBtZU9t?=
 =?utf-8?B?YmpyN3VDWkxBNFhzMFlhUm50ellCTzlRdlZvcjRxK3M1aFpoQmw1SG92eFNP?=
 =?utf-8?B?MGhZdXppeHJGczVTdzFFRkdKN2NmN3RndGpLYUp2Y3lnVlhDVzdaNk9NRTJa?=
 =?utf-8?B?YlpzbFpqQTVFZWtiRnBGYWpZK2N3OVAvY0xMSUFncjVGMkJid0d4czdXdTBZ?=
 =?utf-8?B?V2JxZmM5RUZkNVp1V2VENXNkdVpzSU96M1piVmFqUU1BbUJORTVYWjlGZ213?=
 =?utf-8?B?RWxjbS9ZTXJ4dGx3ajc4S3ZKaUVLZkUxMmlmNzAwR2w1MW8xdW1wS3BwNTVo?=
 =?utf-8?B?ZU9NVXF4U1JIeGlOcU42U1JTV1hlYXdrOXA5Z3E5UnBJbWxtN0M3OWVKQThx?=
 =?utf-8?B?Y2xWRDM1aW5CdDhYOXhhNUp0SGZSUVYxMlRCT1FXMXdzY1pqMjI5enlYWEVk?=
 =?utf-8?B?SjBZRGlXN3I5NkdvZ0NVdnY4YjBQZDIrdUVTbUNyTnR2YXRlaFg0bkZkeHh1?=
 =?utf-8?B?MG9QYndaQ3R0UE5NandPMGNHc3RhK01oaFlNeTRBaVZNSk5BSlZvcEhuNXd2?=
 =?utf-8?B?Q2syZytoaWd0WmZqbDYyUVBjdS9QakJGbHZ0UGxxZTc2SmxDTmw3RktkenIr?=
 =?utf-8?B?TmNsMzNXNkdLWTJoWU1sTVYyZC9EL3IwZGl3bkNPZlVTUlJBaVpUTGduUDFD?=
 =?utf-8?B?Y0pQSWdIYXRZWGNGWjByMUs2RXlyeTRMWUgxSVRjb1JQQnl1VmRRSG9OMzJU?=
 =?utf-8?B?RzdjSTRkM21tRHQ4dVNGWDFGb0Z1V29peHgzT1NxWURCMWtpRGx1eG1MeldP?=
 =?utf-8?B?dy9Jbld4NmlmcHNkVGMvZHpYOGFwdGkwdEhWSDFSanU5VGhBWGdrTncwRk9J?=
 =?utf-8?B?T1Z1V3RGWThHdVhyRjFGanV0UlV1M2JrdGd3d041QXpobVZrRldoRnJ4MHJy?=
 =?utf-8?B?UUpSMWtDWnRFMWs4SG8zZTk1c0lGUVU3ZC9OM2plY0RMMUE0ek93NmlnbTlB?=
 =?utf-8?B?R21JM2g3Umg3ZS9hSkRQenlPaEZWN0lkaFUrVDc2Z1lsS211Wks4UnNqYUgv?=
 =?utf-8?B?eENHZm0yK1RCd3huSU4zU3RiVUI0bWNIN2NRSUhKbnRqMVZPUm1GZDBYaHJV?=
 =?utf-8?B?Z1dYZHJPeHhmSGpSOXVCRmhaRzl4RFEweXBqVmpkWHdCUkhKNSsveHpWYTV1?=
 =?utf-8?B?NWFPdDFFcHZ1a1MrdmZ0d24vZ28vS1RDRm9XRWpFKzdUc1l0SFo1dDM4ZEwv?=
 =?utf-8?B?WEhlNmx2dTNoUXZnWHhORG1VdndMNExxVjdtWUhGd3BGYjIwME1TS3EyVFdp?=
 =?utf-8?B?N3NqMWtrbXV5am9GSmlHc3piSktkRnFCa1NvM09XdXdjektTQ3lMb2tuTzBs?=
 =?utf-8?B?WXd0UFh3RHIvWC9nSmxvSktwZnJuN3FNUXpvWEZEYmVSdEV1anE1UHg4ck45?=
 =?utf-8?B?Q2xIQlplM3BPMVZhRmJrZjhzdXYrYUVRN1BQbDZQdTdhQmNzd1greFZ6cWNC?=
 =?utf-8?B?TDI1dHM2c3d2M21CVDRzeVlUWjRIUUplMDFPcGo4MXdPdW5vQ1B4UWRYZUxW?=
 =?utf-8?Q?xbZPH7vJ4uITuKp0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42407080741B6B418A998319215F3349@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8591.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d2f815-3343-4d00-4d14-08da41fa93d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 05:09:30.3474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbJQ+4GOF8oVrVbAOu04R9uMNqOucGjHZG9CWJTVFVPhPKwCMID4qwouLyGdAKOumO+CsJ1GdoSF3pcZ34KSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3301
Received-SPF: pass client-ip=2a01:111:f403:700c::620;
 envelope-from=naoya.horiguchi@nec.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 May 2022 08:44:22 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpLCBNYXkgMjAsIDIwMjIgYXQgMDM6MDY6NDZQTSArMDgwMCwgemhlbndlaSBwaSB3cm90
ZToNCj4gSW50cm9kdWNlIG1lbW9yeSBmYWlsdXJlIG5vdGlmaWVyLCBvbmNlIGhhcmR3YXJlIG1l
bW9yeSBmYWlsdXJlDQo+IG9jY3VycywgYWZ0ZXIgdGhlIGtlcm5lbCBoYW5kbGVzIHRoZSBjb3Jy
dXB0ZWQgcGFnZSBzdWNjZXNzZnVsbHksDQo+IHNvbWVvbmUgd2hvIHJlZ2lzdGVyZWQgdGhpcyBj
aGFpbiBnZXRzIG5vdGljZWQgb2YgdGhlIGNvcnJ1cHRlZCBQRk4uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiB6aGVud2VpIHBpIDxwaXpoZW53ZWlAYnl0ZWRhbmNlLmNvbT4NCg0KLi4uDQo+IEBAIC0x
MTM2LDYgKzExNjUsMTAgQEAgc3RhdGljIHZvaWQgYWN0aW9uX3Jlc3VsdCh1bnNpZ25lZCBsb25n
IHBmbiwgZW51bSBtZl9hY3Rpb25fcGFnZV90eXBlIHR5cGUsDQo+ICAJbnVtX3BvaXNvbmVkX3Bh
Z2VzX2luYygpOw0KPiAgCXByX2VycigiTWVtb3J5IGZhaWx1cmU6ICUjbHg6IHJlY292ZXJ5IGFj
dGlvbiBmb3IgJXM6ICVzXG4iLA0KPiAgCQlwZm4sIGFjdGlvbl9wYWdlX3R5cGVzW3R5cGVdLCBh
Y3Rpb25fbmFtZVtyZXN1bHRdKTsNCj4gKw0KPiArCS8qIG5vdGlmeSB0aGUgY2hhaW4gaWYgd2Ug
aGFuZGxlIHN1Y2Nlc3NmdWxseSBvbmx5ICovDQoNClRoaXMgY29tbWVudCBsb29rcyBzb21ld2hh
dCBvYnZpb3VzIGZyb20gdGhlIGNvZGUsIG1heWJlIGl0J3MgZ3JlYXRlcg0KdG8gY29tbWVudCBh
Ym91dCAid2h5IiBvciB0aGUgaW50ZW50aW9uLg0KDQpUaGFua3MsDQpOYW95YSBIb3JpZ3VjaGkN
Cg0KPiArCWlmIChyZXN1bHQgPT0gTUZfUkVDT1ZFUkVEKQ0KPiArCQlibG9ja2luZ19ub3RpZmll
cl9jYWxsX2NoYWluKCZtZl9ub3RpZmllcl9saXN0LCBwZm4sIE5VTEwpOw0KPiAgfQ0KPiAgDQo+
ICBzdGF0aWMgaW50IHBhZ2VfYWN0aW9uKHN0cnVjdCBwYWdlX3N0YXRlICpwcywgc3RydWN0IHBh
Z2UgKnAsDQo+IC0tIA0KPiAyLjIwLjE=

