Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2D6B85E9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:11:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrIn-0002a5-NO; Mon, 13 Mar 2023 19:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbrIj-0002Zo-EA; Mon, 13 Mar 2023 19:09:57 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbrIg-0007hP-Te; Mon, 13 Mar 2023 19:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678748994; x=1710284994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BgqztV9wP01csUvd3Cui3EK5B5YdJmuX0BhvVcM4d2M=;
 b=XPE8y4pznweV9NcTgX7Uma2DW+Wb+31zx/3PF0PphhBe5jF+h2D0ztM+
 AfW+8iUUbuaepRA0Ouk5tCAPW2D+OFONfL8kEKLSeHaR7lNj0ezhniYnJ
 7YANRnxXg8K6yhjAb8wahsUk/EA1/iAjOS/ugOzxq/7ZU5TK+ukzhySKu
 WmHew/TMPu/rr+EdK0peluPlm+nwi5HUC/WCvhHhrzyZYpB85CI3/epAP
 l3AzkIPe3dQbkc2hx8u2T5edX9a02WOMSH4deFtMTr2YJHV0xosxNBeBH
 L25LY0atgF0yjvp/uc6X2WSLEItpvE2FyXx3Pi1VH+MRNNp39+9uDeibM A==;
X-IronPort-AV: E=Sophos;i="5.98,258,1673884800"; d="scan'208";a="337561955"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 07:09:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlQxVssuAN3u16YAwbg4clIlgS1r1qL/zOsXb6lSYpBBt4c8ET9vY4NNjV7Hl3sIcz4RC8o73wt5ikSbL4FlPVyNObuju8k9s/4dr+Zp8sxrVXz5+aEtGeyFff6sw2SBAIHaIrwWp9F2fDTAHvY+2Oln/wNg1UKaILcOgWcP5+V2kTAcWMX2+0GqMsMJ7gcWxunc6R4091t+3cirPQxWbsj5jMwUXH0cuUJ+VUFzh+dPOKMY7BGCjocYyPCi4iQTFeIBYpMnQVqdJPBBYk3aZ2QUKzo3XuXl1ldx0TOKrh9ra8NsTx4DYYQ+GjucghXdReFBVx7N0cOwpvl4g/PRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgqztV9wP01csUvd3Cui3EK5B5YdJmuX0BhvVcM4d2M=;
 b=UkXXCk1uti7zO20DDwISorOOUx3is/Btk7bWI7slZfWsLMjWTy5ntKWrEwY6h6yoJ5OZSXvPSDo9SJ9w/FHB1WHenJz8T+awJ8TZoGiH6hb8xoZQ0kTQ20VBF4BqaBDcEZrQRu1tQCbpkUnZ3X2x5fEYs72u7Re8zlyX2ShV8Z2wPVeEhkRh2372o5f/necKXcq6cZCXamhS3t67Od2+4/8bTf7smKnQCiJesAzhMhYREAPsi88YZZwfFePHOn2ue7gUBXHJsKumNnmQfWHgA45S5pII4DA+tU1wUCilDWfPdfLQ/QxrAOVSOQSPK37Y4EbioO8vjfJLtuPJuwX6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgqztV9wP01csUvd3Cui3EK5B5YdJmuX0BhvVcM4d2M=;
 b=MquBKQm/Js2YhZqO3FpsJaVJPBlHEyn/XiiK9BFutEo218YJP5sWn67Vv/Ac15E9k1t9loKA4DU1+HjKhG04cNpX+B9seMMlNfhkUDu3vUVB4Ys0U62xOezMAnvDRKPgbB9milCAaJHSN7R6ctqFTbPKYtTDtFrHOpxvyCTsDpE=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4806.namprd04.prod.outlook.com (2603:10b6:a03:11::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 23:09:43 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 23:09:43 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "wilfred.mallawa@opensource.wdc.com" <wilfred.mallawa@opensource.wdc.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: [PATCH] include/blcok: fixup typos
Thread-Topic: [PATCH] include/blcok: fixup typos
Thread-Index: AQHZVUJsPqoaGQrtikquvPFXFjHKT674eveAgADcTIA=
Date: Mon, 13 Mar 2023 23:09:43 +0000
Message-ID: <c8174bf8f07ed333549b20d450aa8ff234bf87bc.camel@wdc.com>
References: <20230313002531.53161-1-wilfred.mallawa@opensource.wdc.com>
 <CAFEAcA-ro1h==JbPzE-Hi3QAig7xRgvkh+Wfdy8zJXtSqLU=tA@mail.gmail.com>
In-Reply-To: <CAFEAcA-ro1h==JbPzE-Hi3QAig7xRgvkh+Wfdy8zJXtSqLU=tA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4806:EE_
x-ms-office365-filtering-correlation-id: 24639465-94bc-47b9-2750-08db241807d2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9pEgIii8Pgtx46RsJxbctZLl2RTtMdzjXuAHJ33QNYOoJJgNuAIkQEmy0GPdcpEZ/Dp+fanrDhYF8ksdwXQUoOX7vFR1ZNwwq4WVywh1u7Ve6jQIrjebM6dD1dKpC5/7A+jJcX9yeG05b0awEptKKcE7g1xRYIzZWWkNTIE45y3L8E+aIez4ljKa5I+s/wLNjPsDjbsMJgau9jBdTIIu2UsT8SGBJewqhemMEjYPYJ3pOae2ldsT5PqgMD8nZLnDovHYf8HkhccYOmgap7sSmI3NyHIE+9idlzwOXG1ArrdW80uzXLpsNlsi7ZPmTiAj6aPE12jshn0f8nCZtKCus7f7NKVzURS7oTCDgG0uaIukfTpHe7bMVuCe9m4H9xr+sqz/piVLycPVMbb4YafMByNn88LnzOIL4pa3fiw2KvucB7grXlIHSXsZxT3skmuw1ZNp2MGFkN157XPOtjIL4uYy7m2JfjqYvgC1zdjUZIt2OBJJ2aOLdJ92Abj877rsyI8HhxtosySx0yMgJKHR+J15hcwo4Xn2+Wbnr1dcauAxZL4tOUgiYmsr0PWQBoHuiigzUd6lSUzmS6ZzH3BP3u/pCaXdKNgRV2JkrgPIWVkj5buSDWKefru/6BAsAXJw6U2huoDoJyLgu6/irrCeUqyddIwGr6ZD/VOdIKOGfk8sp7tqVsLQQOgv3YGQUQgmA9ukG0KGj7ao+EH5Os3HQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(86362001)(4326008)(26005)(41300700001)(186003)(6512007)(2616005)(5660300002)(8936002)(54906003)(71200400001)(478600001)(66446008)(66556008)(66476007)(110136005)(91956017)(76116006)(8676002)(64756008)(66946007)(6486002)(38100700002)(122000001)(82960400001)(38070700005)(316002)(2906002)(44832011)(4744005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clJ0L0VMQWthdENGRTNPTlhUQWsrT08wamNUeTJ1clhoWUhNdEZHakF4SkVZ?=
 =?utf-8?B?YzhrVElGdnY0ZHdqcHExUW9tVWZWVFY5aFNKNGdmUzFKTE9mVlovcXUyNHk2?=
 =?utf-8?B?bFI0QkFUVWtuSmc5VndLVzFSQTFhdVBQZk8yKzJUMkxaSDVSdFhJSzM2NHg0?=
 =?utf-8?B?Tjg1ZGMrNUc2WjhXckxWaE9sT2FkT01nUkJtdVc5aEUyRThBQ2drQW9DVkhz?=
 =?utf-8?B?UEpROUVwd2dIQ3JDc252eE1MWUl4TXdoQ2hXd25pYUF2VTdabWllcG1ac1cw?=
 =?utf-8?B?Q2tSN0J2akJMTndoaFF5MTlHLzAzaDgwVGQ0NWplTkswdWJFSFUxT0x1K2VH?=
 =?utf-8?B?SXExZlZZM2dhMFJuS1B6WllQOTBxdGZJck9QOGtucERPdElXSEpvZktIUzVM?=
 =?utf-8?B?NHdPUGVNeUhDejRqT0h0U0poeVNCNmNjNW1LU0s3eUJSajFhbGJKQW90WHJi?=
 =?utf-8?B?N3I0ZWZQM01RTU0xU2p1R1QzTEFybDk4Q09JOUQzQTZ1N3BJQWQ4VDFXVGJO?=
 =?utf-8?B?M2lyL0dkZkNib25JV1dlTG01eTErQVJKVDA2a2ZtTDRadytTZy9DK2FDN2l2?=
 =?utf-8?B?TkUzeVVBTyt3RHJRSmF0anRXM2YrdVU3S3JPbmxyS2lkV3hXZ3FpTXg4VUNT?=
 =?utf-8?B?dkI4WktvNFJ6VzJhZWt3NGIwREppTDgrYjRlUWlJd3IvQVVXMlozaVdvNENG?=
 =?utf-8?B?YTk0UU01ZHMwZndFeVczMGJXeDlQeU12ZXV5MFgrUTRDbm1kWFdNYWoxQ2Rw?=
 =?utf-8?B?ZWZ1UkNjRDN5T3BYSFBXZmpzOWxkSVpvdUlza0FpcFNJcFZJajNJVVFBTkxt?=
 =?utf-8?B?cTlZbVN2anJRdEFIOTFheEJkNVJNRU5DV1BxZTFkeTM5aUUrcnNTRzVVMisw?=
 =?utf-8?B?czJYVzRpemlHRVlVeW11Q2RPam02aC9uSHMySERmNzdpZ2pSVmN5TDBuZkRu?=
 =?utf-8?B?MFY1aXJidTc0SkJsVytKVEdrWXZBTW82dEdaWkg1bFJQUDRvaFdGSEE1Rksv?=
 =?utf-8?B?U1ovcFB2RUdNOC9XMlpMRTh5VTdFaVgxOEpwcERWaEtwTXlaQWluN3Rlb0pD?=
 =?utf-8?B?SzZjUzRtMU1HcW5nQzRuMjlOaWZiT0NvVFptbU4yeCtBT3lkdWJPdXJMSDhE?=
 =?utf-8?B?N0t2OHdWYktsRk8zZTE0d0Jkdk9iQkdIVGFKdU1iQ3Y0TlhxRndFWjZLMXdj?=
 =?utf-8?B?R3lEYkVjQXV0aFBNbjFNeFNCU0REUk9IQVlrNWZlNVN5M3Y5Sld2dFZVa2lq?=
 =?utf-8?B?bFFqbmxMckVQbkovNW5LSUM0NzM0MTVvV1NvTzdObkJkeVE4aWliL25kOVh5?=
 =?utf-8?B?R3c0czVaQ04wekpiYThZN0F0Qjh2R0VpelF0TUVpRDB5ckRialU2MWpBeFU4?=
 =?utf-8?B?bFB3K2hKZHFKN0FWSmdiem0rM0pnNVB3Sm9RTWkrOWFLTzRmRkQ4dkpta3Ji?=
 =?utf-8?B?UXhBWUhrU0wxcXdnTEFnd211UlF5WEx0a2VkSEJ0UzU5bHh5N25nbXdVY2hr?=
 =?utf-8?B?dFJOSGV6VVAwTDE4THIya2FpY3ZEZE1XWnhjWldTdWdoaURiRUl3RjNMQm5s?=
 =?utf-8?B?SVRoNXdzT3IwYzJWeDVqblB2OGtNNHN2VC84T0FLZkVnSjZoajFtQnMwOVJM?=
 =?utf-8?B?VGRtMXVXRE5saEJIZWpENTlya1lsUHRYaldRd0d3bE5SbndIZlFGaG9MR2RI?=
 =?utf-8?B?WnBIL2ptalRSNVlObzBFU1NGd245WG14U1BWc3FkQjZSTFhJTUg3eXdsbFhw?=
 =?utf-8?B?dU1uS2VQOXE0dlNSQU43M0VFbUl4V3lieHFEZVFXZnkveUMyZmd0S204SU5H?=
 =?utf-8?B?SGlNdUpNZTFUbkRybmU4dVcwK1ByMWQ0ck5BVE9KT3NqUEVrKzZyeGhBaW0y?=
 =?utf-8?B?UzBWblE2b2Vid0p3LzkrRE9jR1l4UnFEQVk0QktLRVR5TEI2Q0hYNy9FTlNV?=
 =?utf-8?B?aG9xcmdMdGZKcWl1Z0Y2ek8xZ2RqVVROSmFVY2c5NHM3cHF0WmtBRktXWVlT?=
 =?utf-8?B?RHViK0dIdDZ4Zkc3czFBejlHazcvRVRIcXNUQTV4ckw1b2g1T2orYmxVRFlB?=
 =?utf-8?B?MXdubEt6V1ZXZ0lVK0xsekZCRCtPb3V3eWpHclcrRUlaSFZJYlhYa3MzNWR3?=
 =?utf-8?B?YWVNWm1FSS8xNUtxWlBiS1FSaXRBbGJTckFCQTNOdmxLTWNsK2JwRERiS1hS?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D98640240DE2AE42B90D999E71F62F87@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xco2LWBOLnw8TgNy6CNHkdzPYSe6wO4hOxFc4hRRtrBvKt3qflfw098pEYAT07CpadvM4m96RIbgpVf6auWVDerUEYx2XhiuRe6SdsGR8B93MWZvuxh66nGjrBRAect+gR88Awoz8pGnCgen/O5VGTUFjixtY7SqafjdolOGmQk3177gEBFupW0+MmWKxYbXKSNj6+2msyqkEaUhZc19Kb1ll6Mzoyt7FyDfzLtPnV9Uhm7IhPAVlFg1Fo8+k9APAE3qsjovgplNvz2VNS6IAwDiWL6dq/v9eGPmOfsNRUjWBdRBdUZgctGjKKi2sjvYu7xPoFqmAwwlexIEdYNzJdD327j0xdnIti2vVgM8B1zjIueBvI+Aj9jxqdqGCQtzTd/wFKqs6ZQqGnMCYWcHNWF8xznzbzea5bTCltsz3+zDcZiSb8A0s5yhOIDpkK1t8EZFBMwj3DPm1BB8K5KJ61FMQ9bG7LjpIJmpkFpkl08BFu3nXUEHX5ATntw37WruvgHLMcrdS8gHhSG0/r4QqikA3hgQjDA2eiSrs3j5o3+iSSl7apPTTC3RiaR0XaLzKdlYyxyGaFhED0OcuG391OHZg9Stz3p4Us26oRGHuPQOlxuhgExjHI7SkwROa0SuHpqz65px1Hv5/DpRoXLWzjvnb+kgTPhTpEGmHaQGH/mC9EiCmg0f4kT52M429C1mKdmK2xMYiTLnds5CKlAcHSiNAteYKOWostJixEhW6uv/6ejR4vwiFXUvcvUzUFbnC5gc5+kmSx+1Z/HnWtoOByJQc6h1XSOXL666xjyVvjl5NYqpOna2xT7pJL7QUsOpRvuGMzYptjcAc+KdQn3lKfJ2B1I0dfdOK3XgOL0Vf2k=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24639465-94bc-47b9-2750-08db241807d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 23:09:43.1929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+vvwIPmlCDeOkupVFWX8ip9Vr6X981SSWZvzj9ex2py6452zbnrY9VgHBR9Yx84oaiw/zhcaaKOUTvNw/scMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4806
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=42906d642=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
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

T24gTW9uLCAyMDIzLTAzLTEzIGF0IDEwOjAxICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0K
PiBPbiBNb24sIDEzIE1hciAyMDIzIGF0IDAwOjI2LCBXaWxmcmVkIE1hbGxhd2ENCj4gPHdpbGZy
ZWQubWFsbGF3YUBvcGVuc291cmNlLndkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEZyb206IFdp
bGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+ID4gDQo+ID4gRml4dXAg
YSBmZXcgbWlub3IgdHlwb3MNCj4gDQo+IFR5cG8gaW4gcGF0Y2ggc3ViamVjdCBsaW5lOiBzaG91
bGQgYmUgJ2Jsb2NrJyA6LSkNCkhhISBhbHJlYWR5IHNlbnQgYSBWMiBmb3IgdGhpcyA6KQ0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMu
Y29tPg0KPiA+IC0tLQ0KPiANCj4gT3RoZXJ3aXNlDQo+IFJldmlld2VkLWJ5OiBQZXRlciBNYXlk
ZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQoN
Cg==

