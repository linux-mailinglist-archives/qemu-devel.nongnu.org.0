Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E37505FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 00:26:21 +0200 (CEST)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngZp5-0004PA-BK
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 18:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=100272efc=Damien.LeMoal@wdc.com>)
 id 1ngZnK-0003gb-8g
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 18:24:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:27836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=100272efc=Damien.LeMoal@wdc.com>)
 id 1ngZnG-0006QL-N8
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 18:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650320665; x=1681856665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AQURtCL4PrQNDIhuGHNtWZ0jiNG4XHaie2tkjQvwHkU=;
 b=lLz6nACQ8ZQ3HQvS01/chJOsN912Crrl+sMiWJ6Fyy/PeapOSteYP5jE
 rStrEPB5ExTbZg9cjAwQ9dOkpF37VnkCILOuyMrzK8QL2cTO/i8fuGSF+
 5ls8R0o7Gh8AEvQctWJubduMndONjJemA0tYjhwuLDl5KnvpqGirKTmAB
 LyIstXSq62mRLkwKklUx/ADQ9oZJ1SznRd2t2bYrJTkY1QmVtnfAB3OAA
 +MHg89/hvAtrNM3KSmuqwyr7ioeMfZJuAKYC5plczEuH2ULqGhD7rM6uj
 prF4/w+6GmtBzkNRkwQe1ceELZa93eUN50hS28gZShHCzoWap5lV2tKxx w==;
X-IronPort-AV: E=Sophos;i="5.90,271,1643644800"; d="scan'208";a="203068536"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 06:24:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtU1fjpymX39CiE5BlLy+hwaM65hAoMFV63XZt138Vesd40MeNjeemw1FuefeqRrsqEEoIAgiCTlmE1lizw3cqnG3jviE7FrF9T/raD74NB3GikDgjjtseYH1cgkQtTVE9fLjFgFJZJMtJNGF6HhLDy3XKoB5G7rWYUCabGBEOWrdD7UTAFH11a7X0VFrZRfo5Z3Jt6EwgKs2Z3JmnO1yPMf3QhSgb1U9Zk4RurM3mtvdwfFwsgEGb21wqPtagkDuzuR6QXnPdrvMJ/SIpEvyu83BU69LTHFxPzWR/4m8ZNHgdOr4p1Dwr+erBgSIGieKY5H5jBKcDe2c7rK7vkEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQURtCL4PrQNDIhuGHNtWZ0jiNG4XHaie2tkjQvwHkU=;
 b=lGJqp9z8jdMFDMubiPC5/TMbmzqHLPxLFpaXW+0nnGCcPdHG7rL2GN0h/aEzHkRZa2uD6Kjppygk0jk5Sg65UGoUvu2P7zB9mODSUgUofXNFhOnnpmRGdPS1SW6fHoX6bEa4+ricwLPuiib2k4KJaLTWLmiAdj9EPfqRiJqVpdUNjRfr0b54hQB7zYBPd3QfjSTyEdz04CfI+/JZxe2GzUqcWfWF6GsNww0zAyBuzxDU6MNikgEBWa2XvkggDRtoPTwbBKRJcKb4jxdYiWzv1HZ1aKZKbxOyXC2Bn40Obb2X+bq0L2zMbpLx3ZvPohh8P9iwRhWy8BW11yQ4Dt493Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQURtCL4PrQNDIhuGHNtWZ0jiNG4XHaie2tkjQvwHkU=;
 b=jMlob4EZoKEbRY2jpXaxZDIh958dAlG2IlIZ3o9h26ap4I54YwW17YIyj6hf6FSKQHam7JHQGeThm7etm3iFzQrlIU7FtpL3lQZHCQf5WpeL3a2EBW0J0wH+7H01ujyhdk0iBc46izs/X839uM7vTb5dMxYRnaiVIuRZO3fS4hM=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by CH0PR04MB8148.namprd04.prod.outlook.com (2603:10b6:610:f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 22:24:22 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4ce8:17ca:a43d:4bfa]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4ce8:17ca:a43d:4bfa%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 22:24:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sam Li <faithilikerun@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Stefan Hajnoczi <stefanha@gmail.com>, Dmitry Fomichev
 <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 2/2] Use io_ring_register_ring_fd() to skip fd operations
Thread-Topic: [PATCH 2/2] Use io_ring_register_ring_fd() to skip fd operations
Thread-Index: AQHYUwN1w0gYpRbG70ysWKHVraL0DKz2QBKA
Date: Mon, 18 Apr 2022 22:24:21 +0000
Message-ID: <a2cce793-3193-4026-c1da-d62c2741fcde@wdc.com>
References: <20220418090504.50107-1-faithilikerun@gmail.com>
In-Reply-To: <20220418090504.50107-1-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 093ef240-e92f-4232-d7ea-08da218a3003
x-ms-traffictypediagnostic: CH0PR04MB8148:EE_
x-microsoft-antispam-prvs: <CH0PR04MB81489874B0C3F9E513EBF8C3E7F39@CH0PR04MB8148.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HB6Cz0P8kHLsMMyjO3R5eLWaFb3v5vfcMM1lXyQzh47UjlgtADu+CK1yEUSIMiebFocjkOD3DmHLkNRqSGwO/5kDYnqS/i0aDPFm6CY+YL/TTNWUzKUKO5rTl6eYumKWSSwPvCR3eCDz2eHHyXbcOpw87NDp7BIssyRvXZtZY6pUMs77/urM0sR1uWEuRdmMOI6sWjj+AP5F6D0Z0pcMNoTNaPyrREBHcUPux5DovOtNIeRaS4g8B7ceZPzeD9xUO3SRG2neapiZ9wnYMslaI/8l8CnFybzhwaALpcX6eXKmCYbnUZgji/buPaW8IC79XEAV0eQhUwx0n7sYjO5JSbfDue/wpEVI77sj0JIsgQUQC+uI4JAyMKpoChJWKxpvyBIqx2Tja4knMdZtbZtrnNeSGQaDxRmrgK0RIGNZx8i4n2eC0n+yLExjMgdjf4HRGyjhmmrKECp9idXfpObnm3R1dBcp84jJgQz3cW8oQbPdxfQ2ipvf1aGQfQ+x2PtQo6fl8ehovZbxl2jl24xy1zQG49BVucO6fBsUn7AhNQu4TJzG9/7cZBP2n3Ch4R8lc3x98o9ezXNaq6q886t9Sa9Om2dCexz2eNSm6hEShGNNaXA2pt7bY2I1WtYFGyV5xitxvocWBsB+CR99oAWx/cL8dz3hn6Q2DxzusvT9sf+2/+8wehDr7i2KMvsP8zOKbaBznE/rJE0JzosPG5xfWK/C6q5Ia804B3w14BvIVwiRDHIydvqwji3BVY4WyKNS+23ttyUAY/rNxepKvUBIIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(2616005)(86362001)(53546011)(4326008)(8676002)(8936002)(31686004)(6512007)(38070700005)(38100700002)(83380400001)(5660300002)(26005)(186003)(122000001)(82960400001)(6506007)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(36756003)(2906002)(54906003)(110136005)(6486002)(71200400001)(508600001)(316002)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck02ejE2a0hnZHJ5L3hIa0VRbTJvRHBpV3UrU0F6WHZnQXh2OS9PQ2NTbmpv?=
 =?utf-8?B?OTF0TDU5WEZvcVpndzIvRTgvMVFKQjlrQ05BazRJL1FPZVJjK3VjSCtkYkN5?=
 =?utf-8?B?d2hnYVhTR3hjcWlpTlh0NUdNVnlDTzFSZ3lYR0JSM2QyYkhWYVNTOVNjL0xX?=
 =?utf-8?B?MWdWSzM3cjdLUURERmIzeFFkcUtFN296ekVMSklRdUFyM1N6QkpXSHZ0UW1l?=
 =?utf-8?B?NTJzSnVCSTF5Yzg5c0Juc0xNOFVDQzZTczUxNUZTVzh0MC9UZll6NVdrdWlC?=
 =?utf-8?B?aUhXcEtkSXk4Z1FSdVRiczcyMmo2QTVUcklGMGt1WnorUDdpdkVyTmRDRkhJ?=
 =?utf-8?B?VmhkSzVmazl3alc2aVZreGsvaDJUMVVxQnpHd1hXRkdEc0Y0RW9QeDByU3Aw?=
 =?utf-8?B?NU95WmJWM0pTbVJWc3hxVXIxVUtmRFJaNGdlS2JZNnhYTFRyd2RaQVBQR0Ew?=
 =?utf-8?B?aTNqMjFwUXhma0VJWG5NM3dBa2dmS2FFc1djOGs1Mk9vMEdLOTl1d0poY1U0?=
 =?utf-8?B?MVlBM0tLalJCbkkrcnhleVFwR2UySnV6WXJKVktGYjAxdThwMHE0WVdTUkIy?=
 =?utf-8?B?WjJDeXBNNkNRUFJuTllhZXJ5b0w2Vzk0ejlWTDBPTDRPU05OaFp6ZTZsL3Nv?=
 =?utf-8?B?aXhISlY5eWxrQXFPeVQzR1RyaFFJbTMrZ1p1VDQrazUrVUtwK3lFQVk5NEVL?=
 =?utf-8?B?Y28rcWlUMGU1T0lCTkZwbE5MYjVmRE1QZndMdEcwTVhOQ2FVOHc1ejc2blRF?=
 =?utf-8?B?Uzl5bTd1aUhSQkU0RGIwWHFlNUdNdS9qaGw1OFJyZEwwanBtYU4yZGk2NUgz?=
 =?utf-8?B?MFFMVDlpZDVPMkRtbnVkQzV2Z3NuTVB0TzBQMVA3V2F5QlFPelI2VmFzdFN3?=
 =?utf-8?B?RGNwV1FrL3pXNmdTeW1PSE14cXpxYVNKdzQzUVFLRklsV3VKMnFFL21ZRkZs?=
 =?utf-8?B?R3RDWDBJUWxlQ3c1LzM1OWZpdkhuYTFOYVlpQnRlUEkzeFNid1pSRnRZV0Q4?=
 =?utf-8?B?K2VzOTlJeGNxNGE3OVNuTjYzMUgwYkExU0pxUEpFdk5BcEIyMXAxWVNMLzJu?=
 =?utf-8?B?OTRHMStPVmNvV2ROaEM4ZU5DNnhHbEEwdWRLaUwzYTFZMGJKOWgxZVgvYzZu?=
 =?utf-8?B?WFk2Q1FJZ3grNVFjc2tSamxZZTQydUxnN213Rm1kZFg3QVhGODFBZGVLQzVU?=
 =?utf-8?B?cnBmZUsraVlGWndXNmgvQXp0QWxZeGpkelQ2SG9zaCtTYzA1U3RkMmNUVzZS?=
 =?utf-8?B?cjMwci82bUN3Z2pNWFBEL2gzSkwwNm1TbFQ0UGFQNXlRbURyZ1J3YU9ycmFK?=
 =?utf-8?B?Unc4clZYajd1TDBjRm9qKzEzMHJiMXhRV0dKMzhTUTA1SUhrZXYvVWRtek13?=
 =?utf-8?B?eEJ1ZGgvWUJ6NUEvMlQxYys1QjhCODFpQUptNnFjTzBBOW1yTVQ3YkluOTRI?=
 =?utf-8?B?QzdQbWE4NE0yVjhBaEVDU090YStsRit2a0toZFMyYzZjdEVTL2lwRGxKTCtZ?=
 =?utf-8?B?K3VMWjRlUW5LaW5HRXRtckVxZFF4Q3dFcldOTk1xR3Rhb3haRGhGSTRsQzNh?=
 =?utf-8?B?eExMaGNyU0FiNVladmxLRFFyUVZBckFOTkxpNEhicUo3UERMWWk3VGY5RllM?=
 =?utf-8?B?eUNCbzNFYzZVQ2RrenhuWHpHZmM5cmd5OTlNNTM2Z0dCZURUTFdPampjNGh2?=
 =?utf-8?B?K29uQnVRa0NaT2hmUE9XejVsTXpGLzBVeWtnMVpBUjdZY012NjRzYXVHWHpJ?=
 =?utf-8?B?MW1UZDV6RnVRNm1USjZCajVuaUU1V2trakt1U2VJdzlVZTM1K09SeE43TEZ4?=
 =?utf-8?B?RUFoY3lWWkZnZE5WNllyN0EybzZ6aXpVWHFyczZNUFA5QktTdFAwYUFiZ3Y2?=
 =?utf-8?B?YWxKS2NzUjhUaG5vSnBCQzNUY09KQ2JiVUZrTHFGdzlRRW1RNHN1N2tZekpK?=
 =?utf-8?B?QlJtUzRFN3FtVFFQdGZsbDBPamtFVDVJNzc3dlN0eHh4MFFzdStUN2JOZjZC?=
 =?utf-8?B?cm9GMTZVWEtPZTZWdmliczlHaStaU2xHNHphSVpmM1lRdFlaYk1vZFY3TVNz?=
 =?utf-8?B?am9weHk5N2pvUktpM28ycWkrUnZnUmRHTmlJNEhWTDZuWGlqN1lJaVlJM2lv?=
 =?utf-8?B?a3FwZ3g1b3grWjJtWlVkY2Z2VEREdkhlZXF6VnVGTmZYYjd0NXVoVGh4VDBx?=
 =?utf-8?B?ZW1USkVnTVZEdkRqSS9qTW4yOEJPd0pzOW1HcW5RTEMwU0c1a25pM21ORlVw?=
 =?utf-8?B?UzNTNk01WlhCMmFXU2RTY3FRaWhSWmUyd2M4clVMdEhZK1lMN1RzRFRVOVNo?=
 =?utf-8?B?bE5STy96eVR3SlNsWTUzSmhUQ2pQTFZRZ2NwT1RWZjRpYTk0QlNQbUpxTUQ0?=
 =?utf-8?Q?aiUe5il0yAlgfR2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6B930225C98024A90627B511184BC17@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093ef240-e92f-4232-d7ea-08da218a3003
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 22:24:21.9702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvQnD7cMuhO6WjPnbbcptb3rMFlMtCeUsFill4++EnGHj8yrMs9KePPiD4fh3+wiMIjym2AnWrzht02vK9Maeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8148
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=100272efc=Damien.LeMoal@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjAyMi8wNC8xOCAxODowNSwgU2FtIExpIHdyb3RlOg0KPiBmaXggY29kZSBzdHlsZSBpc3N1
ZS4NCg0KVGhpcyBwYXRjaCBtdXN0IGJlIHNxdWFzaGVkIGludG8gdGhlIHByZXZpb3VzIG9uZS4N
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2FtIExpIDxmYWl0aGlsaWtlcnVuQGdtYWlsLmNvbT4N
Cj4gLS0tDQo+ICBibG9jay9pb191cmluZy5jIHwgOSArKysrKysrLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YmxvY2svaW9fdXJpbmcuYyBiL2Jsb2NrL2lvX3VyaW5nLmMNCj4gaW5kZXggMjk0Mjk2NzEyNi4u
NTc3NDVlY2ZhMSAxMDA2NDQNCj4gLS0tIGEvYmxvY2svaW9fdXJpbmcuYw0KPiArKysgYi9ibG9j
ay9pb191cmluZy5jDQo+IEBAIC00MzYsMTAgKzQzNiwxNSBAQCBMdXJpbmdTdGF0ZSAqbHVyaW5n
X2luaXQoRXJyb3IgKiplcnJwKQ0KPiAgDQo+ICAgICAgaW9xX2luaXQoJnMtPmlvX3EpOw0KPiAg
ICAgIGlmIChpb191cmluZ19yZWdpc3Rlcl9yaW5nX2ZkKCZzLT5yaW5nKSA8IDApIHsNCj4gLSAg
ICAgICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJubywgImZhaWxlZCB0byByZWdpc3RlciBs
aW51eCBpb191cmluZyByaW5nIGZpbGUgZGVzY3JpcHRvciIpOw0KPiArICAgICAgICAvKg0KPiAr
ICAgICAgICAgKiBJZiB0aGUgZnVuY3Rpb24gZmFpbHMsIGl0IHdpbGwgZmFsbGJhY2sgdG8gdGhl
IG5vbi1vcHRpbWl6ZWQgaW9fdXJpbmcNCj4gKyAgICAgICAgICogb3BlcmF0aW9ucy4NCj4gKyAg
ICAgICAgICovDQoNClRoZSBjb21tZW50IHdvcmRpbmcgaXMgYSBsaXR0bGUgb2RkOiBnaXZlbiB0
aGF0IHRoZSBjb21tZW50IGlzIGluc2lkZSB0aGUgImlmIiwNCm1lYW5pbmcgdGhhdCB3ZSBhcmUg
aW4gdGhlIGNhc2UgInRoZSBmdW5jdGlvbiBmYWlsZWQiLCBzYXlpbmcgImlmIHRoZSBmdW5jdGlv
bg0KZmFpbHMuLi4iIGlzIHN0cmFuZ2UuIFlvdSBjb3VsZCBzaW1wbHkgc3RhdGUgc29tZXRoaW5n
IGxpa2U6DQoNCgkvKg0KCSAqIE9ubHkgd2FybiBhYm91dCB0aGlzIGVycm9yOiB3ZSB3aWxsIGZh
bGwgYmFjayB0byB0aGUgbm9uLW9wdGltaXplZA0KCSAqIGlvX3VyaW5nIG9wZXJhdGlvbnMuDQoJ
ICovDQoNCj4gKyAgICAgICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJubywNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIHJlZ2lzdGVyIGxpbnV4IGlvX3VyaW5nIHJp
bmcgZmlsZSBkZXNjcmlwdG9yIik7DQo+ICAgICAgfQ0KPiAtICAgIHJldHVybiBzOw0KPiAgDQo+
ICsgICAgcmV0dXJuIHM7DQo+ICB9DQo+ICANCj4gIHZvaWQgbHVyaW5nX2NsZWFudXAoTHVyaW5n
U3RhdGUgKnMpDQoNCg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsIFJlc2Vh
cmNo

