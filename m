Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37531F347
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:16:55 +0100 (CET)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtTZ-0005E9-Tu
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lCtSR-0004ek-Ri
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:15:44 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:48741)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lCtSO-0000dD-J4
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1613693740; x=1645229740;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=dwRIgikvqxXlhVCtC04fZeoenxjyUacbKCvPu3CK78c=;
 b=IpSIPFhKAo17HwEZuyYnkSL6Kijl1nDe09muO8QuQeKoirO+cfjNdQMW
 l7k4gnmuMrw9VGdj/7fr6i2lzeua09lUtL0HpTsXLRA2Sk3Yqxv82yiTs
 82gWXWGzB+b9QIDbVu/yxecdGarFTTYHcYuMjjabXfriE7ZSWEDdHgOJ1 0=;
Subject: RE: hexagon sysemu - library loading path feature
Thread-Topic: hexagon sysemu - library loading path feature
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Feb 2021 16:15:36 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Feb 2021 16:15:36 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 16:15:35 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 18 Feb 2021 16:15:35 -0800
Received: from DM6PR02MB4201.namprd02.prod.outlook.com (2603:10b6:5:98::10) by
 DM6PR02MB5084.namprd02.prod.outlook.com (2603:10b6:5:46::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Fri, 19 Feb 2021 00:15:34 +0000
Received: from DM6PR02MB4201.namprd02.prod.outlook.com
 ([fe80::4912:65f3:5b99:551c]) by DM6PR02MB4201.namprd02.prod.outlook.com
 ([fe80::4912:65f3:5b99:551c%7]) with mapi id 15.20.3846.027; Fri, 19 Feb 2021
 00:15:34 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Thread-Index: AdbTNi4vj0rhn2a/S826SggvjRM06gdsCOkABNvDZIAAf6H7YA==
Date: Fri, 19 Feb 2021 00:15:34 +0000
Message-ID: <DM6PR02MB42018D614393ED046F2F1471B8849@DM6PR02MB4201.namprd02.prod.outlook.com>
References: <SN6PR02MB420590EF08DD9FFA5DC81EB6B8C60@SN6PR02MB4205.namprd02.prod.outlook.com>
 <68c3529b-9710-0d78-13eb-608ff2ed2c2f@amsat.org> <87lfbotfu7.fsf@linaro.org>
In-Reply-To: <87lfbotfu7.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [199.106.103.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa2b852-e27e-41f5-e7bd-08d8d46b7a0e
x-ms-traffictypediagnostic: DM6PR02MB5084:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB50843BA85DBD10497ADAA80CB8849@DM6PR02MB5084.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ma9lPFcVRPqdKvY1qzD5zKtpxz0MIZa64dSC+oSfFU6speTC5h/3k7KfTDWTjShg0ovl2IyjebFc0a8yvIgWSNW1t5idGhzprnvTK9f6RjAx8U0OlzVwltVme7tXNQb7//r45wCQx7GtUmTF8JqXlMeA+RF8nwcu92s9L1cKM9Jp409ks7LPBIdhFC5gcwpQy/rAbCXFVnbOfLi0VoMFs9agraaKh2VeVuh8Npj8kQ7aiWgRZKlVK0jch1D2NkY+Gnkm1g0ts3tSBS54j4UYm6ya9ixg0UZyHU4SJv+oSqg4E/4z1bbbLQs6n492vrHl1d3WVKcvKjlBacaH/Yd2wLa4seIc2gyvAIA7pr3JxE0qBHK8d7deZTg1VTzLLkAmSY+12Q1W0buEwdO4uSW3IAzDer0fUUc1GSAcAp3eiAvu7kSAwPYfWV8mnHPyLgavb3El9AdWdVcfjzIMZoQgaquH9GOzXx4s0qizlq/78hTOw8MOCxZ2nagWkwIJsstYV3l4fnFYTIRtIfFb0Q7JhA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4201.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(316002)(110136005)(5660300002)(54906003)(76116006)(66574015)(66946007)(66446008)(66556008)(64756008)(186003)(66476007)(55016002)(52536014)(33656002)(478600001)(53546011)(2906002)(8936002)(6506007)(86362001)(7696005)(4326008)(107886003)(8676002)(71200400001)(26005)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkhHQk9rL1FuREI0c09wV0V5UUpNcEJLSTg4YzNLUjhCd0VaSVRxNkxDYzI5?=
 =?utf-8?B?VEFmN09BS3NhMVhrcGlScjVRdmY4SDZSNjJma1FoVjJOSVNVdXhIWVhZWnhZ?=
 =?utf-8?B?VXNwTVQ0dHRBSzFWVzNaSVZMMFdMMVlua25PMVNVTFpIbDZ4b0Z1Y003RjFr?=
 =?utf-8?B?YVl4MkFMUnJ3TDlvNEg0RmwzUFJ5ZlUySW1nQTNldjN1Tk5TZkRHQlVJamlR?=
 =?utf-8?B?WWNRZW5MNUFsMEt1TU56a0JOZmJCUnIzSkNkMUFUbG9DU2VUSG1TVFlDU0Nq?=
 =?utf-8?B?WmgzNXBBREtSL2xUTHJ3UjJqZGxSc0xWcXl2bTFpRmxyNGpTaHJtT3NzN0JS?=
 =?utf-8?B?cmtFZDVaeEQ5eFFGV3ZCNlNMYzJ1dTF1dzlmdStFeWljUm16SGRtWWtBYUpO?=
 =?utf-8?B?ZGg3VTVJOTlOWE9mbm5TdHdVRVd4Z2hlMjJRWnI4cE5XOXJrSkdUVyt4bjY5?=
 =?utf-8?B?VU9GRkVLWUJuOTFPNlNDVW9RcXkzbU9Ebjg1cVl0WlB3S1BCZ0ZOdW1sWFJk?=
 =?utf-8?B?Z1RFNVZZbXdQNDh3UERkSzJOT2VsSmtxdzdZVlJQRUI4MnQ2TUVZUWtlMlFF?=
 =?utf-8?B?Y0hZMVZPZTdHVFNjT0hjeGVpWWs4U3J0WUIvZmk5ZkFrTkFCZE9tSnViK2U4?=
 =?utf-8?B?aHgwYjkxM2hLUFhlbUFtc3JIbTA1b0crU1pxcXk5dVlna1ZvOXV5eldVbFln?=
 =?utf-8?B?bStqT3V4ZGNMSUpOSCtkZHpldURBWVhQUExvdjZpQlVGeFhKRjJqWTFCQUZr?=
 =?utf-8?B?TWx0alJQWVUrbnY1K09UTHZpZDhkQkVLT3lrMmRvZlp4ZlZVQSttZDhES0FR?=
 =?utf-8?B?OXlKdUMyNmRJT1hpckpxZVlERUJ3cWxqY2h4VkxPSUZ3b0EyRUIxQ1c4Z1Zx?=
 =?utf-8?B?dEwzdjl1elZxdjdsaWtGOW5ZYmhKcUpxTVo5Q0RnYVJ0K3BmNVpCcW9DSXZG?=
 =?utf-8?B?YkpJL3FQRFp4SU92QllUNWJuQjN0bjV1YXVsK3RjWjJvYmN1NnVOaFEwWFRt?=
 =?utf-8?B?S1hmZHZCazBRSTRWWlVzQXorSDBSNHl1R2JmM0pSb3BadFh3SlhzRjBESldB?=
 =?utf-8?B?S3A2Z1JvU3hGSlo4QWVYd01yaW9taFRkbk4vci9xQzI0RnhDc1YvUzRhU0xm?=
 =?utf-8?B?WkRYeHhKRjRDczI2NVRLdFptdzk5eGMzaXd0dUtHLzVFWXhjeWVwdzFlOHBI?=
 =?utf-8?B?cUN5QTF6L3d2Tlk0dG9ib2tPUHdGOFJMeEc5M2RXb3d0V3g2RUNuVFh1VmlX?=
 =?utf-8?B?YXAyQ0ZSNGJmR09hZm5nRjhPNkdDWlJYN1d5aEVrZUhub1dMOFdOOFRFSkJz?=
 =?utf-8?B?enRVckNLcXJ6OSsyY3RDck05aCszRDJJZ3NiY3FkN1dxZklKdWM3VmE2bC8r?=
 =?utf-8?B?Vkhzc0RNRWJLR1RvWTVJdkcwblozamF3NU9URTMrTVdlOXBSeXV1T3dhSE9H?=
 =?utf-8?B?eGtWclRuVVQ2WGVqU0tjZ2ZZMHBvOEZmZUdEbkFtVXpPYm1TTjRFTDA5Y0VR?=
 =?utf-8?B?L0ZDL0M4MlJCai9hQzNrNW5pKzNuaStWQXRVSFhPMXhOcEg0OUhqQVNpaTFo?=
 =?utf-8?B?Q25uZ1oxZk9nS04wT0I2NzdKdE1uZStGYzdYemxZRlptaStqZFlQMVBFYXhy?=
 =?utf-8?B?Q3lDNVJZMXV4dmFVVDNIZWdScmFob3AvcncwcE9kR25INVlxYUM0RXJoc0Rl?=
 =?utf-8?B?bENHTmlJU0NMdWhqQW1KNHU4VmcySEFuWldCSVA4RFlmQkxsRlZtd2tPc3Fy?=
 =?utf-8?Q?wVfkz1DEKbmAo4DHijQeDsQadSY2pQGf4zd+a6h?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA2u6w5rJJcG0irXjltaVTl8wyyY2wQ6ujtiXfLzHdBIQEzeOx0IaQEfRGCWEl76dBTJHNsBhGG7FiYOvA1Oi0t0v3uIZcj13GfE+1YASW5ECXKicy0eUa+Y+XeFHSATI5FcR4hqeHGS5N5FOkHuLz0Dib3lfyiGnOzlFUAsAmHa8At3/2e4qHfa+4jaHpK3K+dYh4YeI4UrvjMSe5xQ8tJKtIuz9fg/I98RpzOOELi64VrQFDPoTrDgXOWH7SA1D6qqU5Bxq/kfPwJi0/+blDtjGCi2iSh68Jwgp8PPg4bn8w1tHZ56jvS9ysExExj2GMwRh93DaWIHCKpmPpINWg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ8hGqK/ma4MnAWqR/9dSZQPbrRAiETgnzCbwdNeH2s=;
 b=YWtRCYPdfM+ReRt5n/vBLU+vs3muuZADlMyWbU2cZKVBE3fu2NIT8Xnujs7c0nujePVMYIIF0C9shf+1hTsMxMY7mdDbzK4x1jfGK3NNlLThXdc1tY2PceeTo80nkbEhvlZbnuG5l3HFHHVrCvQSscmf0YmwaAZ+9eBC8/rzP30k3SDz4LyR453r2C8405A40U5EkT/NtS8WG1P+S5PzhOh3fJBeNnXj2HffOD0WirSY2u2RE5kUmr8Fa1Uy6ESkICMim0+yIfYI7kser5zxW8PPRqwV1Fwm6AOLe+cchMaKmqhDpM8JE0dPwngDA5xgCTqpb/A00NOyjoJMx8psAA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ8hGqK/ma4MnAWqR/9dSZQPbrRAiETgnzCbwdNeH2s=;
 b=miUoRpqmjjlxClf9hq18N8b7TKHbgbA3kE11bcaGrrwg4IkJYIzLn4MlNdz2G2WiYhcHto8rcxYXphfCadMWUWMzWmOcgMSuSXctXd25/YdCcvMWIf50QMAEzi/BI3MLfK1oMH7PM1oVxde43B5yo5MOHGfgkh/ujo/DMz1kVdw=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: DM6PR02MB4201.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: dfa2b852-e27e-41f5-e7bd-08d8d46b7a0e
x-ms-exchange-crosstenant-originalarrivaltime: 19 Feb 2021 00:15:34.6232 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 85rPesVm7tTgcP562h7/UCocvG8KcTb6Gg674ndYCw14oADoetdlaCTEUpqlWabHyEY1FmLP1yUiNabwxBzCUQ==
x-ms-exchange-transport-crosstenantheadersstamped: DM6PR02MB5084
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=bcain@quicinc.com;
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
Cc: Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Sid Manning <sidneym@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDE2LCAyMDIxIDU6
MTggQU0NCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+
IENjOiBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
ZzsgTWljaGFlbA0KPiBMYW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT47IFNpZCBNYW5uaW5n
IDxzaWRuZXltQHF1aWNpbmMuY29tPjsNCj4gTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVy
LmV1Pg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogaGV4YWdvbiBzeXNlbXUgLSBsaWJyYXJ5IGxvYWRp
bmcgcGF0aCBmZWF0dXJlDQo+DQo+DQo+IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0Bh
bXNhdC5vcmc+IHdyaXRlczoNCj4NCj4gPiBDYydpbmcgTGF1cmVudCBhbmQgQWxleC4NCj4gPg0K
PiA+IE9uIDEyLzE3LzIwIDY6MTQgQU0sIEJyaWFuIENhaW4gd3JvdGU6DQo+ID4+IE15IHRlYW0g
aXMgd29ya2luZyBvbiBzeXNlbXUgc3VwcG9ydCBmb3IgSGV4YWdvbi4gIFdlJ3ZlIG1hZGUgc29t
ZQ0KPiBnb29kIHByb2dyZXNzIHNvIGZhciBhbmQgd2UnbGwgd29yayBvbiB1cHN0cmVhbWluZyBh
ZnRlciBUYXlsb3LigJlzIGhleGFnb24NCj4gbGludXgtdXNlciBwYXRjaCBzZXJpZXMgbGFuZHMu
DQo+ID4+DQo+ID4+IFRoZSBvbmx5IHVzZSBjYXNlIHdlIGhhdmUgZm9jdXNlZCBvbiB3aXRoIHN5
c2VtdSBpcyBib290aW5nL3J1bm5pbmcgZWxmDQo+IHByb2dyYW1zLiAgQm90aCAiLWRldmljZSBs
b2FkZXIsZmlsZT0uLi4iIG9yICIta2VybmVsIiBhcmUgZWZmZWN0aXZlIGFuZCB3b3JrDQo+IHNp
bWlsYXJseS4gIFdlIGhhdmUgaW1wbGVtZW50ZWQgImFuZ2VsIGNhbGxzIiAoc2VtaWhvc3Rpbmcp
IHRvIGRvIGhvc3QgSS9PLg0KPiBXZSBoYXZlIG5vdCB5ZXQgdHJpZWQgdXNpbmcgdGhlIFFFTVUg
c2VtaWhvc3RpbmcgZmVhdHVyZXMvY21kbGluZSBhcmdzLCBidXQNCj4gbWF5IGV4cGxvcmUgdGhh
dCBvcHRpb24uDQo+ID4+DQo+ID4+IE9uZSBmZWF0dXJlIHdlJ2QgbGlrZSB0byBpbnRlZ3JhdGUg
aXMgYSBndWVzdCBsaWJyYXJ5IHNlYXJjaCBwYXRoDQo+ID4+IGZlYXR1cmUuICBUaGUgZXhpc3Rp
bmcgaGV4YWdvbiBzaW11bGF0b3IgcHJvZ3JhbSBkaXN0cmlidXRlZCBpbiB0aGUNCj4gPj4gSGV4
YWdvbiBTREsgaGFzIGEgY29tbWFuZCBsaW5lIG9wdGlvbiwg4oCcLS11c2VmcyIuICBUaGUgbWFu
dWFsIHN0YXRlcw0KPiA+PiB0aGF0IGl0IOKAnENhdXNlW3NdIHRoZSBzaW11bGF0b3IgdG8gc2Vh
cmNoIGZvciBmaWxlcyBpbiB0aGUgZGlyZWN0b3J5DQo+ID4+IHdpdGggdGhlIHNwZWNpZmllZCBw
YXRoLiBJdCBpcyB1c2VkIGZvciBhY2Nlc3Npbmcgc2hhcmVkIG9iamVjdCBmaWxlcw0KPiA+PiB0
aGF0IGFyZSBsb2FkZWQgZHVyaW5nIHByb2dyYW0gZXhlY3V0aW9uLuKAnSAgSWYgdGhlIGd1ZXN0
IE9TIGhhcyBhDQo+ID4+IGxvYWRlciB0aGF0IHRyaWVzIHRvIHJlc29sdmUgYW4gZXhlY3V0YWJs
ZSBvciBsaWJyYXJ5J3MgRFRfTkVFREVEDQo+ID4+IHNoYXJlZCBvYmplY3QgbGlicmFyaWVzLCB3
ZSB3b3VsZCB3YW50IFFFTVUgYW5nZWwgY2FsbHMgdG8gYmUgYWJsZSB0bw0KPiA+PiBzZWFyY2gg
YSB1c2VyIHNwZWNpZmllZCBob3N0LXBhdGggZm9yIHRoZSB0b29sY2hhaW4gbGFuZ3VhZ2Ugc3Vw
cG9ydA0KPiA+PiBsaWJyYXJpZXMuDQo+DQo+IFRoZSBjdXJyZW50IHNlbWlob3N0aW5nIHN5c2Nh
bGwgQUJJIGJhc2ljYWxseSByZWxpZXMgb24gdGhlIENXRCBvZiB0aGUgZWl0aGVyDQo+IHRoZSBR
RU1VIGJpbmFyeSBvciB0aGUgR0RCIHByb2Nlc3MgKGlmIHJvdXRpbmcgc2VtaWhvc3Rpbmcgdmlh
IHRoZSBnZGJzdHViKS4NCj4NCj4gQXJlIHRoZSBIZXhhZ29uIGFuZ2VsIGNhbGxzIHRoZSBzYW1l
IGFyZSBBUk0gc2VtaWhvc3Rpbmcgb3IgYXJlIHRoZXkgdGhlcmUNCj4gb3duIHRoaW5nPyBDYW4g
eW91IHBvaW50IG1lIGF0IGEgc3BlYz8NCg0KSSB3aWxsIGxvb2sgZm9yIGEgc3BlY2lmaWNhdGlv
bi4gIEl0IG1heSBoYXZlIGJlZW4gbG9vc2VseSBtb2RlbGVkIG9uIEFSTSdzLCBJJ20gbm90IHN1
cmUuDQoNCj4gPj4gVGhpcyBmZWF0dXJlIGlzIGxpa2UgdGhlIGZ1bmN0aW9uYWxpdHkgaW4gUUVN
VeKAmXMg4oCcUUVNVV9MRF9QUkVGSVjigJ0NCj4gPj4gZW52aXJvbm1lbnQgdmFyaWFibGUgdXNl
ZCBieSBsaW51eC11c2Vyc3BhY2UuICBTbywgb25lIGlkZWEgd2FzIHRvDQo+ID4+IGp1c3QgKGFi
KXVzZSB0aGlzIGludGVyZmFjZSB0byBtZWFuIHRoZSBzYW1lIHRoaW5nIGZvciBzeXNlbXUuICBX
ZQ0KPiA+PiBjb3VsZCBtYWtlIGl0IGEgdGFyZ2V0LXNwZWNpZmljIGhleGFnb24gZmVhdHVyZSwg
aWYgaXQgZG9lc27igJl0IG1ha2UNCj4gPj4gc2Vuc2UgdG8gaGF2ZSBpdCBhcyB0YXJnZXQtaW5k
ZXBlbmRlbnQuICBBbmQgaWYgaXQgbWFrZXMgc2Vuc2Ugd2UNCj4gPj4gY291bGQgcXVhbGlmeSBp
dCBsaWtlIEhFWEFHT05fUUVNVV9MRF9QUkVGSVguDQo+DQo+IExldCdzIGxlYXZlIFFFTVVfTERf
UFJFRklYIHRvIHVzZXItc3BhY2UuIFdlIHRyeSBhbmQgYXZvaWQgYWRkaW5nIG5ldw0KPiBlbnZp
cm9ubWVudCB2YXJpYWJsZXMgLSBlc3BlY2lhbGx5IHRvIHN5c3RlbSBlbXVsYXRpb24uIEkgdGhp
bmsgdGhpcyBpcw0KPiBzb21ldGhpbmcgdG8gZXhwb3NlIHZpYSBhIHByb3Blcmx5IG1vZGVsbGVk
IFFPTSBwcm9wZXJ0eSB3aGljaCB0aGVuIGNhbg0KPiBiZSB0d2Vha2VkIHZpYSBjb21tYW5kIGxp
bmUgb3IgSE1QL1FNUC4NCg0KT2ssIHRoYXQgbWFrZXMgc2Vuc2UuDQoNCj4gPj4gSWYgbm90IHRo
aXMgZW52aXJvbm1lbnQgdmFyaWFibGUsIGlzIHRoZXJlIGFuIGV4aXN0aW5nIFFFTVUgZmVhdHVy
ZQ0KPiA+PiB0aGF0IG1hcHMgd2VsbCBoZXJlPyAgT3IgaXMgdGhlcmUgYSBiZXR0ZXIgaW50ZXJm
YWNlIHRoYXQgd2Ugc2hvdWxkDQo+ID4+IGNvbnNpZGVyIGluc3RlYWQ/DQo+DQo+IE5vdCByZWFs
bHkgLSB3ZSB2aXJ0aW9mcyBidXQgdGhhdCBpcyBhIGd1ZXN0IHZpc2libGUgZGV2aWNlIHRoYXQg
YWxsb3dzIGZpbGUtc3lzdGVtDQo+IHBhc3MtdGhyb3VnaCB0byB0aGUgaG9zdC4gSG93ZXZlciBp
dCBkb2VzIGJyb2FkbHkgYXNzdW1lIGEgTGludXggZ3Vlc3QNCj4gKGFsdGhvdWdoIHRoZXJlIGlz
IG5vIHJlYXNvbiBpdCBoYXMgdG8pLg0KDQpJIGRvbuKAmXQgdGhpbmsgdmlydGlvZnMgd2lsbCBz
dWl0IHRoZSBuZWVkIGhlcmUuICBJdCdzIG5vdCBwcmVmZXJyZWQsIGJ1dCB3ZSBjb3VsZCBleHBs
b3JlIGFuIGFwcHJvYWNoIHRoYXQgcmVxdWlyZXMgZ3Vlc3QgY29kZSB0byBjaGFuZ2UuICBJIHdp
bGwgZGlzY3VzcyB3aXRoIHRoZSB0ZWFtIGFuZCBzZWUgaWYgd2UgY2FuIG9mZmVyIHNvbWUgcHJv
cG9zYWxzLg0KDQotQnJpYW4NCg==

