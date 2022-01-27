Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19949E975
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:57:21 +0100 (CET)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD91M-0000uR-Ul
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Andrew.Baumann@microsoft.com>)
 id 1nD8vG-00059y-MF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:51:03 -0500
Received: from [2a01:111:f403:c111::3] (port=45711
 helo=na01-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Andrew.Baumann@microsoft.com>)
 id 1nD8vE-0002JN-BG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6BWwsh3matpK+4A9K46i3iHuaNJvCtpvafZ9TBQat3ZZ2D1uJwHZ7W5SVTG/0W8dJQTvf9EjH3W2I6RWXYn94zqlFE7D1GaCdSRilik8cggnZcHwsELjAk6sMmmgGoyQd+jc6yE++1lBLmvd98e4b5pBL5AdOqub1PNFjKYf7odG45if9DwP1Bl4opiLkGfARX9gjjHNp25EdqzPLGGY4D3GPe3Aw/U73s4yVL+JQko317fNZyQAACdUDZbP3eAVOP8M9amIfenyu9vTlhpqOeaq4N11RofXUlAOEryxZFAPNLCFERAB0hZakxYSjk89tbbZIQX8vpIAqXEmzzROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bSxhjifRjIS0G2QwBNyKiGKgM4qxiKtt1yw3FeZSGU=;
 b=BKQCboIWZnapatLQ/E+NmAx+o2K7uEXYQHJk6BEWXWhtLK2I92xldJAw9RoqjKBqBGIsElM/Vpfv1HNIK5uv3lywkbEECLyW8TWQdV658UX632i5VkWz7g9HU7kv8TLTpRuUivt95msPdABaQmZy6l7kHJevpFWNWUfi+fyaIbibhi/9T/9LAQ4HNKeBFgjtJhOsVfaw4ZdADIUyKB4Z6WQRZ9ov0iYXyzwsa+cz89gJsIICs4clxr5jrMBni3U+87kj5Bq+7AK4Oaq753FFCzqWq6nBqvlnx29bAmCbKpW1TsImEH62fu2GHEdEwX+qj/PuWIHb2MNK4hdTAGCg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bSxhjifRjIS0G2QwBNyKiGKgM4qxiKtt1yw3FeZSGU=;
 b=N1702rwBGwDNQFkBXutRGxzOqC/TMEJrZw7nduafepYPdycbpzbXBKsNXENmGbeZOkdvxi2/JkZaG5YD6Dmf4qKHeVjsbv8JGZcLu4abDhjzJAKlSJaz0S07oI1jyQdCXymK7hFT662TNh90y8zt4/eKDqWlyLq1qsEUMyQWCB0=
Received: from MW4PR21MB1940.namprd21.prod.outlook.com (2603:10b6:303:72::13)
 by CY4PR21MB0280.namprd21.prod.outlook.com (2603:10b6:903:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.3; Thu, 27 Jan
 2022 17:50:55 +0000
Received: from MW4PR21MB1940.namprd21.prod.outlook.com
 ([fe80::50ef:f6b6:5ce1:511]) by MW4PR21MB1940.namprd21.prod.outlook.com
 ([fe80::50ef:f6b6:5ce1:511%9]) with mapi id 15.20.4930.010; Thu, 27 Jan 2022
 17:50:55 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: [PATCH] MAINTAINERS: Remove myself (for raspi).
Thread-Topic: [PATCH] MAINTAINERS: Remove myself (for raspi).
Thread-Index: AdgTpe3qf3XCCKb3TCOJlrp/0jShoQ==
Date: Thu, 27 Jan 2022 17:50:55 +0000
Message-ID: <MW4PR21MB1940E8BB52F4053C943B1FCD9E219@MW4PR21MB1940.namprd21.prod.outlook.com>
Accept-Language: en-001, en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=66146cf2-4ca5-4df2-86ad-e9b1cb855678;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-27T17:11:54Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 466b8e72-7d51-4490-29a2-08d9e1bd9175
x-ms-traffictypediagnostic: CY4PR21MB0280:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <CY4PR21MB028063E8C1630AA3C98BAFBA9E219@CY4PR21MB0280.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kFkkEP8SoaV8wGMb3S0OAjmc1tDhjY9b+NcI87NvJV3c8D8/4c9ihwV/6dVJnkjK2seEOYSW6ceZel9R5LAneatV5qRZa+n2kWLKYKHuiQKOQgmXFCWRaD6X49u7EIT54mE3Lv/GxC4jDY89lWRJDO8xHTj5+Fq2kuaS2OI+9WpVf13K5VwE0UrMCz/8/ZnzglJ3OB+DLusH7olIH+zRMXVokx8nn1g9Y19GMHoiQJboe22WuRiRejbisZMK1RccvQ8VrYeBngEFtb/PmOmSYRP9j2hkI9KyypC+f1o7WWPYpfGIkELOM5dygNxEx3N9rrkjUYTVBFJHxKFZUBq/cKYCOP/wVhpw/lVWZUwXppLB3rlE+U6aWjCzhLZqpjajr0YyqVVVEsWStsyFZomfsKHC2aQLIvT+ELJudDakEjbuzEuot/ujk/cF8M0Hhyk2qK7dbrngHs2K/Juh8ArergdZ/xa9pbXLlXWAsf3U3CYCjHX/K2DIKcwOW4n/DXatUR9uJzl4e7dN94Cgt1u9ETjUilNHjyKId0+0F4PMN1+ri5E6Y8SNYdryqNK6QaXjwXgpZIQs4CEGIt1KcwwOwZMOvmWLYgHhUNzxizapWFl9NwyxicUp85OWhEtbZHy2zor+PD4i499QHqXqg098akpU/hX2TIpWLgh9UBQgz4NPdGi1dXReZl3ahC2QuaG5u9V7tRtjsbFmwfLGePZl6JLOKsQohdtrOBBeDQl6uvxTDcbbgyioZGJnpDcEynnS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1940.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(4744005)(5660300002)(82960400001)(55016003)(82950400001)(508600001)(83380400001)(2906002)(10290500003)(66946007)(76116006)(33656002)(8990500004)(26005)(122000001)(38070700005)(9686003)(86362001)(66556008)(6506007)(316002)(4326008)(71200400001)(7696005)(8676002)(54906003)(186003)(8936002)(64756008)(6916009)(38100700002)(66476007)(66446008)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3BQVG1BU0RSdDEzMTVyTlJ0MXBxZE5vbmVGa0lLRW85RFpjSTQyTFNmV2J5?=
 =?utf-8?B?ZExYV1dRdXgvVFQzWll5SklJREFjZHBsN0RZa2ttNDRVSmNldDNPZUp0eDNS?=
 =?utf-8?B?dkdEVzVWTThsWVRZR3I1a3NZSEpOaSs0WnZrL2VMdmJpZVR1Um1mVWcvdUhD?=
 =?utf-8?B?cXJRWk9sNTNrcytka1laa3FqY3RCb2Z0RktnRHNRSlc2TmJxaGxzNVkxQmo4?=
 =?utf-8?B?NlhPdnFQU241Mm0xZ2JiSVVOdnJiWnptdTd2SGhwc1dQV0M1d2s4OG5ZVUFP?=
 =?utf-8?B?K0kwTXY2SXZ6aUhOaWtDWWt5T0dzRjE5VkdURktRNnFPcTljUHJDSWNndm5Q?=
 =?utf-8?B?YkgxQnlENGFMSHVJOUMxY0cxYVA5ejdpZUo2UGhRSEpkVGtQTGIwNlBzS3RO?=
 =?utf-8?B?MHduMkZmVkNmNUlFTFByZ1BsMVZmVjFGblJzTFlQNkNHVHJJa1FNTUJGdFAr?=
 =?utf-8?B?d3g4RUlUdHhuQVhIdTl4dTlaOVdCZWtwT2xnVktYLzJDbnNFMjdSVzF6U0Jm?=
 =?utf-8?B?dzVoOCtuRiswZUpTYVNpNEYxbjZKRXVnd0E5WHJZSHIwWm1NRFJPUldLcGts?=
 =?utf-8?B?VVV6OWNiNU1yL2hRckY0ZUNqMXZGeUNBaDNwVi9uVitBUXNIT0dpMElOb3NJ?=
 =?utf-8?B?RU1WbWVoOUdaTEFTbEY5VW1ZeGhLT0kvYTJaSFU0aUxMWCthcEFOaWFnUDBt?=
 =?utf-8?B?ZzRkM0cxa1dDQ1pWbXdQTUJFNDNyMEJPYnpmOERZcmtUajNHYlNUdGFEc2d3?=
 =?utf-8?B?NnVBcHU3dmVDdEQ4TUErSVZxNWZ3dm1HYXpSc2pob1NWMjJ4ZWtjZUJ5K1E3?=
 =?utf-8?B?NjRZT2tMR2dITU8zemhQbjhJQVNFczBGVER1aERvZndpb2R0WXZXcWVSYUxW?=
 =?utf-8?B?MVNiQWROZVZGd3RkdktVWFZISnZIQmJheVh5VUNrQ0tmVm85REVWR3NqTE9i?=
 =?utf-8?B?a2VNYnorQ21nTzNHQUxWYmZ2UXhOZnNTNDFwQUlmRnVOcjY3aGdqdUZxak1u?=
 =?utf-8?B?YThDbFQ4dlFBTXJ6ZzgxTVV2aUx0c3JUTXpyM3kxc0theElmQ2ZRNlFndmFi?=
 =?utf-8?B?QUkzN2lrZ2tEaEZmTkNEcWV6Tmg2NlQ3M29mTWtick51UHlkcWx5VjJPWFJK?=
 =?utf-8?B?V1dTZlp3akJ4NFpmUU42QXlCbnRxbW1QejhjQWk1VnpRU1RRcUF5SlpxYkVj?=
 =?utf-8?B?cEpZYzFSa0lJTGpDUXRlSHNDOFh6WS9QQ3lYTm5yNko2QlBnaUR3Q1pxZU5l?=
 =?utf-8?B?ZlZQTWJWN09hOEwwZ0FFTldYMkFOcnlYU1BjY29UYTZtaEFsd2hqZHBrOFJN?=
 =?utf-8?B?NlhnQ1hSMk1xYVRCQ3hXUFZlckNFUjZ3cEZjck8vZlFRQVpnSTNVUmJDUGhI?=
 =?utf-8?B?cWMyU3ROOWtWUXNEZ0FiNlpaekI1K0VPaTg1Z0tnZXI4UnFNd0x1dStrUllW?=
 =?utf-8?B?UEhYMUNzSFJXcTFsc0VqbWZkU25TOVNhRTZHR05KamlLSkZSRFBUbkRtYkR6?=
 =?utf-8?B?akl2VE00a0gybmZmVTRFY3pNY3VFVFJ0TDE1d0lNMDBaTTVKV0xoZ2VqVWNv?=
 =?utf-8?B?NzlwRGQxajBoVVRwOWo1MU8vUWRaNzZmeVFPSVZkd0g3cmVKakNVc3gvQVZR?=
 =?utf-8?B?NG9CUFhyVDRPcW1IUHpZdHlBbnlza0lYZ0VXS1Rxc0hJeWZxRkpRYWZjZllj?=
 =?utf-8?B?Q3B2TWVINHk0bmgvMEFzbExTWitNTUNSZlB5YzBBMjBMZlN4WjZpQVFPazBI?=
 =?utf-8?B?TE16a2RKaVJwVHJaVityQlJwZ3AzOVFlVUlDV0ZFRVlTcHlCMk9wZC9sbjNI?=
 =?utf-8?B?Z2pHTEZ4OWpreno1dDBrb3dxOWtQb3lJK1VxaGZ1bDBML0UyaUNSQXhzWldJ?=
 =?utf-8?B?Qjhhd3BUMWRHNUUrUGJGSEhSVk5yVHlsZDJMaXZKK1ZwT3d5YzdRbG5DVDdk?=
 =?utf-8?B?NTU1MEdDNDJ4SC9GNjFncWJmMUM3S2gxTW5WUytsQjNrZXFqaWxCZ212RVVa?=
 =?utf-8?B?ODFKTjM5TGVhSHorUmlEeTdBaUUvSllDdEZSdnRBVjZ5MSsrdEZzNC9MVW8z?=
 =?utf-8?B?eURuZ0NCSDBsNHdsc2VVY05kajFiR2lZeUlnWUJyeXZSNE9WSGcvdGJjNFRh?=
 =?utf-8?B?RkdkTTRYWnlxUnViSVN4ZUdLWjF6NGNjZ1NadXk0NkgzSTl3SzBwSHZFY1RC?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1940.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466b8e72-7d51-4490-29a2-08d9e1bd9175
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:50:55.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCMlliU6QGIiR3UoCJHrbJbA4zc/K2EN5mArApWHGwScf8MIcdUcmfVyCcGr55xAOZymEOA95mVVK9dHVTIdJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0280
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:c111::3
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:c111::3;
 envelope-from=Andrew.Baumann@microsoft.com;
 helo=na01-obe.outbound.protection.outlook.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

U2lnbmVkLW9mZi1ieTogQW5kcmV3IEJhdW1hbm4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5j
b20+DQotLS0NCiBNQUlOVEFJTkVSUyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQppbmRleCBlNGIz
YTRiY2RmLi4zYmFhODNkZmM5IDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01BSU5U
QUlORVJTDQpAQCAtODE4LDcgKzgxOCw2IEBAIEY6IGRvY3Mvc3lzdGVtL2FybS9wYWxtLnJzdA0K
DQogUmFzcGJlcnJ5IFBpDQogTTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPg0KLVI6IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPg0K
IFI6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQogTDogcWVtdS1h
cm1Abm9uZ251Lm9yZw0KIFM6IE9kZCBGaXhlcw0KLS0NCjIuMjUuMQ0KDQo=

