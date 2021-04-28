Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6A36DA8F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:05:50 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbll7-0005kK-Ga
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lblfQ-0002lA-Cn; Wed, 28 Apr 2021 10:59:56 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com
 ([40.107.79.98]:33611 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lblfO-0003iM-1k; Wed, 28 Apr 2021 10:59:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYL6iqCag3kcNg4qv+QZLsH9KR+tvNtdPEwOzBCmySJzd36cfCGZ5tPqANstzcaVFEVjcd+bSC+MvHLZmoMR/jpRWZB8xaBOyH/A2dZcrt5zp1iKvp9dHNDN4ZYbUug9VxQpCyOwc08T1ZCdPp3apSTxLc2OKSJGyY8rHSoUXxeltP/N5d7igGUnS4TR3UGdsIWbjC3xis9m/EdbQ+8GiQs4OSTd5lz7ixBrVwnjRd8idkbSXs5I5zBduWIVbfAGf2ZeTQEfeCL2m5Pl6L1Ue0hUibhxzyLQTW4I3voXPIm+V8LSlwfnSukxiZ3pT26lFzrL6cg4AbXCCrn1O2mQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU0Skw+z1hSeLQm4tQRsVxbmurZkp1lUZOAAr2pFsmc=;
 b=OA6XeOU54PnhB+HPwRYzipymzkySJJYgUtdc8NqiaIsQcNS2U/AK0u+1LffMFFOtA9CRq76T9ZNxPOmIwX8ErV79aaoJt3F4w/VZXmfJ2lf8Ha/5vuBQRaRHByqxImFMvinZ2HOY+9RQ9e3zyeuDxmYPe6dUdGqdl+eoyh2n3dsRYxCGod3fQ+R+qOzzqZM7oxkYwTdN3Qqg+VJCKKH1Jux1QLNGVUOPtF/3NgbxHr8/qkazbOng1dyYRajWJ3XBr7Q0f87Yy0UcGmNMjPcq47jf11CBjyPMjTO024J0DT4xCNMftP3pfI8LOyWMBLFOqxYsQl5sjW2KitkLFTVuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU0Skw+z1hSeLQm4tQRsVxbmurZkp1lUZOAAr2pFsmc=;
 b=KQZLywDvH1osnKsGB/nsSqfQ26N8bf2DmTR00oGs1ZFnUXq3L8i7tu9muHN2iiFG0tlpgPFWua6SjrkIQpLtczrA/alrDzsHafR5cmUQOyHx7t5B5EsJ71IwTWLN6ai8nTpxApEgofvG8iA/NdkjVTz6dO7tWfXMX3d4WWDuRkGfuKqnL9gHSfNVefHJkV7udQ/3GwmaIkZ6N5kwX0gTQj/6JNkcUGEo6b0S9Leo/ukMdMYOk13CY9DcrIke6lB7wVBXJ4Lxo2pPhzhhdohRP10jg0BJVX6Nfc1xp4J4ih5sSdEOVwGtab9CSGeVlIFBQG3bqi44K+d9LrVz+1dQDA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5109.lamprd80.prod.outlook.com (2603:10d6:103:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 28 Apr
 2021 14:59:49 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 14:59:48 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v2 02/15] target/ppc: Add cia field to DisasContext
Thread-Topic: [PATCH v2 02/15] target/ppc: Add cia field to DisasContext
Thread-Index: AQHXO4lcBl0o/EyC90eRAdXACfQnGKrKBeaAgAABLLA=
Date: Wed, 28 Apr 2021 14:59:48 +0000
Message-ID: <CP2PR80MB36688F40941E42D53D9400DCDA409@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-3-luis.pires@eldorado.org.br>
 <4b41040a-57b6-7350-d879-3e5c25314b58@linaro.org>
In-Reply-To: <4b41040a-57b6-7350-d879-3e5c25314b58@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [187.10.24.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ede2583a-cfcc-4c8d-97f1-08d90a5644f3
x-ms-traffictypediagnostic: CPXPR80MB5109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB510941D5DAC858D16C908D02DA409@CPXPR80MB5109.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:185;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cadi5OtqbCrRfqD1Tit9A6yLOABD9/FllI6dOGOR6Rlp8cH+oTwXWntakYx7nhZTuK3mnh9HyM/I8Yoov7wGWVO7ZiVAQr318x/It4VJ1oUcC3oX5aVmYx4y3aVdAcNNvB3MhZApyHPaSoWa+6pPi0agQgwrqwHceNeaIeoPPIdD8Wkyp8jxKBQHSXmKuvh9/e68hniH/H+OO6UzCm9le3DuTC4jpnP3vKDxtbRydOK2JpcT85zY5TcOJsCI+yWJFQyQikFut4RUtGDYQMLy9dwk3G2Hm4kwVh8OH3rfHngBoLSzr/QAKZGTj50/S5KdgoQElOoPwW5YDrm6k0xiK33AIw7qhPXjJxs3/xW8/vUclvN89vSQ8zhcWMHvuRv5nJCPfG6XLIC4qvrsOgYPK7VClCdHACK6khSWDozFOBsNAxdHMvFPvvDIiPfXysmPoCuSH5RQrOSCroWbhKoqD30kK9hzQFSZY1ATXOtU6fuaVpAhNPkE/k9gUmsZ8lmvXv4nIRyl8k3lh93h+m0iG0WhL/UpBp8HhLpQBnihDDNGabyXqSZs2WcWrYIeUMhvGz097ox8Ej2ocS3WuHxzqrlao5DThR+GZ4anb0bPpKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(346002)(376002)(396003)(366004)(136003)(55016002)(6506007)(4744005)(76116006)(66446008)(38100700002)(316002)(478600001)(54906003)(83380400001)(110136005)(26005)(5660300002)(86362001)(4326008)(122000001)(186003)(8936002)(7696005)(8676002)(52536014)(64756008)(66476007)(2906002)(71200400001)(53546011)(66556008)(66946007)(9686003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MnJhVUFsaGpVQk56NVVMeU1oSHJQc1JHL2Q3VGdWNXozenZocUN0R3VQbHM5?=
 =?utf-8?B?R012L1pzQ3hZYVVTaUVpRWtzSjJwakEyWGg2Q2hjbCtWb0pCQnNhRGd4eG8x?=
 =?utf-8?B?RXB0b2xJV3ZPU2hjSXVGUFBxWmxCUjJkL1lwWEIyOGZvRFhCTmwrTGR6V2FR?=
 =?utf-8?B?cXROSlNkR3doNUFyeWs0eVVoY2ZNeFRzazZzWDhXdzdMcXlVMVNZWjNneURO?=
 =?utf-8?B?eWhZa0Mvem5zbG93TDJkbzA3aFFyeFVXWmtFSUxqanJaUXdHMjlOMURXaG0x?=
 =?utf-8?B?WTNWd0pIMFJJTlIwZ1BoTVlDMUZlVkZBQkRhR3hObFI0WEh6clJqV3NoWmc0?=
 =?utf-8?B?OXNTay80eFVhSUZ2WFNmYWI5Q1BDRUQwdWFkSHRPSnNzcjIrUXJUYTRzMjBy?=
 =?utf-8?B?VU16cjdUVk40MUsyNWtwc2lrQ3JiYStsTnRjQ1FncnFBZ1RzU0hDTVdXcmU1?=
 =?utf-8?B?WjRNUU0yTGhWYnZ3UVZrMlFlMFJLcm91MFNNOGQ0V0w2S0J5R05LYzBkS3J5?=
 =?utf-8?B?QTN0Z2xlcTQ3R2poTVpmZzhzNkF4a0JHTVFtbVRCd2owZlpCL2I0aWVMY1Yy?=
 =?utf-8?B?YW5jSTNsNnM3TkFhSUxCSFdheEVSS3hidmtMOWgxTURMSG1WMUc0eS80NnQ1?=
 =?utf-8?B?czFaQkY2MHNTU0ZhOFVsUUVySXFmR0pBQVgvTzZLTFhUREtGRUM3ZVgrSG1W?=
 =?utf-8?B?S2xsTmtUMWxsWENienl5RmJDSEpJY21UWmhFdExTWitrN3o5NkVmRXJLeU9Z?=
 =?utf-8?B?L1ZTUXIzZk5LWWUvWmYvRXVnenlYL1F5WXFpSlppR2NUbDJkaUVlcTExN081?=
 =?utf-8?B?cDc4K0lIK3VVM1FhZVRIZXFMdmJ5TGV4S3p5R1NZMktrLzJGQUphZnFBVCtC?=
 =?utf-8?B?Um1GcmxaZDBHbWVweUt2YXRuYVUxOEF2ajU4Q3Bmb1hoSDVCaGVsUXBwNmdp?=
 =?utf-8?B?RXFubmhkTURwZk1rNlEvWTF5UVYranp1ZXNjdHo3MkNYV0ZwdzNacEwvT0h0?=
 =?utf-8?B?Y1pvOURYNzRSVDJSTHZJSEF4R0d0Y2IyekpyaTNxbTBOczI4bitJOFJiTS80?=
 =?utf-8?B?V3MzQlVqM3FsblpUTlBBM1dXL0t6WnJUUW9acEdFZjh5c1N2cUZOeU1CM2pH?=
 =?utf-8?B?blVBNUc3ZnF6ZjdlZEovYW9STVdBL2hKQks1bEQ0T0kreS8vaHZpTDJwSVN1?=
 =?utf-8?B?YjFzekdDSDEra3VEdGNRTDM1WHVyb2J0Y3NKaXRoSXRhUnVnSDRVSEhRK1dK?=
 =?utf-8?B?MGNncEdPQ0pxSk11c0hGWm05b1lCcDJSZE02aHc2c0swdjBVeXcxK3RLWVJI?=
 =?utf-8?B?dVJ2SGF6YktDR0k0VVgzL2pXTkNTenhLUURLL2xZQmw4aStQSDd2Y3hXcml6?=
 =?utf-8?B?NXl2OGIweDdNWk9aak5pdWxZUVd5MXJsWGVMaGR5dGlYZU4xTEtVV29WSmQ3?=
 =?utf-8?B?VnFXK08wQ3pGa3NMV2hsUHFTenFxMzIvRkREK2lHQWJ2dnhoTXdxblBHbTlk?=
 =?utf-8?B?VGRmTlcwVkZmVlgzaUFmS0ZiN0cxOWwvc21XMG1Ea2pUVEdxaFVhdWlwUGo2?=
 =?utf-8?B?VlYwL2EwTEZKS0pDK2JuM09KcHNmYkRvN2dmL0paZnM1U3huNGJXRm5hdG5l?=
 =?utf-8?B?R1cwZWNSbmNLeG9iK1B4TEhRZU45cnUzWmR4U3lNODJXc2ZRM1RtdkJ3K0RF?=
 =?utf-8?B?Ukw5cDlVSSt0MUtUdXozSm9VeG50QWFRRzZTZ0hVbS9zNXNBMjdkV2Y1Q2Rx?=
 =?utf-8?Q?WbIsh4WQTi+5C2J3Dw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede2583a-cfcc-4c8d-97f1-08d90a5644f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 14:59:48.8586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxC3z8592JQTf6PDugcxdXcRQyxFhLkmTd6v+5/x7hodYLLL6QtecxfpktoNPIbacVgC5rFjKNwO1yMthKSlcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5109
Received-SPF: pass client-ip=40.107.79.98;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSdsbCBkbyB0aGF0LCB0aGFua3MhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFNlbnQ6IHF1YXJ0YS1mZWlyYSwgMjggZGUgYWJyaWwgZGUgMjAyMSAxMTo1NQ0KPiBUbzogTHVp
cyBGZXJuYW5kbyBGdWppdGEgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPjsgcWVt
dS0NCj4gZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1wcGNAbm9uZ251Lm9yZw0KPiBDYzogZGF2aWRA
Z2lic29uLmRyb3BiZWFyLmlkLmF1OyBNYXRoZXVzIEtvd2FsY3p1ayBGZXJzdA0KPiA8bWF0aGV1
cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+OyBCcnVubyBQaWF6ZXJhIExhcnNlbg0KPiA8YnJ1bm8u
bGFyc2VuQGVsZG9yYWRvLm9yZy5icj47IGxhZ2FyY2lhQGJyLmlibS5jb207IGY0YnVnQGFtc2F0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzE1XSB0YXJnZXQvcHBjOiBBZGQgY2lh
IGZpZWxkIHRvIERpc2FzQ29udGV4dA0KPiANCj4gT24gNC8yNy8yMSAxMDoxNiBBTSwgTHVpcyBQ
aXJlcyB3cm90ZToNCj4gPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbjxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb248
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiAgIHRhcmdldC9wcGMv
dHJhbnNsYXRlLmMgfCAzNCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0K
PiBXaGVuIGEgcGF0Y2ggcGFzc2VzIHRocm91Z2ggeW91ciBoYW5kcywgaXQgc2hvdWxkIGNvbnRh
aW4geW91ciBTLW8tYi4NCj4gDQo+IA0KPiByfg0K

