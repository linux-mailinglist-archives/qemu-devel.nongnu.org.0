Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C597731563F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:46:55 +0100 (CET)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y2I-00046L-SU
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9Xsb-0005Q7-HX; Tue, 09 Feb 2021 13:36:54 -0500
Received: from mail-db8eur05on2092.outbound.protection.outlook.com
 ([40.107.20.92]:26400 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9XsW-0001wx-CB; Tue, 09 Feb 2021 13:36:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9UOZesC5+dmdu/920jWLpNSigE2m40EfrXo9siEkvWmcZtdmEk3lp6EcHe9azmUBA5AvaQwmiQ6jqyD1USlgJx5TJiHsqiJ/tSvXKty0N60jQqp3mr2yHVGFrbramJtUjXn7PV25K9etfhSuzE9hbQ/2nIxY3QBACNjc6/lFONjRoP82AOQJRzlIya+nP/NLGVCVAW3bQwSWKCbj1xuxx91FIybt304ooPPqddBzJJs/93AE5mLK67WTFHtGzKz05odFF9JdWgD2e6VCCdzOEf+YRz8r7lCqsAl8IyiSYTqHbvaqh40y/N5d/Ck6I8Ux+j5oWbXyDU7x7a69eKp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjR1C0VVd55gupgUYNBIm6kCWQuqg/RiV1ljIkVGbCA=;
 b=mlp+TX5+4S+CKuzQJUjupXPAKqv7JZIYFZDKa7F5FPupEUujo7JWZWeJEKtVpxbZMDoniFb+w1nUIxg71oGhsuhFd8dGJNnd60H21UYa6IHGSqYp905J/+k5OPclBG/R31Yt+p4fZ3/XaTFFYVvJU+O1LmWxaaIS3nUqiSFLLoGyd02LkKkb6znX/2tPeDDnUWC0VyCnlC7+Y2EmATasqarv/15t+p9Cr8Mtyxbr35BIHvb/tkjbcadUrO14ah2/sFs9Zlb1Wvpa/W+EP5MNE31T6d8koTYLgq+HWFqPQh31dZn+cbRVaApqaIhbyM0BaCr8wdqLcdeYcK5weFM+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjR1C0VVd55gupgUYNBIm6kCWQuqg/RiV1ljIkVGbCA=;
 b=cR8nXWIDZ60lhZScy+fyEKxyRTGF+K5VHzw3FYrYUJ+fSzHVOOC1OeCb+UPphm2lVx0ltmyOYMdmIovlgbLrJGvgIUlAS65qrvM40DW4TcTPphTFCoZgSaebCb/xLkPK6l5dOl5OfpZ4moABvapSIo6etwKIYL8hYYdMAfHnLng=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6055.eurprd08.prod.outlook.com (2603:10a6:20b:293::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 18:36:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 18:36:45 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
 <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
Message-ID: <1b4ad0ed-e1a7-d592-cb76-8a204fbbd585@virtuozzo.com>
Date: Tue, 9 Feb 2021 21:36:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM9P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM9P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Tue, 9 Feb 2021 18:36:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e2ab9be-04f2-4d00-e9e5-08d8cd29a6e0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60550DA392DA9B4CF3AB8BFBC18E9@AS8PR08MB6055.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAEzg9hg24Bjzv/vZq5H9zxhvkOfjpUloyRZsOq5/NtZr8g7ce5K3mMNP/iM0PaJB1xhaGLI9cI/dH+FNd7Dn8oJmz3Lsr/Ie6ec65umQcdAZHh6QqzU3AugijLwS8D7k28OxmfNxGpT4s2tNekT+4THQ7a3ZbtpzZLMe1PpIBNHnZ00VVmY3UJVVIJV9wRSkKuCZo37ieKknE9zIJRFI2i2VLMDsw7UWsnXBnRhUmwU+xZDlU3jQUMVBXkcdYSc8Xcz0hCjiiBMIy4t6ruc0lU4bnnZgRwEJKF9ZeW53Wp2Pl9KnijkMm6Atxgb7/CsQ+mTZ9jor87xwctFD0a5NwOVDRwpWMtTDHLRMD9Ikzc4adLGVb0wWEL4QFnxlLhVa4XeH4oZJwEfPF4o0by4WL8kOJEbHt+EyhyIoEFS8uUCwTRgbAR6M7JiwXlt8AyVc562nhm/g9GOrvX0uhrh+Dwc3KJg4keryRoKigLRptEQKYum+HYVnWf1wduLaYvorqEt7a9waz4ZIakM8zZp/qCOl5TXzHTFNjYFiYFze1hPa62DtuTN+HSl3sPHyYMWtlrK9SkELsNLBYWr1GOi9Hbb3K/G+RriJnXGqZCvXQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(66946007)(31696002)(8676002)(8936002)(16576012)(6486002)(5660300002)(66556008)(66476007)(31686004)(86362001)(83380400001)(36756003)(16526019)(186003)(52116002)(956004)(2616005)(53546011)(2906002)(316002)(107886003)(26005)(4326008)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1VENE81dkFRYUlqc1dERVFBNDI4SndCVi81QlZIRUY5a09nb0ZSaHppeFpJ?=
 =?utf-8?B?Sm5zOEdSU2JZSXBmUW9vL3Z0VUxTNlNOUTBzdG4rWUdIa2hXeXFvM0RXdlBm?=
 =?utf-8?B?Zk1CN0pMcW05Q21mbngybnhrN0pyb3NvUitmeFVjUXA4d2pNTGJEQ004aWl6?=
 =?utf-8?B?ZTl0VlY3UGxHUFl0THd1VU5reDhtUzdtR1p1a2JOZ0FLYTg2YVo3d2R4Nkd2?=
 =?utf-8?B?MTBDdWpYRmUwaG5RTklqb0pXd1FabVJjMDl1a2g3bzQzSGdGMjNSUUZzUUY2?=
 =?utf-8?B?azFuYlBxYTUvRC9Ud1o0QXI1N3Nzd1YwdHZka3IyOEUyTGNtdkQ2aDR2R015?=
 =?utf-8?B?ZGJ1Ym42anJqR0NpUkVSSFo2ZWxBV1ZlU0xzZXRORlpwNm9lSWYrcUtsSnlM?=
 =?utf-8?B?RFZzQTVVTjdiS296UjgyU3NiWnB1MUtEbmN2ekcxRWViMFkzWE5NekdqVWJ5?=
 =?utf-8?B?ZGIrdm9acUN3SmdVRnQrRWVQRnJ3Sm0vUUdsTjkrMjRlR1RvcEFQVGJsaVlI?=
 =?utf-8?B?UVBienlHYzlYaW55cHJJeHFBd21hc2NsTkxNWlpOVU04eW15TXk5SzVoaUEy?=
 =?utf-8?B?dWJ1YnNQMUE1NXdBMG5MMkpLdzhYdEEvM3BIc1pvKy80a2VGUDlCK1NEZDlW?=
 =?utf-8?B?N3F4OE1WODYrblI0Tjl0Mk9nSGd2Nng1b0didWRsTFpIc1NXRXYyMXFLZldu?=
 =?utf-8?B?Z1Fwd095aDdQaGQrNVM1MEN1V2NKOUF2U3JyNnJZaGl6RGx1NWpFRXh4T0xM?=
 =?utf-8?B?MURDNjYvc0FkY3dHMFdqRHQvdWduRFp1Ui9FTlJmZklTYTA0L2xHZXl2UHl5?=
 =?utf-8?B?VHdjMk9CUnJJck9BSUh5UmE5TkZrbVE3S293UndGSUIwbXpENVQzdHBHZ0Vu?=
 =?utf-8?B?eVUxdkFKaElwaHdlUFhZR25PK3JpYXdCcW1sSUkxcXlkdEtpL25oVi9HM3Bq?=
 =?utf-8?B?R29YNTNoM2JzT0pYbHZ6ZjdVN3RTeDBXd2U0djhjcTc1TEkwSEpscXVDWW1B?=
 =?utf-8?B?TDFwT1p2L0ZjNzA0WmFrcnZxdjFNdVZFdjdjWGI5eUh6M2xTR1ZTMERpUTMx?=
 =?utf-8?B?ZktDa3lxM0RsOVJWLytNMy94MEVaYUFCeTlNTlhzcTJBZ1lyQXM0dmdMajVF?=
 =?utf-8?B?SUNsOXZBd2RMc3hiaVlnWHg3bGtONmIrVGhwdXRTRDZlWlBCMFg5ZmRHWDdW?=
 =?utf-8?B?YVZrTWhLSm9ROVBjbWFSSzBqUkc5enQ3K1h6L3lvaGlyR3A0OTZoSkc4TCtP?=
 =?utf-8?B?UDNmL1p5Z3orZGNhZklkdDNiUzBLZjFIRkVsYzEyRzBxayt5bFZOY3lGcEJi?=
 =?utf-8?B?R1g2Z1NtRVpiaUZCNXpGY1FjOUJ1TG9PWEVIRXBILzJHWWJ2YStkbzl1a3FU?=
 =?utf-8?B?NkdzTlNvRTdTRm1abWZFZnBsVVZOMmFuSHZReHMyV0tXSkZEcWVqUGowSHkr?=
 =?utf-8?B?WVduWUVLUkVyL09tRjhmM2tMUXl1bzFSUmNCUjJuSnlYNHFzUi80MnZSeWF2?=
 =?utf-8?B?ek9OelJ2bWhVVXA3a0NIbW1aK2Rtcm9MaER5SENneXQ3OTl0TVJpSlZORCty?=
 =?utf-8?B?bmRPRS9CUzBWbkovUzc2V0RJTGU2UXQzd3JGbXF5SjlyenRRZHF6VVFBNGpk?=
 =?utf-8?B?NzlEdnFmcCtpNldNRWRkS3ZEblVRaHdnOExZTjhaR2l6MmNlb2RjVGxRcVJE?=
 =?utf-8?B?dUV2TDlEVXZwcWdvUEFqcjduRDVrOVFUbXYxQkhWMXpsNWZGdjRRSHZKZGdD?=
 =?utf-8?Q?XKM0Qa4GSs0es5QDGaDaV814SS1ieARm4VzTkun?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2ab9be-04f2-4d00-e9e5-08d8cd29a6e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 18:36:45.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRjxNVcgRRQdxCcprY+vAUPmWh0cwmXJvvYaU8JJNbVMfUSS+mnlUUYM2ScGv9frSY2vm6j+aHzL6zy5CbrEpb7giqo0vMCiPI4CNVCRcJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6055
Received-SPF: pass client-ip=40.107.20.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

09.02.2021 19:39, Vladimir Sementsov-Ogievskiy wrote:
> 09.02.2021 17:47, Max Reitz wrote:
>> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>>> 09.02.2021 16:25, Max Reitz wrote:
>>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi all!
>>>>>
>>>>> I know, I have several series waiting for a resend, but I had to switch
>>>>> to another task spawned from our customer's bug.
>>>>>
>>>>> Original problem: we use O_DIRECT for all vm images in our product, it's
>>>>> the policy. The only exclusion is backup target qcow2 image for
>>>>> compressed backup, because compressed backup is extremely slow with
>>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>>> produces a lot of pagecache.
>>>>>
>>>>> So we can either implement some internal cache or use fadvise somehow.
>>>>> Backup has several async workes, which writes simultaneously, so in both
>>>>> ways we have to track host cluster filling (before dropping the cache
>>>>> corresponding to the cluster).  So, if we have to track anyway, let's
>>>>> try to implement the cache.
>>>>
>>>> I wanted to be excited here, because that sounds like it would be very easy to implement caching.  Like, just keep the cluster at free_byte_offset cached until the cluster it points to changes, then flush the cluster.
>>>
>>> The problem is that chunks are written asynchronously.. That's why this all is not so easy.
>>>
>>>>
>>>> But then I see like 900 new lines of code, and I’m much less excited...
>>>>
>>>>> Idea is simple: cache small unaligned write and flush the cluster when
>>>>> filled.
>>>>>
>>>>> Performance result is very good (results in a table is time of
>>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>>
>>>> “Filled with ones” really is an edge case, though.
>>>
>>> Yes, I think, all clusters are compressed to rather small chunks :)
>>>
>>>>
>>>>> ---------------  -----------  -----------
>>>>>                   backup(old)  backup(new)
>>>>> ssd:hdd(direct)  3e+02        4.4
>>>>>                                  -99%
>>>>> ssd:hdd(cached)  5.7          5.4
>>>>>                                  -5%
>>>>> ---------------  -----------  -----------
>>>>>
>>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>>>> cache by default (which is done by the series).
>>>>
>>>> First, I’m not sure how O_DIRECT really is relevant, because I don’t really see the point for writing compressed images.
>>>
>>> compressed backup is a point
>>
>> (Perhaps irrelevant, but just to be clear:) I meant the point of using O_DIRECT, which one can decide to not use for backup targets (as you have done already).
>>
>>>> Second, I find it a bit cheating if you say there is a huge improvement for the no-cache case, when actually, well, you just added a cache.  So the no-cache case just became faster because there is a cache now.
>>>
>>> Still, performance comparison is relevant to show that O_DIRECT as is unusable for compressed backup.
>>
>> (Again, perhaps irrelevant, but:) Yes, but my first point was exactly whether O_DIRECT is even relevant for writing compressed images.
>>
>>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much sense for compressed images, qemu’s format drivers are free to introduce some caching (because technically the cache.direct option only applies to the protocol driver) for collecting compressed writes.
>>>
>>> Yes I thought in this way, enabling the cache by default.
>>>
>>>> That conclusion makes both of my complaints kind of moot.
>>>>
>>>> *shrug*
>>>>
>>>> Third, what is the real-world impact on the page cache?  You described that that’s the reason why you need the cache in qemu, because otherwise the page cache is polluted too much.  How much is the difference really?  (I don’t know how good the compression ratio is for real-world images.)
>>>
>>> Hm. I don't know the ratio.. Customer reported that most of RAM is polluted by Qemu's cache, and we use O_DIRECT for everything except for target of compressed backup.. Still the pollution may relate to several backups and of course it is simple enough to drop the cache after each backup. But I think that even one backup of 16T disk may pollute RAM enough.
>>
>> Oh, sorry, I just realized I had a brain fart there.  I was referring to whether this series improves the page cache pollution.  But obviously it will if it allows you to re-enable O_DIRECT.
>>
>>>> Related to that, I remember a long time ago we had some discussion about letting qemu-img convert set a special cache mode for the target image that would make Linux drop everything before the last offset written (i.e., I suppose fadvise() with POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact that implementing a cache in qemu would be simple, but it isn’t, really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One advantage of using that would be that we could reuse it for non-compressed images that are written by backup or qemu-img convert.)
>>>
>>> The problem is that writes are async. And therefore, not sequential.
>>
>> In theory, yes, but all compressed writes still goes through qcow2_alloc_bytes() right before submitting the write, so I wonder whether in practice the writes aren’t usually sufficiently sequential to make POSIX_FADV_SEQUENTIAL work fine.
> 
> Yes, allocation is sequential. But writes are not.. Reasonable, I should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for the whole backup target before the backup? Will try. Still, I expect that my cache will show better performance anyway. Actually, comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e. 20% faster, which is significant (still, yes, would be good to check it on more real case than all-ones).
> 
>>
>>> So
>>> I have to track the writes and wait until the whole cluster is filled. It's simple use fadvise as an option to my cache: instead of caching data and write when cluster is filled we can instead mark cluster POSIX_FADV_DONTNEED.
>>>
>>>>
>>>> (I don’t remember why that qemu-img discussion died back then.)
>>>>
>>>>
>>>> Fourth, regarding the code, would it be simpler if it were a pure write cache?  I.e., on read, everything is flushed, so we don’t have to deal with that.  I don’t think there are many valid cases where a compressed image is both written to and read from at the same time. (Just asking, because I’d really want this code to be simpler.  I can imagine that reading from the cache is the least bit of complexity, but perhaps...)
>>>>
>>>
>>> Hm. I really didn't want to support reads, and do it only to make it possible to enable the cache by default.. Still read function is really simple, and I don't think that dropping it will simplify the code significantly.
>>
>> That’s too bad.
>>
>> So the only question I have left is what POSIX_FADV_SEQUENTIAL actually would do in practice.
> 
> will check.
> 

Checked that if I mark the whole file by FADV_SEQUENTIAL, cache is not removed.

Test:
[root@kvm fadvise]# cat a.c
#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <getopt.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
     int fd;
     int i;
     char mb[1024 * 1024];
     int open_flags = O_RDWR | O_CREAT | O_EXCL;
     int fadv_flags = 0;
     int fadv_final_flags = 0;
     int len = 1024 * 1024;
     bool do_fsync = false;

     for (i = 1; i < argc - 1; i++) {
         const char *arg = argv[i];

         if (!strcmp(arg, "direct")) {
             open_flags |= O_DIRECT;
         } else if (!strcmp(arg, "seq")) {
             fadv_flags = POSIX_FADV_SEQUENTIAL;
         } else if (!strcmp(arg, "dontneed")) {
             fadv_flags = POSIX_FADV_DONTNEED;
         } else if (!strcmp(arg, "final-dontneed")) {
             fadv_final_flags = POSIX_FADV_DONTNEED;
         } else if (!strcmp(arg, "fsync")) {
             do_fsync = true;
         } else {
             fprintf(stderr, "unknown: %s\n", arg);
             return 1;
         }
     }

     fd = open(argv[argc - 1], open_flags);

     if (fd < 0) {
         fprintf(stderr, "failed to open\n");
         return 1;
     }

     if (fadv_flags) {
         posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_flags);
     }
     for (i = 0; i < 100; i++) {
         write(fd, mb, len);
     }
     if (fadv_final_flags) {
         posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_final_flags);
     }
     if (do_fsync) {
         fsync(fd);
     }

     close(fd);
}



[root@kvm fadvise]# gcc a.c
[root@kvm fadvise]# rm -f x; ./a.out seq x; fincore x
   RES PAGES  SIZE FILE
  100M 25600  100M x
[root@kvm fadvise]# rm -f x; ./a.out dontneed x; fincore x
   RES PAGES  SIZE FILE
  100M 25600  100M x
[root@kvm fadvise]# rm -f x; ./a.out final-dontneed x; fincore x
   RES PAGES  SIZE FILE
   36M  9216  100M x
[root@kvm fadvise]# rm -f x; ./a.out seq fsync x; fincore x
   RES PAGES  SIZE FILE
  100M 25600  100M x
[root@kvm fadvise]# rm -f x; ./a.out dontneed fsync x; fincore x
   RES PAGES  SIZE FILE
  100M 25600  100M x
[root@kvm fadvise]# rm -f x; ./a.out final-dontneed fsync x; fincore x
   RES PAGES  SIZE FILE
   36M  9216  100M x
[root@kvm fadvise]# rm -f x; ./a.out direct x; fincore x
RES PAGES SIZE FILE
  0B     0   0B x



Backup-generated pagecache is a formal trash, it will be never used. And it's bad that it can displace another good pagecache. So the best thing for backup is direct mode + proposed cache.


-- 
Best regards,
Vladimir

