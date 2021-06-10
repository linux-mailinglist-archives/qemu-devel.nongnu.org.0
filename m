Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632553A2977
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:38:48 +0200 (CEST)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI5H-0002Eo-Eg
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHuO-0004Xo-8s; Thu, 10 Jun 2021 06:27:32 -0400
Received: from mail-eopbgr20116.outbound.protection.outlook.com
 ([40.107.2.116]:58301 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHuL-0008NZ-Al; Thu, 10 Jun 2021 06:27:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub7Bf9k78LGWMO2HPjo+EbbWl+0/JDzrZiq4NrY4Ex/6lOdRi7MdFdek0d+M+8fV2dU54dLcStqaYKZomrf0r1cHH4yv51OFcMxi2OzLn70Nk38G/E9Tq+WzfVwh2q21aZkduttTNjipYeHZEpxD2gkv0eZOE0xg+awY3QDHi79FkLZUoyoEqtVR1IN0Y+02IVSjVWDcxPmUm8WWvGdrWwtF/kJVrNoJIugEXzf9Sc/ZtDRxZX5vFUHTM32B+pRGq3vm72gKwqqM5O1vTX23HTUtVeyPM8PazOOznTe5hmeTmaDyeQq7AZLCgLclQJydZvqA5QvCg+kBVrgR9g9NHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3yWUt92RYjaVq36hVfDIsDlm+v7oBVX8yZMbyzBtAU=;
 b=keSRUCCMd0Xev2BLgoyXTKFLaXoMww07Z4M+Ah1MeXikCS0OrML27WX1jc0iEmzFVaQVxUojup5HBfZRnYP0NqQSalhOZgkhjHlTEp+k8/PVwgf4COYIAdw2HKwlkScqD0+sUSBQNKvPc6EnNUKEza5QhWY08WHEAnsyrsukqYhAMJ40KoDS0MaO/aH9ctdYWt/L0I8CCVait8FFPl2IW32Nm+AWV83tlEvR4uWkCdlgPor/Unqnww4HsDteDyXQE6LUvEqj8usqoLu0rqF18VnUlvq+RfCDSslkKAc4TR9t90S3IW8bT3+hzwcNULuyJNmBaBx2iSiAE6LdKpaWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3yWUt92RYjaVq36hVfDIsDlm+v7oBVX8yZMbyzBtAU=;
 b=vIhUETH375jn+QJ4Xc5lSET0/MI36lY4mbtXnjK5+ba1eXadHu0RkRqmlV4kOcH9XIIr00HtjqT1TZlLa6lsJ288ZwsaUMb55Q1+NfE3u4Q5ffZMvZNgZhRmQ/fCia0bqIkB0MKXe8AErj/MWBTaLOPhXDuocu2Z0GpNDIXFvFw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:27:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:27:24 +0000
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
 <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
Date: Thu, 10 Jun 2021 13:27:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 10:27:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee61fb21-5ab1-4355-3431-08d92bfa56ce
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078D5768C26D32BB838F022C1359@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3MqeDBJuxHWZhj2XBHuIGXslm8d1eC9FCTqkKeaswBB5QW7ZIhOioQu+8kdYM/RbRHnwSlL3PqiKa5FhY34K4h9MVXF92DggrcbcHmoIf5Kxgk/Dqb33LjEfKuPYr+JiE0Yj899xB/NE7/IxbTsUAvw5CfuM1qg/8vmxQKlFhV4Tqnp3XeQFzUQ0BtdRNkG/57qwd7cb36zarl6FMZaczH01iK3D52uCU5KPHn+Iy9aWc8oJqT90FTub8SpP9HqFx2iMDHNcNdoP/NC6UIuFUrYvVwe5MQHQsGEBjQX8tGlheHK5ACMCGL5MSXbwiD1Y8F1o5GkQgpkshK5fXTFnz2cAcqUkPYIfF6ZBrST3N7vaVp0lLcu1oJF1YtEfs22UK38oom+EDexNPEr6setjwYEGWg7axYTHFSkuADVgkJXeZjrw7D//eED1j+f0kclN7XPDUp7J6l0oXwSK+mCbUwv7No8m+4F2UdXApGYXfh/onS1G38bjPy7Aou6h4eeTtGyqEPgJm0cbTYShAvsIBmSts9GAv1vtDVdPFxOiQ0MrA7F0XarM8QMhCAd2R1A5Lfs4kDeSaReAsrW1tSKvjw762u8LsHeMe/o5dJgfYIe0wx8qzXxS7jHBQcjy8ntGCFbSjZcy74MScoHFfkZDve5E7NPYfvzsTt2v9gILAINFsgIkS9p0EuiQQtsIvQZGcI6oi7+RbkIXkKwG5r+UBNyPQqeynSBj469jlGbGsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(366004)(376002)(2906002)(478600001)(4326008)(16526019)(6486002)(186003)(31686004)(52116002)(66946007)(36756003)(2616005)(53546011)(26005)(5660300002)(31696002)(86362001)(8936002)(83380400001)(66476007)(66556008)(8676002)(54906003)(38350700002)(16576012)(316002)(38100700002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T01HY3cwOTlSSlczUDFhbHgyY25SSFkyOEZqV2NhMDNmQ25Ja1IwSnltNmor?=
 =?utf-8?B?ZkVNQTZUU1VPUzZRVGduTVNQcENRK0xuMkVsQTlNS3B4cXNMUndHMjBqenVs?=
 =?utf-8?B?M3FoTzQ4QTV1ekNnU05lNzZaRnhjUURyQkpWcGhKZjhpaE5ER0M0Q1ZuTUx2?=
 =?utf-8?B?c2QrLzR2TERxOVNQMzdQbnFFZ1NJV0dvSlBxNzFTVHEwTXlKQ1JqeHFGTFlE?=
 =?utf-8?B?NkxHcTZPRHE4Z3lSRTdDaFJreU5PVEpYZ21BaFF3S2hCS0xsRTFvTGNJUlh6?=
 =?utf-8?B?NitFUzZ4OEdOM25HQWYzeVdDMytWdVVkSzhHMUZOWWloTlVnQk1pakJhUXhZ?=
 =?utf-8?B?c1ZzZWcxbUZoWlgrbUphWlVGYVNmMUV4YzFqUTQ0L1QxMGYyZlE0Q3V6Yzd2?=
 =?utf-8?B?VGxMY0lGWGV2T1hjbnNIVDlGck1CT29TTmh6VlJydWE1bk5QUXh3WHlDMkdC?=
 =?utf-8?B?QW1jWTRsNVhLRy9yM1JrWVJIcUY4M2xlSnAxa0xsNVpGWTFLemRraHMrUG1z?=
 =?utf-8?B?Nk5IcS9DMVhNaDRtY1UyRW5uemxwbStQUVZxODVEZHRXWXZ5RFczb2JXeStw?=
 =?utf-8?B?UVBXQmt5VlpJWVhuRjJFMFJaY0xic0hOOWFyVTRrdXQ2Sk9KZVI5cEFpS2hx?=
 =?utf-8?B?bTR4ZFdpQ2twWmR5OTQwWDF2clBhbWYrZ2pjL3QyMDhDUjI4Nm1nVXpLRGZG?=
 =?utf-8?B?ZXN1YkE5bGNMaDdubEtjb1BVdUZaTUVJVHQ0dzk2MExMS1hkS21wVzd2Y0xo?=
 =?utf-8?B?OU02b0pwMGpHSWl2WnpnMGhuTkovMzEwb1U0R0lEUzErVk9Ua25pTU5weEs4?=
 =?utf-8?B?OGg4eTgvTHZENXh2bDFnakJqL2dLci9IYmw0ekVKV1hzdHpjdjZWOEFwQ1pQ?=
 =?utf-8?B?d2Z6dGRhWHpkYlArUEtpYjJSVnR2SUFSQXRMaWhNeGFqbGZVVUVLZ2ppNEgv?=
 =?utf-8?B?MTdiMFllQ1pza2pUbTMybjJCVUlZR1F0bURKY0dZMDdaTkN5TUkwYitiZ2ZH?=
 =?utf-8?B?cVlSeDZRQThBUjRUTS9EempPQVg0aEt0Q2VvbzlwOFd0c0NEdmQ2WVRlRThk?=
 =?utf-8?B?Y21Za2ZldFJwN2lsS2ZRZUprM1QzaFZBaEhzRnpPWjl3aXVySUw1WStjMVN3?=
 =?utf-8?B?cll2QVpabnAvOUhLMFN0bmJoM1VkaUVOSHBSRnl4WGhURmU0M2M3YnZGamVO?=
 =?utf-8?B?andmWmtaWk95Vk5WaU9tbDhIc1ZTWlpncmRnM2JMVERTbHJUK29NMnZlcUlK?=
 =?utf-8?B?blM0SjQreDlIM3phT2RoZkFnMDRmLzM1bGowMkQ0WEdYTVJZQ0RPVWU5b0tr?=
 =?utf-8?B?Nm9MSDIrWUx4R09HYTE2c3U3clhYOGpUM2RRc1pDeWk3SlEvNHlPMkJUenNN?=
 =?utf-8?B?a0RDZDhOWkU1Uk1xYzkyNUFJSmYrR2o0VWtSekJOSml2NENEQ3lReGQxUlJ2?=
 =?utf-8?B?UU44L0Z0My9pWmNVK0FUcTZFMExOdWx3NzhmZTRaZXZ3blNKTlNQd1ZNTVQy?=
 =?utf-8?B?N21zV0o2bGFWVUo4eFVnN0dEV0tOdHFLQ3A4Qy9pa3I0MXN5NkRubThzbmtx?=
 =?utf-8?B?dlhDcTRaSE1jZlQrbFZnSjFzbktxYTZFUzJsV0F3bHhadTErRUF3SUdqQ0kv?=
 =?utf-8?B?elZLaHU2aEZybStBLzJHazhSLzMwenIzZzZlYkxYKzY1UjRsd3BTdm8wL1Fj?=
 =?utf-8?B?b21MV2MvZ2g2Wk82UXd6ZGdxNkJ4MnRsN0V5QTBZakwxZGlEUC9QY0tFd2hN?=
 =?utf-8?Q?Tpq4wggsM38Ed8duk0eKzHsFc5n2AYC5brnPCAb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee61fb21-5ab1-4355-3431-08d92bfa56ce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:27:24.8555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL9uFCu2FyfL/g2O1aFK78xTe3zsthD6NgX9Z4ViFCTnaKf4U1uGwlO1qbJsgTUg1w8MGYnVGWixhliD9IPFVgyAwGImi3X97Od49jw+LQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.2.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.06.2021 13:14, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
>> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>> and BlockCopyState in IN, State and OUT fields.
>>> This is just to understand which field has to be protected with a lock.
>>>
>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>> and thus here left as TODO.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
>>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index d58051288b..b3533a3003 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>       /* State */
>>
>> Why previous @list field is not in the state? For sure it's not an IN parameter and should be protected somehow.
>>
>>> -    int ret;
>>>       bool finished;
>>> -    QemuCoSleep sleep;
>>> -    bool cancelled;
>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>       /* OUT parameters */
>>> +    bool cancelled;
>>>       bool error_is_read;
>>> +    int ret;
>>>   } BlockCopyCallState;
>>>   typedef struct BlockCopyTask {
>>>       AioTask task;
>>> +    /*
>>> +     * IN parameters. Initialized in block_copy_task_create()
>>> +     * and never changed.
>>> +     */
>>>       BlockCopyState *s;
>>>       BlockCopyCallState *call_state;
>>>       int64_t offset;
>>> -    int64_t bytes;
>>> -    BlockCopyMethod method;
>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>> +    int64_t bytes; /* only re-set in task_shrink, before running the task */
>>> +    BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
>>
>> hmm. to be precise method is initialized in block_copy_task_create.
>>
>> And after block_copy_task_create finished, task is in the list and can be read by parallel block_copy_dirty_clusters(). So, @bytes is part of State, we must protect it..
> 
> So if I understand correctly, you refer to the fact that a parallel block_copy_dirty_clusters() can create another task and search with find_conflicting_task_locked(), or in general also block_copy_wait_one() can do the same in parallel, correct?

yes

> 
> Here there is also another problem: if we add the task to the list and then shrink it in two different critical sections, we are going to have problems because in the meanwhile find_conflicting_tasks can be issued in parallel.

But we shrink task only once, and we do it under mutex, so we are OK I think?

> 
> So, is there a reason why we don't want
> QLIST_INSERT_HEAD(&s->tasks, task, list);
> in block_copy_dirty_clusters()?
> 
> By doing that, I think we also spare @bytes from the critical section, since it is only read from that point onwards.

This way find_conflicting_tasks will just skip our new creating task.. And we'll get conflict when try to add our new task. No, we should add task to the list at same critical section where we clear dirty bits from the bitmap.

Then we shrink task in another critical section, it should be OK too.

> 
> I am also trying to see if I can group some critical sections.
> 
> Btw I think we already talked about @bytes and it's not the first time we switch it from IN to STATE and vice-versa...
> I mean, I agree with you but it starts to be confusing.

On last review it seemed to me that you actually protect bytes by critical section where it is needed. So here I'm saying only about the comment..

> 
> 
> This also goes against your comment later in patch 4,
>>> @@ -212,7 +222,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>>         /* region is dirty, so no existent tasks possible in it */
>>> -    assert(!find_conflicting_task(s, offset, bytes));
>>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>>         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>>       s->in_flight_bytes += bytes;
>>> @@ -248,16 +258,19 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>>
>> The function reads task->bytes not under mutex.. It's safe, as only that function is modifying the field, and it's called once. Still, let's make critical section a little bit wider, just for simplicity. I mean, simple QEMU_LOCK_GUARD() at start of function. 
> 
> Where if I understand correctly, it is not safe, because find_conflicting_tasks might search the non-updated task.
> 

find_conflicting_tasks only reads bytes, so it can't make damage.. Anyway making critical sections a bit wider won't hurt.


-- 
Best regards,
Vladimir

