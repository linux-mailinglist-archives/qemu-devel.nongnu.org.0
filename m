Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771902F219C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 22:17:08 +0100 (CET)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz4Yl-00055B-9D
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 16:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kz4Wn-0004Gq-67
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:15:05 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:59412)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kz4Wj-0007GV-AN
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610399701; x=1641935701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zihF/U7tukQkmg5AjPxsHIKbsFa09rAJchfIlRotjMg=;
 b=EXZYO42gze505XBILMT0w2t+ShzqqdMMO2MV8U3S2IuT6u+d+qilyypo
 M3KSoYaOi3DkIIoSi5aYFeMi4nj6WWz09v7E94n7hZeUqvjAYixpEilnG
 CZg22JXmBqYQsjubkD4yxHJTVziPak3VMaNljrs4zO8VG2l6oIoa9zDH0 Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Jan 2021 13:14:58 -0800
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jan 2021 13:14:57 -0800
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 13:14:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 11 Jan 2021 13:14:57 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6964.namprd02.prod.outlook.com (2603:10b6:a03:23a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 21:14:55 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 21:14:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 05/35] Hexagon (disas) disassembler
Thread-Topic: [PATCH v6 05/35] Hexagon (disas) disassembler
Thread-Index: AQHW5Xbc46S7hFt/yECgtSyuriwt+Kof1G8AgAMbezA=
Date: Mon, 11 Jan 2021 21:14:55 +0000
Message-ID: <BYAPR02MB48868E6F215E4C1315543246DEAB0@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
 <6da5929b-1c66-1e08-7998-1823aa716c60@amsat.org>
In-Reply-To: <6da5929b-1c66-1e08-7998-1823aa716c60@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1f366ad-23bb-4b5a-6fbf-08d8b675f19b
x-ms-traffictypediagnostic: BY5PR02MB6964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB69641931915821D8B68103F9DEAB0@BY5PR02MB6964.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UL9cZWYQQWXlt5SrOH2R8gS/HF5/P/8C823LwEJcxLzdZTkz0pnlIeJNGM1SD4EDLV/MMzCEme/JmKXIK2kduLG5duIYMcVFwIXXu6lohl0EamVC4N0JwOxbMN/oNjuyQx1VNrSXG7DL0gye+rIaOpyNhUClSjaYJ4jb6Rd/yHRYtrCYYlVbF8GtXoUpgu3HNjgc66La9xZ/IDFb3PGvOLC7ZcUM31NlbYyaUj+h0ifBDyScfKM8JkxSgnHDJ3av6y8hR8C0Yj/QansLx61775EMJH4qjdHpZIhZTK8Efoz9djD5Bx13S2A/oEwsYfLDN+4u14LGZB0XYgA8vLMMzjDTU0KIBWDUjlhhiz2Ll6s9n74BmWTmm1GGT44lg4qtH1dUHbF1eWXjcMI6cNMzKPkyXc6X6a6KkfCKZhFIrCs06kTdbsCtWchmzRHMOb5AveBUE5tdAA38Hl7q/MeuXEV3cO8lzU5GhKD6ZpjkaUSHAVSfBtlZDeJhlW9PUrfSj060rUhSfy4ObiYgGh5EfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(7696005)(5660300002)(55016002)(478600001)(316002)(110136005)(33656002)(52536014)(66556008)(186003)(53546011)(66476007)(54906003)(64756008)(6506007)(66446008)(71200400001)(86362001)(8676002)(8936002)(26005)(66946007)(9686003)(76116006)(2906002)(83380400001)(4326008)(2004002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZGNuQ3JHTnVGblV2R3NCcXF6MUxBTWNFRllnTURYYXcwZTUzcjA4N0tXMWNj?=
 =?utf-8?B?OVI3NHc2QjU4YStEcGVOa3NCOTFzSGRFUU1EU3lzM3FRcjZMb2R0dnlSano4?=
 =?utf-8?B?dFdMcDdmRlpYNlFQY1hnY1FpN2dtbk5ZODdZUEpUNjJyT0RpSHpqTWlYUFAz?=
 =?utf-8?B?bDdOelBYZlBycC9nSng2TlNudEVvZnNiZzlEeFlWaGJyTHdTTkFmdXVnL0Rk?=
 =?utf-8?B?a2dBUitnT2I5d0VtM1hHNk1sYk5qZXRiKzhERGM4ays0LzB4SjZJRFZJeGE0?=
 =?utf-8?B?MjJta2NtdjdXT2RYVEJqbnFWMFdvZk9abmlTNUV2c215bk9HbTZ0bXFrd1FT?=
 =?utf-8?B?VkhVMUozaWtqMGJvcXhVcXdYVzhnQWM1dWdOdU5jbEpJWHFoeWFkM3c1Qzcz?=
 =?utf-8?B?c1E3YVlzVWpjNEZuRWRVelBubEdGZXNkb3BwZ3Q2TTR0TTZUcTJKelpQV21R?=
 =?utf-8?B?bUI5OU5xak9PcTV2Z3RnbWJGTUM2bmFWbEFJRDZIUFRGcnFqQUpmc2NRWk9k?=
 =?utf-8?B?M052YzZTOW5HZWRhK3lwN3VBc2MvM1huMkFYamFsTURBR2JERm9WWFBjL3Iw?=
 =?utf-8?B?R05McXYzMk8xZDFUWXpzWVF1a2NZazNJbGJ3YVk3dWpHNGhOaUxTMHpWY2xR?=
 =?utf-8?B?VktjazhrN2tlZkFCWWk5MTNnOWhzQ3JMdnJWM1A1UVMyT2JIdXROM0ZCcGNY?=
 =?utf-8?B?RUdxMkFYb1crWDgzT2pFMkNad3YzdkIxUW5TWHRlNzdUMVpGdXU4ZEJta2tk?=
 =?utf-8?B?bzEvYmhDVXBYWTYvZjZaQXY4YXM5aFVNSWFyWkZQV2hwcUdKMTNIdlNUYm5U?=
 =?utf-8?B?cDREYk9sTHpwWHZzd1hIV1hiaFh6UnZYRGxaNDI0c0hTOHdtVHpUZFZ1bXpj?=
 =?utf-8?B?bFYyN2NQcGFpSHJPTjF6eElGVnBQZG1SaVhRbm9acVFBZ3AySlZOMjk2d1I2?=
 =?utf-8?B?YnFXVDdzK2tiSGNJZERsK3UyQWJIVGlzUURBM3ZUSk8xWEJEWFQ5TW9iSFJj?=
 =?utf-8?B?NW8waEdZS1Vjakh6THRaZHBMLzRndkRpd0V6Z295UWpDc3NOYnJaYktuN0FS?=
 =?utf-8?B?Wmc4Y3pZWXJsMEdqb0xTc2g4cEpPM1IzNkQ2SmJoOG9mS2U3Wm8zQjFwTU9Q?=
 =?utf-8?B?VmpkNUF1TUVzbkF4S0gybzZFZUE3ZjAxVVhualNVOGRCZTFNWFNWUzdHYkVQ?=
 =?utf-8?B?UnR4LzZSbUYzYXM0YjM5d1pDeCs2VmVUSU1SWTRsYTBpajVCNk5USGFmUmVM?=
 =?utf-8?B?S2pzc0tXOHNicjZSUDRnQkFSa3RPb2tKcXVJS1o2TGxjSkNJYU1LcGU2aUNv?=
 =?utf-8?Q?39XYX3hcc/l4A=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVUTne5eiKJgnL4KvA6LSq41gNlXN4uGFzlS69ESCADUL/uhu/BQ24/KluTNMXajIPyZRcN0pS3rBYyMQv1VV9OVgFZ2pIfn4/dNn5vyR9shQrA/rQjYj7bC+4mtjLSxMdQavyEaLWlqVIAYArg20QtbkjFI25Lwo08qrtQ1bKDNiE4SgspTAlLlCNmG4Kt6/E0Z4MWVVg2nYnRYrIgNmju94bi1Lg+f15XYs69S0obqplu6HwGEWWFkZuqJpw8kp1c/alqLITdfUpdLkylWs7xe0Fej0BZWBwWQ0HtQdck/65PY/9buLJe+DCN8DYZBN5YDxxuZDXRtcz2oiU6sgg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma8UmykxPKOSO6l2tz/31pnVokZPvaWORiuEikMgWLk=;
 b=G8QMEtB2oRZijxyHuGwEALxj3mwS49KJUa/jgaLIDwFrjxMu5pJtYZ72j2NGCdiLICvYAWcUoj2RJpwAU7mlqlxDS4GKa6mFk00R6+aAO6gqS2jB+DsY0vf2Igixf/ko11wm0AMm1tNjmVsKh5SDS8NVTazKPgTsNSNfbuUjF8/Xv1NSMAkSF4qXAJLcbSb20hZoSCLrCVwdkGNdFR48mr/+B6y732tKf3I80fyi2YCEP9vyB8flsIfQemvSBZgys+SgUfcCpqkdiEBuNjZBFe8LA8c8CYlbNbwrmAO803MwfeqAtkeN1ofw2K3+NgjrUo5ZM7u2m87Hz7odkvOOfg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma8UmykxPKOSO6l2tz/31pnVokZPvaWORiuEikMgWLk=;
 b=plMo9RYnbGR8KIEN5Z+yBFS5Oq4V8Pnt3yHQ9Zm+aYUVGCfBS7nlIU7h8pBols+g3Z8kfFhgVCnx5NAwbpcn180MHb1ZcOxU/pDaJCdhJvw/nXtRTXrDTKt1jySibOwsdQC7bm6iyD2YF0NITWEM7sOW3wBKw9ULLczUNbkQuQQ=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: d1f366ad-23bb-4b5a-6fbf-08d8b675f19b
x-ms-exchange-crosstenant-originalarrivaltime: 11 Jan 2021 21:14:55.2850 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: r8P5pSWHnS+BgPibEAyk7qO4nNVaDkLzWlBfHS3oidyBFailbIAs++3IXK0v643rb+vc13Iscxf7ulREwdG4Cw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6964
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWVtdS1kZXZlbCA8cWVt
dS1kZXZlbC0NCj4gYm91bmNlcyt0c2ltcHNvbj1xdWljaW5jLmNvbUBub25nbnUub3JnPiBPbiBC
ZWhhbGYgT2YgUGhpbGlwcGUNCj4gTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU2F0dXJkYXksIEph
bnVhcnkgOSwgMjAyMSAzOjM4IFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IEJyaWFu
IENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsNCj4gcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZzsgbGF1cmVudEB2aXZpZXIuZXUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8zNV0gSGV4
YWdvbiAoZGlzYXMpIGRpc2Fzc2VtYmxlcg0KPg0KPiBIaSBUYXlsb3IsDQo+DQo+IE9uIDEvOC8y
MSA1OjI4IEFNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiArLyoNCj4gPiArICogIENvcHly
aWdodChjKSAyMDE5LTIwMjAgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJp
Z2h0cw0KPiBSZXNlcnZlZC4NCj4NCj4gMjAxOS0yMDIxIDopDQo+DQo+ID4gKyAqDQo+ID4gKyAq
ICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yIG1vZGlmeQ0KPiA+ICsgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCj4gPiArICogIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+
ID4gKyAqICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KPiA+ICsgKg0KPiA+
ICsgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2ls
bCBiZSB1c2VmdWwsDQo+ID4gKyAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiA+ICsgKiAgTUVSQ0hBTlRBQklMSVRZIG9y
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KPiA+ICsgKiAgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiAr
ICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlDQo+ID4gKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBz
ZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPg0KPiBJZiBwb3NzaWJsZSBwbGVh
c2UgYWxzbyBpbmNsdWRlIHRoZSBTUERYIGlkZW50aWZpZXIgKG9yIHNpbXBseSBpdCk6DQo+DQo+
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQoNCkknbGwgY29uZmly
bSB3aXRoIG91ciBsZWdhbCBkZXBhcnRtZW50LiAgV2hpY2ggaXMgcHJlZmVycmVkIC0gdGhlIGlk
ZW50aWZpZXIgYWxvbmUgb3IgdGhlIHRleHQgYW5kIHRoZSBpZGVudGlmaWVyPw0K

