Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35736402E3C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:14:38 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfcD-0007Nv-9F
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfXC-0000ef-QB
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:26 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:52084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfXB-0003bO-1V
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038164; x=1631642964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1SlnHVTI5skPsHYHgDiUsv11aLyvifESDpc8mgKF8H8=;
 b=rVg0Yx+RVkQu29q5bVSfin9xMXK7yGMpadhd1Fx1PZh8fw5KLAUCxdsz
 VEvQCGoSWr+/oCa1NDzJ/kB2BwIzGQZSrNz/TI2NmqjXl4bysb0ArY+tC
 NwAEOZ+rtdpKuiz9RR+w00WCEbppjPVO2FeA7VR1YiwiydMKK0XpaePjQ s=;
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+CtdbF4VEi8Z3LvJa/d0h9BUrSPYCTCCNK3tZoz2AmOAh3kIjJO+NNCUbXL84GC8ys4HOLmVsPrz8bW7rafVvyR8lelcj//pXke2OYRK6tSOfSBEV8ngNFmuvUWixqkZ1NXYRiDYbZwEHCmB2Cwt2Js1Xx0y1m3smNummVkQrUDSjy8B2AVs7CihIFCerT+UIXJfCWybPMrco4A/2QuxIr2zMj7lKGA88sgcv9FVhMaKWFDwzPSvY3U14FIXdcnBhzdtQ7NuBstSR32qFWVE4ro5R2LKKZ/+PGTpDl2DM7Us4CLXRCygfFSnqF9VJCRMeBcUYqp0RivEPDG60sTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1SlnHVTI5skPsHYHgDiUsv11aLyvifESDpc8mgKF8H8=;
 b=JixQWqwCJvwvSz/f2xMx256ZJxojgI19NJ1s6p+upwQHy66QqBbjXd2EJmBS/PEuBqGt8k00MCy+HNqzpTFennHq2Uc46W8rjbwVl4b2vcYFyYtUmD5Emfwctkrs+eJfehlSSNRPtP8lTMQN9D6+PG9x8IxcVPgurpvmaWJ4vOKBA+zzEtvdYFThd7EAJO1AMysv8Y6lB4bpagmWDrUZ0+bQuSDfeRxDk3cgg/xGM0YUezUqR0UeSc6NxgDD6s8QX4CSL4ajZzwh8e4Qa4ZfqbajwS3mOzNhKis8nGxqNnIUripx8LNc3SQDiFeCbVnZvU9K7BkJp5n3O31AE3VyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4949.namprd02.prod.outlook.com (2603:10b6:a03:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 18:09:22 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:09:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 02/12] target/hexagon: import README for idef-parser
Thread-Topic: [PATCH v6 02/12] target/hexagon: import README for idef-parser
Thread-Index: AQHXfWMeIUsmVlPnSEuJ0dnaFwPf/quXqX6A
Date: Tue, 7 Sep 2021 18:09:22 +0000
Message-ID: <BYAPR02MB48861B4181C2F934AAC19ED0DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-3-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-3-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 951df4e6-c765-4324-3a8d-08d9722a9e8c
x-ms-traffictypediagnostic: BYAPR02MB4949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4949E8404595E65EF52EB98DDED39@BYAPR02MB4949.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iktfZY2dWYbPD7JY2Ol8Jkb8BRifliw5nj2q3cQWBtaARg5A/5uC+/Plvw+8rMF6rLbE8bx3jsNu6kTgZeO+nQtqaYhzd5OZEoYteOs+twd9Vg+t4C0SaYXz8L2SLILlzHYXPBIPVVCjCz6V20wcxApcw5UNQj6FwQu3EAoveNRwD429T86tKKTxyzEPfsc8USHH18hu5+fvoNmu7yfSiWgyCF2XTUtlYRr8YvphjKJj6L94E6iDRy1m+MFK7l/xQelh4RT41FgZ9J1Fofig3yP3xmfbYUC1aKQrNcE0D/9RJdtontoZ6RljJYYCIaQpe1wivxYEvkFfwgp0jxA2fg04WZGwkeMufwWHT+1qlh6OdThSgftkhZ/w3SiFeQhUaSGCMRja3tTS0evVFp9gUphl9LNzOhKnCfacDTWa76aJ4jmK4kSO8l4qe+RrCItEKJQunAp1CM6WmOVYDNTo/EPh8csJJlEhnO5S4gLXNP5Hs8MFb71623Jy8CLKh1jNKiQ6tGVF/aAOqB8l5RyklunHBtms3Knit2DUK81UA/M0v8yC34JCwBV1p3/s/SKmxgKgUO49T/yRNqJ/umNmMtUY2MpzOA78T0lzoMyNQ8YEBg0JsARljn+5volTO6hoxqJ5z+/3wgtaH0wYfdEFQiyAqhvLI+iUQGx1J2XQHVvlO+hyQ1lsNkZzq6n0j1OzN8V3WNRZ4WieCVbfgVFPKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(38100700002)(38070700005)(76116006)(6506007)(2906002)(53546011)(66476007)(54906003)(66946007)(83380400001)(55016002)(7696005)(66446008)(66556008)(26005)(9686003)(122000001)(8936002)(5660300002)(110136005)(64756008)(316002)(186003)(33656002)(86362001)(4326008)(71200400001)(52536014)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGd3MDBqV29hVENPL1NITG1oMkwrUWQ1L2JxZldmTi9kUDFhWUw4TUZyRmh2?=
 =?utf-8?B?UFRTRWM0b1J4QzljVUpWbDFDNHNkS0ZseFdiNllyUklYaDFvcFVxUmVweCtq?=
 =?utf-8?B?azA2ZTV0QVo1YnpPa0tJYmFOUXJtR3U0eXpiODhBOE0rSzhKclNjVFBaanQ1?=
 =?utf-8?B?NVdrVENpaHBSb2VnTDdyOHRJREhicm1BMEpNUVpZdDZ1UmRvU2Y2WmdUNHlj?=
 =?utf-8?B?TDEzNFVyS1o1bGNOdXo5LytnMzFOcjZoNkhNeGZSam9CamxhbjVyMDlNZ2J5?=
 =?utf-8?B?UmJQSTdiRTVOTmxBWWVUMVlobWJ2NURrZk1CZXdpaHZWZ3MvMXhGNnZLb2No?=
 =?utf-8?B?TktyTUw1anRVOVd6OFA0SFJ4b3o5UlNVUU9JbG5DSEFyN2ZkYWVDVjZ6NzQ2?=
 =?utf-8?B?WThmK2JCM3I4THBWNzkyT1NkTjdDTE1hZVNhMHdFQnc2WExoMzZpdG14UGkz?=
 =?utf-8?B?R1I3a2h6SGhMU1l2amZCVy8xSHRsZFdIMERacDJJU1p3a3E3WU9UaUV1WWFY?=
 =?utf-8?B?bjZ6aUlDOG5MTWhURXZoNFg0dll2ZHJ3SGNXMGtkS3oxaFlGN3h5Mzd0WEx0?=
 =?utf-8?B?TGR6NzhKMlZmVmUwRUoxNzZSQnV5WUtjaEo4cysvTUhsOWRSamJ4ckxNeXdJ?=
 =?utf-8?B?N2F6TmhSNXM0Y296ditQSU5yOTNUaGQ2QlhGUEZpN3B5anhuaDBCdy9vZHFI?=
 =?utf-8?B?Y3h3TjBEaFROWURLWjA3eEU2MTJUSEtxWmRxeFBKVEVaSjJSMVBsUjMrd0tR?=
 =?utf-8?B?dmxCN2t0RHRkeklYTjRRbVpuVmVqUHhjZ01nV1Vwd1Fod2EzeHBWQnI3QjVn?=
 =?utf-8?B?eU5aS3c4akppcTRlalFFa1YwY280N3FxQ2MrUFU1d0E1TjQwb05LN2hPcEgr?=
 =?utf-8?B?dkVxb0VYUkFEUGY3M2V4MHhhVTBBMW5DelhTdUp5aVRJMHFacU13bFhLNUYv?=
 =?utf-8?B?WDVYMngvWGEzNGR3MmsvYWRYeXZRdjNrb3VEd2xjcnNET1Nkak8vSWdISlI5?=
 =?utf-8?B?alpUWWlldFBLaWxjVVB4cUlDSDJnOHpHemkvRkMzRFFtQWZ3V0hFY25kTThw?=
 =?utf-8?B?Y3pYd1diT3FQK05GZy9QNEYxbkRyOVd5VzVuWkdraGZmUmMzR00zcWVGRkFJ?=
 =?utf-8?B?R1cxZHlYcUYrN2I0aTd6bTVsWmp6NXhuWTZlazhXb3ViTWc0MWdIQUo4UUdQ?=
 =?utf-8?B?L1VYejY0V3NNQSt2cTh1cy9KVHZNNERselNiZHQyWjlHWkJrL28zQko3WU1C?=
 =?utf-8?B?YjZsZlNWeGc5dmpRaEZmM0p2OXVudUNPWUdhZktENHoxRmxsUk13dnltTVBl?=
 =?utf-8?B?clRzVDVxbWI4ckFKZi9jcU9wWkpVdFFQZUptT1JOZWxMREhSQ01DWXhOaVVm?=
 =?utf-8?B?WWFXTGFHRDg0VTRPaFpnaVZ5dmJ0YmxINk5UMXNEVnRheVZiaXl6MC94QWF5?=
 =?utf-8?B?V1h2RlYzUnRidk1ITnpMa0ZBaFdjd3FFUUhVZ0J2SFFueWVNWTI0L2JzZEhB?=
 =?utf-8?B?YVZBWGVwZDFNN3crSzdjaGJUa2VVbUk3VVBZSTQyQkxaTG9BNjJ6VlZJTDBP?=
 =?utf-8?B?Rkg2T2t3VEpIcTIvUURxd3Y2enRFcjJ2RWNESG9WT3krWWNjRWxVbDUraUdU?=
 =?utf-8?B?NENEV0gwRmQ4cGhieTRQSWZQM1dVQUhmdEpzZWlEUUkybS9TbkkrVWgwUnB3?=
 =?utf-8?B?QWlEMUs4OUUrSFY5OFJTWDhsU0FvQy9LVFdzY2ZQY0I4N295Z3VUZTJoNmNy?=
 =?utf-8?Q?dF4pdEyUgaJDE4jJYl+9yb4Lx7kfE5vYRqPtKBH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951df4e6-c765-4324-3a8d-08d9722a9e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:09:22.3209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4IzBl/9zmrFuP9W20IRrFtPEfEb+vA6zLEP4FAhYOkMsJOZDQYeAZS+QXgdv80/GhoAA7wZ2TfdfUuGYhmpsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4949
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxlc3NhbmRybyBEaSBG
ZWRlcmljbyA8YWxlLnFlbXVAcmV2Lm5nPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDIwLCAyMDIx
IDc6MzAgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogVGF5bG9yIFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5j
b20+OyBiYWJ1c2hAcmV2Lm5nOyBuaXp6b0ByZXYubmc7DQo+IHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc7IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2NiAwMi8xMl0gdGFyZ2V0L2hleGFnb246IGltcG9ydCBSRUFETUUgZm9yIGlkZWYt
cGFyc2VyDQo+IA0KPiBGcm9tOiBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4N
Cj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9SRUFETUUucnN0IHwgNDQ3DQoN
Cj4gK05vdyBsZXQncyBoYXZlIGEgcXVpY2sgbG9vayBhdCB0aGUgZ2VuZXJhdGVkIGNvZGUsIGxp
bmUgYnkgbGluZS4NCj4gKw0KPiArOjoNCj4gKw0KPiArICAgdGNnX2dlbl9tb3ZpX2kzMihSZFYs
IDApOw0KPiArDQo+ICtUaGlzIGNvZGUgc3RhcnRzIGJ5IHplcm8taW5pdGlhbGl6aW5nIGBgUmRW
YGAsIHNpbmNlIHJlYWRpbmcgZnJvbSB0aGF0DQo+ICtyZWdpc3RlciB3aXRob3V0IGluaXRpYWxp
emF0aW9uIHdpbGwgY2F1c2UgYSBzZWdtZW50YXRpb24gZmF1bHQgYnkNCj4gK1FFTVUuICBUaGlz
IGlzIGVtaXR0ZWQgc2luY2UgYSBkZWNsYXJhdGlvbiBvZiB0aGUgYGBSZFZgYCByZWdpc3RlciB3
YXMNCj4gK3BhcnNlZCwgYnV0IHdlIGdvdCBubyBpbmRpY2F0aW9uIHRoYXQgdGhlIHZhcmlhYmxl
IGhhcyBiZWVuIGluaXRpYWxpemVkIGJ5IHRoZQ0KPiBjYWxsZXIuDQoNCllvdSBzaG91bGQgb25s
eSBuZWVkIHRoaXMgZm9yIHByZWRpY2F0ZWQgaW5zdHJ1Y3Rpb25zLiAgRm9yIG5vbi1wcmVkaWNh
dGVkIGluc3RydWN0aW9ucywgUmRWIHdpbGwgYWx3YXlzIGJlIHdyaXR0ZW4uDQoNCj4gK1BhcnNl
ciBTdHJ1Y3R1cmUNCj4gKy0tLS0tLS0tLS0tLS0tLS0NCg0KQmVmb3JlIHlvdSBkZXNjcmliZSB0
aGUgcGFyc2VyLCB5b3Ugc2hvdWxkIGRlc2NyaWJlIHdoYXQgZ2VuX2lkZWZfcGFyc2VyX2Z1bmNz
LnB5IGRvZXMgYW5kIHRoZSBjb250ZW50cyBvZiBpZGVmX3BhcnNlcl9pbnB1dC5oLmluYyBhbmQg
aWRlZl9wYXJzZXJfaW5wdXQucHJlcHJvY2Vzc2VkLmguaW5jLg0KDQoNCj4gK0V4cHJlc3Npb25z
DQo+ICt+fn5+fn5+fn5+fg0KDQpSYXRoZXIgdGhhbiBkZXNjcmliaW5nIHRoZSBncmFtbWFyIGlu
IGRldGFpbCBoZXJlLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc3RhdGUgdGhhdCB3ZSBhcmUgcGFy
c2luZyBDIGxhbmd1YWdlIHN0YXRlbWVudHMNCmFuZCBkZXNjcmliZSB3aGF0IHRoaW5ncyBuZWVk
IHRvIGJlIGhhbmRsZWQgc3BlY2lhbGx5IChlLmcuLCBtYWNyb3MsIHZhcmlhYmxlcyBsaWtlIFJk
ViwgZXRjKS4NCg0KPiArRGVidWdnaW5nDQo+ICstLS0tLS0tLS0NCg0KSW4gdGhpcyBzZWN0aW9u
LCB5b3Ugc2hvdWxkIGRlc2NyaWJlIGhvdyB0byBuYXJyb3cgZG93biB0byBhIHNwZWNpZmljIGlu
c3RydWN0aW9uIHRhZyAoZS5nLiwgQTJfYWRkKSB0aGF0IGlzIGVtaXR0aW5nIGluY29ycmVjdCBU
Q0cgY29kZQ0Kd2hlbiBhIHRlc3QgZmFpbHVyZSBpcyBpZGVudGlmaWVkLiAgSW4gb3RoZXIgd29y
ZHMsIGhvdyBkbyB5b3Ugc3dpdGNoIGJhY2sgdG8gdGhlIEMgaGVscGVyIGZ1bmN0aW9uIGluc3Rl
YWQgb2YgdGhlIGlkZWYtcGFyc2VyIGdlbmVyYXRlZCB2ZXJzaW9uLCBhbmQgaG93IGNhbiB5b3Ug
YmluYXJ5IHNlYXJjaCB0byB0aGUgb25lIGVtaXR0aW5nIGluY29ycmVjdCBjb2RlPw0KDQo=

