Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F41510DC9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:14:13 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWFw-0001Ls-OM
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1njWEu-0000RZ-8j; Tue, 26 Apr 2022 21:13:08 -0400
Received: from esa15.fujitsucc.c3s2.iphmx.com ([68.232.156.107]:26652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1njWEr-0002Ub-Qy; Tue, 26 Apr 2022 21:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1651021986; x=1682557986;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=veEdK5NfSQ7aEREulAnDpLJmwKdTIr9E6bvgo7EAcu8=;
 b=Ko9PH618PcQNQkRqu+KXaVb8Cctla4AhMY2rBnDhj3hTpcbMcih3Kad/
 oMDBfeifbJA34ya9HbDtM1GQ26u/pA1efk6lBAyvDqTXiiWxD0Z43kGCm
 PvgyWjrPkj0bYxNX9qszQBSz/khLsqxXuJWlDfLhjH/gu/qW//Es5sUEH
 +Aff237+rTIlV8YwKL54aueqUiUGgVvkbz1qyRC6CqVty+oBYQWwl3ESL
 Z5yxSkfuIntlMsM+nusK/hKouKNVZOgff0OpsN4TlvnlO0OtFkQQgFZxv
 nufQJyNKXTEAQzWkfKrb0MPNMxpDduUxSsIt0PMYttFb6X7wcv3fmPbFU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="54692534"
X-IronPort-AV: E=Sophos;i="5.90,292,1643641200"; d="scan'208";a="54692534"
Received: from mail-tycjpn01lp2173.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.173])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 10:13:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HThId9qIH5rKW3n7c8sCiv7tgo9SPoJZo0MZE8g8C2oBYTYUfQUxoBHHoajWNJVrYrctRlWzgyVOkjRVfB3KTLce2+sv0Qxk/7S5BS0tp2i0G4ym1tMvjJH8HI094YlVFVeuo/IpCnzKSKNTMd3A1dAlwJmTrcJejABki4P7E+y5brncWOPIyY40IGHuKoE4MAnlaDD2WwN/AaiqOREIbtjNF2+/DfXHqf3AZ4Lfww1URbesDYbDShES8R6IBzlG3DVUYf4G1nyW3hTPuwPvKPE/P+JbkEVMSD3mpZMTYXf6SRv6fcb54xPzJYOCzxvojikhzb8ARQecI93hFAQYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veEdK5NfSQ7aEREulAnDpLJmwKdTIr9E6bvgo7EAcu8=;
 b=KQ8i7z5FfG4hqczWCFHfwwA3V2OpZFEFyw7SV1V++6RdV/Aiv28pae14R9SudQGlNU3FM+v+abtildSsKfgj+UCZGLqcyUAaIDd3zJXgQziAB++sQFYD7Dtqfa6UCZQ5Tgq9MvsWQi0LXwxKvWtvdK5aecnAKfVttcgMtnep8/8v+gmoBo87z/yEykikst94NdoHdypYLDrGH8XZgNLGttgg7bMMfW4mHUEnt94BC9eB1F0tOe25Uyjw8SUMva74OdbLU1w36Ydqv/Nyp2dEevchnrHeijumR8kcfSjOFQE+FffSpfLUtahTBaqyPO2x/6rIV44ZaWE4UcGNK8nmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veEdK5NfSQ7aEREulAnDpLJmwKdTIr9E6bvgo7EAcu8=;
 b=W8qfhI37L2iMrLFjpaOSsSLswcyp8kAh+zXxN/VoB3yj28rnJtB1YYt8o0TLslg/HUYGnID892a0M9OZbITpxcsHfymVm+JD/rma7LhnD2APg0aEekT71nRWn5KoS6uBEutCbDsXpFFfXvC/gedmOtBTkqqw4swGPZ8iT/VKGH4=
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com (2603:1096:604:107::13)
 by TYWPR01MB8541.jpnprd01.prod.outlook.com (2603:1096:400:172::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 01:12:58 +0000
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::15f2:cca0:c6a6:e39f]) by OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::15f2:cca0:c6a6:e39f%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 01:12:58 +0000
From: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs: Correct the default thread-pool-size
Thread-Topic: [PATCH] docs: Correct the default thread-pool-size
Thread-Index: AQHYTu3i/2SNjuhH9EapQkf/Uwifj6zvVdyAgBO0IAA=
Date: Wed, 27 Apr 2022 01:12:58 +0000
Message-ID: <d6c4a49b-4547-8b65-02c6-9d3f72d611af@fujitsu.com>
References: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
 <YlgRRcgIbbE+ZKb7@redhat.com>
In-Reply-To: <YlgRRcgIbbE+ZKb7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c98e6a48-aa39-4349-59c0-08da27eb1141
x-ms-traffictypediagnostic: TYWPR01MB8541:EE_
x-microsoft-antispam-prvs: <TYWPR01MB8541CEBC3B97846CCC5214719BFA9@TYWPR01MB8541.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6nGZAjP3mmylr6KyrMZmJg3vvdI/SND/qpafNE8r2buzTkViEUe4b+R7hiTpwi5ZdcKoJSqj4w/OTOZEWIUz8MMCN76dTcK8AUoLKd0MuZ9xwUB9Pm5y02UmnxAn9mxrTtQAnHXdeyHtjR0XuhWR2xZv0HRQ14KG3gRCqNyqsA0z+ZQrlYY8XpoxRSDXvFtEtXxBZRRlt2TcxKLDBLI70rcnAzQJKsCJOrwOpQqADwtmOsDmzYFOZqahDwWGXdNobXsukdW37GsSS//I6S6MsZLDMW6y6QWvZAJUrdu4MUdqYLqytMfOF+mVllBxiu7+GcOcCj9pqXt8mmvGohyvM03jslw3sMBwpzZmHmsb4YQJ2M1bOenH1ZBBwOSEH2FbUMGyXhtIP0TpmpPxN44H3B4ygT6+XTmkq2TuzoSMNNfcPM3SYVLUsFhSvUmn6lY/DxvavAdBIIV9yZHhAg4cuI2HfH2JvhqE+WIJom6nAKNehD7/etKM8gxfNpmzxTi/Z8JbFf4wihu6fgU27b2kN5LmMmN3/bMoQ7cYvaYmMNXKA70gx1+6o5HCIbw4w7rADwoXAb7/UnWY1+VDO4vWleJF+90WoyiKzg7RQ8AKNNnXU29yBIrY8mTAfQ4y3MnM09MPsBgXbMXy9bq4hdtqsB7oxs09I44mdnu41KXzwMEpu/TP+ckauQgydtSD2eyLYORKkOX05E65LiUi8hUSjXOkQAvRXpw+Q1XJ76S9j3m7Eid3Wv0bDaFRmTpYxUzb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6481.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(6916009)(66476007)(64756008)(8676002)(31686004)(36756003)(85182001)(66446008)(6506007)(53546011)(66556008)(4326008)(26005)(8936002)(91956017)(316002)(66946007)(6512007)(76116006)(5660300002)(2616005)(450100002)(122000001)(82960400001)(6486002)(508600001)(71200400001)(86362001)(38070700005)(38100700002)(2906002)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUhIK2dJQ1hTWWJDUVVnVU5MeFJMVzVFakpXQW5HSnp4NXJhWlBJdi83aTZm?=
 =?utf-8?B?STM2LzVacEhwa09LbVdwcko3ZlBUVTdHK0ZQNXFaK0l2TGRpYnIvakY0c1pO?=
 =?utf-8?B?WVJEWmZnYnJhRXlEWStYUDNycUhUTXk4LzErak14Z3BRd0tLemRPSlJmQTM4?=
 =?utf-8?B?b2djaHRRVXdRQ2RoSlR1dmFYQXlpT3NLRGwzZ3pvWVJzLzlaSWMxeUpybENz?=
 =?utf-8?B?VVRZdENWMWJnY0kvZnhJUUQ1L3ZnY3RYcldiOXJ5cVRGbmNTSXJlMmV3ajQ0?=
 =?utf-8?B?K2lOMlo1RDJ5aDI3ZGRBN3dRVnJyc2JWNGxQSGttRTdrUnNrUlMzdHBJWUFs?=
 =?utf-8?B?cEtiYmhnWTBReTNPb0xPRG1BODZpRjJscUY3R1pZSDJ3OHVMeCtLeWt2UStB?=
 =?utf-8?B?OHhUTW5WUVk4a2JVeGhEcnN3NytVTUprdmRRVjhxcnVLWTVNOWVTNlkxREZa?=
 =?utf-8?B?MnlZR2g3cytLZVJqOTF1RXE0UzI3UkFDNkRMaTNyQmpZNFlGQUY0aHMwUmRW?=
 =?utf-8?B?MXNNTHBXSVY1Tm5FUmYxWmtmNzhjWWtDbVpaUTAwSTY4RzBXRDFiK08zRk9w?=
 =?utf-8?B?VmcvRmlKajZhMFA3aHcwcStTSHRPRGhmWHYrb3BJZEI2bHl1ZFFPUitDQjNG?=
 =?utf-8?B?Tkh2T1ZXMXVDZHJiSUN5dlpFcVBRREJ6NWZVS0U1UHFiOU5pdmJoVlA5ZEV1?=
 =?utf-8?B?VEZIRThjN1pMWjBOaWNOK2tVT3QwU1JkTmNpL255Z2Z2ZDdac1NLVnRYZG1H?=
 =?utf-8?B?b25xWGFPekRydmVFcmpUdFdRMjVTS2UzVCsrWTJwWmFQcDdCaDVKdnBlZGhQ?=
 =?utf-8?B?dk9tTmplUVFGOWJZV0F2YVh5SnU2T1phck1PYkw2R0ljTS9ueXFvTnV1Y0d3?=
 =?utf-8?B?QXQ3MCsxMnczKzJZOU5DSTZHN3lsc25pRnF3ZHZzYjFla2UvblAyZDJvb0lD?=
 =?utf-8?B?V0dXeEJYcGZGMFFBallSdzdiN0lyVEhtUTFpTUFoL1E4a1F3NzVOQStzM2NC?=
 =?utf-8?B?NWIwY2hIMTZvcnBGZTNaVkkrdVdKbzdHL0lmK3VxSW9lQlYzb1JuWDkzSWlw?=
 =?utf-8?B?V3VRUXJCZ2JuZ0F5UUZPY3ZrcjRqYm8yQTErVk9GQ1J4djBVajB2S2ZTek4z?=
 =?utf-8?B?L3pGNGI5M3p0ZmhOL3d4RndFZVQxeWV6NWpHcmVHajJJVk51dStneFBhSCtU?=
 =?utf-8?B?VnpIdXM5c05MNFlYd1MwUTBjMmo5cGU5S0dWakpHT0pXNmpCSzR1VFVPQWFt?=
 =?utf-8?B?aFdwY0dsQlZ0dmU1VHQ0SEg5OCtZR25ZcU1LZUorL2xWeGxvUTI0dUh2RDVB?=
 =?utf-8?B?RzRiTG9JZGJ0Y0MvLzNMd3NvQjFDYldtY01zemthNU1BYXp5NlNlQlRQY2ZK?=
 =?utf-8?B?T1hWQjhKVjdKbjBTYkcwb1FzbFc2dU10WnVBY3YxLzZiQmxZWmVEOGRYSE5B?=
 =?utf-8?B?VCtIOVlmVllIUDNxdGVsTjdKYkkxZzRwRkdQZFNySm9RMm1nazgwTUNWS0NR?=
 =?utf-8?B?Mlo5OFBZQkMxYjA1NkxJc2dMeW41NU9pRFAzaTlrVmt6OGpoN0Y3UkUxTWFS?=
 =?utf-8?B?eWpkejl6VWFUUWJWTWxkTjdLRWdyTjBoOU5Tblo3cnEzb1Axdk5uRWZLMEpz?=
 =?utf-8?B?ZWkwTjhackY4NXhWU0Jkc3BRaVhaZUpGNEx4U2MvalVFNmdTSDNzeVpZazIz?=
 =?utf-8?B?MWFpend5ME1Cc1FJQ1VQVUJ0RWZsM0xxODdPRzhja25rNFNkeCtoZ215Z3lS?=
 =?utf-8?B?cGo0U1lRSG5WMWYxYzRFSGQ3RHV4UTNVbmtuUnI2TU9za0NUM2xNNGx0UGtH?=
 =?utf-8?B?TnlXSmVEdUo5ZjF2cDA3QlYwU2ZvK1ZGZ0c3b0IzQ0EyamovZ0lsdTBRRU5r?=
 =?utf-8?B?ODNoYmQwenJCT093MTVMVzhncWw4RW1leUptMzZpV1hlN0RobUNZSy9HNmJ2?=
 =?utf-8?B?RFJ3VHZsYjlYTjcwWnRUU25yVG5GZ3RDcDBaY2ZPS1RvRTBWRWw4YVpHd05r?=
 =?utf-8?B?aVBreHBDTWJpMmttNHpEbC91ZE1ZSXpieWJkdlBrL1I1bEs4d2dGUmQ1L282?=
 =?utf-8?B?dldBbFFGNlAvVDNwcDdJNk1GY2tFR2dDTUtaV0xDS0xiY2ZOV0VFNWlaNHhs?=
 =?utf-8?B?Q25UamhTK2hFTjJKelgvT25nVmliN0c3U3M3TGEzaFlDOG9XZGxqdFRzZ0hx?=
 =?utf-8?B?Ny9GTmtYV2p4VytyTERaRzg2WmZTSENqMnlHNE1NdE5LdmcwbkJ0UldrK2Uy?=
 =?utf-8?B?UVBVdnlnSlhmd3pNdkk4U0ZVcUNQNGljQTlRWlgrR2hMZEVkOHNScFpvTU52?=
 =?utf-8?B?R1VTWGkyZ0xISUxjcnJIY1NQdnd4R1FMc1FLVGN0Ny9qWWxPWG9ldUp1eXpR?=
 =?utf-8?Q?Dr59LQkc9rxW3e+0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F37B3EB17CFC2A499A61BD0C541B894B@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6481.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98e6a48-aa39-4349-59c0-08da27eb1141
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 01:12:58.6014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pyx2Ab5Cc1xLxtm6VMRVIhqbxT3xXnJgQSDfKLhlDlGae0K+8xqao+sYLnbYVnBxE1eFws0cmp5yY2mZAvmAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8541
Received-SPF: pass client-ip=68.232.156.107;
 envelope-from=liuyd.fnst@fujitsu.com; helo=esa15.fujitsucc.c3s2.iphmx.com
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WytjYyBxZW11LXRyaXZpYWxdDQoNCk9uIDQvMTQvMjIgODoxOSBQTSwgVml2ZWsgR295YWwgd3Jv
dGU6DQo+IE9uIFdlZCwgQXByIDEzLCAyMDIyIGF0IDEyOjIwOjU0UE0gKzA4MDAsIExpdSBZaWRp
bmcgd3JvdGU6DQo+PiBSZWZlciB0byAyNmVjMTkwOTY0IHZpcnRpb2ZzZDogRG8gbm90IHVzZSBh
IHRocmVhZCBwb29sIGJ5IGRlZmF1bHQNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5n
IDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiBMb29rcyBnb29kLiBPdXIgZGVmYXVsdCB1c2Vk
IHRvIGJlIC0tdGhyZWFkLXBvb2wtc2l6ZT02NC4gQnV0IHdlIGNoYW5nZWQNCj4gaXQgdG8gdXNp
bmcgbm8gdGhyZWFkIHBvb2wgYmVjYXVzZSBvbiBsb3dlciBlbmQgb2Ygd29ya2xvYWRzIGl0IHBl
cmZvcm1lZA0KPiBiZXR0ZXIuIFdoZW4gbXVsdGlwbGUgdGhyZWFkcyBhcmUgZG9pbmcgcGFyYWxs
ZWwgSS9PIHRoZW4sIHRocmVhZCBwb29sDQo+IGhlbHBzLiBTbyBwZW9wbGUgd2hvIHdhbnQgdG8g
ZG8gbG90cyBvZiBwYXJhbGxlbCBJL08gc2hvdWxkIG1hbnVhbGx5DQo+IGVuYWJsZSB0aHJlYWQg
cG9vbC4NCj4NCj4gQWNrZWQtYnk6IFZpdmVrIEdveWFsIDx2Z295YWxAcmVkaGF0LmNvbT4NCj4N
Cj4gVml2ZWsNCj4+IC0tLQ0KPj4gICBkb2NzL3Rvb2xzL3ZpcnRpb2ZzZC5yc3QgfCAyICstDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kb2NzL3Rvb2xzL3ZpcnRpb2ZzZC5yc3QgYi9kb2NzL3Rvb2xzL3ZpcnRp
b2ZzZC5yc3QNCj4+IGluZGV4IDBjMDU2MDIwM2MuLjMzZmVkMDhjNmYgMTAwNjQ0DQo+PiAtLS0g
YS9kb2NzL3Rvb2xzL3ZpcnRpb2ZzZC5yc3QNCj4+ICsrKyBiL2RvY3MvdG9vbHMvdmlydGlvZnNk
LnJzdA0KPj4gQEAgLTEyNyw3ICsxMjcsNyBAQCBPcHRpb25zDQo+PiAgIC4uIG9wdGlvbjo6IC0t
dGhyZWFkLXBvb2wtc2l6ZT1OVU0NCj4+ICAgDQo+PiAgICAgUmVzdHJpY3QgdGhlIG51bWJlciBv
ZiB3b3JrZXIgdGhyZWFkcyBwZXIgcmVxdWVzdCBxdWV1ZSB0byBOVU0uICBUaGUgZGVmYXVsdA0K
Pj4gLSAgaXMgNjQuDQo+PiArICBpcyAwLg0KPj4gICANCj4+ICAgLi4gb3B0aW9uOjogLS1jYWNo
ZT1ub25lfGF1dG98YWx3YXlzDQo+PiAgIA0KPj4gLS0gDQo+PiAyLjMxLjENCj4+DQo+Pg0KPj4N
Cj4+DQotLSANCkJlc3QgUmVnYXJkcy4NCllpZGluZyBMaXUNCg==

