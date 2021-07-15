Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047423CA0B0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 16:28:59 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42MD-0007qE-Ki
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 10:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m42LG-0007AL-NK
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:27:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m42LC-0004UE-Ae
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:27:58 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FEIHEr027044; Thu, 15 Jul 2021 07:27:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=lA+AQXkATrN5PUsTm2O2XJb/cXJbqst8IZOZ54Vw1E8=;
 b=UQDetVb1C5QAMZBRMFC3I+ccWuRAURMSwfAK8hPu9w9Vv8MR4/0wmPj/0Co2LTbtbfYP
 SWYCYH7BXfsT+KTDBN2LwKembwUoUVU9EUZf3CUJ1nC1Opz9eNkELOUA9i/E/D6fARnW
 j66uedFhuayOXUM2GVacgJN3geJ0nRTaCpoCp6NfotNmSN3r4T8tP6s5/4LGP5zK+lJ3
 81DWGdVgwn+oB2EVuUOhZP4KG8dagMLtuGmX3p1e8727f5pBuFvabQwqPY069rIoq8ke
 6IH3N6QgwAwfLQfo0a8sQqy2jUzpm1m2Qp02PNSB9wX5jr/SIn0R784OEbv7YM7LVYg9 3Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 39tn47g6w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 07:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln5XSFug+irgRpH+JQJj4qiVE5sOGG4r46IE8wDz3/Dh0K/24qSxKrsYdB6KPVfxK5S2q6gH5PN1/08q0xtVtVtTxmfqr8lhTMOUvlm7PeXj3O9YB1ntHD0BIcBj7RtGjtFFyh9I5nr9qcDBntB0uS+Wyn2qgHD+XtCJQdqzQMz5962cP34gPqr6gMmhDEYqU7eeDh8C/v1lpWbTfyyOxRJVaH36RejDTD4L4OkLtKUkWG1GOOnnpfPkwbBLbuFkNgqmCho3C7GbrDPdH239eGOyO/q1ooNA361ehQLZ8V4F5+dHkoiUq5iNB8Be7OlEDW/HTf/qhsdDcD+lDHQt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA+AQXkATrN5PUsTm2O2XJb/cXJbqst8IZOZ54Vw1E8=;
 b=fuM/8aboZ3OX02gj6CxwdxTM4OZ5ZMwyzLtf35uIO+b/qrT6vr9ShSaFgesG3fYgneKPYRgkGbge1hkuM6aGOMLgNJLRLqEfGMdnyrY0KC4ok+Vfu5Nr7dXG1uIQvjJh+JkGFcMVChYZnMbIyR15yvE1lSbUGttWn/T8IRNmx8yxAWgPFIOBSrWDs6gLVbMtRB5dCRFZxIFV1v4gsKC5KzEw7xfewtqzIjbYoWp2yNPAkkUPGP5M6zNsJ34htOZzUQGF3xEhZMRTW3jAI9O97UTyvSdRlWIBKmDnCvwZWT3xkBGBQBXFffVpG2tkUECrOis3u0fNlO8CbmtkjyeKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH0PR02MB7914.namprd02.prod.outlook.com (2603:10b6:610:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 14:27:49 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 14:27:49 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: Question on memory commit during MR finalize()
Thread-Topic: Question on memory commit during MR finalize()
Thread-Index: AQHWF1blDKoce5BcwE+aLVbWV0XOZKiCivmAgAAd6oCAAKsXAIAAEMEAgsN1h+A=
Date: Thu, 15 Jul 2021 14:27:48 +0000
Message-ID: <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
In-Reply-To: <20200421104334.GC420399@xz-x1>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01c53a70-9846-4b66-ea4e-08d9479cb8d4
x-ms-traffictypediagnostic: CH0PR02MB7914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR02MB7914C497519ECCA11147F5C38B129@CH0PR02MB7914.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCaIRjXtXFbe8PPsAIZfvYUtD+BARLNVp2JpHRfRTxcDOX3w9E8MfXpjnl11UlTz8Ylxvkj5EGrqHnLuslka70YBFzrU5SiY0tipE6E6sQ0uKXlvTuWYf+pjCxLwlJpSNmKoI8d+PIDN6hygAYfFEQaJ6KZ1w0DnQYpVzlcw0O+/d9TQNHQceSqlSOuDvBv+CrOsJylIvvF6I0+vkBT80SrKLIlgVYIJIPLyJVVHHm5vectC4XhQwYRywF3VrjTzC8t7Nz1VOb54uJhAyVywPKyssTjiyascknPdY0/eouBvdHdIWcaoEtN+amSCW+G0//6LsTi3WE0QHnNXfYHdds7xuRIbBvJkbflHXU5B+ACNkiFx60cU2CzhYs3E9yb3k4OYOxasaf+eUXblvicJyj1bpD+TX1hbtbnvMBRVCaz9tlCWQT2ZYSsFHENRX8Mpr1A+EYUbWOUyvJXaS5XWrtceX/E1lyCd0BnF5uOYMfO9UBcyMsxG67upkK3Qoie2zDnE36bMQenutzn2WXuwPASGpOsXQAs6PGaYzIDT6WGoYOuv5KQsgEy/y65jq1vaJT9c2ZXe9T4VwfIzHWSn/MX2Kr7fsm2C0bVz5sEHzwyMTe8HgIR9iizvjTDvVZSINUdmaHgYzmd8GbM1hH3B7OobYUbV5s+HrzPQKLaclX8/t4zvQ7R0DZkCw2KeE0MOh91bWPDGdFl827vWr+0HrDGG0KtzYDE2fw3zQ+j/gWQreK0icfcOL1FDi99xh74G1T3BpWPNg2xw6J6uqbV8N92Eg/tNTeHwItkFQFkS2a3HqG9RX5sjUpQLSQlLzXK572QQz2NYxBPmWLDBhxICKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39860400002)(366004)(26005)(64756008)(66446008)(53546011)(5660300002)(2906002)(8936002)(966005)(478600001)(66946007)(33656002)(6506007)(76116006)(66476007)(66556008)(86362001)(186003)(55016002)(54906003)(83380400001)(7696005)(71200400001)(8676002)(44832011)(52536014)(316002)(4326008)(38100700002)(110136005)(9686003)(122000001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDMrTytUWlZ0TDZZVklSM09wVE9KNFd4bFh0c2h3b3Z4OTc4Sk0zUnp1SGRY?=
 =?utf-8?B?a1F2emlwUmhEZC8zYW80YUxtT3l4TzZHL2JQTE15eTJlRHZ6azM4REYzeU5z?=
 =?utf-8?B?dW53MHd2MnBFR2ppdzJnbEJiTDF5Wm1CeXBIa3lrMjNEMWJZR1pZRmJEemlD?=
 =?utf-8?B?c1lwbWxYMWtyQmtUUnNhWDNDMVdIclZMcGUwVzliKzBNcU9rY1pQVzQxYnRh?=
 =?utf-8?B?ci90V05RRGx4SkFQZFIzQmlvV3RNSElUUHovWUl2SHVKQWZrT2RmQ1MzdHdC?=
 =?utf-8?B?WFpNVTJYQTR3TkJlQ290eFYxaENwRVZDYUpPSXJ5WWdBRW1XU2NWQUU2ZUZi?=
 =?utf-8?B?M3F3RmR6QlgvWVlVWE9ZMnVxSW1uSzltRkU3eUo2QmFvRHBZZmtHNmFlbmxR?=
 =?utf-8?B?SjVpMFI4dDk2bVZtemxkbVhwQldhN0JmbEZGdGgwRVdHd3pJSHZzUUtKRDZX?=
 =?utf-8?B?ZWUyNDNwQzQwWjZpK0ZhQUNyVjRlNUprRTJZY2hLcmhWQ0pEUC9wZUZUVlJS?=
 =?utf-8?B?RVN3cXhIK1R2L25INkZDL3Q3STBRZGIyS1N4cUN6dTk5VW9HT1VpWTJqakZF?=
 =?utf-8?B?cjJabVJCMWgvM2NiQmhDWURtZVR5bVhyY1lLL1lDQWlNaS95a1hDVjg5Vzlq?=
 =?utf-8?B?UmNQRERZWE9Ib3BSZE9WYklOc0lMTVl5TlBCSWJwNmozdUtXSHJsMGdsWHJV?=
 =?utf-8?B?YnRYUGt1bXowZVNNdXlod0hjU0c5c3IxTm9xajY0dlFPU0xTaGtOOENZdWdq?=
 =?utf-8?B?eG0vUWtlajVYL1Fja21KcVMzcEl6bEV0a1BWU296eFp2L1lZSWxOUDRENGtJ?=
 =?utf-8?B?NG5JbGd0cjQvb3hwM1BDRU1VZzFmbFNLVVhZYnZXTmdyUXB4TzFCSy9SUkor?=
 =?utf-8?B?MlNCRkFtbVFjT2MxazkwS2VRcTYrQjB0QmZOelA5MHg0T1hhK0xlWUxicTJC?=
 =?utf-8?B?UWJFVDVNck9WQlFGK244R2liTHJMZmYrRzJBelVxdlk3ZFlSTmg0aTRVRW14?=
 =?utf-8?B?cHI2LzQ0NjlLTUFtMTFnVTVNTTYxV2J3OE5oakMvL0FwMmFzQUcvc3QyTDZL?=
 =?utf-8?B?VzRUUkxmK002NmlqYWRUWmFUL1JwQVdWb1QyRk1mZThGMjIvUHljQ2cwbXJJ?=
 =?utf-8?B?OURoRWo5dHRFQnFyWHpCdmxEaFQ5ZjZHRTJZcXdRMzBReW12WG9HekYvdE5B?=
 =?utf-8?B?Q1FWNFQvd2NlL0VFWU4rdzkyMFZ2K1pZcFVRS3hOamJsbnRRVWZSU0lYcDAy?=
 =?utf-8?B?NlFUVmgyWEVBeXNPQkVGOW84MFA5MWRxY2FHZkN5YkQyaEFVais4NGE5WnZD?=
 =?utf-8?B?TzZwNmlsZC9XYmlSYURtaW9aQUI0TnZ6N250ZHcxbTdoVjRhVDkrRmpYYkls?=
 =?utf-8?B?T0pWSVF1TzJBWnhUZzFaTUJPZkZZY0Y1bFFFNCtjMUNLV1RPWEZxM3BxMnFT?=
 =?utf-8?B?VytaaVVGeENYYXZqbVpRL1FTV1kvOHZybXc5OGUrSnhlbnhYa1JPdEpWRjJo?=
 =?utf-8?B?TWZxVGdoQnpPdHFQZjhQYjg5WnMxOGdxSXpUbm01TjcyRDdSUkx1dmc4ZVNY?=
 =?utf-8?B?cVRHT0pqNlNYa2tIZW9FU3JzYmhyamJxZUZ5SDRKWlhUeGIyMXhFYy9CY283?=
 =?utf-8?B?aHhDcE40alhxUVZXWHVYVC9KSnNVQm5taFk2cElOa1l2cVJPcW1QUGV6anEz?=
 =?utf-8?B?OVYrV0w4bnVlU3Z4Q2hQTUg1WVJtT3RybTNpaEgwVEdoYnFNNlN1eXJ0emxv?=
 =?utf-8?Q?VR5/JNuSY/g9wuklKQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c53a70-9846-4b66-ea4e-08d9479cb8d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 14:27:48.9793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aodqKHeEJpHEzONAlrlEIk+j4JGIX990SdCTTUGPEWSdbxzD7Fqkx3O0gZlkGaYiwBtX/ReQH2XoOZ/P6nwqvBS6a16D2W9ej6mxTS+7Tt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7914
X-Proofpoint-GUID: ha-8HR85Dw4RKM-3W7bMEYApp3VC75kz
X-Proofpoint-ORIG-GUID: ha-8HR85Dw4RKM-3W7bMEYApp3VC75kz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John G Johnson <john.g.johnson@oracle.com>,
 John Levon <john.levon@nutanix.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWVtdS1k
ZXZlbCA8cWVtdS1kZXZlbC0NCj4gYm91bmNlcyt0aGFub3MubWFrYXRvcz1udXRhbml4LmNvbUBu
b25nbnUub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXINCj4gWHUNCj4gU2VudDogMjEgQXByaWwgMjAy
MCAxMTo0NA0KPiBUbzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gQ2M6
IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IFFFTVUgRGV2ZWwgTWFpbGlu
ZyBMaXN0DQo+IDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBRdWVzdGlv
biBvbiBtZW1vcnkgY29tbWl0IGR1cmluZyBNUiBmaW5hbGl6ZSgpDQo+IA0KPiBPbiBUdWUsIEFw
ciAyMSwgMjAyMCBhdCAxMTo0MzozNkFNICswMjAwLCBQYW9sbyBCb256aW5pIHdyb3RlOg0KPiA+
IE9uIDIxLzA0LzIwIDAxOjMxLCBQZXRlciBYdSB3cm90ZToNCj4gPiA+Pg0KPiA+ID4+IEhvd2V2
ZXIsIGluc3RlYWQgb2YgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9jb21taXQsDQo+ID4gPj4g
bWVtb3J5X3JlZ2lvbl9maW5hbGl6ZSBwcm9iYWJseSBzaG91bGQgZG8gc29tZXRoaW5nIGxpa2UN
Cj4gPiA+Pg0KPiA+ID4+ICAgICAtLW1lbW9yeV9yZWdpb25fdHJhbnNhY3Rpb25fZGVwdGg7DQo+
ID4gPj4gICAgIGFzc2VydCAobWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9kZXB0aCB8fA0KPiA+
ID4+IAkgICAgKCFtZW1vcnlfcmVnaW9uX3VwZGF0ZV9wZW5kaW5nICYmDQo+ID4gPj4gICAgICAg
ICAgICAgICFpb2V2ZW50ZmRfdXBkYXRlX3BlbmRpbmcpKTsNCj4gPiA+IEFoIEkgc2VlOyB0aGlz
IG1ha2VzIHNlbnNlLg0KPiA+ID4NCj4gPiA+IEFuZCBmaW5hbGx5IEkgZm91bmQgdGhlIHByb2Js
ZW0sIHdoaWNoIGlzIGluZGVlZCB0aGUgYnVnIGluIG15IG93bg0KPiA+ID4gdHJlZSAtIEkgZm9y
Z290IHRvIHJlbW92ZSB0aGUgcHJldmlvdXMgY2hhbmdlcyB0byBmbHVzaCB0aGUgZGlydHkNCj4g
PiA+IHJpbmcgZHVyaW5nIG1lbSByZW1vdmFsIChiYXNpY2FsbHkgdGhhdCdzIHJ1bl9vbl9jcHUo
KSBjYWxsZWQgZHVyaW5nDQo+ID4gPiBhIG1lbW9yeSBjb21taXQsIHRoYXQgd2lsbCB3cm9uZ2x5
IHJlbGVhc2UgdGhlIEJRTCB3aXRob3V0IGJlaW5nDQo+IG5vdGljZWQpLg0KPiA+ID4NCj4gPiA+
IEJlc2lkZXMgYWJvdmUgYXNzZXJ0LCBJJ20gdGhpbmtpbmcgbWF5YmUgd2UgY2FuIGFsc28gYXNz
ZXJ0IG9uDQo+IHNvbWV0aGluZyBsaWtlOg0KPiA+ID4NCj4gPiA+ICAgIShtZW1vcnlfcmVnaW9u
X3RyYW5zYWN0aW9uX2RlcHRoIHx8DQo+IG1lbW9yeV9yZWdpb25fdXBkYXRlX3BlbmRpbmcgfHwN
Cj4gPiA+ICAgICBpb2V2ZW50ZmRfdXBkYXRlX3BlbmRpbmcpDQo+ID4gPg0KPiA+ID4gV2hlbiBy
ZWxlYXNpbmcgQlFMICh1bmxvY2ssIG9yIHFlbXVfY29uZF93YWl0KCkgb24gQlFMLCB3aGljaCBz
aG91bGQNCj4gPiA+IGNvdmVyIHJ1bl9vbl9jcHUoKSksIHNvIHRoYXQgd2UgY2FuIGlkZW50aWZ5
IG1pc3VzZSBvZiBCUUwgZWFzaWVyIGxpa2UNCj4gdGhpcy4NCj4gPg0KPiA+IEFzc2VydGluZyBp
bnZhcmlhbnRzIGFyb3VuZCBsb2NrIHJlbGVhc2UgYXJlIGFuIGludGVyZXN0aW5nIGNvbmNlcHQs
DQo+ID4gYnV0IEknbSBub3Qgc3VyZSB3aGVyZSB0byBpbnNlcnQgdGhlbSBleGFjdGx5LiAgQnV0
IGl0IHdvdWxkIGJlIGdyZWF0DQo+ID4gaWYgeW91IHdvdWxkIGxpa2UgdG8gaW50cm9kdWNlIGFu
IGFzc2VydF9lbXB0eV9tZW1vcnlfdHJhbnNhY3Rpb24oKQ0KPiA+IGZ1bmN0aW9uIHdpdGggdGhl
IGFzc2VydGlvbiBJIHF1b3RlZCBhYm92ZS4NCj4gDQo+IExldCBtZSBnaXZlIGl0IGEgc2hvdCBs
YXRlciB0b2RheS4gOikNCg0KV2UncmUgaGl0dGluZyB0aGlzIGlzc3VlIHVzaW5nIGEgUUVNVSBi
cmFuY2ggd2hlcmUgSkogaXMgdXNpbmcgdmZpby11c2VyIGFzIHRoZSB0cmFuc3BvcnQgZm9yIG11
bHRpcHJvY2Vzcy1xZW11IChodHRwczovL2dpdGh1Yi5jb20vb3JhY2xlL3FlbXUvaXNzdWVzLzkp
LiBXZSBjYW4gcmVwcm9kdWNlIGl0IGZhaXJseSByZWxpYWJseSBieSBtaWdyYXRpbmcgYSB2aXJ0
dWFsIFNQREsgTlZNZSBjb250cm9sbGVyICh0aGUgTlZNZi92ZmlvLXVzZXIgdGFyZ2V0IHdpdGgg
ZXhwZXJpbWVudGFsIG1pZ3JhdGlvbiBzdXBwb3J0LCBodHRwczovL3Jldmlldy5zcGRrLmlvL2dl
cnJpdC9jL3NwZGsvc3Bkay8rLzc2MTcvMTQpLiBJIGNhbiBwcm92aWRlIGRldGFpbGVkIHJlcHJv
IGluc3RydWN0aW9ucyBidXQgZmlyc3QgSSB3YW50IHRvIG1ha2Ugc3VyZSB3ZSdyZSBub3QgbWlz
c2luZyBhbnkgcGF0Y2hlcy4NCg==

