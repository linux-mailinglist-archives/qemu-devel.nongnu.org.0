Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00804417B52
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:52:15 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqIw-0005pQ-1d
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTqGp-00041f-LC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:50:05 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTqGm-0007CX-2a
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1632509400; x=1633114200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FEXsVVRXsY0gXJqz260j84bq1arzgVVc34kJa/fayOA=;
 b=d9RAO9a6OcaCycKNXRWgYmay9i+9XAbgSLAFe4aZCVU0M9B8o+ACca27
 O4da1D1fnZv3+ydUw5s4WHMe/kwaYUmrrj9nRn8B+8Uwml+uyAYLIxHOE
 jT1Df84SjvE88LD5pqx+aUVqJo2ruGSkEoNWpzT1fdAxHEqa8QhgJp3/O A=;
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 18:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bdgpi3eGFeZttDuvJXH3SxMWA+sHAhUiXZNNJeKL7BcUYPNbln+M4hR+4w1AVq4YAFZzPipyjxkbD0Hy/PXckzn5i31aJqZGDiv/8tQh1vD81Mp6M12ebNHsmq+rmVFmrvzV8nNZ41mBrujQjjB8FFxG8wjPmQD9RjHVHbUpRHTFKCMtlpPVSdeENGssKbGS0uUnH+9W9HSx65nMpJ4uz+iiGFObNr8NflGUZIaN4SVJV2sDKwdyItmRMRIlPopg9TgRBzafbLB99coxUJYFSFECj7T8uHAvAPvn+egeD8BZBIiS/0IL9EGEk5qP2GiLNkyWC2PY+iA/MtJ9L5SnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FEXsVVRXsY0gXJqz260j84bq1arzgVVc34kJa/fayOA=;
 b=B7W9tepGp3De6B9wrGyJ9S649Hugoa7MAT9ZrCYED1lhIAMCF+xyx+cK8EN/Y1hcTfZwefu1ewdFLKRWSbm50zXPfHmjp+I0Bv1kGtBfoFVxh39qLk0ym6/sdxLIVBbcyaSFbuJYtAhlNXXsz17JffQdFKucEgFyxNfxos+83bzLR7S6FreDoXSEL5UeKCdnCmDoeMGjn0yTdiJRhvGYYw64FbGAvay1CAK2QDN5g8FacMN05hvDOiS3m3fdMbkkosOpT+VWtayonRGC1C3nyvt4kmZw68hFf4vX5VzH0pPYHPR7UBcOtGE/iNCRId0Ae1v00WbjiChTT/lCB428dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6785.namprd02.prod.outlook.com (2603:10b6:a03:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 18:49:56 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000%3]) with mapi id 15.20.4544.015; Fri, 24 Sep 2021
 18:49:56 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 08/27] linux-user/hexagon: Implement setup_sigtramp
Thread-Topic: [PATCH v3 08/27] linux-user/hexagon: Implement setup_sigtramp
Thread-Index: AQHXsWWSF1x1xvqY/UWJL7OaX9VLHKuzaT6g
Date: Fri, 24 Sep 2021 18:49:56 +0000
Message-ID: <BYAPR02MB4886B17063F9265EDD1A388ADEA49@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-9-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-9-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41000fc3-6fd0-4a64-8874-08d97f8c1a43
x-ms-traffictypediagnostic: BY5PR02MB6785:
x-microsoft-antispam-prvs: <BY5PR02MB6785CADC5B64D1E1BE449EAADEA49@BY5PR02MB6785.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6fwl8z741KY0OUSIkexkRo6750fy5saE9ymrbs2yjAzwqdt7AGK9WgjG6AgOS8OnlXTUfiQr4Juur0ycmX9ybTR9zrrp4KwreEpx6a9mpWaRMm8SOR2MdIJ4j9ZHWOlQE2c26tForml/0smahnM4DvtKB+NbLOFllCRQbHiZ+d63AHhOqr+c+Icrs96UIGdUfnqgZ8jHphZJyHpOmEbdtoPcoDY0Vzq/jrX3kZ+iYNbyHRn5Fu/kPcWj814+VlskqCnpGN5QHSbwKRfKCPdUnQAJQFohGKO71voB3/MARrhbQoVKzIRvnmrClef/CCwpFW/5IbncypEvss7cQ3GrlSqX08wdaDURcvXIDofnU/CbDgbu+ckoRsfdprBNiJgsm2EcLqPxVl71GgSidaRbKhCsbQMsmvIxZXFE0FAPaQLpYkFbUwHnnEVIYBNKrnVERsJBWC9lmU6X3o+fN+xai2KMkfyjsAc2JwG7e8E9rK6QNo86GNrp0Dy3V7A4fRd14nWqz3vX4T8GGZvZhaH8r+pkwuSSBct57siR6cnDY8M4D3cjqvMKNiS0ndlfqJXGqpIXm2v6+ehqKUV3sQhxjpyxTEKTWyN1cQVCwjjKNh3fgeHxjeeNNnXEzRkSwQHnUneBpgi8f4u9PmjBW3aX86Us1K2+zlGVLw9xf2gv8Fz0TVNTFix71MKQKWaK8EWdqAyBkEolDesInYzVRnlLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(71200400001)(66446008)(38100700002)(316002)(110136005)(52536014)(54906003)(4326008)(186003)(6506007)(8676002)(5660300002)(38070700005)(7696005)(66946007)(26005)(53546011)(55016002)(33656002)(4744005)(9686003)(66556008)(2906002)(76116006)(83380400001)(64756008)(122000001)(66476007)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmdJdWpNYmpOZENIUzNpM2ZEOTJxNmpiU3JNbGFsWGkrZURlblNMWFhZVTYz?=
 =?utf-8?B?VmJYdzdJVFpCSExNdzd2NThHclVaZEFWNG53ZHhPOWpKLzNhRWtnY0xFcjFm?=
 =?utf-8?B?bjF5N2dZVzU3Q2FycWhzeEREcUpLelBTNkNNdjRWODRDb2lwWEtUcDNQaWh2?=
 =?utf-8?B?R0xQbjZtL29rWHVjTXF3cWs5MGNEOTlPZ3ZiaUNqQXhyRkc1ZDFrNTZiL3hS?=
 =?utf-8?B?MGVHcEtBM28zRDNUM3ByeEJkTTBuZy9iRXJDUlgyTCtDWjI2YkltY1ZiNzR1?=
 =?utf-8?B?SzRFTFB5UG9pdDdlYjYvYzU4MGJ4VmtwQmRNajluWDU4UGpqZkxLdDMxQnho?=
 =?utf-8?B?ZGVmejJDaE54bm9iUDJCRjBZNnBWbzhwUnJTQzhsbS94TjVGUVl5bFMyZ0d6?=
 =?utf-8?B?WFBKbWFGeWNTY1VuS1ErMGtCUFBsbkMyWGhlRW1rZlZuNVZFbFNNYXM5WTZG?=
 =?utf-8?B?YnVuS3JaWmJtdVJ0S0Z1Y0RRYVpEZHRPWnVHKzYxK3FsZSszSlljWllKS0hM?=
 =?utf-8?B?eHBpUFBvTmY5UTd0Mk1Xekt4ZGRZTG4rQnVyU0IrNmdxQWNia2hjYUxUUVpi?=
 =?utf-8?B?M2c2eDNPZTVBWWE3ZEZqVnQ4VTZEUzBvZVZjK0xqS1dmLy9HOCsxUWFUKzJk?=
 =?utf-8?B?UldoejBxOW9jSm1zY3pDYlNyUWhUb0RDWjZsOU50dEpPYXA5UFRXZmVkN1Yy?=
 =?utf-8?B?Z0t6TG9xamJTQkN3OWpzczV1YW9VaUtNQnJ4MjZvc1FHWDZxcm1QWlN1ZHFu?=
 =?utf-8?B?OUQ3YlN4V3JXNTlJME84WFRsVXBwRWxHam1Ld1dTSHlsVVdMeVNlcnY4T2RD?=
 =?utf-8?B?K3Frd3VuRmtPTmE4a2hPdXo0WVlUSjROMzRrOFVoUEdBOFZFVmExQk0rTEJl?=
 =?utf-8?B?bTFMVUtwdGtxemdKYTZ3c1hlV3Z3UFRjYzFDaFFYZ3JETWsyMmV0MENLV0Qr?=
 =?utf-8?B?ZmU1T3pFSmxseDN0WEZVY1hsQm1oSDZqTmxWYlN0d1JSSzVHcjJ0TnVrS09O?=
 =?utf-8?B?M0hNcW1NbklJMUlYemNLUytzZ24zNGZ0akpsVytydEwva1h2Tys3bExvdWwr?=
 =?utf-8?B?ZzNXbjBhVUJ6NlAxMDJSWEZuRk1ucXd5Z05rUnVaalhUQm5DbnFXalJoUy9S?=
 =?utf-8?B?eG9iSldicFlnZEl6aStpaDNCbFQxNzFZYkU3VmloSC9kMHBDZWw1aDR5Zklq?=
 =?utf-8?B?OWlBVlp1SXRnMmFad0liMUNOa3FGbXVUdmh3UzZuQlQzVjZ0U2ZScEtENllO?=
 =?utf-8?B?bjA1djNtU3dzTzZvRVVmS3R0R0NxWHBEVzg2OWNJSUM4bTR2Z3NYRCtZaTBN?=
 =?utf-8?B?c1pwMFk4KzUwcVpQNmg4R01xd2x5Y2pFRG1OcmFGRmRwV2tlakpTbXk0ZDV5?=
 =?utf-8?B?QmF0VE9xU0tkMy9YRUtUMnVFeVRVa0JML2J0VWl1bCs0b2xRdXIyd09UenFZ?=
 =?utf-8?B?SjlNdWE5aU9Vd0paa2VRWVVXbnFXNmkwTHhMb0tyQTJ1alNzekkrZi9XZitI?=
 =?utf-8?B?Vy96NDRpZWdUN3ZjTFBKY2ptWE5mVkR2RDlkYjFDdi96RkN0QTRTNFRDQ0wr?=
 =?utf-8?B?RXg1ZEcvT3lla3hZdU9mb3NlSnlGejEyRithamJmZk5zNXhqNW5NSU1tcGl2?=
 =?utf-8?B?Y25aY1JrYmRaMnRGY0toYmY1bFFqRW5pa1lGMWFBeFc1WkhOeENmUnpLSE1u?=
 =?utf-8?B?Y2M3N2d5UFhwblVkUzlaMmxkY2c2M2NiSlZLT0IyUEJkd25tald1WUVkeVpI?=
 =?utf-8?Q?1gYvl5eywcs2iyFl+a+npbBIFDCRZRJRIpdc6s0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41000fc3-6fd0-4a64-8874-08d97f8c1a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 18:49:56.1528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqVxtr5ESrqLLT59hytcLUB9oZhECbQ9f9gaygd/B5VKFEGoStqtXjxoWjPrpYM6DIMDn/sz2jFCjK5W8ljn1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6785
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVt
YmVyIDI0LCAyMDIxIDExOjU5IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6
IGxhdXJlbnRAdml2aWVyLmV1OyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IFRheWxvciBTaW1w
c29uDQo+IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxm
NGJ1Z0BhbXNhdC5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwOC8yN10gbGludXgtdXNlci9o
ZXhhZ29uOiBJbXBsZW1lbnQgc2V0dXBfc2lndHJhbXANCj4gDQo+IENvbnRpbnVlIHRvIGluaXRp
YWxpemUgdGhlIHdvcmRzIG9uIHRoZSBzdGFjaywgYXMgZG9jdW1lbnRlZC4NCj4gSG93ZXZlciwg
dXNlIHRoZSBvZmYtc3RhY2sgdHJhbXBvbGluZS4NCj4gDQo+IENjOiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+DQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNv
biA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBsaW51eC11c2VyL2hl
eGFnb24vdGFyZ2V0X3NpZ25hbC5oIHwgIDIgKysNCj4gIGxpbnV4LXVzZXIvaGV4YWdvbi9zaWdu
YWwuYyAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5OiBUYXlsb3Ig
U2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo=

