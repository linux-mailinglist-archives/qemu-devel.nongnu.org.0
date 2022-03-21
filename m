Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54E4E3006
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:31:29 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMoQ-00046D-3K
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:31:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMlx-0003NA-Hh
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:28:53 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:23032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMlv-00013u-1n
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647887330; x=1648492130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k74eWMLcVjYD0xNIOPGloXswa4pS97hKdeS12TW2UvQ=;
 b=ETuK1r5Lpi8dMKdTX+T0wtmTN1rP2zJPfNLBSZBR830vc9+rQ4H0PhIh
 bJwQrLMsx8qcpi2ETpNFvloGj4KPrxr2cK0jPxFAsCH7Vz5JuL5pgO5ep
 jtat1AT//qxP5unyn9ioaUfiXOen4gYHxJebs3zUus18IVasUvq12W1kN g=;
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/4h9wyrwr5dBVpkGNz8vJ9/L1b8kz5cm4U6grx38Qacn/nXQ9L2c+zc4X6ZHBYKavwI9vu+T7CCv+TD0tFXmx8N8Sh8UzjFcm6/GNFOZtOSqCqmS2/2MTIyE+ukHeCG9T/6l0xgerFX/sLruSvfgbSBiuSsFWeRabvKeQCbrmlJcVrngNuQjKu09KInIblYs4t2iHWv1OG5rmHHk2PEb1iABKGWv+jS6NQF9hMpI2njx67/tRd/OFjxknwzGeiMTMoBclxLiqzYQQNxeZx9OWGnwoJuZ6/pPsW4ls95k12UR4kUFFvEjxSs/nzmrh8I75fWhzuus8jsxs4/k8M05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k74eWMLcVjYD0xNIOPGloXswa4pS97hKdeS12TW2UvQ=;
 b=VsMpcQ2izCq4J6L9ZUlQ8lfkbFictHLNEi7gqAk00R4mhczhc2qHzJ6eZlsNNKoT1fgKfAVrIISlodfMQ85AQIwaFTO04TqMmzLDs36xiEApSot3j2oLGDTl6XZu09iUMBrEHdShmmzpxXdejhwdwsdVa8fOXDwS8xBIoUOF7WcudJeiJOAUVwEHJRoaBou8THagYxZlAwkDtr1IUe+k6tGwpS7QMCwEPOlu5/Q1M2GB101O7a9tYObgALE9SoSuErtgpzUzyhnDgoCJ2UvFMTGpCSWVG389AQRvQRvsznGJEwbMy7ckhcbr4EBjft+or2bIGssLyhDyhQu/aSupDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7533.namprd02.prod.outlook.com
 (2603:10b6:a03:321::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 18:28:41 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 18:28:41 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 05/12] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v8 05/12] target/hexagon: introduce new helper functions
Thread-Index: AQHYHdb7FiDlrLNVGEW6O3p34l/fw6zKZldg
Date: Mon, 21 Mar 2022 18:28:41 +0000
Message-ID: <SN4PR0201MB8808206B060C406CF035DEADDE169@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-6-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-6-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b65c697-9e82-4136-11ca-08da0b689fce
x-ms-traffictypediagnostic: SJ0PR02MB7533:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB753354D3FA2D5F4798267912DE169@SJ0PR02MB7533.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PE80IoB3DpcsVO3+ZAnx+WZzVwZegvJXrTrPEecJunZ1RFwDekA47Un/EqpqPvnzle5WjsZkwOLQ/5DwBxJSl3bXFJdhqe8bPEXwAnKw5594zpUMFg2gjSicVC9qATDYnH90A3jpRl4kBfi83vOpLHoF7Cxf4UZ7xY8tBpTiORr79ZEWsMNwiHKdctXbm2h75BU/Ib2frrIIAcQzwRN/iXLO2iaZ51iY3CE/vhyIYu4O6FwB+lhfedo4ulioYsdl1Y6bwlwLP0t083NwgWeEtHn3d8CrUTylN3bvYwx65sucm0CKeP/6igv81SDqSRMlwrzkjSJVXQ7qFn3r3xiR1wVC/wox2SZ5eW0sTBgK1Rn+Oz93Gv6+yVDkEJJUA65Q2/PxcXK0crHfj4mY7CrxPEF7Zqr5ykF6TY6vnOz/ABeZH6/O0Yx7W6oNl96Cimr0pEFL98+t5INxCmc5Nt7ESMSMp4YhmHLLGJ5QPA4jQMb9q5Qxw7R45Jpb18HO516SFSA58kkqueYFcaS3UdV/95wuOu6I9fhh23t5uvdhgr8zkIYB0WcWdPc23ixDJYt9qIZ+Ij5EbCkEi7R+nTXuabmjgaNSweqjKkadrLv2/qR78WaS1lTSyPjMuiQ3aUGOr12VShCq+RN7CXQLBmO14MZlslbHtpsOLMELSKDliZdtij22BRp0KZ2V5QNYbsKzJAFxAZjegtixvBwWWFEoFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(186003)(54906003)(26005)(52536014)(9686003)(110136005)(33656002)(71200400001)(55016003)(8676002)(53546011)(64756008)(76116006)(4326008)(66946007)(66556008)(66476007)(66446008)(7696005)(508600001)(38070700005)(122000001)(86362001)(5660300002)(8936002)(4744005)(316002)(83380400001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ZMTG5UUjVsWG5IMU9ncGtJd2dZM21EVjRrZGdWVE5PZEdDM3BEUEJWZm4x?=
 =?utf-8?B?SlVlRC9FVFhLUFRoL1hTcFdIYXdHaE5sdkdBdjN0eXlQYWczL3lUZFE2aUVx?=
 =?utf-8?B?SUNlMlVzZ093anl3N3YyY2pCbTlqLzd1NEVWaUtZTjFOWWlyOEFyU2hwd2xC?=
 =?utf-8?B?eldDUGRFbWhtcmtybUhyZ0k4TnpQbUF2S1crNWtvbTFPYXZndVZUTElBekk0?=
 =?utf-8?B?ek4vbkVya0JHU0gyNU1OampxRHJYOHc3cmZHMzVjaCsyYWlZK3VlWGpnNDlo?=
 =?utf-8?B?NGp2MW9RM0ZqeWdudmx5VVF6d0U0UHlsSldQcWJRbEhrRGg0clE4V085WFhR?=
 =?utf-8?B?K1UwTkxtTU5xMHlhT1ZKMHowZ1NaZS9xaWVuZ1pNaUg1dFQvaEpxWURmNko1?=
 =?utf-8?B?dTBtNEMrdVJSOThJVXR4eFpUdyt4U3RhWlh0U2VkaFFnK3A4VDVtMmNLaFB2?=
 =?utf-8?B?TGszZ2xxZW5CaURWMk43UHhHT2FhUWZXT3JVZnBKUFhmbFNJZU9JeGFiUU9m?=
 =?utf-8?B?MFg0WkFKdjdCdWxUVnk0U0lQT1lnK0MwQUo1N1ovb1U4dDFDOE1WSnlYUWFa?=
 =?utf-8?B?NWg5cGJBRktwOTl1bkdVZm84NXBQZWExOEZ2b0tuNWVDVkxXajNSMFhEUndX?=
 =?utf-8?B?WWNKVXZEelRYdWVzQ1doS2hXMzVaVzlnQXJTWnNYbzBzVUtHNVFTRWc5eGdx?=
 =?utf-8?B?REVjY3NqRkdxWWFFU3hDeVhabGpqZVplekF5TGV0RmF4cGlHU0Z1dGVHemph?=
 =?utf-8?B?UGVzKzJEcGZNQkRWUWtjVWEzam13d3ZZOHlOdllybW0vdkkwa1FVWHVldDlj?=
 =?utf-8?B?RFZOcFVua0JybnNkZW80M1l4Vmo1blNGeDQwdnVMeXpGeldiT01Rc2piZTg2?=
 =?utf-8?B?aVRPTkFlWHVUTWVJVzNlbERJbU5BempkOGhFZlZtRDY3RTRmT3luMHY2UE9T?=
 =?utf-8?B?MUtGUHFnVHVTY1BCeXo3Q0I4cTlnVDlTQWYzd0hKN1MzNUYwNGJ1Q2RFbTV3?=
 =?utf-8?B?V1RqckV5cStkcUpGSXJpUHJNRnVJbVc2VjlHdTRKb2pBKzROM2JzSzk1MDhk?=
 =?utf-8?B?RWZCTDQrSThHcHFqRTM3VlFId2xHZUxRRjUrTm9oVVpVTXJkYy9jSWZlMFRL?=
 =?utf-8?B?dUo5RlFJN3ZUTjhlM0ZDbmExeEdIRzdQVWxkK1Z2RmJFYnRBekNrc0RRNkRP?=
 =?utf-8?B?eEwxdjBoeUF5b1grOXJpMFUybDNjRlA4cXRGSTJGdWhURXRXZWtlZDIzcWZB?=
 =?utf-8?B?T015NUg3M1NhUkpxc1dBRDRmNWJ1RmJGbkZRc0I4M1cxc2JUb3RpQkVKTHRQ?=
 =?utf-8?B?czBNQ1lGWEpaY0dFckMza3g2RGU2Y2FoMEllYVh0eUVVY1B0VkMyQWQ3OUl1?=
 =?utf-8?B?WGlJQW9HZFVDUmJZOHluc0M0aytRNENkTWZHWWU4UHZySW51Mm9VaUlGL1VX?=
 =?utf-8?B?Q1ZkK2ZvblB4SitxQzN0b1BVcVFaSGZKRTV4OW50aTlObFlxOExBREIwWURY?=
 =?utf-8?B?TmF4cEw1Ris4NFAyMnZ2WkpRTE9STkU5cUdIT2J4eis4R1BOVUMxVkpKTVQ0?=
 =?utf-8?B?TmdHRERITnEzNmo2N3h0cTh4MFM1ek0wVGx5aE9OUEE5QnhCemxUZXZLeG9k?=
 =?utf-8?B?MnhpellxTzFKT1hTSit4YmI1TWgzSFJ3VkJoVkNHbythbyszRkdlZTR5bzlz?=
 =?utf-8?B?K053bm9BcWIvZHlFaTFOZE1qUlFyUGVlcUJZVkRGdDJSSkdVa29hbVpJcGQy?=
 =?utf-8?B?bEZjMUhzM2Voakh6a3JMaVRSLytISDIyOG43V29UZkhpc1g0TTZ5bTQyM2ds?=
 =?utf-8?B?cmMvajQ5RkVkMXA3OHBsc3IzWTBBUjhyNEZMd3lxUHVIVjgxKzZ1QjhLenY5?=
 =?utf-8?B?Q3hwQnRIY3czVDBHWmU5MHFTYkFKeTQyUzg5NzkxUVRTTytXRm9KLzVVMnhJ?=
 =?utf-8?Q?gqWWzRL58dh4h3zfd5KOzXzyreQgGjky?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b65c697-9e82-4136-11ca-08da0b689fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 18:28:41.0995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpjRswzZPVUHxaOmnB2DII3CJOxo27IaYShk4jMSelntQ47p+6+XNHrrnTWEegTYWRlvXvF9GRIJOf4iVEzQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7533
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSA5LCAyMDIyIDExOjAz
IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1
aWNpbmMuY29tPjsgTWljaGFlbCBMYW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT47DQo+IGJh
YnVzaEByZXYubmc7IG5penpvQHJldi5uZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZw0K
PiBTdWJqZWN0OiBbUEFUQ0ggdjggMDUvMTJdIHRhcmdldC9oZXhhZ29uOiBpbnRyb2R1Y2UgbmV3
IGhlbHBlciBmdW5jdGlvbnMNCj4gDQo+IEZyb206IE5pY2NvbMOyIEl6em8gPG5penpvQHJldi5u
Zz4NCj4gDQo+IFRoZXNlIGhlbHBlcnMgd2lsbCBiZSBlbXBsb3llZCBieSB0aGUgaWRlZi1wYXJz
ZXIgZ2VuZXJhdGVkIGNvZGUsIHRvDQo+IGNvcnJlY3RseSBpbXBsZW1lbnQgaW5zdHJ1Y3Rpb24g
c2VtYW50aWNzLiAiSGVscGVyIiBmdW5jdGlvbnMsIGluIHRoZSBjb250ZXh0DQo+IG9mIHRoaXMg
cGF0Y2gsIHJlZmVycyB0byBmdW5jdGlvbnMgd2hpY2ggcHJvdmlkZSBhIG1hbnVhbCBUQ0cNCj4g
aW1wbGVtZW50YXRpb24gb2YgY2VydGFpbiBmZWF0dXJlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+DQo+IFNpZ25lZC1vZmYtYnk6IE5p
Y2NvbMOyIEl6em8gPG5penpvQHJldi5uZz4NCj4gU2lnbmVkLW9mZi1ieTogQW50b24gSm9oYW5z
c29uIDxhbmpvQHJldi5uZz4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyB8IDE2
Nw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICB0YXJnZXQv
aGV4YWdvbi9nZW5wdHIuaCB8ICAxNiArKystDQo+ICB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCB8
ICAgOSArKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pDQoNClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+DQo=

