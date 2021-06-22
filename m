Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104BE3B0010
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:18:17 +0200 (CEST)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcXw-0008BV-2u
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcVv-0006ZI-3K; Tue, 22 Jun 2021 05:16:11 -0400
Received: from mail-eopbgr00094.outbound.protection.outlook.com
 ([40.107.0.94]:3123 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcVs-0007wH-6d; Tue, 22 Jun 2021 05:16:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE4Vv576xURw4stDORfrL4qEhh6yZa9T3EMRjoohV8gpBi4g6Z9cFEOQaBa6VFAv76NuW1JcVJS81IFtVloKzh8TW7vU/1bSYlB/Jw+QWE0+oyXXuTlZjW9O7CgmwYtO5yfTb/XvK+YFtJiSh4taIpsUQq6rO1CDVlbAKm+TcxM2I45CphdUNvNsGDkRuHzLa/mtMrUg84o1MyNt8PtZ+NtEGWse4kG0nQArhQ/wA8DKy2S0rp47K+MtZhyAeXF/i1FFd6KpgJdaBdHAKg3w9aHRhon+oqtqhyrdtVylLfrMjd8mui+CYkekOrzq+OO3uO1nrkYr3hLfgK//3ap+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knvWHLpEwGEC0C9L+Psis2Ab3xgXrW+dikgWTUeURwU=;
 b=VEUyvTkZ+CHm1Pp6f0gUZj1ydRs3YZp1Ya+64h8KTlMj8zEyOH5kkv0WXRPGahRR+a6dCLtiGSDk2uOp4nuDW766aVdvPeCtrNVRx6M1NuUw063eVLqQWLKBq00Q1OHKPeSXotYjrRpdxa2EzKArBSW+7wbqq2WrYdNPESKlOiOG23PvNcYFJ4JJZ5T9x/6UP2UUVtTGmnVe6/3zTyciCVRxnlSpXC/wH2av2y5OL2TC81pWXtvKkrl5pxrZsUcNgQg8EU+rF5OFSThp+0MgczkUkL/+j/nc9S8wTT2zEcCeVJJ2HSV7EYgZCPTaSkQNOS0e3Is0vfgRaMlMCdLesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knvWHLpEwGEC0C9L+Psis2Ab3xgXrW+dikgWTUeURwU=;
 b=GQw1iALEWxmmSJYLo1sSiWn6SKdVDpIis1JLpaGo4j/bJq1fGu51tIx15aSDzcDs9HRDN1bYrt4zTYUV6ZVoVWt3J3RufX/1H0k8SWZ7RPZdaRrW52OL6I7be41tWm4jeKPWaBewUjsukE9MwFtXzNb1ZjpdnQRLtYsj9N11u0g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 09:16:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:16:04 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
 <6e031269-3ecb-f2f2-9833-eef4073cf5e0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ca46e6ac-695d-e46e-0441-77f435d87760@virtuozzo.com>
Date: Tue, 22 Jun 2021 12:16:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6e031269-3ecb-f2f2-9833-eef4073cf5e0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:3:8c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 09:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a887a276-8894-4d0a-7492-08d9355e5c6c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946248A44E14F6BFD41910FC1099@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVePLfQMKUSpKi5BMMrBbi/mLfcpN42owGLrTqkaeEs2PbRfN5bSqwIbsTQf1pf4LDkZdtzC3LVa94zFRmgAmSzkYo4g1vlXlAxUk5H2dEi0p5Dzc+n2kq8yWumeQvy7+Mke7t92MotqyxsCt5pR9C6YohnW7OJMdTlZC2YkuHrbQ5iS247YBCz2UE4ccCkTyVSX0O19JUxSvw4N9J/naONP4zqBpPlb3BKA08thFy//xIqv1gl4ofxaUCeYW/RTIhe4SB31cZSzUKWIq5kcvHxi3nEzDV4m0ySX7H0V9n18ddJcQdODehucz9zEJpiV7DjcxFiZt28b3ZN0V3xRXxUXE9NbyIiAHfku2RLH7IVBRP0RSe+MxToaF2wZcUkmepeRKoK4lG+xRK5LlyKo7uNfV/uVWzrXgmRMhj3mkrijc9awwhto+133AZ7z6s6vf/vEWzM80B/ic0Pb1vZ8R8gkbLXVfJS6Hc9ipO7F+qGNOWTkR7gBXP9DXEUiQFkgoExGTurITOShgoJ9e9wfTK15RqNa5Xyfgw/CDF/Zyf4beVAmj10tvUaCO4PS8yxoZY29uiSLJdpQ0tndiQum5IhxbgVx8N9/oxCd+LdujvXyD1KWLFgHWvG5mQy8YkR194uUhWZ1NjB5Qm/SgnAUx0LBE1dBHm8O5cOXwLZoxLbGq/+28mBJQleh6AhPYge/LN4ib/eOjRx3YQ0sDsBc4NFIdYoeiTobamo8p6H1D8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39830400003)(396003)(16576012)(6486002)(478600001)(66556008)(38350700002)(8936002)(316002)(36756003)(2906002)(16526019)(53546011)(186003)(66476007)(52116002)(83380400001)(66946007)(38100700002)(86362001)(5660300002)(4326008)(54906003)(8676002)(31696002)(26005)(31686004)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RiU2RHNHpQbThrRkFQZHFxOS92UFhjRDRKaTVUeTVIOGFyYXVBQ2kxcjBE?=
 =?utf-8?B?ajk0bWx6dGI1Y3ROcUd0T25YOWZOa1VDQnk3ZEhsalFFeHYrQ1BOVFJLYUlI?=
 =?utf-8?B?R1hkY3NJTzVFWjZIcFJPTnQ0SFJoaGRUT21zM2VXMlRFYlNwajI3bHRPRDQx?=
 =?utf-8?B?UDRJSVc2U0ZNSXdFS2Q4VzF5K3FpN1N2NHV3QXRUdmhhdFVtUkRrMjJYc0Mv?=
 =?utf-8?B?aS9iVjVlVUZnK2lNU3FxZHJzRkVkbEQwL21ONGVPMmJiVDVoM2RLWW9FT0E5?=
 =?utf-8?B?REcvakg5NlVrM1prenBXWkdWZ01nWlR4TmxmT05EdUxJdU1jUlA0and3SW1K?=
 =?utf-8?B?MVRvc0pISkNFL01ydGlDem9HLzRrY21KeHJYRWovT2t4dk9jZDhlWVAwMmYw?=
 =?utf-8?B?Z01QRDIxZjdOZEFhcVpBV2JtUlRPUTNKbmFKdk9RKzVScktxL3JvSFFmQm9E?=
 =?utf-8?B?M1d4N1laNmlKVG9TRytlNUN6djVncExhWTg5bmpQaW5kd21NeUpxajF5N0pj?=
 =?utf-8?B?cFVYQktFdjBoYUozeC9iUkRaMEp3ODlvNm5mUW1naWFhaWMybml2QmUwcHA4?=
 =?utf-8?B?SnJPQnlvVDJkVDFwcVhGNzduNGxSWnlHSlcxcmk5RTQxZ29TbVhLNngweHFR?=
 =?utf-8?B?MkFPc1EvSG1KWFdyNzBFdnkwMXdDL3N2MjRySWJkeWZoVHgrc3ZIMjVxQVRq?=
 =?utf-8?B?RjZqU3o5VGpBUEVPeENOSzVaVGxONkZoMnBuMmJhMFB6dzUyRjdvUElQNFdF?=
 =?utf-8?B?U1dsUU9qTm1WazN3SUFkMHJzYUthMkJDbjdFVy9IT2h4QkdDM2xOTEZmQkZt?=
 =?utf-8?B?WUkvMDJ0L05veDYyUTh1YXVlNHovamJhZzZFakRlT3FMNURTR3IvYUdEdDJz?=
 =?utf-8?B?TVRjR2cvQStpb0dFakZHY0tPdDhDSUVFTmVaT0g3Z212VEY5ZUxQYUlJbEF6?=
 =?utf-8?B?dERySVk3M3Fod083cWNYbGRjc2xFdFhuTzVXcnFwV1BYRjFob3F1TWdFL1dw?=
 =?utf-8?B?SVlndjh2UlpHZXk4dHRNRjBoUGxucVMyc1c0L1ZITTVCN2N5UEUvTXlUR2sy?=
 =?utf-8?B?NE1DajVMVldRYk5UdEpJeDBWdU9uVVNxT01uUGFOYWdjYzUzelBpSVZUeTF2?=
 =?utf-8?B?SktNUmhZY3F1R29kd2xReHBrN0crYXBLZEhPTEhIWTFUL0VadktYRXlNeitH?=
 =?utf-8?B?Y3dxazlNU3dqN1VVNXY5WG9GK0RrZnBBeEpwZldDNVZncGhEMXdMUFVkS20x?=
 =?utf-8?B?bHdsMW5Lb0F6cEphMUo4RENwN2ZyQlhMTmhVT3QwUklpZ1QxZVhWeXJFeWN6?=
 =?utf-8?B?KzV0VSswUUc3ZkhGK0lJcXBRcnV1Qy82TkJMemhJNnNyRG9mQWtXeUVHdEhH?=
 =?utf-8?B?UFFqQ1k2bmFYZXhQSjd5dGpXUmM2dGVtaDl0ZEFGeTR2MXBnRFVxYWxrZFF2?=
 =?utf-8?B?c2pNQjVQWW9EY25rRzVId0tHMFhURTkwZ0lzQ0RFc2tWcUowRHF0MEd1bGZF?=
 =?utf-8?B?QUxUN21TODFoZUFpVy9DeWRzZ1VSNU1jbVRuVHNlQXZHQktXWmJhTDIwQTRJ?=
 =?utf-8?B?Nm11a2E0N0d1cjdkT0w3NW5EV0lNNXZCUVd4T0hPOUVqd0J6bDFoNkxuZVNG?=
 =?utf-8?B?byt4K3RTbXBpU2MvNUcxVEpaYzJLem9qZTE1d2F3SlNYZUw5cXJGUTBmakY2?=
 =?utf-8?B?M1hCQzc2dEdUNTBZUXNWOU1RcVd5M2JBYVNMMVhURUpZZlZ1R0ZqSmlacDl5?=
 =?utf-8?Q?v+djgzouLW8W7ArRfXvLAZCCWYS28LzsskMb8jw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a887a276-8894-4d0a-7492-08d9355e5c6c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:16:04.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKIV8+2C5a2qOvoM7fijREgWpDA+Fws0hkGbKzv+syLldtUizoGhT+RMV/A27BlIGgarfPsRv3Tahjm0CFWANDFEY/NPPn7bOJm0MNM9aIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.0.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

21.06.2021 10:59, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 19/06/2021 17:23, Vladimir Sementsov-Ogievskiy wrote:
>> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>> and BlockCopyState in IN, State and OUT fields.
>>> This is just to understand which field has to be protected with a lock.
>>>
>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>> and thus here left as TODO.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/block-copy.c | 49 +++++++++++++++++++++++++++++-----------------
>>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 3f26be8ddc..5ff7764e87 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>>>       /* Coroutine where async block-copy is running */
>>>       Coroutine *co;
>>> -    /* To reference all call states from BlockCopyState */
>>> -    QLIST_ENTRY(BlockCopyCallState) list;
>>> -
>>>       /* State */
>>> -    int ret;
>>>       bool finished;
>>> -    QemuCoSleep sleep;
>>> -    bool cancelled;
>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>> +
>>> +    /* To reference all call states from BlockCopyState */
>>> +    QLIST_ENTRY(BlockCopyCallState) list;
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
>>
>> That's just not true for method field :(
> 
> You're right, because it is modified later in the while loop of block_copy_dirty_clusters, but the task is already in the list.
> Will move it to state field.
> 
>>
>>>       BlockCopyState *s;
>>>       BlockCopyCallState *call_state;
>>>       int64_t offset;
>>> -    int64_t bytes;
>>>       BlockCopyMethod method;
>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>> +
>>> +    /* State */
>>>       CoQueue wait_queue; /* coroutines blocked on this task */
>>> +    int64_t bytes;
>>> +    QLIST_ENTRY(BlockCopyTask) list;
>>>   } BlockCopyTask;
>>>   static int64_t task_end(BlockCopyTask *task)
>>> @@ -90,15 +96,25 @@ typedef struct BlockCopyState {
>>>        */
>>>       BdrvChild *source;
>>>       BdrvChild *target;
>>> -    BdrvDirtyBitmap *copy_bitmap;
>>> +
>>> +    /* State */
>>>       int64_t in_flight_bytes;
>>> -    int64_t cluster_size;
>>>       BlockCopyMethod method;
>>> -    int64_t max_transfer;
>>> -    uint64_t len;
>>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>>>       QLIST_HEAD(, BlockCopyCallState) calls;
>>> +    /* State fields that use a thread-safe API */
>>> +    BdrvDirtyBitmap *copy_bitmap;
>>> +    ProgressMeter *progress;
>>> +    SharedResource *mem;
>>> +    RateLimit rate_limit;
>>> +    /*
>>> +     * IN parameters. Initialized in block_copy_state_new()
>>> +     * and never changed.
>>> +     */
>>> +    int64_t cluster_size;
>>> +    int64_t max_transfer;
>>> +    uint64_t len;
>>>       BdrvRequestFlags write_flags;
>>>       /*
>>> @@ -114,14 +130,11 @@ typedef struct BlockCopyState {
>>>        * In this case, block_copy() will query the source’s allocation status,
>>>        * skip unallocated regions, clear them in the copy_bitmap, and invoke
>>>        * block_copy_reset_unallocated() every time it does.
>>> +     *
>>> +     * This field is set in backup_run() before coroutines are run,
>>> +     * therefore is an IN.
>>
>> That's not true: it is modified from backup_run, when block-copy already initialized, and block_copy() calls may be done from backup-top filter.
>>
> 
> Ok, I am not very familiar with the backup code, so I did not see it.
> This means we need to protect this field too.
> 
> At this point, I think we can increase the granularity of the lock in block_copy_dirty_clusters:
> instead of having in each while loop
> 
> block_copy_task_create(); // locks and releases internally
> block_copy_block_status(); // no lock used, but uses skip_unallocated so it will need one
> if()
>      block_copy_task_shrink(); // locks and releases internally
> if(s->skip_unallocated) // will need lock
>      block_copy_task_end(); // locks and releases internally
>      [..]
> if()
>      task->method = COPY_WRITE_ZEROS; // needs lock
> [..]
> 
> we can just lock the while section and eventually create _locked() version of task_end and similar functions that are also used in non-locked code blocks.

No, holding lock during block_copy_block_status is bad idea, as the function may yield (it call block_status).

I tend to agree that making atomic access to skip_unallocated is porbably the simplest way.

> 
>>>        */
>>>       bool skip_unallocated;
>>> -
>>> -    ProgressMeter *progress;
>>> -
>>> -    SharedResource *mem;
>>> -
>>> -    RateLimit rate_limit;
>>>   } BlockCopyState;
>>>   static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

