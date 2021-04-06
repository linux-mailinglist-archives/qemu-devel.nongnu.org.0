Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705D355E4D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:00:00 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTtjr-0005oZ-Bp
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtiP-0005Mf-4T
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:58:29 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:20666)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtiN-0000fX-8j
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617746307; x=1649282307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCKdmhcxf/d5ExvuCtfH6tfuJhGv+MKpWoVvvfozpyw=;
 b=RWGQqiMUmkfTNgWqO0ig4NOQ0ad1pbfp0qfROK7A52uGEX53dKFaUNpq
 eb5zn27Vk0nynm2NpM+gix+0rBzqbYOubCElmww/CjTXkC7DBcZHHd2ex
 FyAJqokjwHHfY9PwKpIc6fj8Mmy6XmzqyVjddhNcOXYo+dvmLJ0saF0lD 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Apr 2021 14:58:25 -0700
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 14:58:24 -0700
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 14:58:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 14:58:24 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4549.namprd02.prod.outlook.com (2603:10b6:a03:15::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 21:58:21 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 21:58:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 16/21] Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
Thread-Topic: [PATCH v2 16/21] Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
Thread-Index: AQHXJqqezf4UNfkTQECCF2N07zbT1aqoBZgAgAAMjMA=
Date: Tue, 6 Apr 2021 21:58:21 +0000
Message-ID: <BYAPR02MB4886E7E5281B7B3C4B5F80F6DE769@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-17-git-send-email-tsimpson@quicinc.com>
 <97ee7d14-fdfb-30d8-0b75-42df768d35ef@linaro.org>
In-Reply-To: <97ee7d14-fdfb-30d8-0b75-42df768d35ef@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5b077a7-7d43-42c4-7eca-08d8f9471858
x-ms-traffictypediagnostic: BYAPR02MB4549:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4549901415237782BDB88144DE769@BYAPR02MB4549.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hku74stUxKb+Mr+7otX4+i/YQFmwJo/AuC+p084iHREysU5aZcuaElu2vEyVAp43qvmrVCeaVMCwud+KohnEuueep1kJNbYoRKcBWLJd8vVT5ihgftodBhXYB5H1h9a063r8B4QBuzmy+ABuJ7LITSmSVdROzsZBMUzQYTA3Kz8TYRk8rIFhk84BQJk14TfORRoiQUNuIDybeQayfacShXmCJUmSUPfKqCJFpKm+m2AV7sfZhhOMQ1kHHpFLdi45asn+lYb5iFpm129WopE/V8iIObU6NmpsvLmt/9qKthFj4XEVmkjTwxC0WQYd/CZAAkuKWpkqsEGTC2LDl2hOjBEZkAWnOxJcoVeDxGjgW2AGhU5q2+mBmOw5iYqhVbK4spyHu/LCmD7EVcAUdqDAIFEC7Zyh6H/auA7oznKV/CzlRXPIIw0WI+SKKleiMix9Sto9qnhGFlUJmDLphIFGmY5KKX3v97C5NAso6LH0DkdNBtFwNaUL8/E7FDjXY155fvFAUOj+hPAidP8PYNimb6YYuLzT1B/6hEMwiTotemJenH7VpN1mjkyb/D/iYTpZGSbY6hBuhA4rJH5TpC6vfB+gSIk9eSZ4PlHb4zt+MU8bA9mIGXNs6WQHXJkgGFP7cR9f3MPJR2r7k6PNP0z5DDdf+cHkEaKZLP7rLkbYjvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(6506007)(110136005)(316002)(53546011)(107886003)(52536014)(9686003)(54906003)(55016002)(186003)(8676002)(83380400001)(2906002)(8936002)(478600001)(4326008)(71200400001)(86362001)(33656002)(64756008)(66476007)(66446008)(66946007)(7696005)(76116006)(26005)(66556008)(5660300002)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VzQvVU5MbTNWOVdSdVFmaTQ5ak9Gdnp0MjFXZDIwVTZVSjVFUmlyckdHQitB?=
 =?utf-8?B?QVNGRytkSzY3ZVU0cnd2RnF5cmhQQkJZRVFtRDRYMmJQZDI1OEUvMjVzSGFk?=
 =?utf-8?B?MzZGWm5Iby8xdHVOSVNlQkh4bGtOcktWYnFtVlZQTjkyMjBzZG0zdDRBK1dY?=
 =?utf-8?B?T2dIb2lyMVo0K1pLM0RucjRsazh0RkVuVGhmcUd2WUJKR2h0UWlWKzJycWVy?=
 =?utf-8?B?Z2JzQ0txRVNQYlloTEMzZ0pPdEtYNFBkSlVHc3lONTJ0OTJ0ZktOSHZacGcv?=
 =?utf-8?B?MTEvWWdjTlEzM1Z1OVdyV2VScEVmdXRNR0VkT1ZXa2FWN3ZiZGtObi9VOGtE?=
 =?utf-8?B?S2oxRGtScm9CamZlZmdFVHI2b21CdTh0a2Uza001MmJYT1RqYTlsMURYUnlF?=
 =?utf-8?B?dXBzTWZSNmpHZ2NlV2NoWmJ2cWFmdFVQb1NuSjh4NjZidXVLMlFETUNGejhJ?=
 =?utf-8?B?MlM1ayt3dmFXaUYyZU1abThrSEtObWpoWjB0YW1lN0dtekZ4bFoxSXhwNFNM?=
 =?utf-8?B?dVY4bklwd0RSWUVBcmR3eU1BdnAxZW5jQkw2Q2xMVlFMVXQ4ZW9jZlZKZ0F0?=
 =?utf-8?B?ZzlFV0ZsNFlJV2JRa2p3Z2RSd3VDQWZ1Z3dZMHF5Sk5aZ05OU2NwLzJvMXFM?=
 =?utf-8?B?NUdISkdhQWp2SHNGUWxiNkM1UkxUMmVRVjNEYUZ0WTVhSFl2U1ZlL1FScUZH?=
 =?utf-8?B?MDIxdHpNMFp0MTZQZllFM0xRMXlDUERnV09lUjBUZzhhb3JSSzFzQUlOS3pv?=
 =?utf-8?B?UEN4WVZxaUpVRGlrUklqczhYTzVSMys1RzYwTmlqa09WK1JoMU5STmx5ZVdw?=
 =?utf-8?B?THJkNVkyYmNQcGE1Z0wxcXUwcnF0UEFIQnM0SmNEamtJcVQyMEE2TDhUQ1U2?=
 =?utf-8?B?Z084UFNqTStNZnc5eFBWWWJVSUhhSGtDemV1M0FvS3JaeC8wbUhRWlpxRmtu?=
 =?utf-8?B?TGh4UW8xY3pucTExMk1hclRBUnpDUENvSjV2S0dkOXFSbjk0dFZha3NRZjJ3?=
 =?utf-8?B?U0d4cTREaHlNeWpIeFROd21lcXFhaUEzMzVaT1V1T2hyMUpOZ2phUUZwMitT?=
 =?utf-8?B?NGdQVkxkL0RHeDFMTkE4TUY0VGJVZXZmK1NQeHRwa0NCOUZBMWJNU09TNVZy?=
 =?utf-8?B?VDdjQkxxR09lS0wvMHkxQTlXcEJxdDJ5UzU0NERnMk8waUNvb2Q3blM2aDNQ?=
 =?utf-8?B?bnlUTVdkNGc3a0w1ZmR3dzM0eHRvZkVwczI0aitYdGsrVXJ1VEhBZUxQaWNO?=
 =?utf-8?B?cXNFTWJxbklvcXphVzNFZWhmSitKTVcxVURPT1lwa0V2akVvZU9lWmx6dzlm?=
 =?utf-8?B?aVdtbUFvR2d3SDlLVFlGb28wYUlPRHVPZWdoYjlvWWtTMVNrY0tDMVpVY1ZE?=
 =?utf-8?B?Q3NlZEp6a3p5U3lTaUhXc3h0M2Y4eEptUjNpR1NoM3dDK2dadzlBR0pORmdV?=
 =?utf-8?B?aFExdWpaLzZTZVlEN1J3Z3BDRjdrcUZSa09YTlNESFVMTXJvTER5dXZiYk84?=
 =?utf-8?B?Y2hkMnlIanZUb3Z2d0I3dkR3YVozdDVqcHNMTFNvYzVTdlUwUnB0VjBkcDc2?=
 =?utf-8?B?eU5SMlVDR3lEalc2VmxQOFp0bHhoaDhUNDY0QndpaDJUd0IvMnhBYnlFVGhr?=
 =?utf-8?B?anBRcXpWMUxhSi81UVd6cU9XVk85RWRiZThxVDIrZjhwZWcyMU13b3FhMi8w?=
 =?utf-8?B?RHNWVDQrSDBiQk56QXNydFVFZktqeUFBaWFaRkp6aWI0M1NpM1NhRUJTd0NS?=
 =?utf-8?Q?GyYgKBnxL7TRX8lkdHUOAlhMkUfrjN5rd5Vgpwh?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRCB5FZUwXeSHHDgJNsa/iEVt1ITSJ6IZumj4iutF3pjHAJKG5wMUwqknf1TMehCWb6Sy8++d1ZCBhp6YHiHMySfxj3lcIbwSXQs8No7keqA+l2sgS+GLSZ/R3GJPzq+bG586EH5n1wi6qyZF06YBtYPLl7lG0eRtA/+mU+hPyRszAldCf+WaQWHndjyaHuQGW8pJL3rwP7Vz1ON/keH2ZPBXY8lYAaC6G/7ogM7Hwag8IDKPiUWC3LqUiiFtufH0H87pseW88CVwr2cD++oiQAsLt/OmuPhAeh3yMFYKY+3ui3yMQCLa0oIrw1mnN5e6Aa/53ee2thQUoykLqqmUQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CukGe+na238sutfAEfH58dBtADj/ioC/wQTEowx1+tw=;
 b=KSm7TFERXGZeNad4qVAbo8yAsUIlZ0iE+xNM5AGNYLVzXOJWHAEPP5Gt5toDTg+eRvjY2M9W/CFxHe9P62j3dDvLWzjQx2UNg8P507NIb4vB5ITgxxonBwU5PCm6+ezY5KANNfs88QPMu3D6Ec9XCLGjwER70OYQ8XvG7DCwbHliNoRsWQgx5na0FQcMhANEOU7c59Tpo1UvkT47pKG5CD7RyEV9na3Zp3c3wN4gaf58iT6FObmjy/3tqztjdEnRZCJe12fJfALJMQr9jMHU9a7I7fTanGRJzr+KvKdMdt4XcoS/QEPBtsNcKuFyKSJkElDV0rgDua2ONqIT+/KC7g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: e5b077a7-7d43-42c4-7eca-08d8f9471858
x-ms-exchange-crosstenant-originalarrivaltime: 06 Apr 2021 21:58:21.7313 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: gf28+ih8fv8r5SsIpB9QcjvtbVb4TVrNRTuFbBYdBx43cDYHm63nmLJT42qZ6wMtiMFUbcoJof0bchUPlji6tw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4549
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmls
IDYsIDIwMjEgNDoxMiBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsgYWxl
QHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTYvMjFdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBhZGQNCj4gQTRfYWRkcF9j
L0E0X3N1YnBfYw0KPg0KPiBPbiAzLzMxLzIxIDg6NTMgUE0sIFRheWxvciBTaW1wc29uIHdyb3Rl
Og0KPiA+ICsjZGVmaW5lIGZHRU5fVENHX0E0X2FkZHBfYyhTSE9SVENPREUpIFwNCj4gPiArICAg
IGRvIHsgXA0KPiA+ICsgICAgICAgIFRDR3ZfaTY0IGNhcnJ5ID0gdGNnX3RlbXBfbmV3X2k2NCgp
OyBcDQo+ID4gKyAgICAgICAgVENHdl9pNjQgemVybyA9IHRjZ19jb25zdF9pNjQoMCk7IFwNCj4g
PiArICAgICAgICB0Y2dfZ2VuX2V4dHVfaTMyX2k2NChjYXJyeSwgUHhWKTsgXA0KPiA+ICsgICAg
ICAgIHRjZ19nZW5fYW5kaV9pNjQoY2FycnksIGNhcnJ5LCAxKTsgXA0KPiA+ICsgICAgICAgIHRj
Z19nZW5fYWRkMl9pNjQoUmRkViwgY2FycnksIFJzc1YsIHplcm8sIGNhcnJ5LCB6ZXJvKTsgXA0K
PiA+ICsgICAgICAgIHRjZ19nZW5fYWRkMl9pNjQoUmRkViwgY2FycnksIFJkZFYsIGNhcnJ5LCBS
dHRWLCB6ZXJvKTsgXA0KPiA+ICsgICAgICAgIHRjZ19nZW5fZXh0cmxfaTY0X2kzMihQeFYsIGNh
cnJ5KTsgXA0KPg0KPiBOb3RlIHRoYXQgdGhpcyBpcyBhbHJlYWR5IGEgc2luZ2xlIGJpdCwgYWx3
YXlzLg0KDQpZZXMsIHdlIGp1c3QgbmVlZCBhbiBfaTMyIGluc3RlYWQgb2YgYW4gX2k2NC4NCg0K
PiA+ICtzdGF0aWMgVENHdiBnZW5fOGJpdHNvZihUQ0d2IHJlc3VsdCwgVENHdiB2YWx1ZSkNCj4g
PiArew0KPiA+ICsgICAgVENHdiB6ZXJvID0gdGNnX2NvbnN0X3RsKDApOw0KPiA+ICsgICAgVENH
diBvbmVzID0gdGNnX2NvbnN0X3RsKDB4ZmYpOw0KPiA+ICsgICAgdGNnX2dlbl9tb3Zjb25kX3Rs
KFRDR19DT05EX05FLCByZXN1bHQsIHZhbHVlLCB6ZXJvLCBvbmVzLCB6ZXJvKTsNCj4gPiArICAg
IHRjZ190ZW1wX2ZyZWUoemVybyk7DQo+ID4gKyAgICB0Y2dfdGVtcF9mcmVlKG9uZXMpOw0KPiA+
ICsNCj4gPiArICAgIHJldHVybiByZXN1bHQ7DQo+DQo+IFRoZXJlJ3MgbGl0dGxlIHBvaW50IGlu
IGEgY29uZGl0aW9uYWwgbW92ZS4NCj4gSnVzdCBtdWx0aXBseSBieSAweGZmLg0KPg0KPiBVbmxl
c3MgeW91IGhhZCBhbm90aGVyIG5vbi1ib29sZWFuIHVzZSBmb3IgZ2VuXzhiaXRzb2Y/DQoNClll
cywgdGhlcmUgYXJlIGluc3RhbmNlcyBvZiB0aGF0Lg0KDQo+IEFueXdheSwgSSBndWVzcyBpdCdz
IGFsbCBzYW5lLA0KPiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc+DQoNClRoYW5rcyENCg0KDQo=

