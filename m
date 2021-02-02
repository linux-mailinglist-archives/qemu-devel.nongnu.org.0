Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C048B30CA8F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:53:41 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70o0-00079U-KH
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l70lA-0004iN-BM; Tue, 02 Feb 2021 13:50:44 -0500
Received: from mail-vi1eur05on2108.outbound.protection.outlook.com
 ([40.107.21.108]:44385 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l70l6-0004MZ-2m; Tue, 02 Feb 2021 13:50:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYaLy2XVCxL9I48cSXq52NIVi8h1IZI4tueAMc4HXFVY7ZEIA6yh+ftkPn9VS+BkbvR7TBFX3F/2OK8duy1mjJK9ec/4bIDKTtjG04Hns36gjttvg2+fACgrF1k/Ky+WN8B2n37p4GaKqNsV0AEDcODO7d6ekt/7p7hRAx6O2OyQzsNawC0jvr29PG+zUNMqX9Fm2A3Kb+AT3I5wnu30BqroS6oldYot9ogq8202s44Z8MbBbo/DQUZoFNP6rZJCHQdxlrtqIj4xxwmHS7q8TPVU24FhaPNM1rC+qAdfJs7OuCXr5QcBd2PYzhDVWvg8Y4V5oJkOluYp90+Lnbqx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fW+34DldCh73qgK0AspaJjT5Zmcb1BPpfe1SdUxdMfo=;
 b=ltXPoJtzv3RE+DZgaTFivDIpZdlxIJLeBQCAyl+9Af9+mqNgVVG498QESr+LrPjUGo8J3Fd394hCmfzRkeIC02SAAAHNGzKxd0Fka8ZojmtRVLEmkAdB04LgOodRygAqIzEIHypIjZ4hxD6IrvIhE9877ZiydrzW8/6SRx665OFhYt5EeVEESW3aKgGqrAq79ElrSEkIDYLLKf6HY1qnrV8Wccj+YyyvYrDLIEYr1MnxYw+cEvnLGqHQ82NwhHmUbgvPniXU+8tgUY70gmKZSVq4bu9w+fYnA+wYF3H8XiFFX/L6ykZlokZ+SrLsdHi/FoQLEKQZrkOk0nktK+3u/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fW+34DldCh73qgK0AspaJjT5Zmcb1BPpfe1SdUxdMfo=;
 b=Qm1+52F445vO11N/Qbc6e2x3IUcdUSTC0CXVu1qrj/je9Ppli3Tbry5+11fAxUEKezl3vZxiHeIRYhafs39L8BV4YWNQbokcl86yGCfz0/zpwNElmVfripbpP47H3SvApGNdMkXezoTaichUukvdOAfQ82sjCeJTk3eOuqmSwXU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 18:50:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 18:50:35 +0000
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
 <20210202162319.GG5184@merkur.fritz.box>
 <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
Message-ID: <72900fb5-9a30-e927-3291-b9ed20b61adc@virtuozzo.com>
Date: Tue, 2 Feb 2021 21:50:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0197.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR02CA0197.eurprd02.prod.outlook.com (2603:10a6:20b:28e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 18:50:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e252db2-5734-4c38-69dc-08d8c7ab6ca6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362366AC919742724BE727AFC1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b54MPFTbwnuuk9bWwhwyd/qxqp33b2esLjxzqYU+nu/lb7HqK9E2I4dD1CiHNAzk7wuwS6c/X9zig2Tvjdx381unCSfS7f0s4aFTz+iX1hhbdOxaglU/oS9n0skhAku1XqAcEsnQt1L0HuKUKe0c9AeDAgBOLLkfEnuCiD7a+xoJOZ0UulXQozcD6/92YIyYWUMlfNDiGG+9DnUsJDdPa7k3ylqLUePPL9Lh31FoSn5RixZsMtBk6TuJaMNXfMwbFy8HzAYGWrdbQeSYHHYAObbFk1i/9711TJe9u0RJ5TKqXBOLAU/xcnxR/qqlFyH5tn9SFEMnOguNgoRSFqdYUHUBv3mT9W9CGKxwgmvHVl+upNwjGsFlDV9yJcmZUPoufGBeRISOI/vAUOTGydAnzLTN45s9iceAdvfqvreWN34buZUCrpVn0O5KexmuvLTVMxyvXtV4RNLxB063SJ7mnpb/PYUyUXDeoHPZS3BFszlH4MCQdnl+5DLKBiD9lIYDAtpt1G8jQ+MjTFgCiyDwsEQkwdzogOUFRUpyB3BoHvgZJz/wumwtseCWW0pBBU86LeucVweEoNwpovUcQFQJj02bC05tJrioDdr6vCCpsAXt2HOyjhNp9T+mKshGR5AXbmEFPAsIdZi631t30Zet2+eYME0F/iDxzViPOs0K5U5/UOvwF8s0/eKXJjjnFaF+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39840400004)(396003)(136003)(110136005)(16576012)(5660300002)(2906002)(66946007)(52116002)(966005)(66556008)(316002)(31696002)(66476007)(36756003)(8676002)(86362001)(53546011)(8936002)(6486002)(83380400001)(186003)(31686004)(4326008)(16526019)(26005)(2616005)(956004)(107886003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkJvb2dxbVEyeVNmWmJwR3dTWWlVTHlOTmVlVlcwQ1kzUFEyalNpWTdSSlRu?=
 =?utf-8?B?M2xWWEhzUytYVGFrUEdQRlBQSU9rSmw4NGdVMS94cUxvOTdIU2N4MHdtd2xZ?=
 =?utf-8?B?eXQrcHJrTVZrbTNySjJud1BjMkpNaTlRKy9JY2REY1BvZHk0K1lEVTMxVWR1?=
 =?utf-8?B?NGNvM3lKVi9DQXJVRklQVHpxYXE5dlZ4ZE93emhBamdlVlltY0Jlai9xS2Jx?=
 =?utf-8?B?SkFyVFB4SUlRTU5nUldoTVk3L3lwSE9pT05BZVJPcEVBNTBOQ1Q4UzNMbCt5?=
 =?utf-8?B?M2pXc0Frb1VVd2k2MW1heElwSG9od05SNWNtSDBtYkd4QnVUZ3hxdGpSVHBu?=
 =?utf-8?B?RXFRTDVOdzBNWlhsMTZZQnBDVkJUdDdtODJjRnpEcktjaU9wQ2JMT3o5QVRS?=
 =?utf-8?B?OHNCaysyS0dLSTdQa1NtRDBUd2M0bGxHb0xGOFU1aGRtbHNSZFF2SU5nMUNB?=
 =?utf-8?B?bW0xb0ZoL3B5TjFNcXpOSzNueE5FV1RqOExLZ0xUalQ5VUNFK3RnLzRZMVFl?=
 =?utf-8?B?Vk55QnRpdzJJL0MyTEhBTjNLc2loTy9XSTJWQ3BMOEVqZ2JZeHZTN01za2Fo?=
 =?utf-8?B?N3BpbUNvNCtZT1lmSjJKZ0JVQkIzQTlxMENUb2UrTnhPT0J4cWZtNVU0eGJU?=
 =?utf-8?B?Z09WMStTcmRFeGpMR3gzYkhPVE52SDhRbDN2bGtWYWkzd3FwSzdQNGxtVlEv?=
 =?utf-8?B?bzl3Q1B3K3BXUUtlNm52eVV5anhIb0E4a3N5M0p2bXRaWmc0OXNQMGZPc2F0?=
 =?utf-8?B?dHBvTzNYUTVBYzdOVjlZVXFPTDlwU1VXNUNVc3l6Rmo5bEFmNG16aE9VQTc2?=
 =?utf-8?B?c1VtWUR4U3A2T3hvZXNyMWJiVDVvVmh2Wmpzbm53b3YwU21IcG16L1I3NFpP?=
 =?utf-8?B?WHJWNnBRRjc4SlN5WWVOS2l1eDVaQjZrK0lUVmtVT0d2OXN5RGp4N2xwTWlk?=
 =?utf-8?B?aEJxVXM3N1pvQnppVkVvcnA5L3RWeC9iS2FiREZKZUUwdmFNYWtZRlc3RlB5?=
 =?utf-8?B?bThLbXcxZ0pjUlRISVBBbkpuUDJxNjV0Nkh4ZGtqcVk3RlY3M2RQbSttZGxZ?=
 =?utf-8?B?VkpHVWUyaDgxck1MaWxaT2hCc3FPUXhNR2tnMUYzL2ZiVzhKeXI5MzFOQURF?=
 =?utf-8?B?Yk1kNkZSOEN4V1FLcEhDSEpIdWt5d01CVTd6MVJ2c2VPVkgxLzJTRVc2VmNl?=
 =?utf-8?B?WDdUbVIyMnFybU9iY1BuV2ZIM3Y3K1F2R1poaWNYRG5rUVFqalZXVkRUTGU1?=
 =?utf-8?B?ZS83MTVDT25hUUdOTnd2LzJlYUF3OU9UY3l2VG9VUHdCbEtWSC9iZmhxMkRn?=
 =?utf-8?B?aW5qVU85YnN2ODAxaWNGaVR6bmF1RUxyYTdRUVpZcG9lVDdWUSs5dlU4WFV0?=
 =?utf-8?B?bnkvalZ3YVhiVnh3OTdJbm1BdzN6S2hBekNVU1F0MjNSMHZtMmlKK05wRXVy?=
 =?utf-8?B?ZmxWRXJ6NG5jZmt5U3BwZGFKcytDUjVSVHVwWGlnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e252db2-5734-4c38-69dc-08d8c7ab6ca6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 18:50:34.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XiaL1fD0y1Wk/HEb9yPjNueU0bzowF55GTMCbSLoBPH8hYI7YihLUf0L18+Gq2b3eiQpGQbe8Elf3RFEuQzxsWgi3oK0Qa4TNlf26EXQIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.21.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 19:29, Vladimir Sementsov-Ogievskiy wrote:
> 02.02.2021 19:23, Kevin Wolf wrote:
>> Am 02.02.2021 um 17:13 hat Eric Blake geschrieben:
>>> On 2/1/21 8:56 PM, Eric Blake wrote:
>>>
>>>> I had planned to send a pull request for this series today, but ran into
>>>> a snag.  Without this series applied, './check -qcow2' fails 030, 185,
>>>> and 297.
>>>
>>> 297 appears to be fixed once Kevin's pull request lands (well, that may
>>> be needing a v2).  185 appears to be just a whitespace difference that
>>> missed fixing in 362ef77f9 and similar:
>>>
>>> --- /home/eblake/qemu/tests/qemu-iotests/185.out
>>> +++ 185.out.bad
>>> @@ -89,7 +89,7 @@
>>>                         'format': 'IMGFMT',
>>>                         'sync': 'full',
>>>                         'speed': 65536,
>>> -                      'x-perf': { 'max-chunk': 65536 } } }
>>> +                      'x-perf': {'max-chunk': 65536} } }
>>>
>>> 030 is a bit tougher to figure out.
>>>
>>> 030   fail       [09:40:32] [09:40:48]   16.9s  (last: 15.4s) failed,
>>> exit status 1
>>> --- /home/eblake/qemu/tests/qemu-iotests/030.out
>>> +++ 030.out.bad
>>> @@ -1,5 +1,45 @@
>>> -...........................
>>> +WARNING:qemu.machine:qemu received signal 11; command:
>>
>> So some qemu process segfaulted. Did you have a look at the resulting
>> coredump?
>>
>> Kevin
>>
> 
> Note that 30 is known to crash sometimes. Look at
> 
> "[PATCH RFC 0/5] Fix accidental crash in iotest 30"
> 
> https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
> 

Also, I see that this series diverged with master.. Did you already rebased it? If so, could you push it in your tree?

-- 
Best regards,
Vladimir

