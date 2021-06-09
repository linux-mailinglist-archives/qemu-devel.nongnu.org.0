Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A213A1456
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:28:03 +0200 (CEST)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxJS-0005WF-Et
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqxHI-0003Yk-FO; Wed, 09 Jun 2021 08:25:48 -0400
Received: from mail-am6eur05on2134.outbound.protection.outlook.com
 ([40.107.22.134]:60231 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqxHE-0005dM-QA; Wed, 09 Jun 2021 08:25:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjF24RsjM3gDl4puDIwa0o3Fi4VdMg+YaCgG+nbsH8/2+Khud/wN52NlllOX2/jCigzQIH1fo0Qtx9fzN8oSC5m+5T+G+Uak/EmvzM5bpryAjjpPC1UdYfudpYnjQtbVJF32uVmk+OakPC89REki4KS7cwjxdjAxhEYLb66AENRNsI4tc2F7P6ZU60HYN7c6N/UYZcFD4nWlOchUwiDCJIxUYHyeHpEr2tiTZiH6pUVZghC/P2ch+qQZ0v0Rj+rnoNJnBHDXSBHkngSyOnCdc3/P3NCICAmABA8X+M5+jsNA4klA1qc5zalqxEyr66tcFYH3l4jeDyzXsgUDmKxauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/2vgSNdsy2QhdVyp4Crk+vspJB27wrgIzPzy6/VAuk=;
 b=k6k1fM+gLlmmROKPUVEO6c1fFbVCcLCGT/dJwHUTddx/9cCfrMJLPigw6gM7X7MrlVWDL5NT5E/J92Ara6EDm05SKPWKHxQ/B9xCxz/K0zw3RyxVcTQFLdCgEWDBkSWRY64Z5uyNhsqqMX/cRB9fldeEfucF+j4RzANw7uJGtwYzyaTtbuz7GPW1nAwpoIfkhhfV8y8vphUpm5GiB2vXkl32Z0+ZQrPMLbDFGmPC0N4M37jQc5pxRwRNHMUkAkv1KiF+jtlHzgJjRQNPas1PgagXYeqpSn9JjpHPISUru+5riKGDQJImAPp7PMa6UCfZpwxDDC84O3l8sRyaefGhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/2vgSNdsy2QhdVyp4Crk+vspJB27wrgIzPzy6/VAuk=;
 b=ugz82TAeXkcDKh56ZYsvXohJ3n4w90fczIMV3vRcx2F6j5YD2wmoUfuP7hYLAndJ0ckaBzSGIscsmsTUNKBfz83C4eoMVrHXoIysOY3ITYQnolUnMRIFf/1VbXVVa4Sbanncl7D99CD8Zxfl0wGLk42KIW2HtXDuaskyk53t6w0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 12:25:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 12:25:41 +0000
Subject: Re: [PATCH v3 4/5] block-copy: add a CoMutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <94c227e0-e179-f675-cd77-d470e0aaec9b@virtuozzo.com>
Date: Wed, 9 Jun 2021 15:25:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608073344.53637-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 12:25:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 252cb229-4c86-4d49-c953-08d92b41b256
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68876515C009021BD4C49974C1369@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXyd8Z42jse/GiBhFC3HkSuaWMY9zxZeGeEUc3vscIpKIN6XxYt0I5pVFmouNkfbYo9q4RrSdA1AGhZKO2hRxWl/K1z1XehAJjXDOsN6mQ3c3nZNo59LnOAcdriPXZ0pssR3cX1TIHp0WZnxYG//C1TgB+LR4LdDwIPeyQnKuB0CgDI+MLq5F43EqjIQiOMPGvWLoRO2C0v6mwaC0eu9fJcGIcD9fU1D6EMKlTxvRTsu5NU3aNomXITVQkO2qOs5rx9nKdog4oTKh2rJU6whiTiPo/LyL5PPAcNkQVoe2VNxSeORotXhwzqjPTe5EFOj9IPGvYl2ld1hPRSEQ8vvJIiSH8tiiVvbYsRJ2Hi7rzbi1xRL1sJrRjweSrjHi0OhghDcFHil2DX30jnENuDdI+q/2ajpBofXbKgKE5gvbkWaE5sEIbaesCwiqaALkYferBbgap2YX78k515UVlG+qF4ifbr/GKnR8De/z7HMNIT0M1ubgPEFEhjr2Ecd87JZ1bh4qD/N0/XuKPh8rRisiT6xQU7p8WbjW3SiKW8PfouW1LfBoDg7mlUdK77FlOS9Bj4HOJepEaIuMVlMaWfQbxpq6zKffkrtqRrqa7PyKogve9xeWAZUTMGuLlsgWQOe5BTudOUOLmJy0SlvIMOU7jjN+n9b6pZVDoeEWiuaGYfs8bTjTaTtONog/aERTlEvtHM0FUQHi/jDDQBqMuyl6mO/iQv4fKTT8BscHgKhiSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(346002)(39840400004)(136003)(366004)(376002)(52116002)(38100700002)(316002)(36756003)(38350700002)(186003)(31696002)(4326008)(478600001)(6486002)(54906003)(2616005)(66946007)(66556008)(16526019)(66476007)(31686004)(2906002)(5660300002)(16576012)(86362001)(83380400001)(8936002)(26005)(956004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGVFNWtScHpOb1FkQy9FdHlGeW5pN2hLdFBFTi94am91TndVaGJ4RlplTmhk?=
 =?utf-8?B?cGFScVZJWjl6OGlQbUNsSjcxWE5aL1JwcnNtNm9GenhEOVU1MEtOL3N3c3Nt?=
 =?utf-8?B?T21aZGJCQWxNUDgyUkw0Z0RKTlVzVUdWckFsVG9PME8vK1gxempYcXNTWFpr?=
 =?utf-8?B?Y0F0Tm5ObEtFVGxjT0JaYnNkK1ZjSmp6YWtielF2enRacjZHb2hCN0h6cGZ5?=
 =?utf-8?B?L25Oc2t0T2tkUTBCRG5XbGtEOTRhWkk0VDlrSlkzOEpraHk5UHFaK2JGenRi?=
 =?utf-8?B?VUFRb2lqK3NMSU5ZeE1sZm8wYjAwYTcwQmM4b0NqQ3dWMVAzRGhUV2h4Rk1N?=
 =?utf-8?B?ejdvaitiUDVJbG1oUFRod2Z4SW5iRWFaTkJVK3psQW5VNTU4TDhUbk9XOHFv?=
 =?utf-8?B?QVF3b1hIOWVrdlltNHJsN29EVjhqV0w4UGk2bnoyRDFMS1N4VTc3czNOd3Rj?=
 =?utf-8?B?bTBQVThTWkxBMVdyenZQTmd1WmxVQ3VGTEpsWVhsUkcxZXEyVEFQR21iQlNk?=
 =?utf-8?B?VE1QbEUxd2liaTJQako5YmRSZkNUN1Q3TlNoNWI4Q3VleWR4dWw5TnBQRU45?=
 =?utf-8?B?RTk1MUtTY3Mrak9Vd3RXN3hIRExvcHAyNW1OMjZQa0s1b3RQcEE1MzNaai9i?=
 =?utf-8?B?dEJDQnBzYWVCN3dLWHljaGNBaEZhaWhCeDFUOHhIRlV2M053UGdRZGZscTR4?=
 =?utf-8?B?TWRKOWZlVjh1Z3pId3lHM214Q2VKbUhaUDVSSVNVMnE3TUgyNHNMK05ZZkR1?=
 =?utf-8?B?YVEwRGVaNkdwTkpoU1JMZkc5a2JHWFd3c3BuRkk5UHJubUFaLzUvaWtCNllS?=
 =?utf-8?B?ZE9vbXVjcEVCalMvTjQ1OEpWTTNqaU9GclJIbS9weU5SOTlvNXJHUjI1UjZn?=
 =?utf-8?B?SFVWei9NcmVCT09wZlZyQ3ZWb3FGTTJIZ0F3djFEQWRPRzVvT25iSUxzdDNE?=
 =?utf-8?B?TmltZXRXYk50WmUyVXlERXpLMHZVQmdaeHhoT1dTaUNoRWd6S0NXWmQvL056?=
 =?utf-8?B?eE1LSTg5WG16TkhudUZOYmpGbVVmNC9hUGY2T0FwaUIzQ1J1VEpIOUVVa1Az?=
 =?utf-8?B?UnJzVDlXQ1ZBL1NsbmNCMmd1ZHpjb1dMTDJQYjczSlpaUWVzdFhRdjJSdmlT?=
 =?utf-8?B?Nnl0NGtQSWRQcXRMUVJSZXRhaEVIbjVJcExVWEhTb21tbThOc2JwMXVmZEVy?=
 =?utf-8?B?Y1cxbmtvMENUYzJrcXpaNFdPRTRVZzN0TGxMVDBlOW1zRFNkSE1USVNacVFv?=
 =?utf-8?B?Z04rYVp1S2FGZ1dneDBqY2oyRStBRGdEZHZKNDQzTFpSa3NGVDJvVGRLRUtL?=
 =?utf-8?B?aGJneE8wU256ZUtpUFZacXpBaEkwMXRrWEZnZ05oUUhHdVdWU0FWcVUraHBo?=
 =?utf-8?B?YnRadWNhTlRURVk0UjdzRHphRDY4cWdpSEFacTd6VU9CbDVCbTY0Z1UwQ3Jk?=
 =?utf-8?B?ejBoNGRlcXIzVUQ1Sml1ZkFKeW9qYUJVQVlyR1VaaVhZOG9mQ0QrWUxrSENm?=
 =?utf-8?B?MHNKY0FkaHFTUjV2THVJdUdpVndvdUgzVDBUZG9CNVQxLzYyeGdJNG4wNm9y?=
 =?utf-8?B?WWZpMzJiNVNNZStpbi9oYW9XMVNQcGg3aWovVTk3SXN1S3pmR1R3T2pkMkZy?=
 =?utf-8?B?UnlzNWJiaXg5UEhtaXZpem1HVEhPYkZJdDVUdEZZNGM5cWgzMzRGNVg2K3dZ?=
 =?utf-8?B?eG84RW9Bbk9YMDVXMk96Qk9MS0psMU8xZTA4S3Y5MDJ5YVVjZnpXSlNzMHls?=
 =?utf-8?Q?Za1TprU94Nudy0anjbRdNQ+6DUH+Z9MuXb9fgtz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252cb229-4c86-4d49-c953-08d92b41b256
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:25:41.5701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q59wEKYjkVLti5iME81l98V+OtJ2OICJcT0BUVxErSpHWO7xofjFYrFxNA1ZqFRpYdorcqbvTnWXZ86Cin6rFM6Txcw2sffYZLNjufTnOyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.22.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
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

I missed, did you (where?) add a comment like "all APIs are thread-safe", or what is thread-safe?

> ---
>   block/block-copy.c | 82 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 54 insertions(+), 28 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index e2adb5b2ea..56f62913e4 100644
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
> @@ -78,7 +79,7 @@ typedef struct BlockCopyTask {
>       int64_t bytes; /* only re-set in task_shrink, before running the task */
>       BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
>   
> -    /* State */
> +    /* State. Protected by lock in BlockCopyState */
>       CoQueue wait_queue; /* coroutines blocked on this task */
>   
>       /* To reference all call states from BlockCopyState */
> @@ -99,7 +100,8 @@ typedef struct BlockCopyState {
>       BdrvChild *source;
>       BdrvChild *target;
>   
> -    /* State */
> +    /* State. Protected by lock */
> +    CoMutex lock;
>       int64_t in_flight_bytes;
>       BlockCopyMethod method;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
> @@ -139,8 +141,10 @@ typedef struct BlockCopyState {
>       bool skip_unallocated;
>   } BlockCopyState;
>   

May be nitpicking, but if we want block_copy_set_progress_meter to be threadsafe it should set s->progress under mutex. Or we should document that it's not threadsafe and called once.


> -static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
> -                                            int64_t offset, int64_t bytes)
> +/* Called with lock held */
> +static BlockCopyTask *find_conflicting_task_locked(BlockCopyState *s,
> +                                                   int64_t offset,
> +                                                   int64_t bytes)
>   {
>       BlockCopyTask *t;
>   
> @@ -160,18 +164,22 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>   static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>                                                int64_t bytes)
>   {
> -    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
> +    BlockCopyTask *task;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +    task = find_conflicting_task_locked(s, offset, bytes);
>   
>       if (!task) {
>           return false;
>       }
>   
> -    qemu_co_queue_wait(&task->wait_queue, NULL);
> +    qemu_co_queue_wait(&task->wait_queue, &s->lock);
>   
>       return true;
>   }
>   
> -static int64_t block_copy_chunk_size(BlockCopyState *s)
> +/* Called with lock held */
> +static int64_t block_copy_chunk_size_locked(BlockCopyState *s)
>   {
>       switch (s->method) {
>       case COPY_READ_WRITE_CLUSTER:
> @@ -193,14 +201,16 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)
>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
>    */
> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> -                                             BlockCopyCallState *call_state,
> -                                             int64_t offset, int64_t bytes)
> +static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> +                                                BlockCopyCallState *call_state,
> +                                                int64_t offset, int64_t bytes)
>   {
>       BlockCopyTask *task;
> -    int64_t max_chunk = block_copy_chunk_size(s);
> +    int64_t max_chunk;
>   
> -    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
> +    QEMU_LOCK_GUARD(&s->lock);
> +    max_chunk = MIN_NON_ZERO(block_copy_chunk_size_locked(s),
> +                             call_state->max_chunk);
>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>                                              offset, offset + bytes,
>                                              max_chunk, &offset, &bytes))
> @@ -212,7 +222,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>   
>       /* region is dirty, so no existent tasks possible in it */
> -    assert(!find_conflicting_task(s, offset, bytes));
> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>   
>       bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>       s->in_flight_bytes += bytes;
> @@ -248,16 +258,19 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>   

The function reads task->bytes not under mutex.. It's safe, as only that function is modifying the field, and it's called once. Still, let's make critical section a little bit wider, just for simplicity. I mean, simple QEMU_LOCK_GUARD() at start of function.

>       assert(new_bytes > 0 && new_bytes < task->bytes);
>   
> -    task->s->in_flight_bytes -= task->bytes - new_bytes;
> -    bdrv_set_dirty_bitmap(task->s->copy_bitmap,
> -                          task->offset + new_bytes, task->bytes - new_bytes);
> -
> -    task->bytes = new_bytes;
> -    qemu_co_queue_restart_all(&task->wait_queue);
> +    WITH_QEMU_LOCK_GUARD(&task->s->lock) {
> +        task->s->in_flight_bytes -= task->bytes - new_bytes;
> +        bdrv_set_dirty_bitmap(task->s->copy_bitmap,
> +                              task->offset + new_bytes,
> +                              task->bytes - new_bytes);
> +        task->bytes = new_bytes;
> +        qemu_co_queue_restart_all(&task->wait_queue);
> +    }
>   }
>   
>   static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>   {
> +    QEMU_LOCK_GUARD(&task->s->lock);
>       task->s->in_flight_bytes -= task->bytes;
>       if (ret < 0) {
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
> @@ -335,6 +348,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>       }
>   
>       ratelimit_init(&s->rate_limit);
> +    qemu_co_mutex_init(&s->lock);
>       QLIST_INIT(&s->tasks);
>       QLIST_INIT(&s->calls);
>   
> @@ -390,6 +404,8 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,

Oops. seems block_copy_task_run misses block_copy_task_end() call befokre freeing the task. preexisting bug..

>    * a full-size buffer or disabled if the copy_range attempt fails.  The output
>    * value of @method should be used for subsequent tasks.
>    * Returns 0 on success.
> + *
> + * Called with lock held.
>    */
>   static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>                                              int64_t offset, int64_t bytes,
> @@ -476,16 +492,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
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
> +    WITH_QEMU_LOCK_GUARD(&t->s->lock) {
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
> +            progress_work_done(t->s->progress, t->bytes);
>           }
> -    } else {
> -        progress_work_done(t->s->progress, t->bytes);
>       }
>       co_put_to_shres(t->s->mem, t->bytes);
>       block_copy_task_end(t, ret);
> @@ -587,10 +607,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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
> @@ -729,7 +751,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>   {
>       int ret;
>   
> +    qemu_co_mutex_lock(&call_state->s->lock);
>       QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
> +    qemu_co_mutex_unlock(&call_state->s->lock);
>   
>       do {
>           ret = block_copy_dirty_clusters(call_state);
> @@ -756,7 +780,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>           call_state->cb(call_state->cb_opaque);
>       }
>   
> +    qemu_co_mutex_lock(&call_state->s->lock);
>       QLIST_REMOVE(call_state, list);
> +    qemu_co_mutex_unlock(&call_state->s->lock);
>   
>       return ret;
>   }
> 

I looked through the whole file on top of the series, and it seems overall OK to me. I still don't really like additional atomics, but they probably should be refactored together with refactoring all status-getters into one block_copy_call_status().. So it's a work for some future day, I will not do it in parallel :)

I don't insist, but for me patches 2,4,5 only make sense as a whole, so, I'd merge them into one patch called "make block-copy APIs thread-safe". Otherwise, thread-safety comes only in last patch, and patches 2 and 4 are a kind of preparations that hard to review in separate.

Anyway, reviewing of such change is a walk through the whole file trying to understand, how much is it thread-safe now.

-- 
Best regards,
Vladimir

