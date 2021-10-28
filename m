Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C343543E5EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:16:43 +0200 (CEST)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg854-00028w-HK
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7lw-0002ZG-C9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:56:56 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mg7ls-0004Nk-12
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635436611; x=1636041411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PDYsmXUEmYG5sP6/TZKX8q2lHPhdnUThdhaUClPiruI=;
 b=kEe7NLZl018AQdWhv2Wo4fpss5pKr2dJ/j6jE7dUDhAKTaXUA4gdzRty
 /p2pSih8IGpVkSwFKqF/oap8VyDCyXzH6zMRnHwIp4XCHyxQAIKzqzBCt
 vjZyc7vfQX7mQBSGg3RqnGz9FJt4HaQAsYJJWqWLMq0E5Lg94hM0E5l5z w=;
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPmO3l+h5SKvvMtF8pNfhxIxJEQLEX/Vgg/cIet6QzYkDu/r8Tyoc5bBOMiapmk8gaQmBNBd1OhdV50Xm4ixnCsLG57yV9FQB2p7wbsWuxr+MK670+/R0OwRhahzMaLrUdf8RYgfuNJ0DIipynDunt1BZPjpk3052JzwDmqag4fex066yXV+hTnaXgHbKOo/ORUXAek7bkHsINkFHWcBvizOLuNcxrYg87RBbWGoSjyqTcwE/6Ky7kjX2wniGX1L1mk+puEGwLejVZqfm2dVy1eRjyhx6vl2idm2x0CCQliwHPQ9dUpJO0pf0BVQxKNq9bkAv02Oc9fzAauIGlWcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDYsmXUEmYG5sP6/TZKX8q2lHPhdnUThdhaUClPiruI=;
 b=ITMrHnGUjhd+9q5xYjEJCutXWyekRlQWC6lxRRStVpwZJIVI7WRulPrVXvptBz/N9P2k9uYAEh6V013GONbZrxSTTW8eji6R6sszUgIDbQyKDls3IdghXH8PkW4jI6CzvRREOjCcsrOYcFWLdUcHlelx1f7mFw0CYSD49tq0IoDD6n5Sqwlec8uB8baAiqI9PUuODOGJ5BEKjbXVbdZkPpKCRlE3K7v6Mwnu60ULf/6w/ZI/Kdpb8lKQ3SEC6xoUQV0MixN4Y5blvfzhsNzgTaH/3EteIBoK+QK2onr20OOJqZffZ/i8v3cPVSdOA/cP7r5kV7MtVRkT7YIdCv2H1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4176.namprd02.prod.outlook.com
 (2603:10b6:805:2e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 15:56:43 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4628.020; Thu, 28 Oct 2021
 15:56:43 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
Thread-Index: AQHXfWMqqFcgcKOnD065oDp4orZU7quXyTdwgEFmboCAD/x/QA==
Date: Thu, 28 Oct 2021 15:56:42 +0000
Message-ID: <SN4PR0201MB8808AA33C2D4901069CD3E7BDE869@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-10-ale.qemu@rev.ng>
 <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
 <1fdd3bba-e143-6d0e-51ce-6bf2914124c7@rev.ng>
In-Reply-To: <1fdd3bba-e143-6d0e-51ce-6bf2914124c7@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9c0c823-4201-4213-6d28-08d99a2b897b
x-ms-traffictypediagnostic: SN6PR02MB4176:
x-microsoft-antispam-prvs: <SN6PR02MB4176BD3D19870C2EF1EB74E9DE869@SN6PR02MB4176.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jdOh0LF2PMF4mTxk7Y/+4U9ju/naoZMiphmkDGvHhU1pDqt7tDuiN6haCdidoFh9d7/vrI8PtG+s6/IKb/j8itDmIqCnezgUaBNZDyy2iP76ZGGUNJl1u4z6gUGon9Sy+525SnZ1LZlSIKspfBlr5tf18wWspgwoGX826ftZFq3IlFigoRpaSMlOl/dt7xwFFuY2J/L801lRoCyobnXZ9ImKFoWhnfkpSilyf41zzkxte8qrfsmn1ffGYqo1y5szpmrokYnDQxyvPZT4Xd7XuI3ferJvF+UiuNZfZEO5BSfnRi3igD/MVGHyGd5DToLAsGDk0bgJA1aq2rXbB3phPcGhAq9VDtruEmb2HInUohf3amnsqev1B7OlRyDoMoBWuZHrxrzVWGAVkq6WzG97XtBJj874VijuBhTwd4z80hJWGbKzkdbY+ICqU2yrvTzrPtDHE8aBO5nHG4SqXMnQ80ZQhYrZ11QiKBfY/EpfBhEGligwwU0E1xyqcETo2GaDNA6AEh3szEwikVaXQj3KyL58vah7IV8QaUNFz/0qYXGf7uDcze3xMOm6HNXXngBVW4GK04bBb/y1K1zoW610IR2LPP4RJ/idHT1OZa1VCa7DrbOPIYYjk9k0qvZ4GpQHHdo9CknKnPQ1HrrEz67P4Mem4ju4aEwUIOD6J6LkBSPQcDXUzup2iYPKXFwmGo5JsD1v2NavqqMPIlBLYHUd/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(52536014)(54906003)(8936002)(86362001)(9686003)(53546011)(38070700005)(76116006)(55016002)(66946007)(7696005)(122000001)(8676002)(71200400001)(6506007)(66446008)(316002)(5660300002)(66476007)(26005)(38100700002)(508600001)(33656002)(4326008)(186003)(66556008)(64756008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzZiNTVINlhGakVDczZxNE9uTWtMOGdpRlY5bEVTUm9LODdrUUxqaFp4bHda?=
 =?utf-8?B?TE9ZTHNLNFNNVEptbmJjM1NLT1ZoOE9GdmQ1RU5SZ1lZY1QyVGxWOTFNcEpj?=
 =?utf-8?B?U1p0RUxHUDIycnh1ckE5eFVFZzgyNnZyV09uOG5vR2EyVTJkNDZ1c1c4Nzly?=
 =?utf-8?B?Z2ZVYzVzOGcrUEsweGc4MVBnZUxrSnE0OVV2a1dERzVnY2x1aGNGWU1heFpO?=
 =?utf-8?B?aTNXb0xjNFIxVFNGMEtSa1JGcSs2L0IxQXE5U1l5N2tacFhTTlFzclF1UmZI?=
 =?utf-8?B?TDhsZUFSd0lweWJudjNUZ1hHNG5LYVdKYldjeWNCOEthZlFOWjAyeUl1ZFNs?=
 =?utf-8?B?NnVTb1hYbFdEbGJDWjRPRWt1dVQwNjJUaTA1Z2p3UURNSWRzZ1ZncjVRdmpa?=
 =?utf-8?B?ZmRnQmZpSTFOOTV2OFNOU09UeG5OeGpmYzJkb2RCUURnT1M0ODlOanlOeHBI?=
 =?utf-8?B?V0lKVS82RWx2SXpxRHpPN2RGZmZEbFppblFnSXBZeHpiaGlQbmZlUFZONGwy?=
 =?utf-8?B?aU5udGlEZC8vUzZqelAzNVhPMG5wZGxuR1UrV1BTU0I0bDdFQWZOUnBzVTd6?=
 =?utf-8?B?cGFhTUEvMnpJQ2didnd3QWJsK3k4V2ptNFVwTzYwaG5EWmNDRDRVeEx4NFBo?=
 =?utf-8?B?ZzBpdWlkeEhPYnFJUFJiQlhxaGlmdDIzMVpUd0J5UFdwODc0bE00dGZHMmNx?=
 =?utf-8?B?Qkd6SzM3VTkvOVVLQjFFQmJNald5YVZsQXZLK2FubW4vanhDdjlDRTJsRWN4?=
 =?utf-8?B?WnhNd1NUSVVtQjExazNzZWRCNHUxdGJjUlRPMFhVMmpQd1BLdDNtV1RLd3Mz?=
 =?utf-8?B?U0Z5SVJZWU5CQkttK0VudmM3NWZRSnhEdFVHSHV1NXJ0VUJERGsvbmE2MTZU?=
 =?utf-8?B?UHNJTURuNDN5Smxwa1VPeXdCYmVwVkkwdFBORWpWYjJ4bXJpTTQ3NStURnBn?=
 =?utf-8?B?TWM0ZDdLMUxnUGJ0Y3VNaFo4VmVqeXFyY2pPb1J1bWplNE1PNHJ2QnFVOC9q?=
 =?utf-8?B?NVJPN3lrci9oMmQ1ejdqQkE4LzBsRmtaNk9iM09uSVloVVgyL1l3MXkvTWo5?=
 =?utf-8?B?OHllTlRNSXdTQjNaSktSazdoUmxYdnZWdndNYUl4ck1PYmZiRVF3Q2g1bHZV?=
 =?utf-8?B?Z1lIVEtiMWpkTWxWTDd5djkvYzg5a015bzk2VU82VkluYzlDSmdKeDZiOERn?=
 =?utf-8?B?RGl1RTRWRXJpc0lDUGhYVVVrNTlncktmMFVhSkhCSnlZdVFieDJ1MzVEdjNv?=
 =?utf-8?B?NzBTcHRnelJTT2lLMjN1OGRHcnArY0IxbmE5eUVLOTJXQWlkTHN1VTYwOXJB?=
 =?utf-8?B?ZGp3aWEzVWZCS2xhZ2tqdDY4eGUxK2luQytDMVp6SDdaUW4xYVNtQjZvc2tC?=
 =?utf-8?B?UllKckdLdm5KWmdoQnFNSzlJdEtaRTRuV2RyWHllb2ZDb2hHenFtSXpMYjhT?=
 =?utf-8?B?RWtiU2NDQWxNQTVBMXFkWUU4cUpjc3Nobk5iRkVBYzQ2VEQwaHpMQllUaXpW?=
 =?utf-8?B?R1NYQlkzalRzN1lxa3UzZmNVVU9xT2RIU0lGVjM1UEhXWTNDUHVaSFlWM1hM?=
 =?utf-8?B?ckZ1R3ZhNytKbFdxQnpyMHFYMTdEWFhobmxlSitPY0U5RDJtd1BSVUhsQlYx?=
 =?utf-8?B?WnZRNTZFY2FhR2w5c1JIMVJTQU9rekMrMzlOWWtMSXlGbFR2ZkhhcytTWFpv?=
 =?utf-8?B?dVluVHFDYkhrTUxMNWJRY0tZb1JvZUJKb0RnRGMyM1dRS1BIU2lnOWZSWTZR?=
 =?utf-8?B?VWVtU2w1RFBZa1EyZC9Vcm1Zcmt1ZEJIb0xuMkZ1R0FPNEFOQ2hPbzg5MEJT?=
 =?utf-8?B?WHFMT0Z5UG9uMi91QzYrdFhQM1Q5SmtZZWpuVVpMNlQ5N2V6STlyeXM4NGVC?=
 =?utf-8?B?Ym1yN1VmOXA2MndDb1doWDY0ZzdGejZGUFd3MDBpSmlPZ09MNTR1dWxORGwv?=
 =?utf-8?B?SmFUWTcrOGN0OU00OVpEVEcxOC9yS1A2OXA2Vnk1Qjd0a1hwa1dUU0x4OVdl?=
 =?utf-8?B?RXRuT1pJYVBYUHZvaUtjSEd5SUN5Q0NadjZKZGR0dUlDLzVkOGt1UExYUmVX?=
 =?utf-8?B?RXNZbzB3M2lxVndkNk1NQ2tRNWVqdHBSUEdjbGZqL2IxZVZ3MTB0bCtCZHlO?=
 =?utf-8?B?T2JmMjFUMGVWS283Wi9ONTNFSFQxT3J3NHYrMWJLSktybGlRUHdneHdVdzNP?=
 =?utf-8?Q?jgdYW3moYnMo116qHw2bplc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c0c823-4201-4213-6d28-08d99a2b897b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 15:56:42.9538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VU9ugixgont4FnyB9DQe5+e3IWsuYfDwmVfum8LMhCJJialhL0wDBsmndnrlwF0K9fuRTEeta+SZNbAFiH58yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4176
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gRnJvbTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4gDQo+IFNlbnQ6IE1vbmRh
eSwgT2N0b2JlciAxOCwgMjAyMSA2OjQyIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+OyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGUucWVtdUByZXYubmc+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnOyBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDA5LzEyXSB0YXJnZXQvaGV4YWdvbjogaW1wb3J0IHBhcnNlciBmb3IgaWRl
Zi1wYXJzZXINCj4gDQo+IE9uIDkvNy8yMSAxODowOCwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+
ICtIZXhWYWx1ZSBnZW5fcm91bmQoQ29udGV4dCAqYywNCj4gKyAgICAgICAgICAgICAgICAgICBZ
WUxUWVBFICpsb2NwLA0KPiArICAgICAgICAgICAgICAgICAgIEhleFZhbHVlICpzb3VyY2UsDQo+
ICsgICAgICAgICAgICAgICAgICAgSGV4VmFsdWUgKnBvc2l0aW9uKSB7DQo+ICsgICAgeXlhc3Nl
cnQoYywgbG9jcCwgc291cmNlLT5iaXRfd2lkdGggPD0gMzIsDQo+ICsgICAgICAgICAgICAgImZS
TkROIG5vdCBpbXBsZW1lbnRlZCBmb3IgYml0IHdpZHRocyA+IDMyISIpOw0KPiArDQo+ICsgICAg
SGV4VmFsdWUgc3JjID0gKnNvdXJjZTsNCj4gKyAgICBIZXhWYWx1ZSBwb3MgPSAqcG9zaXRpb247
DQo+ICsNCj4gKyAgICBIZXhWYWx1ZSBzcmNfd2lkdGggPSBnZW5faW1tX3ZhbHVlKGMsIGxvY3As
IHNyYy5iaXRfd2lkdGgsIDMyKTsNCj4gKyAgICBIZXhWYWx1ZSBkc3Rfd2lkdGggPSBnZW5faW1t
X3ZhbHVlKGMsIGxvY3AsIDY0LCAzMik7DQo+ICsgICAgSGV4VmFsdWUgYSA9IGdlbl9leHRlbmRf
b3AoYywgbG9jcCwgJnNyY193aWR0aCwgJmRzdF93aWR0aCwgJnNyYywgU0lHTkVEKTsNCj4gQXJl
IHlvdSBzdXJlIGV4dGVuZGluZyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZT8NCj4gSSBi
ZWxpZXZlIHNvLCB0aGUgZlJORE4gZGVmaW5pdGlvbiBpbiBtYWNyb3MuaCBhbHNvIGV4dGVuZHMg
aGVyZQ0KPiDCoCAjZGVmaW5lIGZSTkROKEEsIE4pICgoKChOKSA9PSAwKSA/IChBKSA6ICgoKGZT
RTMyXzY0KEEpKSArICgxIDw8ICgoTikgLSAxKSkpKSkpDQoNCk9LDQoNClRoYW5rcywNClRheWxv
cg0KDQo=

