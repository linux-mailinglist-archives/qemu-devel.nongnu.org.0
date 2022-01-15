Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863548F495
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 04:38:42 +0100 (CET)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ztp-00064V-0G
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 22:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n8ZrW-0005IU-ID
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 22:36:18 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:19334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n8ZrU-0007ey-7q
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 22:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1642217776; x=1642822576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=sWg7izRtL87EVlTlHwydAbRciKagO9pcDHRhzHIy5ms=;
 b=jKVv/LdAZssY6LVgnMm5O8yxkKUpeJJkKh5GpSVC+8cwlGAAyEOIVhyz
 BPZYmhLRsuVsxDexhb+rQcPPC121Uq2ZzaEJsrxRjI2TBfffltWrzYWaL
 1/zPRPTEc+5IykpIQY+z6MPJfy3Y9Y/y3BJv4mBHAh/ZPLVxUH7ZIOWoX Q=;
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2022 03:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbp5nCWGb+zXQLowQdvq7gTvO55ifhC7XwJwUZjYUGAEYpaxMGLZxAWIIB/l3WD5nqIU6Zg19/1xFSd17T5m8tETv1lJp1CigrUwBFx/b/SzhTHYJQAwvafW3vrOa95KdIZvEMIdudIL7AQQRuJo2kedQ8aRojZQVVkPp5SIqu8yLBy4HMNlDMfflWMxrDqPRlLdb886hj3SyqwZch5lida+8xt6ggq3zX8Dg3x57bb4VtysL8KdrRcDXTcwNsWi3kvwkRnHm/QOZuRjqxKM2mjws6YG8mZlKK678WOT6ltw/i5XCydLcAYA8VvYgRBnXb/HjmtIWRxXI5bCJ2Xurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWg7izRtL87EVlTlHwydAbRciKagO9pcDHRhzHIy5ms=;
 b=PbKA614nyLb1oHNN4h4v72BUtaOIB8opL5zAD+ClEVQW23AaiDtA5ZxpMFrSaioLd0z+ymz4Au7AX/rfA6HMhVemmsmXkUefVqq+mZ8HicXhw/ubW7usUXd/gVif3Q59i6lr7xWVdOPveUUvhKVsFoFVojyxoaXHrl7oZbpFTbjih3dYN/Sg6NfHBo+U6AXJhQj3ozpo5xtBPqMdXTB2hWe/fZyoAo+R8mM604YM4suvY+0A9f8Sfcee7wKbqmsdIW3uOqdzR3AJEzQ6YPhlp3fLk5pL9COjinN/QZ6EYQZ3E0fRkrzvmv3S+xorHracuuEFyzLO8uhM88pCplu0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SJ0PR02MB7440.namprd02.prod.outlook.com (2603:10b6:a03:29c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sat, 15 Jan
 2022 03:36:07 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7%6]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 03:36:08 +0000
From: Brian Cain <bcain@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: hexagon container update
Thread-Topic: hexagon container update
Thread-Index: Ade25RCxllT+hUwlRb2vNrqCSUbc9QABASCAAABlCPAADdM14BSgmYTg
Date: Sat, 15 Jan 2022 03:36:08 +0000
Message-ID: <SN6PR02MB42050D02581C5FF732732D29B8559@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42059B3D252751BEDBB540C3B8AC9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB42059B3D252751BEDBB540C3B8AC9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694f916f-a669-4c6f-04f7-08d9d7d82adb
x-ms-traffictypediagnostic: SJ0PR02MB7440:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB7440C5F2B654098E8729B30AB8559@SJ0PR02MB7440.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UedHfVzMgWLpTUtgeuKgGIj+M3u0Y1aGbxD7u7C0lKbeU4w++C2wXHM2Exsps2Bj79hoTy1mIWKiYwtdOFOAacRXYZuKaI+4SFYGFi5E4haZ+yA5pRi74Sv5tGYY93Nja0OfM09PGIwx5BatCyZdzAtQyMWrqdPaiGzxqArx4fYSC+x96fVs4wqmvHPo1pNUF8QlK1zWrWVduiaOY4uKAEB4EVhpouDSzEhoNlquSuC1M924Tj7Ad+nfUdsx/r2syYXX8rgIdFNLpwCy9OB8Fxpu9ajV/CFMlXSSQ3NgGcPaWYxl3AQSSAMwz70jD4CBw/3SpxgJXyJ+Sfw00kN5gXmMErCpq2K49fosfMTbWrp/mRZgDdcURYYhaSI0biUS09rbfn0BuoKkOJ/pAui3Kt1uX7keYuQGmX27eqQ6VSvuFdjG/6GIX5hewTvkd5NkANbEx65d/lW4DgFRg31uEse7eAhrBdAcpGnOwIX+oFsTNvrqKuTKIuQ6mQjn2WSye9oRSfuZwgLRglgll25ejymrs22xEX2ukSY8XwtlQX1qDoGr7I7zLbL02HTqj1+MhKBHVWEv1w6cS7jV/CWvdG/ZJw1KzEvz8x1RathsMK0GVnwXZm25EJ5Ps+Xi+a9dIi5EZjvIdbZGZVDxBGUcoGIAIaNdJ1FwV1c6bREfnyd2SaE8FxJ2q53FV7gaEzbepNkpwKz9stpUA/VuyW+M9PV2oz4zdP5i6HWs4pcAHdKT4Cu172OPpinFL7DAvgOUmWs89pbB8WNSbwdoaZhOfWNdkRMiuIssPSAayNZGYGQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(966005)(2906002)(53546011)(66574015)(186003)(86362001)(55016003)(508600001)(7116003)(7696005)(4326008)(52536014)(122000001)(99936003)(5660300002)(38100700002)(316002)(107886003)(6506007)(66556008)(33656002)(66446008)(66476007)(9686003)(8936002)(15650500001)(66946007)(71200400001)(8676002)(64756008)(110136005)(26005)(76116006)(3480700007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anRvR2o0WW84dUtqMFl3eUhOT3VGcE44UmVwUURnZkhyNGlEN1cwM1ZwYWg0?=
 =?utf-8?B?R3M0WUszbldiaThTRzEvRTdlTG9oNXZuZWlTZG0ydUJNQ1dFcmIvSnYzdklS?=
 =?utf-8?B?VHBoQUtXMzBGZ1VpNTJsaE1PeUpzY0wwRitZZmRweFF5d0tCQWVyb3JJMVR0?=
 =?utf-8?B?U2VJck9rbCtIOVBMY2VmRStETnlBUGh6UzY3WTlJZENzRFNnTm9VTUhQYmdC?=
 =?utf-8?B?UmJuZ3poWHRNTkc4VFdlQUFMenc2dXZLbzFFaU5SUHBMYmhrNC9NMlg0UVpL?=
 =?utf-8?B?Q0tDQ0pOWUxIUWFIejFjTmJRNnNLRFV4SDV4ZkZQZHdXSUlQY2JBMDNUSmNK?=
 =?utf-8?B?WWVIK2ZIS3hsSnJqOGRjQTQ3bTNuTTdGam4wbFd2S3hReEkrZDdVYVB6SUE3?=
 =?utf-8?B?L01QeVhtR3Z3OUJiR25kbS9EZDQwNXdlZnRtMTdOSk10a1dtSHJ0b25HTjdI?=
 =?utf-8?B?YXZSUW5PMGlQOS9QTllpMTdQeGNlVllwckYzdjE4T0VsMmhvNGR3a0F0SnUy?=
 =?utf-8?B?VGgzbFRwaG5sL3E2d1lFTjhpZzZlb01MNEJFQjB4QUlKSE55SWxrL1htankz?=
 =?utf-8?B?QkZVU2VPa0JuTDJsVkluK1FMRmRiUTRhSlVLNytXcVdhL1NLTjZqUmFPTXFJ?=
 =?utf-8?B?ajRUdnBVd0YvRm90QkxuY1dsZW5Nc2ZzaFRkSXVDWXFQOWJveGRIT0lKQms1?=
 =?utf-8?B?MHFZLzlOcXNWSG54MHhyR29RSmNqT3VtYmJkVVEzSFZnNkpEUGNOYzlqR2Fw?=
 =?utf-8?B?WjlKNGJid04yMThxQnVPWXNoTkNUKzlsdExRa1JlcFUrQkJ4YTJjQVR5Q3Ez?=
 =?utf-8?B?bm51K2wxTFJZNUlJMmVWUktJTVpWWk1YSmFFZ2w2RWYxRktYKzExWjNEa0Np?=
 =?utf-8?B?MldSNWZoTFpIcm5rN2tES3VhdmIxcVlIUnBlcDdpWHlxYy9MVEs0bDFGNFNy?=
 =?utf-8?B?YTRFaDNpKzM1dVNRM0hzeldMZmx5aUlpRDRqemNndnhtSjJtQ3dPVnlTeDNN?=
 =?utf-8?B?dVJvZlAwTHk4dkxMUHhZc0NMRE1hQVhzTEQvRVBOTWZSNlFSNXBKaCtoZjhP?=
 =?utf-8?B?M04rZmlvWXVOcEhLNVQ3STdlRk8rVUY4dnJHUGp0angrTEowQnY1UUJ6Vmxp?=
 =?utf-8?B?cS9NRDY5RHFMdHRNSVBaM3RjM016RjVBSlRKR0FlWXJaSGhmM3V2WHdkajdt?=
 =?utf-8?B?RjlxWmJOeG83VDJ0QjlzUERGQ3hHa2xBUldoU3p2elhPOTVlMnVEZ2swSjZN?=
 =?utf-8?B?WUJxTE9BZEQ2eEdVK0FYaTU3VGtLNGYrMUgzSWg5UGlGYnpPS2FBNDNQbFM3?=
 =?utf-8?B?NHZBTTZnajduSyttRHVpUTBOclY0eFdRcWIxaTJGd1FVR3RQU1JENDhFZS9G?=
 =?utf-8?B?UjJ0TkhqZnVPeCsweVhrU0ZzVUkxVnUzUFlScjBkbjV2a0lsUTRrQVYwMitC?=
 =?utf-8?B?UGNrMHlydWQ3SnR5UE1FME12eEhYZWtqTW1QeURPeDJCZGh0NEZiMVFrNlpL?=
 =?utf-8?B?UGVURVczaDJrM3Y4REg3cDhDU3NITFg3S3QzUU9jZTRlMzBwajBCSVZLc2pm?=
 =?utf-8?B?VXJ2cEx2cHBZYk1tVlpaaFViMW5BeEsvOUlERmhmYmg1NWI5WTM0cXRRRjlh?=
 =?utf-8?B?Z0NsKzlNWEp0cDdrR2xSOE5GNXUxaTlQdElnS0tIM1hJZ1ZtRWw2eVNlQ0x0?=
 =?utf-8?B?Z3BsYm13UXg3K2FsQjhVdWFUR1JSL0djU1hFU3pHUENoR1JsdktIZVc2WHNt?=
 =?utf-8?B?UThxa0ZSUGhla0FFRmFnMDZ3a2thKy8vTVBldEZ0QUsrckcrUDA5a2JWaGpO?=
 =?utf-8?B?Y0JnZjIxUmp2MVl1VEk2ell5Q2ZqMzFmbW14Y1paVlNZSzhiQzE5WnI2VnRw?=
 =?utf-8?B?N0pHajUzUTFUMis3SkNBWXBvZ0IrNi9NZTFWYWtjU1FIWVR5bWU5b21YUnVx?=
 =?utf-8?B?c1VIN1padWlFNjdjeFZmczlQeFgvSCtQRC8yQnB2T3lsMDcvTmpTM2w3aTQ3?=
 =?utf-8?B?RWdxQnZ0S1NtVlRnaWtzYjgrV3VzdTlpc1RzQWwvMTZVNE0yY0h3NDNQR3hj?=
 =?utf-8?B?c3dzVVdoSWlBMFFxVjFFVVhobGZPVjZqZEdPUmRraTlEaTYxYTBQSEFKcDkv?=
 =?utf-8?B?QXlickdhdGd1dlMzV3BaZFVHTVBZVUg1c2wwQ3RFamN4aDcyMG11TWxkWVE3?=
 =?utf-8?Q?ZMprViDl7c1eG/zeHO717Oc=3D?=
Content-Type: multipart/mixed;
 boundary="_002_SN6PR02MB42050D02581C5FF732732D29B8559SN6PR02MB4205namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694f916f-a669-4c6f-04f7-08d9d7d82adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 03:36:08.0446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6XHp8k1RXnhWzCxX5qjZ8haIn+jBrIrUc6jGFQOVCfWKoVa4mDQBsIt7RP1LBiHuvs0yypbCU6WfUK9R+fZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7440
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_002_SN6PR02MB42050D02581C5FF732732D29B8559SN6PR02MB4205namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmlhbiBDYWluDQo+IFNlbnQ6
IEZyaWRheSwgT2N0b2JlciAxLCAyMDIxIDc6MjMgUE0NCj4gVG86IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJl
bm5lZUBsaW5hcm8ub3JnPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBUYXlsb3IgU2lt
cHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJFOiBoZXhhZ29uIGNvbnRh
aW5lciB1cGRhdGUNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBCcmlhbiBDYWluDQo+IC4uLg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+IEZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
Pg0KPiA+IC4uLg0KPiA+ID4gT24gMTAvMS8yMSAxMjo1OSBQTSwgQnJpYW4gQ2FpbiB3cm90ZToN
Cj4gPiA+ID4gQWxleCwNCj4gPiA+ID4NCj4gPiA+ID4gV2UgbmVlZCB0byB1cGRhdGUgdGhlIGRv
Y2tlciBjb250YWluZXIgdXNlZCBmb3IgaGV4YWdvbiBmb3IgbmV3IHRlc3QNCj4gPiBjYXNlcw0K
PiA+ID4gcHJvcG9zZWQgaW4gVGF5bG9yJ3MgcmVjZW50IHBhdGNoIHNlcmllcyB1bmRlciByZXZp
ZXcuICBUaGFua2Z1bGx5LA0KPiA+IENvZGVMaW5hcm8NCj4gPiA+IGhhcyBwcm92aWRlZCBhIGJp
bmFyeSBvZiB0aGUgaGV4YWdvbiBjcm9zcyB0b29sY2hhaW4gc28gbm93IEkgdGhpbmsgd2UgY2Fu
DQo+ID4gPiBzaW1wbGlmeSB0aGUgaGV4YWdvbiBkb2NrZXIgZmlsZSB0byBzb21ldGhpbmcgbGlr
ZSB0aGUgYmVsb3cuICBJIGhvcGUgdGhpcw0KPiBhbHNvDQo+ID4gPiBtZWFucyB0aGF0IHdlIGNh
biByZW1vdmUgdGhlIGV4Y2VwdGlvbmFsIGhhbmRsaW5nIGZvciB0aGUgaGV4YWdvbg0KPiA+IGNv
bnRhaW5lci4NCg0KV2UgaGFkIHNvbWUgaXNzdWVzIHdpdGggdGhlIHByZXZpb3VzIGF0dGVtcHQg
dG8gdXBkYXRlIHRoZSBjb250YWluZXIuICBUaGUgbGludXgtdXNlciAic2lnbmFscyIgdGVzdCBm
YWlsZWQuICBSaWNoYXJkIHBvaW50ZWQgb3V0IHRoYXQgdGhlIGFyY2hpdmUgb2YgdGhlIEMgbGli
cmFyeSBoYWQgd2hhdCBsb29rcyBsaWtlIGEgZGVmZWN0IHRoYXQgd291bGQgY2F1c2UgdGhlIHRl
c3QgdG8gZmFpbC4NCg0KaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5v
bmdudS5vcmcvbXNnODQ5NjM1Lmh0bWwNCg0KSSdtIGZvbGxvd2luZyB1cCBub3cgd2l0aCBhIHdv
cmthcm91bmQgLSB0aGUgYXR0YWNoZWQgcGF0Y2ggcmVmZXJlbmNlcyBhIHRvb2xjaGFpbiB3aGlj
aCBhdm9pZHMgdGhlIHByb2JsZW0gYW5kIHBhc3NlcyB0aGUgc2lnbmFscyB0ZXN0LiAgVGhpcyB0
b29sY2hhaW4gaXMgYmFzZWQgb24gbGx2bStjbGFuZyAxMy4wLjEtcmMyLiAgQlRXLCB0aGUgcmVs
ZWFzZSBwYWdlIGhhcyBhIHNpZ25hdHVyZSBwcm92aWRlZCBpbiBjYXNlIGFueW9uZSB3YW50cyB0
byB2ZXJpZnkgdGhlIGRvd25sb2FkOiBodHRwczovL2dpdGh1Yi5jb20vcXVpYy90b29sY2hhaW5f
Zm9yX2hleGFnb24vcmVsZWFzZXMvdGFnLzEzLjAuMS1yYzJfDQoNCkNhbiB3ZSB0cnkgYWdhaW4g
d2l0aCB0aGlzIG5ldyBjb250YWluZXIgZGVmaW5pdGlvbj8NCg0KLUJyaWFuDQo=

--_002_SN6PR02MB42050D02581C5FF732732D29B8559SN6PR02MB4205namp_
Content-Type: application/octet-stream;
	name="0001-Update-Hexagon-toolchain-to-13.0.1-rc2.patch"
Content-Description: 0001-Update-Hexagon-toolchain-to-13.0.1-rc2.patch
Content-Disposition: attachment;
	filename="0001-Update-Hexagon-toolchain-to-13.0.1-rc2.patch"; size=2200;
	creation-date="Sat, 15 Jan 2022 00:10:19 GMT";
	modification-date="Sat, 15 Jan 2022 03:36:07 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3ZGZjZDliN2U4MjdiYzc3YmExNTY5ZmU0YTExYTc4OWI0ODczZjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4KRGF0ZTog
RnJpLCAxNCBKYW4gMjAyMiAxNjowODoyMyAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBI
ZXhhZ29uIHRvb2xjaGFpbiB0byAxMy4wLjEtcmMyCgpUaGlzIGNvbW1pdCBtb2RpZmllcyB0aGUg
SGV4YWdvbiBjcm9zcyBjb250YWluZXIgdG8gZG93bmxvYWQgaW5zdGVhZCBvZgpidWlsZGluZyB0
aGUgdG9vbGNoYWluLiAgQWxzbywgd2UgdXBkYXRlIHRvIGEgbmV3ZXIgYnVpbGQgb2YgdGhlIHRv
b2xjaGFpbi4KCjEzLjAuMS1yYzIgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHZhbGlkYXRpb24g
YW5kIGlmIGFsbCBnb2VzIHdlbGwsIHdlCmNhbiBzd2l0Y2ggdG8gMTMuMC4xIGJlZm9yZSBtZXJn
aW5nIHRoaXMgY29tbWl0LgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2lu
Yy5jb20+Ci0tLQogdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3Nz
LmRvY2tlciB8IDEyICsrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMv
ZGViaWFuLWhleGFnb24tY3Jvc3MuZG9ja2VyIGIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2Rl
Ymlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlcgppbmRleCAzN2QyMWUxM2Y3Li4zN2UwNWU5NGJkIDEw
MDY0NAotLS0gYS90ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhleGFnb24tY3Jvc3Mu
ZG9ja2VyCisrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9z
cy5kb2NrZXIKQEAgLTEsMTEgKzEsNyBAQAogIwogIyBEb2NrZXIgSGV4YWdvbiBjcm9zcy1jb21w
aWxlciB0YXJnZXQKICMKLSMgVGhpcyBkb2NrZXIgdGFyZ2V0IGlzIHVzZWQgZm9yIGJ1aWxkaW5n
IGhleGFnb24gdGVzdHMuIEFzIGl0IGFsc28KLSMgbmVlZHMgdG8gYmUgYWJsZSB0byBidWlsZCBR
RU1VIGl0c2VsZiBpbiBDSSB3ZSBpbmNsdWRlIGl0J3MKLSMgYnVpbGQtZGVwcy4gSXQgaXMgYWxz
byBhICJzdGFuZC1hbG9uZSIgaW1hZ2Ugc28gYXMgbm90IHRvIGJlCi0jIHRyaWdnZXJlZCBieSBy
ZS1idWlsZHMgb24gb3RoZXIgYmFzZSBpbWFnZXMgZ2l2ZW4gaXQgdGFrZXMgYSBsb25nCi0jIHRp
bWUgdG8gYnVpbGQuCisjIFRoaXMgZG9ja2VyIHRhcmdldCBpcyB1c2VkIGZvciBidWlsZGluZyBo
ZXhhZ29uIHRlc3RzLgogIwogRlJPTSBxZW11L2RlYmlhbjEwCiAKQEAgLTE5LDExICsxNSwxMSBA
QCBSVU4gYXB0IHVwZGF0ZSAmJiBcCiAKIEVOViBUT09MQ0hBSU5fSU5TVEFMTCAvdXNyL2xvY2Fs
CiBFTlYgUk9PVEZTIC91c3IvbG9jYWwKLUVOViBDTEFOR19VUkwgaHR0cHM6Ly9jb2RlbGluYXJv
Lmpmcm9nLmlvL2FydGlmYWN0b3J5L2NvZGVsaW5hcm8tdG9vbGNoYWluLWZvci1oZXhhZ29uL3Yy
MDIxLjA5LjEwL2NsYW5nK2xsdm0tU2VwdC0yMDIxLWNyb3NzLWhleGFnb24tdW5rbm93bi1saW51
eC1tdXNsLnRhci54egorRU5WIENMQU5HX1VSTCBodHRwczovL2NvZGVsaW5hcm8uamZyb2cuaW8v
YXJ0aWZhY3RvcnkvY29kZWxpbmFyby10b29sY2hhaW4tZm9yLWhleGFnb24vMTMuMC4xLXJjMl8v
Y2xhbmcrbGx2bS0xMy4wLjEtcmMyLWNyb3NzLWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLnRh
ci54egogCiBSVU4gY2QgL3RtcCAmJiBcCiAgICAgd2dldCAtLXF1aWV0ICR7Q0xBTkdfVVJMfSAm
JiBcCiAgICAgY2QgJHtUT09MQ0hBSU5fSU5TVEFMTH0gJiYgXAotICAgIHRhciB4ZiAvdG1wL2Ns
YW5nK2xsdm0tU2VwdC0yMDIxLWNyb3NzLWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLnRhci54
eiAmJiBcCi0gICAgcm0gICAgIC90bXAvY2xhbmcrbGx2bS1TZXB0LTIwMjEtY3Jvc3MtaGV4YWdv
bi11bmtub3duLWxpbnV4LW11c2wudGFyLnh6CisgICAgdGFyIHhmIC90bXAvY2xhbmcrbGx2bS0x
My4wLjEtcmMyLWNyb3NzLWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLnRhci54eiAmJiBcCisg
ICAgcm0gICAgIC90bXAvY2xhbmcrbGx2bS0xMy4wLjEtcmMyLWNyb3NzLWhleGFnb24tdW5rbm93
bi1saW51eC1tdXNsLnRhci54egogCi0tIAoyLjE3LjEKCg==

--_002_SN6PR02MB42050D02581C5FF732732D29B8559SN6PR02MB4205namp_--

