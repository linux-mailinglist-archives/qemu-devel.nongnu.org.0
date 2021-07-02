Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455FD3BA278
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:03:32 +0200 (CEST)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKhW-0006IO-4a
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lzKfU-0004Wo-GL; Fri, 02 Jul 2021 11:01:24 -0400
Received: from mail-mw2nam12on2063.outbound.protection.outlook.com
 ([40.107.244.63]:33484 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lzKfR-00047u-D7; Fri, 02 Jul 2021 11:01:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly6n3jmqY78HQ1PCxJ2oB3FAGGDBXVBATuk3ZqvMU1mGjNhYqjrRANXyelAVd7ei/xQ/oHxU4Fh6S1UUdIUpyOPRffD+LI2chwVH2kBbtqL/HyjFPnOTMQUCj7CyQpAl0VZHaBgX/mI8u0oDkw4tlQwq9ZZpunewYqFqvP/MCIyaUJmpduwouI8TRl64cm6PDHTih44N2Ew1V3MbBxbUN+fwLL1laMTYgB98DHG7s1y6RJwJ9kVMtHJsm7NMFGJU33S9XN1iJ7ddMQXrgyPaTrQXODmYz8UlpqywuzImB9dcaKVYYgt7g3FvXmfJ+rnltVBmbQ0Vwp1Se1spN9eOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcMUk5QXD6wKNeAXOHJ2uhBOAxMl45ofHm/aEAi2vaE=;
 b=bQItHppj0BK+Iad6SiWMIIq1jxroBCA3z/LgS2pSceargx//NhLiUDmZYxixpUAfDTVMV2PiPC6QRetDpV/UL1IVYNkdTV5ZFnRiwDI84WjHFnHUbyZV5/AaI/JSxIa5iz/IjHCupd7+tsfCuWeaifXc1mbjIAfauoGahcQ22LD8KevDqWIl0jxDr7wCHBqGYqUz8+FBGqtMZ6vqbQuCibEfL13BbewCc+LOWmXlzWoU9u8d3wSXYsct+7rcYJMc7B5L++5gLnjlUu97+UTNjgciWW/YUMyEHtEEsnujqEVIRJrPh+2gmIiB2RXFDejjryOX8fnaO/u63P4VikdHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcMUk5QXD6wKNeAXOHJ2uhBOAxMl45ofHm/aEAi2vaE=;
 b=sW26kbXa+WwTBlLkbqiNs/U2SMT8QZ72xFFHGv3C+HGeQ41tTNDmPKl4gef27Fu6rXFJTdr5ICZh22AjPWFZuPE/gG+HvFdfMsWcI+7jokSLAxcEMUC4259zfVGYqRzbnDsvaW57pprctjQzDBQyrksZph5vjnYAiOqvojUkuOY=
Received: from BYAPR05MB5623.namprd05.prod.outlook.com (2603:10b6:a03:79::10)
 by SJ0PR05MB7438.namprd05.prod.outlook.com (2603:10b6:a03:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.12; Fri, 2 Jul
 2021 15:01:13 +0000
Received: from BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd]) by BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd%7]) with mapi id 15.20.4287.017; Fri, 2 Jul 2021
 15:01:13 +0000
From: Nick Hudson <hnick@vmware.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Topic: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Index: AQHXbMCSdfZjmXjSHUOdWVc01tqN36sqvr6AgAAOaQCAABNegIAEkVyA
Date: Fri, 2 Jul 2021 15:01:13 +0000
Message-ID: <79AC0C26-90CF-4F13-9480-ADD9D55E7408@vmware.com>
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
 <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
 <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
In-Reply-To: <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08738f7b-1581-4188-1b9d-08d93d6a3c13
x-ms-traffictypediagnostic: SJ0PR05MB7438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR05MB7438361F2762BC029B67A065C81F9@SJ0PR05MB7438.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wU6muobzDg06vROEu7ptqa7gdNAPCxjSWA4fbPcmvZjG4Egy60Ds3bPOvQ4sO83Y+DwG855cw5r3Q8rR0MPMl2ihUWEoFGYJrlVn0Ll1ajvVGkbgSpXlaBLFjl0t5LvgjlDM7mN6BOXBuCOEJW+otxRTgo9mU/VgDUkUbmv/LeYpYelVgGQL8AdT58I6g37exjQAM/pEN0KO1d8jR+msZcM67K+g4jeT4uad7wXKT+WR20VRUs5Z2siOuTJEjpDFGaFraZLwF1TkqqUyDFDz/becyJkeeME5pUiBBQyWvfe2n+O25rLfqzIqlT0ySMAnoq7hKLNY86WbB8OmYmFVzowqWbQZMtRJwtF8E6FFm1ZwVEUkQGcoOVu3QtR+A/1OwryBW+wcp6hmepXiYKNY31DL5dBTCiKhmmzp1ykVJ//7HBotXif8OtDbJUqalUrPzb7r980uXxkfcmpI3RC1CY28pUhDGZ0Xj37uFF8n4d8a2Ul5cQebIKmGpPsH3dxTRDUqcwQTY6uaA2z9yZodzvKUhv0AaALVP1JvN6DGk2rDiNW/Ur/jTAGAs7Vz9DG02oZaDbIdhMMJdcvhO61Vedno0YRYfoSbZIBqnOPWzjwFKL4J4DW8d+Um3iVNOlHJnJEJlmj7SyAuCRKbjKl1we+zPd4zE4TTS3qiyuQ2cYWhyxFg88+XE5cWm5xHUrrPS8iOxlwW3QD1wTe+Ia225g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB5623.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(6486002)(36756003)(8936002)(83380400001)(91956017)(6506007)(53546011)(6916009)(2616005)(33656002)(66476007)(54906003)(5660300002)(66556008)(64756008)(66446008)(71200400001)(86362001)(66946007)(2906002)(478600001)(122000001)(4326008)(38100700002)(186003)(8676002)(316002)(76116006)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVdvbC9VUDlPcHBxcHEySTNXalNHa3gzY3hsdXA3bnBQUmUyY2d4RmR6bnN5?=
 =?utf-8?B?TVM0V3hDSml2YTYzYTJjZTRZTXRmVGhib1VuY3hOTlNpbHNmYUg0YU0zNTdE?=
 =?utf-8?B?VTdYUXZTYVBLUm82UHhQWldpbmxWUnZTWlc1eHdTcXBRdGU3dUNpU1Ziajhj?=
 =?utf-8?B?TEdFSlB3QWMzNjEvT0wvOGJPbjZxTTYvdmZjNy8zV2kyYVF2eldJaFp6UUVa?=
 =?utf-8?B?bHh6OFhSK2g1SWI4QmlDNVYxTUZMMnFqUzJJMCtDR0Q5MDBSeFF6bko4Y3Zr?=
 =?utf-8?B?TVRQaVF5d1RoblV6d2lXZGRFdUt1Z0dMRy85ci8yUm9XaG9MZ29DUWxsQm1Y?=
 =?utf-8?B?eEM0cGVyTE1rZzZMUG1ObStmRTY2c0RnV3FvRU00bURQNmVWMkRqYUMvOU9j?=
 =?utf-8?B?VmhRS1B0a20vUjA4MHg0WU5ua25ZUWhTVHEyVWpTTFNHdHZJdFNZRG43R0pB?=
 =?utf-8?B?V2g3ams5Wjl6UWorSTJFVkRjTnJqZTEwTFJBQ3FmZkRCYStzWk84bHExQzd2?=
 =?utf-8?B?eTNCWUxjSzFBMWNhdTZVTGh6QTUzaXZGakE0azdwWWNLMVY1bEV0OUJsV1pX?=
 =?utf-8?B?YldrazBmYnZIaTU2eHQ3MksvYzRtL0RuQmUzTWFBQU1hUVh0Qld1enk2R1dm?=
 =?utf-8?B?cVBoTGdveDZrdWswNTNLM3ZXem9jektXMlhESVd4U0VEeWFNOUc1bnRrc1pB?=
 =?utf-8?B?amh2Vng3THgwbUhBT0RRKy8zdVlFdXBscmFMaVQrVjRyeWNhZzhCbFlEaFNN?=
 =?utf-8?B?NnhTWkt5ZWF5bzZ3dGJtZ0ZMUEkxWFZFR0VHdVBTbnJFQnBZUkhnYzdQRzUz?=
 =?utf-8?B?QVlqRnBCTmZ2dHAzcXppTWRMRmluSjFKSEpXZ2NKNlQ3MlBlZjJqNHB2Sm44?=
 =?utf-8?B?cjdXUDlZVEt0anZMSlBVckNpTHJlS3ZJcWtzOWtCdmVkamluN1V1ZElCWW8y?=
 =?utf-8?B?NGdWY1BJdWJRdW5aOG9MTGcxOWpJaERNdm56eHREL0NzVmhOdkUwZm1MSWsx?=
 =?utf-8?B?aVBmQVVXeThvbmdpRGJJMzY0N3NxaHlnYjF6amNoK1FIbCtJejFNSlFnMU1h?=
 =?utf-8?B?aC9LMHZ1cHU0MVhBRWR1a3p5WXNQK0tLQkVQRmZmNnBTdmFUODFMcjViZlJJ?=
 =?utf-8?B?MDlIaFJ0dzRwZHhCOS9VNExqT3ZNeUV3bmV6R3N1K3BFNEFHYkZiRHkrVTJL?=
 =?utf-8?B?bURUZDcxR2xZNkQ2OURKQ0x1N0dxa2NEelBWWVB5S3hGc2tkVjV5OGJxY0Ju?=
 =?utf-8?B?cGVaeDEvUTBpckRER2dqZ1dmdjlyUFQrUFNJcWprTHF0VFVLZ1BWS1g0M1Vh?=
 =?utf-8?B?RUhHbTRvck41N3hqck9YM0pNaXhQYUprRVIrSWVPNlgwYVRTQkduV2dDT1pH?=
 =?utf-8?B?UktneHFCMWhZSDBYOVJMZTJDQmhaclowNU9XN3pQcVFVVnVWZnZ6NHdjbGw4?=
 =?utf-8?B?WldXRTROVUN1c3JJaEI2SW9qamJzQit3SkdkanpsdGpra1dDeEEvMVhyUmpx?=
 =?utf-8?B?TnpVRjRCOGc2QlMvL3dXck9hSXNSZnBDRSt3K0FBZXVqd1NZWFBVU0JXVU1a?=
 =?utf-8?B?ODltN2NnUGRyT2VJcDRZWHFnSmdlRGMwd0g1QmJyMjJVSjZUMWlodm5jZVd5?=
 =?utf-8?B?MVhlL2k4cDNvMGh6QmFUS25NdnczK3JGazlZeUFyZHRab1J3bzdKS3RYUGZF?=
 =?utf-8?B?UzdxN0hvdG5sMjQrOGlBeDBwS29vbHZZOUx5TkxTZktXVnlTYzFmMXo5WVQr?=
 =?utf-8?B?YnoyTXFMOGw4MXMrN1Uwc0Vyemp0S1lwSE9CZlN1azFVRUdkWGljT013b0tX?=
 =?utf-8?B?dnE1cms3ZHFSQ0NGeWd4NUgyU1orR3FYWTgyTU1FYnprYWI0US9CZVFkckFi?=
 =?utf-8?Q?cqVvqgb0ZKCMp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE191C7AA0F50419C7C7B905E9C63F1@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB5623.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08738f7b-1581-4188-1b9d-08d93d6a3c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 15:01:13.1649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF/+GVaHM8aXvZkZuAx7475jNVaHyYWqKR3OpNojNUOtUA0xyEZXPUjBEje2QtrGoxWhTfYOpVzSqx8fllCpBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7438
Received-SPF: pass client-ip=40.107.244.63; envelope-from=hnick@vmware.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gMjkgSnVuIDIwMjEsIGF0IDEyOjUwLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAyOSBKdW4gMjAyMSBhdCAxMTo0
MSwgTmljayBIdWRzb24gPGhuaWNrQHZtd2FyZS5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0K
Pj4+IE9uIDI5IEp1biAyMDIxLCBhdCAxMDo0OSwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUdWUsIDI5IEp1biAyMDIxIGF0IDA5
OjI3LCA8aG5pY2tAdm13YXJlLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBOaWNrIEh1ZHNvbiA8aG5pY2tAdm13YXJlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHRhcmdldC9h
cm0vaGVscGVyLmMgfCAyICstDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vaGVscGVy
LmMgYi90YXJnZXQvYXJtL2hlbHBlci5jDQo+Pj4+IGluZGV4IGE2NmMxZjBiOWUuLjcyNjdhZjc5
MjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3RhcmdldC9hcm0vaGVscGVyLmMNCj4+Pj4gKysrIGIvdGFy
Z2V0L2FybS9oZWxwZXIuYw0KPj4+PiBAQCAtNjMzMCw3ICs2MzMwLDcgQEAgc3RhdGljIGNvbnN0
IEFSTUNQUmVnSW5mbyBkZWJ1Z19jcF9yZWdpbmZvW10gPSB7DQo+Pj4+ICAgICAqIFdlIGRvbid0
IGltcGxlbWVudCB0aGUgY29uZmlndXJhYmxlIEVMMCBhY2Nlc3MuDQo+Pj4+ICAgICAqLw0KPj4+
PiAgICB7IC5uYW1lID0gIk1EQ0NTUl9FTDAiLCAuc3RhdGUgPSBBUk1fQ1BfU1RBVEVfQk9USCwN
Cj4+Pj4gLSAgICAgIC5jcCA9IDE0LCAub3BjMCA9IDIsIC5vcGMxID0gMCwgLmNybiA9IDAsIC5j
cm0gPSAxLCAub3BjMiA9IDAsDQo+Pj4+ICsgICAgICAuY3AgPSAxNCwgLm9wYzAgPSAyLCAub3Bj
MSA9IDMsIC5jcm4gPSAwLCAuY3JtID0gMSwgLm9wYzIgPSAwLA0KPj4+PiAgICAgIC50eXBlID0g
QVJNX0NQX0FMSUFTLA0KPj4+PiAgICAgIC5hY2Nlc3MgPSBQTDFfUiwgLmFjY2Vzc2ZuID0gYWNj
ZXNzX3RkYSwNCj4+Pj4gICAgICAuZmllbGRvZmZzZXQgPSBvZmZzZXRvZihDUFVBUk1TdGF0ZSwg
Y3AxNS5tZHNjcl9lbDEpLCB9LA0KPj4+IA0KPj4+IFRoaXMgZml4ZXMgdGhlIGVuY29kaW5nIGZv
ciBBQXJjaDY0LCBidXQgYnJlYWtzIGl0IGZvciBBQXJjaDMyLA0KPj4+IHdoZXJlIGl0IGlzIGNw
PTE0IG9wYzE9MCBjcm49MCBjcm09MSBvcGMyPTAuIEJlY2F1c2UgdGhpcyBpcyBvbmUgb2YNCj4+
PiB0aG9zZSBzeXN0ZW0gcmVnaXN0ZXJzIHdoZXJlIHRoZSBBQXJjaDY0IGFuZCBBQXJjaDMyIGVu
Y29kaW5ncw0KPj4+IGRvbid0IG1hdGNoIHVwLCB0byBmaXggdGhlIEFBcmNoNjQgZW5jb2Rpbmcg
d2UgbmVlZCB0byByZXBsYWNlDQo+Pj4gdGhpcyBBUk1fQ1BfU1RBVEVfQk9USCByZWdpbmZvIHdp
dGggc2VwYXJhdGUgcmVnaW5mbyBmb3INCj4+PiBBUk1fQ1BfU1RBVEVfQUEzMiBhbmQgQVJNX0NQ
X1NUQVRFX0FBNjQsIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pj4gDQo+Pj4gICB7IC5uYW1lID0g
Ik1EQ0NTUl9FTDAiLCAuc3RhdGUgPSBBUk1fQ1BfU1RBVEVfQUE2NCwNCj4+PiAgICAgLm9wYzAg
PSAyLCAub3BjMSA9IDMsIC5jcm4gPSAwLCAuY3JtID0gMSwgLm9wYzIgPSAwLA0KPj4+ICAgICAu
dHlwZSA9IEFSTV9DUF9BTElBUywNCj4+PiAgICAgLmFjY2VzcyA9IFBMMV9SLCAuYWNjZXNzZm4g
PSBhY2Nlc3NfdGRhLA0KPj4+ICAgICAuZmllbGRvZmZzZXQgPSBvZmZzZXRvZihDUFVBUk1TdGF0
ZSwgY3AxNS5tZHNjcl9lbDEpLCB9LA0KPj4+ICAgeyAubmFtZSA9ICJEQkdEU0NSaW50IiwgLnN0
YXRlID0gQVJNX0NQX1NUQVRFX0FBMzIsDQo+Pj4gICAgIC5jcCA9IDE0LCAub3BjMCA9IDIsIC5v
cGMxID0gMCwgLmNybiA9IDAsIC5jcm0gPSAxLCAub3BjMiA9IDAsDQo+Pj4gICAgIC50eXBlID0g
QVJNX0NQX0FMSUFTLA0KPj4+ICAgICAuYWNjZXNzID0gUEwxX1IsIC5hY2Nlc3NmbiA9IGFjY2Vz
c190ZGEsDQo+Pj4gICAgIC5maWVsZG9mZnNldCA9IG9mZnNldG9mbG93MzIoQ1BVQVJNU3RhdGUs
IGNwMTUubWRzY3JfZWwxKSwgfSwNCj4+PiANCj4+IA0KPj4gQWgsIHllcy4NCj4+IA0KPj4gQXMg
TURDQ1NSX0VMMFszMDoyOV0gb25seSBtYXBzIHRvIERCR0RTQ1JpbnRbMzA6MjldIG1heWJlIGl0
IHNob3VsZCBiZSBhbGwgUkFaPw0KPiANCj4gV2VsbCwgeW91IGNhbid0IG1ha2UgaXQgYWxsIFJB
WiwgYmVjYXVzZSB0aG9zZSAyIGJpdHMgZG8gc3RpbGwNCj4gbmVlZCB0byBiZSBtYXBwZWQsIGJ1
dCBJIGd1ZXNzIGluIHRoZW9yeSB5ZXMgd2Ugc2hvdWxkIGRlZmluZQ0KPiByZWFkIGFuZCB3cml0
ZSBhY2Nlc3NvciBmdW5jdGlvbnMgZm9yIEFBcmNoNjQgTURDQ1NSX0VMMCB0aGF0DQo+IG1hc2sg
b3V0IGV2ZXJ5dGhpbmcgZXhjZXB0IFszMDoyOV0uDQoNCg0KSGkgUGV0ZXIsDQoNCk1heWJlIEni
gJltIG1pc3JlYWRpbmcgdGhlIEFSTSBBUk0gYW5kIHRoZSBxZW11IHVzZSBvZiBtZHNjcl9lbDEs
IGJ1dCBJIHRoaW5rDQp0aGlzIGlzIGdvb2QgZW5vdWdoIC8gbW9yZSBjb3JyZWN0LiAgSeKAmW0g
c29tZXdoYXQgY29uZnVzZWQgYnkgQUE2NCBNRFNDUl9FTDENCnZzIERCR1NDUmludCB2cyBEQkdT
Q1JleHQsIGhvd2V2ZXIuDQoNCiAgICAvKiBNRENDU1JfRUwwWzMwOjI5XSBtYXAgdG8gREJHRFND
UmludFszMDoyOV0uIFNpbXBseSBSQVouDQogICAgICogV2UgZG9uJ3QgaW1wbGVtZW50IHRoZSBj
b25maWd1cmFibGUgRUwwIGFjY2Vzcy4NCiAgICAgKi8NCiAgICB7IC5uYW1lID0gIk1EQ0NTUl9F
TDAiLCAuc3RhdGUgPSBBUk1fQ1BfU1RBVEVfQUE2NCwNCiAgICAgIC5jcCA9IDE0LCAub3BjMCA9
IDIsIC5vcGMxID0gMywgLmNybiA9IDAsIC5jcm0gPSAxLCAub3BjMiA9IDAsDQogICAgICAudHlw
ZSA9IEFSTV9DUF9DT05TVCwgLnJlc2V0dmFsdWUgPSAwIH0sDQogICAgLyogREJHRFNDUmludFsx
NSwxMiw1OjJdIG1hcCB0byBNRFNDUl9FTDFbMTUsMTIsNToyXSAqLw0KICAgIHsgLm5hbWUgPSAi
REJHRFNDUmludCIsIC5zdGF0ZSA9IEFSTV9DUF9TVEFURV9BQTMyLA0KICAgICAgLmNwID0gMTQs
IC5vcGMwID0gMiwgLm9wYzEgPSAwLCAuY3JuID0gMCwgLmNybSA9IDEsIC5vcGMyID0gMCwNCiAg
ICAgIC50eXBlID0gQVJNX0NQX0FMSUFTLA0KICAgICAgLmFjY2VzcyA9IFBMMV9SLCAuYWNjZXNz
Zm4gPSBhY2Nlc3NfdGRhLA0KICAgICAgLmZpZWxkb2Zmc2V0ID0gb2Zmc2V0b2YoQ1BVQVJNU3Rh
dGUsIGNwMTUubWRzY3JfZWwxKSwgfSwNCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3YW50
IG1lIHRvIHN1Ym1pdCBhIG5ldyBwYXRjaC4NCg0KVGhhbmtzLA0KTmljaw==

