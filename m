Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919631638F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:19:31 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mao-0008MB-Ed
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9mSS-0000Iq-Em; Wed, 10 Feb 2021 05:10:54 -0500
Received: from mail-eopbgr10095.outbound.protection.outlook.com
 ([40.107.1.95]:57771 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9mSM-00034m-3T; Wed, 10 Feb 2021 05:10:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKztqrLRIsfliEDERi89jaeDODr3ohbOKpTMrl9dLV1uJJx62uafSoiO/tH0To9vGQ8y+/NGhZAd7WTSY7TRHfGqzBUbJw1Anz54zlXkWz870sBPM1aCec6VXG5fNW8UwYDz/LAxyMYGeNu4MZvDZ9f6IgA0TrEdEgPyVF6+GU/e9o5r5b+fsxB2ZV5un4j9himTf1OObyN+lt0h2duu31ebxDGdULfDc11Op+QCt3BvvcQlcGs5Smbwc2nKwHdMnNx3GeXOn6i6gF+nzls2cHRwLbEiQOso8I6hD+t6p60KpqQMNUZ7eK9lXq9wi05jDoFUEMfQS/bsV4YMJhhCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjvfR8WM8R/jekv6hiUozfWeApJkx3t6d307gXR55Ak=;
 b=AszivMYJc/4hfOowIph0VKEeASDCgwrk744pFr+CLHt3V2FxWJvd4SPA+uOl98C2O15LJ8eq+k8fA65bFNlhaF/HHtJI1M4YBCASr7js0bANXalrzOZzOmVeYMlkrDUhr6uXrupuP9flMG/pYU5jJUFGDciv8EWnwjMRAKk+R5rhY8WW8TbSJgIYKIWFwm6udTsbKOT7jDP8nSR7mk2JQ45dsCm1kL9el23MvoJvI9xOvwAZsvrSHCk2OzUaZFSySr08PWA/EV29IMP4SbHh+XlhSBTy9L3PJOg6H1JDZ9tpfbDOVlWqKGlpo6SoIn9up6T2dkUMSyZ1JvjVifyL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjvfR8WM8R/jekv6hiUozfWeApJkx3t6d307gXR55Ak=;
 b=pPuIcpkmBKHyM2GxI80ddzdB98c3vMfiZnZ6bWw0Oqvno914tbM9jb8XsBUQb7dOokskPkRgDO4yWo803/KdJEj1oLAQaRJUZwt7GyXq01jYFEzERFWz9VTkSlFyIeGn50U573Tf3I9Nr9xObQVavLKXdhqhDPdnB7ucUdEXIBU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3030.eurprd08.prod.outlook.com (2603:10a6:209:46::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 10:10:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Wed, 10 Feb 2021
 10:10:41 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
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
 <dad2a202-430e-f430-6cfd-1c75fd3f2549@virtuozzo.com>
 <d7387da7-fb53-5d58-7ddf-4bf469e6526c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f2f754df-9dc6-2be8-e819-38ce8f5fc463@virtuozzo.com>
Date: Wed, 10 Feb 2021 13:10:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <d7387da7-fb53-5d58-7ddf-4bf469e6526c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.242]
X-ClientProxiedBy: AM4PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:200:42::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.242) by
 AM4PR0701CA0020.eurprd07.prod.outlook.com (2603:10a6:200:42::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend
 Transport; Wed, 10 Feb 2021 10:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19b25c17-675d-4290-9a03-08d8cdac1f1a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB30307F1DD4F6C080504A0761C18D9@AM6PR08MB3030.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPYbpM9x2EqsDrwPXbKB+C84btp3VcR19/ZLiIoAjar8Fcs41eUGTf/yv/odDOffZF3Kx+eYFz8F3TP5omO4raUx03EdXYiUYqVZEB4EIXmiVtoyYjjnzWoePdJ1nO/6fLfnkQRc9Do9IMOk0dYK77SVO5JEho4teHnoa/z/noDRGj8M6VA9Xm8/L84XfLZA0qVtuEv3lye6sNOOHSMRnkpYa0CnE2YJ4kL8sI13rnB0YxjOCtky1qfD/g066H9mWEATD1+t1//H/a0fhYDGjxBsEzfkJ1cOctIyV6fQJBg/vIOLKtKroWeT9YyqmsQpV2S3VJLPN8JYI9Gyi+NUy68J0hdTKMoK5hgCnfBBlcrsKyLof08FxyuTN6X0vhozxpAZXrpOrdSuSa0DqlfsD/RsjvhNGujx08lGRtvHRFdtjQVthif/XLmwOMgsY9eBEtc/iYqqilnDPzJ4fqeK7i+ISttzlzqNFmBGZ/9TtAg4lzhq90gwV3WlNKZpdNq19IMEuIuwAI550esEk4Xi2h990py1DAyhyXP62W+dkafn+zPyiZM9ldHPfwi5/jAD+nC/NNnhm/Op3i7t01bKdpL67IsnyyVK1lZfhs0ccnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(956004)(36756003)(2616005)(186003)(52116002)(16526019)(83380400001)(478600001)(26005)(4326008)(2906002)(316002)(53546011)(5660300002)(6486002)(110136005)(30864003)(66556008)(66476007)(66946007)(16576012)(8936002)(31696002)(8676002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHNrNFZRYTh1WThVbFBXQVVYWC9WeHJVQTBzSm9vU2MzMjB4cHRlS0x0K2xE?=
 =?utf-8?B?SmlsU29SUWFHVjkzMHlrUUc0RVo0OExyWEpVT3k3Y1JmNkVGbkJPTzdsTFBv?=
 =?utf-8?B?MFRuaWhRU1JjaVdQelhMZjVaNzJac2xkT0FIbEEvaGRxZ2M4azhyd1FNUElx?=
 =?utf-8?B?ejFSSlpsWk5wMUgxN2ptdjJkNTlFMk50MHhkaVYrZ2J4YUM4RjBlVXFTY1JC?=
 =?utf-8?B?ek5DWTNteGp4VlNqSVRRMEVMMFJvQUJyT2R4VHgwRm9kdGRlYUt0WGJwdjFp?=
 =?utf-8?B?R0NxTmpVVzhKQlpiUlJvVmtlNWh5VmxMKy9LOGdGWHI4alFMN3l3K2lIRGZm?=
 =?utf-8?B?eitPbWlaMm1MLzUreWE2OXQ2MkNKcVE0T0tFYWJaSWQxMElUZXM1WDJidERt?=
 =?utf-8?B?WUp1c2IzUjdtdDdQUElBeDFqaWVzdDVyZkF2TXpXWnJBRTBTNzY4MmNVbDgw?=
 =?utf-8?B?UkRVc1VuVjFaRXhsdDBEOXdLNFNHQTJuNkM0RUpWUEdQWUx6U3RRdWZHY1o4?=
 =?utf-8?B?N1hNQmQwYjNuZC9ZRUZjMEg4V0lLUEY3cU1yMUw2ZTc3Qlk3bUozMDhJWDNG?=
 =?utf-8?B?cUtDSHdPaXBnRm9rdlVtZVpWbXlNTi9xZ2NnNmoxVVNRUFJ1aFovZHRuYUJv?=
 =?utf-8?B?VlVFNkRPWXRxaXZOSGsyVFZ6bG9scDAyTGdtS0RONSsxdGRxUFFFQ0pzU0Nt?=
 =?utf-8?B?Y2JxcHU2YUpqNWpacWwrOWppaDB6TUNSNmR4MStjZHJXS3RSOUdvQWNNbGlY?=
 =?utf-8?B?ZlBTdnJSZlJUNit1NmExWUFXSERGOVNFNXZMV3QrenhHZTZzdWNGeWhLM01z?=
 =?utf-8?B?eHhsajNuekF5cDYvUSt6U00xZjVBYy9qY3I3R0JZV3V5TDkrL0pSTExrRVlF?=
 =?utf-8?B?dlhBSkVueXg3OHNxVW5Obm81cnRUbUt2Y2d0Q2YvbFVJdmUycnlqODYwdU9h?=
 =?utf-8?B?V0hLZjI3SXNDSlZWRDZqM1Y3eTVSUk1hVWpSU2NCK2FsSHgyR1E3ZHhCN2Jh?=
 =?utf-8?B?N2NHSEFGVUNsSURkSmR1OXY2VlB4QTIrc01vME5SQ051TXZ3YzA0OXRTSDFR?=
 =?utf-8?B?eWpkRDFDeG5CS1hvTWV6NDFnUmNWanVYWHpRQXcwQWJhb0RGeTZKZ3FCUXJR?=
 =?utf-8?B?dGpnVmp6aGV6YU1yK0JBc0lCRms1NjZHeHRGV2JNemhmYXJQalJjT2w3RFd0?=
 =?utf-8?B?bnhUTjFFRi9XMjE2bGVicnp2ZXhhSVBwWjlkQk1VSVpVY1BVNFl6ZnRZSHpR?=
 =?utf-8?B?aXc4Rk9EazdzU3I5ZGtBeUVMK3Q5MzNSZ2d0aXJoS25PejhpdWVjWEZQZGRK?=
 =?utf-8?B?ZDBYNllNTUxwL0pRTmxhaTc0RTl0MGZCa25raFR4aFdIUDg4U2hQYlJqQ0x1?=
 =?utf-8?B?eHNueU0xOXdub3YzZkxyUVV1Q2R1bFp6d3pmTExnZmtmZDFKYzRSZHQ1RmZP?=
 =?utf-8?B?RjM1SjRtbVRabU4xd0ZUTUE2L1ZFM1ZPVHNObHVBTVVtNDlVazhXSUpDVWF6?=
 =?utf-8?B?TTJXYXJJd3FvMytzc3dxUEZPQ25jMDhUS3YwTm9CUG5yK3RIZHJqczJtNTdX?=
 =?utf-8?B?ZFVGVVdrUWdpbmRTRllPbzZNblhTcy9yRmUraXVsaWloYW9BdDBVdTVEQndY?=
 =?utf-8?B?REp2cDZ6MkQ1a25FOGFzaXBpOUN5WXhONkdWTzNnT2RFU0czY0ozdi9WaUly?=
 =?utf-8?B?SU5YV3J3MkpIRVFQNTlVd0RLaWVZN1d3b3JMSWcxY2FWS1hsbmF1c1MyME9W?=
 =?utf-8?Q?Ots+aeQgfW+9umxIugt/FMz7/ISB48i3YeKCAcu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b25c17-675d-4290-9a03-08d8cdac1f1a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 10:10:41.5330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jb6HDKfIWcqOs5mdk7rnkhQFjKX4VGoqZRHuUVBfUScn7ijjvla1F7HAz8VBO89RvHPdTI0PQgmz0Z8qSvLc8WOKp/IllN7RINMfqWjpgts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3030
Received-SPF: pass client-ip=40.107.1.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

10.02.2021 13:00, Max Reitz wrote:
> On 09.02.21 19:51, Vladimir Sementsov-Ogievskiy wrote:
>> 09.02.2021 21:41, Denis V. Lunev wrote:
>>> On 2/9/21 9:36 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 09.02.2021 19:39, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 09.02.2021 17:47, Max Reitz wrote:
>>>>>> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> 09.02.2021 16:25, Max Reitz wrote:
>>>>>>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>> Hi all!
>>>>>>>>>
>>>>>>>>> I know, I have several series waiting for a resend, but I had to
>>>>>>>>> switch
>>>>>>>>> to another task spawned from our customer's bug.
>>>>>>>>>
>>>>>>>>> Original problem: we use O_DIRECT for all vm images in our
>>>>>>>>> product, it's
>>>>>>>>> the policy. The only exclusion is backup target qcow2 image for
>>>>>>>>> compressed backup, because compressed backup is extremely slow with
>>>>>>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>>>>>>> produces a lot of pagecache.
>>>>>>>>>
>>>>>>>>> So we can either implement some internal cache or use fadvise
>>>>>>>>> somehow.
>>>>>>>>> Backup has several async workes, which writes simultaneously, so
>>>>>>>>> in both
>>>>>>>>> ways we have to track host cluster filling (before dropping the
>>>>>>>>> cache
>>>>>>>>> corresponding to the cluster).  So, if we have to track anyway,
>>>>>>>>> let's
>>>>>>>>> try to implement the cache.
>>>>>>>>
>>>>>>>> I wanted to be excited here, because that sounds like it would be
>>>>>>>> very easy to implement caching.  Like, just keep the cluster at
>>>>>>>> free_byte_offset cached until the cluster it points to changes,
>>>>>>>> then flush the cluster.
>>>>>>>
>>>>>>> The problem is that chunks are written asynchronously.. That's why
>>>>>>> this all is not so easy.
>>>>>>>
>>>>>>>>
>>>>>>>> But then I see like 900 new lines of code, and I’m much less
>>>>>>>> excited...
>>>>>>>>
>>>>>>>>> Idea is simple: cache small unaligned write and flush the cluster
>>>>>>>>> when
>>>>>>>>> filled.
>>>>>>>>>
>>>>>>>>> Performance result is very good (results in a table is time of
>>>>>>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>>>>>>
>>>>>>>> “Filled with ones” really is an edge case, though.
>>>>>>>
>>>>>>> Yes, I think, all clusters are compressed to rather small chunks :)
>>>>>>>
>>>>>>>>
>>>>>>>>> ---------------  -----------  -----------
>>>>>>>>>                    backup(old)  backup(new)
>>>>>>>>> ssd:hdd(direct)  3e+02        4.4
>>>>>>>>>                                   -99%
>>>>>>>>> ssd:hdd(cached)  5.7          5.4
>>>>>>>>>                                   -5%
>>>>>>>>> ---------------  -----------  -----------
>>>>>>>>>
>>>>>>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>>>>>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>>>>>>>> cache by default (which is done by the series).
>>>>>>>>
>>>>>>>> First, I’m not sure how O_DIRECT really is relevant, because I
>>>>>>>> don’t really see the point for writing compressed images.
>>>>>>>
>>>>>>> compressed backup is a point
>>>>>>
>>>>>> (Perhaps irrelevant, but just to be clear:) I meant the point of
>>>>>> using O_DIRECT, which one can decide to not use for backup targets
>>>>>> (as you have done already).
>>>>>>
>>>>>>>> Second, I find it a bit cheating if you say there is a huge
>>>>>>>> improvement for the no-cache case, when actually, well, you just
>>>>>>>> added a cache.  So the no-cache case just became faster because
>>>>>>>> there is a cache now.
>>>>>>>
>>>>>>> Still, performance comparison is relevant to show that O_DIRECT as
>>>>>>> is unusable for compressed backup.
>>>>>>
>>>>>> (Again, perhaps irrelevant, but:) Yes, but my first point was
>>>>>> exactly whether O_DIRECT is even relevant for writing compressed
>>>>>> images.
>>>>>>
>>>>>>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much
>>>>>>>> sense for compressed images, qemu’s format drivers are free to
>>>>>>>> introduce some caching (because technically the cache.direct
>>>>>>>> option only applies to the protocol driver) for collecting
>>>>>>>> compressed writes.
>>>>>>>
>>>>>>> Yes I thought in this way, enabling the cache by default.
>>>>>>>
>>>>>>>> That conclusion makes both of my complaints kind of moot.
>>>>>>>>
>>>>>>>> *shrug*
>>>>>>>>
>>>>>>>> Third, what is the real-world impact on the page cache?  You
>>>>>>>> described that that’s the reason why you need the cache in qemu,
>>>>>>>> because otherwise the page cache is polluted too much.  How much
>>>>>>>> is the difference really?  (I don’t know how good the compression
>>>>>>>> ratio is for real-world images.)
>>>>>>>
>>>>>>> Hm. I don't know the ratio.. Customer reported that most of RAM is
>>>>>>> polluted by Qemu's cache, and we use O_DIRECT for everything except
>>>>>>> for target of compressed backup.. Still the pollution may relate to
>>>>>>> several backups and of course it is simple enough to drop the cache
>>>>>>> after each backup. But I think that even one backup of 16T disk may
>>>>>>> pollute RAM enough.
>>>>>>
>>>>>> Oh, sorry, I just realized I had a brain fart there.  I was
>>>>>> referring to whether this series improves the page cache pollution.
>>>>>> But obviously it will if it allows you to re-enable O_DIRECT.
>>>>>>
>>>>>>>> Related to that, I remember a long time ago we had some discussion
>>>>>>>> about letting qemu-img convert set a special cache mode for the
>>>>>>>> target image that would make Linux drop everything before the last
>>>>>>>> offset written (i.e., I suppose fadvise() with
>>>>>>>> POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact
>>>>>>>> that implementing a cache in qemu would be simple, but it isn’t,
>>>>>>>> really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One
>>>>>>>> advantage of using that would be that we could reuse it for
>>>>>>>> non-compressed images that are written by backup or qemu-img
>>>>>>>> convert.)
>>>>>>>
>>>>>>> The problem is that writes are async. And therefore, not sequential.
>>>>>>
>>>>>> In theory, yes, but all compressed writes still goes through
>>>>>> qcow2_alloc_bytes() right before submitting the write, so I wonder
>>>>>> whether in practice the writes aren’t usually sufficiently
>>>>>> sequential to make POSIX_FADV_SEQUENTIAL work fine.
>>>>>
>>>>> Yes, allocation is sequential. But writes are not.. Reasonable, I
>>>>> should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for
>>>>> the whole backup target before the backup? Will try. Still, I expect
>>>>> that my cache will show better performance anyway. Actually,
>>>>> comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e.
>>>>> 20% faster, which is significant (still, yes, would be good to check
>>>>> it on more real case than all-ones).
>>>>>
>>>>>>
>>>>>>> So
>>>>>>> I have to track the writes and wait until the whole cluster is
>>>>>>> filled. It's simple use fadvise as an option to my cache: instead
>>>>>>> of caching data and write when cluster is filled we can instead
>>>>>>> mark cluster POSIX_FADV_DONTNEED.
>>>>>>>
>>>>>>>>
>>>>>>>> (I don’t remember why that qemu-img discussion died back then.)
>>>>>>>>
>>>>>>>>
>>>>>>>> Fourth, regarding the code, would it be simpler if it were a pure
>>>>>>>> write cache?  I.e., on read, everything is flushed, so we don’t
>>>>>>>> have to deal with that.  I don’t think there are many valid cases
>>>>>>>> where a compressed image is both written to and read from at the
>>>>>>>> same time. (Just asking, because I’d really want this code to be
>>>>>>>> simpler.  I can imagine that reading from the cache is the least
>>>>>>>> bit of complexity, but perhaps...)
>>>>>>>>
>>>>>>>
>>>>>>> Hm. I really didn't want to support reads, and do it only to make
>>>>>>> it possible to enable the cache by default.. Still read function is
>>>>>>> really simple, and I don't think that dropping it will simplify the
>>>>>>> code significantly.
>>>>>>
>>>>>> That’s too bad.
>>>>>>
>>>>>> So the only question I have left is what POSIX_FADV_SEQUENTIAL
>>>>>> actually would do in practice.
>>>>>
>>>>> will check.
>>>>>
>>>>
>>>> Checked that if I mark the whole file by FADV_SEQUENTIAL, cache is not
>>>> removed.
>>>>
>>>> Test:
>>>> [root@kvm fadvise]# cat a.c
>>>> #define _GNU_SOURCE
>>>> #include <fcntl.h>
>>>> #include <unistd.h>
>>>> #include <stdio.h>
>>>> #include <getopt.h>
>>>> #include <string.h>
>>>> #include <stdbool.h>
>>>>
>>>> int main(int argc, char *argv[])
>>>> {
>>>>      int fd;
>>>>      int i;
>>>>      char mb[1024 * 1024];
>>>>      int open_flags = O_RDWR | O_CREAT | O_EXCL;
>>>>      int fadv_flags = 0;
>>>>      int fadv_final_flags = 0;
>>>>      int len = 1024 * 1024;
>>>>      bool do_fsync = false;
>>>>
>>>>      for (i = 1; i < argc - 1; i++) {
>>>>          const char *arg = argv[i];
>>>>
>>>>          if (!strcmp(arg, "direct")) {
>>>>              open_flags |= O_DIRECT;
>>>>          } else if (!strcmp(arg, "seq")) {
>>>>              fadv_flags = POSIX_FADV_SEQUENTIAL;
>>>>          } else if (!strcmp(arg, "dontneed")) {
>>>>              fadv_flags = POSIX_FADV_DONTNEED;
>>>>          } else if (!strcmp(arg, "final-dontneed")) {
>>>>              fadv_final_flags = POSIX_FADV_DONTNEED;
>>>>          } else if (!strcmp(arg, "fsync")) {
>>>>              do_fsync = true;
>>>>          } else {
>>>>              fprintf(stderr, "unknown: %s\n", arg);
>>>>              return 1;
>>>>          }
>>>>      }
>>>>
>>>>      fd = open(argv[argc - 1], open_flags);
>>>>
>>>>      if (fd < 0) {
>>>>          fprintf(stderr, "failed to open\n");
>>>>          return 1;
>>>>      }
>>>>
>>>>      if (fadv_flags) {
>>>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_flags);
>>>>      }
>>>>      for (i = 0; i < 100; i++) {
>>>>          write(fd, mb, len);
>>>>      }
>>>>      if (fadv_final_flags) {
>>>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_final_flags);
>>>>      }
>>>>      if (do_fsync) {
>>>>          fsync(fd);
>>>>      }
>>>>
>>>>      close(fd);
>>>> }
>>>>
>>>>
>>>>
>>>> [root@kvm fadvise]# gcc a.c
>>>> [root@kvm fadvise]# rm -f x; ./a.out seq x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>   100M 25600  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out dontneed x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>   100M 25600  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>    36M  9216  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out seq fsync x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>   100M 25600  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out dontneed fsync x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>   100M 25600  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed fsync x; fincore x
>>>>    RES PAGES  SIZE FILE
>>>>    36M  9216  100M x
>>>> [root@kvm fadvise]# rm -f x; ./a.out direct x; fincore x
>>>> RES PAGES SIZE FILE
>>>>   0B     0   0B x
>>>>
>>>>
>>>>
>>>> Backup-generated pagecache is a formal trash, it will be never used.
>>>> And it's bad that it can displace another good pagecache. So the best
>>>> thing for backup is direct mode + proposed cache.
> 
> What a shame.
> 
> Thanks a lot for testing.
> 
>>> I think that the original intention of Max is about POSIX_FADV_DONTNEED
>>> One should call this fadvise for just fully written cluster.
> 
> I had hoped that SEQUENTIAL would just work, magically.
> 
>> This should work, but:
>>
>>   - as we see from test above, POSIX_FADV_DONTNEED don't remove the whole cache (see final-dontneed)
>>   - as I said we'll have to track writes, so the cache will be the same, just instead of postponed-write operation we'll do fadvise.
>>
>> Hmm. Still, in this way, we will not need some difficult things in my proposed cache.
>>
>> So, it may be reasonable to at least split the big patch so that
>>
>>   - first part brings writes / full-cluster tracking and fadvice
>>
>>   - second part adds caching-wrties option, corresponding flush code and additional performance
>>
>> Does it make sense?
> 
> I think the fadvise solution would have been nice if it gave us something magical that we could also use for normal qemu-img convert (or backup) operations, but as that doesn’t seem to be the case, I don’t think it makes too much sense to implement something like that.  (I imagine doing fadvise also creates the need to implement new block to call into file-posix and so on.)

Actually, with any kind of qemu-img convert, we shouldn't benefit of pagecache, as we write with large enough good aligned chunks. So probably all such tasks should prefer O_DIRECT mode to not produce extra pagecache. And in this way my patch helps for compressed qemu-img convert with target opened in O_DIRECT mode as well. So instead of using fadvise for all such tasks, we can use O_DIRECT for all of them, having compression powered by compressed-cache to work well with O_DIRECT.

> 
> I’d propose I take some time to look at your patch as-is and then I report back.
> 

Thanks!


-- 
Best regards,
Vladimir

