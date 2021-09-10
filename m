Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA7E406A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdws-0006yS-A9
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOduu-0005eH-Rv; Fri, 10 Sep 2021 06:37:56 -0400
Received: from mail-eopbgr60125.outbound.protection.outlook.com
 ([40.107.6.125]:64437 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOdur-0001Ha-I8; Fri, 10 Sep 2021 06:37:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnPuGhyaZTHo4gA5uZ6Du7hE2ulFwiZCB95xd2B6qLBHoPq/NMvK6sQXw9q/GAXxAaGAvHGYG8NukbBlDrfZjcAE+fY0Cx+F8s5w5EjqPoAHO0CPFKnYH4ON57K69k+ifkCipuaE+RKGOZVx9NXvXxjH5uYHoXHIl1WfdliUcKgBQ/Pf4odkTBhPbwQQ6mDAoVtcp0yaoUXs7pB2Cxcgz2+8w3SOvICWh61OsQjn88DSThrzM+Kp4S6Xsw6MrZRWbFw8yTBZjcYWSBBJWyJoXfmlYc8/d5h/lL98p4MRLU156aNr1B4O/O1lM6bl2bc4jU1KvnFbrBTMsZ52zoD/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IiW59cnZq19ToEaqSqJGec40gOYOGECetKc/von+nY8=;
 b=boFeAEEBma4E/cOaQkeqOHjI00VFoyZ8aeYBjTFdTFYI/hTcBUxwmSQKitwvaVnV2wHRZEth7J3dRS9i1IHpRb+g29GHonPy+J6J/JmXFA4ujgPvnTs8XpQBdYc/wGFrLjG80REp8wcld83fjRxpu0tACDhIHy+kh05F9Rt+GuTd+gEtBSuudJ5Y2GLfCIVTj/hkTcKaZC/aWp7TvdNKe5eertXpZariOmpecjbI+aaN4C3mvPOAuS0Wbt66CTzGYRYfXc9ONI5xSzNDCbxEK7t3uC/hLiIUUfTmzCTLLMSRtYc+320VCtl14YT65vI6/SBnwg0urV8YRfSA4Eks2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiW59cnZq19ToEaqSqJGec40gOYOGECetKc/von+nY8=;
 b=XRVhYumJvZsz+TWBwgxGjNfaQS881+UeyRYehQqJ4Tb7la5zg131oKaLjAbIU7QDvXStX621/z1xZE9kRZlcVmLD3Db8DakWhRrBdq0gxzkKyYjXUFO9iSgyrPw+JIkbHFBIy9GNEbX7h/gF/hVHgEvXFcg3cjXHonlYU4t6LjY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6995.eurprd08.prod.outlook.com (2603:10a6:20b:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 10:37:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 10:37:48 +0000
Subject: Re: [PATCH] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210910085600.137772-1-sgarzare@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b56ce8a9-d366-e3d5-d516-0631231b218f@virtuozzo.com>
Date: Fri, 10 Sep 2021 13:37:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910085600.137772-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 10:37:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a40e1ee5-23b1-4493-0432-08d974470880
X-MS-TrafficTypeDiagnostic: AS8PR08MB6995:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6995AE07BBAB6C1C66D90791C1D69@AS8PR08MB6995.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rt9/O2cnwjoBQQv3rz914R8oMxf/D5/oiT0++sQ4pj0EUhiHLkWtMB3fbKRBmX4GWxoKSzs4p8cRQWy2oNk8w97bOvQ1RoE+k9+tUmLx4Rlq0quusv3IJt11/EuRK9pOqt+uVGY/KsI2ehHbXw1y19vHwf1JyQBJGUd5vUcLJTY3L3WM4yAmTimG5kxmoPwG+bA/XxROEfXa2xksFBs9Qog9LQ67IRo/jPCrgukHrSHLGf5eqErDrZNE5ORDzMNVRtvL+UOgSUoCZg0uXeqEWB0AdpDX7l2DDzouL9Ud4LrXSKoIIplcUaGBLW25B5pLixp+GQNObfPGEw7mC01n1fIsM4xJWWzUhdZKnvPfpuZ7hIrVwbTDCYgwNNq8OAVtwP04loF3svdbxukzbd7jakdESjIEvgjPjCPUm/mRrOgDzYVPZWHjA2VhM/GdYhq58GxhQjOQ60ZDNejpy3KESt/Xw+rwkUoljRzJ2Wkqzn6vyWIZ8VxeqdpMztF68amYQDU+kxULrgeu96Cs5OsaOUcwFb+fpkFkdQfAIkxa0w20RXZY+edQjnDDMDpOzGpleufjK6VMwq/wAEg9Lpxi/BzhsVjS4dSefIOqMiA3uTEpKPidWZUbj0PSMh17iJ5DiuFbcR8jXphsDBCtItQgkeIVqDWCdxD+ZV0sYxVWjQEzO/q7wa6Wp6TsvP0OoSsrCZh37iQfz3pAmxMxfuknehY3PKJROT5i3Ra1XB+3Vhpin1dbLgBN1HSH/ordqYoVZ8s3TlXYGelAvXrBSA03VwmnzolDYVldYkE4SZUEClrjXJ8x5a6D36FvN4Wj0is21TI5nYNnTfOJjHOcKUpR7vhqr+RDHLf6815FHxBA3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(2616005)(4326008)(38350700002)(956004)(38100700002)(186003)(478600001)(26005)(52116002)(8676002)(66476007)(8936002)(66946007)(16576012)(6486002)(66556008)(2906002)(83380400001)(31696002)(316002)(54906003)(36756003)(5660300002)(6666004)(966005)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEx6TENBZGlWUEFrWFJYOVY1UXlZUUVBaVNEcWwzVDUvUTYvZkxWRlJYTXJU?=
 =?utf-8?B?ZHM2aldYM3RDV3RIVUY4cXVUWDlESFRXbmF6by9UVDU4bkxLa2VYM3RyWnQv?=
 =?utf-8?B?TlpCYlhKMnRvOW9FckdsUVBpT2RPWDRxVG15dmRZZkVXMjYwQWtIaFFwQXc5?=
 =?utf-8?B?ZTdmeE1odUVPNS90Tnh5Y2RrSGcveVlseGg3a0pMSDN0cnRKOEE3cTFSTFJo?=
 =?utf-8?B?S2pMUndldjdMekU4Q0drNm1Hak50TTJXVitXRlJja0Y2OGt1d0tuN3p3Q3c0?=
 =?utf-8?B?YnRMUEZ4Tlc2OEludWpEUjk4ZmNKRUhQSVFoSklvT1ZEWUlrb1dJb2pVaTZr?=
 =?utf-8?B?WTFJUGY3TjZLQ0MzOFZjRCtoQng3Q0JqQ1BYbjQ1aFJHanlOc29QRmphSXVw?=
 =?utf-8?B?T255TlB6RmZrbk1Od2kxRVNPZ244cC9lUElyaEMyYkZFSlcweEY0MGN3bGhQ?=
 =?utf-8?B?cHR0d3ZHS1EzZHBVZ2YwUVNXMy9sN0lGdmRhRkxPRHBDSWVUR2Zqa3ZmdFps?=
 =?utf-8?B?ZzEvNzJvUHJBeUNqb1BjeENhcVl1czdZaTY5SXpkTEtWT3Q4S1AweDhDbmxR?=
 =?utf-8?B?dnk4a2I5M2tlQS9qcG4vSHV3ZHhjTXJnSFdwNUVGSFNiK1JqMExydGk0RlZh?=
 =?utf-8?B?VU96UFA1d3ZKcmd4RlFlVTJaV1dSVi82enNzL0xnK0VRbWYyRVRWa0owR3Nn?=
 =?utf-8?B?aDFuK2JTV2tDaWZvYk1pNXI3SUhiRFJ6cldFdDFYb25KYjVTS20rVjVrM0or?=
 =?utf-8?B?WGRwK1lTMGgyeG1YNUV2ZHRsZ2hGRXJZekxxM1QrK3pSSXpRMTM1YUttWlRI?=
 =?utf-8?B?ZEJaM2IycmZLV2l6MEtpZ3B2OVpLcGZuUmFBelQyVmY2ekIza3ZNSkZ2YllP?=
 =?utf-8?B?dkd1Q2NhNEw3QXJSeWlqeDVQQkRWdnJDUmNSeGg3aEFHbC9jL0hVanR2TmlV?=
 =?utf-8?B?WEpYV1pmSTk2OGlWZHZYcEt6KzhFVUxGSFU3V0pzL1k0a3puT0RzRitXWHVU?=
 =?utf-8?B?MEpHdkwxY1dLeGVmOFY0UHkxbjhNQ1prUmVtQ3RXSmpXaXhjNFY0bmQxNDF0?=
 =?utf-8?B?eHkxcEJ6WW14YU04Mlc3YUVhRzBCYVgzNmFrNzBPVEFjbmJOWElxOHJBQ3Fy?=
 =?utf-8?B?ZVBFQklsMzEwTExVcUZURmMyNHYva2tmR0tCQVBDNGdRS3dzSTZtdlZmdWEv?=
 =?utf-8?B?SUlpTmN0UU5aTEJvc1ppcFNlSDV0WlB0ejcxMkNIVzB2b1I5TmZHVDUycnFT?=
 =?utf-8?B?WlFybGxOZkF0alZySnBKUHFvd3F6WFBLZEJyOVRsbFBpeldsY2o1OXc4U3gv?=
 =?utf-8?B?aFk5R0txZ3pVaWlPNWRDY1pxeFg4SGdkNDhPWkJqbWF3TjlCRWVOK084bllZ?=
 =?utf-8?B?R2o1Yi9Waml4MDNuNVdDQjQwdWtkazQraDcvaEZBclNjUklaeFNjQ1UyNWhK?=
 =?utf-8?B?Z01jT051dWd2dUVSM2NNd3RIWlRMK1BlSUZKeWRra1YzeVhKbmQ5dmRtejdr?=
 =?utf-8?B?QVZ4TmI2YUE3VGU0SUI4U0srSmxVanlnKzF1Z2FXK3QrVjBBYld5eUl0c01t?=
 =?utf-8?B?dW1FTHFkV2Y5K1U0cGRMSFB6aFUvQVFsQXVEcFlaSzMzSkJ1THh5NzJML25V?=
 =?utf-8?B?OXFOZHQ3YUYrM0V1czNrc1E0UzBqKzJoUFpmT3hYTlR5cnU3VGduK2Y5THVs?=
 =?utf-8?B?cnlzV1ZqUGtFeExWNXNzYjR0L3hROHhKZlBxQmZpd2JTaEpnSkZiaFZHdlAw?=
 =?utf-8?Q?zZ5NEpZimgOFeJO2ptol8SoLLi6XZsOZdYRpxiY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40e1ee5-23b1-4493-0432-08d974470880
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:37:48.5425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MEtTh+PI2536LHi3i2+M6Or5R7Kvy91DbofX9DGBsy3BcyC5GNwgdr4EX713RLRcGvM4rALTs1YCYFqGHZwSC03xWd74uSWZ62Wq7Q4mlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6995
Received-SPF: pass client-ip=40.107.6.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.09.2021 11:56, Stefano Garzarella wrote:
> In mirror_iteration() we call mirror_wait_on_conflicts() with
> `self` parameter set to NULL.
> 
> Starting from commit d44dae1a7c we dereference `self` pointer in
> mirror_wait_on_conflicts() without checks if it is not NULL.
> 
> Backtrace:
>    Program terminated with signal SIGSEGV, Segmentation fault.
>    #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>        at ../block/mirror.c:172
>    172	                self->waiting_for_op = op;
>    [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
>    (gdb) bt
>    #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>        at ../block/mirror.c:172
>    #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
>    #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
>    #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
>        at ../util/coroutine-ucontext.c:173
>    #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>        from /usr/lib64/libc.so.6
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
> Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> I'm not familiar with this code so maybe we can fix the bug differently.
> 
> Running iotests and the test in bugzilla, everything seems okay.
> 
> Thanks,
> Stefano
> ---
>   block/mirror.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 98fc66eabf..6c834d6a7b 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -169,9 +169,16 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
>                       continue;
>                   }
>   
> -                self->waiting_for_op = op;
> +                if (self) {
> +                    self->waiting_for_op = op;
> +                }
> +
>                   qemu_co_queue_wait(&op->waiting_requests, NULL);
> -                self->waiting_for_op = NULL;
> +
> +                if (self) {
> +                    self->waiting_for_op = NULL;
> +                }
> +
>                   break;
>               }
>           }
> 

Hi Stefano!

The patch is almost OK. The only thing is, I think, you should also put "if (op->waiting_for_op) {continue;}" code above into "if (self)" too. Look at the comment above: if we don't have "self", than we are not in the list and nobody will wait for us. This means that we should wait for all.

So, with my suggested fix, you'll simply roll-back d44dae1a7c for the case of self==NULL, which is an additional point of safety.


Still, I wonder, where we check for conflicting requests when create usual MirrorOp. We don't call mirror_wait_on_conflicts() in mirror_perform...

-- 
Best regards,
Vladimir

