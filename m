Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1C3F42FD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 03:23:05 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHyg3-0001iR-SF
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 21:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mHyeJ-0000Oj-Hq
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:21:18 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:50791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mHyeF-0007ns-Rg
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629681672; x=1661217672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XppQiZYC0JGOc3HA1jhqeeAK5mk7JhOohridSEFJ/08=;
 b=YY0I5yMoex8+eIC34PYTC4KzRsy6tyoV5TK9OMV9eqn0kqCJuXlNocTD
 oz2u/WKBDCiXLNSTFMHceVv4aTiGkc6NKQC9Ue6BnpD/nOlV4M8t0A1vm
 mBlyuWU2nAnrfwt4T9b3I3qkva71VstH/SZyk3zWmIBrFI3muadlQzFmZ
 T7dyvx9AVeqL7nTnWYRrKU/1Vxr/a/dVCVhdERuE/vhsq6c3bl+kCNo79
 11ElBf3SUxRklR//DbZ9De25owWCK3HF79fm18wj4xtdDZcE8ekgwgK69
 AupPaHhWR931G5AwE2IIVsGvj79d7QWBETfugVWJxvPGYtPiSxP9lH7c4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="45462327"
X-IronPort-AV: E=Sophos;i="5.84,343,1620658800"; d="scan'208";a="45462327"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 10:21:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKHZ2jy2Shq3ul63ELE3LJv4XLd9R451Ae2pxam7aB/n2jeBr5kt9o+TC18321fqDX0RPltLUl5uAHHKO20SUgMEhwj1Af1srrUA1WjjJD/DqkY81hzi5wZoN8s+3et6frOqm/8EUzuY/012R4GlNE9/S6SFF6fJVgR3kfqgH997VkPr9wDc4Q44OvcuLlalmGfGFtteMImOgYyO1L/CidVHZO72rFJalD9dwoOMPhde6zXdo7goLvvFrlE9XuFD/n60r8qXccjeNkKHrupULb1iXbW0FrZ5WW4aw2uolPnO8/T2CCW9wBKlCeYPDcdLEXOlpufQHmmm7H/4liE0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XppQiZYC0JGOc3HA1jhqeeAK5mk7JhOohridSEFJ/08=;
 b=Rf/eQotocqyVqsJN/NyZLBMYo6bRBDIirZj39vt710Tq/zITAlpDmHrS0sB2JK8IYWBd4Yptm6Ccj2MXq3MgXoI6WtAE9XvmcBouLtUOdoJ2WAsbVVt+5UJIclcif4IVCO+d6EDFQSfLUSppucE8nv+LmzShdpZoQt9r6HpN1llPl2DnXNGNx6QlKb+tu9EQ1FcSfgQUtyzu7QoKzdOTfv9r+bU1mHBnspaE9spdkI4JTRiNXOPsP5psNuZJm5L8exomBa6C8jjbmGxr1iMd0SnAdPW6SztGDpk0nQQPHAOsY/a+bEJGDxBK08yBk1MnhV3Ibso1f0M9lIz6DDKaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XppQiZYC0JGOc3HA1jhqeeAK5mk7JhOohridSEFJ/08=;
 b=BLqGPPEVQnyiZSqN8ydrZ2X85Te88obqe927dLwvr7+1uqkphNpHxiolcW++YkyKUxPoImCP152I6HpeuvBZ6inJIE7eYCKHSGi4ckqoXk2hVkkOv5i7nhOh+lNs7ekGofX/hn54xDVmLwfJz4bEeYLV+4dyAT6x+S/OaDyGirU=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OSZPR01MB7699.jpnprd01.prod.outlook.com (2603:1096:604:1b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 01:21:04 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 01:21:04 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>
Subject: Re: [PATCH 2/2] migration/rdma: advise prefetch write for ODP region
Thread-Topic: [PATCH 2/2] migration/rdma: advise prefetch write for ODP region
Thread-Index: AQHXhhQ8OdZOsCBcH0a/6tG8UtNJv6t/VlEAgAEXQQA=
Date: Mon, 23 Aug 2021 01:21:04 +0000
Message-ID: <f5ba3794-a87e-e456-84b9-8211fe6a5e85@fujitsu.com>
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
 <20210731140332.8701-3-lizhijian@cn.fujitsu.com>
 <CAC_L=vUXYjyZ6qwg6LoStSVg0sBbZtS_wO9FRLa0Dp4b_rYobA@mail.gmail.com>
In-Reply-To: <CAC_L=vUXYjyZ6qwg6LoStSVg0sBbZtS_wO9FRLa0Dp4b_rYobA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae58df83-b259-4d7f-f8d1-08d965d446ee
x-ms-traffictypediagnostic: OSZPR01MB7699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB76992710FF5B2C09289E78ACA5C49@OSZPR01MB7699.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lup/W+1E/A4YUD7hkdv1OyC5ZdjvKh1BqY05yq54tt47ObaHZ4A5u+D1HK6rVwcXBIxq/UhTDJUU44zoBbmNJaCeaOp+ulDAaGIGFgMLPjYgYojHWeqLpuwK7Kr46QQnaS0WDbYrrcw4Y/Dg9ymFJrQeJyJpEc394+WaDbfRE3aKLjCLjU8i5CLTmh/RsOu1TAaGn+/yRdrixMK8E7p6bl5pOHNfBzmnPJXWTijFCXSoxJQINc1gKN2wMqXZ1Pf026j5jl3fTjtpo3NyFIDJYy4Dqopqp/qi1ORjtsbwPtaraEUrL3VIYgZuzkLdaZG80EI6cngiIWdqkOb2w5Qjbc0w7nJZYsaaEt+g6iyzb1Vf7m/cN0ptjzDfgVPSd6SqSrNAZ+1EZqNyzrdXR2UtXPzTon9o+BaPTTZiLn0P4nkPGpyhmfd9dexPzhKwfJC9A6gkKTrQWMKz1caaZBSPSymzoflQKY9Yvf2Co+L8UuGn9cZsgFVqMcgsDAFQo2qh3DPHcg3uDRTCzc6JT5X64PZuQ5blxNeU+az7VxIM3tsjGFcbIX283/qrKb1G/u3HYnvsd4bEhtJF9S0P2uxdw0i4gd+2Ah57GrVZ56OoApXPLsAk36Zm96XfYc9rN8EqUZejVNrduP1jmv2Br/Fnk0SY1CiG4W2YdSO7eq4K6+vuLLbZEvizD7IUtNHgYBBCBWP8Vdsv/4cigfLCHMhqry49FOnev6rv48qzUIFTE5q0PsK5FmE2skcyyI+nE01H74dgQwho10pieoWXzxGE6zWlUBrGB10F/Fp2Q3fCgBALtGaRuIGzJ1BkmdR29J2VkzkHXj7cFrrLhT+G+qXQiLzPXKN+xPXA2TDWqJnAbkA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(26005)(8936002)(6506007)(53546011)(8676002)(2906002)(5660300002)(186003)(4326008)(54906003)(2616005)(110136005)(31686004)(316002)(38070700005)(86362001)(38100700002)(31696002)(122000001)(76116006)(91956017)(66946007)(66446008)(66556008)(64756008)(66476007)(966005)(478600001)(71200400001)(6486002)(85182001)(83380400001)(6512007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2g0OUc2bzRkVkVaUU9nMzZIeUttM1RwUmRreGY0MU4xY1ZaTlNjbTlXT1ZR?=
 =?utf-8?B?WnNwZlRmeVlSNng2dWl2azFtL1ppTHZ4WEZrUkpKcXFmbUFCWUJEZSs2QWpo?=
 =?utf-8?B?MW5QdXp5bm5DVyt2Y0NoQVFCTW00L2hKaVFBOG4zZXhXUkZBZFh1aVplUnB2?=
 =?utf-8?B?bjQ3TkpDTmYrZlZuQUt0QmwvaUpyUzNjTU5Rc1V5a0dYcEJ0SGxVaW83RnJY?=
 =?utf-8?B?bTNzOEM1djNhaCtEVzdNbGNNdThzTW14NHlLK2F6ckZIOEVPZEI5WlMzSWNY?=
 =?utf-8?B?OTdCVUE0MmlHZ2JQckMxc1A2eWtjMHhueHk2dTFFaEpyY3ZSYnF3b00xa2JU?=
 =?utf-8?B?MUpuWWxLVHl0L2xWMlhYbWJCc1ZPcEpySUJNckgyTUIvc3ZlZm9NalRHSG11?=
 =?utf-8?B?Vlk4Sk5XRUU0c0JZaWVtNXRmUHdWRFhxWHRLdGRkYjhwOTlxVXYra3NUTWZH?=
 =?utf-8?B?VHVPa2NGT3JQNUw4Z3dsbkJwSEdxRDcrQ05XN2tJc28xZld5UnFvejdsaVpZ?=
 =?utf-8?B?L2JiTmt2UWVZUXp5Mys4MEJjVEF1VnowVzdycURjMXFSUFo4dmZUNU80d0Ry?=
 =?utf-8?B?NnNJY01vRURNN1FDNkxPZ3A3QzEwSDNCbnk2WlBUcElIeWRIdk9hdXB6RmhL?=
 =?utf-8?B?NlBXcVJEbUlQV2lxR0RSa0JuVEd3aEpnOFZIYjUrWDFPY25aTTB3bFRuVDRC?=
 =?utf-8?B?NW05em1HdSt1Zk9lY0twcGM4RHNFc2hhZ1dpT2Jnall6MWI3ajdQb010eGN5?=
 =?utf-8?B?N2UzSmkrUTZReW94ZUhYWU5KTVp3RTQwTmJ2bms2YWt4Z255bUFEdkxabHZT?=
 =?utf-8?B?SVdJekplSkJvU2F4emxNSEFHUzlQOFVVeS9jTVRKR0FzZnc0Z0xnTGFtbURR?=
 =?utf-8?B?cm9uNDV3OStaaml4N2ttMkpObGRURklUdExaeWFGOHlhVUR0OTZKWkdabFBX?=
 =?utf-8?B?cUY4Q01vTUZFUGJQVmpJK1VxM0tSZG5iRTZrK2NXejYvT1ljVGNyU3RmT281?=
 =?utf-8?B?NmVtZ2VUYlJkNnFNem5ncXlUU3FudG8wb2FDNWdMSEJNNEdqdFgrTTAxU0tF?=
 =?utf-8?B?V3FNRnkvblRCUG5HM1dlKzh4cEdoeHFNMkYvQlpGNGxyWG9ZWVhiMFgzTVdV?=
 =?utf-8?B?ZXRPdHhiajJMc2pDUWFjZU52T04yNmlkQUxBZlYzYlZaaFdualBscGEvaU5r?=
 =?utf-8?B?aGs3QW5hcm42dnRKRVNGOTE3MCtJRE44SkJlU0c5OEJxNHQ0QS9qZnVJQUdH?=
 =?utf-8?B?bzIyRHA0b0ZjdWhobk5wUGg0M1kwZjZzcEl1MnBpWkxOZnNqb2NlYzZZVGhn?=
 =?utf-8?B?QzVhendoMGVtaE04NzhEYTh5UXA1ek1JNTA1SXFpb0xQb2E0aGQ1eVpoa00z?=
 =?utf-8?B?cXkxekgvL3ZkY3F1Ty9nM0JOZmYvVjdwbDVjeDR5djc0N1RkYUhNelZuWlM3?=
 =?utf-8?B?WWFFdjRHUTlzbU5qZVA1MFl3MVBWcGVwcFdZQ2FHbU9HR3BTOEU5WE9TbG1v?=
 =?utf-8?B?QXU0c3R2d1lyOGIxMjFFWXJBYmZFMDNTdm5LdDVUMW5lQTRYRk1DM21OZnQ5?=
 =?utf-8?B?Vzk1Y1k2NVk1TStObnA0bmNWK0E3andwL01kRy85ZkliT2d4YVJ1SHpHZWRx?=
 =?utf-8?B?ZnJRNzFOc1cxZHFDQmt0NXArcnZnWVJMSTNhYzdaWUFlQi8vMGhrTS9MZDZC?=
 =?utf-8?B?OTZScGhta0Nyem9rbWo4alFYWHMyRjh0ZWVLbHg5RXVwRlpVcHFlZXRReDNK?=
 =?utf-8?B?ME1WSDc3bXE4dkozSytNTnpaQWVEaG5HNm9ZbGpLcGk4MlFJeTVtQXcyTjA5?=
 =?utf-8?B?UStHTHpHZ002MUROeXR5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5475636137A4FE4FBB20A1D2918BB486@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae58df83-b259-4d7f-f8d1-08d965d446ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 01:21:04.6357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5na3RE8MK+1CJ15usoyV7r4vntmdGfdj3rTbgVSc0zSscLJR3MNAkZTgAdN0Z6jbf9+KscNrk0yJN/AEFCLBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7699
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgTWFyY2VsDQoNCg0KT24gMjIvMDgvMjAyMSAxNjozOSwgTWFyY2VsIEFwZmVsYmF1bSB3cm90
ZToNCj4gSGksDQo+DQo+IE9uIFNhdCwgSnVsIDMxLCAyMDIxIGF0IDU6MDMgUE0gTGkgWmhpamlh
biA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCj4+IFRoZSByZXNwb25kZXIgbXIg
cmVnaXN0ZXJpbmcgd2l0aCBPRFAgd2lsbCBzZW50IFJOUiBOQUsgYmFjayB0bw0KPj4gdGhlIHJl
cXVlc3RlciBpbiB0aGUgZmFjZSBvZiB0aGUgcGFnZSBmYXVsdC4NCj4+IC0tLS0tLS0tLQ0KPj4g
aWJ2X3BvbGxfY3Egd2Muc3RhdHVzPTEzIFJOUiByZXRyeSBjb3VudGVyIGV4Y2VlZGVkIQ0KPj4g
aWJ2X3BvbGxfY3Egd3JpZD1XUklURSBSRE1BIQ0KPj4gLS0tLS0tLS0tDQo+PiBpYnZfYWR2aXNl
X21yKDMpIGhlbHBzIHRvIG1ha2UgcGFnZXMgcHJlc2VudCBiZWZvcmUgdGhlIGFjdHVhbCBJTyBp
cw0KPj4gY29uZHVjdGVkIHNvIHRoYXQgdGhlIHJlc3BvbmRlciBkb2VzIHBhZ2UgZmF1bHQgYXMg
bGl0dGxlIGFzIHBvc3NpYmxlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExpIFpoaWppYW4gPGxp
emhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4+IC0tLQ0KPj4gICBtaWdyYXRpb24vcmRtYS5jICAg
ICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBt
aWdyYXRpb24vdHJhY2UtZXZlbnRzIHwgIDEgKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL3JkbWEuYyBiL21pZ3Jh
dGlvbi9yZG1hLmMNCj4+IGluZGV4IDg3ODRiNWYyMmE2Li5hMmFkMDBkNjY1ZiAxMDA2NDQNCj4+
IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4+ICsrKyBiL21pZ3JhdGlvbi9yZG1hLmMNCj4+IEBA
IC0xMTE3LDYgKzExMTcsMzAgQEAgc3RhdGljIGludCBxZW11X3JkbWFfYWxsb2NfcXAoUkRNQUNv
bnRleHQgKnJkbWEpDQo+PiAgICAgICByZXR1cm4gMDsNCj4+ICAgfQ0KPj4NCj4+ICsvKg0KPj4g
KyAqIGlidl9hZHZpc2VfbXIgdG8gYXZvaWQgUk5SIE5BSyBlcnJvciBhcyBmYXIgYXMgcG9zc2li
bGUuDQo+PiArICogVGhlIHJlc3BvbmRlciBtciByZWdpc3RlcmluZyB3aXRoIE9EUCB3aWxsIHNl
bnQgUk5SIE5BSyBiYWNrIHRvDQo+PiArICogdGhlIHJlcXVlc3RlciBpbiB0aGUgZmFjZSBvZiB0
aGUgcGFnZSBmYXVsdC4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm9pZCBxZW11X3JkbWFfYWR2aXNl
X3ByZWZldGNoX3dyaXRlX21yKHN0cnVjdCBpYnZfcGQgKnBkLCB1aW50NjRfdCBhZGRyLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
bGVuLCAgdWludDMyX3QgbGtleSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGJvb2wgd3IpDQo+PiArew0KPj4gKyAg
ICBpbnQgcmV0Ow0KPj4gKyAgICBpbnQgYWR2aWNlID0gd3IgPyBJQlZfQURWSVNFX01SX0FEVklD
RV9QUkVGRVRDSF9XUklURSA6DQo+PiArICAgICAgICAgICAgICAgICBJQlZfQURWSVNFX01SX0FE
VklDRV9QUkVGRVRDSDsNCj4+ICsgICAgc3RydWN0IGlidl9zZ2Ugc2dfbGlzdCA9IHsubGtleSA9
IGxrZXksIC5hZGRyID0gYWRkciwgLmxlbmd0aCA9IGxlbn07DQo+PiArDQo+PiArICAgIHJldCA9
IGlidl9hZHZpc2VfbXIocGQsIGFkdmljZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBJ
Ql9VVkVSQlNfQURWSVNFX01SX0ZMQUdfRkxVU0gsICZzZ19saXN0LCAxKTsNCj4+ICsgICAgLyog
aWdub3JlIHRoZSBlcnJvciAqLw0KPiBGb2xsb3dpbmcgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXJkbWEvcmRtYS1jb3JlL2Jsb2IvbWFzdGVyL2xpYmlidmVyYnMvbWFuL2lidl9hZHZpc2VfbXIu
My5tZA0KPiBpdCBsb29rcyBsaWtlIGl0IGlzIGEgYmVzdC1lZmZvcnQgb3B0aW1pemF0aW9uLA0K
PiBJIGRvbid0IHNlZSBhbnkgZG93bi1zaWRlcyB0byBpdC4NCj4gSG93ZXZlciBpdCBzZWVtcyBs
aWtlIGl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZQ0KPiBJQlZfQURWSVNFX01SX0ZMQUdfRkxVU0gg
aW4gb3JkZXIgdG8NCj4gaW5jcmVhc2UgdGhlIG9wdGltaXphdGlvbiBjaGFuY2VzLg0KR29vZCBj
YXRjaCzCoCBpIHdpbGwgdXBkYXRlIGl0IHNvb24uDQoNCg0KVGhhbmtzDQoNCj4NCj4gQW55d2F5
DQo+DQo+IFJldmlld2VkLWJ5OiBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdt
YWlsLmNvbT4NCj4NCj4gVGhhbmtzLA0KPiBNYXJjZWwNCj4NCj4NCg==

