Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D33FAF62
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 03:08:48 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKVn5-00079X-NL
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 21:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mKVlU-0005hs-R7
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 21:07:08 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:17108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mKVlR-0006td-JB
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 21:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630285625; x=1661821625;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sMZfdvHLmF0i9Tq1fBpY2XTPYlScXS65LUui0U2oaNQ=;
 b=MrDu8BKTTDK4Cg8/XjxiuOFWSDWk8gYk+LM35PsaUIo65a8gbCwrw5Ds
 oDWRkDwNRXqVq1a9r1LWwB9a7bBJgkwtDCeKc7C5ciPyP6P0/16ALGEWI
 bq403qSKi0xVqlgF1x/US+Ezh88XtyTnPLddOJSK7f59Yf5lW2zF+Od7X
 V1qhZZtWHxzrLkPQVokcZ+ZB2nh5eKOfRNsF3VglEQjVvra1Ke6144I3D
 mi05/tRjwKo5LmcsHH7j4kamDzkEjKrTggVNHAP10diK4z17j6wY401MJ
 cKkCkH3oG6p8E+4fiz/e8KbWRoxMCwzpcvQyYUPDshcHvxdnB4p2wKH7m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="46154142"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="46154142"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 10:06:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgauUFsxbvsYKOJsB6AGgSqHZrqo5laClEIaUDicme341iYIa9HKbqb+vsapxcYhEx3/R2Y9kbhuBqmNqP7Kiu1poB9/fzcxJZPlGI56DV84r5H39qECgHGlUueA/lPYxdCpJimBI8hKoFC4frL3QENMweMFFciY6rZJ2R1rs3KgFgPwUl3LIxzvDV0pz06g//6N1gQ18dybnvCtqbrCHVYCXd8oIv2tBTomoerPklFBRqR2kJg2QcHPQgZ7UD/kjhch+y8NeXvpYRDxBdkPTcXLb0vs3kU8nZJ51OxZK354+4hLi4w7iAAQagRzqrXxYGFXwSIGrFlwQcAumlGW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMZfdvHLmF0i9Tq1fBpY2XTPYlScXS65LUui0U2oaNQ=;
 b=jKWzb7gLeLWd95Eabnk6t9PXjV7DucpHeYjZwmn/i3EGwurEA4dCotWN8v4tgdPF8S60W6ENjPpShp07mqAsIEVtJCp2W2OE0xt/vsskSjWE5wdJJrU6yOS8wreMvqwFhguL3w3aP1bIwbsdCbX0I8caJHxcJxxmJrt5c8qCLMgQCBgyChgF4G2m9JJ0RYsU3/hmIgYmmxZfY2rqmmQnguqIciwNZxYv9W+pmQu7xDzoZzugVE3FdVSEsfGAaivBVvYQbeQs1mtXvfYmyQrRAZCOExJxzYGjtUvu1oYRkasFpofpT1vMz5ZASgNOi77oZ/dY+zIK16GTkOy95wSLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMZfdvHLmF0i9Tq1fBpY2XTPYlScXS65LUui0U2oaNQ=;
 b=R7StBbt2C6DEKRv6uRzjQhY9g5hkRhLaFC+nJmY/KPh1h1jTK3QMs9PgJ44FcbuoHsebNYfWwOd21Q/mg58tNIAUfOAA2xEo/zLrhPvSZy9wZDNnxNJ6kw+4Jd4nkfIv5qGCET62EIgGenAD9Zj+6kwDbARYhAD3nwhDteMpBy0=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OSAPR01MB7231.jpnprd01.prod.outlook.com (2603:1096:604:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 01:06:56 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9%5]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 01:06:56 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Igor Mammedov <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>
Subject: Re: [PATCH] nvdimm: release the correct device list
Thread-Topic: [PATCH] nvdimm: release the correct device list
Thread-Index: AQHXaOgkqoUGbhyF6kmemLxjVshx96srDdcAgDZYaYCAKj4EgA==
Date: Mon, 30 Aug 2021 01:06:56 +0000
Message-ID: <3ed73782-0ab2-d178-23e6-0ba19c70cb6f@fujitsu.com>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
 <20210629160534.208b56ad@redhat.com>
 <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
In-Reply-To: <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a56ea5a4-cc07-4926-6a1f-08d96b527651
x-ms-traffictypediagnostic: OSAPR01MB7231:
x-microsoft-antispam-prvs: <OSAPR01MB72317363F075844B53FEE612A5CB9@OSAPR01MB7231.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zCcbeByumot+jLsk58rePmcIEJDYlvCCEfqtz411W9XeK3wGLwQe9YA1F1fvC0zBvzxh0Ltk4FVSJ298NgagyVwNQA2TprjYFEQAgNf0s3Z6LqR9AvwB5BpGQEW2DlCmU7A+ES3enCCXHQIT7obYyaR5/NR/ByHlppNh9g6asM95WAW8cjeQ0yCCKfR5HLEbD/i8oF+ka/CpJqnKkj8iF2A+AP7RBxI23Qa5j1IsOB3VemIQCC6RfMiNwlNjXjkZF3u/RdsI7PSntYfGlaBs3PWCSk00ceeSfDw1kR6RqAc/f91cSfuarF/EI1K+lHcZrW6x7RZzTQ0umvdOSXSHX90ke2D07PIrZkUGt7B300+an3LoIcgNhnUZ6o5VeXGrRDyTrKPHfuqQ5sJGcjtiB3ATu/Y0VpMuaLryfXKxEKIAQ3/0iKh4x5jqk64ciChw2J/OTtZyxtesz8/O+geKx9DkT+8nupp3h53LI/Fkm7Vc4weophlRs3RYvh9U4/GmUw1TA7GT77Y8ApT28GIs8vthfb82xYWUT87ycAGR7PE/x2G28wYFeBSxrA/TCLFrPQxV3Ii7yZ68y3/VtxTbwtGWX82Umvn4E+7EmdBKthsz9UiWeo0B/0MHaUqXIvbHP2UdVSwDIFEFTsbxV4oAewmswwx8xNVp2BFBheFZA3Ey0O1GuJyOrxQK7R0AWdE8/WZF9WaEAuqb2l6D7UM8QJb7NdDRlAZuneY7fd2Vl/Tz0KNjA5hd+PbiqEqZAk7v/N4FcKwYLnuMuFkDUYjhdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(8936002)(110136005)(86362001)(38070700005)(316002)(8676002)(71200400001)(66556008)(4326008)(36756003)(91956017)(53546011)(6506007)(31686004)(76116006)(64756008)(66476007)(186003)(122000001)(5660300002)(6486002)(38100700002)(85182001)(2906002)(2616005)(478600001)(83380400001)(31696002)(66946007)(26005)(66446008)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWloZmdlYnBmZm9OTTZUVUplV3dwaC9HamRZVDZVMU9BaE9lMTV6SEVzM25l?=
 =?utf-8?B?ZThtSHBUM0xRR3E3SjVNa1JpNVJEdEE0d0hVQUozMkxSWGk4a3hIdUk4RGZH?=
 =?utf-8?B?YVQ3cis1QUk0VXMzTlZpMTBFakovS0VTT2xWb2dtQ2FsVTZGbjlwRUNSZTY0?=
 =?utf-8?B?OUgzeDJ4QkdNT0hXQkt6YmR4NTY1djZ5R2lENnZ6Nmw2alZSNlJWanZrd2s3?=
 =?utf-8?B?SlVGTWo4MzJiZnlrdlZKQmNVMWhPWERkeEJLSDRsV1QvZ3FtSEdxZlJTdXVl?=
 =?utf-8?B?aGlEQmtRNklHVkh6SlV0RXZZUnVFTnVic2NJbEdYVzRFMHMybmp1SWdOMThR?=
 =?utf-8?B?VFpxK3NTd0M3MnZ2d3M3dFRkMXUvUWJueENRVHB1akVPOEtxV3hpN2hEUjVv?=
 =?utf-8?B?Vi9va21pUnZiQkNBak1BTnVhNFhPdWt3N0JvUStsbFE4TVhBWGx4YnlvalU3?=
 =?utf-8?B?US9jUmJ1RkoyOWRFRytYMVJCREZXNis1S0d1VHVwVTZHbXprL3d1NmZidkVw?=
 =?utf-8?B?K1UrT3VRQzN6OGd1S25xaTYxQkdNQXdRTWtxNTZlRXpwN0hLWmZQRmdSUmpJ?=
 =?utf-8?B?SW5BZEZudUdHOWhqTFVIR0c4WDlpRG5JK3FaWUQvdFVORW5hTG9RVHB2SjAz?=
 =?utf-8?B?RlVBYVJBYmJqM0c1Z0pjUzhqQnNnSHlYUzZ2YVZsNk13SUlCZ0ZMWVNaaGRp?=
 =?utf-8?B?REtNT1BoOENnTW15OFNia3RUTGtYNER5TmVBLzdDTU90SHhWa0RTUk1JWGNN?=
 =?utf-8?B?WU0wVk5SeEJtQ1BFTEozZUQxb0VuRHoydCtLWnk3b2RmVXQ1dURHUEQvRXho?=
 =?utf-8?B?bWI0YWJUZm9YT2RtREl3anplbDdTYzB5S241MnpYSWhhclRBK216T2lndm5h?=
 =?utf-8?B?K3Z2LzJBME1Xc2xmNWM3dEhMT2JIQ3Zwc0VoRkZjSmpUMGx2WDNXOXhGbS9K?=
 =?utf-8?B?UWoyczRrOTQ0eHZoNzJxT1BHc3BNT0xhTHZPbGdJanl0TElWSm1qUVE3Vm5V?=
 =?utf-8?B?UlJRaXpTYXA1L0xCQTBPZ0duNlg5SWlXYjZCMVpudnA4WUIwUjl1Q1VJcXRz?=
 =?utf-8?B?NHdMMWxBM3NSMWk5T1JMTnVpaW9wcmtFL28zSFhYalVnK3dPamhLQkxQcnhq?=
 =?utf-8?B?SmVhekZiaG9rY3ZkNVlTRUk5YlVHSGZ3bGJUWEVsL29ET2x3YVFaSGtvdC9u?=
 =?utf-8?B?am0vMnpZejRYOG8wTFJwMzM3MUdYUmtrVzdFeHUwVlE0TmY5ZE0zTTZROFpq?=
 =?utf-8?B?TkFqWjhOeU54RnNiczVaaGhBb3NYOVdObkl1Qm5qSVc2TXhIUlcwVTB4L3kv?=
 =?utf-8?B?RUJhRVd5NktlSXdIUkVnVDhxVUgzRzAzd3BENFZaUGtaNkxhRzlnbGk2VlNa?=
 =?utf-8?B?SEoxdDM3RUtyNHAyVkg2VzE3OFVHZHJlSko5Ui9JMHNnWDdkOXVvS1hYWGh0?=
 =?utf-8?B?bmRRanpCeXV3eDQxUFliVU9mbHF5RE1NaHBQWEZMdzMybGpJZDk1SHJDNVdy?=
 =?utf-8?B?YjNKcFFXMFhLSlY0WDJSVkphTHVoYTNxZ09LTVJpQjJranBEamJDN3hIcmFX?=
 =?utf-8?B?VnhERXJVZlFJUThGamNGRG1CQk1uSys0WFB2WS8yMXF1OG4yeCtzNFd4ZjQ5?=
 =?utf-8?B?VTcySG5LYjBRZGlrekl4a28yTm4zTzF2a2ZJejNUZE5nWkJrSzRaMUZ3WTVR?=
 =?utf-8?B?eTNIRTVmanNHK0NsSmROUE9SNDY4YU9QaHF3K0RCR05HOWVjeDZDUzFnNElt?=
 =?utf-8?B?MzNxamFZMTBTR0prdXBwRzYxQndYZEFwK2FTejhPWU5xc1A5V1E1ekRPL2ln?=
 =?utf-8?B?Z2FjUFJmVVVpU0NReGFFdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E06014877BD447A895334627DE00AB@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56ea5a4-cc07-4926-6a1f-08d96b527651
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 01:06:56.5038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdOp5XqCFrk+qC9C+OsYgBtuY6stDi/MmPeNJNEpA7eobi4m+LykvI7csZ2rMCfGhGvlzLZvT8us6l9WuO7b2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7231
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.58,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cGluZw0KDQoNCk9uIDAzLzA4LzIwMjEgMTI6MDAsIExpLCBaaGlqaWFuIHdyb3RlOg0KPiBwaW5n
DQo+DQo+IEFueSBib2R5IGNvdWxkIGhlbHAgdG8gcmV2aWV3L3F1ZXVlIHRoaXMgcGF0Y2ggPw0K
Pg0KPg0KPg0KPiBPbiAyMDIxLzYvMjkgMjI6MDUsIElnb3IgTWFtbWVkb3Ygd3JvdGU6DQo+PiBP
biBUaHUsIDI0IEp1biAyMDIxIDE5OjA0OjE1ICswODAwDQo+PiBMaSBaaGlqaWFuIDxsaXpoaWpp
YW5AY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMaSBaaGlq
aWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+PiBSZXZpZXdlZC1ieTogSWdvciBNYW1t
ZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4NCj4+DQo+Pj4gLS0tDQo+Pj4gwqAgaHcvYWNwaS9u
dmRpbW0uYyB8IDEyICsrKysrKy0tLS0tLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvaHcvYWNwaS9u
dmRpbW0uYyBiL2h3L2FjcGkvbnZkaW1tLmMNCj4+PiBpbmRleCBlM2Q1ZmUxOTM5Mi4uZmYzMTcy
NjNlODUgMTAwNjQ0DQo+Pj4gLS0tIGEvaHcvYWNwaS9udmRpbW0uYw0KPj4+ICsrKyBiL2h3L2Fj
cGkvbnZkaW1tLmMNCj4+PiBAQCAtMzU1LDEwICszNTUsMTAgQEAgbnZkaW1tX2J1aWxkX3N0cnVj
dHVyZV9jYXBzKEdBcnJheSAqc3RydWN0dXJlcywgdWludDMyX3QgY2FwYWJpbGl0aWVzKQ0KPj4+
IMKgIMKgIHN0YXRpYyBHQXJyYXkgKm52ZGltbV9idWlsZF9kZXZpY2Vfc3RydWN0dXJlKE5WRElN
TVN0YXRlICpzdGF0ZSkNCj4+PiDCoCB7DQo+Pj4gLcKgwqDCoCBHU0xpc3QgKmRldmljZV9saXN0
ID0gbnZkaW1tX2dldF9kZXZpY2VfbGlzdCgpOw0KPj4+ICvCoMKgwqAgR1NMaXN0ICpkZXZpY2Vf
bGlzdCwgKmxpc3QgPSBudmRpbW1fZ2V0X2RldmljZV9saXN0KCk7DQo+Pj4gwqDCoMKgwqDCoCBH
QXJyYXkgKnN0cnVjdHVyZXMgPSBnX2FycmF5X25ldyhmYWxzZSwgdHJ1ZSAvKiBjbGVhciAqLywg
MSk7DQo+Pj4gwqAgLcKgwqDCoCBmb3IgKDsgZGV2aWNlX2xpc3Q7IGRldmljZV9saXN0ID0gZGV2
aWNlX2xpc3QtPm5leHQpIHsNCj4+PiArwqDCoMKgIGZvciAoZGV2aWNlX2xpc3QgPSBsaXN0OyBk
ZXZpY2VfbGlzdDsgZGV2aWNlX2xpc3QgPSBkZXZpY2VfbGlzdC0+bmV4dCkgew0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBEZXZpY2VTdGF0ZSAqZGV2ID0gZGV2aWNlX2xpc3QtPmRhdGE7DQo+Pj4g
wqAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGJ1aWxkIFN5c3RlbSBQaHlzaWNhbCBBZGRyZXNzIFJh
bmdlIFN0cnVjdHVyZS4gKi8NCj4+PiBAQCAtMzczLDcgKzM3Myw3IEBAIHN0YXRpYyBHQXJyYXkg
Km52ZGltbV9idWlsZF9kZXZpY2Vfc3RydWN0dXJlKE5WRElNTVN0YXRlICpzdGF0ZSkNCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogYnVpbGQgTlZESU1NIENvbnRyb2wgUmVnaW9uIFN0cnVjdHVy
ZS4gKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbnZkaW1tX2J1aWxkX3N0cnVjdHVyZV9kY3Io
c3RydWN0dXJlcywgZGV2KTsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+PiAtwqDCoMKgIGdfc2xpc3Rf
ZnJlZShkZXZpY2VfbGlzdCk7DQo+Pj4gK8KgwqDCoCBnX3NsaXN0X2ZyZWUobGlzdCk7DQo+Pj4g
wqAgwqDCoMKgwqDCoCBpZiAoc3RhdGUtPnBlcnNpc3RlbmNlKSB7DQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIG52ZGltbV9idWlsZF9zdHJ1Y3R1cmVfY2FwcyhzdHJ1Y3R1cmVzLCBzdGF0ZS0+cGVy
c2lzdGVuY2UpOw0KPj4+IEBAIC0xMzM5LDkgKzEzMzksOSBAQCBzdGF0aWMgdm9pZCBudmRpbW1f
YnVpbGRfc3NkdChHQXJyYXkgKnRhYmxlX29mZnNldHMsIEdBcnJheSAqdGFibGVfZGF0YSwNCj4+
PiDCoCDCoCB2b2lkIG52ZGltbV9idWlsZF9zcmF0KEdBcnJheSAqdGFibGVfZGF0YSkNCj4+PiDC
oCB7DQo+Pj4gLcKgwqDCoCBHU0xpc3QgKmRldmljZV9saXN0ID0gbnZkaW1tX2dldF9kZXZpY2Vf
bGlzdCgpOw0KPj4+ICvCoMKgwqAgR1NMaXN0ICpkZXZpY2VfbGlzdCwgKmxpc3QgPSBudmRpbW1f
Z2V0X2RldmljZV9saXN0KCk7DQo+Pj4gwqAgLcKgwqDCoCBmb3IgKDsgZGV2aWNlX2xpc3Q7IGRl
dmljZV9saXN0ID0gZGV2aWNlX2xpc3QtPm5leHQpIHsNCj4+PiArwqDCoMKgIGZvciAoZGV2aWNl
X2xpc3QgPSBsaXN0OyBkZXZpY2VfbGlzdDsgZGV2aWNlX2xpc3QgPSBkZXZpY2VfbGlzdC0+bmV4
dCkgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBBY3BpU3JhdE1lbW9yeUFmZmluaXR5ICpudW1h
bWVtID0gTlVMTDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgRGV2aWNlU3RhdGUgKmRldiA9IGRl
dmljZV9saXN0LT5kYXRhOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBPYmplY3QgKm9iaiA9IE9C
SkVDVChkZXYpOw0KPj4+IEBAIC0xMzU2LDcgKzEzNTYsNyBAQCB2b2lkIG52ZGltbV9idWlsZF9z
cmF0KEdBcnJheSAqdGFibGVfZGF0YSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnVpbGRfc3Jh
dF9tZW1vcnkobnVtYW1lbSwgYWRkciwgc2l6ZSwgbm9kZSwNCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUVNX0FGRklOSVRZX0VOQUJM
RUQgfCBNRU1fQUZGSU5JVFlfTk9OX1ZPTEFUSUxFKTsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+PiAt
wqDCoMKgIGdfc2xpc3RfZnJlZShkZXZpY2VfbGlzdCk7DQo+Pj4gK8KgwqDCoCBnX3NsaXN0X2Zy
ZWUobGlzdCk7DQo+Pj4gwqAgfQ0KPj4+IMKgIMKgIHZvaWQgbnZkaW1tX2J1aWxkX2FjcGkoR0Fy
cmF5ICp0YWJsZV9vZmZzZXRzLCBHQXJyYXkgKnRhYmxlX2RhdGEsDQo+Pg0KPj4NCj4NCj4NCj4N
Cg==

