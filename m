Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122042FC129
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:38:05 +0100 (CET)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xlM-0001k7-1s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1wh3-00046N-OO; Tue, 19 Jan 2021 14:29:33 -0500
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:10280 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1wh0-0000SU-Be; Tue, 19 Jan 2021 14:29:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekVVT0UIYp+ME/LfEdwY+CTES9O0NJiulz9O3VxkBmFmoEg5NNOBHAslUMlW5NwydziJZ24KH93Ed+5TXdmReW3N336O9mz6/ykNWQeLZOVW4AKEI6WAnQA5v2YT4ButNFFWdFwRduXxzVVSduKgl6albE97JUwi1Y/Rzk9Y+c5ehFfF+llRDRgj/x2do8ePoaWxNVdenDVmBXHPhLs1hm6H5eVLye3aUtU4476AGE14IYWIlmo92gAjMKkKXe2SmSCg3NddhTJHZZtnLKfHM5Zy1cXWPwQVDkptXLpYSC6RwvSTFE2ldh7MB/fj1ufgM3a8MsfnV//wCwiQGOyT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJv5PZOeO918KWGdVGTOBwE27SQomzFTfQObECyFV1s=;
 b=NsXoBWUHh7LBbR8DdEugmYpAdkGrVKdeGU/UyqLEyuUqVNRX3vwKlNTYGlxn8voWGIX2np8CJsUnuFmvwEgSkEb37k3HML4cYKo3jzdpsYfQd+IqSVX9qbU0imbtMbSL1gSnZhCkuBJZgGA6CFI8YoJJCTVOFLHhD27VdvSQFAFVC/uL0vlRvUnOb9BybCzskpv5Vl2wLIGYxg/7ZyWAQYiDwF3gVUyzHLLlIe+YMTRDvsKFSMfCZ8Lc3HDz3TQGG1FVcD4InmjfmQwC0FutNQwPC/sgWobbu6i6Oo16ZbQ3o0BMT9AHxhyNvvzzOpLTp7X1mgr1c+/ZJg/lM28hIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJv5PZOeO918KWGdVGTOBwE27SQomzFTfQObECyFV1s=;
 b=WIbmQnLIc17QjKHRhDNtZASt1/PNYba/oZZ/N83CqW8Aub0LIYWobDbYSH6cEu5/ZyGG7QccQOndhKzRQrJ64ARcuLMDjQD6FVtIqd9apiz6KDQJf2JyDQhjP09/uWZjHeb0n0BksXmmKDYAAf7A4F/DgaqB0w1ZP5PRl+6yQbw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 19:29:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 19:29:26 +0000
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
 <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
Message-ID: <45b3ecdd-304c-0fec-0c4c-c7ddd60d84b1@virtuozzo.com>
Date: Tue, 19 Jan 2021 22:29:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.84]
X-ClientProxiedBy: AM0PR02CA0212.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.84) by
 AM0PR02CA0212.eurprd02.prod.outlook.com (2603:10a6:20b:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 19 Jan 2021 19:29:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0855cf00-9534-4195-cd12-08d8bcb08857
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36230DFE2FF599D08F8005B3C1A30@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtIwuqX3LVsttD5pWZO9y7KN/J6ldwmC9PCKO/FHfBa3eJiZMDumr1NlLwHlf/PRwAYxS+iRyYu+VTni1YJ3ehu0f3C4QgTvBFmU4mUXpNYGH6+szmB1oxeTsNWaEJyfefOho5/mjCIObL8oPHsFmS6IPPxiiupUezWkARpuQBrrJcQi9CbBTwRfPT3VESIyeH+QId8YWwYU9UjIw60fzUKstZNuCAIdV48lSBHLO5LxqIDvv4nG3CWhJ87ihMGeoLkQ1fWR0SVuL6i51/ntDZr3qBe6SN4dEgOiqftHh8n632Kv9YJDx+MvjDzHzUVbHqvgmnA456Jz39yb5mHEw/jLh5k2d0JlVyDbGJrmSMS5MwAB/4LKpShxIhWJ4ixG4OByLaxAuHia18Oj+bcqqDnNSjgc06RcJ5nkNG5dGZ6SRHE+7wN3tSo8iXd88TIxy79gEnURZkHnpgLxj12wEw5STSxDdOyW2IS+wkKyjXA9D1aOZuBzs6CHp0FcwygvR040Z0h2I9t5x8znPh9vCgjvaFLo5W5R7AhdFM/y2lDwUYnkdiPQZ9C6kDyZfGsx2y6FuZIWgk9P0wxe8l0+Fs48n+3x0TClDrE2p+MIhbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39830400003)(346002)(366004)(136003)(66476007)(66946007)(52116002)(316002)(16576012)(66556008)(2906002)(5660300002)(8676002)(31696002)(31686004)(36756003)(86362001)(83380400001)(107886003)(2616005)(956004)(4326008)(8936002)(6486002)(478600001)(186003)(16526019)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzhPcENTMjFPaDlCTDN6eWc3VGV0QjJYdkpTZmxuNXJOb1dyR3VtSStPRlRM?=
 =?utf-8?B?SGdOZXNUUHpLaUlCRG1jQTB6aG4rNmJ5STlqVWZ4Yk5wOWh0eDNtR3g4eWl3?=
 =?utf-8?B?UVAyQjRpN2trNm5OUUxQQUdsQnppODdJRlJFY1RiY0ZQQm5adHhBeERiSjhO?=
 =?utf-8?B?ZG9zSUY1Z0tyb0lkaUFXTXVOcUQ0ZUJyVG9KRlQ2Z3ZoVjRpOCtTMlVwNjVz?=
 =?utf-8?B?ZjhqQXBoYTNJY2NCUW51VVRGNE1jU3d5Q2ZpU29jZzdxaXBHYVFyZzAvcklj?=
 =?utf-8?B?MFNMR3pnQm5hUHFVdURKMGFiRmVhMnc4eUpKOXRLVUEyNTd1N2UzNUp3VWFy?=
 =?utf-8?B?TkJvMWtsMk5nNVRkTUl5WmVNQUhJVVF2TkNiQjE5bFB6TzllM1U2YXRmZytG?=
 =?utf-8?B?NmFvMndXT1lhOGdEOHVlSXdxZ1BVVVJOTGZqWTNrWklEVU9oeFZzUUVoQ2Ju?=
 =?utf-8?B?blRBY3JJTkJZSFNhTFdKT1lYTXE5cWNRUVh1aUlMcFZUMFliVVM3R0pidndH?=
 =?utf-8?B?WUdmMG1aemowNDNOWDZadUswUFhHWm9JdzRMYllDaDVsYSs3U1RqTE43N1NN?=
 =?utf-8?B?MGdZRHJReDZTV1NxZ3doaGVwek1RcjRjaVh1d09LK2ZIRXFIRHBvL1ZHK0pR?=
 =?utf-8?B?bzdhY2hWOERadDMwRnlyMmFnalk3L0x3Z2dqR0tZMG5vVSswK25leTdEQVRU?=
 =?utf-8?B?cHpkVFlrbDZUemtRL2l6eFFVbVVnMVVXR3dhZUxjS0xxVndFSUNxUWtLcEcx?=
 =?utf-8?B?M2VycEZ4OXAzZUpTVkJNSHR6MjFTWTlDdWduZWFoYlljZTNSUFFSZkZCa08z?=
 =?utf-8?B?bG5KT0hKemMzeWxjZlpIMUFWUG5VK3Qyam9WZDFTS3NlU3N4bVl1N21JNk5K?=
 =?utf-8?B?aG1tZm13NGZwOEp3T0Q1UDBwb2EyYXIwZmNwVUZvamdDYktFVzQwanZDcjFQ?=
 =?utf-8?B?ZWpEbGdxMGgxUjVEL25wUkFUbWVsRlpLa0tBWk9vODBqL3drQ0JGd0xweTZ2?=
 =?utf-8?B?OEZEUkNxRlJaOWV1ZlB2dm9qTHQvSzlwTmxKcUlMQUVIUEdyelpLbjNUWVhl?=
 =?utf-8?B?QUZHUVZvVmlLZkJkcHV1ODRYcFkzR1RYeGFwdzZUdnA0YWF2Z05hWlA0bGZy?=
 =?utf-8?B?K3dxZVdwOXhTcXJNaTBqVW0wZUV2Tldac3V3WXE1VWJ1WWNnQ2FvZWZleUxC?=
 =?utf-8?B?anVrUi9IMzArdUk1Q3A1bTd0aWhKSDB0eTZtTzZzV0czY2syMnkrVzQvUlkr?=
 =?utf-8?B?MVNFbllSVVJqQkFpV3lnd0dMNlFha2N3Z1ZxVVVzNS9pOEtpS0piUDdKUHQr?=
 =?utf-8?Q?jh79QG1YBDT6Uy1jXiWbs9MYjsYewSbl7N?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0855cf00-9534-4195-cd12-08d8bcb08857
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 19:29:26.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F57P6UdcKaX9BpkdkbSxasJypPm54FupVWnBYC8lh+I01MM68LN0hj14P2fY+W+YKhQktoVSVrWUT08TzeGLQbajIkYyfpgjTzGgeVJHHOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 22:22, Vladimir Sementsov-Ogievskiy wrote:
>> Hmmm, for me, 129 sometimes fails still, because it completes too quickly...  (The error then is that 'return[0]' does not exist in query-block-jobs’s result, because the job is already gone.)
>>
>> When I insert a print(result) after the query-block-jobs, I can see that the job has always progressed really far, even if its still running. (Like, generally the offset is just one MB shy of 1G.)
>>
>> I suspect the problem is that block-copy just copies too much from the start (by default); i.e., it starts 64 workers with, hm, well, 1 MB of chunk size?  Shouldn’t fill the 128 MB immediately...
>>
>> Anyway, limiting the number of workers (to 1) and the chunk size (to 64k) with x-perf does ensure that the backup job’s progress is limited to 1 MB or so, which looks fine to me.
>>
>> I suppose we should do that, then (in 129), before patch 17?
> 
> Yes, that sounds reasonable

Still, may be keeping number of workers >1 is good to, to test new architecture.. Just make it to be 4 or 8

-- 
Best regards,
Vladimir

