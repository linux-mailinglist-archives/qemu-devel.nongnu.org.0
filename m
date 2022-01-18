Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2C492B28
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:26:35 +0100 (CET)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rJa-0007sn-0D
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n9qc5-0008QL-Gs
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:41:37 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:64040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n9qc2-0004D2-Ep
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1642520494; x=1643125294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2esHZylv2sdZYdfJR346jBRWOCiRuIfy9Tle5uxLasw=;
 b=xs6+WRb6XcN3uY607taQN9Puf+U8PKw+H8S6h/1g/0YnAdFX9Ak8gov0
 cPDql6PIt8bt8c69o6MxRR/K2qQtwV8ksMPDljdFFqLqyFVIgzz8dhUSr
 ATxASDZz73C2bN03UYKAwji1Zl4TBMjWATFNfWGQKILw4xROtrQvNJD1Q 8=;
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 15:41:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYxs8MaId9pZsWrsf8VQs/9+a2EwTz4gDFssy1rlvRn+JpjSgl9ii0mFUx/zAWQSRdPqm8MDBoxpUHM9DKwqMakCV7sXWPjNkZSygBc3lznFWnwzwM2GlWiJgFp2Ym1kMJqTGDS8YI/9zaIqaGYT19tRaX035HVL65cIXDswcVL6txun20nUdIlPjxGJyvcYvST73MuY14PwFkOkIPHFEp56kZZbJ09td5B13SPDnrmJfpBWghXFFzicuM5muroGOHz2qF1w1jweGJyNqsEw5tIYluCWoxMgRTNIbOh5y2fjbsx8/th7msj59M8AAvBcNE8WZy6hOELJeltI/H2itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2esHZylv2sdZYdfJR346jBRWOCiRuIfy9Tle5uxLasw=;
 b=cOqfaiPTiyBx9VfFB36d0oTCYk1uYbGsS4EbdTwYX6oQEOIN8b5d9SWY1TbQVaT5tChECicq3nPNYvsIqJuWMXn0eu2OIT+P615HcQvoXHFO1ab3NUdUoZE/2qpTDKqQI0gbDXAakpouUEqRHsE+jcINDNm8bkuKC/RlMwdDoMQkclZqxKUUSpBTMcRX75dFgNQbr/MFAFZDJbMM6ykVXkuk9WNQy29hf/DVj+5r7eo3FPA7jLOLgYBiwPWJERQtyFxc9MmXd970OMgq2UmWsw89DgDgtJdi1TnfnAZ1zPyN4eaSFufzkYwnH/R2Oy4mVbcZbhVwtpvCNM/vXZGUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by PH0PR02MB8358.namprd02.prod.outlook.com (2603:10b6:510:102::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 15:41:30 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 15:41:30 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: hexagon container update
Thread-Topic: hexagon container update
Thread-Index: Ade25RCxllT+hUwlRb2vNrqCSUbc9QABASCAAABlCPAADdM14BSgmYTgAIMxX4AAM2sYEAAAwHAA
Date: Tue, 18 Jan 2022 15:41:30 +0000
Message-ID: <SN6PR02MB420563E117B5B7BB449D0D64B8589@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42059B3D252751BEDBB540C3B8AC9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42050D02581C5FF732732D29B8559@SN6PR02MB4205.namprd02.prod.outlook.com>
 <87o84aa03n.fsf@linaro.org>
 <SN6PR02MB420500D2EC8C03861E270E2CB8589@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB420500D2EC8C03861E270E2CB8589@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebeefa2d-8bff-4af1-8bd9-08d9da98ff71
x-ms-traffictypediagnostic: PH0PR02MB8358:EE_
x-microsoft-antispam-prvs: <PH0PR02MB8358625B93C83CF5F31B7F84B8589@PH0PR02MB8358.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bjaHaNQ+ymUVPhXpj2eassWZdBT0UMu6qNnLS/9S+Fyl+xl2VivrrvtPG4hrnj7cdQ5i3tJtvUg3aQNLz6HOpvfMAyYxeruYWZALaqAt0rd8iXPU4coEGP1DDXTkLJINzs8F1BLHmfeOuFzuzsfULnzrhywOXJk4BMyTP3EzOO8oSIz+sTsX4OLni7tVuEaiHHfVpdXNe5dm+MBjav3foTeTQ/aRc2mI9boOcQDXp1BxPWC1kGtRtugaB4kanuNslvT3wMj4twKMU+H04/IijNtw0OrmwxF6l75QtufPKuDvsityS13yse2HudQVOmEXAbHM1Gm3zySjXxyF5cdNcqyeoZAQ7kdzrywsGAMMd4AuUvlS5mHYmFoIKJ5gsfngqUT2rztkCSmlJVno16UheZtWWeqiQ0Nvel2NXCchL4k7Rsj/IdzXiBP2p/gScbgF7q89iOgHBRgTMPq0IbhvjrOGOnV5mSb+nYP/nDWMkopnOUR22KzVP1s+Y+ECl7HMULmPu4uBKsixeNWAigMadk4k0J4fYU7z2xlP8cg6e3ozHvgr46oTyvui3L6m5gfQ0MhB3/FXjKYhCwfuXUhJtNgpThYbkimJ74pwKbAPYTRcdksYDodm7f4omO7CBGaV34kLAXZ5NpUw5RxuAMectjZJsB3o6Tby3GEhUMGmUK4tNC8eGr5iad4DUkic461gMfye76EU6NFGH+FCtU6dmOnG5d+AX/HEsIr3sl4nCKAtH5l1V5yuNrHfGqK48Qfhz0L8zYIySo3VFc96xV4/l7YpOyjUqI3IdJmd8ZmONBk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2940100002)(52536014)(26005)(316002)(2906002)(55016003)(3480700007)(71200400001)(8936002)(38070700005)(966005)(9686003)(4326008)(38100700002)(8676002)(66556008)(66476007)(64756008)(122000001)(5660300002)(54906003)(86362001)(7696005)(76116006)(66574015)(53546011)(6506007)(6916009)(508600001)(33656002)(186003)(15650500001)(107886003)(7116003)(83380400001)(66946007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1VpVWNRMUQzcHZzb3dwazJraDdBcDJXVGM5OEhVblNzbnF6REVFWEpFMnJo?=
 =?utf-8?B?ekNad0h5V1M0d0VOOFZqWE1lRTQ0TjZ0eEt6blhOOFFXL2ZYYysySHl2UXor?=
 =?utf-8?B?T0xLSFJIRElqZVhqZEl4UjZ2RjBERkczbUdsRzdDYTcrMkd2ZWZyTTRQOFFU?=
 =?utf-8?B?b1pTc1d0cFNaVWgrdFdlVjlTOEhjeHdqRldaTms5TUZEY3pvMkQ5RlU0WWFp?=
 =?utf-8?B?a0I2WG02OUV6VmloSGk0SGsraU1uS3FQbm51UThkOEt1SWlVY0hwZitDYS9O?=
 =?utf-8?B?cTNwTzdUb3NjWUZFbWl5b1Z0WXFNYURuSFNvSGdXTHpRNEo2cVU2YTJ5M0hl?=
 =?utf-8?B?Ny9xSkY3U1g3Qm1neHlwMm9GbHpWcWFuYnl3YmlkR3VyMGFEMVB4ZjdlR21i?=
 =?utf-8?B?bWM1ZWNWT2duNG9SV21TT25QemI2ZGU1OXRWU05scWY3VHlwUDZ5QUZXaERp?=
 =?utf-8?B?TEtOaC9zMVBObFU4TTA5NHdKM3dKYXhPUlNxdlc1eHR2TlU4L3JSckZvTG9k?=
 =?utf-8?B?Nm01cXVtNWJpSHRLbnN3dVZhaXNPUVFmMTByMHRLNWhRSHlvSG5NZDBvcGJr?=
 =?utf-8?B?REpXSmx3Qm8rNUlMRWJGL25neGNCMVQ5QnRqQnZJdVFXbHV0UXBoc0RwSFN4?=
 =?utf-8?B?dnY4djY0aVdyd2ljK3RqRDFUMys3T0F5Nk9iaTlIT1hid3QzQ1FJUlJPMHlq?=
 =?utf-8?B?S3BFQWxuVVM4cHIwclkxTVp2L1VoemlSdk1XcURkN25UTkt1MTd3bzdGOWg2?=
 =?utf-8?B?MkdUczBuSmhUZFJ1clhEYTJaRjNiNytqTzlUbmJvcTcySjZLa0dFZjU3SXh4?=
 =?utf-8?B?U0JyczlkTVBOdjB6dVY4V2FUZHZlNWhHRThvZFZhT291bDkvZDU5eWhlSW40?=
 =?utf-8?B?alQwODdtM2xOYWRORzEwZ3RFSWNyQ1plSUV3K0R2STlsM1orYm4wSTY0Nmtq?=
 =?utf-8?B?OUVQUjlDTi9DMDdrUVZFZ1VGMnBtM20yS2QwbGZ2cHpYc1dxajZkdXp2YWJB?=
 =?utf-8?B?VmhUN3JyMWFWNGM4bXBCNmFOamVRRzZ4RmhrYUJXcVJXbTBoZ05tZVdnL1Fw?=
 =?utf-8?B?bUh4cHZWQ3AvcUlaSEpESW56NGh6cjJTdXExb0QyMTI4cVNiY2twaUoxUlo5?=
 =?utf-8?B?bkFBV3hoYWN4VEQxTndtSXFvV3ZVcExDa3NUdVVxalFqMzBOOG5CZ3FUU0Nr?=
 =?utf-8?B?eFBvV2JjNHI5QVE1MU9CVGxTZm9GM0RHVXRGQ0czeS9TbXE5NVBBaWY4cHFN?=
 =?utf-8?B?ekJrZkc5WkN6YzZPdndHWmlHbzcrUE82cFVKZUkxbmpuQms0amJGaW1RZUZh?=
 =?utf-8?B?eklBU2pGZ0dwSEVuS1JMNnFGTEtxaiszcng5aHlNVElXdENYWWVZeXp6UzBt?=
 =?utf-8?B?cEE4WjlFNWRPVE1TQk1wZVVhNDlraUVydFpNbm83OERwUTdaMUpvbnVVZjVz?=
 =?utf-8?B?UTI3Y21XMHJxMUdEV3V0aTdUa1dmN1ByYXdGZmU2dVJtajlGZldDV1QwdDZj?=
 =?utf-8?B?c0Z6RUFhMEpKNW5CZC9hV0tvdVQrQ28rQ2dkUEJxNXdOY1pCaEIwWEE0dnZj?=
 =?utf-8?B?Q3J3d1Jwcm9hM0dIVFkzaTRNdjJwbSthcTZMOTRkZTFCcHljVjRzL2xMRjZn?=
 =?utf-8?B?UFo4QU9pY3Jtdm9qTm53YnhIOVYwd2NWNGMxSkRLTFZ6VWV5T2dxdGFJUWls?=
 =?utf-8?B?Sk9LWXdSRjJkQ1ltRTJrOGQ2VDVTS1hmTTlRR29jeWVWY0h4Zm52SW9aSVdm?=
 =?utf-8?B?ZXdhOUo0d0h0L2RHajdjc0NJQkZkQVZyNXNOVDlwYUN4NDdaVFYwVkwrZUM3?=
 =?utf-8?B?RjdlRERhKzk0NTl6UWtWUzg4MG4wc2R5eWhzSkI4aTMrcjk2UE1FaUxMd2ls?=
 =?utf-8?B?Sm1EaFgyYzJKR3hxak1CNDRpTEtYL0lvRXZHbG1WM3V2RzVmK3ExbGhlZ1h6?=
 =?utf-8?B?dGlJdTNJcDBRWFBpSDVqR0tBR1hOMEJhT3RvZ3Z4WlZHYWRUVzFTNElWVzJV?=
 =?utf-8?B?SnJwZldOejdGdHZmSXFIY0ZDd29SUXl6Y2RaMjVsNXNnUE9Hd2NCUXJJdXBu?=
 =?utf-8?B?YkVWVENOVWRUTVFkWTdNMXhDMWNMTnR1MlJMVVFXb1FNdXF1cytPTi9EVmFx?=
 =?utf-8?B?ejJQdkF3YlFtMmVPaU9HZWlrS0lZdmJXR20zRWk4YUJJUFdUREZIdTB5Nno0?=
 =?utf-8?Q?LkeKg7RZHYxrWIBnRykOktk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebeefa2d-8bff-4af1-8bd9-08d9da98ff71
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 15:41:30.4214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DlwiDjp/MiEJn5Dl0WGsJfedP20Gv192r6YFHAw0WA6FeTS/TGjo9A/2h1jSsxOgfqEtxjuCXEt205vmNW945Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8358
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJpYW4gQ2Fpbg0KPiBT
ZW50OiBUdWVzZGF5LCBKYW51YXJ5IDE4LCAyMDIyIDk6MjUgQU0NCj4gVG86IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gQ2M6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgcWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZzsgVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSRTogaGV4YWdv
biBjb250YWluZXIgdXBkYXRlDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAuLg0KPiA+
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPiB3cml0ZXM6DQo+ID4NCj4gLi4uDQo+ID4g
PiBXZSBoYWQgc29tZSBpc3N1ZXMgd2l0aCB0aGUgcHJldmlvdXMgYXR0ZW1wdCB0byB1cGRhdGUg
dGhlIGNvbnRhaW5lci4NCj4gPiA+IFRoZSBsaW51eC11c2VyICJzaWduYWxzIiB0ZXN0IGZhaWxl
ZC4gUmljaGFyZCBwb2ludGVkIG91dCB0aGF0IHRoZQ0KPiA+ID4gYXJjaGl2ZSBvZiB0aGUgQyBs
aWJyYXJ5IGhhZCB3aGF0IGxvb2tzIGxpa2UgYSBkZWZlY3QgdGhhdCB3b3VsZCBjYXVzZQ0KPiA+
ID4gdGhlIHRlc3QgdG8gZmFpbC4NCj4gPiA+DQo+ID4gPiBodHRwczovL3d3dy5tYWlsLWFyY2hp
dmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c4NDk2MzUuaHRtbA0KPiA+ID4NCj4gPiA+
IEknbSBmb2xsb3dpbmcgdXAgbm93IHdpdGggYSB3b3JrYXJvdW5kIC0gdGhlIGF0dGFjaGVkIHBh
dGNoIHJlZmVyZW5jZXMNCj4gPiA+IGEgdG9vbGNoYWluIHdoaWNoIGF2b2lkcyB0aGUgcHJvYmxl
bSBhbmQgcGFzc2VzIHRoZSBzaWduYWxzIHRlc3QuIFRoaXMNCj4gPiA+IHRvb2xjaGFpbiBpcyBi
YXNlZCBvbiBsbHZtK2NsYW5nIDEzLjAuMS1yYzIuIEJUVywgdGhlIHJlbGVhc2UgcGFnZSBoYXMN
Cj4gPiA+IGEgc2lnbmF0dXJlIHByb3ZpZGVkIGluIGNhc2UgYW55b25lIHdhbnRzIHRvIHZlcmlm
eSB0aGUgZG93bmxvYWQ6DQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcXVpYy90b29sY2hhaW5f
Zm9yX2hleGFnb24vcmVsZWFzZXMvdGFnLzEzLjAuMS1yYzJfDQo+ID4gPg0KPiA+ID4gQ2FuIHdl
IHRyeSBhZ2FpbiB3aXRoIHRoaXMgbmV3IGNvbnRhaW5lciBkZWZpbml0aW9uPw0KPiA+ID4NCj4g
PiA+IC1Ccmlhbg0KPiA+ID4NCj4gPiA+IFsyLiAwMDAxLVVwZGF0ZS1IZXhhZ29uLXRvb2xjaGFp
bi10by0xMy4wLjEtcmMyLnBhdGNoIC0tLSB0ZXh0L3gtZGlmZjsNCj4gMDAwMS0NCj4gPiBVcGRh
dGUtSGV4YWdvbi10b29sY2hhaW4tdG8tMTMuMC4xLXJjMi5wYXRjaF0uLi4NCj4gPg0KPiA+IENv
dWxkIHlvdSBzZW5kIHRoZSB1cGRhdGVkIHBhdGNoIGFnYWluc3QgdGhlIGN1cnJlbnQgbWFzdGVy
IGluIHRoZSB1c3VhbA0KPiA+IHdheSBwbGVhc2U/DQo+IA0KPiBTb3JyeSAtLSBJIHNob3VsZCBo
YXZlIGluc3RlYWQgYXNrZWQgdGhhdCB0aGUgcGF0Y2ggYmUgcmV2aWV3ZWQuICBJdCB3YXMgYmFz
ZWQNCj4gb24gdGhlIGN1cnJlbnQgbWFzdGVyLCB0aG91Z2guICBBbmQgb25jZSBpdCdzIHJldmll
d2VkIEknbGwgc2VuZCBhIHB1bGwgcmVxdWVzdCwNCj4gcmlnaHQ/DQoNCk5vLCBpdCB3YXNuJ3Qg
YmFzZWQgb24gbWFzdGVyLiAgQXBvbG9naWVzLCBwbGVhc2UgZGlzcmVnYXJkLg0KDQotQnJpYW4N
Cg==

