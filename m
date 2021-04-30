Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D33700CA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:52:14 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYFJ-00043w-Ls
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcY93-0001Ys-3D; Fri, 30 Apr 2021 14:45:49 -0400
Received: from mail-eopbgr800113.outbound.protection.outlook.com
 ([40.107.80.113]:9280 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcY8x-0004uw-LF; Fri, 30 Apr 2021 14:45:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWGoy1ySNdXXA7oI1j+xWjPiymxQgSAhclQF0Q3ClBRYmOKI9MGaj0oNzgLt7lSSyZfJYMRpIz0DWSAlVAGr6ZZn3LlJcDe50M7qxACVcV1w6oFYmx8hTfbL9I/ycl6Zsc0vFhK2nHBCvOHnDGXz/8V5i8V+yuhQS1kA5kV/Xtp71V2/VFFwBpSCu63rj+ECxfBl5o3vm19YPPXRAG0xCQQ1iFuYHnvvfLrZkBwhga+IlqHL25RQC5nVdOzpsqrWpcIXGdzwbVGwwFrhBkMEl7BFmfNgqb5lJbxGwzg+522+UMPGI39JE2jOb3ym3gOp07iWf4RA7ka8Q8XYt+jDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy806bMlp+gPZITEuBZrAOFhS8Fcvbb+dEI0BIo3BD8=;
 b=SdEsiOfDaudDb/yUQc7VzuMn2B7DRrrzBFyEE8XbdN8hcEEcDG8L2T4KcPiqRAk3qtbURRuV0e+0JZNlvzfwcMN5PItRmY4FWMx0e1GX9Fw+7pIFUueaV88cnA8i7YCiGk24w/7mB43LPIkSAsMKI8ry4DQPO32x6mTNjEh+Nk4Qs4YZ/ycNjrxi+z7gw5fQSCgjjDpp4NWPmoTqvFFavO2tBDtScH/IEDVG6IIBoTKQJlHy1hwQ81cAcTDs/vyugtIHUSF29h9lzA1OjdtdStxA4EDxQOmQmgUBlOWoTJpphpQjMkXKHy/PbedJkEq+vldipmU/jPIQDUKlbAxQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy806bMlp+gPZITEuBZrAOFhS8Fcvbb+dEI0BIo3BD8=;
 b=H94bVgTzoqLSpFq/qyWUPx6JG8aGjIVPwkd92k+FrxUkFVianWmS0i0qQCMpc35JYgLpTh/1e/A6EW4tCBq6zo4Cs8w9tq9PP6VWneFoBV90vKCOc37dATYNxiPZaQt6/6DQFNsPGINBbk8Yd1e3ipMHefm4Fg9dr+2p/iI/TC1x9DTtA+ZvCr22s0hjeRDEEmTUAnrgYVAqth2mTOkrp+tibwBNSyen4B5t85Focv8qGWkYQonbyBQp98vDmSIZYhclwKPBNFkvjYsthIQG1Az2WYRjLk6lIQndXYZF0O7Ko04Um9nf9xCw8iSzipcQgXbCFGi5Sjfzrsbh/tn6YA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB5396.lamprd80.prod.outlook.com (2603:10d6:103:5c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Fri, 30 Apr
 2021 18:45:35 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 18:45:35 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Topic: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Index: AQHXPV5k3zAZHai+oE6zYD4tIOrCjqrM6yQAgAAy3ACAAD6kgA==
Date: Fri, 30 Apr 2021 18:45:35 +0000
Message-ID: <CP2PR80MB366816D43C01D14799FB3325DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
In-Reply-To: <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 982a3cee-c23e-40af-b182-08d90c082432
x-ms-traffictypediagnostic: CP0PR80MB5396:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB53966773B25387D2C27BFF3CDA5E9@CP0PR80MB5396.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZuUezgpXkm6Jr25wzw5187Rku3ZCcVM4sPVMvwp15hoFnl/Chd4vCoH8oKRzYy/GKcAbbRMpyWPqMIE0GihktoFT/tgeLvKnl3UOkG4kjzAerKDDhk7e7cBuGFTPGg8RgCWQGaOTqFM2nCebCmq9nYAYHr3kAWTh6jlG8DpDnea4enimuRlNU6DXg6HHcJjnsSUjPPR63wUZGjHCgOMyV7bP+PO8d94gvm1e3NWJQsOmOi57OEq58X5gpGSCzR1SdU1IU25AtNedPBmPtfu/eleg4DeaHzUYvxCUu3i3z/dx/iUfglAE80QjK62JeMut4rdCRSADCdnKtERur/5QQ+mlHpJHOVKGyj+dJzfcnj1eJ3eTcnf8oVW+R8a4Vsru+cTxgo5z57eeSgDdtg0810OWKb0KgqyE0g9LRUUpoAENCgfVvpkHPPJTxoZ/ynJy3/Usr737pWDlbIf3g2fSiMVloa+F5TL0DDcdMuPQ9Xf/TWvGOw8I8oHGV7vTecJHKtJ+FyzLA4Ov5Xzy/GU8RnYXJKdZbncuiOJlUwfdQg4WUjELNz7A1LqUNatZozj1Yp0JhC/CeoNcWjVD6BDQ+fyFaL0DhQo6AgNBISZbWo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(83380400001)(66446008)(64756008)(5660300002)(71200400001)(66476007)(38100700002)(2906002)(66946007)(55016002)(9686003)(66556008)(54906003)(110136005)(498600001)(186003)(53546011)(6506007)(122000001)(86362001)(8676002)(4326008)(52536014)(8936002)(26005)(33656002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZVJTU1FqSlUrR2VrU0ZDd0FHVXFFVXRJQ1JKVFJSd1J6RFFZeUFEY3pjNDN0?=
 =?utf-8?B?VXBRWS85S1BtNTd2eFNySmNWQkgraTE4ZGFydTlQbzl4S0k2enhJUStFRTg4?=
 =?utf-8?B?ZUlGUmRJbGIzWVd1Z24zbnUxQXA2VGNEOVRyZ3QxZ1VWVzBjbUFhTXhrL1NM?=
 =?utf-8?B?bVRQbjBqVUV5M1hDOEtQK1pDNDdYZFAzL2NCTzhJd3FaK2ZjMEJKeWFFYm85?=
 =?utf-8?B?L252LzAya2VkcEZQTTMva2I5clZ6NE82U1h1S1RvQmE4WEZpeXNseHpZbW45?=
 =?utf-8?B?Wk45T2RmdGkva0ZZNDZ5OHRoRE12eDI4Q3p4UzJuV2l6REcwbzR2S3p1eTZy?=
 =?utf-8?B?Qk5UdG96OFdQMFFUMVJoa2cvMTNuTFAvNmdpNzdyRm5sUHQxMVJVaEJQaDRS?=
 =?utf-8?B?dXVxajNoUFE3dk1uNEc4azVoa3BUUlcrckdQTG95ZmRMcTAzTFRuQnVkbklt?=
 =?utf-8?B?QzQ5bUwyR1kvSDRUZ2lXc0xoRS9KMytJdlhHMi9ackFPWTlkVzM2N0IyaVlN?=
 =?utf-8?B?Z3AreUxKLzFnbWZ0NHZ3TlVoRmpmR2NSY1poZzRubU1nTjIvSVZXRHVJS0hv?=
 =?utf-8?B?R1VwVTM1dGswdTBqNk1tTkJTVHFpWHV1VjA2UTRJajRNWXNLU2RjTFUxRHVj?=
 =?utf-8?B?OG5IN1JzWEFzQkVoczZNOGNOVi9rZm1iM0hCQWJyUHpoM1RGRzZGaFhQVnAy?=
 =?utf-8?B?NkRpbnJXYnBwMUJNMFgvTUlYM3JlY0U2Ujl5MEI2U2xidjJCSG5JcWpEZXR2?=
 =?utf-8?B?cWhlWTkyY0dZWGpHYWI0ZWgzcEJJNEd5cCtGY29PNVh6ek9BOGdpSTRqTlkr?=
 =?utf-8?B?MTNPQitWYnFhQjZ3SFRZZE0vR2MxeXgxQUk5OVNsRGlWaWxGWHR6SVFNN2NI?=
 =?utf-8?B?ZGZWTjhGbnZRenZOdXFaK0haQWQ4Vkx5YS9mT25sajF6T3ZFMTdxb1pnencx?=
 =?utf-8?B?dGZoU3Q2YnNuam96S0ZWWkgwUHZUeS9uUlVOSmp4TzVGSktxZ2RteXJxSy9G?=
 =?utf-8?B?R0h3K2gveUcxSjVPTHdjTStqbCtEem1JMU1waXF2V21abTVmaXhZTDVVWWVi?=
 =?utf-8?B?RzNLZnA3azRRVE5oeUtEblc5cEUvV3VySXRJeUYrYjBpUmRBc1NvdklEOXN5?=
 =?utf-8?B?OHBvejkzTitjQWd6REJ6cFl6akU2OW91eEoxdXdQbnV2WlE0endRZERhMFQz?=
 =?utf-8?B?VFNlSFhFZzV2MUhqYll6NkV4ZGVtZFdQTW1yWVFIOEljV1ZWaVJQRkRKaENv?=
 =?utf-8?B?dnBRZnBqMHR4bmVqY2FCWWdCSE9ONjM5b0oyOHBUMXQzZXRFUXJRL0RHNmtT?=
 =?utf-8?B?cStwZWhIQjRUNmFWUUNjM0xmcFVvczhOZ2tvYWJHWDY2U0QwQzhJYlpsZWNO?=
 =?utf-8?B?MG5HTHJ5RnE1c0hZdXE0dUhCL1RTOWRPUGxSbTJaQjJXVnlmN0o0T0lpZUpj?=
 =?utf-8?B?KzZUcmRyejdjby9ENkNrcEVrK2F2cUVJZ0FCMytYb0pkN3ZZZktSSmVVc1hQ?=
 =?utf-8?B?dFJXSXZtbk9wUjJCeFdsdjg3K2lwMHFYRTVLNmdoN2FTYVRMbERGeTBvN29u?=
 =?utf-8?B?UVJpenJSMU5DT0hhWW9LUjdNNUJnd0pBQmdPTWlzajE5bHBvY0d2Rm1RYnVQ?=
 =?utf-8?B?aytOQVhmalFqYVNWWDNhbEtKSVhremlsNmpBY3ZNUFU2a29OOG1RcHBJYzFq?=
 =?utf-8?B?MTJXd2VsRm1VUnl6aFNMSUN0d2VLcXFXVG5VYWNldm5NT0NGdFhqWmhvZlNw?=
 =?utf-8?Q?S/mYF91C2lUYQvuPBR0vbK+nFvcA0fnXpmVLGf6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982a3cee-c23e-40af-b182-08d90c082432
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 18:45:35.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ID3RRGe43NKL8eYxzAUXwVO9BnfnhiJIc8MBbAsmk79tkvdxXJSkddf0T+86MED406LyLGAwFv1O1B6cXPMhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5396
Received-SPF: pass client-ip=40.107.80.113;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IE9uIDQvMzAvMjEgNDoyMyBBTSwgTHVpcyBGZXJuYW5kbyBGdWppdGEgUGlyZXMgd3JvdGU6DQo+
ID4gSSB0aGluayB3ZSBzaG91bGQgcmVjb25zaWRlciB1c2luZyB0aGUgc2FtZSAuZGVjb2RlIGZp
bGUgZm9yIGJvdGggMzItDQo+ID4gYW5kIDY0LWJpdCBpbnN0cnVjdGlvbnMsIHRvIGF2b2lkIGR1
cGxpY2F0aW5nIGFyZ3VtZW50IHNldA0KPiA+IGRlZmluaXRpb25zLCBhbmQgdG8ga2VlcCB0aGUg
cHJlZml4ZWQgaW5zdHJ1Y3Rpb25zIGNsb3NlIHRvIHRoZWlyIG5vbi1wcmVmaXhlZA0KPiBjb3Vu
dGVycGFydHMuDQo+IHZhcmluc253aWR0aCBhc3N1bWVzIHRoZXJlIGlzIG5vIGVhc3kgd2F5IHRv
IGRldGVybWluZSwgYmVmb3JlIGRlY29kaW5nLCB0aGUNCj4gd2lkdGggb2YgdGhlIGluc3RydWN0
aW9uLiAgVGhlIHdheSB0aGlzIGlzIGltcGxlbWVudGVkIGluIGRlY29kZXRyZWUgaXMgdmFzdGx5
IGxlc3MNCj4gb3B0aW1hbCB0aGFuIHdoYXQgd2UgY2FuIGRvIHdpdGggYSBmZXcgbGluZXMgZm9y
IHBwYy4NCg0KSSB0cmllZCB0byBzb2x2ZSB0aGlzIHdpdGggb25lIG9mIHRoZSBwcmV2aW91cyBk
ZWNvZGV0cmVlIHBhdGNoZXMgKCJkZWNvZGV0cmVlOiBBbGxvdyBjdXN0b20gdmFyIHdpZHRoIGxv
YWQgZnVuY3Rpb25zIiksIHdob3NlIGdvYWwgd2FzIHRvIGFsbG93IHVzIHRvIGltcGxlbWVudCBh
IGN1c3RvbSBpbnN0cnVjdGlvbiBsb2FkIGZ1bmN0aW9uIChpbiByZWFsaXR5LCB0aGUgb25seSBl
ZmZlY3QgaXQgaGFkIGluc2lkZSBkZWNvZGV0cmVlLnB5IHdhcyB0byBub3QgZ2VuZXJhdGUgdGhl
IF9sb2FkIGZ1bmN0aW9uKS4NClNvIHRoZSBpbnN0cnVjdGlvbiBsb2FkIHdvdWxkIHN0aWxsIGJl
IGhhbmRsZWQgYnkgYSBzaW1wbGUgZnVuY3Rpb24gaW5zaWRlIHRyYW5zbGF0ZS5jLCBidXQgd2Ug
d291bGQgdXNlIHRoZSBhdXRvLWdlbmVyYXRlZCBkZWNvZGUoKSBmdW5jdGlvbiB0byBjYWxsIHRo
ZSB0cmFuc19YWCgpIGZ1bmN0aW9ucy4NCg0KPiBJbiBhZGRpdGlvbiwgdGhlcmUncyBhIHJvdWdo
IHNwb3QgaW4gJWZpZWxkIGRlZmluaXRpb25zLiAgWW91IGNhbid0IHNoYXJlIHRob3NlDQo+IGJl
dHdlZW4gcGF0dGVybnMgb2YgZGlmZmVyZW50IHNpemVzLCB3aGljaCBjYW4gZ2V0IGNvbmZ1c2lu
Zy4gIEhhdmUgYSBsb29rIGF0DQo+IHRhcmdldC9yeCwgYW5kIHRoZSBkZWZpbml0aW9ucyBvZiAl
YlsyM11fcl8wLCB3aGljaCBpcyB0aGUgc2FtZSBmaWVsZCBmb3IgMiBhbmQgMy0NCj4gYnl0ZSBp
bnNucy4NCg0KUmlnaHQuIEluIHRoZSBjdXJyZW50IHBhdGNoIHdlJ3JlIGFscmVhZHkgdXNpbmcg
c2VwYXJhdGUgZGVmaW5pdGlvbnMgZm9yICdzaScgZGVwZW5kaW5nIG9uIHRoZSBmb3JtYXQgKCVw
bHNfc2kgYW5kICVkc19zaSBiZWxvdyk6DQoNCiZQTFNfRCAgICAgICAgICBydCByYSBzaTppbnQ2
NF90IHI6Ym9vbA0KDQolcGxzX3NpICAgICAgICAgMzI6czE4IDA6MTYNCkBQTFNfRCAgICAgICAg
ICAuLi4uLi4gLi4gLi4uIHI6MSAuLiAuLi4uLi4uLi4uLi4uLi4uLi4gXA0KICAgICAgICAgICAg
ICAgIC4uLi4uLiBydDo1IHJhOjUgLi4uLi4uLi4uLi4uLi4uLiAgICAgICBcDQogICAgICAgICAg
ICAgICAgJlBMU19EIHNpPSVwbHNfc2kNCg0KQFBMU19EXzMyICAgICAgIC4uLi4uLiBydDo1IHJh
OjUgc2k6czE2ICAgICAgICAgICAgICAgICAmUExTX0Qgcj0wDQoNCiVkc19zaSAgICAgICAgICAy
OnMxNCAgIWZ1bmN0aW9uPXRpbWVzXzQNCkBQTFNfRFNfMzIgICAgICAuLi4uLi4gcnQ6NSByYTo1
IC4uLi4uLi4uLi4uLi4uIC4uICAgICAgJlBMU19EIHNpPSVkc19zaSByPTANCg0KQW5kIEkgYWxz
byBoYWQgdG8gY3JlYXRlIHNlcGFyYXRlIEBmb3JtYXRzIGZvciAzMi0gYW5kIDY0LWJpdCB2ZXJz
aW9ucyAoQFBMU19ELCBAUExTX0RfMzIsIGV0Yy4pLCB3aGljaCBpc24ndCB0aGF0IG5pY2UgZWl0
aGVyLg0KDQo+IFRoZSByZXBsaWNhdGlvbiBvZiBhcmd1bWVudCBzZXQgZGVmaW5pdGlvbnMgaXMg
dW5mb3J0dW5hdGUsIGJ1dCBpbiB0aGUgZW5kIHdpbGwNCj4gb25seSBiZSBhIGhhbmRmdWwgb2Yg
bGluZXMuICBXZSBjb3VsZCBwcm9iYWJseSBjb21lIHVwIHdpdGggYSB3YXkgdG8gYXZvaWQgdGhh
dA0KPiB0b28sIHZpYSBhIGRlY29kZXRyZWUgZXh0ZW5zaW9uLCBpZiB5b3UgcmVhbGx5IGluc2lz
dC4gIChNeSB2YWd1ZSBpZGVhIHRoZXJlIHdvdWxkDQo+IHB1dCB0aGUgYXJndW1lbnQgc2V0IGRl
ZmluaXRpb25zIGludG8gYSAzcmQgZmlsZSwgaW5jbHVkZWQgb24gdGhlIGRlY29kZXRyZWUNCj4g
Y29tbWFuZC1saW5lLikNCg0KSSB0aGluayB3ZSBjYW4gYWxyZWFkeSBwYXNzIG11bHRpcGxlIGZp
bGVzIHRvIGRlY29kZXRyZWUucHkgYW5kIGl0IHdpbGwgaGFuZGxlIHRoZW0gY29ycmVjdGx5LiBJ
IGp1c3QgZGlkbid0IGZpbmQgYSB3YXkgdG8gZG8gdGhhdCBmcm9tIHRoZSBtZXNvbiBidWlsZCBm
aWxlcywgd2hpY2ggYXNzdW1lIGRlY29kZXRyZWUgd2lsbCBhbHdheXMgdXNlIGEgc2luZ2xlIGlu
cHV0IGZpbGUuDQpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBhbGxvdyBmaWxlcyB0byBiZSBp
bmNsdWRlZCBmcm9tIGluc2lkZSBvdGhlciAuZGVjb2RlIGZpbGVzLg0KDQo+ID4gQW5kLCBpbiBv
cmRlciB0byBzaGFyZSB0aGUgdHJhbnNfUEFEREkvQURESSBpbXBsZW1lbnRhdGlvbiwgbWF5YmUg
YWRkDQo+IHNvbWV0aGluZyB0byBkZWNvZGV0cmVlLnB5IHRvIGFsbG93IHVzIHRvIHNwZWNpZnkg
dGhhdCBhbiBpbnN0cnVjdGlvbiBzaGFyZXMgdGhlDQo+IHRyYW5zX1hYKCkgaW1wbGVtZW50YXRp
b24gZnJvbSBhbm90aGVyIG9uZSwgc3VjaCBhczoNCj4gPiBBRERJICAgICAgICAgICAgMDAxMTEw
IC4uLi4uIC4uLi4uIC4uLi4uLi4uLi4uLi4uLi4gICAgIEBQTFNfRF8zMiAhaW1wbD1QQURESQ0K
PiANCj4gVGhpcyBpcyBkb25lIGJ5IHVzaW5nIHRoZSBzYW1lIG5hbWUgdXAgZnJvbnQuDQo+IElm
IHlvdSBsaWtlLCBhZGQgYSBjb21tZW50IHRvIGdpdmUgdGhlIHJlYWwgaW5zdHJ1Y3Rpb24gbmFt
ZS4NCj4gDQo+IFBBRERJICAgMDAxMTEwIC4uLi4uIC4uLi4uIC4uLi4uLi4uLi4uLi4uLi4gICAg
IEBQTFNfRF8zMiAjIEFEREkNCj4gDQo+IA0KPiA+IFRoaXMgd2F5LCB3ZSBjb3VsZCAoYW5kIHdv
dWxkIG5lZWQgdG8sIGluIGZhY3QpIGtlZXAgdGhlICdQJyBpbiB0aGUgcHJlZml4ZWQNCj4gaW5z
dHJ1Y3Rpb24gbmFtZXMsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIGF2b2lkIGhhdmluZyBleHRyYSB0
cmFuc19YWCBmdW5jdGlvbnMNCj4ganVzdCBjYWxsaW5nIGFub3RoZXIgb25lIHdpdGhvdXQgYW55
IGFkZGl0aW9uYWwgY29kZS4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIGF0IGFsbC4N
Cg0KTm90IGEgYmlnIGRlYWwuIEkgd2FzIGp1c3QgcmVmZXJyaW5nIHRvIHRoZSBmYWN0IHRoYXQs
IGluIHRoZSBjdXJyZW50IHBhdGNoLCB5b3Ugbm90ZWQgdGhhdCB0aGUgaW5zdHJ1Y3Rpb24gbmFt
ZXMgaW4gaW5zbjY0LmRlY29kZSB3ZXJlIG5vdCBwcmVmaXhlZCBieSAiUCIgZHVlIHRvIHRoZSBj
b2RlIHNoYXJpbmcgd2l0aCB0aGUgMzItYml0IGluc3RydWN0aW9ucy4NCg0KVGhhbmtzIQ0KTHVp
cw0K

