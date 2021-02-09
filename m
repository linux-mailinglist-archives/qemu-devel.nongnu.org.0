Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3439F315656
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:53:45 +0100 (CET)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y8u-0004j1-8H
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9Y7Q-000388-Qf; Tue, 09 Feb 2021 13:52:12 -0500
Received: from mail-eopbgr30128.outbound.protection.outlook.com
 ([40.107.3.128]:2625 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9Y7M-0006WB-Mp; Tue, 09 Feb 2021 13:52:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxQiWfoU2UyPDqP4AI39DXNl1rs3+4sB69FJ1SP4YHXYzZUP+bEHUePcg0q7iJ0kz1vWVxV55AVhD7Utr+X3kPAqtGptopAsX9rJ807QFOGUSgUMxJJNMYp6e4UwQ3uo1EDmwwbFMcS5TOinvcPlml+KYqSbw50vOaNUm9dxZHXAnL7r0+d2Uj6AElUEg1SoHpIa7RJ+YuGgN+Px1WYLJPzsR8pMEpVo3vYBKaQiN2xqMCTQwn2CKiqHPMvxGjtKUcBeInPyb8TYaEzrbkmtJ+iuroogiju/qg8yPxyR9V+K6EpTfSBInc7oW4hPIybL4CufFvZTLM9Smua3WueFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQj0bxFfD/wwNlKcKFCytpFsLdYn8CnOig7DVpVKycU=;
 b=m2FjKvVoG0TvU9zLSVZht7TdlNXtUZHCCKZlGQhvXK1z8HJKgkR1hYTUN3ERRHHTJOTCNL4TeVH2FgHvM4muIszgxvuU4ZLj5IuHjFv3vxQxhMfNazmQ8n2AxQ/zoWJ0qIVanpUgBJn4DZ5fBEhFOTb1IOSN0Rxkfj4THGsSdQJK1+jrXnlFJ3rRhoLR6mMF9V8P8nl5EpwYiOke7cyguOhFbrhDAlmq0mtjnZ8XhX+Yvl9Ua109jXQRtlab4xI9/dkzesivfnv7Irh/sqzksNHzPp0kctWKQn+fdk+i7cn+tVnDgYFF0beDSdhBLtxeJuYp+wlp2f9AaJHx7X7Cgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQj0bxFfD/wwNlKcKFCytpFsLdYn8CnOig7DVpVKycU=;
 b=jp4u0eU5BkfH/QHWgQWnDpGSgJWUmZx3aLYmJMip/sdtLb9qJ1ysagpNgQabxlDO7x/kcFu9+QpMEYfJWii6OORwa8piZ+B1X9iDk1SFswRfkVbMLe+gbrile6Jsrg8ZM33Q6gGwRv73bAIuhm0+m96ioESTOyvHY0DGcQRch1Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Tue, 9 Feb
 2021 18:52:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 18:52:04 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: "Denis V. Lunev" <den@openvz.org>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
 <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
 <1b4ad0ed-e1a7-d592-cb76-8a204fbbd585@virtuozzo.com>
 <a3f741fd-8ab7-3721-38cc-be855b538afd@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dad2a202-430e-f430-6cfd-1c75fd3f2549@virtuozzo.com>
Date: Tue, 9 Feb 2021 21:51:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <a3f741fd-8ab7-3721-38cc-be855b538afd@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM4PR0501CA0043.eurprd05.prod.outlook.com
 (2603:10a6:200:68::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0501CA0043.eurprd05.prod.outlook.com (2603:10a6:200:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend
 Transport; Tue, 9 Feb 2021 18:52:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c4198c-ac5b-46d9-e744-08d8cd2bcaa2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65686448408108391E5E0AE6C18E9@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Un+hb2azbpksz0g1WNXsUDpgS96KtGePEiiulFWnrVqrfB6ki7Z+JzD2vPQVQ2znwM+EpFtHCE11ZS+RzlpIKLvTFpkSYZjJsPF7dzx+qWxAgRBCJD+2RF9unvWivr+I5c4jN9Uatfq3YRGlCXGwODKwpPjeg7OZIIxGQ+HE9uLRW6J0ARNOcICuo4wbb2rI2uVXdxDuyL6MbB3IxBsWXIedMIHEgzuJHC+sLBuA19rOOyiyQfs3YewrqEbenLp9Cdh889wJNsjpoKUDlszqHx0mjXd7fnAir4NX9IjybuuRcpU/t+sd39s0Gpzj4uEh1fRHFR32U6NIhNh3kWA49j86i1WcftKRAoVsaVJfDPGX2B+LTz/42KJd6IwPm0XDHTIcFH7GwpuXcJ3TpSAEId7Bk78GRTvEdHdwqtCuvRlHlgsimOQVXPsvBozKtiP7QhLEUXuqHcFW3BBu266x77bjuO23bPS8DKxKGFJAdGIcGyXUTSeCof+5Mi1ul+8/Q3ASkbAnbZBy/mAg/R+edCym1LRN7fSjuebUWWg0tJSmvte++T8632/HCjAv46nVwBMGuWwTihVA/znBRnr91kfbnBn2TL0ru/3OoajeA7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39830400003)(346002)(396003)(6486002)(5660300002)(316002)(186003)(30864003)(2616005)(4326008)(6666004)(66556008)(956004)(86362001)(36756003)(83380400001)(52116002)(8936002)(31696002)(110136005)(26005)(53546011)(66946007)(66476007)(8676002)(478600001)(31686004)(2906002)(16576012)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHNLYW9wWmZLL1FWWXdSdmt5UUEzSEtOTnFlWFZnbytHL1lXaU9IS3RkeEEv?=
 =?utf-8?B?U1d0TGZSMWgyMVdYb1JlZzhzQTNHR0dJN3o2NHdDMEZDdXBCd2o2cE85U2Fu?=
 =?utf-8?B?ZkdxUXU3cTFZSG1aVlU5VzIxU3FuaGJYYUV2Rldsd1ZSZzZMbUVab3FGaEtm?=
 =?utf-8?B?WEJsaFV4QmhoeEUwTlg3OGdQbmFrQnZMVWd1T0pjcmVMY2xjN2xBODZybTdu?=
 =?utf-8?B?eU5oMjdycW9MUUkrZXJSNGV6OEVjVEIxRG8zSmJ6cUF0TWdlM3htdThVUkhG?=
 =?utf-8?B?d1NLOUVvRC9EUWVCN09yQVdtYnE2eFNWOTJ3d2ZYNVhOcVlGY3lpS1Vjb2dJ?=
 =?utf-8?B?YjRKRGFXcS9kVUhPWGVUUTAwL2hFMXNiMTdMRFdKVzFDUVV1Sitlcy95QnJu?=
 =?utf-8?B?T1BUTlhyeHJpT20yVC9VUzJ2RTRITDFpYWJWVkMxSVFZS0NKbmtPend2STZJ?=
 =?utf-8?B?S21rdHhnTm9jQzBwRnpoVFd1bGVPOXJselBJMUVlWlhSU1ExUnduQVhaWnBM?=
 =?utf-8?B?RG1tcklQSk5IbVp0MjdzWjVYZDZBSDkzVzZYc0luYXc1WllYL0NydjRCT3cy?=
 =?utf-8?B?djJzRGVwbnpScnZNYmUwZlp6dUhaalMzTzMyWm85RUxnbjNPaGVYd0p3SEc4?=
 =?utf-8?B?RXE3UGg0YTY2NnFLMmdBSVFjMUxBNG9GNXNKTmtTbHFhTDg4MVJzUVJFbUEv?=
 =?utf-8?B?UXdxSmkxcmx5TTBiS04vWmFSSExvZGticm5LMld3dUtHdDBsZ3YvdjExZGc4?=
 =?utf-8?B?bllESk85czV5SXlyTmthbFJ5Q1VsekhaRjcwK2w0c1p6N1ptVXJJSkVBK3lk?=
 =?utf-8?B?VFRKZ00zL3dvWUsrRjdsWGRBK2RxZXpOUWhZU05DWDdJL3d1Mmd6OEgvemlZ?=
 =?utf-8?B?UlJsWUdPMW1RWGpzaTJtQ2xGWGZOLzJ5TUhXL3E1ei9SdmRseUpIL3hid3Rn?=
 =?utf-8?B?Qy9RN29rb2U4VVhTTEd1RW5VOGZQcm5yQXpUYis0MkJoTFp3OVltV3lhMWNX?=
 =?utf-8?B?N29WRXo1YVBuVStib2dkVXNrYTZpb1grUEZWTXVYWS9BWlhjeGRTQmkzUWMy?=
 =?utf-8?B?S3NHQUNRQlcrOTRtaTgzd25iWUY3a0crelpaekg1UGdFZnBnM3N5UExWZFIw?=
 =?utf-8?B?cUhoaVpSRms3STJZRy9FYzBOOGRLYUpiODcyVlBQQ0JaR3AxSDNwektxdHBs?=
 =?utf-8?B?QlU5NEoxcGFBM0pCYVJzYnhKTmFhYk91c2J4ZzFPbWVuNWJNQ0M4M3p1dmJS?=
 =?utf-8?B?aUlJWTJ5cGFXS3pETzVBbzZQdUJ4SkxKOC9HWHZIUlp5NUh6NlhXa2JWb2Zw?=
 =?utf-8?B?eWgxWUFaeEd6eGdXZU1KSmRLTzZHbUN1dFlicTZiYWZuMU56dlIwa21xb241?=
 =?utf-8?B?N01wdTkwQWFCdzc4Nzd2KzFmVjJHY1pXZnJ2OVNFUDkvVFg0S2JxOHVvei82?=
 =?utf-8?B?Ukt5eDFFMXR6NXhxQ1FPYjB5QmRVWlFTMEhXT0IvNGJuV1lod0pmQ0pFc1g5?=
 =?utf-8?B?Q1hjYVdEcitYeTA2YXdYRHErNGtRWlVjMTFvYzd2NEovbENxWDU1VTFFM0RE?=
 =?utf-8?B?VG11ZWduc3ZVaVd5WDF3Znd6YU9ST1ZVbUxQSitNeUpCZFZsNStoYUt5SjRs?=
 =?utf-8?B?YnFVbVRuMno0T1ZCYkZObEFsaGdaZDZlcDE5eVJ5ZUhxeC9wamE2bDRZT09F?=
 =?utf-8?B?dU5LSlJhakVqZG5aQjNTcGtVQ2pzMjl6VkxsRUtmRVpNVHBGbjVpMjlnZVQ5?=
 =?utf-8?Q?FsiFAaHYYVyILNvsikJJsitrKYi8ss3GuUriT97?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4198c-ac5b-46d9-e744-08d8cd2bcaa2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 18:52:04.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4cLa6fTqFCkp4aAQ96xOA184t6LgqcHhZmbKk9v6s2r8H4wHiBjihN8UBCq5sY3PHqQO7Xt8SgmtZBCu6vxwo8fq8bm2Sdksq4KBsSr5sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.3.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.02.2021 21:41, Denis V. Lunev wrote:
> On 2/9/21 9:36 PM, Vladimir Sementsov-Ogievskiy wrote:
>> 09.02.2021 19:39, Vladimir Sementsov-Ogievskiy wrote:
>>> 09.02.2021 17:47, Max Reitz wrote:
>>>> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 09.02.2021 16:25, Max Reitz wrote:
>>>>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> Hi all!
>>>>>>>
>>>>>>> I know, I have several series waiting for a resend, but I had to
>>>>>>> switch
>>>>>>> to another task spawned from our customer's bug.
>>>>>>>
>>>>>>> Original problem: we use O_DIRECT for all vm images in our
>>>>>>> product, it's
>>>>>>> the policy. The only exclusion is backup target qcow2 image for
>>>>>>> compressed backup, because compressed backup is extremely slow with
>>>>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>>>>> produces a lot of pagecache.
>>>>>>>
>>>>>>> So we can either implement some internal cache or use fadvise
>>>>>>> somehow.
>>>>>>> Backup has several async workes, which writes simultaneously, so
>>>>>>> in both
>>>>>>> ways we have to track host cluster filling (before dropping the
>>>>>>> cache
>>>>>>> corresponding to the cluster).  So, if we have to track anyway,
>>>>>>> let's
>>>>>>> try to implement the cache.
>>>>>>
>>>>>> I wanted to be excited here, because that sounds like it would be
>>>>>> very easy to implement caching.  Like, just keep the cluster at
>>>>>> free_byte_offset cached until the cluster it points to changes,
>>>>>> then flush the cluster.
>>>>>
>>>>> The problem is that chunks are written asynchronously.. That's why
>>>>> this all is not so easy.
>>>>>
>>>>>>
>>>>>> But then I see like 900 new lines of code, and I’m much less
>>>>>> excited...
>>>>>>
>>>>>>> Idea is simple: cache small unaligned write and flush the cluster
>>>>>>> when
>>>>>>> filled.
>>>>>>>
>>>>>>> Performance result is very good (results in a table is time of
>>>>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>>>>
>>>>>> “Filled with ones” really is an edge case, though.
>>>>>
>>>>> Yes, I think, all clusters are compressed to rather small chunks :)
>>>>>
>>>>>>
>>>>>>> ---------------  -----------  -----------
>>>>>>>                    backup(old)  backup(new)
>>>>>>> ssd:hdd(direct)  3e+02        4.4
>>>>>>>                                   -99%
>>>>>>> ssd:hdd(cached)  5.7          5.4
>>>>>>>                                   -5%
>>>>>>> ---------------  -----------  -----------
>>>>>>>
>>>>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>>>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>>>>>> cache by default (which is done by the series).
>>>>>>
>>>>>> First, I’m not sure how O_DIRECT really is relevant, because I
>>>>>> don’t really see the point for writing compressed images.
>>>>>
>>>>> compressed backup is a point
>>>>
>>>> (Perhaps irrelevant, but just to be clear:) I meant the point of
>>>> using O_DIRECT, which one can decide to not use for backup targets
>>>> (as you have done already).
>>>>
>>>>>> Second, I find it a bit cheating if you say there is a huge
>>>>>> improvement for the no-cache case, when actually, well, you just
>>>>>> added a cache.  So the no-cache case just became faster because
>>>>>> there is a cache now.
>>>>>
>>>>> Still, performance comparison is relevant to show that O_DIRECT as
>>>>> is unusable for compressed backup.
>>>>
>>>> (Again, perhaps irrelevant, but:) Yes, but my first point was
>>>> exactly whether O_DIRECT is even relevant for writing compressed
>>>> images.
>>>>
>>>>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much
>>>>>> sense for compressed images, qemu’s format drivers are free to
>>>>>> introduce some caching (because technically the cache.direct
>>>>>> option only applies to the protocol driver) for collecting
>>>>>> compressed writes.
>>>>>
>>>>> Yes I thought in this way, enabling the cache by default.
>>>>>
>>>>>> That conclusion makes both of my complaints kind of moot.
>>>>>>
>>>>>> *shrug*
>>>>>>
>>>>>> Third, what is the real-world impact on the page cache?  You
>>>>>> described that that’s the reason why you need the cache in qemu,
>>>>>> because otherwise the page cache is polluted too much.  How much
>>>>>> is the difference really?  (I don’t know how good the compression
>>>>>> ratio is for real-world images.)
>>>>>
>>>>> Hm. I don't know the ratio.. Customer reported that most of RAM is
>>>>> polluted by Qemu's cache, and we use O_DIRECT for everything except
>>>>> for target of compressed backup.. Still the pollution may relate to
>>>>> several backups and of course it is simple enough to drop the cache
>>>>> after each backup. But I think that even one backup of 16T disk may
>>>>> pollute RAM enough.
>>>>
>>>> Oh, sorry, I just realized I had a brain fart there.  I was
>>>> referring to whether this series improves the page cache pollution.
>>>> But obviously it will if it allows you to re-enable O_DIRECT.
>>>>
>>>>>> Related to that, I remember a long time ago we had some discussion
>>>>>> about letting qemu-img convert set a special cache mode for the
>>>>>> target image that would make Linux drop everything before the last
>>>>>> offset written (i.e., I suppose fadvise() with
>>>>>> POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact
>>>>>> that implementing a cache in qemu would be simple, but it isn’t,
>>>>>> really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One
>>>>>> advantage of using that would be that we could reuse it for
>>>>>> non-compressed images that are written by backup or qemu-img
>>>>>> convert.)
>>>>>
>>>>> The problem is that writes are async. And therefore, not sequential.
>>>>
>>>> In theory, yes, but all compressed writes still goes through
>>>> qcow2_alloc_bytes() right before submitting the write, so I wonder
>>>> whether in practice the writes aren’t usually sufficiently
>>>> sequential to make POSIX_FADV_SEQUENTIAL work fine.
>>>
>>> Yes, allocation is sequential. But writes are not.. Reasonable, I
>>> should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for
>>> the whole backup target before the backup? Will try. Still, I expect
>>> that my cache will show better performance anyway. Actually,
>>> comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e.
>>> 20% faster, which is significant (still, yes, would be good to check
>>> it on more real case than all-ones).
>>>
>>>>
>>>>> So
>>>>> I have to track the writes and wait until the whole cluster is
>>>>> filled. It's simple use fadvise as an option to my cache: instead
>>>>> of caching data and write when cluster is filled we can instead
>>>>> mark cluster POSIX_FADV_DONTNEED.
>>>>>
>>>>>>
>>>>>> (I don’t remember why that qemu-img discussion died back then.)
>>>>>>
>>>>>>
>>>>>> Fourth, regarding the code, would it be simpler if it were a pure
>>>>>> write cache?  I.e., on read, everything is flushed, so we don’t
>>>>>> have to deal with that.  I don’t think there are many valid cases
>>>>>> where a compressed image is both written to and read from at the
>>>>>> same time. (Just asking, because I’d really want this code to be
>>>>>> simpler.  I can imagine that reading from the cache is the least
>>>>>> bit of complexity, but perhaps...)
>>>>>>
>>>>>
>>>>> Hm. I really didn't want to support reads, and do it only to make
>>>>> it possible to enable the cache by default.. Still read function is
>>>>> really simple, and I don't think that dropping it will simplify the
>>>>> code significantly.
>>>>
>>>> That’s too bad.
>>>>
>>>> So the only question I have left is what POSIX_FADV_SEQUENTIAL
>>>> actually would do in practice.
>>>
>>> will check.
>>>
>>
>> Checked that if I mark the whole file by FADV_SEQUENTIAL, cache is not
>> removed.
>>
>> Test:
>> [root@kvm fadvise]# cat a.c
>> #define _GNU_SOURCE
>> #include <fcntl.h>
>> #include <unistd.h>
>> #include <stdio.h>
>> #include <getopt.h>
>> #include <string.h>
>> #include <stdbool.h>
>>
>> int main(int argc, char *argv[])
>> {
>>      int fd;
>>      int i;
>>      char mb[1024 * 1024];
>>      int open_flags = O_RDWR | O_CREAT | O_EXCL;
>>      int fadv_flags = 0;
>>      int fadv_final_flags = 0;
>>      int len = 1024 * 1024;
>>      bool do_fsync = false;
>>
>>      for (i = 1; i < argc - 1; i++) {
>>          const char *arg = argv[i];
>>
>>          if (!strcmp(arg, "direct")) {
>>              open_flags |= O_DIRECT;
>>          } else if (!strcmp(arg, "seq")) {
>>              fadv_flags = POSIX_FADV_SEQUENTIAL;
>>          } else if (!strcmp(arg, "dontneed")) {
>>              fadv_flags = POSIX_FADV_DONTNEED;
>>          } else if (!strcmp(arg, "final-dontneed")) {
>>              fadv_final_flags = POSIX_FADV_DONTNEED;
>>          } else if (!strcmp(arg, "fsync")) {
>>              do_fsync = true;
>>          } else {
>>              fprintf(stderr, "unknown: %s\n", arg);
>>              return 1;
>>          }
>>      }
>>
>>      fd = open(argv[argc - 1], open_flags);
>>
>>      if (fd < 0) {
>>          fprintf(stderr, "failed to open\n");
>>          return 1;
>>      }
>>
>>      if (fadv_flags) {
>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_flags);
>>      }
>>      for (i = 0; i < 100; i++) {
>>          write(fd, mb, len);
>>      }
>>      if (fadv_final_flags) {
>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_final_flags);
>>      }
>>      if (do_fsync) {
>>          fsync(fd);
>>      }
>>
>>      close(fd);
>> }
>>
>>
>>
>> [root@kvm fadvise]# gcc a.c
>> [root@kvm fadvise]# rm -f x; ./a.out seq x; fincore x
>>    RES PAGES  SIZE FILE
>>   100M 25600  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out dontneed x; fincore x
>>    RES PAGES  SIZE FILE
>>   100M 25600  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed x; fincore x
>>    RES PAGES  SIZE FILE
>>    36M  9216  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out seq fsync x; fincore x
>>    RES PAGES  SIZE FILE
>>   100M 25600  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out dontneed fsync x; fincore x
>>    RES PAGES  SIZE FILE
>>   100M 25600  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed fsync x; fincore x
>>    RES PAGES  SIZE FILE
>>    36M  9216  100M x
>> [root@kvm fadvise]# rm -f x; ./a.out direct x; fincore x
>> RES PAGES SIZE FILE
>>   0B     0   0B x
>>
>>
>>
>> Backup-generated pagecache is a formal trash, it will be never used.
>> And it's bad that it can displace another good pagecache. So the best
>> thing for backup is direct mode + proposed cache.
>>
>>
> I think that the original intention of Max is about POSIX_FADV_DONTNEED
> One should call this fadvise for just fully written cluster.

This should work, but:

  - as we see from test above, POSIX_FADV_DONTNEED don't remove the whole cache (see final-dontneed)
  - as I said we'll have to track writes, so the cache will be the same, just instead of postponed-write operation we'll do fadvise.

Hmm. Still, in this way, we will not need some difficult things in my proposed cache.

So, it may be reasonable to at least split the big patch so that

  - first part brings writes / full-cluster tracking and fadvice

  - second part adds caching-wrties option, corresponding flush code and additional performance

Does it make sense?


> Though this is
> a bit buggy and from performance point of view will be slower.
> 
> This call could be slow and thus it should be created as delegate to
> co-routine. We have though on this, but the amount of work to
> implement even if seems lower, is not really lower and the result
> would not be as great.
> 
> Den
> 


-- 
Best regards,
Vladimir

