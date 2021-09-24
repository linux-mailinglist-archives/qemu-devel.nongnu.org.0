Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152524176BD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:22:26 +0200 (CEST)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTm5p-0004Mp-06
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTm3k-0003Eu-6q
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:20:17 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:10037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTm3h-0004OF-Bl
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1632493213; x=1633098013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/aDCPHSVgTj5gYa+EmJNO5fcecUTKbDe06T9lELoQww=;
 b=KL+uQlzOmaUyDiFplLz5x41vMzf2/4GSjsgGVMXk6Knpdk6xqG5SxPpU
 KY8gzZUIR9suT/lBg9H2MbkZsCrdqcjFUWiI/4LCYbb+tPmf7rpUjFqjS
 oeqf0SSh2QW01apSagcVogH5VCYx07eTN0tm/mwtJyAxx6JzbI0uAWQS7 4=;
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 14:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxZN0eIpG3tDguWlepdDPHGSWR0aCSBZz4H0fo/QrW1upBPaJDCJYqQ0W33Zp02x6tkDJufOPYrMRf6moOiQkhGgwcPw5io4CwiWmXzip/NDN2RMEljSiyH+Cmx8SvBZRbLBv0DKn1Cc1NUJG6jyuymJyv0heEf2RiRZRQMLrxQIfYVCqcSc8z/NtpZpu0RuHNXT7csHqGsdfGa/I6XwUvAYsL24eaQquipPsfXzL4RtA2dmT+N6qEe9330Rfa/fCVXYFSp9mJk2am1RBehXu/4zW9BaRyQIL34SLDBoEuO1GHnQbh+0g5N/8EpuPb1DtOisiLzObvii15IDUhme/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/aDCPHSVgTj5gYa+EmJNO5fcecUTKbDe06T9lELoQww=;
 b=R2DEjUPeIEz/Hvs3u8+8YEhVgHF8RP8o3Sdes1eoRpzig3aT9rNkh19hlHmPUkCJbu4g5QAkKTkX9ijXFcVLrT6ZanHlbXrRiUfI84LNxpEvyWCoyX+RCvWKACjz5Cv4/ZC8PuZw8nDQt5sn9JMBtDMHuui5yEHNtEtJ1AwBc49vxg36ZcGuiLRXuB1AQcVn1Zi9HlUR5p0SuYoChrUDDP9nzddVmhORTGECznoMq43RFZo9RuQvunK2COVTAOY0w7eter1QekUH8ZPK7jMbKkl9ui4Ht+H3CepgB5ojkEb19EnUXOJZmJKbOz8fQ3aUT9chUBwHDi5edMWoNRWxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB8685.namprd02.prod.outlook.com (2603:10b6:a03:3e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 14:19:57 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000%3]) with mapi id 15.20.4544.015; Fri, 24 Sep 2021
 14:19:57 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Hexagon (target/hexagon) probe the stores in a packet at
 start of commit
Thread-Topic: [PATCH] Hexagon (target/hexagon) probe the stores in a packet at
 start of commit
Thread-Index: AQHXr+CkbvV8+flnt06SO/mdM9kA3qux2p6AgAFhamA=
Date: Fri, 24 Sep 2021 14:19:57 +0000
Message-ID: <BYAPR02MB4886147231A21C04ACD1AB66DEA49@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1632335718-13541-1-git-send-email-tsimpson@quicinc.com>
 <45c6326b-2b01-1ef3-c362-dcb5a11a3d02@linaro.org>
In-Reply-To: <45c6326b-2b01-1ef3-c362-dcb5a11a3d02@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b437ee7-353a-4ca6-995f-08d97f666336
x-ms-traffictypediagnostic: SJ0PR02MB8685:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB8685911CEB6D24EC2F4E494CDEA49@SJ0PR02MB8685.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /x89sUWrW+fJHP39diwsHarODvztBJHOOkg5ZSMVPHfkTXnXFNPnhwpNnuzD/VwEoTQrhoNeFAKs9oIjbyGLqa1omVvrrt5TpLdPoFKDm0FxtkOIxqpPQtDiwzRd4PK1duXFUxLjN+Q+eVoVF9EC8mfVnQE+YP74L65ZJF41GWLvHPlxkN+QAbrqxU0t15rQzRcqJHVpf8bIEIccNzK0EOSapcfkW2hFQmqOUySar+pTbVyhjvzI1syZf1FEWdLJuZJ3PzdFOJDQqbGci+EOYQfM1xrN3kMAhwUmJS77JYr6Cd/Oqls6wRycf8OKVOL2rE7bF9FoXqAtXOEYRuBI3FlpEpdJxXVzHHBKBJZP+zl9OirTtH86NcUzXg/eJsDP7f4jaOaEaD3udjIdyuZh2mJxnmMXc0MrqC/j+qZL3Ks9SSw0hf0xebBpzBY7mzCV8+qwDVKCv4XSWqczaqRRfMQUGYUUPrOaq2zsbymYDuhHU09CfOO8mxutqe1Xqp2HbvYEey7UdzdqO+MJknz4x3GVbNTxSloH8/HENZh96F56FG0CZJCvyj0hjuHaqAS+8P6hOeUoUxKHwtyYHyAmuroob0FwVJFDyK1nOp25iDpBgzCdn+yS+sMIOTu3jlLZfuirsLh5p9TG3ZOs3AWiTtNbAQpp4yiV1q/ugcJVQuKCh8CtKedocKABwwxM58eoDtaRYqyaGbJBylyrfI6WTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(64756008)(8936002)(53546011)(66476007)(66556008)(71200400001)(508600001)(2906002)(6506007)(86362001)(38100700002)(122000001)(186003)(52536014)(26005)(8676002)(5660300002)(33656002)(55016002)(9686003)(7696005)(316002)(38070700005)(107886003)(76116006)(110136005)(4326008)(54906003)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2ppOXBORDBsUzNBV2JqNTJCNGx3Mm9oa2p1RUIrM3NQZXllUUxrOUxSSFdo?=
 =?utf-8?B?cTlZZXBkNllOL1dkd0xJeVRwWFdFRGhKc1BCL3I0SHFLZGZSWWVOM0t2SUJv?=
 =?utf-8?B?YkdWWDl3R0Jaa0YrNFd2MGcrS2RqZ2hMcG4xdmR1V2hpQnhVUzUvQ25iQmRC?=
 =?utf-8?B?bS9tOHg2dW5rSjN4RHo4MGhGLzFGWk9qMFBvT2VKdGR3Z292U0ttdjEzOHZ2?=
 =?utf-8?B?RGYyeGxiazYrdS81VnZ4alptR2FhWDQ1U0E5aEJYb09WNFNpL1NVanE5aWtM?=
 =?utf-8?B?bXhmTGZTbkN4MS9IbWtNOEtDcTB5QmsrOE1OUWNNb2p1TjJTdjBraEovb1lU?=
 =?utf-8?B?RkNrTVU0UmVtb2g4VHd2eTFOekRFUnYybXYrblJleTB1R2o5QndZNFAyUkxi?=
 =?utf-8?B?a2NwQmFqOGdvQVowbGZNRFhPeFgycnVrcTZPeVIyNFlJUzVackgvUmRJWU5O?=
 =?utf-8?B?c0pqZVNWc2cxK3B1aEg4Y3F0Y0p6MC9FaTFpYzhPRFJrUlB2U0craDk1S3NK?=
 =?utf-8?B?d3JPalpIU21UcmNuYXJ3TWxDTmEvUXRESTRlNngwSHhWa3ZQQ2dIZU0wZ1hy?=
 =?utf-8?B?ZHRCQ1o1bCtzU0JWdnVSUmFMOHIxSU5QWlFCTk9CaGxLZUNNaVA1VnJVblNU?=
 =?utf-8?B?Q1hrSTlvMmlLci9pei8zdFI1ejZyMGljMFl1QWMrNHhRNzBoRmVOdTJMOU5L?=
 =?utf-8?B?VnVTYzdvZnBIUFBvQlk1eUJnMFZKUTMrZHJIalBUQW9HZlYrRXFrNXZ0Y21E?=
 =?utf-8?B?NUFNOFhEcm50NzNVQ3JCMGI3SlZGbFE5VE4yTHU3bWw5UnlFOUllOXJZZUxw?=
 =?utf-8?B?TVY1aW5PQXROeithTG5YV2FSY0QxaGl0d2ppV1QxZEduYVQyOHlSSWFUSWkw?=
 =?utf-8?B?MVlBNVdHZWdQOGxPcHdldVdzYnpQbno4c1N6dysxZFRuMUdPZ2VFL1dkVTJD?=
 =?utf-8?B?Q1k0Si8zSU02Z0I5eCtjQkc4RDdHc2k0RStBaU8yZHpFRi95aDFSUDZ2SEFV?=
 =?utf-8?B?SDExRU5xMnAzY2xWQlpYeUVRQkl1aVVTRzQ4VkEvamg4MFhDeVJvSTdlOStD?=
 =?utf-8?B?cDhLWDVGZThaWWpiWnpaaVdQRWt2UXNFeFRkTEc3Y3MvWUR5SVJwdHNBeXdM?=
 =?utf-8?B?T2dSYVRWTGUxNDlkeUVWQnhrUDlIZFlTSzNMZXhndnpFbjhoRlhnMklvNmtY?=
 =?utf-8?B?RnZuNkN0UjlRTFE3V1JsMzVzTDVuSlk2MTkwZkN2WkprU2plditkdktCYzdE?=
 =?utf-8?B?OWtrNElJbHdTb1NQN0V2aW5GUjZ2TlV1RHF0UUlwdVdFY3FUMnpVTnlvd2xa?=
 =?utf-8?B?cHB4V2tUZGVGcXVHWVVZKzdDTERzSEZKYnhJalRMdjNwbFJjMGYyd1puaXBM?=
 =?utf-8?B?bWYzREhhYWpZaGdYQUZpVlFhME9qWCtGWFZQMHhZK281YW1vVkRDNXRqSEJS?=
 =?utf-8?B?NERTc1kyTGQwN3ZIQmJSQm9mM2o2WFJWMGljR3BJdEJWMGM5R2YzYzVrZ3pE?=
 =?utf-8?B?VVQ0Q25sSythS3ByTmVucXNBL1VrdHNjMXVQRkUrMWlYcVpPc1YxT2RFM0NR?=
 =?utf-8?B?NWp0ZjdGNkQ1aUdyRG0zSE8yU1lYeFNpZzdnSnZjbVhBd0NsQUFLUElwcktE?=
 =?utf-8?B?ZlBPMlE4UEk2VFRYU2JKNTdOT2R3aGwvaUEveEsrcWFLcExRMW5TMU1zRFYz?=
 =?utf-8?B?akxWK2tUS0ZQaElRcUtwWWlBUG1wcitIMWxlc09VS1FERG5hWm1tWnVvaUIr?=
 =?utf-8?Q?poTjk4xVDkBnFL5FTjIotBxyex0cdn1ei9oho3n?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b437ee7-353a-4ca6-995f-08d97f666336
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 14:19:57.6250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lmjzne4C3ow9CrcxUJjYda9e/Rktr2QwTubcTd9OdoDyeCV3To009WQqDmhqsK43e4s0Qv/y4aS4L54DJghIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8685
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0
ZW1iZXIgMjMsIDIwMjEgMTI6MDUgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBx
dWljaW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogZjRidWdAYW1zYXQub3Jn
OyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHByb2JlIHRoZSBzdG9yZXMgaW4g
YSBwYWNrZXQNCj4gYXQgc3RhcnQgb2YgY29tbWl0DQo+IA0KPiBPbiA5LzIyLzIxIDExOjM1IEFN
LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHByb2JlX3N0
b3JlKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQgc2xvdCwgaW50DQo+ID4gK21tdV9pZHgpIHsN
Cj4gPiArICAgIGlmICghKGVudi0+c2xvdF9jYW5jZWxsZWQgJiAoMSA8PCBzbG90KSkpIHsNCj4g
PiArICAgICAgICBzaXplMXVfdCB3aWR0aCA9IGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF0ud2lk
dGg7DQo+ID4gKyAgICAgICAgdGFyZ2V0X3Vsb25nIHZhID0gZW52LT5tZW1fbG9nX3N0b3Jlc1tz
bG90XS52YTsNCj4gPiArICAgICAgICB1aW50cHRyX3QgcmEgPSBHRVRQQygpOw0KPiA+ICsgICAg
ICAgIHByb2JlX3dyaXRlKGVudiwgdmEsIHdpZHRoLCBtbXVfaWR4LCByYSk7DQo+ID4gKyAgICB9
DQo+ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQgSEVMUEVSKHByb2JlX3BrdF9zdG9yZXMpKENQVUhl
eGFnb25TdGF0ZSAqZW52LCBpbnQgaGFzX3N0MCwgaW50DQo+IGhhc19zdDEsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBoYXNfZGN6ZXJvYSwgaW50IG1tdV9pZHgpIHsN
Cj4gPiArICAgIGlmIChoYXNfc3QwICYmICFoYXNfZGN6ZXJvYSkgew0KPiA+ICsgICAgICAgIHBy
b2JlX3N0b3JlKGVudiwgMCwgbW11X2lkeCk7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBpZiAoaGFz
X3N0MSAmJiAhaGFzX2RjemVyb2EpIHsNCj4gPiArICAgICAgICBwcm9iZV9zdG9yZShlbnYsIDEs
IG1tdV9pZHgpOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgaWYgKGhhc19kY3plcm9hKSB7DQo+ID4g
KyAgICAgICAgLyogUHJvYmUgMzIgYnl0ZXMgc3RhcnRpbmcgYXQgKGRjemVyb19hZGRyICYgfjB4
MWYpICovDQo+ID4gKyAgICAgICAgdGFyZ2V0X3Vsb25nIHZhID0gZW52LT5kY3plcm9fYWRkciAm
IH4weDFmOw0KPiA+ICsgICAgICAgIHVpbnRwdHJfdCByYSA9IEdFVFBDKCk7DQo+ID4gKyAgICAg
ICAgcHJvYmVfd3JpdGUoZW52LCB2YSArICAwLCA4LCBtbXVfaWR4LCByYSk7DQo+ID4gKyAgICAg
ICAgcHJvYmVfd3JpdGUoZW52LCB2YSArICA4LCA4LCBtbXVfaWR4LCByYSk7DQo+ID4gKyAgICAg
ICAgcHJvYmVfd3JpdGUoZW52LCB2YSArIDE2LCA4LCBtbXVfaWR4LCByYSk7DQo+ID4gKyAgICAg
ICAgcHJvYmVfd3JpdGUoZW52LCB2YSArIDI0LCA4LCBtbXVfaWR4LCByYSk7DQo+ID4gKyAgICB9
DQo+ID4gK30NCj4gDQo+IFlvdSBrbm93IGF0IHRyYW5zbGF0ZSB0aW1lIHRoZSB2YWx1ZSBvZiBh
bGwgb2YgdGhlc2UgaGFzXyogdmFyaWFibGVzLg0KPiANCj4gU2luY2UgaGFzX2RjemVyb2EgZGlz
YWJsZXMgdGhlIG90aGVyIHR3byBwcm9iZXMsIHN1cmVseSBwcm9iZV9wa3RfZGN6ZXJvYQ0KPiBz
aG91bGQgYmUgaXRzIG93biBoZWxwZXIuDQo+IA0KPiBUaGF0IHNhaWQsIGlmIGRjemVyb2EgKGFw
cGFyZW50bHkpIGNhbm5vdCBiZSBwYWlyZWQgd2l0aCBvdGhlciBzdG9yZXMsIHdoeSBkbw0KPiB5
b3UgbmVlZCB0byBwcm9iZSBmb3IgaXQgYXQgYWxsPyAgU2luY2UgdGhlIG9wZXJhdGlvbiBpcyAz
Mi1ieXRlIGFsaWduZWQsIHN1cmVseQ0KPiB0aGUgZmlyc3QgcmVhbCBzdG9yZSB3aWxsIHZhbGlk
YXRlIHRoZSB3cml0ZSBmb3IgdGhlIGVudGlyZSBibG9jay4NCj4gDQo+IE9uY2UgeW91IGVsaW1p
bmF0ZSBkY3plcm9hIGZyb20gdGhpcyBoZWxwZXIsIHRoZSBvbmx5IHRpbWUgaXQgd2lsbCBiZSBj
YWxsZWQgaXMNCj4gd2l0aCBib3RoDQo+IGhhc19zdDAgYW5kIGhhc19zdDEgdHJ1ZSwgYXQgd2hp
Y2ggcG9pbnQgeW91IGRvbid0IG5lZWQgdG8gcGFzcyB0aGUNCj4gYXJndW1lbnRzIGluIGF0IGFs
bC4NCg0KWW91IGFyZSBjb3JyZWN0LCBkY3plcm9hIGNhbid0IGJlIGluIGEgcGFja2V0IHdpdGgg
YW55IG90aGVyIG1lbW9yeSBvcCwgc28gaXQgY291bGQgYmUgaXRzIG93biBoZWxwZXIuDQoNCldl
IGFsc28gbmVlZCB0byBhY2NvdW50IGZvciBIVlggc3RvcmVzIGluIHRoZSBvdGhlciBwYXRjaCBz
ZXJpZXMgdW5kZXIgcmV2aWV3LiAgV2l0aCBIVlgsIHdlIGNvdWxkIGhhdmUgYW4gSFZYIHN0b3Jl
IGFuZCBhIHNjYWxhciBzdG9yZSBpbiB0aGUgc2FtZSBwYWNrZXQuICBJJ2xsIGdvIGFoZWFkIGFu
ZCBtYWtlIHRoZSBjaGFuZ2VzIHlvdSBzdWdnZXN0IGhlcmUuICBJJ2xsIGNyZWF0ZSBhIG1vcmUg
Z2VuZXJhbCBoZWxwZXIgaW4gdGhlIEhWWCBzZXJpZXMuICBGb3IgZWZmaWNpZW5jeSwgSSdkIGxp
a2UgdG8gb25seSBjYWxsIGEgc2luZ2xlIGhlbHBlciB0aGF0IHdpbGwgZG8gYWxsIHRoZSBwcm9i
ZXMuICBTbywgd2UnbGwgZWl0aGVyIGVuZCB1cCB3aXRoIG9uZSBmb3IgZWFjaCBwb3NzaWJsZSBj
b21iaW5hdGlvbiBvciBhIG9uZSBmb3Igc2NhbGFyIG9ubHkgYW5kIG9uZSBmb3IgdGhlIG90aGVy
IGNvbWJpbmF0aW9ucyB3aXRoIGEgbWFzay4NCg0KDQpUaGFua3MsDQpUYXlsb3INCg==

