Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F477406B83
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:39:27 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfoT-0005iN-PE
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOfjG-0001Aj-9L; Fri, 10 Sep 2021 08:34:02 -0400
Received: from mail-eopbgr10100.outbound.protection.outlook.com
 ([40.107.1.100]:57858 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOfjC-000673-Hj; Fri, 10 Sep 2021 08:34:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ocxsbx1syyIvx3tvtXprM+4DDwyrFA3AmbAWR/NIrBX7nBZ9X11weqHCnkPIF285dprCVZkIVxlpGgvr7jprV87vhckN01goWTsLCyjdf6yiZZbENipdc49QnTx0wJWO3qG48relWluMJ26LQiI2Y0hQXZdavkKzweUQgZ7VuqsHQcpp6L3VUBCEEbLVWm42Fiqo5H0Pan7nNJQ0wSNzVuubjFPsjniRtMx/jzowP3Upo72n6deqeCIKzoyxHoPACbZjetkp0ZG7fidzYOgyqoy4liTmOIe+xPtWjA2Fi4gDkuWQhGPo7GT4M6dsg4Bhuk+hrV2dp8GNneGdpcF/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rLVPRKh42WeXfgJVD/50FGghwRxHkCMyQnxCBCewLC0=;
 b=GP16AcLzSKm/+XFcTLhCr6/k2d22o9YhYrOIvWSAxrVFQl3ZLXdzyX7/Zs0gN7zlr1p04b5u+CbnSRVoeZb8QDXozd43GVezOMHfPfdfS4iBLAVSdtLXLil64djy4F9IUh0V+oislpCpYg/xiVn0SXN5mQUUqrRFYE3RkEuouQxeWjIXxAOjIg55RYYdkPqObYMoZ23mpOODq2/oYPZfGAj7CiUgIrFF/RAMcUSNqIlUKZ2cBfePRRiTy55pPfsc8TwI2zaatDWugFk6BZqrRIdUyYeOaEaC+51/wc3hiSQSqRtgISLdcuciHQEz1WPpQc2R734PFciYNIYbTLSUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLVPRKh42WeXfgJVD/50FGghwRxHkCMyQnxCBCewLC0=;
 b=IX3CLFTOpYcyCaTL+nRiST2IBaQSES4XyuOSPsUByfdRibsyuZ72QamRN6HRJ/P3C/LvXnvRRZTzuCoHe0LAA8S1AAeEPQ5l55sYN4EEQuAqgRU0o5uWluxAC8U8K8UwtAkDfbBvaIQfhDxHP2XSwb11jOsiVjT0F58YaoJSqQU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Fri, 10 Sep
 2021 12:33:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 12:33:52 +0000
Subject: Re: [PATCH] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210910085600.137772-1-sgarzare@redhat.com>
 <b56ce8a9-d366-e3d5-d516-0631231b218f@virtuozzo.com>
 <20210910114252.v3si2per5jraxm6c@steredhat>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c10ba161-7dba-3ea4-39c8-3c127d9b2ec1@virtuozzo.com>
Date: Fri, 10 Sep 2021 15:33:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910114252.v3si2per5jraxm6c@steredhat>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Fri, 10 Sep 2021 12:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d47f37-3569-45bd-64bc-08d974573f7e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-Microsoft-Antispam-PRVS: <AM6PR08MB484997E5BB84828DE3815A11C1D69@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPhLKOAivEG+bGCvwY52o9R7GNA0nclc0dfZG6RGFPvL1VAIx6VBwcjYH1anW4nEH2zU+15xQKDpPdRgGkky+JX1H7sbJpELEqpolf4xhJKuqKKX7apfBqwHsk8wcYJFnI1/W8gsBw0WAjOYHZHvb5c+8Ax9xC+b68AkzR62MyzRlCQ4eSzY+vXexB31HOjsk9pXw2hYXxzTf4etDNqpjivQKjeo20D0LFDrvNEvscuYiQmEk0fZwXcqRzULeBP5OsDx3h8SSuOd1bPpwecbeMXXytavV99R46FPVFqBTE4cNYtYdWtHjucw9ICdqLGy1qRfvV0gS5bSvagwNNyrpPjU/Vhi8iqm6R3TFFww1T1gnJqEIdse7oO4vJL5chEzVNv4frMdTXCCPRPhK6tvx5m1i5IclKPKalwMIzYRM9H0vC0pqysqfYL54YtjkGcnrV4tBqMv7+EVK4+/9gznj8FjPE7WsN1K9le6L1EW/6Jc2E1QOSI2h81DT/zZ6al1UcHPhWxfAvGuuYVPfYae6E+PYxEhprEG3FLs8ejBlHQ4X0ZN34wlv/IZ52XXZymqAj7siAIITRbrvpMXsWKiM8JuuVp0m1Tsp7CLSXjC0v/y4tnEwt3D46nLpJraWaiT3Fby9CUo7mZ8m0Kv+jXCDOq2wKCr6n103cdKWU+MbyPD6d82aLjiD+ZepFKvsmcl9nEkn0vp61X72lqa4nskOXe2kttGVn8RnOSKje8+hlfb6aL+NtlzGo4S5lGpPtdQoFUfiWeQu6DVIaL0y+egBTFzWl/ncvJ82sdvFoXX8xhIWsHBBcmo7r9eFPYVbzt9344FYs7RmXR4iw7bOTwM63kOWF9w4h5YzhBEiWWsmPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(8936002)(26005)(4326008)(52116002)(86362001)(966005)(54906003)(16576012)(2616005)(186003)(6486002)(6916009)(956004)(66946007)(478600001)(31696002)(66556008)(66476007)(36756003)(316002)(8676002)(38100700002)(31686004)(38350700002)(2906002)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBrQkVPQTRjcEtpQ2ZjWnpnWkpxa1hYb0RyRU5jSWttUnM2RndEVFZ6ZytE?=
 =?utf-8?B?RUxndC9DN1hzYUVmWDhnVUFGZGVyeFdtNHV2RVJnS0FIMXBCRVF4ZTFqYjVx?=
 =?utf-8?B?K3hQOEROMndCTG1xL0Z6ZEVQdjAxSWxnblhPUnhyR3pCUGdaT2hCMGFFdlRU?=
 =?utf-8?B?WFJiUHlZUisxdGdlanBrckNRS0IzSHAxangrZTB0THBSYVdsZ2JUc09oSHpE?=
 =?utf-8?B?ZVJESEtZL0lKSnVCc3J6akIzcHZwOHBkNkdvUFIweVlNYzY3eHJaa2M0Wnli?=
 =?utf-8?B?Y0JVa1E4L3U2dmY3M2RCMEVNeGJtTzFYK1JqM2JzU0JSWldSL0hLV0dINW96?=
 =?utf-8?B?OURCckthR3FzVWtNOHB0bVhhelZBT0Z4RDhzcVdPN3RUdElnMjNBR2RLRVJa?=
 =?utf-8?B?dk1wK2RiMS9LdTVXWUxxZkhURFJTY2t0MVY3bzhTZ3hteEhsN0FUc3JyUjNm?=
 =?utf-8?B?OE5iL2h1cHhXYm4vQnRkWDZBQmxNbVRsa2pvaVR6SzZGbUxzdFhWdWJWZ3hV?=
 =?utf-8?B?dUZHcmQrNnBhT0RPMFF5d3ZhYXFNMDE2UWs2bjZ6THJ2TUlYd3BmNStLb1Zp?=
 =?utf-8?B?cmF5cFdUQTJ1RnJyMUhKb2FFaU9TeHd2TnVCTDJYRkdUbWhCdmg4Ym4wYklF?=
 =?utf-8?B?UERjdnFENy90eW9ERXM2NWtzZ2w5RER4RUUxUHdhKzFTaTJEUzlSblE2cFJL?=
 =?utf-8?B?QS9HKysvS2JWQ2Y0WDBGb29hdHZoV29nRjlVMFBhbFhaaDEwS2FHbWR0ZE9j?=
 =?utf-8?B?U0VyYUJudkd4MzJPc1dsbkJrWi9IZndBV1lDc1pxaHhaWTBRb0pkWXUrcW43?=
 =?utf-8?B?MGZlcmx0N1l2T2hTVmpYcmhTazlMc040Sk9OVGVJY1VLdnhyUnlRTS9xK0Ji?=
 =?utf-8?B?TEJOVlJqUXFvaDhnTldxemFQdkV3c1F6aG43SVZDZXlmS3BrYXlIa0lPbFJQ?=
 =?utf-8?B?L3BEaXBMdUVSZEptMzMvaWl4L0JmdHZLQTFrditmSEJ3S1BUQjJxQVV5alYr?=
 =?utf-8?B?dDhuaTZOMk44eVdqSUZvM0FzVzRFVHQ2blRzNW1IME8yR252RzVESWtHTDlI?=
 =?utf-8?B?bFJlNnI0MUVYZWMvUy9EaFpIOER4eDV5ZDlNcEZ1UDZHZnMrSWdiajVBbmhM?=
 =?utf-8?B?Vk55SG1aSmJtdS9mRWxwWTRNUU1QU0xxeEdvdURrblJubmIwMWNZUGY2K1FE?=
 =?utf-8?B?eFE1TGY0ZFhlT3h4eXZheE9TN0EzTm1RMG5PZnRaNlFhS0xIMEl1QXA5aUxR?=
 =?utf-8?B?bGxDM2djRjVhMjlSbk1OTzl1SmszbTF1MWxsbW8zOTBhS1E5OVpoZjNON2Fq?=
 =?utf-8?B?Z0Nic3V3UGRCT1k1cUpLa2J4cDVlWlp6SG5NSjNZU0g0Ujk4MGMzaWhBSGhp?=
 =?utf-8?B?ZWZUeDc5SWFFWUVkRGlrbWNRalZtdC80Qmx1cXhhdjg2UTlhSGdZLzFXdjJE?=
 =?utf-8?B?ei9wS1g5RFRRYzhwSUFMSTlaVEhiajFGSmhwdzNwRk41WWgvdjFNZlp4dzdq?=
 =?utf-8?B?L1E1aDMyaS9wOENxaEZUdjNNeU9YMDMxbzZYOFlweXpmcS9CdWxZM1VYOVpW?=
 =?utf-8?B?Z2RGc0xwajAyK0h1MDdTNXk2R25XMGR3OHJFRjIzaW9pRkhkTk9LeGlNTU1u?=
 =?utf-8?B?blJFVXc2RjVMNUoybXhRWWp6bjl0MEc3SEpreEhrTjR4L1lMbnpFY012SGFW?=
 =?utf-8?B?bm5tZTdBYTViZGE1dmlHYVpjWmFDbjZNSEZpNXorSHE3ZjNhM0pOc1NsSm9X?=
 =?utf-8?Q?iIzc16aDJYWGddw+44+xGSB1rsg85nJoBGfnfDW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d47f37-3569-45bd-64bc-08d974573f7e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 12:33:52.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNy0DOVuqZjtlyOz/Je+qSJ+GKyTms9kCtVlRaj3oq5+3DkJMlWrzDmRmf0y4rU0im4xPobDPJfQn/N7Q1+ttrJsfbT1xDTiGys4QpIPoSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.1.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.09.2021 14:42, Stefano Garzarella wrote:
> On Fri, Sep 10, 2021 at 01:37:40PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 10.09.2021 11:56, Stefano Garzarella wrote:
>>> In mirror_iteration() we call mirror_wait_on_conflicts() with
>>> `self` parameter set to NULL.
>>>
>>> Starting from commit d44dae1a7c we dereference `self` pointer in
>>> mirror_wait_on_conflicts() without checks if it is not NULL.
>>>
>>> Backtrace:
>>>   Program terminated with signal SIGSEGV, Segmentation fault.
>>>   #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>>>       at ../block/mirror.c:172
>>>   172                    self->waiting_for_op = op;
>>>   [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
>>>   (gdb) bt
>>>   #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>>>       at ../block/mirror.c:172
>>>   #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
>>>   #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
>>>   #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
>>>       at ../util/coroutine-ucontext.c:173
>>>   #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>>>       from /usr/lib64/libc.so.6
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
>>> Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> ---
>>> I'm not familiar with this code so maybe we can fix the bug differently.
>>>
>>> Running iotests and the test in bugzilla, everything seems okay.
>>>
>>> Thanks,
>>> Stefano
>>> ---
>>>  block/mirror.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/block/mirror.c b/block/mirror.c
>>> index 98fc66eabf..6c834d6a7b 100644
>>> --- a/block/mirror.c
>>> +++ b/block/mirror.c
>>> @@ -169,9 +169,16 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
>>>                      continue;
>>>                  }
>>> -                self->waiting_for_op = op;
>>> +                if (self) {
>>> +                    self->waiting_for_op = op;
>>> +                }
>>> +
>>>                  qemu_co_queue_wait(&op->waiting_requests, NULL);
>>> -                self->waiting_for_op = NULL;
>>> +
>>> +                if (self) {
>>> +                    self->waiting_for_op = NULL;
>>> +                }
>>> +
>>>                  break;
>>>              }
>>>          }
>>>
>>
>> Hi Stefano!
>>
>> The patch is almost OK. The only thing is, I think, you should also put "if (op->waiting_for_op) {continue;}" code above into "if (self)" too. Look at the comment above: if we don't have "self", than we are not in the list and nobody will wait for us. This means that we should wait for all.
>>
>> So, with my suggested fix, you'll simply roll-back d44dae1a7c for the case of self==NULL, which is an additional point of safety.
>>
> 
> Right, I'll send a v2 with this change.
> 
>>
>> Still, I wonder, where we check for conflicting requests when create usual MirrorOp. We don't call mirror_wait_on_conflicts() in mirror_perform...
> 
> IIUC in mirror_iteration() we call mirror_wait_on_conflicts() at the beginning, then in the cycle we call mirror_perform() where we create a new MirrorOp and we add it in the `ops_in_flight` list.
> 
> At this point, should we call mirror_wait_on_conflicts()?

Maybe. Deeper audit is needed to understand do we need to fix something and how to do it properly. Maybe I'll dig into it a bit later.. Mirror code is so overcomplicated.

> 
> I need to understand the code better to follow you... :-)

My knowing of mirror code is not good too, unfortunately.

> 
> Thanks,
> Stefano
> 


-- 
Best regards,
Vladimir

