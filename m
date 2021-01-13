Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAD2F4CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:03:57 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgke-0000se-4C
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzggT-0008KT-QX; Wed, 13 Jan 2021 08:59:37 -0500
Received: from mail-eopbgr80139.outbound.protection.outlook.com
 ([40.107.8.139]:38528 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzggP-0000dU-9n; Wed, 13 Jan 2021 08:59:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDgto49MMSL5uAUwxOWYwTEnN7k59JOTKv+eOqQq5PlJ43cgkQbvO9QVpV6tEG/Is8rv7d8G7hF17vX5fHTp61QhlqmbGZZxECRi9+tR5EswV6pOn8VS33dhi3ISaF7Uz/0E4s7BLWpv5YxXTQrY46KH4CITGZvdMNvTeMjakgQvYERALJj2P1GihhBlqVnUERqlBLze61Sf7VJgS5bfT6TYEq4Q1RdfZigSMbu2YwTQfe8duBvuZBfAMiXymgwuqVZUOtdDP4amvlZ5oNqylY8wh/Kv3HhM0VcyYkDv8eHoaX5+YnH+rE3QSFTVRpBc0sRXFRyljcMZc7nU7LmQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HRhqbVhJ58B7mULOL+1aPVGQOQEnjZ1xBr/DeausWc=;
 b=dG0XvFYhgF6RklBtFL6mCRrYADmyQ+tLvMWOtfVuIsR8AEkgykxfA/Yo/wdQmv+3kz1b1/ChsVTXM4zNScNnEBtSxWv6MSRJMGZWsqxFRXXKQYB/FqTN9pC/2a+yvN4/FiGmdPqrCyQ7D5CAnK6495fQRgwJI854qeTiJC6ZPOeAnWlD8vMOgTyvA9t900PpK/NdGTFTKzaM9mErnLupERe8hbWYDgiMv0WtDdCIQa+kCQ8l+oBVjmEKYMfJ1tspK9FDaHgo+RMPFO+NxSnrvm+/+3aLQzaYHlki0j0K+xuN8RjWJRZj3lCGoBV+KEfwxCDPx+RObrZGcBphWatW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HRhqbVhJ58B7mULOL+1aPVGQOQEnjZ1xBr/DeausWc=;
 b=aeuzcdpNigYU/Ca+PD6lEDZUxtzJULC2dyxInjSMPLIAjKwX01FC6wAOef1MgSfIL6axvj5zVkUZRu9vXz/We29EE+9c2XqD9g+V6GZu20wDZf5RqR3JDnX+270S/Ie2Z/fWSHiIRVe4266fIo4Qi1jmFMX5vbUHYUjMxUpRBtw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 13:59:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 13:59:28 +0000
Subject: Re: iotest 129
To: Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
 <4474f468-dc8c-8e53-2d46-183823918863@virtuozzo.com>
 <22115060-4169-d979-3750-8a527914564a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b53c13cf-be73-815b-e7b1-42897375ddaf@virtuozzo.com>
Date: Wed, 13 Jan 2021 16:59:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <22115060-4169-d979-3750-8a527914564a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR02CA0206.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR02CA0206.eurprd02.prod.outlook.com (2603:10a6:20b:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 13:59:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 371d47bd-78b0-40f0-e189-08d8b7cb71c5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376E71E436E3CFDA864FBAFC1A90@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBCv9DzpkeNd2tnW8tJ2i7fgEgNSKtbQdhG9VmzzWsCJ4lXn4O67DBSQBdIF2kuDK581sOoIQUDdQ4bAc8mR+t82ltY+/X8X8yAy3PXTcdnyOgXOScrO5cMmJLGjxkK8oRMR4wrVXuUfnjhlYubv6Ycs2N1AHFHm7fCv+upUaBHt0Y5FZgoLuhzrVomRQJl1nK7rGXNriwyX2zTgMR6MoszcujZpJc7JuD01OQdztkORebOfQeZ+odFm5LRl4vUqvm3Shymnl3yic/26tm/O5FW1BOWhRde0bJik1til83tAVQCL7Vojvnxdj70sZZVTLd7SKkJBC/nIvKCa4dOiLzPiwmK7bfHgV2dQve4XvzivrBx3IBfqXkQP8e0adFXtByVii2yjWlJ7e5eNtJQcv+ELHBgddzw+ueHdQimHyNzeuZTljGlsNzIh5e86zUwWfkgN5YpOXRYNEiKJxdkP7Y9xCOV8Gzdb3KGAXtak7bXE8dPuqkzO9xPpF4X/Fnly+s55VxqMlTJqYoPgV+pynDX+m6R+nenx8MKLX7VA4L6Iik/acLnMLT+YhPCtrknA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(376002)(346002)(136003)(31696002)(186003)(16526019)(7116003)(6486002)(66946007)(52116002)(8936002)(83380400001)(31686004)(26005)(53546011)(110136005)(4326008)(5660300002)(54906003)(8676002)(16576012)(316002)(66476007)(956004)(2906002)(2616005)(66556008)(36756003)(86362001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTNKbVdCTlZXRmRvaWFkRmhsSU9HelBrbUdMYzVTcmVSeVkzdmJDTThIZ2c2?=
 =?utf-8?B?S3VsV0FNMml0bGRJUnhIZWR6TUpValpmVVE3VENxcVhZcEJFU1BrNFBybkxC?=
 =?utf-8?B?UmJiM29wczh2azZCajhxTFE5Q3hMU0JmUHVlQnE1bmc2VnpGOFpiOW81VVdH?=
 =?utf-8?B?UEFNOXlvaHd5alRVMmhSL3ZzZzVUaFVuU3MvYktMcWJIOUJoVmx3eDgzS1pR?=
 =?utf-8?B?STg5STl1YUQ5NEE5QnpEdDJGc01lNDdoSU9qOEJQVVRUOU5jeGRxR2YxYWgr?=
 =?utf-8?B?WWxIREpBOFJ3TWpBeGVRc2luNm83KzQ0aEh1bHdBYVFCK2M5alFxeXVWU0Vm?=
 =?utf-8?B?dHpLMzNWVXNTZVBPY0ZmTWtINTFHLzE4dTBaYTRLdkR5TFpqdldYVWFlMXVL?=
 =?utf-8?B?OHZlYUJOMXlWb2RKVXkwZVdFOGJKODVjWDd5TDVTMklSSTVJSWdJZStWcG9v?=
 =?utf-8?B?YUt5VFd2cGd1K3VPOFVlb1JvM05wR01GN3BmVDlDRmNKVXRjOUFFcnRYZE9Y?=
 =?utf-8?B?UEp4ZFIwQ01IcDlaZFpHMlVTVm9ZaU9teDBKS1BPZ3BtZXY1TXFkNGlaM0lR?=
 =?utf-8?B?bVZ1bk1TUGMyT3NSVE94UmVLNVRkUU9ybzc3TEdiYU9tdGVEd3BjMFUwaFh5?=
 =?utf-8?B?bDVseHI1SnVCWDJybm9pWUx3bjNzZzh4eExVbmI3NTVBZXlrNFIwMVRYV0cz?=
 =?utf-8?B?RjFBV2ZHaHBnR2FyMkowaSt6QWRIMDFBRmR0WkR1Q2NzN01LYkxveDBZQ1hU?=
 =?utf-8?B?b00vZjJUSzNPVHRpeVhZVmRqTUhDcTVad1dGelNLQklNQkdxQzJpdUJxaUxm?=
 =?utf-8?B?VlZBMlFyK3hHcUdQL01VV2dIWEVvdy9veFE5VVFTTlVVcjdvOEdSMDQwZTBO?=
 =?utf-8?B?TXVBNnYwL0JoNWQwTCsxakZKejFZbWhLcHBhS291UnFRSWNBNFNHSDFkUko0?=
 =?utf-8?B?Z1JNNVJhZmJVcWhQNzAyMlZBeWhqdEs1ZEZOandkeTJISnhUS3M1U3VFbG1L?=
 =?utf-8?B?Nmw2M1VjTW12SDNwd1RPYzc3OGIwMTBTa1dacE5zTzU5WVRxbzlLM3RmSlQr?=
 =?utf-8?B?Ly84cWJhZEF0cEhpSVBrS1d1aXYvZjJOUWJkN3FZVUFMSWd0dU12M0hSYUFW?=
 =?utf-8?B?R04vYnVkcXhCay9TUHFPUlFzWCtuRTNiendVUlVJaUF3bnRqUjlEZlkrRVBl?=
 =?utf-8?B?NnNWWlJVR0E3d082R3NGdC9ycVh2TWNuaEFQRUhnMm5ob0ovUHVkS3lWaTBS?=
 =?utf-8?B?MDIyRERNMzhZWnFUV2RqdWxMQlBVVkNvR0lOMVl0WjNOeU9vc3p0NHRUZFFD?=
 =?utf-8?Q?C8SuaPzwF8KcFsjgqyUA5+qqWB54LZm+nz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 13:59:28.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 371d47bd-78b0-40f0-e189-08d8b7cb71c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbunQx7DXrCzb/MNl7D4dRgTFeNcE1itCWgS1Xv0l9nbvEARqkHedxIQbxjWWA/xmX3maXYlCxD/RoiInl1dBoB6r8J9M1QOfj6O0JosVpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.8.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BIGNUM_EMAILS=0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 14:05, Max Reitz wrote:
> On 13.01.21 10:53, Vladimir Sementsov-Ogievskiy wrote:
>> 12.01.2021 20:44, Max Reitz wrote:
>>> Hi,
>>>
>>> tl;dr: I have some troubles debugging what’s wrong with iotest 129. It wants to check that 'stop' does not drain a block job, but to me it seems like that’s exactly what’s happening with the mirror job.
>>>
>>>
>>> For quite some time, I’ve had 129 disabled in my test branch because it fails all the time for me.  Now it came up again in Vladimir’s async backup series, and so I tried my hands at debugging it once again.
>>>
>>> Recap: 129 writes 128M to some image, then runs a block job from there (while the source drive is supposedly throttled), then issues a stop command, and checks that the job is not drained.  I.e., still running.
>>>
>>> (It checks the “running” state via @busy, which is probably wrong; it should verify that @state == 'running' (which wasn’t available back in 2015), but that’s not really why I’m writing this mail.)
>>>
>>> Like the last time I tried
>>> (https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html) I can see that block jobs completely ignore BB throttling: If you apply the attachment show-progress.patch, you’ll probably see some progress made while the test waits for five seconds.  (Here, on tmpfs, mirror and commit get to READY, and backup completes.)
>>>
>>> OK, so now that block jobs don’t completely break with filters, you can instead use a filter node on the source (as I tried in the patch referenced above).  And to fully fix the test, we’d also replace the @busy == True check by @status == 'running'.  That’s the attachment filter-node-show-progress.patch.
>>>
>>> If I apply that, I can see that now there actually is some throttling. After the time.sleep(5), mirror and commit get to exactly 1 MB, and backup gets to 1.0625 MB.  Good.
>>>
>>> However, after the stop is issued, backup stays at 1.2 MB (good), but mirror and commit progress obviously without throttling to 30, 40, 50 MB, whatever.  So it appears to me they are drained by the stop. I.e., precisely what the iotest is trying to prove not to happen.
>>
>> I don't follow.. Increasing of progress means that jobs are drained?
> 
> I don’t know.  It does mean that throttling is ignored for a bit, though.  I could imagine that’s because something is being drained.
> 
>>> I plan to continue investigating, but I just wanted to send this mail to see whether perhaps someone has an idea on what’s going on.
>>>
>>> (My main problem is that bisecting this is hard.  AFAIK the throttling applied in master:129 has been broken ever since blockdev throttling was moved to the BB.  Even without the “Deal with filters” series, you can use at least mirror sync=full from filter nodes, so I tried to use filter-node-show-progress.patch for just test_drive_mirror(), but that only works back until fe4f0614ef9e361d (or rather 0f12264e7a4145 if you prefer not to get a SIGABRT).  Before that commit, it hangs.)
>>>
>>> Max
>>
>>
>> Hmm, in show-progress.patch you call "stop" the second time.. It's a mistake I think..
> 
> Ah, oops.  Yes, not sure, how that part got in (some rebasing mistake).
> 
> Still, removing those three duplicated lines (stop + query-block-jobs) yields the same result.  (I mean, what else is to be expected; BB throttling does nothing, so even before the first stop, the jobs are READY/COMPLETED.)
> 
>> Also, on current master x-bps-total I can find only in iotests.. Where is it defined o_O? If I change it to be bps-total, it fails.. Strange.
> 
> block/throttle-groups.c defines x- as a THROTTLE_OPT_PREFIX... :/
> 
>> I've run the test with your patch with throttling filter (and a bit more logging).. Interesting. It looks like throttling just don't work noramlly after stop.. I see that mirror does one 1M request, and it obviously overflow throttle limit, so during your next 5 seconds it does nothing (and we see progress of 1M). But immediately after "stop" command all 16 read requests pending for throttling goes, and then a lot more read requests (hmm, exactly 31) are issued and not throttled at all (but goes through throttle node). And then new 16 requests are issued and throttled. I've looked at throttle_group_co_io_limits_intercept() and I just don't understand how it works)
> 
> Hm.  So you’re saying only the current set of requests are drained, but no new ones are generated?

hmm, what's not generated? New requests are generated.. But some requests are not throttled and I don't understand why.

> 
> Perhaps 129 was introduced to check that block jobs don’t run to completion on 'stop'.  The commit before it (e62303a437af72141^) makes block jobs pause in bdrv_drain_all(), so they don’t generate more requests.  Perhaps we just need to ensure that mirror won’t generate many concurrent requests.

But bdrv_drain_all() is not a "drain_begin", so after it jobs are resumed and new requests may be generated..

> 
> Indeed.  Setting buf_size=65536 leads to offset reaching 64k after the sleep, and then 128k after the stop.  That makes sense now.
> 
> Now there’s only one problem: That doesn’t work with commit…
> 
> Then again, the commit 129 uses is an active commit, i.e. just mirror. It looks like we can translate it into a non-active commit, though then we still have no control over the buffer size.  But then it only progresses to 2.5 MB, which I guess is fine...
> 
> I suppose with your async backup series, we should then limit max-workers and max-chunk to the minimum for the backup job?
> 

I have a patch in the series which sets the backup speed to 1k and it is enough.

Let me summarize what I think about that all:

Jobs should continue running and do progress after "stop". So, test should check exactly this behavior. We also want to check that "stop" doesn't force jobs to finish synchronously (but we just doesn't have a synchronous finialization of job mechanism, so I think it's not possible anyway).

Test check that jobs are "busy" after stop, which is bad idea as we know. I think, test should do the following:

1. check that after stop progress is less than maximum (which guarantees both that job was not finished prior to "stop", and that "stop" doesn't force synchronous finalization)
1.5 check also that job is in "running" state (not cancelled, for exmaple)
2. then, drop any throttling
3. wait for correct job finish

So we check success scenario, which is the main thing. We can still just cancel the job instead of [2,3], like test is already do.

Than about throttling:

Why we need it? Because without throttling jobs may do their work too fast, and just finish prior to "stop" command.

And we see, that block_set_io_throttle definied throttling doesn't work good with block-jobs. Throttling filter works bad as well.

We can use "speed" of jobs instead, to throttle exactly block-jobs. And it must work. I'm sure at least, that for current (synchronous) backup, it's "speed" works good, and after my series "speed" in new async backup is smart enough and works good too. So, there is my patch "[PATCH v3 13/25] iotests: 129: prepare for backup over block-copy".

So, I can suggest to drop any throttling from the test (as it's not test of throttling) and debug and test throttling in separate. And instead, just use "speed" parameter for all the jobs (like a lot of other tests do).

-- 
Best regards,
Vladimir

