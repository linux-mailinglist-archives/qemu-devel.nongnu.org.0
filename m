Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E95315483
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:59:19 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WMA-0006BK-51
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l9WGE-0001cT-Nu; Tue, 09 Feb 2021 11:53:11 -0500
Received: from mail-eopbgr30136.outbound.protection.outlook.com
 ([40.107.3.136]:40583 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l9WGB-0008Nl-1J; Tue, 09 Feb 2021 11:53:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbeLcX+qsZQmlWR3iiusdGykt/Zr9G3uqSzFHvNp3N7fTG0g09cY+nyCbdxwAn+h+rahkYSMmLgHPU1xQf27oy+PuzwF/eqkf2Mv8aLvFACGvc+dgxmkyBjeksdjiH2piPiBSugmkG9rtHWVRF2al+CdvAuY7WulKISbbw0ET+9t/v1jx93OptYqW3b7BQOT8GcBwiKuEQRi4vaToHrc3uZboON3aAMb8SqGu8pH0Mf/xwnQi/em65QIS4Jk+5upgheBJ0EUu1xlILK/oa7etA1JHMqYgqj95OmaxegdBe/Ty1fM+MTkeFpFgHyUTmigcQr2IdF6+9KZXiOx6ivfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9m7qg9RY86+dR8kP98TnW51TS1xWoL2X5XFVzp5mrQ=;
 b=l8pl1nJw+4NcbkDQKR1xGaEWD3Glh3eyi+b4S1Oy7RUsHtQngzc21phOIynhdFbibS9NmEMUUvx8t6/8UVmZ5iVN3dGB/EhhFvkTkOToUB2T9VLn1T3PaStlvZ3V2bfcU9pkdfJcCn3xGrBG+6hGDBFSPel/He+s2TdGgl3KRuTOdAAj9CscyP7QfgfyZQsB38oztwr2DfV2YPbIVAnI4W47fv/+OPbkz/QhowkJAZ0vjlowjoJqTeJVrw3xiKbmMXqIAg24BIyga3JYw00LVhf9bxNkS9RTUqucNEboCo+WzXf+xfp36e/0qQ6xnfZB9oHbA5EnoHrYRBN9Yn/iDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9m7qg9RY86+dR8kP98TnW51TS1xWoL2X5XFVzp5mrQ=;
 b=L5vwhG0KdUZDgVVcAQxoxfQfJfPvmHarQfuQd8KmvLBzcjfCYx6qrGR21nH5Ix8fK0kRr2o8Imq+afoIxItUbFtmb4IT3YCtBPG3b98I/Q6ZxCFqx60xXBysH1lsLnr6jgMjUD9wI42G2n3NsMVVurgkGdIKeUKySevzgi+9OSk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 16:53:02 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 16:53:02 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <6a379fe0-cf87-bc5e-ae53-473599ea10c4@openvz.org>
Date: Tue, 9 Feb 2021 19:52:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0PR06CA0083.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::24) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 16:53:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edf315ee-d061-43dc-fda7-08d8cd1b2999
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333A3886C497D36F0AD84B6B68E9@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YANil04xtC68n9F55Kl8mRQoTvSoUCkq/KXDE09lJ3R6VspVpL+dPhtA3P/r2ucjZniVlK5WtUvbX/Ah+ejTNSk+YZ7V3rxj/A5/arbrBvwiFm9bgS7V6rbnSd1CzG7yiOAOhl8C0QP5B/RbYEgoJd7rZDXX0HlPMtJJb0met+kh2k/CTyyZCuHrOo37U0nXBGJEun9ov4BZH9uIybekktagwinD+377pYeeSeRMojZgArQfkNw7Gxv9NbIeyiymWhLugQOV3EDTp5Jzx2cJ6bBT0fkV055pUt1oLh+lMd150dW4u0b9y/yL9lOelRAGFzN9OQynyXupLqC8kjmoMjHqtAzQ851m8QS/6iC77k2njJbYB7Qn1zguiYWQLfuAh0EnqH0o/l+wCdjYin35wxxDxQ4GqRZvXkxLaIPeXkJ+wRK7AFYCUq958s3/hkR24h1mzWDeZs9VIgsYUIS3OrVO+3PvySItoBnclyXwr95svmY55yfAdHliJanNpSh4uWsNDgaafLaUjMZ/jrekJ+A/90/W/4UpeDXh+4KCpq5SmjBuzFGrPu1fR/ICFks1Izw6gvfWs3oQn2uJr8gZXkewGEv9kVPVIBixrZgXMS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(16526019)(2616005)(6486002)(186003)(36756003)(956004)(4326008)(478600001)(31686004)(52116002)(66476007)(66556008)(42882007)(66946007)(83380400001)(31696002)(2906002)(8936002)(26005)(8676002)(83170400001)(53546011)(316002)(16576012)(5660300002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2llQ2pxSGNUTFVSdmZqR2F0cGFoK2tOTlRWTnIyN1h3SE1IY0kzRDAxRXRv?=
 =?utf-8?B?QVFndXZTb0tZbDVvdWtYYVNLdWgzVTZpR0ZlVC9aTGs0bWN6d1RhaG9ibitr?=
 =?utf-8?B?L3U0Y0QrRUIreFg2L1lZYVhhd2JwMnRGcXhjdytSVWh4VzUwMzhRYVkyT3ND?=
 =?utf-8?B?TlMyT1pCdU9ZbStnU1UyZzMxZHJpN0R5a3dmQ3pydE5sUmtaMUF4SDUwR2NG?=
 =?utf-8?B?dHRHeFM5V0dJb3NBbFJPWTVBeDl0cEx0MUZnR1o3bndrcjJLTW9iTjhFcWJp?=
 =?utf-8?B?MTdROXFPV1hpWGhLelJEcGwvYmVOUkkrTXFRdnE2NVQ1eUlzWEtVMktwUVFy?=
 =?utf-8?B?b2I0dFBuNWkrMy9QZ2RFb2VRUGg1M2JwUW15UXAyVXpGVHdnbWhNOWR5ZXZ5?=
 =?utf-8?B?WjFDRlA1WDkwTDdyUm1acC9oTGpsYzRoMmxNZmxXUHBUUTlraUdkL1N2eUhX?=
 =?utf-8?B?cFBEa0o2b0lyYlEwNmtHSzFsTUdZNTB2Mi9CaXFVekxmT29nMTJTYi9UUzhN?=
 =?utf-8?B?OHZVajhuWU1IUWthRkVQdGJnUHFmUzEwVENHWmdmdEJkaVpYeTFYUVB0UnVH?=
 =?utf-8?B?N0V4VkZ1RVFHUTZRSjNMYTdhN0lwcCtjMXBzN3IxR0JXb2JjdFd4Q3hWejhF?=
 =?utf-8?B?T1hDcDRSaEFvaDIzVUR2ZkRCbjZaZFhnVzJZZ0RBMllRZmtjMjNpMGxtaXcv?=
 =?utf-8?B?ZlAwTWVwdzdWeVVYZGZhMU1SZjJzVXZMQWs2SUtoZDhVYlhyNGJJVDNBcVBm?=
 =?utf-8?B?OUtwak9NczYwVmVJSlZ6QW9rK0dQWmI4N3BSM1hibHBhU1RpYW9LRm0vYlNZ?=
 =?utf-8?B?NU1CaGR0ZkkrbDJVV3kyWkpSbWI2MC92bVk5bjB6TnJVU1RjSGZFQjZFTXh3?=
 =?utf-8?B?QStFMjBoL3JrMmd2dXlmdzBCdDY4U1JFV1ZiWjlqSHN3aDc4RlB1SFkxWTFB?=
 =?utf-8?B?QWVxWXRhZENaNng3TUVQRUR3Y2o0WmI4bE9PaGQrajNiMnJkWkE4blEwUDZC?=
 =?utf-8?B?NlRMK3FvTVRHWXd6T3hMK0dDd1RtMk55U1VKRW82TFk0dUMzb2xoZTVLK1lH?=
 =?utf-8?B?ZEdQalJ2VHl0NVJpd2ptbEFCZkZEZE5KdjlJK3pYd3BQNW1YYmxkRzAxOTk4?=
 =?utf-8?B?SzZpMitDMjZITzNNMEk3MzE4QkJrOFQ0QmE5QWkybVBMcnV1OERaeXFmRDc2?=
 =?utf-8?B?LzJLajlGK1dxNDhMRFljcmFoWnpkMmxKcnA1U2VWZHF2SThOa2Ywdy8xdVg2?=
 =?utf-8?B?U0c5TFdBZmU5MzJkWGR2TERtamZTNm5iZDBlelBHTWhXbjhjMXRFU2x0OUx0?=
 =?utf-8?B?ZkZDL1I1dXlVNCtOUHR0Myt0eXVhTGhaNzI5cVd3TnZCQjBsQzJLSmI5MFZh?=
 =?utf-8?B?SVcxUFFMRC9RdUxXeVEvbDAxTisyWFVmVHkrTGhjQmVMK3M2bHNWeHEzNE1R?=
 =?utf-8?B?R3hRWFFHTkw5c015RlN4eWtWYm9kMUdXc01zUGI5VEpoTXBBdFFEQzBUamY0?=
 =?utf-8?B?dmxOU3RtVFdZNUk1OFhGQTJ1Y1hUMktBTFdiVFdYaXBNTVNTd1N0L3ZFamdr?=
 =?utf-8?B?TkY2QWtZZkNQd0QreWFOVDF4V1VON0o3VXByNlA4QTlXWWdiek43RUlIOEVl?=
 =?utf-8?B?VVFWRGVQV0JPM3Jrb0FYQ0hWZFBVVS9LMXdWSkFlY3VPS3hiWnF6Y0lib2FI?=
 =?utf-8?B?TnMvNElrLzl1M1g2NFhDTzQ4UWdMOGkwcENuWGdHc2p6UDZMQnQzYmZXWGxE?=
 =?utf-8?Q?KRXX1KIuI9pJG8zvmlEeY/6JnPwd2joECrNfkJs?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: edf315ee-d061-43dc-fda7-08d8cd1b2999
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:53:02.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUPTfnsjJ1bFThwVS3/eWQgzDO0Sam1bGr3jkRxsVxwIsZkuhVdR6VSHt6CkhcrkZAy/RoxuacUxy3KRG9gQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.3.136; envelope-from=den@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 5:47 PM, Max Reitz wrote:
> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>> 09.02.2021 16:25, Max Reitz wrote:
>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>> Hi all!
>>>>
>>>> I know, I have several series waiting for a resend, but I had to
>>>> switch
>>>> to another task spawned from our customer's bug.
>>>>
>>>> Original problem: we use O_DIRECT for all vm images in our product,
>>>> it's
>>>> the policy. The only exclusion is backup target qcow2 image for
>>>> compressed backup, because compressed backup is extremely slow with
>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>> produces a lot of pagecache.
>>>>
>>>> So we can either implement some internal cache or use fadvise somehow.
>>>> Backup has several async workes, which writes simultaneously, so in
>>>> both
>>>> ways we have to track host cluster filling (before dropping the cache
>>>> corresponding to the cluster).  So, if we have to track anyway, let's
>>>> try to implement the cache.
>>>
>>> I wanted to be excited here, because that sounds like it would be
>>> very easy to implement caching.  Like, just keep the cluster at
>>> free_byte_offset cached until the cluster it points to changes, then
>>> flush the cluster.
>>
>> The problem is that chunks are written asynchronously.. That's why
>> this all is not so easy.
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
>>> First, I’m not sure how O_DIRECT really is relevant, because I don’t
>>> really see the point for writing compressed images.
>>
>> compressed backup is a point
>
> (Perhaps irrelevant, but just to be clear:) I meant the point of using
> O_DIRECT, which one can decide to not use for backup targets (as you
> have done already).
>
>>> Second, I find it a bit cheating if you say there is a huge
>>> improvement for the no-cache case, when actually, well, you just
>>> added a cache.  So the no-cache case just became faster because
>>> there is a cache now.
>>
>> Still, performance comparison is relevant to show that O_DIRECT as is
>> unusable for compressed backup.
>
> (Again, perhaps irrelevant, but:) Yes, but my first point was exactly
> whether O_DIRECT is even relevant for writing compressed images.
>
>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much
>>> sense for compressed images, qemu’s format drivers are free to
>>> introduce some caching (because technically the cache.direct option
>>> only applies to the protocol driver) for collecting compressed writes.
>>
>> Yes I thought in this way, enabling the cache by default.
>>
>>> That conclusion makes both of my complaints kind of moot.
>>>
>>> *shrug*
>>>
>>> Third, what is the real-world impact on the page cache?  You
>>> described that that’s the reason why you need the cache in qemu,
>>> because otherwise the page cache is polluted too much.  How much is
>>> the difference really?  (I don’t know how good the compression ratio
>>> is for real-world images.)
>>
>> Hm. I don't know the ratio.. Customer reported that most of RAM is
>> polluted by Qemu's cache, and we use O_DIRECT for everything except
>> for target of compressed backup.. Still the pollution may relate to
>> several backups and of course it is simple enough to drop the cache
>> after each backup. But I think that even one backup of 16T disk may
>> pollute RAM enough.
>
> Oh, sorry, I just realized I had a brain fart there.  I was referring
> to whether this series improves the page cache pollution.  But
> obviously it will if it allows you to re-enable O_DIRECT.
>
>>> Related to that, I remember a long time ago we had some discussion
>>> about letting qemu-img convert set a special cache mode for the
>>> target image that would make Linux drop everything before the last
>>> offset written (i.e., I suppose fadvise() with
>>> POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact
>>> that implementing a cache in qemu would be simple, but it isn’t,
>>> really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One
>>> advantage of using that would be that we could reuse it for
>>> non-compressed images that are written by backup or qemu-img convert.)
>>
>> The problem is that writes are async. And therefore, not sequential.
>
> In theory, yes, but all compressed writes still goes through
> qcow2_alloc_bytes() right before submitting the write, so I wonder
> whether in practice the writes aren’t usually sufficiently sequential
> to make POSIX_FADV_SEQUENTIAL work fine.
>
>> So
>> I have to track the writes and wait until the whole cluster is
>> filled. It's simple use fadvise as an option to my cache: instead of
>> caching data and write when cluster is filled we can instead mark
>> cluster POSIX_FADV_DONTNEED.
>>
>>>
>>> (I don’t remember why that qemu-img discussion died back then.)
>>>
>>>
>>> Fourth, regarding the code, would it be simpler if it were a pure
>>> write cache?  I.e., on read, everything is flushed, so we don’t have
>>> to deal with that.  I don’t think there are many valid cases where a
>>> compressed image is both written to and read from at the same time. 
>>> (Just asking, because I’d really want this code to be simpler.  I
>>> can imagine that reading from the cache is the least bit of
>>> complexity, but perhaps...)
>>>
>>
>> Hm. I really didn't want to support reads, and do it only to make it
>> possible to enable the cache by default.. Still read function is
>> really simple, and I don't think that dropping it will simplify the
>> code significantly.
>
> That’s too bad.
>
> So the only question I have left is what POSIX_FADV_SEQUENTIAL
> actually would do in practice.
>
> (But even then, the premise just doesn’t motivate me sufficiently yet...)
>
POSIX_FADV_SEQUENTIAL influences the amount of the read-ahead
only.

int generic_fadvise(struct file *file, loff_t offset, loff_t len, int
advice)
{
.....
    case POSIX_FADV_NORMAL:
        file->f_ra.ra_pages = bdi->ra_pages;
        spin_lock(&file->f_lock);
        file->f_mode &= ~FMODE_RANDOM;
        spin_unlock(&file->f_lock);
        break;
    case POSIX_FADV_SEQUENTIAL:
        file->f_ra.ra_pages = bdi->ra_pages * 2;
        spin_lock(&file->f_lock);
        file->f_mode &= ~FMODE_RANDOM;
        spin_unlock(&file->f_lock);
        break;

thus the only difference from the usual NORMAL mode would be
doubled amount of read-ahead pages.

Den

