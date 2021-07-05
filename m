Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860F3BC3EA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 00:33:03 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0X9C-00032s-4T
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 18:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m0X8N-0002Ni-If
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 18:32:11 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:24983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m0X8J-0008Db-Ik
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 18:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1625524327; x=1626129127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/mofng8JiVscvyCtBjFWg/VCxtJNyZScVDHz+Wakgp4=;
 b=M79thQEZaJ8KtxFJg7IdO0t6/YhIRCX4A0LUU7gMXfhOk2RAupMjingt
 ul0168+3lcmKN71aCXo7TnPcR7jREzi++RSgDJ05LHMtPVATaTtyj5rHl
 R7TEhKafTS4/a9vwKOnrn1Y+rskSE1vu5fqQyIZiqUDEuuy3HA/wyi+Y3 0=;
IronPort-SDR: DkiJCqTCyraJxJy1ojQ1rBPY54bDXIAt6xXRf6HhsjxhsKxzN8kgeQmAq9q25bBu5Nc+Uxat2g
 vp5I2j/mX+N2bXdEd1MMgl/sj8Wjx2GxH/Kc5eRl8CBbTw5Mqg0Z+7vPs4iIMc48M/BM6cfrNW
 SfeKSAcSut8UupaaEsgIT/nemx9NrAhNiRDDUd/fC7xl+Sl2UBFnn5wLK6lhyAG+jAa4VcDpjY
 e7YQfqhOVA2qBevwfses+r9MDoQ3AJB1hiu4zk3qjGcOD8jytyfI8/3LSXFh9fWjsHO5641W/J
 rd0=
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 22:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2HN7F5gjRXovH4Qcg7GioGqGahG67Kdj6k/t42msBVLfo7ohxriUelS7eQwjnDWgN0zet4rFc7hc/YwVhmIuESaAJTUjoTm0xhP7Zsb4pVre5cM7IDL/Nx6z3Hd4LqZGJrzIkb6OD9/RnKQN82bihCxvhQHX2HoBMXkSrSu0e5JEmPRvs531+ucHUVysb+PrWeySgoZvJFQrhXfrpdZao6p7mlGxUFjlQPMIGW4/2cPlx9D/tZXqBDBd1Z5McWnGLhTOPoL9Sg1MrAD8TdaMPJOFq/1WRMk5gM7IEGkMO7fkJVMLIpPqahzwB3wLDVAKc16G5qX05q5BjeGsf8BWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mofng8JiVscvyCtBjFWg/VCxtJNyZScVDHz+Wakgp4=;
 b=Slojp2/EdOLQ+NjpW+KR5WG+Tg0o7gFR3rJqdXFE7P06ZeVk5Ep4w0r8vdipqb5IjuTk+NSDyJo4zshcUFl+6K5vmQ76PAVWhEewDezT+suHYeKCx65HSQ/nE8NT8VE58vwGHXGhKerwNW8xBpBgfSTbVhvyKE8ajLx0JuWeXK4SVfOVaMKrov+ukW9nWjQyfugI0b0QSRX1L8RR17y2Oq8780i8HaUIsvvdy50UYo5LUQUViynrmqNVI7lxFSRiGZJJEOQh2v4/uFxMC0MfaLOVJkmfiJQ6jlpmJoWQbZIWgBEudbzRbGUg/Qn+ltCieabNfviIh6oFnWwDnpAWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4952.namprd02.prod.outlook.com (2603:10b6:a03:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 22:32:03 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 22:32:03 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 05/12] linux-user: Extract target errno to
 'target_errno_defs.h'
Thread-Topic: [PATCH 05/12] linux-user: Extract target errno to
 'target_errno_defs.h'
Thread-Index: AQHXcQPIoV7hMlQ7WUirNlTzJJdWnqs08ReA
Date: Mon, 5 Jul 2021 22:32:02 +0000
Message-ID: <BYAPR02MB48866EC448B5B75D75478847DE1C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-6-f4bug@amsat.org>
In-Reply-To: <20210704183755.655002-6-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [163.116.147.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af4744c1-7303-4b73-58ac-08d94004b62f
x-ms-traffictypediagnostic: BYAPR02MB4952:
x-microsoft-antispam-prvs: <BYAPR02MB4952E15AD2A175B9E9023EC8DE1C9@BYAPR02MB4952.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2cvtC5HknA4af8LvbcejgTlz97d4a4emzJORo2OE9S6oHUXrPkfzZqwrHUCBFn7tZtWKNgZ+2EV8ghtlL4ryvsEYbstcepw7v2h8VfzWNhjEnMNmwRCLCkc7Hi99IJub0wkh0vo6F3C1s3ZR7Ut21xUCOQNQtSuy07Rqb9FAp6w4viG+L1v6pwfQCP6B4Y+nLEdFIsO/xk2sHR3QlW9bOgA9bydhwglsRtuHduPnimCpg39F54Nw8KjkIHSqmrD2pnDivdrREVOxs5SJ/hhPLtQFjr+auTvzusUP/UvAnyTva0kgm6sTgFR9qrYKXezNLgl0LgGuZrYp0oSo4e10rLJzb9n26uvOOjsOo/NKFRJR1AR0Z2hJm3IzX9bIO5mB5KBuLXITpmoX7k696R+J74t32cjpRGcSyZGxdVV1ti1mr7jgDsXiVlN0xcnuyCgdWTwZeHweK3LjInX3bV8+Sw0OKOO3yP1yoGMFzboJ2bhCrbgKoj7pwcFIEAoXpnghmwn/x0lRJEecyV+LBdR0BF6/SnNPMOfhNudl8wgafU1KkHNKfqY3ikRDJxU5WI3c4JIBcyinqb98NxKCEHYJwQY2i1Mn1KlcYM0wUdwQUjrDugOj+mRG5xTJDTSjlKaf2TATgztAIBaL59tVesiCdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(4744005)(186003)(76116006)(5660300002)(33656002)(38100700002)(66556008)(66476007)(122000001)(86362001)(66946007)(316002)(4326008)(110136005)(54906003)(64756008)(66446008)(2906002)(478600001)(83380400001)(8936002)(7696005)(71200400001)(53546011)(8676002)(6506007)(26005)(55016002)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHlhQnoxelcrZzVIbHpUT05mWkt5MGwwUHhPbENQd2c4N3Z6bkVqdlpWUTdF?=
 =?utf-8?B?ZnpiVnBTUXpQeTFQVzFNaEcvSEFvSmtuUnVIN0dES21RUnZPSU4xV3g2YVpo?=
 =?utf-8?B?QzdPZENvRE9Db09DYXl6NllVcTBIS0lrRVdHeDhUcHJTUDNyTFBqSEc4VlBB?=
 =?utf-8?B?eWhIRWVBVUZ3dDBWR3RVRm9oNWpqU0g4UGt2UzNKbmJoY2NTMi9TV2ZKQlhJ?=
 =?utf-8?B?b25haGFxZ0w3NnZMMFBjYVNEaWhqY0RpRVNwNUhsTHlRZ2pQTXdKcmdkZk9h?=
 =?utf-8?B?UjZ4UnFhU01hdksxcGNOMXpJa0E5UTE2d1Y3RGs4VTNhdmx0c0JOSUs5VWVT?=
 =?utf-8?B?VHRUMFNMdDJ4ZmJpZCtGV1VacTNEazJ6UVQxTEh2ekhaN0l5RE9GajcvWXRB?=
 =?utf-8?B?c0VUNDRkOHlWU3ZDR0lWQllJZTRpbERmbnQ1YU9qckpScVlzUzdkTXg2bDBH?=
 =?utf-8?B?N2p6aVZ0OUovSEdKZFNIS1VSQVlWcFV6a2x4bGhOdXIwclp6WTl0eVV0a3VJ?=
 =?utf-8?B?SHRaWjN1dnEreUdQSlFYWXVPWEQxUFBsRi9IOGZuR0JveGxERC80eFJ6VnBj?=
 =?utf-8?B?bWZkRFpXZUFpb013bzV6SXRaMnZzc1graTdSbjdEbE9OSEhQcGNMNmdTeEdS?=
 =?utf-8?B?RGdrd0xURVZ2S0hLTU5DeDRXMHZRSk1kOGhraXYwQXVMcENSN3RyODQxNkVY?=
 =?utf-8?B?OEo1Q2wvcU82ZlhnNHc1VFhQak1RakwwdThaWGxidnh4cEU5clRqUVAvaVN1?=
 =?utf-8?B?QWlxNFBhTkZEUzBkRWJpdnZLSVNHUDAzTmVGTkFZUGV6SkRpOEFEK1cxcEZF?=
 =?utf-8?B?eE1jUXFPZHNsTEkrWUpwcm1JYWdib254bWFuaWpRSVhHeHIrY3dTaThCZFdG?=
 =?utf-8?B?bkoyQlQ2TisraUpqU1p0Y2NQdWVGek9wSUhJZjhCVk1qek1QamhOWFNEWkVo?=
 =?utf-8?B?RzU0UGpYMTFtSTRNa2dWUDAycU1na1YwdnhZY241TUNGOXAxZTloaStORTMy?=
 =?utf-8?B?YXdDV2dnSW9NbnI0ejJveDY1Sis0b3czbW9naG1vak1DL3ZTQUl2Mmc1SmNZ?=
 =?utf-8?B?ZnFBVHBpT2VPZWt3ZHJkN1V6aXAwcEYwZE91RCtnMmhvWk9YVWRDUTd4NDF5?=
 =?utf-8?B?aHN5MXZEN0pSL1VaV05xMGIzQjFNQVpvb0MvMmtDK3JsWWdGUjlSZ1NkbHQ3?=
 =?utf-8?B?SjlzT3k2OGJNeHkxb3NaK1Z4SFVwamxLeU1GUHAva3NhNzExektxeVlrMUlS?=
 =?utf-8?B?UHVPc2liMUJpSUNETU9pK3Y2VU1KeFF5ZFMwOEJ1bWZaWGhMUUlmTDU4cURZ?=
 =?utf-8?B?WFJXMFFxeXpTMEU1S1JreFc2V3U1S3VWcEtabHBKQ2lCdmpkemtXY0VoS0lC?=
 =?utf-8?B?RXl4L2VIVllmM0lidjJFdFZtSVVTRFdmZEV5cG1BZ2R6V3dwOVp6MU9OVzYz?=
 =?utf-8?B?VGVLMmx1SWdxZ2gxbWFVYlY0V04rSkhHL1ErR3RkRVdZd3JlOGFBVHpYb1Yr?=
 =?utf-8?B?ZEhERXFBNmxWRndpcmlwS094L2doM01sbWJPYVlOWEJ4alZDSnVtYiswU1gw?=
 =?utf-8?B?K1VNaUF4RU1VZzlrd0xWTFJpM3FLZEEwaW41cDExNGJVSHUxRjdMUmRJcDN5?=
 =?utf-8?B?c3FUQkIzMWtuSnVwLzI1dWdLQlB1Ty9UblpONHVFOFlxOCtsSUlyQlVmZG1v?=
 =?utf-8?B?dDBMVGIxcmVhd2dSRkYremNsU1dEQ0hQU2Q3ZURjN2dWSWNJejg3dy9XUGh3?=
 =?utf-8?Q?trwfs8/YsT4FxgvWsHUa/HPlSrY7/TldlxJ7/E1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4744c1-7303-4b73-58ac-08d94004b62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 22:32:02.8839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MzXjtfNAByxoOXyeroa4k79UYeT4ZOqXRNeHiaaLMLysyCR3/kP0+mB2kIFJx7Mf0mgBWpLX+nIf9too6Rk2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4952
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU3VuZGF5LCBKdWx5IDQsIDIwMjEg
MTI6MzggUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBKaWF4dW4gWWFuZw0KPiA8amlh
eHVuLnlhbmdAZmx5Z29hdC5jb20+OyBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+
OyBBbGVrc2FuZGFyDQo+IFJpa2FsbyA8YWxla3NhbmRhci5yaWthbG9Ac3lybWlhLmNvbT47IFRh
eWxvciBTaW1wc29uDQo+IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ow0KPiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVy
ZWwzMi5uZXQ+OyBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IFN1YmplY3Q6IFtQQVRD
SCAwNS8xMl0gbGludXgtdXNlcjogRXh0cmFjdCB0YXJnZXQgZXJybm8gdG8NCj4gJ3RhcmdldF9l
cnJub19kZWZzLmgnDQo+IA0KDQoNCj4gZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvaGV4YWdvbi90
YXJnZXRfZXJybm9fZGVmcy5oIGIvbGludXgtDQo+IHVzZXIvaGV4YWdvbi90YXJnZXRfZXJybm9f
ZGVmcy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwLi41ZGFh
YzRmNWE4Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2xpbnV4LXVzZXIvaGV4YWdvbi90YXJn
ZXRfZXJybm9fZGVmcy5oDQo+IEBAIC0wLDAgKzEsNiBAQA0KPiArI2lmbmRlZiBIRVhBR09OX1RB
UkdFVF9FUlJOT19IDQo+ICsjZGVmaW5lIEhFWEFHT05fVEFSR0VUX0VSUk5PX0gNCg0KVGhlc2Ug
c2hvdWxkIGJlIEhFWEFHT05fVEFSR0VUX0VSUk5PX0RFRlNfSC4gIERpdHRvIGZvciB0aGUgb3Ro
ZXIgdGFyZ2V0cy4NCg0KT3RoZXJ3aXNlLA0KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0
c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

