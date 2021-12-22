Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD347D887
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 22:07:47 +0100 (CET)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08pu-0007hm-G9
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 16:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n08nn-0006xe-Hk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:05:35 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:26641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n08nl-0001Yd-Cn
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640207133; x=1640811933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kerqMKDuecNriWwi/w+ICccuKaZA0dEEFwetdHnGDfY=;
 b=a2zjHzWJjosrTHU6zYRG0Ow9Ey1QzjuIIV0OxUqAhM98I4Ld3rgOfycn
 9JJTCtiYU0j2NU8L9OPIo+W3cPlpuD2pFuIihs7P1vCwhaHJDb9c3hSjP
 8RVehg4OJlhu39N8Vg7EgxSoDOT8DYENDBFsRgbDFgWY3qFOg99s/UQY+ k=;
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 21:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA8kKrOssPaCiU98gC+ZDmV69B6KZLEMIiwqUUCXouRiENyp8mVJUpEvuW5MydGFsK6hmvPoOVAVzw0OeUV9ILiMRWnDJQmehPk4838rInS+M7JnDFV3HlU4D9NHe/R+Szco6LKzE1kvgTF7NgHX9xEenVL5zFOseaPajbSZlULPHS92VCu35TYvtu3eZLBfBxbYfQpOMCE+LEM3CdiZF5w3OGRO0HCMOOHShupO0lyPncDidFBwkB6e7dfuLZh0cewfeIO7ye1H4aTWJY8QeA51FNA9K9dvWDB293KUIT/IuLqGsin6Y9QF52mSg0Y1mWx27uWC4mq7COAbJ/HZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kerqMKDuecNriWwi/w+ICccuKaZA0dEEFwetdHnGDfY=;
 b=YFTVu5EjQbnXXyQeamlkM8ZWX+z8qjffP18MKRkAO0nooAZFygAZu145c2x0bVLhxU4dPBXW69zT4V7L2/PMDDfvwgzQYfjnbsNTETJ9uoSkm6jEekfMswOT0ClcNxCz92a+TfW3qFtFCuWeM4jrs4uHUB6Qwt6zVARWKL9nEZFiA1H6Cets/sEyaoB7Fa0ESR/XxON3NhLl3jjKKiFzELehHEo7EUBYWLXOSnHQfbPsJrJScu6jeQ3PPTmaIqnH+aNlpgxAEdn1LRsdVsgA4YlNLlSRngnaUJEz0zIKXO9cmtLrWfwTmOCymH6z/g2FoD5E4g16kFQ9HSClzZN+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com (20.183.98.108) by
 SA2PR02MB7721.namprd02.prod.outlook.com (20.183.57.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Wed, 22 Dec 2021 21:05:27 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 21:05:27 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 02/13] target/hexagon: import README for idef-parser
Thread-Topic: [PATCH v7 02/13] target/hexagon: import README for idef-parser
Thread-Index: AQHX8yS6XI1cGunNGEO69ZMWYGRD26w/CM4g
Date: Wed, 22 Dec 2021 21:05:27 +0000
Message-ID: <SN4PR0201MB880880A91C39BC4B575CFF4DDE7D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-3-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-3-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1adf4381-9e84-4024-6022-08d9c58ec7aa
x-ms-traffictypediagnostic: SA2PR02MB7721:EE_
x-microsoft-antispam-prvs: <SA2PR02MB7721566C0A3F420DEF25BDD0DE7D9@SA2PR02MB7721.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:538;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fwIclWK63i5W5PVi9sfGgW4ag5EDqRpuohwtg19mc3O6QDtqQ008i+390g511Zs8OMWbrnZDSwing9ixx2XOHaoEpcADEEO3qm3qwBGUa5QQXcbPfR1+cDXFsfsH96La7pCRxtf9FwFyIVDWyehJVjXwWNVBehxhwKjXAw1pmbzT/pgs+85rMMDN9+St0WgF7IzzfgN/E1sjpzRzUlEkJyi8Xy2O9IwFlpH14I3mMRZa4Ds+4Z7z3bqimzgoS1+80JlSsA4VU4sszj5FK2mVJhNSDEFMVQZZAJvvjCr21iDWrEEgAEhmQuPajMcVC2J6CVNKe8zdxtdfsHrr4ciEMcnYrMey6BnsMp50I6US6ks4T9dZXAOiYOL/pns7x0+eVs0hJ90KVWXMLUucX8E5UO/wUgVfR64pUm+Lm1IU9ai8+5eoTSW//lwgaDFEWwWXVw9bdJ8fPOL/2jLYOFhnV6Z2k/lpL0tPRj4bq/wtHwfnnZz6IcYB9fozuC9U6FZUTJuEzWmU67DeB1RdvRWBvWQ4CdJXozWYoIaZaJhOH7CPpcBdzsBV0E9UW8NZVYyUzbrqQRbN94FXawp+TBnchYeNNz1o/3rubnFas/6Z/MZNHTSNOF5FHk1CVelHosOytF5QfgfFa/UxI6Y475Rx9Unl4J5rnRrqU+RTOeDSUGn5XKQu+OZgZiGpG0c65xXvAAZ+7TxlgKrbAKZX9VIzxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(8936002)(76116006)(316002)(9686003)(122000001)(8676002)(6506007)(186003)(110136005)(54906003)(53546011)(66946007)(86362001)(508600001)(26005)(38070700005)(4326008)(2906002)(33656002)(66556008)(83380400001)(64756008)(52536014)(66476007)(4744005)(5660300002)(71200400001)(66446008)(55016003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1RsTlc3cmxoeFM5WGRkZHpLNVNYZEJNWEF1Z1hOTytDMHhiYk1jOXhObU9T?=
 =?utf-8?B?ZFo1TVBNL0lpTmpRQVdLOHZoYVROYmpuYmY2R3VqdHp6MCtsd0dtaXpocEZ1?=
 =?utf-8?B?QnpEN3VoZmtCc0FjMzVCaC9qSnpuZE1vTmdUYmNhZjVJOVlVR09aVHNWZTln?=
 =?utf-8?B?ZVhldmxkcnJrbHBNQTNwZ2xzN3grdnRLdmRrNWlmNTRtenVKZFl5K0hsWEVj?=
 =?utf-8?B?Y00yZDgyQzlFS2R4MGFIemtQVVRxdlQ4UHdueTBWY0kwRlAyckNkdjB2Sm1I?=
 =?utf-8?B?VDJDRUYwdS9FOTdjZVJIbSt1aTNKQ2t3eHpubEt6dENjZlVMSE9hZmRmeDJT?=
 =?utf-8?B?dnR1dlhrRUJkbmpXZjZoajd0ZXpIdHI4eGtjSUxaUDVBd1RxamE0algrZC9H?=
 =?utf-8?B?aFY1WGRiZUhRem5VaVJMb1RDS0VwL1g2Q0JiNjNSaWJRR201OTNMcWhFd3JY?=
 =?utf-8?B?bEo1WjljMU9VMWZ0NmF3WmVXOXNleUFKcWFlbEY0YlM3WDlSSUxpeUZYMWs5?=
 =?utf-8?B?UDNjdFVXc1owWC9sb2FFaE56a1B1U2N0SVN2TzhtZ1dWdzJLMzAwTlVicFhO?=
 =?utf-8?B?ZUs4SjdZc2hDOGV3cWlxazh4cXFNMGVVK0FvZFczcmRBWEdHTkJ3Zm5CWkhC?=
 =?utf-8?B?R1NodEJ6bmtpVlowY0hSQklJd1A4V0RzVElVVitLWWZ5T2tmU2hWb0tmZ3Rn?=
 =?utf-8?B?TXpZb0hNbGZJRElaNHkvdC8xTXhqWWVBem80WExqTmJlYm1RMXBmMFprb0pK?=
 =?utf-8?B?V1M5U1NwKzJtYkR2NXRkUThDZGpNaXYxQXpsQ2hBMHJKcjlCVEErWDBCcTF5?=
 =?utf-8?B?Y08xWHR4TGJ0cS81Z0hQemZrTXh6eTN0VWI2VU10U21wek80Y0NtN1ZqTzgr?=
 =?utf-8?B?OTRpL0VZZHZGS0NQVzc4ZndRR20vdlJEWFNkSk9xQWhEbTFHUnNhcjhMZFVY?=
 =?utf-8?B?T3FXU2F6YTlsc2ZtbmNEdHV0UUhxU0Fsdk1tdkYrbzdPT011UVgyOFFMT0Nq?=
 =?utf-8?B?S254aStWNWVtSTJ4YktxQ1ZrTTRZSk9IMXBWUjdDSmFyMEg4di9HWWRMWUI1?=
 =?utf-8?B?eEdSWDR4UVExYjJ1SnRvVEZtTjZEZnBGVkZyYTk1TExYVUZnWlRqTEpQYVlV?=
 =?utf-8?B?bTdtdWZJbE5iRTlqZmo2L2ZJNHg3N2t2UEpzREhGN0xENk4zbm5FNTF0U2Fk?=
 =?utf-8?B?SUVFbGJYTWFJeDg2S2JLZnh3RlhUVkhqVjhDRUNXdWlXdnhwdDNhUWkyVmg5?=
 =?utf-8?B?NDJlRHJtUHAzTC9lTXFwc2xYTVpZd3AyL0tuY3QyeFlzdUdGcUhMTWdvcUVm?=
 =?utf-8?B?U1d2V2owQWZYNngyN0JjNzdReThYTEV2YkN4OWpqenRnN0tTNmU1RGtpeGp0?=
 =?utf-8?B?QVdBV3Qzc3FmUno3ckswdUdLOElUUVlKTnU5eFppOGJ4TnN6bkR1L3V3RERK?=
 =?utf-8?B?a2VOVkQvMVNMNlg2YmtjU2RUaklkWlNGcXd6RUIwMGxlL2hSYktyL2piQ05I?=
 =?utf-8?B?TjRuMVYwYnlLWlp4b3NZTjlqYk5jVFRzRXpyRzFKcTlPUkx4VTZNRmNNWlpx?=
 =?utf-8?B?aGg4cVB3d1BRQkNwQ3F4NUtzb085UEJYclp4Y2NWcGEwTVdScWxiNG1ISkdF?=
 =?utf-8?B?TXlMVklQVTFacWNTOEp0VFl6NXdoTmRzWHpVcVB6UEJOT2tORVpxazFpM1VN?=
 =?utf-8?B?T3NBc3BsTnYyV2orMlhLSThkTGtrY2pGekpIWUt5TlFXSFNXTWJVZVNsNFBP?=
 =?utf-8?B?MDhPSm1SemhNYTNiNTJvWHJ6SWlEVU4xNndaYytvd0dLdXlucXRFdVcrNk9T?=
 =?utf-8?B?TkVLSWhRc0hldU5ZdldLNzVrSmNpa2pHc0p6NjltMmp6T21PdmUyZlpWaGNS?=
 =?utf-8?B?RERreHE3NHpibUpvTlErenpLcGg3NGxtUEhpRXBIWm5Sbkd4WnZ2RzhnMzly?=
 =?utf-8?B?UWwzekVLMCtWUXBkakcrektIRjd4cVAvWStsN2hTMFlxM2dBODl5eU1NbU1F?=
 =?utf-8?B?NzduczVxVGhrMFpmRU1OOTkwTmwwVEtNWFJqNk1CdTNtanRhdkhKb1JWakRI?=
 =?utf-8?B?MTB3Y3J4TmxRVG81WjB6dzFBem42NXF3d3EveFczQVVneENodGFpQ3lIK0ps?=
 =?utf-8?B?UnNFV1FwM0x3V0U0Sml6STFGc3R0L2JWQ2dhR1Jpby9kTVVyWldMRnhGelps?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adf4381-9e84-4024-6022-08d9c58ec7aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 21:05:27.4558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8WKRYxRC+V+cWB4UTznM3iwwxJLnfN5Xp/i4bPeDgndRJsIK2ARU/9Z3sYN1JeW7coSPhUG78o0MUIdYnbrTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7721
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxNywgMjAyMSAyOjAxIEFN
DQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNp
bmMuY29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOw0KPiByaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAwMi8xM10gdGFyZ2V0L2hleGFnb246
IGltcG9ydCBSRUFETUUgZm9yIGlkZWYtcGFyc2VyDQo+IA0KPiBGcm9tOiBBbGVzc2FuZHJvIERp
IEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxlc3NhbmRybyBE
aSBGZWRlcmljbyA8YWxlQHJldi5uZz4NCj4gU2lnbmVkLW9mZi1ieTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9SRUFETUUgICAgICAgICAg
ICAgICAgIHwgICA1ICsNCj4gIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL1JFQURNRS5yc3Qg
fCA3MjINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NzI3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9p
ZGVmLXBhcnNlci9SRUFETUUucnN0DQoNClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+DQo=

