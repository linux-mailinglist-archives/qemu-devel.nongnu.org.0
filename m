Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9E38B242
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:53:19 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk34-00042R-Hz
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjss-0007oa-9A; Thu, 20 May 2021 10:42:47 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:3809 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjsm-0008OR-Oi; Thu, 20 May 2021 10:42:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbg6v9OKW7I7TSat9QL1yBexFThqVJ7SaHQsrKCFOFIYH0mT79sYd3hz23xp0jJSOGJP681wQcow4vgqOFisXHdM+2F99eSoHqsCst8OVG1MwCdVtw5agg6ltRTrT0hAM4h5AU6NbMujgLn4VbyCHSrRRbWxLM0O6ezdr9lcFN2dHSVjjbzAIc3Sgr21ErZuQpa0UNJTz1Eu6fxXtc8etH96IAItobmRmTdZ6lYxzl5nBTUS6fQauJCFsBv2b4G9Aldkvdzjwb8PY4rB29ob13b3UgLMPrHeeQJPFNtmcry11suMjBeFSL1hLdazydyvEp3Z4q8qo8JLIqCHxShklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nKnXm9t8j1AiXNXp+ph7RwTJqoCwMPifGpFp3vvi/I=;
 b=W4I0zistUt3t8yQCKHCnwjkXkFwtNwhaC+xoi9uqV+Ryjtgeg2G/zBLwR/DDmbW4Pip97jYMhFubDqUNJPPNu/KI3L6YfIGjCgwwZYazgKIO7g2Edwno4vCxKsdEeR+onNa2X2pZ7aFc5Ns4FaEySUc6W9aYDQ6rnooXWY0P0v48kDThL3XWcJnzehltuGK5cilMWwR3UKYZKC3XwVKgzx7x0QCi1oJxGerMI67fVBraXF7VeXx5VYnuteC/qQc8Jyt53w/mc/7emPRhowdcmEY1FGDpXCXdIBuFC6vknSWnINi4RUtKMexkIqx060Xc6biVSChFzwyr0RP3Mqx3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nKnXm9t8j1AiXNXp+ph7RwTJqoCwMPifGpFp3vvi/I=;
 b=cSIyFHsCcgp5DwI4/vSCVNZ6ZPFIQwVc+105Z39lS0Ew5XqRAaZhvr6kXoXjvXVl2zwMAf2AOv1iTa7684uW6e27We6ML82QZiocXAlSs2Ndq0CAJq/euxFquu69HUvTqp9wKKa1ewoHW1cAzkqE1vwwd9GrZvsODJ1a+VRS/LM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6995.eurprd08.prod.outlook.com (2603:10a6:20b:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:42:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:42:37 +0000
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
Date: Thu, 20 May 2021 17:42:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Thu, 20 May 2021 14:42:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec12af1-328d-461b-3598-08d91b9d8324
X-MS-TrafficTypeDiagnostic: AS8PR08MB6995:
X-Microsoft-Antispam-PRVS: <AS8PR08MB699513ED5D61A16AB2D0F1E9C12A9@AS8PR08MB6995.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8H5pFQVdxq44t4AX1WPype0IOD+vmEm9C3ELzooLBkjhVYRMEVsOFBdjX583yCvpiX/2f4vtR8e9pj40EgqU4lMvdBWVJgZbU9Ryv/OTYUu5Mmn4oFt+z0vydDtOMMPG+H2M2c4uxo3hiZGlmAobqzY/4he15VupDLISLjq5iQKwp7VP37c2j0T/M/095xc/07Xoo1OsdmJScl+NSBwS0C8ETfaSAcZP1VtDSBHCSe5QoRr3xMmSUo28ZF7Ed+WjtyxzvmuQMyTff/qee2CmgoSFQzlnq+WQ8ti7sUCwSs1HGeSx9zazzNtAXtmuhNxFpsUQw2JUMLZgG7Y1VazYHCYr20jVNsbWa54a9MZPTDmPdQIHsQjbcGlKg9szsV5H/fLctDNqjXqQzTUNimwYrNOv3xXLHwJsORRwT0buz7oWHoImXT39OAH7vHL92QarfE2zEf6SFcV8Gbiw1mNSHXCz0YD5jl68hvgp6+qyTVfq5LR5YgudNGtNF5jUMtcH+FIObYVFuRvGr/ebUdBPbO+koGmikUWEtOSfEsbvoSHJ+agxdicwdzsdiUg1ro8/N80n151+8QMXcz1rMlZmf70xIXarphcYxjjOM4t2PAsFmbTanoZl57ApC74sDah600VvwPFzXHbCfwtREXeAt9ssrBeJ/c5xS1bk176Nmw7qHGzMTs9wF5i1G+nI2yok6+WKSFjspzadVGYnQiAdVHtBDOOfXQV/Gi/f4zXank=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(366004)(478600001)(956004)(2616005)(316002)(52116002)(38100700002)(86362001)(31686004)(16526019)(38350700002)(5660300002)(36756003)(4326008)(8936002)(2906002)(8676002)(31696002)(83380400001)(16576012)(186003)(54906003)(26005)(66946007)(6486002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzI4NzRWMExlc1pBRzY4czVlcmI3bmZHYXoxT1JmVGg3N2NFM0NVVlZpRUJO?=
 =?utf-8?B?SHhSdFh2YXgxSGU3eFdDQ3dkdVI0elgyLzZLT3lDZXNYKzRUVUl0T1ZvVnJS?=
 =?utf-8?B?S0xsTnNGTVNTdGdCMGZWMm5jcDRQSGp0bDBCcmxHZWttSHBCcElIck1EQy9u?=
 =?utf-8?B?aVp3Y3dldkJhVVdIQ1hRUFlsMlkvb3JjMEZFWkE0NDRMVXpnMHA4QnlQcjVl?=
 =?utf-8?B?RjNGd1dCbGEzTE1zN0ZiZ0YxcmExT0FWQ0VpMG5McEhMYjUrdjMzYVJXTzFM?=
 =?utf-8?B?SkowcXU4V0wvVHIyOHYweitjeHRaTTNERlFqT0VpcSsyaEE1NlRvdVhsdEg2?=
 =?utf-8?B?ZWJPdUZGOGtwc3BnSnJ6amp4TW5KTitZc3ZwdllFQVpYUDhFQWl4ai8rLzV5?=
 =?utf-8?B?MGNXZFRtL1RhM3owcTRpbkVudG9QRkw1b2YzdW5QWk9kcGZtWWFMQzBFczdZ?=
 =?utf-8?B?dWRvRHFaTHFVQkxJcHpNYy9pYmlkRVczUzNuc01ScmtLV3NWZERSb0tsNWpl?=
 =?utf-8?B?a2IxVmk2SXBmbGtkS1cyQk1XUFlpK0hFOUlCU2o0ZEdqNUNweVUrVDdrYjUr?=
 =?utf-8?B?Rk1MbVYyOUNkN1ZMR3F2YlJ6Y3ZDVUdBQXhRb2U3aDRyd00wR0ttNjJ3Vzc1?=
 =?utf-8?B?Wm5VL3RFcjk2N01BTU5Va21WSVB3NHl0eWJzL2h3clEybUViNjM2bzdvaEpu?=
 =?utf-8?B?MkJWaTB2TngzZVIwNG1wTzZkV0dSVS9rTFRWL1k3YStEZmpXQnNOWHRRMlBW?=
 =?utf-8?B?MkdSQkNNbEFJNHAvMVUvZUVRK0NMelNCQjdzQWcvc1ZLemlPNEZOTk1RYmhm?=
 =?utf-8?B?dkFQbHpVYUpGVVkzcCtUMmRHeTVkM0d0L3RKSXBRWTIwRVg1VTZNTkdwemVn?=
 =?utf-8?B?UmI0WjZ5SUZHOTUyQU1xeTA0clphVTM5S3d0eEVLZG5nY1JpOU9POXRFVFpW?=
 =?utf-8?B?a21MSmRjSEZGT1FLQ1VnR21HSXgxWW5hZHJqZjY5R0xQeEtNMlVzNmdMS0RL?=
 =?utf-8?B?U0hwRUhvN2UyRGtiYVdQc3VubHhJVnpSdy9Dd2tEcWFUY2RNR1pHaEl6WWk3?=
 =?utf-8?B?ZFN1a2hxb2JLWnIxSHB1U0NvMzNmYjFUMkJjUGJSSzlWaS9xaENMVFFmbnd2?=
 =?utf-8?B?Q3hudWNnbERCUmRUOWhkbEN2dW5zd3NnOTFYL3U1eXZDYUpRVElrc3lveGlI?=
 =?utf-8?B?MkYxSGQrSlg5Q0VxUW1hMGVaWWlLMng1bHZJOWdSbjJSM3RBNS9HblF3Qk43?=
 =?utf-8?B?a0ZOYmFBL3hmUURUOVlSUGVraUV6STQ5K1p4RlJoaGQ2cW9OZU11RHgyY0tQ?=
 =?utf-8?B?U0lmS3laTmtNOTdRQUg2NG9QQ2w5N21rcVpBMUNaSmpWMzZ4LzVIV2pJUTJv?=
 =?utf-8?B?S0tEZ1NFVlM2KzdvU012ZzhmWGVxb0FSZk1ZUWFUMGh3eUZoR21zaWZoc0U3?=
 =?utf-8?B?T1JWbGdxK2RyWXAxcTl3REVDOGNtZ2RJQitqelRDYnY0blZ5Q1RuOHJWYVNM?=
 =?utf-8?B?SW5TbWszK1l4ZEVjQlVWbk4yMjVBNmtMMFBCYWFjV1M5OHVCUm00dFRzeTh1?=
 =?utf-8?B?MUd0aUdIRkgrN21mSkN3cU1oSjJFUVZWMWp2NGVreXpDSkk4bzlLS2x4cm1n?=
 =?utf-8?B?bHVTTG1yYnlheXhhUzg5YzlISDRDbzRpaFJZUG5IL2JaWXFjWmM1dXpPbDBs?=
 =?utf-8?B?WVJYQUcyQ2h5NWUvQnNVTmFxSjluWWFnbUJxRTlQaHZhRnFrWUg1SW84Qlht?=
 =?utf-8?Q?zfKmRMXyb2vgbM3Ix4B0+MOGmnbA09epASLbl9p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec12af1-328d-461b-3598-08d91b9d8324
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:42:37.4396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CjCO4Z6LOALIWqBq5p8gY9gutoD72zSCLiA/m4CDUyDVGUzZNI5rn4UYDoAh3EQ4ZPTD2hc5Ww/aND6+EWUio6SfZaoCG6pv2iR/KxG6cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6995
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Put the logic to determine the copy size in a separate function, so
> that there is a simple state machine for the possible methods of
> copying data from one BlockDriverState to the other.

Honestly, for me 4-state state-maching + function to determine copy-size doesn't seem better than two simple variables copy_size and use_copy_range.

What's the benefit of it?

> 
> While at it, store the common computation of block_copy_max_transfer
> into a new field of BlockCopyState, and make sure that we always
> obey max_transfer; that's more efficient even for the
> COPY_RANGE_READ_WRITE case.

hmm, maybe. It could be a separate patch.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------

stats agree with me, that its' not a simplification.

>   1 file changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 37c8e8504b..10ce51a244 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -28,6 +28,13 @@
>   #define BLOCK_COPY_MAX_WORKERS 64
>   #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
>   
> +typedef enum {
> +    COPY_READ_WRITE_CLUSTER,
> +    COPY_READ_WRITE,
> +    COPY_RANGE_SMALL,
> +    COPY_RANGE_FULL
> +} BlockCopyMethod;
> +
>   static coroutine_fn int block_copy_task_entry(AioTask *task);
>   
>   typedef struct BlockCopyCallState {
> @@ -85,8 +92,8 @@ typedef struct BlockCopyState {
>       BdrvDirtyBitmap *copy_bitmap;
>       int64_t in_flight_bytes;
>       int64_t cluster_size;
> -    bool use_copy_range;
> -    int64_t copy_size;
> +    BlockCopyMethod method;
> +    int64_t max_transfer;
>       uint64_t len;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QLIST_HEAD(, BlockCopyCallState) calls;
> @@ -148,6 +155,23 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>       return true;
>   }
>   
> +static inline int64_t block_copy_chunk_size(BlockCopyState *s)

"inline" word does nothing in static definitions in c files. Compiler make a decision independently of it.

> +{
> +    switch (s->method) {
> +    case COPY_READ_WRITE_CLUSTER:
> +        return s->cluster_size;
> +    case COPY_READ_WRITE:
> +    case COPY_RANGE_SMALL:
> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
> +                   s->max_transfer);
> +    case COPY_RANGE_FULL:
> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
> +                   s->max_transfer);
> +    default:
> +        abort();
> +    }
> +}
> +
>   /*
>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
> @@ -157,8 +181,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>                                                int64_t offset, int64_t bytes)
>   {
>       BlockCopyTask *task;
> -    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
> +    int64_t max_chunk = block_copy_chunk_size(s);
>   
> +    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>                                              offset, offset + bytes,
>                                              max_chunk, &offset, &bytes))
> @@ -265,28 +290,27 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>           .write_flags = write_flags,
>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
> +        .max_transfer = QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
> +                                        , cluster_size),
>       };
>   
> -    if (block_copy_max_transfer(source, target) < cluster_size) {
> +    if (s->max_transfer < cluster_size) {
>           /*
>            * copy_range does not respect max_transfer. We don't want to bother
>            * with requests smaller than block-copy cluster size, so fallback to
>            * buffered copying (read and write respect max_transfer on their
>            * behalf).
>            */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>           /* Compression supports only cluster-size writes and no copy-range. */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
>       } else {
>           /*
>            * We enable copy-range, but keep small copy_size, until first
>            * successful copy_range (look at block_copy_do_copy).
>            */
> -        s->use_copy_range = use_copy_range;
> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>       }
>   
>       ratelimit_init(&s->rate_limit);
> @@ -369,30 +393,25 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>           return ret;
>       }
>   
> -    if (s->use_copy_range) {
> +    if (s->method >= COPY_RANGE_SMALL) {

I don't like such condition:
1. it forces me to go to enum definition to understand the logic
2. it's error prone: it's very possibly to forget to update it, when updating the enum, and logic will be broken.

No, I don't like moving to state machine for this simple thing.

>           ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
>                                    0, s->write_flags);
>           if (ret < 0) {
>               trace_block_copy_copy_range_fail(s, offset, ret);
> -            s->use_copy_range = false;
> -            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +            s->method = COPY_READ_WRITE;
>               /* Fallback to read+write with allocated buffer */
>           } else {
> -            if (s->use_copy_range) {
> +            if (s->method == COPY_RANGE_SMALL) {
>                   /*
>                    * Successful copy-range. Now increase copy_size.  copy_range
>                    * does not respect max_transfer (it's a TODO), so we factor
>                    * that in here.
>                    *
> -                 * Note: we double-check s->use_copy_range for the case when
> +                 * Note: we double-check s->method for the case when
>                    * parallel block-copy request unsets it during previous
>                    * bdrv_co_copy_range call.
>                    */
> -                s->copy_size =
> -                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
> -                            QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
> -                                                                    s->target),
> -                                            s->cluster_size));
> +                s->method = COPY_RANGE_FULL;
>               }
>               goto out;
>           }
> 


-- 
Best regards,
Vladimir

