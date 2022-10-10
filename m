Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1B5F96AF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 03:55:10 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohi0b-0006Qg-L9
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 21:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2751c4434=wilfred.mallawa@wdc.com>)
 id 1ohhyw-00053c-CR
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 21:53:27 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:22822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2751c4434=wilfred.mallawa@wdc.com>)
 id 1ohhyr-0002EB-7U
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 21:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665366801; x=1696902801;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rQfm8WGLBoQNxwDX96BNkdOURo8ZwMWlGeqjUQ4nqIw=;
 b=ZnfdR6rqS2iKmHRBSxUo+VF80DRGoq8b5XeBY4Lx1pi5biTZAdlTFMVr
 tCpDNMyjP7LrwoLAKINt2+R4j/6RlMi1ucEo5tscfFQcQWgnOyAG8jYrU
 TKCzKCK1tVjnWn02kKhwjTIFaRmiZ6wG7F6vVMNL2Y5vxvb1KNXO4NYHS
 rN9O33boYcUu1Aam+2S4DxNyLYoubDtLmj9GyrlDFyLSFKe3tEw3ODjdz
 6Dp9VfCA4ZNGzp6SlO5IgaW4Y/ssKY64hsjqag/f5cDbMXWi4SE6TAEwL
 yK5+fmBsQljpQHygejdle21ZqzjQtUYzBLlzNgnt4AXqrTUJVysgSecBn Q==;
X-IronPort-AV: E=Sophos;i="5.95,172,1661788800"; d="scan'208";a="213764883"
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2022 09:53:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfNR4cIraKTQ2y7Z/Ed1n+gbiZ3YrlS8N0Wizq4x8IjobR4sWOHkFFEmSXED72MgiLpwxqgQ0VznkHLT5FkGLsIkLPYJ2wXmeXd0SzeDKK2ZkbE4Yn9yEUFOfRdp9Vz/j5WvAFU9aVumhKkd5T9+dAxwpuLfgDGA2sicxOpAp38XHzixyqU4+TdiZhqVMaGSjyv8pcwm7YJSBonc+F2+diPAE574iu+CCkgDdWZV2S4JgDAgVbH+cmO716SZGiGEGpk6wDkBFRgflJvQZ1JFNOJGmIzv5smpQfJJtQ8UfkV3qzWTndIC4I5PTPBkwzD4PYuawH7At/OzaxLTrW9P/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQfm8WGLBoQNxwDX96BNkdOURo8ZwMWlGeqjUQ4nqIw=;
 b=Wwr5IfpuG0WICGEUZtFTwTFqvZGtUg4cGCBIYtxYYumsKg4Pdw3C0GQMvXJaZARFiIgrd20rVonzN0yGHrpR0uEXjhPAdj0ZEs7nRMDl2xx0pydu3AYnqlXrbPgXd06T4XmVkvuAaZ6NYW65ZUTUIVa0B/tGf2a27DdrXZ/pddVnGQ8V7B+5WxghYqdYpuxnTIaHFOkqzfCu2xftbMF0hVl9H0MQ6YrYUwQ76Pif0jxRi1ACgmAYYlT81c8mRypvX0zlF2Dwwf30apVky+przgnbA5lPg7EY8Uzk/JioQAlvA2y1KLqlUXkz7Q10Sv8loheA53Mh3+OtV/AU7MMskw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQfm8WGLBoQNxwDX96BNkdOURo8ZwMWlGeqjUQ4nqIw=;
 b=ZX3wxG0kZdspsCzcXo7E0N2h8u1yOTUvBAiPW9AEn6Ve5P4eX1qUC0Uk1KNo8zf8Am/CLm75M/2a3WPTa/8mjA6JrBpPRUHM4SfgdRSpbyn7uV783XmmPjBA3NuNOj9Oc8DWXMFlC83ac2t8513yRozBoZ8009j4e/yT2OjIyCg=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by SN6PR04MB3870.namprd04.prod.outlook.com (2603:10b6:805:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 01:53:13 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319%8]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 01:53:13 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "wilfred.mallawa@opensource.wdc.com" <wilfred.mallawa@opensource.wdc.com>, 
 "alistair23@gmail.com" <alistair23@gmail.com>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [RFC v2] hw/registerfields: add `FIELDx_1CLEAR()` macro
Thread-Topic: [RFC v2] hw/registerfields: add `FIELDx_1CLEAR()` macro
Thread-Index: AQHY0gwxgiPw0hUXmEOHGmLd+BviOa4G64GAgAAGfwA=
Date: Mon, 10 Oct 2022 01:53:12 +0000
Message-ID: <117e27a377b4b661a9f72de1af9a32ecbaf09101.camel@wdc.com>
References: <20220927005429.146974-1-wilfred.mallawa@opensource.wdc.com>
 <CAKmqyKNc2OWytDTq7JNix1NKjvufFKnCMyHCgXNSv+EoM-mfQg@mail.gmail.com>
In-Reply-To: <CAKmqyKNc2OWytDTq7JNix1NKjvufFKnCMyHCgXNSv+EoM-mfQg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6546:EE_|SN6PR04MB3870:EE_
x-ms-office365-filtering-correlation-id: c7583613-6b97-488f-00c2-08daaa6230dc
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JsrkOu2He7ppIsMPYEuVxM3J+9ev1j4eQEiMnoOlfSzjxpmt/vUtYQtc0OS6S14QFI0+5TToAwqEjNlYB1Zg719Ey+mYbyXElr1P1KnP4C9Mtu+8Gr6POeWyc+eyesgb7+lZJUM1FlT4Qn3UH0u2oiCV6QlqHyzzdYC156uIHmA7F+Ci4mDwDHFL6YvNCsUzfjEHukahGoGdZSvWVzjKFTdjtrr87EfPSahF0UcssEUsnxF0dgdiIIMs7sLimCP/YlGLq6sE2gV/r1uQir9Rwwu5DqpjDwRw9XZ/924+kRvS1Gd1/Zs37Y1WLTqc/zfj9NXYtH9XyVtPb5X286L22I9Dftz9MeeSxeV8Ab3BYy75Nn6sRMPz0RB6Pn7V61i0o1bat1fZXkldaTb3nUMJ+Ya8aIxSTAnDG5bq7SXPOQW1YDRUepa9oP7KvG8wsKawdgy225fI1TzMwMQnaFALQKWY69LSZ1vR0EMvaIxVccAe+Xq0Ak3IyU0X9rhWL7palMEFZ8u4lYlaesgbK+huLAqig7Z//wjct9mBUnCPqrXCQnXuJRFuguSTghL7T/RZ4taJgXmcsHquHIwbPukSdoA4ysOVkqT85B0aQUUNdY5YG4vB2qSpFT98y4TOCgjsUcAA6R1Qdy3woJ+RxEwQEXkLPLkLe1MAtnBgJe7suBuXOwpqmuEOLfa6aJy9xXtV/VDxVF638Qb/LE7T7J5kkeRKHwP45ZPxTIFnnbpRVF1oBx9t2K705tmRnWLb2K5LDgnuKYG66NikGZLUJD7ci50gisdnJ5W0BPuAjGMf1Wg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(36756003)(38070700005)(6486002)(316002)(71200400001)(2616005)(44832011)(86362001)(2906002)(53546011)(6512007)(26005)(110136005)(4001150100001)(76116006)(66946007)(4326008)(91956017)(66446008)(66476007)(66556008)(54906003)(6506007)(64756008)(8676002)(38100700002)(122000001)(8936002)(82960400001)(41300700001)(186003)(5660300002)(478600001)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RE9vb0h1RFpOQ2ZCYUg1c3V3Q2hTVytuTmNMRDFJMUpha3pHS1o4a3daODhX?=
 =?utf-8?B?SjdGNDhIYy9qbWZCVXppc3dyOHhMcjJRanRqWGtKcThSTStkZENnb1EyRkFP?=
 =?utf-8?B?WWZUVlY4ZkM2RFBRbjBQbjA0TkJZZ2tnaE1zbVE0dmoyZ3lxLzhSMHpkUjhr?=
 =?utf-8?B?R3MzYkhKSUJLd3hMS1p4di9zZ3lMdi91dXRLRUhJZXM5VVJFcEZHaFNvak9N?=
 =?utf-8?B?Y1RxT2h3MHBHYVdnc1gxOG5JQ0RZdmdoUjY3UUo2SnVzNkV2UGs1UkNXWkNx?=
 =?utf-8?B?T1cxSitqd0NEb3ZTdEFVVTVSeGVqYUR4WnE0d1o5aTlLN0UvUUZxWDZVVXV2?=
 =?utf-8?B?RXAwZ2RoSXk5MzVJU2JpQ2ZyTlB3c0ZYeXFCdHhZdzQ4NElqTnJ2bnEwVlRO?=
 =?utf-8?B?UzJTQ01YNklhQ1l0OS9UMDdVOVd5SndOZmxFYkZJMG54MmtHM093Q0Qza3k4?=
 =?utf-8?B?ZGtGVS90ZzFKelhubmwzSUxzOHNkTmVKK21ZQ1ZudFQzY09DS3d4aG1EVmtz?=
 =?utf-8?B?N2ZqOHBKVGVaMmlaSW85M3dzaElHMnhHN3JEam00YWlKTHJPZkRjbzhMSEpz?=
 =?utf-8?B?SmFVL3hCL0pwNXNIRkJwSTVkN3p4ZkF3KzhxQm1ZTVlyMjJWTmd0TjVBZENY?=
 =?utf-8?B?OHBhQldITnVIZlc3dDlhNUIwK3hJWEx3T0hZb2lmZ1JoOTVETkxLZGhkcHlO?=
 =?utf-8?B?SzM0Z1RBL2VaYXRKLzZTYlRpUm1CRk9DTlZNR0UwZFIxdlY4dFZFTzR0a1hm?=
 =?utf-8?B?VGQxZzJ6Tk9vcFIyRUsyTVI4NW1Bcld0WVZsRy9xMEZPNXlYNG5JM1oxOHVH?=
 =?utf-8?B?K29sR0lkN0tUVWlxTkFIR05xK3lueHJpQjZjRTcxMkQ3YkZMMFZuVGpHYTNy?=
 =?utf-8?B?WFFMM2pMRzdjUFZEY1pDUkdZSm9GNDFTYXpqTkM0SjJCTUVVU2QySXVzQ0ZO?=
 =?utf-8?B?dVc1Q3NSc29CYmZnaGdKcW1uRjN4Unl1WkZsZWF2RkpsZitDQWw2V2JPOWto?=
 =?utf-8?B?VWN0ZmxkRVRNeGhVV2YrUjF6OGszaXJ2LzBSS2FiOWhVTk1yT25KZEtsMXRL?=
 =?utf-8?B?RlBZOXRDcjRRbTk3T1lweTRHa2hEdDJXSndWS1ZVM1lscUNSaWxlVkk0aDMr?=
 =?utf-8?B?cFJZQjQ0d3Z2VHhJRXJnNlQyQy8rWTdyc05neHBKY0RHVjlEWnYwN1B0L0dn?=
 =?utf-8?B?RlNaWlJzTFlXN3ZGZ2tOZ1czM055T0V4MExMMXN2eTVMMlJndWVOeDd0YTBX?=
 =?utf-8?B?K0FqVEU0NWVjb01GWVZOZzB3R3p0UEpHNFJLb3MraXlKeGtTdUVuaUdhY2RQ?=
 =?utf-8?B?WnpOL2V6SzZIdEF3ZStpNUhTdnZSM25BRy93c0ZxR1JMZDZBSXA0Nzg4OWkw?=
 =?utf-8?B?VlpvYS9oWFlKYjVEaGIyTlZRbEJObnIxZHorL1QrWXNCQ3ZnMXZuSFNhV3dn?=
 =?utf-8?B?WW1QS05LWDFDOE9sUFF6bW1peTFQM05wZnA5Tkc0YW50Z2xhWjZXc1V4c0RI?=
 =?utf-8?B?dmE1VC8rU3pROXpWbVZZQnplMUJyRW5vKzR2SFZSeTZKUng5Qzg4Z043S0Yz?=
 =?utf-8?B?RTFwV0RqY2ZHak5oMktSeDVxa3RKNVo4QS9WZmR0MDJsNGRVZlpUSXRiODUw?=
 =?utf-8?B?T1R1dTQ4Tk0zeEhMazY1TWVQZkVHbG5SdUhOcWVoS2dsbFlmdk5GcGZPbUVM?=
 =?utf-8?B?OUNvbmdjRGEwc3czOHFXREIyTUc1ZVhUZnRDeXRncGhHVGhmM2ZZa3llVHpB?=
 =?utf-8?B?ejYwNWdiWFA1VmpEbTFncFlPa3VrVlRYM2lTbEF1OTNKVG9NNVpkdUNTZTZ1?=
 =?utf-8?B?VHRITVYvRG01U3FXTUthZWF3ZEx2WmlNeHF6TG10TklYYTBiZnYvZU5kTzJa?=
 =?utf-8?B?ZUdXZi9CNXcrS2VwcWZtaUc5bWFIUzhNRUdjbzRsRUtSTjg1QkErQlRCNUla?=
 =?utf-8?B?cXpMbC9SLzFVRXEyeUsvOXdsaUpTekMzZFAvRzg5VFVScnRDN3ZrQmFScHQ4?=
 =?utf-8?B?VTlLaUxqVjd0THVGYnBIMGhiSDhkKzE0QmNGR2MvM3BzVUx3MVczNko5dUd0?=
 =?utf-8?B?ZFR2aURrUHJGN0RxTXZmR3FXK2tTMHpJQ2dFbjhyakZaN3BVdUhVU2h1QzVE?=
 =?utf-8?B?STFrVXRnNTdSRHJ5a0FFZSt4SXh4RDViclVtY0JudGZoa0thaDc4cFVDTGpx?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BD24BA233E0804394E8632E278CD35A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7583613-6b97-488f-00c2-08daaa6230dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 01:53:12.9118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UeCSHKdrJzEm7eEBfT8kGlxh7FvScUttvUzNuSgZrBW1MuwzZkIvYhIp496t0yCB4QUR11N1qm5f7Gqboez4NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3870
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2751c4434=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uLCAyMDIyLTEwLTEwIGF0IDExOjI5ICsxMDAwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Og0KPiBPbiBUdWUsIFNlcCAyNywgMjAyMiBhdCAxMDo1OCBBTSBXaWxmcmVkIE1hbGxhd2ENCj4g
PHdpbGZyZWQubWFsbGF3YUBvcGVuc291cmNlLndkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEZy
b206IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+ID4gDQo+ID4g
Q2hhbmdlcyBmcm9tIFYxOg0KPiA+IMKgwqDCoMKgwqDCoMKgICogSW5zdGVhZCBvZiBuZWVkaW5n
IGFsbCBmaWVsZCBiaXRzIHRvIGJlIHNldA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCB3ZSBjbGVh
ciB0aGUgZmllbGQgaWYgYW55IGFyZSBzZXQuIElmIHRoZSBmaWVsZCBpcw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoCAwL2NsZWFyIHRoZW4gbm8gY2hhbmdlLg0KPiANCj4gVGhlIGNoYW5nZWxvZyBz
aG91bGQgZ28NCj4gDQo+ID4gDQo+ID4gQWRkcyBhIGhlbHBlciBtYWNybyB0aGF0IGltcGxlbWVu
dHMgdGhlIHJlZ2lzdGVyIGB3MWNgDQo+ID4gZnVuY3Rpb25hbGl0eS4NCj4gPiANCj4gPiBFeDoN
Cj4gPiDCoCB1aW50MzJfdCBkYXRhID0gRklFTEQzMl8xQ0xFQVIodmFsLCBSRUcsIEZJRUxEKTsN
Cj4gPiANCj4gPiBJZiBBTlkgYml0cyBvZiB0aGUgc3BlY2lmaWVkIGBGSUVMRGAgaXMgc2V0DQo+
ID4gdGhlbiB0aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBjbGVhcmVkIGFuZCByZXR1cm5lZCB0byBg
ZGF0YWAuDQo+ID4gDQo+ID4gSWYgdGhlIGZpZWxkIGlzIGNsZWFyZWQgKDApLCB0aGVuIG5vIGNo
YW5nZSBhbmQNCj4gPiB2YWwgaXMgcmV0dXJuZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
V2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gPiAtLS0NCj4gDQo+
IEJlbG93IHRoaXMgbGluZS4NCj4gDQo+IE90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZC4g
RG8geW91IG1pbmQgYWRkaW5nIGl0IHRvIGEgc2VyaWVzDQo+IHRoYXQNCj4gY29udmVydHMgdGhl
IE9UIFNQSSB0byB1c2UgdGhlc2UgbWFjcm9zPw0KPiANClllcCwgdGhhdCBzb3VuZHMgZ29vZC4g
SSdsbCBzZW5kIGEgbmV3IHNlcmllcyB3aXRoIHRoaXMgKyBTUEkgY2hhbmdlcw0Kd2l0aCB0aGUg
bWFjcm8gaW1wbGVtZW50ZWQuDQo+ID4gwqBpbmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRzLmggfCAy
MiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRz
LmgNCj4gPiBiL2luY2x1ZGUvaHcvcmVnaXN0ZXJmaWVsZHMuaA0KPiA+IGluZGV4IDEzMzBjYTc3
ZGUuLjRhNmEyMjgzMzkgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9ody9yZWdpc3RlcmZpZWxk
cy5oDQo+ID4gKysrIGIvaW5jbHVkZS9ody9yZWdpc3RlcmZpZWxkcy5oDQo+ID4gQEAgLTExNSw2
ICsxMTUsMjggQEANCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUl8g
IyMgcmVnICMjIF8gIyMgZmllbGQgIyMgX0xFTkdUSCwNCj4gPiBfdi52KTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+ID4gwqDCoMKgwqAgX2Q7IH0pDQo+ID4gDQo+ID4gKy8qDQo+ID4g
KyAqIENsZWFyIHRoZSBzcGVjaWZpZWQgZmllbGQgaW4gcmVnX3ZhbCBpZg0KPiA+ICsgKiBhbnkg
ZmllbGQgYml0cyBhcmUgc2V0LCBlbHNlIG5vIGNoYW5nZXMgbWFkZS4gSW1wbGVtZW50cw0KPiA+
ICsgKiBzaW5nbGUvbXVsdGktYml0IGB3MWNgDQo+ID4gKyAqDQo+ID4gKyAqLw0KPiA+ICsjZGVm
aW5lIEZJRUxEOF8xQ0xFQVIocmVnX3ZhbCwgcmVnLA0KPiA+IGZpZWxkKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4gDQo+
IFRoZXNlIHNob3VsZCBwcm9iYWJseSBtYXRjaCB0aGUgb3RoZXIgbWFjcm9zIHdpdGg6DQo+IA0K
PiAoc3RvcmFnZSwgcmVnLCBmaWVsZCkNCj4gDQpXaWxsIGRvIQ0KPiBBbGlzdGFpcg0KV2lsZmVy
ZA0KDQo=

