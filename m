Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4038B340
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkat-0006c0-Pr
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkSf-0007dS-LM; Thu, 20 May 2021 11:19:46 -0400
Received: from mail-he1eur04on071a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71a]:58534
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkSb-0004ld-Vm; Thu, 20 May 2021 11:19:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI4VlxbtmVZ9XAvOD+btlHEpcmt9fYVhJ6ac00CCCLphSLsvH51OW9K2AmKprnupQHKiRfO5xjh5X8WKbDS9Y6cov/pXCDh+vsQgUnfY5xBXkhC2ZP1MTgm5c5xkb9qnhKjRQZm/Evscav0Cr3ad+H86I2BaAVXJl+rwyOeEs3HqB7VJ1CxXevT5X+d4I4OAr5bxc+v41+U9+jmD6Fp2QkfvHkks2Q6uYx6GNbeguwUTyGiSQsCimQXBExz+NvHOb2LDV3nqsxOXV31XdjptTkERcY5Vi0CszBnlnJjW6i57h6NyAk/Gh0ZW8rrBa1vVvRqsf8nhU2v33Uyn5Rq/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvbRxKXyrCfel0l1wGWast61f4LwuiSAalQcy9WvOkg=;
 b=M8m2B1kattroQH0Jhgflk7Z/LnN/yjF5NTXTt/JC4jm0Egs20YUsP7wNejLXFzhJU+sFsD0+Cm2Z5n0wcQFfWafQagcFYpPNU3TC3co0dpsvS4LllRRbh7Kr6QXWXAJb+nM1unkU2nMr8Nj3UrSajE49VGSn4cCsK2ViM7Cvvj9VLe3D97Qc5vKZinAnzTAada5cYrs4BUBAL4cOYyTQGn+gfwbdvUIILE0t2TuaaRtlkFcoBGySG+qAO7av/H6T2Edr/Rub33Ruo38SoqRjEno0wAO9mtEUG4cMagVXhpF0jeF4DgOln0ZQi409mTCQzPbssgoqdsq4qBO8xcORtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvbRxKXyrCfel0l1wGWast61f4LwuiSAalQcy9WvOkg=;
 b=sX68boTALkIKJqn5FlstiZWGEnZzc+RAdndb509x/udiy8UciMptKkh/oRcgPjV4xiOfeesAeHBVW+UZeyyDTTKOTkyv+zmdGx++mjSaGM5jZtEUXMASKwhfKCeVC3jjo529QXkaLzkHraBrEcGlJnPPWlaaKcdxOFxsSQObBDI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6760.eurprd08.prod.outlook.com (2603:10a6:20b:393::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 15:19:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:19:37 +0000
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
Date: Thu, 20 May 2021 18:19:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Thu, 20 May 2021 15:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 096b57cd-a2d4-487f-a105-08d91ba2ae1b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6760:
X-Microsoft-Antispam-PRVS: <AS8PR08MB676061B106E86B67F22223EEC12A9@AS8PR08MB6760.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KA/RWRoqmlm8DFxz4DKRO6B8feK1P+OBSReRx6Rjfa5YDBAvUaut2/+DEOEYifH5chiIxE5gdXa8pwz/vacYyBw9QoAwVH+tGRorzz4fwHxQfksv38B0vKoRlCmB05LPkV2munS5nZR2/A94kecWsyjsNUlSJiHBMdRHVG0I4VRQua+F4t7f7uFLSywI4+BFI1qEAv89xuYBhg7C1MBqNfV8K+ohZeJ2aqDcB3MpSbHwwR9BZnaQInI6Jc8aooyHgr6b8yIKZn0i+gAWrPvR/RucTxyEW1TETFkTxMuHM3nz3xpU0xTGcxkkU6a7COtnyyxW6wFme1alPOKg8ysV30YYbR4ooTxZqQFlfAw36556P4fzamtY2lJ7gajRnon8WaYpF9ouyMtL6ShIJfEzbdGGsFjeq0ULSvQGHQ/P8enUDVSYHqH43l6hIEgiWvTVUM8n91vpN+K0LMzhfnQxSDTeW+j1Au6OrFUitoI7MOhUE7b2izZXJE4rP8l9IklmA19Xzzrpo2YzB6A7ijk3Fli40vxoSzQbvswENQrWWV+HUW9L6iJaVxna6tasWVDWxcTQYcxgcjG9/2ypGl9S1C15M9iv7v/obqGe+Htv7i2f2YQdraVXvMqx7ptm4nqp1al4okAQo9aa2/8tIuOxgO098XsfYjoC6XJ7jnTXpbuxNnvCI5i4eaBQykWHdMNEeVINELu/16LGSa3JYi2m7GTPv5aNmbz9mXYzkQCIqgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(31696002)(2616005)(956004)(26005)(186003)(8676002)(38350700002)(83380400001)(16526019)(38100700002)(6486002)(86362001)(478600001)(31686004)(8936002)(5660300002)(4326008)(36756003)(66476007)(316002)(16576012)(54906003)(52116002)(66946007)(2906002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3BPUjA3WHU1SU10Yk0vb2c0YjVGYnNJdERZeXp0NDRDWW1SUDY1SVMyN3Ax?=
 =?utf-8?B?VlhkcEErcStqMVplVnVRYm9nWmQ1Szc5dWwvTjMvQk1MRSs2S29mQ0Y3WWcv?=
 =?utf-8?B?V1FXYnBTLzFWWnFFS0F4WnlzTjBsSVdyU2hLYWZubG16WTM1WHFWRzR2bU5L?=
 =?utf-8?B?YmowYmdpYzZPejh3VzdQM1JaNWxuSHJKaXE1a2J4VmpqOHF3OFc4dWZJQUpm?=
 =?utf-8?B?aUhCckhHc3FtQko5WmZqWklIdmtTWU5KQWpyeVlUNTlLVHNwbEwvZm9BYnRG?=
 =?utf-8?B?QkttZy9tL1NmWmVMWUpabzlLYkUxUEtuUWZRQVpPVzNjRXpVL0Y2aUFHUmhu?=
 =?utf-8?B?Z0laYnlGVzd2WFJjOSsxY0piRHNxQ29zZHNqb0tFbHFnYUFZQmR2T2V6QUlZ?=
 =?utf-8?B?S0czMisrWXJwYTVrb3N0RUViK3JhZjlSd3QyMHQ4M0V5S293OXo2cWk0SW9C?=
 =?utf-8?B?UDN6eWZXWU4wY0tmc2hiY1ZLbnpUVkpzOVVBbWZaWGxjcTVZOFl4cnZ6NXlI?=
 =?utf-8?B?WTIxRDZpcyttdWdkVGdGdUl6dXVHZmp0NnMxTlh3QVVNbWRPUjZta1hRU3pB?=
 =?utf-8?B?NWVRRWZ3Wlo1aHNjS2pxVUdRN2l2OE41RlZ0Y2xwekVvNE0xYTVLUkVEM1Ny?=
 =?utf-8?B?VGxNRnRUaHdXdlFxV0VWYVJZaW9ka3hkZ296MHM3RUpVb0ZDWFdTMXg3VVFw?=
 =?utf-8?B?Vm9tNkpoT2FoS2FLK0RSN2EvN0U4ZFZGY2lBTFR0NXhhL3g3U3BqMGNHOXFM?=
 =?utf-8?B?ZEViTkE3dzUwZitSeFVhb1ZSUk4wM09aNG1oTnF0dS9XZ21iaVFYaU9LREt2?=
 =?utf-8?B?VjRNWkRWKy9tTjNad3hJOVp1Z0xZZndDWnc0K2M2K3BLSDhSQWVwbkF3Unhx?=
 =?utf-8?B?MjNodmVZd0hQTFFDUU9vZ3RUWnJINWZ5NzF1V29HNkNYTUd5YlJSZ2c0aWZr?=
 =?utf-8?B?ai90SUx6SytXMUp4b0FLbFpwNmQ5ZFhZRUJmdW9xaFNSa1dvc1FOMUorRDhq?=
 =?utf-8?B?Qk1qbHR4bUd4Um81ZGNPODIyRkh2MVdabk9yNjJqM0NIUFFVWXJXRjE5M1Iy?=
 =?utf-8?B?SWNMbUx0Y2ZBVEpTbUQzVW1OK2RkRTg1L1hRdXhBVEpxa1IySUpYaExlbWo2?=
 =?utf-8?B?VzBRQU1ZNDdKR05kNmw4WmZZaGMyNmVURGhmbXJTaHVHTHZRMmROT3JmWjQw?=
 =?utf-8?B?c1RqcmFvVnpsL2MrSmFsV3FjUmxaOGQ3cXdZa3ZNdjZCUmo5dHhkYWFFcnpi?=
 =?utf-8?B?MFdGaGl5d0xNRi85QWFjK1VnS3Z2OFlvUkhDTHlJMU00TnN4K0FFZEYyeXhF?=
 =?utf-8?B?clIzZ0twQ2U2cW9lcUsyZWF1ZkdMQm9iaDl1WnZaWGd0WWxNMVhWaWRjNVht?=
 =?utf-8?B?N0RCVHFQYkJZZnVrZFpJODE4cklQVFNMVVBDck1BWEQ5dWszSTFja2p4YlZ4?=
 =?utf-8?B?TGVjT1FNMFV3bGJYWHRnTkhpUUJpS09kVmI5bmdCWkVRblp0ZWJ0Z2JBT2dE?=
 =?utf-8?B?cm5KUjB4ZXo5SGRlbXAyOGdLU2lyRFdKUG05OXhnb3Uyd1hGMHQxck5MRGN5?=
 =?utf-8?B?STRsR3RtLzJYTU14ajM4Q0ZLOE8zczROdWtDTWZFMVNiTWJwMnoyNEtud2ZH?=
 =?utf-8?B?QzlrL0N1Y0Q2NnhreUxObHJwU2ErYU1zNXNTUlVXdnI2R0Zub25NZVl3MnFw?=
 =?utf-8?B?L3dCaVJ6Z0FvbWR6RGxPdzJlTFI5MWZtN3RURitpVFZiUVVwRXBhUGVsdXBo?=
 =?utf-8?Q?/etIC+A0l7Y+fAtAJmdOFZmk/DgDwLuMTT6T1jt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096b57cd-a2d4-487f-a105-08d91ba2ae1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:19:37.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ow90dZNEB755cb97Hk49GI8blF0X+gea9AgtagmNF5nhCvY5F6My9X5kqpWAWpD8i07zSPCDKC05iHe5BuuF1j+K8P3Rpho8W0kdgUvJuWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6760
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> Because the list of tasks is only modified by coroutine
> functions, add a CoMutex in order to protect them.
> 
> Use the same mutex to protect also BlockCopyState in_flight_bytes
> field to avoid adding additional syncronization primitives.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 55 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 35 insertions(+), 20 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 2e610b4142..3a949fab64 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -83,7 +83,7 @@ typedef struct BlockCopyTask {
>        */
>       bool zeroes;
>   
> -    /* State */
> +    /* State. Protected by tasks_lock */
>       CoQueue wait_queue; /* coroutines blocked on this task */
>   
>       /* To reference all call states from BlockCopyState */
> @@ -106,8 +106,9 @@ typedef struct BlockCopyState {
>       BdrvChild *target;
>   
>       /* State */
> -    int64_t in_flight_bytes;
> +    int64_t in_flight_bytes; /* protected by tasks_lock */

only this field is protected? or the whole State section?

>       BlockCopyMethod method;
> +    CoMutex tasks_lock;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QLIST_HEAD(, BlockCopyCallState) calls;
>       /* State fields that use a thread-safe API */
> @@ -142,8 +143,10 @@ typedef struct BlockCopyState {
>       bool skip_unallocated;
>   } BlockCopyState;
>   
> -static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
> -                                            int64_t offset, int64_t bytes)
> +/* Called with lock held */
> +static BlockCopyTask *find_conflicting_task_locked(BlockCopyState *s,
> +                                                   int64_t offset,
> +                                                   int64_t bytes)
>   {
>       BlockCopyTask *t;
>   
> @@ -163,13 +166,16 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>   static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>                                                int64_t bytes)
>   {
> -    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
> +    BlockCopyTask *task;
> +
> +    QEMU_LOCK_GUARD(&s->tasks_lock);
> +    task = find_conflicting_task_locked(s, offset, bytes);
>   
>       if (!task) {
>           return false;
>       }
>   
> -    qemu_co_queue_wait(&task->wait_queue, NULL);
> +    qemu_co_queue_wait(&task->wait_queue, &s->tasks_lock);
>   
>       return true;
>   }
> @@ -213,11 +219,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>   

Looking at block_copy_task_create():

First, !bdrv_dirty_bitmap_next_dirty_area() doesn't take bitmaps lock, so it's not protected at all.

Next, even if we take bitmaps lock in bdrv_dirty_bitmap_next_dirty_area() or around it, it doesn't bring thread-safety to block_copy_task_create():

Imagine block_copy_task_create() is called from two threads simultaneously. Both calls will get same dirty area and create equal tasks. Then, "assert(!find_conflicting_task_locked(s, offset, bytes));" will crash.


> -    /* region is dirty, so no existent tasks possible in it */
> -    assert(!find_conflicting_task(s, offset, bytes));
> -
>       bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
> -    s->in_flight_bytes += bytes;
>   
>       task = g_new(BlockCopyTask, 1);
>       *task = (BlockCopyTask) {
> @@ -228,7 +230,13 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>           .bytes = bytes,
>       };
>       qemu_co_queue_init(&task->wait_queue);
> -    QLIST_INSERT_HEAD(&s->tasks, task, list);
> +
> +    WITH_QEMU_LOCK_GUARD(&s->tasks_lock) {
> +        s->in_flight_bytes += bytes;
> +        /* region is dirty, so no existent tasks possible in it */
> +        assert(!find_conflicting_task_locked(s, offset, bytes));
> +        QLIST_INSERT_HEAD(&s->tasks, task, list);
> +    }
>   
>       return task;
>   }
> @@ -249,25 +257,29 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>   
>       assert(new_bytes > 0 && new_bytes < task->bytes);
>   
> -    task->s->in_flight_bytes -= task->bytes - new_bytes;
>       bdrv_set_dirty_bitmap(task->s->copy_bitmap,
>                             task->offset + new_bytes, task->bytes - new_bytes);

Then look here. Imagine, immediately after bdrv_set_dirty_bitmap() in parallel thread the new task is created, which consumes these new dirty bits. Again, it will find conflicting task (this one, as task->bytes is not modified yet) and crash.

>   
> -    task->bytes = new_bytes;
> -    qemu_co_queue_restart_all(&task->wait_queue);
> +    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
> +        task->s->in_flight_bytes -= task->bytes - new_bytes;
> +        task->bytes = new_bytes;
> +        qemu_co_queue_restart_all(&task->wait_queue);
> +    }
>   }
>   
>   static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>   {
> -    task->s->in_flight_bytes -= task->bytes;
>       if (ret < 0) {
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
>       }
> -    QLIST_REMOVE(task, list);
> -    progress_set_remaining(task->s->progress,
> -                           bdrv_get_dirty_count(task->s->copy_bitmap) +
> -                           task->s->in_flight_bytes);
> -    qemu_co_queue_restart_all(&task->wait_queue);
> +    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
> +        task->s->in_flight_bytes -= task->bytes;
> +        QLIST_REMOVE(task, list);
> +        progress_set_remaining(task->s->progress,
> +                               bdrv_get_dirty_count(task->s->copy_bitmap) +
> +                               task->s->in_flight_bytes);
> +        qemu_co_queue_restart_all(&task->wait_queue);
> +    }
>   }
>   
>   void block_copy_state_free(BlockCopyState *s)
> @@ -336,6 +348,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>       }
>   
>       ratelimit_init(&s->rate_limit);
> +    qemu_co_mutex_init(&s->tasks_lock);
>       QLIST_INIT(&s->tasks);
>       QLIST_INIT(&s->calls);
>   
> @@ -586,9 +599,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
>   
>       if (!ret) {
>           bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
> +        qemu_co_mutex_lock(&s->tasks_lock);
>           progress_set_remaining(s->progress,
>                                  bdrv_get_dirty_count(s->copy_bitmap) +
>                                  s->in_flight_bytes);
> +        qemu_co_mutex_unlock(&s->tasks_lock);
>       }
>   
>       *count = bytes;
> 

-- 
Best regards,
Vladimir

