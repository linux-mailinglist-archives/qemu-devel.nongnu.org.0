Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9E652BFB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 05:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7qHP-00073v-C4; Tue, 20 Dec 2022 23:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=347c49317=wilfred.mallawa@wdc.com>)
 id 1p7qHI-0006zy-26; Tue, 20 Dec 2022 23:00:27 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=347c49317=wilfred.mallawa@wdc.com>)
 id 1p7qHE-0001sY-DH; Tue, 20 Dec 2022 23:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671595220; x=1703131220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6JSV65/HSRmCCC26cxhTNg0HEDSK93Ub9jExgzbPpHU=;
 b=DH4CIac2AvpZRPbWi89bvVobSuqXwaswT2QQqqE41L8IzHiBa4RpMB8D
 6IGhsittw4Vvo0PzvaQGqc9dKTF7YfWG3PLFChkZh+jFuMoTKNs/r4uMj
 tQm9ZvIAYGiV5KTYsRerzz2n8dwKgb+6olyLKutuuoDJP5XRhBPa420K5
 CZ/F44uM0TfTAEg8cY6SyZaViue7nxlu6pu7EZfd1Or3XIaLxkS7tmMrb
 0yTYMwYPIoGiEKEGT0Xpt4dQA2ENQW1+Anzy4V2dlEYEJNHFAZ80jJUz2
 mS3+Dn2VbDRntan4V+Ha0HUu0rs/5NlnGpfM9wVrMzlg9BChhSrJmGYo4 A==;
X-IronPort-AV: E=Sophos;i="5.96,261,1665417600"; d="scan'208";a="217367104"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 21 Dec 2022 12:00:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXYL4qUtqRsRYgAHMHq8nAdzpjoeohcbQ1mPSqmrJ/aIN1llBwuPDaMNwPCBQRPRT/NBq/dGAptMeltDwiNsYse0OXmPjBljI+fq1SzhjeNlWmcBcGbtedcscIrsJyGrlpeN0eBz7cQX9MXY15+SYZMdssEoCrBEou4H6U4MsgL8Mrnw5f/HU3jZVJ+SXfte3DXJ9veIwe9SGCYPZVt1laRmhmAuFNt5ji43/J4NyUoI8ybgOViuPLyCLdf426v55DR4V+YzkzDeD6xtkHJiV5ciaK/2y7qrP5VPO7cjlccKXbiEgnOJIptumessURkfki76wn5OHH8dNYOc7PyUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JSV65/HSRmCCC26cxhTNg0HEDSK93Ub9jExgzbPpHU=;
 b=TdsoMKqL2yWzAKi578FriZJF7IdN2SPA1Z1aX2FcJeze0cjl0tXZofEJkgFlHb1DE7Vb1nrHVXlu3CbMoGIQnld+2oqjCNYV1A+fi0nTiVh6ApeRsY/n3eyTSnrgO+vF13sv6K5Hsk9rxHcZ+thNxPm+jZ4ZVt6blJRkqqkcUHyjup2RdK1NnAdDC0da1ANJwaPspFJ6VaaThNlCRH+lDtJWKLFGzqm8U1HMfqHRCyMKt3t/np87e2a/+sahDCuYhkssokN2C2Pr/p4Ap3Qb3ewFomGCMhE7F3Ckq4zpJSVXsVoSO+afMCRexCb/8oc9Mnz2ukOQ/PK6Ph2lRg4ruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JSV65/HSRmCCC26cxhTNg0HEDSK93Ub9jExgzbPpHU=;
 b=WqJmZhymavSwo8NWgSbipCNP1bDOkmdjiw7mTIUHEzWTpQvUjQOyTleY6dU2MWgS6bTOMFDt2Yeph3Aaj3UZnj0aEGIH1Uh9KU+n5ep/Fdjukn/jY6Q7gfLkFpSLpaGpgCG7U/0n8Czt7jv/Yvio1fETvkos0vs7O+O4ASzSUJA=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CY4PR0401MB3585.namprd04.prod.outlook.com (2603:10b6:910:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 04:00:06 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 04:00:05 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "david@redhat.com" <david@redhat.com>, "yangxiaojuan@loongson.cn"
 <yangxiaojuan@loongson.cn>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "iii@linux.ibm.com" <iii@linux.ibm.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] cpus: Remove system reset() API from user emulation
Thread-Topic: [PATCH 0/5] cpus: Remove system reset() API from user emulation
Thread-Index: AQHZFINcGwcMx2g5AESvN336MPs7oK53uGIA
Date: Wed, 21 Dec 2022 04:00:05 +0000
Message-ID: <b6776f839f0121bd3c98a51318bc6636f3f33fb8.camel@wdc.com>
References: <20221220145625.26392-1-philmd@linaro.org>
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CY4PR0401MB3585:EE_
x-ms-office365-filtering-correlation-id: 22bacde2-aff6-447c-49aa-08dae307d837
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G1a4KrZu2WYwcJp//o/hl9e4M8R3aOCtRHb+C7jrbzT8s1/uCEZBQahK6IZoc0+ythH6M9IAQyutt0J5OH/03icHlnUUeDocGamfEjQA3GsSv9MVTUZP/sZYxbJ2FPZjFAm+skHKY/csrtKYCbzLmJoQ4KJ7HoxQBh7qP1G0N1foDJJURKbr3BbDa08ZFihGcKVVutuQDqGw4xXSSGqWTgHP2qIFj8rW+41P0lQLCTO6Brh+2LnB5lU1bsqbvDH1kNksglYrspS1imI2pQyUZOuF7L4m9gim1cin46Yzxptjt41ZvjRp9CzVAKX7tRPnU8hk4G64dLw1q2xVGVcwfwTBJzwiYjC7K6e6hhgO92DGY9n8KZ7ynlhVR7BJ5s2ZNWzj7lSSqY5X7eT9p0nplr0aeJkl0x1nlKN70GapciHmxTqqiN8TzYOGCmP5GRV817ndVzeSp4YZNr3suMedelbwFVCgdu8w/X364KjgdfsWqFNrrQRfjHCmr/R94sFcd8y4EpEAVEOxJoctk393Oggo/WB1PQNgkO/wDV7QXY17GJU3QyaZcw3O76IRtYFplSMB2rIOAPYhgK/S1ayI2pXObLYC983Uc1qgBQp8KOWjgYgSj47/xr3AHvH8eCS8O818SsZRWeRnlHJ+7Qw63ZW7z+73Th7Zio//6FubF+lybKDJ8oywpnuC960Bm61z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199015)(2906002)(38100700002)(122000001)(4001150100001)(41300700001)(36756003)(91956017)(82960400001)(6512007)(26005)(316002)(38070700005)(186003)(86362001)(478600001)(66946007)(4744005)(44832011)(7416002)(5660300002)(66476007)(6506007)(54906003)(64756008)(2616005)(8676002)(66446008)(66556008)(76116006)(4326008)(8936002)(83380400001)(110136005)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU5Qbmt1bnppa2duVGVaVGxJMkJEUTNBQjhLR3JpRkZ4ekNydmZKV2diSTdO?=
 =?utf-8?B?MklNNHRKRnVHMEpjSk8xQnJBL3c1akdsZ3cra0JRenNtcG5tQXc2SjhuSzBQ?=
 =?utf-8?B?SldvSkxsbmxEZlRJM2o1U0xFNEFhRVp1NHpMUVh1bWxDd0ZQbStZRWlRMm83?=
 =?utf-8?B?WVpmSmJWY0thVlJxTXdIOG94enY4WTU5LzB2TzRJSkcxNEhNamJSTjJJYXNT?=
 =?utf-8?B?RWVpMkprWVBLZ2dKL016TVBkMHpSMUN2WWVBSWpCTkpkTWhTUUxNK3JRTFNF?=
 =?utf-8?B?S3FENFkyWlJqVWwrSVNocDZoT3pwMFRTekxKN0VURWRuUTI0aG51SGtjL040?=
 =?utf-8?B?OG44dFNaYTVPWlBsdFdqdmpLbkI0SDBPdGgzSnlLNGwwRDRhYlZYa1VHRmJD?=
 =?utf-8?B?cTZCelR0UTFGRnFyN0ViUnNiUjlCdWJwdHFNWWl1UkxmMkIrYWlCMzdMNFJn?=
 =?utf-8?B?djBzTHFCRHE2L3A1TUdRTHNTQk01SE5aWGdFR3lvV2JJcDZJZWJzZVdTWFZw?=
 =?utf-8?B?NTFjTC9iU3pMVGNISXdxZ0JudkF1V2phaHBuTEZPOWxKNm4rdEUwQ1k1VDl5?=
 =?utf-8?B?K1JXNVlIUXk2eTZBVFFXbVVSMTlzcTk0QVpTQTF0WjJoemdCcFFwWVNJZnVN?=
 =?utf-8?B?V1p5MHlyeGx0ZVM4WUJpZ2N0RzBXR1Fia21SMXZXbWV0RHo4R3ZwZjRWVlV2?=
 =?utf-8?B?S3BPSTFjdEhjUmZtcExoSkVPRjR0ZnJIUHM3TFI0K01CeGx2YTF6Q1hvUmhI?=
 =?utf-8?B?OTd0WjdHS0Nldm5qZ1VDRXRQR2ZaZzRaWE82eTM3Sld2V01tMW9ub3ZHdkZF?=
 =?utf-8?B?Q1h6VzlSQTZlNlRFNnBrZUdWT3A4YWNjSUN1VjFucEtvc1V2S2xUeWxLNlVO?=
 =?utf-8?B?dzhNUjE1T01QYk9TMStDNG01QTdkaFNXd25qa1VtT0x5alBYRitUQkdWcmJN?=
 =?utf-8?B?T0Znd3g0ckdPZU1JaWJNVjlNdzNQWVlYRW51dnBjSjZhL0RIcHhKOFRacjJL?=
 =?utf-8?B?OHpGdFdhSE5uK2QyaVp3QnczMDRLSFVRUWRhWGwxNFVFakYrcFQrZzJTd2dh?=
 =?utf-8?B?S2pWQlFKK0xVVG13T0MzV0ltTTRBQm1QN0p5Wm56UVpKellwd0pOMFh4K0lT?=
 =?utf-8?B?TTltWklyVkNuSG1lVDZtY2F3N0QrbmVzaXZlM2VGMklZZ1FUV0tZWXh0WWdu?=
 =?utf-8?B?bmhrMTNIMEpDL2kvcGxWSm5LYkY1NWk4TGg4S0lqRDBCSWdwS0lJcHBuQXlp?=
 =?utf-8?B?WGNlcWhlUVB1d0RpeVVCRllsVWd5TkVjVXJGZWtrcVg5V2J5cjJIbnNLakYw?=
 =?utf-8?B?cVl3U1VDbU82RDZValJiZUpQS2JuT2tSOHViT1ptWlVmeFlpTDRsdmVEdXFY?=
 =?utf-8?B?UmRYMU9NYStsNjdmQ3VycjJiR1IyZnJiRW1OcnV3TFdKYThpN01jK2FIMFV3?=
 =?utf-8?B?VzdZQXU1T0E5Z3RwZUJnRis1OHlDZlRJNmRhU0dGUDRJWmNKS3N5c3psSWho?=
 =?utf-8?B?bDM4RG53QzF6SU0zVWdvQ0NOc1BpY0lON1g0aUZiRkFOaldQRzBHZUo4RkdP?=
 =?utf-8?B?aHBNdHBtT28vL1JXV0Q4VUppYm1YUnNvcVZFSHNqWFY1KzJvQzhCL29DY3dE?=
 =?utf-8?B?Y1RIVmRocWZhRFIycGF2eWEzT1VlYlJMNWd2cHc1RklEUm1teXVHK1FVRnh5?=
 =?utf-8?B?NlRpUHdXK1Q4RlJtQ3M1ZXRjbjRGUXIybWVLRnhsUDFyajNOVWdJZ0ZrOTFO?=
 =?utf-8?B?S2FUQVErQ0JxSWVxRzRIdXJSOVk0bVg4Sno1cXpnVEI5Tm1Sa0QzTFlMWVJU?=
 =?utf-8?B?aGFJMG1SNTRmZm1PZkFnV1JvMHdvcUVhdlBnVHR3T3lLZWYrTXlldVh1WUpW?=
 =?utf-8?B?dWd3STdCTXdYc3I0eG1oemdBVDdwcVFhK0pVY3RFVjRRbWZMYm1Xek5rbmc3?=
 =?utf-8?B?MVhlelh1K1dEZGZ4aGVOOUFBMHNRc0dWaFV1VUhSS2RuU0c5TXZ5aGV6N3k0?=
 =?utf-8?B?YW9heFIxRDJSUnR0NFlyOXJ6ejV2ZUg1VzZVTHRnTnRydjVxeUdtWjllZVZF?=
 =?utf-8?B?Ni9wWFVkaHpQR2V0WkMzcmM4UjBHQ2VHRjZyN0VoTWxxYjJCQjJQd2RwNlNu?=
 =?utf-8?B?K2VrOHVXZzZobFVya0E5OXlCblZzY252YlNRb3F0ZmphSmw5eEFsYk00c093?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9B15F1F07FF2849956059D4175DFAB3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bacde2-aff6-447c-49aa-08dae307d837
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 04:00:05.7968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MmByiDNZoUa84Oitlntz6Ud4kFW3sp1XO5P/cAtQnOsbTzIG6XSrpo9QckcFWgND8nWuEJBJUbZ9Eca58XhnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3585
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=347c49317=wilfred.mallawa@wdc.com; helo=esa4.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gVHVlLCAyMDIyLTEyLTIwIGF0IDE1OjU2ICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToNCj4gSW4gdXNlciBlbXVsYXRpb24sIHRocmVhZHMgLS0gaW1wbGVtZW50ZWQgYXMg
Q1BVIC0tIGFyZQ0KPiBjcmVhdGVkL2Rlc3Ryb3llZCwgYnV0IG5ldmVyIHJlc2V0LiBUaGVyZSBp
cyBubyBwb2ludCBpbg0KPiBhbGxvd2luZyB0aGUgdXNlciBlbXVsYXRpb24gYWNjZXNzIHRoZSBz
eXNlbXUvcmVzZXQgQVBJLg0KPiANCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDUpOg0KPiDC
oCB0YXJnZXQvaTM4NjogUmVzdHJpY3QgcWFwaS9xYXBpLWV2ZW50cy1ydW4tc3RhdGUuaCB0byBz
eXN0ZW0NCj4gZW11bGF0aW9uDQo+IMKgIHRhcmdldC9pMzg2OiBSZXN0cmljdCBzeXNlbXUvcmVz
ZXQuaCB0byBzeXN0ZW0gZW11bGF0aW9uDQo+IMKgIHRhcmdldC9sb29uZ2FyY2g6IFJlc3RyaWN0
IHN5c2VtdS9yZXNldC5oIHRvIHN5c3RlbSBlbXVsYXRpb24NCj4gwqAgdGFyZ2V0L3MzOTB4OiBS
ZXN0cmljdCBzeXNlbXUvcmVzZXQuaCB0byBzeXN0ZW0gZW11bGF0aW9uDQo+IMKgIGh3L2NvcmU6
IE9ubHkgYnVpbGQgQ1BVIHJlc2V0IGhhbmRsZXJzIHdpdGggc3lzdGVtIGVtdWxhdGlvbg0KPiAN
ClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0K
PiDCoGh3L2NvcmUvbWVzb24uYnVpbGTCoMKgwqAgfCAyICstDQo+IMKgdGFyZ2V0L2kzODYvY3B1
LmPCoMKgwqDCoMKgIHwgMiArLQ0KPiDCoHRhcmdldC9pMzg2L2hlbHBlci5jwqDCoCB8IDIgKy0N
Cj4gwqB0YXJnZXQvbG9vbmdhcmNoL2NwdS5jIHwgMiArKw0KPiDCoHRhcmdldC9zMzkweC9jcHUu
Y8KgwqDCoMKgIHwgNCArKystDQo+IMKgNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KDQo=

