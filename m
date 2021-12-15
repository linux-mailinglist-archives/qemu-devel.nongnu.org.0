Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF922475BC5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:23:42 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxW85-00050h-TT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mxVl6-0006Ke-9M
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:59:57 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:50251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mxVl3-00055G-Pl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1639580393; x=1640185193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qPXfDAjLg1oJzq2h43rt4iKg9uIWQH4kfQ/eV+QIKFw=;
 b=hdAv+VjlXAZOajizzxoTbHUMj+FOObWXzAvCTI2h4b/LL4k94pUf9XAE
 WJ8cBM3Xwnj0tIqdIS57GE4cTpJVNVJovJKUWX5/ePpwb6qVLzs16wfdA
 YmOEuiCq7QcdwF7/TfNDd1Qe0OeF+LXIZWAc94sW8cCSmfEC8GhwBvlef Q=;
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 14:59:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoDWwmfyT/9AyPh2RQc+GDO2hGf8gTN20xYMB0LeqaAbjiYrePD7xKGCR2L+e4b9r97vzJKMnAW9JNSoVWBaVBExV2Xks2wgg35fN71Uux0YvgYfysVa+rKpT+Gl3+F38PmLpZU4tnmQdevSnQDcoIkxQL2mHkVb0mS/Tr4sNzDoGKKMDwTEhSDwxFgL6HqC0HFKLyPdqEButDvnz9mrleRmJu+IPl1ZkEqiGanR9ppP0szfrmKqMW1tuxV2LSSHr7sRbOQSDTkEoKVFooEuCa/6zqqrQg/eoMYjxJ454n6jTlfcgpTGWv1CLqcMXBySMI1eF3bxiXrNYfeTkqSGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPXfDAjLg1oJzq2h43rt4iKg9uIWQH4kfQ/eV+QIKFw=;
 b=kgzZUf7dKRx0uqpZU/R+cC+lv6DqxOvDe/eS3W7j5NiLeYZluGVurpC+4Pv4JMmLpHJNPTM9yVxMeY/4WFk4nORfjmJat7yKYaj52vjfGuuJeJ1OftuFbg69nia4NTl6Z3P406LCzVl7P9AEICudfiJkgVfzdB84TcrjKov8oQEFwVQlAdDag/0qX5OR+lPpmfD+kivEO2R11UmqSSk9Cid8RFZCpXjVu4GzRQ30+QPxLgkR0pF9/TaT/yuO4Ds8yoRdh0BlUobSiO4Il0ituNj08CPg2jUZz2j0BWENUceq0Gb+8UPmGo0YMZKYuyBy5EirkgO3ppjIeLgI+dUMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB3437.namprd02.prod.outlook.com
 (2603:10b6:803:51::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 14:59:43 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 14:59:42 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Thread-Topic: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Thread-Index: AQHX2y48l8lD0rnGCkm14LWNDIvaJawziL6AgABIy9A=
Date: Wed, 15 Dec 2021 14:59:42 +0000
Message-ID: <SN4PR0201MB8808CEFDB7AA376EB729084BDE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211116210919.2823206-1-f4bug@amsat.org>
 <d5337055-56f4-b1ee-f805-20fa08d46f73@amsat.org>
In-Reply-To: <d5337055-56f4-b1ee-f805-20fa08d46f73@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c84678f-c728-47f6-f46c-08d9bfdb869c
x-ms-traffictypediagnostic: SN4PR0201MB3437:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB3437155BF64888611D26EFC5DE769@SN4PR0201MB3437.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YKycUGj40/BzOC9LHUE9xnYcFZfGCVzaeBJ61uTvF6jpU3j1pr15lP+4fb3oY0Z66eMKQCamyi9HQl7YKC2OC7sqbVReKGsQgM0BF5VYkz5psIx0P7ltNbGxsHn7o0ojezHJV5ahFCLFUTUxS27ulHNA3/3h49Lxm5THEdmF/UyBbboWngIuVYDdecz2kYGGnOUP2TNjGOUDLP8d3uD6mWszUcGZEeKIYXdlww+Dxit2RdliwCOn73Er7sxutWp0FXGabwxXge6//6Jx/ZwlrYRKEEmKxnSekhNGG1Q8Uy0r7RXqQUJoccZcJXbQlNKGSInGbUWGkFEB4eQ8FziQgdWRiZkgRBQsEunltecFUim5IXagw2QeibVF8W/qhb3Y4RPrwdNw6OeHbyPpSVFDC8XEkMncuCUyiucbNVMCZdZAvi8JUkDYh2UcYiZ5ZqretZhMAVXcwumRg2SPKo0EYPgL3wpUhfCIhZ9qblck2Fum1SDpLhpPwyqzo+KgV1kt/xK7GydoDFmcWYWwUAvknm6Ls89Uor9ibVMw3a5yCtSbDyivNQu0Kr/ZlTujPvqvWuKr4P2btRra3m6yKn6EHtBBq4La/gvlM0FD5aeNMvhCErzl6Mom3hnzdZmM6LSihea3C8voTAVtNIiXQTZWKx0uO54lKIh+AyzrcG24/FV9IpexsZSwUA7nU+B1cvCscxQQ/6lkuVTlQ2DDY8RLA7okiEgd6BIEgpAaRV4BFRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(5660300002)(4744005)(64756008)(54906003)(66476007)(26005)(8936002)(71200400001)(66556008)(186003)(76116006)(55016003)(52536014)(86362001)(508600001)(6506007)(122000001)(7696005)(66946007)(9686003)(8676002)(83380400001)(2906002)(53546011)(38100700002)(110136005)(4326008)(33656002)(316002)(38070700005)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXFHM3ZDOU5TcjRlMHR6OG1DeW1leENlSTZMd1BKTW03MjJBWWcyZUJJUFFN?=
 =?utf-8?B?WTZRaVBNTGMrSXBlUjlYVUIzcm1UcjVhbmZpTXBYMDJhNytvalVzNjdDTDZD?=
 =?utf-8?B?M2hhQ3hYRm8wSUJUNHk2RkhUYndqcVg5ZEg5Mmwxb2tJUS92dmxiUS9KSkF1?=
 =?utf-8?B?Yi9IRmd3R1JmNDBsWUlqbFB0OVhITnhCeFRvUXNLYmhjaGh5WTYyVlFoZUxC?=
 =?utf-8?B?WXUvaS9KK0tEZ2RiQ1RJVlVsakhRRDZ2SDVDWS81U216TjlrM3NZdFpOdFM5?=
 =?utf-8?B?bXl3U0xvTzJRV3VEaFYvR2tXMFhPdEI1bERvY2FneDZteW9RZFZhcGU3Vlhx?=
 =?utf-8?B?NStRQWpLcTNRZHljdkJWbCsycmNPSlpENFV3UStlaUNpWEx4ekhKRkRid240?=
 =?utf-8?B?YTU2aXhnSncydXFycWdHY1owU29ZcDQzNDlQdHB4SnBTOTE4Yjc3UllqazZV?=
 =?utf-8?B?WWg3eW55MHNTSm0vcDcxa2VkNFgwcGVicHdBdjBLRmI3RlZKZG1TcmJSdDhB?=
 =?utf-8?B?RC95YldDNlNKVjEzeEEweEg0K1dGNjd5UHpGNlMxNDlYbHVLc3FraUlIeXJy?=
 =?utf-8?B?TUs2VklCYUpCOUgyS1JMNmkrVmE0eTZ0VFpJaE01R2N5Z25lQ3pXczFnN1Uy?=
 =?utf-8?B?cW9EeHNmcGdvRnZESkdRY1k5bzNobFBnVG0xS2hPV2I2WXNLVUZGQ3BqZ1N4?=
 =?utf-8?B?SG5FeDV4YzM5Y1VHb21IL290UzdFRHg2K1BuWUdyMnhBa1RkZkdsUlhlZS9j?=
 =?utf-8?B?aEJYb2xnUDUzaEY4Q3FKRXNHM1AwMTg5RmxWWE14Y0hSZmVxbU5KNlN4RUZs?=
 =?utf-8?B?eDFmb0pVOVNQSE52b2tuVzhBb0hGZDZ0UGszN2tLbEVXQXMrQnRDNVFlUlpR?=
 =?utf-8?B?d3A3Vi9uQXJzei9qTXo1MlZQVXEwYk80cHlwUDgveWt5enFIZFRIN2Ruak5P?=
 =?utf-8?B?UjB5dzBkbWFRazlDODlZSkZVeWFDSWNJaDhLTVQ0c3ZkeDNoczMwMnhxTFJH?=
 =?utf-8?B?NG5YMmE5UFM5Qi9ZWi84cWFKMFRCa3VOVVdHdjhhRnYrdDUvOUJpbFU5OStT?=
 =?utf-8?B?NDkxdFhwWFZDRWJONjN1Z2lsd2lZb0tSaXp0d2F1TkhGdGhtTEpWTGFEK0JI?=
 =?utf-8?B?b1NjZHI5VWR3UXNaQmlQbmpBZkxGSlZneEFLdjYzaWpaTU95eXZJcnB1UHRs?=
 =?utf-8?B?MTdyMTlWNXlWZEgxdlBxb1ZVRE5QM1c4M05HRWFDM1pvWUVraEFlRytQaUw2?=
 =?utf-8?B?eUgyVThMci96L3pVS2lKVG1HTUdlb09OZ1JzbEl3VWJqKzRMNy9lYkFsRXY3?=
 =?utf-8?B?Mm9tbUs4YkpnK0QzNkV5RC9IN2RvWFc3a0lSVUppTGo5QjltNFp3TkxGN0th?=
 =?utf-8?B?MkxkVU5UaEpMSFJGc29oUTgreE5hWTNzUTFUNEFIWW04ZXc1Mm9kbXNEUXpG?=
 =?utf-8?B?L1M2THNQa0pzK1lNUHpURXVpK25rcDAwRHNZM2lVU25yL1p5N0o4OU9iNFVT?=
 =?utf-8?B?bVhIakt4UXpiOWpOODAwdktieDVtM041c0ZYUzE5VUhjNEh3c0JIcGNCNzZz?=
 =?utf-8?B?dlVNUEk0VXpkRXozSGJzY1lCTGduVkJITytqNEx0YTR5dmhnb3ZZeXBjZHpm?=
 =?utf-8?B?ZnVWcDlCZWFoQWswOWhWS0Nnd1NxWmxFcmtlQzUvbXVkYXhacjBVdEFiY2dH?=
 =?utf-8?B?M21aRERoa0g2UlRtQnkzVkk2TUxXN3p5R3AvRW84TUhnNm1vZEluWllFMXNT?=
 =?utf-8?B?STE4WTk4NDZ2dXlmS2t2M1FKY2RFTEhjaTFWYVpDYm5ET3M3L2Q1cG9memVa?=
 =?utf-8?B?bDZURlRGeDBpeGpDdU1hbzR6d1R6dnlZdEhTWklhby9sWlRTYWZRWXhIVnpQ?=
 =?utf-8?B?UVpFNGV4WDVNbG94SzZ0bnRucU91ZysxN3orM2d1R1pQSkpKYVRiNWZreU9O?=
 =?utf-8?B?L2gvNythV25CRkpheVFZWXZpRFZBdyt6OGpKRm1vdHJJQy93Qy82WUdYSkVL?=
 =?utf-8?B?UWR2dnVOc1J6c0w4aWhDTldUcVc5WXZMckxvK1o5ZGZXNWVLcGRPN21rU0dv?=
 =?utf-8?B?WE10R2c2QjBIeWw3Y3lQMGF1Ymo2c3hPL2FKYUFDUHBnV2MxTUhHNXRSVTQv?=
 =?utf-8?B?aklnYUt6bGNlZzJQbnFjU0NPM1RuWStlSzA4ZGFEOHBCdzhOVWIyVkx4Nmdh?=
 =?utf-8?Q?PaWsSrwnjyeuObJmACQrSHk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c84678f-c728-47f6-f46c-08d9bfdb869c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 14:59:42.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMomo57PnAi3W4rpEC4Kl4qjQNLQFrINQDKyCf4JAMND6DZmb63ne97aHjazW6P1CQbgIMmcBHQxtDSgEgxojA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3437
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAx
NSwgMjAyMSA0OjM2IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+IDxy
aWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBsaW51eC11c2VyL2hleGFnb246IFVzZSBn
ZW5lcmljIHRhcmdldF9zdGF0NjQNCj4gc3RydWN0dXJlDQo+IA0KPiBwaW5nLg0KPiANCg0KU29y
cnkgaWYgbXkgcHJldmlvdXMgZW1haWwgZGlkbid0IGdldCB0aHJvdWdoLCBidXQgLi4uDQoNClJl
dmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQpUZXN0ZWQt
Ynk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0KDQo=

