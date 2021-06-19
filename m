Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A543ADB86
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 21:36:01 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lugl5-0003Q8-Jw
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 15:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lugjz-0002aV-U5; Sat, 19 Jun 2021 15:34:51 -0400
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:62018 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lugjv-0002cz-R3; Sat, 19 Jun 2021 15:34:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZP9gyil0hX6K06lzudkpnpfv+Q4JdT98f4kiX4eLQJLxCAv44KVMAvdgfYZV66aoJIJ/rUTtbGA+FXdu03/JB/hLMWR/gccbAXRasnOFbSBa8ucvl+bUUjnVzkjfi6eDsPuSx70gk4LQjwXxokyZ57UI51RN7ZkCt5EqwoKLXezVWrqEHQzrBWkoZdWloa0Uev5mf4/wCBP9uVhUSTIjwpsGBUyPBrMyT2h118afYEr4SAMgWGLOMDIrhQkwl3+mJLDcewxCueyaWUIgo2PmOMVA24qnGtO8FZ0+tEY4ve1cFShQKzBuqV0QobJRJg6HaL/uroN6/MhZdmR1ZGejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgoepWXf/hJWL1eVSTEubwl8aYb/i9LzNp9mnz1FJW8=;
 b=lltpf2xclD9UHaEeYdL199sOpsIQyiPR7ySQy1yaSs8lv4DGM1NiGFaLFcc0qVJ0vz5Snr8LbmpCi5VEOKl4HYMf8G/JFyQItA1F18sYrmrm1akMEeKS05qBP8BQBPmRhPdVTizTs9S4IK14/xRmBEIeINK7AViJ0lZ4EtLgm4hn1Rt7Na3yDmdjlF7XmyYPUcUzL0/pZ3gwZxoXMRlDn2P8eyaQGFYZAEAr9SNdR3Kg9LC7OePTwCVdjiow9NbmFBk6rN+qsHk4ysKMnmmEE67GFSyPkjfE5tuQLseM42E30h+uR01ULRAfsq59yx0uLaAeubjxZqRLXCa3RmpU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgoepWXf/hJWL1eVSTEubwl8aYb/i9LzNp9mnz1FJW8=;
 b=VT3rpLrTApluO0OvIY60NeNqC0sMkZWQSkGeBQXzoGCVtMQ9hDNU2MYjMSnOyikDuRvKM79E8tMgEPh7QA57TtidaJ5KYc6p9MEhrxEL6V3O2kokP8gQCCaBtFfZlAHbr4Okf+olfDGDDgOF4QHs8apS6lzqbkoZkqiXnvloFg4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 19:34:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 19:34:43 +0000
Subject: Re: [PATCH v4 5/6] block-copy: add a CoMutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <580a987f-4b2e-5870-9da3-e8c5bcf5738a@virtuozzo.com>
Date: Sat, 19 Jun 2021 22:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR06CA0151.eurprd06.prod.outlook.com
 (2603:10a6:7:16::38) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR06CA0151.eurprd06.prod.outlook.com (2603:10a6:7:16::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 19:34:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b6b6b7-dfba-4df0-1ee8-08d933594a04
X-MS-TrafficTypeDiagnostic: AS8PR08MB7011:
X-Microsoft-Antispam-PRVS: <AS8PR08MB701159CA65C16AE0CE87508CC10C9@AS8PR08MB7011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVf/3d74u5BUIBxuFgteYV1Iw0DWEobd6ZT3pGqGEheKDFH0LNQAA9FkiSQvNbHAEm0tmipGxqdT1c0G49MIqFBr2JLk2CHybKHDa2lEqmfQumEvD38mttKL47rCroyuXb0ihQDiRtlaA0OAVqPC9ptevVK+X6wfDfB1jUQo6fgbzaDFhdNQf+tA7ovwlNx3ACbuUdXvYaslOd74aTm+SXvIWFvsZVmTNAjjmb8tsn51+aU3g8nBolwVolEeYRYbt8EHQ9HpfO+QJgSKGhOlSxgx37I9ww0UW4nSl9GxZWtvq5MuI/zHWi0QxAS52U3U03P1Iow64+Tlr+D5sQtlT46LHcLv1ADX/AjHRR4OufLE9nBDawZodS9OXMeSBjIcW6rph3DTlpadTjaLwVfkeoh7TFd3sQNB9B/PDGPU3P3UpcjdulZMKmrI83rFmss9m0LoLxVcI11OcElot6pVEbDArywTbu2aLN8tkFtklyQ3jrpHhZs19cQuAYqK1Zqd57M9JTwxOxRVm4aq8dppIIENJ4P7gSSLui7B+vkfrcxyEA8vAZgHU9ilIVofmrjSAfg4Zvr9yktqhXftDU0exAi5gDpXvYxTkiRlyNroVRKhs/KwvkO+3xO10+uP+nUkw0Hex7hZ4RPu9ZyvFEN5ivZXuCv/v77JtVbRHMxQu3vPAaJs5gnUm0YyRhyFugPd3TVyee3pHLJNzFaYKfhru1wr2iZn6SGAgN66K6c2CWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(956004)(2616005)(66556008)(8936002)(66476007)(66946007)(2906002)(31686004)(186003)(83380400001)(478600001)(52116002)(36756003)(5660300002)(16526019)(8676002)(86362001)(54906003)(6486002)(38350700002)(38100700002)(16576012)(4326008)(26005)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJTdiszWXRvcGpRTnpMOHhodHJpQnA1NU9QbmN2TWZIdUpwNFVyeTltd1Bk?=
 =?utf-8?B?dVR0MElDWUlNdDlZK1NTeklMQUZOUGlXVGtXV2pkZnBNV0pvY1JpRjR0ckFj?=
 =?utf-8?B?MG1IK0dvZ3dVOEdQeWlRc0wxdndCb24vSnBDc01sMGdlSXc2amdPdDEydHdY?=
 =?utf-8?B?U0tFWE1PNkdsdFpnQzZaU2JMRmVEY21IcUN6OUtGdmhSU2JEbDF0MzJZLzMx?=
 =?utf-8?B?cWF3YjkxOXR4M2l3K29mOHY2VENZckVEWG5jbk1LYnQxVzFWR3hSeTBCUUZV?=
 =?utf-8?B?eS93aXp5NDYxU3R2aDVyaTRpejZMbWtsNVpBbnRjbGdrMTkyUkRFQm9jRlph?=
 =?utf-8?B?MXcyb2VKQTdHUXAxRmJRSFZpT3RvL1dqRjFVdjJYbVUvSFhuOHhrR1hhMldK?=
 =?utf-8?B?em9MRkwzSUNMcGNML1cvWHVNQTU2Y3J4QUFQbm5MbU42TEhLdkJBek9FOWE5?=
 =?utf-8?B?ZytqNGp0djUvaG0rWkUvenFOZUlBa0NTMFlDTDBuZ0ttNE1TUXV0enFGekdI?=
 =?utf-8?B?ZGxEcWEvZkZtV2ppTXVhajliWTdVZTZNVnl1SU9FaDNjVmhuNFM3dndLTUpW?=
 =?utf-8?B?RjJMVUJNY2RVZTVRaTdIRFRCTDRWRE5rMnRxd3B6TXB5SE1aUmJTa3JLUlJY?=
 =?utf-8?B?NEE3cG5iQUxsZTc3Nk96R2VjR2dUN1d5MDdBSkpnSy9QczVvcU9uNEpIeG04?=
 =?utf-8?B?S2NmV0RUdFZrdFM1YnQ1ZDdwUzJMUFVWT2V3b3g0blhTNTZKcG9BTk5FZ0Fm?=
 =?utf-8?B?N01vUWM4TWVzQVQrM0lUVXdkSXA0Q20yMlUzV0s0eC9HQkdZbFVpSnY1cTlV?=
 =?utf-8?B?WENzRVZLZVhwRnE2UE9EeEhrdk5sb1dpcS94cUVCaVBOK0ZGM0FqcXl5Y05u?=
 =?utf-8?B?cm1abUJFbWhiSEltMlBQNUNiM3h2UlRLRU9OalpmdUVobExvQXFLZG05UStn?=
 =?utf-8?B?UG1uM3JIcGY4Y3pGOFhHekdYb0wvWE5CTUJsTWFWajUxOWZQeHhwZUlhSGxC?=
 =?utf-8?B?VmpQUG5MWU1HeVZBSDhIVXJFYnQrYlBrOUV6OWkwYWJmamN3RnNGRk1ETUpP?=
 =?utf-8?B?QTNKd3RtelVHNEdGMDhhaTRhUG9Vd28wRnNIWUhrbHpuRStwbFdoMkF4bllt?=
 =?utf-8?B?eHlxSkJXL1hFRUgxcU5iaFdPMXE5KzRrRWF3NE5ZTldUb1VBOStIbWVFeHFk?=
 =?utf-8?B?Q29HY09sK0lkTGtoMzR5dHN0RFZjdnA4bk5IdHE0YWFVYTg3Z3FmQ2pNOVBr?=
 =?utf-8?B?ZW54dCs1cGd6S1B2VTYxZTc1QkQ1cEYxQm5sL1htUEZsS1pCQjVyZ0lMcCti?=
 =?utf-8?B?ZDJpNHRabmJhN1lDa3dQSWJMWC9HenAxckNkQlVGS2hiNTRyYlRhUjFickVp?=
 =?utf-8?B?OXIyVEF4ODZvQklYOG9meUlPWTZHQXJyWmJqbVlUUzYzVHVUdk1Nei9RNFJN?=
 =?utf-8?B?QWNEL1hHb214bmlRUDBYVlJ3UDJuYzNQelExQWxyRTVVYTVHc3FoSisyNllX?=
 =?utf-8?B?d0JjUGQ1NEtsWE12NFdqR0wyRTNZSEhDb3Q5VlBaMklXZ3hyWWtRVUE5UTFZ?=
 =?utf-8?B?dzE3T2IvUExLZlNtRHp4RWc2aXBGUFQ1blNuWEpHMWgrcDZWTFhTd25lSVFa?=
 =?utf-8?B?cGJtWnNtM0dhQTlMVk1ENnRvQW5udWJzcW5Tbzl3VDFJdGN5Wm5WSEIrWEpW?=
 =?utf-8?B?V0NocHVaL2p4MzFRNnYxUWZiNjFTWnpSS25wQTBSUGFFZzFVenMwWFhKaWFp?=
 =?utf-8?Q?3mcXmdYmw5V2iBPtjSXDgSYeUNPgE3vW+ayHHTW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b6b6b7-dfba-4df0-1ee8-08d933594a04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 19:34:43.7979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ywtjox5cvlt491TpUWcG9k57CiOBE99gEkA490pSerlA199k/VGF2YR6p56dn6RNEc5Gg32imQ8Mmlai5BaY/XOOvWrYcuV/1Nn27vC0q08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7011
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> Add a CoMutex to protect concurrent access of block-copy
> data structures.
> 
> This mutex also protects .copy_bitmap, because its thread-safe
> API does not prevent it from assigning two tasks to the same
> bitmap region.
> 
> .finished, .cancelled and reads to .ret and .error_is_read will be
> protected in the following patch, because are used also outside
> coroutines.
> 
> Also set block_copy_task_create as coroutine_fn because:
> 1) it is static and only invoked by coroutine functions
> 2) this patch introduces and uses a CoMutex lock there
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c         | 79 +++++++++++++++++++++++++++++---------
>   include/block/block-copy.h |  2 +
>   2 files changed, 62 insertions(+), 19 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index afa2f484f0..6416929abd 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -61,6 +61,7 @@ typedef struct BlockCopyCallState {
>   
>       /* OUT parameters */
>       bool cancelled;
> +    /* Fields protected by lock in BlockCopyState */
>       bool error_is_read;
>       int ret;
>   } BlockCopyCallState;
> @@ -77,8 +78,12 @@ typedef struct BlockCopyTask {
>       int64_t offset;
>       BlockCopyMethod method;
>   
> -    /* State */
> +    /* State. Protected by lock in BlockCopyState */
>       CoQueue wait_queue; /* coroutines blocked on this task */
> +    /*
> +     * Only protect the case of parallel read while updating @bytes
> +     * value in block_copy_task_shrink().
> +     */

So, you have to add new comments and modify comment added in previous commit. That's another sign to just merge patch 03 here.

>       int64_t bytes;
>       QLIST_ENTRY(BlockCopyTask) list;
>   } BlockCopyTask;
> @@ -97,7 +102,8 @@ typedef struct BlockCopyState {
>       BdrvChild *source;
>       BdrvChild *target;
>   
> -    /* State */
> +    /* State. Protected by lock */
> +    CoMutex lock;
>       int64_t in_flight_bytes;
>       BlockCopyMethod method;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
> @@ -137,6 +143,7 @@ typedef struct BlockCopyState {
>       bool skip_unallocated;
>   } BlockCopyState;
>   
> +/* Called with lock held */
>   static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>                                               int64_t offset, int64_t bytes)
>   {
> @@ -154,6 +161,8 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>   /*
>    * If there are no intersecting tasks return false. Otherwise, wait for the
>    * first found intersecting tasks to finish and return true.
> + *
> + * Called with lock held.

Please:

Called with lock held, may temporary release the lock. Return value of 0 proves that lock was NOT released.

>    */
>   static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>                                                int64_t bytes)
> @@ -164,7 +173,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>           return false;
>       }
>   
> -    qemu_co_queue_wait(&task->wait_queue, NULL);
> +    qemu_co_queue_wait(&task->wait_queue, &s->lock);
>   
>       return true;
>   }
> @@ -191,14 +200,15 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)

Hmm, you had /* Called with lock held */ comment for block_copy_chunk_size() in a previous version.. Why dropped?

>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
>    */
> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> -                                             BlockCopyCallState *call_state,
> -                                             int64_t offset, int64_t bytes)
> +static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> +                                                BlockCopyCallState *call_state,
> +                                                int64_t offset, int64_t bytes)

That breaks Qemu coding style (docs/devel/style.rst  "Multiline Indent")

Function "type" becomes too long. Common practice is keep a type on a separate line:

static coroutine_fn BlockCopyTask *
block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
                        int64_t offset, int64_t bytes)

(and this is used in the file in one place, so it would be consistent do same thing here)

Another way is 4-spaces indent:

static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
     BlockCopyCallState *call_state, int64_t offset, int64_t bytes)


choose what you want.

>   {
>       BlockCopyTask *task;
> -    int64_t max_chunk = block_copy_chunk_size(s);
> +    int64_t max_chunk;
>   
> -    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
> +    QEMU_LOCK_GUARD(&s->lock);
> +    max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);
>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>                                              offset, offset + bytes,
>                                              max_chunk, &offset, &bytes))
> @@ -240,6 +250,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>   static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>                                                   int64_t new_bytes)
>   {
> +    QEMU_LOCK_GUARD(&task->s->lock);
>       if (new_bytes == task->bytes) {
>           return;
>       }
> @@ -256,6 +267,7 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>   
>   static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>   {
> +    QEMU_LOCK_GUARD(&task->s->lock);
>       task->s->in_flight_bytes -= task->bytes;
>       if (ret < 0) {
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
> @@ -334,12 +346,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>       }
>   
>       ratelimit_init(&s->rate_limit);
> +    qemu_co_mutex_init(&s->lock);
>       QLIST_INIT(&s->tasks);
>       QLIST_INIT(&s->calls);
>   
>       return s;
>   }
>   
> +/* Only set before running the job, so it is thread safe to call. */

It's not thread-safe to call, it's just not used so that we don't have to care abot thread-safety.. So, maybe:

Only set before running the job, no need for locking.

>   void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
>   {
>       s->progress = pm;
> @@ -480,16 +494,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>       int ret;
>   
>       ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
> -    if (s->method == t->method) {
> -        s->method = method;
> -    }
> -    if (ret < 0) {
> -        if (!t->call_state->ret) {
> -            t->call_state->ret = ret;
> -            t->call_state->error_is_read = error_is_read;
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        if (s->method == t->method) {
> +            s->method = method;
> +        }
> +
> +        if (ret < 0) {
> +            if (!t->call_state->ret) {
> +                t->call_state->ret = ret;
> +                t->call_state->error_is_read = error_is_read;
> +            }
> +        } else {
> +            progress_work_done(s->progress, t->bytes);
>           }
> -    } else {
> -        progress_work_done(s->progress, t->bytes);
>       }
>       co_put_to_shres(s->mem, t->bytes);
>       block_copy_task_end(t, ret);
> @@ -591,10 +609,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
>       bytes = clusters * s->cluster_size;
>   
>       if (!ret) {
> +        qemu_co_mutex_lock(&s->lock);
>           bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>           progress_set_remaining(s->progress,
>                                  bdrv_get_dirty_count(s->copy_bitmap) +
>                                  s->in_flight_bytes);
> +        qemu_co_mutex_unlock(&s->lock);
>       }
>   
>       *count = bytes;
> @@ -734,14 +754,33 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>       int ret;
>       BlockCopyState *s = call_state->s;
>   
> +    qemu_co_mutex_lock(&s->lock);
>       QLIST_INSERT_HEAD(&s->calls, call_state, list);
> +    qemu_co_mutex_unlock(&s->lock);
>   
>       do {
>           ret = block_copy_dirty_clusters(call_state);
>   
>           if (ret == 0 && !call_state->cancelled) {
> -            ret = block_copy_wait_one(s, call_state->offset,
> -                                      call_state->bytes);
> +            WITH_QEMU_LOCK_GUARD(&s->lock) {
> +                /*
> +                 * Check that there is no task we still need to
> +                 * wait to complete
> +                 */
> +                ret = block_copy_wait_one(s, call_state->offset,
> +                                          call_state->bytes);
> +                if (ret == 0) {
> +                    /*

Please add: block_copy_wait_one return value 0 also means that it didn't relase the lock. So, we are still in the same critical section, not interrupted by any concurrent access to state.

(actually, I started to write a comment that critical section is broken here, but understood that all is OK)

> +                     * No pending tasks, but check again the bitmap in this
> +                     * same critical section, since a task might have failed
> +                     * between this and the critical section in
> +                     * block_copy_dirty_clusters().
> +                     */
> +                    ret = bdrv_dirty_bitmap_next_dirty(s->copy_bitmap,
> +                                                       call_state->offset,
> +                                                       call_state->bytes) > 0;

It should be s/> 0/>= 0/. bdrv_dirty_bitmap_next_dirty() returns -1 if not found. And 0 is valid offset.

> +                }
> +            }
>           }
k>
>           /*
> @@ -761,7 +800,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>           call_state->cb(call_state->cb_opaque);
>       }
>   
> +    qemu_co_mutex_lock(&s->lock);
>       QLIST_REMOVE(call_state, list);
> +    qemu_co_mutex_unlock(&s->lock);
>   
>       return ret;
>   }
> diff --git a/include/block/block-copy.h b/include/block/block-copy.h
> index 338f2ea7fd..bf8f0c679f 100644
> --- a/include/block/block-copy.h
> +++ b/include/block/block-copy.h

Please, add

[diff]
     orderFile = /path/to/qemu/scripts/git.orderfile

to your .git/config file, for good ordering of files inside a patch. For example, headers would be at the top of the patch.

> @@ -18,6 +18,8 @@
>   #include "block/block.h"
>   #include "qemu/co-shared-resource.h"
>   
> +/* All APIs are thread-safe*/

To be honest, you can add this comment only in the following commit.
Also, whitespace missed.

> +
>   typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
>   typedef struct BlockCopyState BlockCopyState;
>   typedef struct BlockCopyCallState BlockCopyCallState;
> 

Overall, looks close :)

-- 
Best regards,
Vladimir

