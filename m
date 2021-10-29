Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D043F4A7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 03:52:56 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgH4h-0007RY-B4
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 21:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mgH2U-0006fe-2m
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 21:50:39 -0400
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:16363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mgH2H-0000SA-Mh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 21:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1635472226; x=1667008226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3l0hVS0mKnjS5VJflQ78Koyl3GuxdR8kuNKj410tPiM=;
 b=jFMO4mhv9Z9DEM4ZDTwm768zmkxfxYw0XeaA15yPDbOVpXwlwwCqDnJT
 WL9I4FLK25zl44c+Sj0SVxyxMKWFKp4lyyQVBskAERO3v7jUpElhmElzT
 JK9Xztio+eWyP/c+l09v23ydk+pptXMDG5OSuWopuO8tC69R65CN/qsEp
 jRdaHnRUx6dS5uXFwtbVi9N/T8CiHZUDnyAJFQFdT8kICtUEiD6KyFDBN
 zE/y7TybEKpH5RJG5Ezoj/zbD16Es3NCV7jn8nWQ8ul33Gpcpior2C5Av
 Q6qTsP6ZoW/5hkgnrGJYYfVblIg8llVJRnlZpE6++UhVaPK7DYVam9/HV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="42513775"
X-IronPort-AV: E=Sophos;i="5.87,191,1631545200"; d="scan'208";a="42513775"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 10:50:22 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYIMkQCSuPsRFVw81oI462WlvuTf+byhFO6Ruob2odYg6OHwxFQGW4hObhdN8l+fxKgWDqBmzDt6+lzPZKh38pFTh2iY7dNLQ+Td0/FOVm5cRANj1GIRecnjBd/yoe0DsnLpdk+9hvhXWjojUSja4KwMlKMlcEQGL548gqwBOVI11OmhRDS0y/PZG1f3/7e7+WLlGvxModlqTUBxuaJ/iJywWWBz3zwOJB3R0jktROXRQQ+IVD5xpdI7II6Ivmnw8rAQRTxFwpudbK1OBjgg5JwPjp280J2Tn47KhuFKgTSirI/NCOVbr0amVOzRx5CeWWLCnjb1W7Oi+842E3a7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l0hVS0mKnjS5VJflQ78Koyl3GuxdR8kuNKj410tPiM=;
 b=WkOfhnhDnjsXtTdMLha3X//p/vgMh0p1lZadRLS1w6uu5he5e62XDslY24phqDn5uV4BN4juncx2eU6zKvyl4u+LmekTCdFQkl688xjospxnGMrIo6/+1cot/HQghatzA3KHY0mVuNNR3+F10zFUiztSzX5ne+lBaXDdcI8LduoGhRvgq4tNfE1diELKkF8vu1K+IzvAcK1obcxc9ByBPyBMC8LxYt/d1wyyQVNY2X3K8nv6txxTFqYqQQt0RS4hWieco8YK3Te4O420sWH+OniOenK04imxr1zlvtGm4ixQmOadR3y+2TtWEidB5U67kVnwgAsH+KL/KOsKSPFKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l0hVS0mKnjS5VJflQ78Koyl3GuxdR8kuNKj410tPiM=;
 b=WzmlFywPxiZkzo9T/i1XPMagQ/wa53RcHDod1LXsqovEjNW4OztvRXDvpp8FnzHTd0wckRNm7Jok8xWA/uyEmSzJf4j2PmnZZEBBEQxDUOSrU0Yv8ffghN/Ujuckp8o7awrT0+0dJSut5buLW6HStUjhaWMReD6kznPQRW46ftk=
Received: from OS3PR01MB7706.jpnprd01.prod.outlook.com (2603:1096:604:17b::10)
 by OSAPR01MB7424.jpnprd01.prod.outlook.com (2603:1096:604:145::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 01:50:18 +0000
Received: from OS3PR01MB7706.jpnprd01.prod.outlook.com
 ([fe80::9401:db52:496:51]) by OS3PR01MB7706.jpnprd01.prod.outlook.com
 ([fe80::9401:db52:496:51%6]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 01:50:18 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>
Subject: Re: [PATCH v3] migration/rdma: Fix out of order wrid
Thread-Topic: [PATCH v3] migration/rdma: Fix out of order wrid
Thread-Index: AQHXs22kAGsEwyI51Uy0AJUz/ItubqvotwaAgACwvIA=
Date: Fri, 29 Oct 2021 01:50:18 +0000
Message-ID: <dddf3e22-2600-6f88-a6a5-489e9c1445c4@fujitsu.com>
References: <20210927070703.889012-1-lizhijian@cn.fujitsu.com>
 <YXq/ESqppeKP8ApT@work-vm>
In-Reply-To: <YXq/ESqppeKP8ApT@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72cefca4-8060-4014-d997-08d99a7e7601
x-ms-traffictypediagnostic: OSAPR01MB7424:
x-microsoft-antispam-prvs: <OSAPR01MB7424D494281DBA7C0FBFB3B9A5879@OSAPR01MB7424.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kb5eZKmnaRwkP6RDKi2tztSJ7M1ZMFou3geIvgPU3aAWFwVK1ryORX3oYUsI9AYFEf3a6ihc6LPGesHcsKNFzUtxdghu4UFMf3/U6m6Bzy1va0ecQoOvzYlC/zqdJBYLKF2ZEAMamBvXpJE+/usvqzKMyNGKTVo/o2IZz/YaOpseXJMZYTvC8I/rj4rkkaqtGOAvmJDzSqLXcr2Isr6fpe/93aRKQChQQR1EgBMf3ftNHLBOq2NbzKGuPxSVTSfrChm0QHAXHiPwOki+QeacjPtXLVajyvaJydVrh3SdQ0RitKrSKZNwa+/EmNp9udi213fV/TJP8lQ/asR4Qdt1Uok9wxZ+3smIJ/UgqSFJuc/z887Iuyt5iJyinKypURv4M9cDjbGvLOek7sAWYABBFSwpk6qXhmNpUkjt/2iTxTCM3+sHbbWurEzVWrGKoi+h4SM9qvVD4piaXEOlaRokCs8+6XD5+cDPkzbagSZWs9PDB+s7w++sWPcV9+pLJykvSpeCuEhQIzgxPJkwK2e4Me3P8oeg4V6grWTBvYLVwZMnZOgj7/ZSX4jtS1czfneWuOzo/hg3Xi/S26/3dPw/6Te+tPpNAUKsQI5A/tC8W9c/8Qz9SVCW95xfIESibynizW9TUpY8HcX2ZMGpFDPFSf50JhoWYlIogRJu3p1pKcwt8c5LCC7R5Qqj3QMkH+fAAld3hPCNdze/uZBfm8Jq0kMb/h9UAwWQtNm69I63Sw81UxYTsUAIpBNAdKEUKZ8Xv4WLhgqpXfne1YvfzTTm7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7706.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(66556008)(66476007)(122000001)(38100700002)(66446008)(53546011)(86362001)(8936002)(316002)(31696002)(71200400001)(8676002)(38070700005)(5660300002)(6506007)(36756003)(2906002)(2616005)(85182001)(91956017)(31686004)(26005)(54906003)(110136005)(83380400001)(6486002)(6512007)(82960400001)(186003)(4326008)(66946007)(76116006)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2RrVU44a1JUMDhnYUlLTGEvTGhpdEpzaENBYWlXWVg0SUpwcWxBc21EdjU5?=
 =?utf-8?B?V0xSb1hGdWlzNThTdDR2NjRUaGpINldidXB5Z2RYREZQZ3Y1RVB6NTRUOUFW?=
 =?utf-8?B?ZmRSWnJDV1BFeDBQbm9yTlVaOTN3aEp4M2FHWmxSTlNPbnJpRkE0TithMkVO?=
 =?utf-8?B?MmtlN2x4SGc1Y2RVejdVczh2Vms3M2l0aXZBWG94SnZKYXdLaVhta2p6L3No?=
 =?utf-8?B?aHN0RjgraTB2MHBMb04ydys3RUJhQnJWd1M3b08yZ2lpMis2Mzc3c2l2aW5i?=
 =?utf-8?B?c2tZckRVdHd2dXMwTXkrbW02TWxBejFjbmMvWVBOTXROTVRFa2x3N2xQWXBj?=
 =?utf-8?B?SUJsZllUc1dSRHR0NXE3VStENW84WU40T3VoYS93YWVSZTFiTkFPWGh0VEhJ?=
 =?utf-8?B?UlBHR1A2dzAzNWloaFViYVlMTzQzbEV0cVczRXhQOHF0MTNGMm1yMmlaVWRv?=
 =?utf-8?B?N05ZWDQvQTJIV0hHMTM1ckhFZGtGeGROYi9vc0pjSE1JZHRPVXMxTUdvRXBW?=
 =?utf-8?B?NFdXV1NnMy85bUxtVXowVTFEYkdGYTgwWGIreTlMWElGcUVIaDh1eWtxNU5w?=
 =?utf-8?B?SExZZ1o2cHNJMzNLTkMzWWFMNU1QUGVvTkpTUWZlQ25EVTlwQzdnUDdEc1BR?=
 =?utf-8?B?aFFaZVJLM3kyK2tCamtacXlzY0JjSUdmMVJxblFEV3lHa05EY1VMMktLOG9s?=
 =?utf-8?B?Z0FXZCs3L1NSK2tOR0tFbTVNSnlqSVNwMUhIZkM1NndtM1VZV2MzL2phTjI0?=
 =?utf-8?B?NWoxSjhaTS9VVitrUWd4MklqaFJqY1hrN0UxMEdSOTA0STRmeXpCQnNLcjZV?=
 =?utf-8?B?Yk14OStGRVd2cHlBYzRlb3V5NHhoMDRTUzhqbnRDY00wTGhiWDNQaTBvRDY5?=
 =?utf-8?B?RGFObk1PWjhQZTBxb29jYTl3Uk9sWUlNaVF2RnNyTlI2TzI2enh0ckZhMlNp?=
 =?utf-8?B?cnZtbUVPdWsxZGw5N3BhR0hEZ0pUbXdxeGd4ejZhYTYwVnUzZzJOUEt0UFlq?=
 =?utf-8?B?SkU1eXBsVWhLd3ZDR2lueFZPU1lzZG5YenBkSVVHdnFOa2p2L2ZCUms0U2Rs?=
 =?utf-8?B?TS9IbDM2SWRBUXVJbWxrQVc2czdnR09ZOGg1allRQ0RBaFBnQ2tkSXIvYWJK?=
 =?utf-8?B?TklRUkRGc1hlTk5RMk1LOStIKzVTSU5GWjNKanNNdUhVdkVCUWREYU9xN0kz?=
 =?utf-8?B?clRXT3lHT2orMkFOSEZTbTZKNGFOZEoyNTdDajRPY3BUYjlnNHZneGhXc3Ni?=
 =?utf-8?B?QWRWQXhibE16SFF1S2w5ZlhENzFhYlY0Y1drMGNhNzlJMU0wWmlFaUtPWXd1?=
 =?utf-8?B?RmIrbWMvNnRNM3FFSWpuNmdBaXdFWWNqUE1OUnpMeDY5TkZnOTJ6VVFKY254?=
 =?utf-8?B?RmRHVUFpWC82eHVaZ0R6WXpJK0xucGVpSjFrdnJwZitSZG4yVWJ1T0x1SDF0?=
 =?utf-8?B?WWJGREc0UXVlckhFVVJOMSsrTFdETVo0azQyN3NTQkMrc0R2bnlJckhyUk4x?=
 =?utf-8?B?bkhsekRaelkxRnA2aVp2TVVKRE43RUtQelhlTEFBSW96TkM3K0dTVmZQT1dF?=
 =?utf-8?B?SDBwRlNPa05OdWc0a3NVQkY5Wi9SOE44OE5rQUo2eTd3dlVtVXZXUElKcnJz?=
 =?utf-8?B?RWxBa0Ftby96RzdEeFNaQ3d1MzEvMWVGc0xXUFlSalFNRU9HblpBN2w4cTB2?=
 =?utf-8?B?UC95TStWOFZya2trY01ZYXdVM3lObDVJMGx0a2oxWFAyUWY0M1pQOUNXeVNW?=
 =?utf-8?B?SDVmbHpWaVRSVUhuTmRSSnhiaUJ3ZGtkZUgrU3ZOcUVZTHNJdWpWeVZLR2w2?=
 =?utf-8?B?VXRFZ0NwSllyQlU2N24rK3Z4S2F5Y2kvZFdyWFI5dzA1T0Nkd3JiQWoxc0RG?=
 =?utf-8?B?dzhNSThLSldZdXQ1RzFGSHIzTkd3bWNXYzFZZFVtdXRpaFoyYnRyU0xiUzRo?=
 =?utf-8?B?bi9VU0RhUDB2VGdTS1N4ZlBRNVJLczd3ZmNDZ1NCRTFoRDRCcnRKazZUZUEr?=
 =?utf-8?B?b05xMVdnYmpRV1pqSVlwMGQ1TzlrZEcvVkdZbmhFRGNtanc5cXZVMFhDZGtD?=
 =?utf-8?B?MXhJRDdmQTFxSmZGNmJ4WnJ5QzQrQlhXWTh3Y1BEUzBDcjhlWWpsS3p5TjJK?=
 =?utf-8?B?TnpnNlhaMVh5Q3ZHbUYzbXozckJwZ09oeDM0ZkR5WlVkbmswZUhjSUhTUkRL?=
 =?utf-8?Q?3kHBUmvzfwHzZR0xdEamuQQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6681EB09A8C47A4180E87485BAD4F33E@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7706.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cefca4-8060-4014-d997-08d99a7e7601
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 01:50:18.5069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFQNCTXudYr3ttBp9fn2GLz0UncfYOyB26diPrSF8Vteq0KNI5cf4N+b9YEzj+11oI6g1tXf4pBCpoLy1kNvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7424
Received-SPF: pass client-ip=68.232.159.76; envelope-from=lizhijian@fujitsu.com;
 helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDI4LzEwLzIwMjEgMjM6MTcsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6DQo+
ICogTGkgWmhpamlhbiAobGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tKSB3cm90ZToNCj4NCj4gQXBv
bG9naWVzIGZvciB0YWtpbmcgc28gbG9uZy4NCkl0J3Mgb2theSA6KSwgdGhhbmtzIGZvciB5b3Vy
IHJldmlldy4NCg0KPg0KPj4gICAgICAgLyoNCj4+IC0gICAgICogQ29tcGxldGlvbiBxdWV1ZSBj
YW4gYmUgZmlsbGVkIGJ5IGJvdGggcmVhZCBhbmQgd3JpdGUgd29yayByZXF1ZXN0cywNCj4+IC0g
ICAgICogc28gbXVzdCByZWZsZWN0IHRoZSBzdW0gb2YgYm90aCBwb3NzaWJsZSBxdWV1ZSBzaXpl
cy4NCj4+ICsgICAgICogQ29tcGxldGlvbiBxdWV1ZSBjYW4gYmUgZmlsbGVkIGJ5IHJlYWQgd29y
ayByZXF1ZXN0cy4NCj4+ICAgICAgICAqLw0KPj4gLSAgICByZG1hLT5jcSA9IGlidl9jcmVhdGVf
Y3EocmRtYS0+dmVyYnMsIChSRE1BX1NJR05BTEVEX1NFTkRfTUFYICogMyksDQo+PiAtICAgICAg
ICAgICAgTlVMTCwgcmRtYS0+Y29tcF9jaGFubmVsLCAwKTsNCj4+IC0gICAgaWYgKCFyZG1hLT5j
cSkgew0KPj4gKyAgICByZG1hLT5yZWN2X2NxID0gaWJ2X2NyZWF0ZV9jcShyZG1hLT52ZXJicywg
KFJETUFfU0lHTkFMRURfU0VORF9NQVggKiAzKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCwgcmRtYS0+cmVjdl9jb21wX2NoYW5uZWwsIDApOw0KPj4gKyAgICBp
ZiAoIXJkbWEtPnJlY3ZfY3EpIHsNCj4+ICsgICAgICAgIGVycm9yX3JlcG9ydCgiZmFpbGVkIHRv
IGFsbG9jYXRlIGNvbXBsZXRpb24gcXVldWUiKTsNCj4gTWlub3I6IEl0IHdvdWxkIGJlIGdvb2Qg
dG8gbWFrZSB0aGlzIGRpZmZlcmVudCBmcm9tIHRoZSBlcnJvciBiZWxvdzsNCj4gZS5nLiAnZmFp
bGVkIHRvIGFsbG9jYXRlIHJlY2VpdmUgY29tcGxldGlvbiBxdWV1ZScNCg0KR29vZCBjYXRjaCwg
aSB3aWxsIGFtZW5kIHRoZW0gc29vbi4NCg0KDQo+DQo+PiArICAgICAgICBnb3RvIGVycl9hbGxv
Y19wZF9jcTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICAvKiBjcmVhdGUgc2VuZCBjb21wbGV0
aW9uIGNoYW5uZWwgKi8NCj4+ICsgICAgcmRtYS0+c2VuZF9jb21wX2NoYW5uZWwgPSBpYnZfY3Jl
YXRlX2NvbXBfY2hhbm5lbChyZG1hLT52ZXJicyk7DQo+PiArICAgIGlmICghcmRtYS0+c2VuZF9j
b21wX2NoYW5uZWwpIHsNCj4+ICsgICAgICAgIGVycm9yX3JlcG9ydCgiZmFpbGVkIHRvIGFsbG9j
YXRlIGNvbXBsZXRpb24gY2hhbm5lbCIpOw0KPj4gKyAgICAgICAgZ290byBlcnJfYWxsb2NfcGRf
Y3E7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmRtYS0+c2VuZF9jcSA9IGlidl9jcmVhdGVf
Y3EocmRtYS0+dmVyYnMsIChSRE1BX1NJR05BTEVEX1NFTkRfTUFYICogMyksDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIHJkbWEtPnNlbmRfY29tcF9jaGFubmVs
LCAwKTsNCj4+ICsgICAgaWYgKCFyZG1hLT5zZW5kX2NxKSB7DQo+PiAgICAgICAgICAgZXJyb3Jf
cmVwb3J0KCJmYWlsZWQgdG8gYWxsb2NhdGUgY29tcGxldGlvbiBxdWV1ZSIpOw0KPj4gICAgICAg
ICAgIGdvdG8gZXJyX2FsbG9jX3BkX2NxOw0KPj4gICAgICAgfQ0KPj4gQEAgLTEwODMsMTEgKzEw
OTgsMTkgQEAgZXJyX2FsbG9jX3BkX2NxOg0KPj4gICAgICAgaWYgKHJkbWEtPnBkKSB7DQo+PiAg
ICAgICAgICAgaWJ2X2RlYWxsb2NfcGQocmRtYS0+cGQpOw0KPj4gICAgICAgfQ0KPj4gLSAgICBp
ZiAocmRtYS0+Y29tcF9jaGFubmVsKSB7DQo+PiAtICAgICAgICBpYnZfZGVzdHJveV9jb21wX2No
YW5uZWwocmRtYS0+Y29tcF9jaGFubmVsKTsNCj4+ICsgICAgaWYgKHJkbWEtPnJlY3ZfY29tcF9j
aGFubmVsKSB7DQo+PiArICAgICAgICBpYnZfZGVzdHJveV9jb21wX2NoYW5uZWwocmRtYS0+cmVj
dl9jb21wX2NoYW5uZWwpOw0KPj4gKyAgICB9DQo+PiArICAgIGlmIChyZG1hLT5zZW5kX2NvbXBf
Y2hhbm5lbCkgew0KPj4gKyAgICAgICAgaWJ2X2Rlc3Ryb3lfY29tcF9jaGFubmVsKHJkbWEtPnNl
bmRfY29tcF9jaGFubmVsKTsNCj4+ICsgICAgfQ0KPj4gKyAgICBpZiAocmRtYS0+cmVjdl9jcSkg
ew0KPj4gKyAgICAgICAgaWJ2X2Rlc3Ryb3lfY3EocmRtYS0+cmVjdl9jcSk7DQo+PiArICAgICAg
ICByZG1hLT5yZWN2X2NxID0gTlVMTDsNCj4+ICAgICAgIH0NCj4gRG9uJ3QgeW91IG5lZWQgdG8g
ZGVzdHJveSB0aGUgc2VuZF9jcSBhcyB3ZWxsPw0KDQp3ZSBkb24ndCBuZWVkIHRvIGRvIHRoYXQg
c2luY2Ugc2VuZF9jcSBpcyB0aGF0IGxhc3QgZWxlbWVudCB3ZSBhbGxvdCwgdGhhdCBtZWFucw0K
c2VuZF9jcSB3aWxsIGFsd2F5cyBiZSBOVUxMIG9uY2UgdGhlIGNvZGUgcmVhY2hlcyBoZXJlLg0K
DQpUaGFua3MNClpoaWppYW4NCg0KPg0KPiAoT3RoZXIgdGhhbiB0aGF0IEkgdGhpbmsgaXQncyBm
aW5lKQ0KPg0KPiBEYXZlDQo+DQo+DQo=

