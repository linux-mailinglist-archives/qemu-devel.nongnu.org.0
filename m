Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406330A36B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:38:20 +0100 (CET)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Uix-0006L3-C4
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6Uhh-0005aw-AT; Mon, 01 Feb 2021 03:37:01 -0500
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:27847 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6Uhf-0006HT-8n; Mon, 01 Feb 2021 03:37:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvZXoTas+VMrpHIKbo/nRk+X8rBX8uF6oIDJNwJ67/FDeNrrfjD4dB0290mmn6KnFtmwcbXxtv4mvGccaBscU+rBPom9rfOjNO+/YwoegyrXE5bY1QRYIGK4QVOGZ+z6zLQn1DVqv32eeEa6y6VzeYkkygCIb3yfYgFyuVa5lZFExyHrL7zdoKtTOBvtcBtOpgpRAkp8+xUT4+THO1bgPHLgPGW9wltXEN1Ut87OAOD9P70rGJfkY4MezIKTREgto7siJ1OA9smsCWT3+1mDUAi6/n2D7JSvez5QuyTz38WCHNlIm1tK1XBNyEKUG5DlrOnogs2Mj0mjwnyYGFwyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+y49haYGLDtzhIACZj4+njyyr5ZuWATBEbQ7cOgGns=;
 b=NXmOCgr6NK7HLYsr9DjjMae77tXHgQg6w+4KGumCKmR7ANzF9adKQ8J/iKim+/JCSOBefjZVMRS6dWRDBHN6yu2t98dDarSXstYwu49DpTEtXZYM2hy2j25yau4dM48mb9qk6jQ1SDQg4n3u7NKKFgp9t9wDYxqoft4HZaLJ3dxfdnHkJ3ozBnjgyPM8XJUoEuWxqv7oOYdWYXDemWjY2dxheSdNRoyBjfpYOIfi/eJ7HsPP+RLwW8DF5zmIRFyHNY+FfOHoIEEvX4V+XxBjHOrqpKPef9zEVauluFKJkkL6NKEx1u4m6zjn20X0JIIAanyOpCFKRoHli7r0Z4nHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+y49haYGLDtzhIACZj4+njyyr5ZuWATBEbQ7cOgGns=;
 b=PqL9YXGlsvnhWYhEv/fx8X98OfYK06a5dPtj2dxggDa9Xr78PFZ4E9zhZh34K8Q0/eP0H41i7Mj1vxBuowEyltHC1HxGxZA6DL9L8t1YWjmHSMaLvv2bRU6X4zx1IJvhDzCGjeJc30laTjRqWdZ5Ps8ImEGJuPUt2nz1/cCwXBc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 1 Feb
 2021 08:36:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 08:36:54 +0000
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
 <20210129171728.GJ10888@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5ef46395-f370-2de1-4ea4-9aa997964756@virtuozzo.com>
Date: Mon, 1 Feb 2021 11:36:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210129171728.GJ10888@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 08:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b8cad6-5e2f-42d8-d713-08d8c68c87ba
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40725C61B3A5763EFF36798FC1B69@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2NP+NjihHUIZfo62oNsFmZsuBMi7neM/Gdfmqd6dk7mpObp8p//hYjtwVQ1tRyUBWa50KwyLcpdUfCManiJLUqFqo7OOHOMj84nk11ZTTXkRvPuU4x8OIT7E/M5ue+tVHJOYQyQTjeROoPycD45pEi577wiZMIc79T4+LcjqoRGAei5c1DCfWy0M2mP7hiIetjjrprFLgTrNNf9D4Sr6QTSeYCMHvP4F5IA4FZhU61bzpocRDGSGRW0a0Uw6xQW8LqflbBqeYWKl8zAg4oUBOBWgGsf8+gKRkwNu87ZLIUN5HB07yterVxFPR3bH8I08yODLT2/7OCmKN442YMcLF5EdIRSg987axXbJi5L+L2nU0RfNkVcHF62qDACdErKv1DAg905bj7MgEPas5CLmxqCEADt+T/1ugF2H/CuuvqTZK2S84blz0fnvK07beecBRoshuUofGl+3NaZtEbhVUns6nlo4GMb44elIUI4Ubho58/Z5+ygZDDsIF7m0gri2NYnBx2u+i4w+BQwjqSO1y498vVwaE4fMDqww2Tb4fENwgtr7cfiUxJ7rNsEaJse9RiMs3+W8u7SRmAlAGKC6tGWvU23R9//23lX48fjsfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(186003)(6486002)(36756003)(52116002)(26005)(54906003)(110136005)(83380400001)(8676002)(86362001)(5660300002)(2616005)(956004)(498600001)(31686004)(2906002)(16576012)(4326008)(8936002)(31696002)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnl4ckdMZTl5Ui9YVlRTMVpncGROSHY1MDJlTmJWQ2ZNS09veWJLOFQyOUQw?=
 =?utf-8?B?cjRUWkZhSWZWWjJzTVlFL2QrZ2lNYTYzSTYwL3JhUFFDSHVVbWw1UVJJak05?=
 =?utf-8?B?bkJubEc5QkhrRW0xc1ZwTmQyazBYMU01K1JlbW9FU21qWDBRcE9tbndjelJo?=
 =?utf-8?B?c1Z6aTYyTzlZWVBLZGhUY1plVnEwTDFnbXJZcmtHUWJEeEdYSGJpdnVoL2pa?=
 =?utf-8?B?ZzIrQ1V3NzVQRGFJRHcvVzFseWs4b282dTBkNkJqUGsvU3d6UHVuaTk0NEtU?=
 =?utf-8?B?aHh4N3h1bk9yWms0bUxWclJxdDBxQTF4SURpM20wWHpTWVUzdStsY0FJZW9o?=
 =?utf-8?B?RUZTcnNGLy9heGpPOXM3dkNlKzUyZjRLOHRacjZ4VWplNkQ2cDlNek4yOENn?=
 =?utf-8?B?TGhYRUxVRHVPUjVLaFBVVEZoNk9Sa3E5UmZJc2FXVDBGUkdOUHAxVnNWUlZR?=
 =?utf-8?B?d1Yxb0Z2UTJNaWI0Z21IbGJqRiswd3hMUHlIYTBPK3E2bXRBYnYybVlDdjha?=
 =?utf-8?B?SURyK0F2ZkNvNVZNaTVtRTd5azM4NC9CU2dtOUp3YnhUS0txNldqbE5mYm1D?=
 =?utf-8?B?QWZucWVEUWlwWHlDREJkRy9YWUFYSVBuMS8rZ2hGSlZUYWVFa2FLMGlxK1Qx?=
 =?utf-8?B?ODlEMVJSN1VEQVE5RlZGT2RxczlWeGdwZnRhNnpLcHpOSHE3SExFYzZWZllp?=
 =?utf-8?B?dnJkOUJyVzltUW5Ld0pEc0JpMjhnWVVzc29GS3JEd2MrSXNiK2l4QWN2aFBh?=
 =?utf-8?B?ZGQ0bnpVU0g5cm9IQ0Jtc0xQTnYvS3p2K2E1RTN6b25XQ3BQdE9OZlU1dEpm?=
 =?utf-8?B?SjNYS2pGR1JMVy9yOFB3U2dCeVNJbXBaZ0VGbE1lS1BjYVZYSnUrQXR4NnVl?=
 =?utf-8?B?K2pacFpGaEFFODUzdHc1azlDL1FoY05pZlVUenlLWUwxajl3aVpUMXdiL3pH?=
 =?utf-8?B?NDJMQWhPcURtWFIwY0tDNDNCS1RveXlocUlXRWxpL25maE5BeE5nSk5WcWty?=
 =?utf-8?B?QWxseVFxK0R1QzJrVFE3QTNGRTlOQVRYSUIzY2ZKUUtVQU03VmZyNStYKzl0?=
 =?utf-8?B?UVBlaDZrRnVyYkZ1TVBNSUdRWS93RUQvUEhzNmxGQjQzTUhzSGFYZ2ZDa0ZR?=
 =?utf-8?B?UDhjK1ROTytST1pML0FtTVlzU1J0MnI1TzhTWEFvL1Z1OWgzNmdCVmVmMjNo?=
 =?utf-8?B?YWdwM0FISnFZMksvU3l0c3EwNm1NcW53RlkraHdjM29OelhUMy9xWUdhSUJx?=
 =?utf-8?B?QjF1aG5OOWFkRWJXdFgvYVZSTVllMXBINVJ1dmRhWEdsbnlXM3JqZGh5MEQ2?=
 =?utf-8?B?VTVNYlRuUVJjM0VzMDVOWmlTY09Za1A2UVNVRmUyMEJNQ2lTT2V1WGlUbGQy?=
 =?utf-8?B?UlFUYnRSUjJjL0lTNnl2RUxHNHM3SGpvUmlWYUZYbGE3V0xraUc4amFVcG1s?=
 =?utf-8?Q?D0N+PPKl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b8cad6-5e2f-42d8-d713-08d8c68c87ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:36:54.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8V6fn/H/gmJMuQnSowFtIjoLG68L95XkBxJwvfdlY2ysQiF161W034tuYF7bR1zslEOJMLxDvfuVKq9Z5Ht0Z1EYCVJ/Mu6V38fsmkKWz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.3.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.01.2021 20:17, Kevin Wolf wrote:
> Am 29.01.2021 um 17:13 hat Peter Maydell geschrieben:
>> On Fri, 29 Jan 2021 at 14:52, Kevin Wolf <kwolf@redhat.com> wrote:
>>>
>>> The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c:
>>>
>>>    Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-29 10:10:43 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
>>>
>>> for you to fetch changes up to 4cea90be62f4f15a63e1a8f7d5d0958f79fdf290:
>>>
>>>    tests/Makefile.include: export PYTHON for check-block.sh (2021-01-29 12:32:36 +0100)
>>>
>>> ----------------------------------------------------------------
>>> Block layer patches:
>>>
>>> - Fix iotests to respect configured Python binary
>>>
>>> ----------------------------------------------------------------
>>
>> This is definitely better so I'm going to apply it, but it seems
>> to reveal a pile of iotest failures on FreeBSD:
>> [...]
>> Failures: 030 040 041 127 256
> 
> Hm... I did run 'make check-block' on a FreeBSD VM before sending the
> pull request, but it turns out I ran it on the wrong branch. *sigh*
> 
> After rerunning it with the right one (and manually so that I get all
> tests, not just those in 'make check-block'), however, while I'm seeing
> some failures, my list of failing cases and your list are completely
> disjoint:
> 
>      Failures: 115 125 145 182 286 298 300 migrate-bitmaps-postcopy-test
>      migrate-bitmaps-test
> 
> All of these are test cases that are not run during 'make check-block',
> so I would assume that they were already broken before.
> 
> So there seems to be something more specific to the environment that
> made your test cases fail than just FreeBSD.
> 
>> though the entire build goes on to succeed (which is probably
>> a test framework bug somewhere...)
> 
> This is not good, and it can easily be reproduced on Linux by simply
> changing the reference output of a test so that it fails. 'check'
> doesn't seem to return the right exit code any more.
> 

That's bad. I'll make a patch.


-- 
Best regards,
Vladimir

