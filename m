Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E38315414
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:41:34 +0100 (CET)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9W4z-00019I-Ck
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9W3K-0000Oh-Qm; Tue, 09 Feb 2021 11:39:51 -0500
Received: from mail-eopbgr140104.outbound.protection.outlook.com
 ([40.107.14.104]:17538 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9W35-0001kE-Qj; Tue, 09 Feb 2021 11:39:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAkoV1IBJpWW/gmtpcFcGgL4O7fMBQXS957seg7hnig4YQ1ZrcILSqt1GFGdiOk6uFMy4lj2DLOST6Q4U4cT9wP4H9vIheTYLBTDAGh97fzOg2Jg3ym4jTUzmCvPr2pBRKS4moZb3O1BQcjV2G91P3NHsbQ8LIOQ78DVex8MCFX2Y13smLj7/0kGSkpEEAoLf6LAPk4enlh2GIFxgN4rOtNjyRVCth5PKb1p/wvxOcM1F9hbE/vKCMtn3kVSDiGLSWasH05SmvbvTJZP8HcsXStWeV/h4i1M85/mmOYkcmh/lYOfOJwknjJDjp9JYonZpE7JFrW6HKVKpsGzPe4wHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OM4cV6Wgi8Q/olcx5BsNarVNpWQn5iHGJpjX26r0Z4=;
 b=bCpFt6x/bDex9hwYnSDlJlr1/5LjAdzaDAdg09NvUxMssHt+oszcbUhAdLYQXku6R1DemBD5TWjMntR5jWT6G15qgtSajEPedGWjke3ZpG9OPJc3idNJ415mYu7tjo3zmwmRcUMAljrLcvf0wAgKqSvx1oCbX1Yk0/HI3us6WnrgG/wggGVMjDoudWJivwggWhX9RX7fmkihwoxTYvSvijmc2cHIv7II+HIkITRg5pPxygRYr2/iGKdZPUVU/j8VyJB1Ey1lfSZ7Z9bR82msqv/xa1gNANPqCpcc4onkwlhgo2gsPmBhJxudNOVTh7mhOqpcy7M9tmcjg0LETTE5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OM4cV6Wgi8Q/olcx5BsNarVNpWQn5iHGJpjX26r0Z4=;
 b=cEAmPtbNvne/kt622BygEpExK1eHWNJqQ1AfoRNZWNHP3B/L9A3G9+4QtCEGUlzwRnzYsYKIpm1HYJ/OfbzoEetbxO/Pqakn72mpOoFOhodXnpyQqADVf6OnoMisZtWqCUSQhrHOiZeqgpXhFTuDy/6YKiMPthz2xag9lLo54xs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.28; Tue, 9 Feb
 2021 16:39:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 16:39:30 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
Date: Tue, 9 Feb 2021 19:39:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Tue, 9 Feb 2021 16:39:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3cff2e1-e56f-4747-f5ce-08d8cd194619
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4023784B958420D9E190D66BC18E9@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dZ/lJGhiFcyfLx41r00y3X2I6Pbnbvh6awTSF1PxkOvEV2oRKLOth9/WmKcDEKHS1RUPl5gz65vSpNAA2hDfxELDLFZ0YrlorFbR5glAh+oV3VZN7SCU7gPWnhT3vvWworP/MvTx5zSLQWnKEmDvFzmTpXaaeJx0VVaZf27ZFjOJqgMUucEWkZBUBIfiHs1jhHJrzKrEqPAKVzHUAOXFJELOXYwT1z8/fpTwCIyhCL/ELHJBWbGvLw8wjHoxXzb/Gys7yBitbuAllrSR0ZNnJGuTGhrPtBQ9zFAxJkUpXbhvM9pxNRGV1Ugii/gFjUq34Sg7hO154QikaJyy5rfCzYEns6rRuiQPbxekxqxhqZ1oF01Qpwusw8nwj5TLffKusLKVy3oJhhgXmOjuyf3kmyQUdCpP65kAgkFHOb9AmAWUT231cqynFIBNiOurFyHQpgr0tVEVBo4iGz8CdC7Y5vGuRBIkasSlw5a+wAxRz21BO3YD+PrpYYnz9+T85VETpyQWdQCczwy6We5m5bnB3nSLgkZjnKc47egsx6lCYNtg/EHm5IGZsworNxnn/N28bul77PEvjyMPUEwFi9z1PYJ0QOLdQMOqmXiVAzVdNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(366004)(346002)(136003)(16526019)(186003)(66946007)(956004)(316002)(2616005)(31696002)(5660300002)(8676002)(36756003)(16576012)(83380400001)(6486002)(53546011)(2906002)(66476007)(66556008)(52116002)(31686004)(86362001)(26005)(107886003)(4326008)(8936002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUVCeFNWQUg0WGt1TXBuUG5IZVh1SGdtSFNkMDRmVys2YmhiS05EVkMvM1RD?=
 =?utf-8?B?OUxaZnhnT2w1SkpXRGQ0TmZ4U0VZOER1UjhFS2FZN2RqbzZRb1Z3dmcxUHVJ?=
 =?utf-8?B?eWVoNUF2QXE0K2w3bU1yUlpLdVozZi8ySk5SM1hqZjVpbnlrUExldFYwMFFU?=
 =?utf-8?B?cU9oYkUzVC92TTVlNjcvRXQzSFhZYWdreXFpcVVvVWJOTnVnVSs5OWZROVBY?=
 =?utf-8?B?ajJ4bU44aWtxdVpqemhEVElNRFc3YWxZK3hjVzFoM0d1WDdFUDY5Yjl0NHFU?=
 =?utf-8?B?T3pIeUV2QmdlWHpYelBUa05aUzU2aW1QamdocUd1eXJxV1hZZ002Tk9nN1li?=
 =?utf-8?B?Wks1K0oycCtzSXh0Z2VySm50Zjk0a1ZWSXRMWmFPek5JZTZYZUJEa3l2MTcr?=
 =?utf-8?B?dHYxRjdHcm82VzlUQ01mT2RHdWlMdWRYeEZqVlNiMFRoaVhiNVQwQ25kNVkr?=
 =?utf-8?B?K2c2MmVtZkh2YWZCOHFHYlAzdWM0UUxYdXdNM1JlSTh4dCsxQ3NrOWF4UGdG?=
 =?utf-8?B?cm5kRno3ZHl2ZEhIWXZsUVZzS1VVcS9jOGhNcE5KSm9BdlE2WWpwc2ZoZjBS?=
 =?utf-8?B?Rm5aRWNHM21pVmVubS94UCtrbG1hYmVHQy9yZFpoYkdXSGdVNkpyTTBzOFkw?=
 =?utf-8?B?NWMwZkdYdzJoSnJxQmRBSUF2QnVxU3ZVNVBEQk85alkramNxb3ZhNE4zK1Fx?=
 =?utf-8?B?OHdnUUpaOXljOC80N0l4aENsbkR3ZjVFRURLUDhXVEFCS29xUXlsUDJEczdT?=
 =?utf-8?B?TEdndDlQaXY2MjJ6cE0rMSs4MXVLNUVZcnNEQkxRaG5IMlFwNzJEa1BiVDNn?=
 =?utf-8?B?SmtHU0RHN05nRkgwT1dpb0dscTNkUzM0bThjQzgvbHZRV0E2V0M1N3FjTVZH?=
 =?utf-8?B?K1BtNE43YS9NU0RqSDVTRVlDVkk0UUlCZldWbGk2MDhlbmVkTFBYVmxFMU0w?=
 =?utf-8?B?Ui9SRkZ0cmJlZXczMm90Wm1uUllXSDdQSWZBU2lTTURTc1JGUDNtdG43Q01X?=
 =?utf-8?B?aXpQaWN4SGFxUzVqYS80Tng3cFQ0UUJwWVJuWWd2aFJsODFtM04xcDRNNnBw?=
 =?utf-8?B?WWJDcXREY2hMTnRwdHlOT3BUcHhWRXVGdUNrRTNISGpxQUgvSm1VcFQxdG5M?=
 =?utf-8?B?dEtxT3VIOE5pMVdkV0lUM2x5TlFMWG1jdTByN09HMzAvdDZ3WVdxc29ndDY5?=
 =?utf-8?B?L1JmTlZ4b0RlVTZuVWRjQUlDMGFxQ0JBQzcvWm1pbkQvQ3FqSUV4d1JkSW11?=
 =?utf-8?B?Yk91UnZlazFBQmZVaWd6L3hPSDAzQndGQmxxazB4RnZHdGlnOXQ5dTVjamJZ?=
 =?utf-8?B?ZGtLODVzVitEdlR4L3IxcnI2bDRoSTNsVFFLelV0UUtkK1NiVkxtdFlKWDNq?=
 =?utf-8?B?RTVQL0Z5TU9mSUlucXBuS0plZER2dHllVG1TVEVCNFFDQVFzZytNTDhRZlNI?=
 =?utf-8?B?WVRibythYlFRRXFydFFSbnBqRjI0Qm1LQXFCd0R4MUxadStqbEU4NmZiN1Nj?=
 =?utf-8?B?a1d2cGtMdW8wV2ZlTk91cUpWd2tpb3JWVzRhSDZHRzE0M21WYTJSK2ZPWmta?=
 =?utf-8?B?a3lKS1kreE8vd1hzRW9zb2xGQk05eklHSEdZMUkrNWtEVE12eE9pUTVLR3E0?=
 =?utf-8?B?U1E5dXhZdW1JWCtBa253REw4SlVTemZZTDFWWG9tU1dzM1VBY2pWTlpHQlhh?=
 =?utf-8?B?bjU0RWpaUWMxbFo4Z0VuT2FNRmxRQytKN0pRbWJSd2ZXdU1qQ2tkWmg1Y3Bi?=
 =?utf-8?Q?ofiUm4X4iGQqwuUlNDkQ6KeaNaKlTyRhTkPF9Qu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cff2e1-e56f-4747-f5ce-08d8cd194619
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:39:30.8630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcwtJ3cgjgJtv4NSu43WrwOAa7Ewz2ropGCzsiC7cWNHfNuVs8WtZ752d/RV+/sppSjXY8WYLeVO49GklgAKmICGZhqoSZZalJ597lujWP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.14.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

09.02.2021 17:47, Max Reitz wrote:
> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>> 09.02.2021 16:25, Max Reitz wrote:
>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>> Hi all!
>>>>
>>>> I know, I have several series waiting for a resend, but I had to switch
>>>> to another task spawned from our customer's bug.
>>>>
>>>> Original problem: we use O_DIRECT for all vm images in our product, it's
>>>> the policy. The only exclusion is backup target qcow2 image for
>>>> compressed backup, because compressed backup is extremely slow with
>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>> produces a lot of pagecache.
>>>>
>>>> So we can either implement some internal cache or use fadvise somehow.
>>>> Backup has several async workes, which writes simultaneously, so in both
>>>> ways we have to track host cluster filling (before dropping the cache
>>>> corresponding to the cluster).  So, if we have to track anyway, let's
>>>> try to implement the cache.
>>>
>>> I wanted to be excited here, because that sounds like it would be very easy to implement caching.  Like, just keep the cluster at free_byte_offset cached until the cluster it points to changes, then flush the cluster.
>>
>> The problem is that chunks are written asynchronously.. That's why this all is not so easy.
>>
>>>
>>> But then I see like 900 new lines of code, and I’m much less excited...
>>>
>>>> Idea is simple: cache small unaligned write and flush the cluster when
>>>> filled.
>>>>
>>>> Performance result is very good (results in a table is time of
>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>
>>> “Filled with ones” really is an edge case, though.
>>
>> Yes, I think, all clusters are compressed to rather small chunks :)
>>
>>>
>>>> ---------------  -----------  -----------
>>>>                   backup(old)  backup(new)
>>>> ssd:hdd(direct)  3e+02        4.4
>>>>                                  -99%
>>>> ssd:hdd(cached)  5.7          5.4
>>>>                                  -5%
>>>> ---------------  -----------  -----------
>>>>
>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>>> cache by default (which is done by the series).
>>>
>>> First, I’m not sure how O_DIRECT really is relevant, because I don’t really see the point for writing compressed images.
>>
>> compressed backup is a point
> 
> (Perhaps irrelevant, but just to be clear:) I meant the point of using O_DIRECT, which one can decide to not use for backup targets (as you have done already).
> 
>>> Second, I find it a bit cheating if you say there is a huge improvement for the no-cache case, when actually, well, you just added a cache.  So the no-cache case just became faster because there is a cache now.
>>
>> Still, performance comparison is relevant to show that O_DIRECT as is unusable for compressed backup.
> 
> (Again, perhaps irrelevant, but:) Yes, but my first point was exactly whether O_DIRECT is even relevant for writing compressed images.
> 
>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much sense for compressed images, qemu’s format drivers are free to introduce some caching (because technically the cache.direct option only applies to the protocol driver) for collecting compressed writes.
>>
>> Yes I thought in this way, enabling the cache by default.
>>
>>> That conclusion makes both of my complaints kind of moot.
>>>
>>> *shrug*
>>>
>>> Third, what is the real-world impact on the page cache?  You described that that’s the reason why you need the cache in qemu, because otherwise the page cache is polluted too much.  How much is the difference really?  (I don’t know how good the compression ratio is for real-world images.)
>>
>> Hm. I don't know the ratio.. Customer reported that most of RAM is polluted by Qemu's cache, and we use O_DIRECT for everything except for target of compressed backup.. Still the pollution may relate to several backups and of course it is simple enough to drop the cache after each backup. But I think that even one backup of 16T disk may pollute RAM enough.
> 
> Oh, sorry, I just realized I had a brain fart there.  I was referring to whether this series improves the page cache pollution.  But obviously it will if it allows you to re-enable O_DIRECT.
> 
>>> Related to that, I remember a long time ago we had some discussion about letting qemu-img convert set a special cache mode for the target image that would make Linux drop everything before the last offset written (i.e., I suppose fadvise() with POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact that implementing a cache in qemu would be simple, but it isn’t, really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One advantage of using that would be that we could reuse it for non-compressed images that are written by backup or qemu-img convert.)
>>
>> The problem is that writes are async. And therefore, not sequential.
> 
> In theory, yes, but all compressed writes still goes through qcow2_alloc_bytes() right before submitting the write, so I wonder whether in practice the writes aren’t usually sufficiently sequential to make POSIX_FADV_SEQUENTIAL work fine.

Yes, allocation is sequential. But writes are not.. Reasonable, I should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for the whole backup target before the backup? Will try. Still, I expect that my cache will show better performance anyway. Actually, comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e. 20% faster, which is significant (still, yes, would be good to check it on more real case than all-ones).

> 
>> So
>> I have to track the writes and wait until the whole cluster is filled. It's simple use fadvise as an option to my cache: instead of caching data and write when cluster is filled we can instead mark cluster POSIX_FADV_DONTNEED.
>>
>>>
>>> (I don’t remember why that qemu-img discussion died back then.)
>>>
>>>
>>> Fourth, regarding the code, would it be simpler if it were a pure write cache?  I.e., on read, everything is flushed, so we don’t have to deal with that.  I don’t think there are many valid cases where a compressed image is both written to and read from at the same time. (Just asking, because I’d really want this code to be simpler.  I can imagine that reading from the cache is the least bit of complexity, but perhaps...)
>>>
>>
>> Hm. I really didn't want to support reads, and do it only to make it possible to enable the cache by default.. Still read function is really simple, and I don't think that dropping it will simplify the code significantly.
> 
> That’s too bad.
> 
> So the only question I have left is what POSIX_FADV_SEQUENTIAL actually would do in practice.

will check.

> 
> (But even then, the premise just doesn’t motivate me sufficiently yet...)
> 




-- 
Best regards,
Vladimir

