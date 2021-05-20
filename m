Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F238B34E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkgq-0004b1-T9
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkd1-0001bh-St; Thu, 20 May 2021 11:30:27 -0400
Received: from mail-eopbgr60096.outbound.protection.outlook.com
 ([40.107.6.96]:39687 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkcy-0001R0-Uh; Thu, 20 May 2021 11:30:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVjVsDd8vygafQrZOMDjLQf+dmJgFNR6q7LC+5pJKZW/D/vL+7pF7kE6lyBrSkD8smZEg9UuNw25uhnKiQyeR/7OKzCyI2kTX1Rq5KoZSlM0gYAT4+s4QN3gqI3kTzbMra9ZhUH3orXdQPnkAOOYGqu2Cjh/VjnbQe2pOSz2fTKObTg8hqGGWnv16y0K7OBp2CBENkfGdcnBeRYIoOt0H+bfA5+Aj5baVE8mGB4NAPo6Ket3wNfMH9HPJ7C3roh0yhxMhsK72o56HZleUEHY5w9VM2hnUUS9SCMxPUbbH4+l3Cs4gf5J6nxpLXsKo6ICmeygTqgz6UMOhSs0vZsJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9MpnIBHk+K+AxSVKjlIhONQoDuNHZS/j689wWPgduw=;
 b=OH1lJiYyrECQRt1uGwddLwJ8EgKv7D1YMmOaOKY/SczbtPjeCobRyAZXIrw1UhBc9X7D/lE61BCzP1D6i3DHxJVFKhAdqAn4/x2f9199LieMm908TRtL8tk1e9pABwTUAMLC386LdrmIdvXGIbAt7L47MqpMM/Pmlk4DmCmbUMgnXKcnSxm4UDJaLMrCdrSrMRpIeMempWMB4Xhr03nyVtDr1nI+Xuq0PKIpxqGu/gTBcxNcoh+CBfPx9K+xzMEy9R+kqEYfeZgOp5ItbSLu/AiAvdKSoE+trSFMPhZAudP6OLgeUAy7Kky2lqlXTJiwc883JNaNOt5A9J0wiWDCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9MpnIBHk+K+AxSVKjlIhONQoDuNHZS/j689wWPgduw=;
 b=OiJ0zFwHcATARxB7yDuRrCHHhY0SBaEitNUC/TraqEyJOkQWu36XrJuwHXjWLDfh95Rp1W8LbBHRzmv1xmKuqV9Ct0ByDtrqvuaYV1e4EQHhCHVaTfp/EsUSZsRnxXnudVeIP7wPqlxghdhtMuEGzXDGdicCMsO5I9AWeM+7E68=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 15:30:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:30:21 +0000
Subject: Re: [PATCH v2 5/7] block-copy: add QemuMutex lock for
 BlockCopyCallState list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e1170527-29de-0eda-9f66-399e12923bca@virtuozzo.com>
Date: Thu, 20 May 2021 18:30:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 15:30:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245f09e7-ac82-4e6b-b9f1-08d91ba42e6e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33834258BA676EE1C9457CEFC12A9@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELroVYMNk7Lv9nxZKcgFAvMMznmlmL0UAvruTbkrIRa6GMkamTumOzz24StrmGPROAhmSk7Xf+WW7iWlQMObZ55Q7AYqwWQjLVIqizRMhTXon92oEXOR69oyk286v1wuh0lA5nufUAD4sLTI+wjVGf18A+m8vBIOo3kNz9D1aMoI2maWNvD7y+Hk7PXMM2dL01C2G8CjLYvQ78+rS5ZtGz71rOHXV32ODqJg5h16AbG1B4x1z/uN/rNQ9Zpq+NSZipSS54lF2qmAjMFhQyhLOgwbLOvemnOUZ51E6EuiNWoBibEnbqwsz/I95zeo+bvOJ1QODC/PwZhyWIMybEoeFElpvu5yazYqY6/4qHt5g1uzsgrFFdfexf0rRuSBHK8cVxwxeog+DToznlpVQ5UM6xggciAMhHO0eV/lVByUOyd946d3qZwnttNo9dRfHYV8oH/SgoBPRR0OOeA+l8kX1emEOeZs26GbhLcSoRpZrlhyrDSRiGmrSq8UXctqWig7Sg1mCC5IuvYbzV5SX/mnRd+P95xeA6XpAd49t2p+KfcMS14XK3roqFzXgNKK1WAFiDILOsYurHwM+53ARmm2mldE2NUl5yLmSwNkSgKTn7e6Y3rXO54+1E7tbgo7Hxz/xzUYSipWUR6B0xtpj8ogHjHS+8FWkJzZ2m3+IcJ/DAB5OLM8u+hnwR+mLJrZdmn6UerSCbZFo0E+2hIkFCW7v6SfSao6DIzZkZnL2FwlH04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39830400003)(396003)(366004)(38350700002)(6486002)(38100700002)(54906003)(36756003)(316002)(4326008)(16576012)(83380400001)(186003)(8936002)(31686004)(66556008)(956004)(66946007)(52116002)(66476007)(2616005)(2906002)(16526019)(8676002)(5660300002)(31696002)(26005)(86362001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N3dENXN6eEprVlFRTk5FaUdDc1p4blQ2aUlHcnI5VWlyQUpiSXorbmsycHFz?=
 =?utf-8?B?TFZhdHpHSnd1VHZJSXR6ZVVEWVBKZEZxNnBoZFBnTW4zRTRIeXd3blJEa2cz?=
 =?utf-8?B?N0poK28wTDQrRFJ2azl2MElHMzB1TG93aEZ6dXpjaXN3OXFrd3ZEMC9HQkZY?=
 =?utf-8?B?OUpCTGs3WVRQSVIwcjBoWXdRR3ZqYXE1Y3YrTXBJR2RRN1ZrSm9OQzV0NDRu?=
 =?utf-8?B?RHgyKy9Cb2FyQ0RTNktwVXByT1FiaVNyWHRiR0h3VE94ZkJLRmt0VU4vRE9p?=
 =?utf-8?B?dXVtSFZTeWdIZ3lQRUpmVVVKZlhyRTBMbTQ5Z1VtQzU0L2pKQlRBcHkrWCtB?=
 =?utf-8?B?bnRNcFBvblpqenBpdzZzTTFHQkt3dGFPd0QzVnZ1UmFFUWVCWi9UQk1zd2ta?=
 =?utf-8?B?TGl3M1ZyNDNyakpjd01CUDJZaEtXSXV6cURqbU05QWlKQUhwSWdVWlBoUGh6?=
 =?utf-8?B?ZmJyUCtvS0tlLzI4KytIVVhTQVhyZ2ZTYVUveXNkVWIzQ1ErKzQ0V2lRL3FO?=
 =?utf-8?B?bUhsdjVkYXBLSUhJckd6dncrRVhxa0YwTjJTNlpZcUxod3ozTGlEZ3haVFky?=
 =?utf-8?B?WmtremUxbXNQUURUem1JSnpzNkVyVDE4UExyMGJPZjVid1FmZDBaeWFOZkpV?=
 =?utf-8?B?OXpPZzVKV1BBMDlQZ2Z6MnNHZnp6cXorK0VrSFRXOXNRVkNMVGI4ZVpuWTN2?=
 =?utf-8?B?STV5M0lYSTRNczdJK2k3SGVTS1FKZ25pekN2c1NVSlBVbmQreUUwNFBPZFRv?=
 =?utf-8?B?VkFtMjY3YlVmT01uVW9SQXVtMnRNTDd4Sjh1ZlB5YTUvM29SUk0rUS9ZTWpy?=
 =?utf-8?B?VndHcGphdU9WdVR0Q2FtVmNjQ0dWbURZeTJHa25lVnA1K2pxWm5hTHRaN1E2?=
 =?utf-8?B?NitqOWcwNFp0MllyNHNDTXRsLzZ4eEZ5NTlhNEpRQXhNcjhkUS9kRElqK1Zr?=
 =?utf-8?B?eFB6T1E4bFFCSS9Kai8wQzVTMmsydEdIOWpUYm95ZUxDc1I3cjlTZ1J4djUy?=
 =?utf-8?B?SVV6WnB5QlI4Uy8yK1Z0OVA4dFRVbGgxRUh1aGpOSFJhSm9rNWZyeGQxNlBh?=
 =?utf-8?B?WjRTMndoWTJyWktleUV6cWJ5UzdGTDY1TWIxRGFZUzBkdHIrYXROZkJlMFlR?=
 =?utf-8?B?anZUNlRlMXcxVFM0OVoxYzBnRndrNkV1cEdZbXB3cFl6bHRxMHBBaGMyT215?=
 =?utf-8?B?UXJNVDZFQ0RnYzVya1V4TVQwUG4wc0tXQzU1ZG1DVXJiMlJFeUJLTlhCMXJy?=
 =?utf-8?B?ak5ZdE1EQnRBYlVXRWF4SDVqNmdKbENSeEQxVGtrR1N1SGtxOXlJVXNzNEVx?=
 =?utf-8?B?SWFJbHZsUkJCUU1YOVhwaTdPaUU5N3BsTk5hS2o5VlZhTWFNR0M2MW43Q3FU?=
 =?utf-8?B?TVBZVXV2djBYbklyZWlJZFE4dWxHYzdKRk0zMzh5S3FZOFU5MHpzY1dkM0tT?=
 =?utf-8?B?ZXNwWHV5UXdjRWZEa3JxdFFySm5VaFVteHZxK3o5QmlTd0xTSDZOVHVLMjAx?=
 =?utf-8?B?N1ZBM1BoV3pCREZ3VVJKT096UXlFbUczMEo0TEpzeWw2dnhJbUxyU1NwREdj?=
 =?utf-8?B?cUJPeEdQRmVzV2szOXlEblhMeFg4dXp0ejFVekVhWm1xZjBBRzY5U09UVDcx?=
 =?utf-8?B?VlI5d2J6YTFLYXJtSmhnM24xbUNlOGF3eFRFZ1lhNTFoN0tHZXZaZmpEaml3?=
 =?utf-8?B?eFFubmtSdnlDbWxvKy9TblJsUTlOdERjN01PSzlCQUI5L3ZRb3R5WGdNd0s5?=
 =?utf-8?Q?PQcp/Z4RLO7V7V+OrF8mGORmEGwYgFxtWzgJvaH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245f09e7-ac82-4e6b-b9f1-08d91ba42e6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:30:21.7977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rhcyL4fDFjrD3+vIscoH7YsmNOKBbMzxLUeHZrk5QYqxTjbioAEQQ0PEGjh5RSASSuS/nen48sH+cPlwDp0gN6Pw+c+aWXaWL1EsuA6908=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.6.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
> As for BlockCopyTask, add a lock to protect BlockCopyCallState
> ret and sleep_state fields. Also move ret, finished and cancelled
> in the OUT fields of BlockCopyCallState.
> 
> Here a QemuMutex is used to protect QemuCoSleep field, since it
> can be concurrently invoked also from outside threads.
> 
> .finished, .cancelled and reads to .ret and .error_is_read will be
> protected in the following patch.
> 
> .sleep state is handled in the series "coroutine: new sleep/wake API"

Could we live with one mutex for all needs? Why to add one more?

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 3a949fab64..d5ed5932b0 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -55,13 +55,14 @@ typedef struct BlockCopyCallState {
>       QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* State */
> -    int ret;
>       bool finished;
> -    QemuCoSleep sleep;
> -    bool cancelled;
> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>   
>       /* OUT parameters */
> +    bool cancelled;
> +    /* Fields protected by calls_lock in BlockCopyState */
>       bool error_is_read;
> +    int ret;
>   } BlockCopyCallState;
>   
>   typedef struct BlockCopyTask {
> @@ -110,6 +111,7 @@ typedef struct BlockCopyState {
>       BlockCopyMethod method;
>       CoMutex tasks_lock;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
> +    QemuMutex calls_lock;
>       QLIST_HEAD(, BlockCopyCallState) calls;
>       /* State fields that use a thread-safe API */
>       BdrvDirtyBitmap *copy_bitmap;
> @@ -289,6 +291,7 @@ void block_copy_state_free(BlockCopyState *s)
>       }
>   
>       ratelimit_destroy(&s->rate_limit);
> +    qemu_mutex_destroy(&s->calls_lock);
>       bdrv_release_dirty_bitmap(s->copy_bitmap);
>       shres_destroy(s->mem);
>       g_free(s);
> @@ -349,6 +352,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>   
>       ratelimit_init(&s->rate_limit);
>       qemu_co_mutex_init(&s->tasks_lock);
> +    qemu_mutex_init(&s->calls_lock);
>       QLIST_INIT(&s->tasks);
>       QLIST_INIT(&s->calls);
>   
> @@ -492,11 +496,14 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>   
>       ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
>                                &error_is_read);
> -    if (ret < 0 && !t->call_state->ret) {
> -        t->call_state->ret = ret;
> -        t->call_state->error_is_read = error_is_read;
> -    } else {
> -        progress_work_done(t->s->progress, t->bytes);
> +
> +    WITH_QEMU_LOCK_GUARD(&t->s->calls_lock) {
> +        if (ret < 0 && !t->call_state->ret) {
> +            t->call_state->ret = ret;
> +            t->call_state->error_is_read = error_is_read;
> +        } else {
> +            progress_work_done(t->s->progress, t->bytes);
> +        }
>       }
>       co_put_to_shres(t->s->mem, t->bytes);
>       block_copy_task_end(t, ret);
> @@ -740,7 +747,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>   {
>       int ret;
>   
> +    qemu_mutex_lock(&call_state->s->calls_lock);
>       QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
> +    qemu_mutex_unlock(&call_state->s->calls_lock);
>   
>       do {
>           ret = block_copy_dirty_clusters(call_state);
> @@ -767,7 +776,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>           call_state->cb(call_state->cb_opaque);
>       }
>   
> +    qemu_mutex_lock(&call_state->s->calls_lock);
>       QLIST_REMOVE(call_state, list);
> +    qemu_mutex_unlock(&call_state->s->calls_lock);
>   
>       return ret;
>   }
> 


-- 
Best regards,
Vladimir

