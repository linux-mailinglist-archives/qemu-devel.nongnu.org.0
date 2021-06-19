Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF63ADA99
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:24:45 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lucpv-0002lp-KQ
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lucoa-00013D-70; Sat, 19 Jun 2021 11:23:20 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:15441 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lucoW-00052h-NS; Sat, 19 Jun 2021 11:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0HVjRi+bJqmuFzpZ3vVyCGzdAPcJrMqCfzRHYCDQEBZlw+aRyg7GAHfx1jU4J9xRRxHzg2XLTAPEORZrYuryNByiHC+DknrMWSmLzCRjLAUgNBX32GI57cCTwKBZY/sZI5E5bmjXCWZCit7s38kkeXnqfZJQ5dhNJ5mFTH3/uahQvMRid5XcCErDERUvrNt7Jy5gdtzcfwcJ+MOYkMYVrp+PUUYB3AKGV1Z9lgfBsreM2qbp488UMMhYQQINOnOCqJMESq+lNOYFV4WBghsRM84+DLywYOEhtd/s/GizuP8qjiJoSiwZj24Nxd/OS8dDqP3Zln5L6og5m58kkOHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbnsqOJJiasU7AV7O52pGDC0pL/gmjYF6jSXzkE//7w=;
 b=YhCgdlfDy2CrfVhu+L0ow6IWyOOU29d0kXCZJcGAUN2jrXHS6abr6D2oUtAi4pcjVeJdMB9xxVyUnUk1U59R/sOBdrTiB3r5k4Kr05Dw1XN9NIlSeN2BI+lqGdtG9ruA9nUwuJ8Q9m7Lp2cWiNXMk3gXy6zhWAhdiDJcdNE/wmgkw8q6sGYTaErkhwmsCFbm2v6KDx0x+wYRnBz9NsRqgAEVDKajW49kpp1xF1QulDXMJY5cY/jVCdiy4vZrGnbn40U+mymH6s2pWW640NJ4qm+fqhN4h9fraSXBqFgJQ5k3QsFLrt1eQp8Gml7z4w4qk+n2WHVjZU1z9OvfkcJbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbnsqOJJiasU7AV7O52pGDC0pL/gmjYF6jSXzkE//7w=;
 b=tNfoF8rEALnVLzyNPo+5GuUt7wFePmsb5tc6IRtIjeBVAOTJ8s+49B2ToX4l2S3ZRQ1CdWGhKzbKPkTsKhtdGNy4kunS3B5xMlKGjuA/TNLjiOyEgIoKYZmzIUEI0XB14c6K09gHkgw5nEfmoZzMbq0vFzCWxF4cJpdBKun/TBU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 15:23:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 15:23:13 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
Date: Sat, 19 Jun 2021 18:23:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0402CA0046.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0402CA0046.eurprd04.prod.outlook.com (2603:10a6:7:7c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Sat, 19 Jun 2021 15:23:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fea67cf0-1051-43a8-16a3-08d933362745
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069B6CB539B41C85202A8F1C10C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJ+/uGgs5BXPkBOdEJZXI1u1k2Wc6OM5IyOqOefyU1NKKtopalsKOkWnlcAD7A+Ati15nCSVvDNWUeOkz7ogOtgBgxhD7/kPz4acO+9EydWVsbnP2Su8xUZFw0ggWq0MFhSyUmcz5oaw99VBc25BlDuVPExjyhvqNo9BDHnokFHdoc7KI/WzkQGgAalBzaTzHFbU6CEkywX0FxhN6WRFMHDXkS1uND616Js0Nipf3v1bNGTdI1cWy+URfklFqZ/RweZXwruYHZOidhFAIn5h7dKAg8p8q8dkMcVfKk6OPW6G3wxIPttHcMCYdw+DwqGljM3XTQS3YZSRWeBkop4CMcxlV+XD3444CoDHYqE4AeQTcXtUWnnWSiezSzgMAbfxI2LjyyW2zbpjyKAYoadbLOdD9Qw6coqjg/gW12/21owkGZ/VQ3Uv2CMUpv+VeDMDiS29V1fmkGBWaDyoKuKDAYRcxiXyAwAIBjzczNiTljODOg45AQHJO6IaRK4Z/928IeYOCJmT2SYCuP9LvmrIMhTuqL9i0eRdaMaS6yYA405rqX2ZPED4YSdBIckgTJr+RmnznVQ05Ra8O0gpUm+5qyaSjrKdpDoP3A+VfWLuEgcrqNtsxCfrIV70kYiWcuUrPJ/G28bQzcdqn7ix0EGypcef283je+pY0EKWnclcFbxhG69VwdCXpPp2YBcZmZOIzJd1OXtJ1KfwPc//TDFqRY2dA9cZlQ7HH5rPgrXzE+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(346002)(396003)(6486002)(38350700002)(2616005)(956004)(38100700002)(66476007)(66556008)(66946007)(2906002)(5660300002)(31696002)(4326008)(36756003)(83380400001)(26005)(86362001)(8936002)(54906003)(31686004)(8676002)(186003)(16576012)(52116002)(16526019)(316002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhSNFU5VHlOZjIzdWVaN1Z5dThPdUNadVdscXFlVTVNd3A2WUQzbTVYM1Z5?=
 =?utf-8?B?eWcxRzZheXhtY3hHS2s0SFBxVHlMbDZYTnY3NVFNbHd0aEdCNml0cEFEbUZL?=
 =?utf-8?B?RWI0dDBYN2dKdHlUKzVwV1o4L3JjMDN2bmI1Z3RqOFkxajZEZTN5NS9henI4?=
 =?utf-8?B?aU0zSlZWWTdYUUF4RyszdnVKRUNjOWhlZmQ0YmJxOFh5RGFlMHdsbjQ1bG4v?=
 =?utf-8?B?M0VXUHpKemVzaG5DbUhSb3hqaDJEdFcyUkdnUG1wNDdmRUdzY3IyeE9JM2Z6?=
 =?utf-8?B?NnBKMk1SYlZTaWo5T0JuZEtLay9ZMm1QbVRpTFI1V1RVODd2OGM2M1FONTdC?=
 =?utf-8?B?UmhQU0JLVjZIbEpwM1FxejhGaVFnRVVINW9nQWhLbjUyUnQxdkdIdHdsbUo4?=
 =?utf-8?B?dzBJdDE4UHZWbWZPc241d1RrRXpWOE5wdjRSZHB5VE1IdDlHSDJFbE9SdTJQ?=
 =?utf-8?B?djJQZE5wVEpHVjE4UWQwU1hWNVlWYTVxVW1jSlV2Ujd0Z1IzZVVyTTRMaHho?=
 =?utf-8?B?d2ZJZTFKUDVqVTJMWTlMZVVKaWlkK3FUdzBWQTdnb1hwV0tUbUMyZkVDWXov?=
 =?utf-8?B?c2JFRng0ekdoUnFLK1VZQ0tIM0tRTkJlQ2EyTUZvYU0xUllKdkRKeW84ZlFm?=
 =?utf-8?B?UmhpYUZWV1FuR3NzbjI1UFFEK1Q0Qm9MU0lYTGFuVkRHTHoxZjdmTDEydFJX?=
 =?utf-8?B?eWttQU1SN0JNeUJYcnE1WkhrZWFPUXJyam9Id0x4clJ4bnBTWVNITjZEdzU1?=
 =?utf-8?B?VDA5dTJJdjU5VWVVeTd4SW1zb0g3UWh5L2xNTmZUa2RlbDZIc21CbCtsL0JC?=
 =?utf-8?B?UUwvdUlrcWRPVjh1clFVZ2pPbjM4bm1JNkNraVhsTGtjV2VnaWhhdE0raVdq?=
 =?utf-8?B?eEQ0M3VFUHpOWmlJYVlLT09Vbi8vUjdLMzAwZGJaUVhLTnJKRTlmdXhtRGJO?=
 =?utf-8?B?RTUzQUc3Z0xaYlFZQmVSM2oxNHVqL3BhRW1FeEFOWkk3d0h2MUNSSEFRWVNx?=
 =?utf-8?B?MjMxTVMwM0NVaGdLVXhSZUtZZEQwME9MS01OTVkzT1ZwYTlWMXNoYjNaYklQ?=
 =?utf-8?B?MTQ4KzN0cWtlT3oxRXlMd1VpNlMzaFE2VWU0cjZWWVpiQ2Q2UmFJZHh6VjNz?=
 =?utf-8?B?RElXVUo3ZjVKNVB4QlhhaUxvQ1FzajhLQ2RjSFZ1MExuc3p3Y3MvMm1FZzNp?=
 =?utf-8?B?T0s1NCszK3liR3h6L3hBUmFseUt5ZEZjMUw4VGFQeU1pdVNWcTRVbzVySlJ2?=
 =?utf-8?B?TThHUENSNUNSWVRDY2s5bmUrZXZEMklhelFGNVhtOHVIWFNsdVdlYlI0TUgv?=
 =?utf-8?B?MTFPTlhZL3ZFRjNBbGZxWURURG1TQzQ3T3BCZE9YQjd6Z0U4SzFWUHQ0VjdS?=
 =?utf-8?B?ZUdYM0UyWHYzSWJTVkZLQWw5YUV5Y0p4aFZ1cEdHR0svbU14Qk1RcXlhOGlp?=
 =?utf-8?B?S1IyeE5pVjMrSDFhWDYvckhMellJU3RlcWxrZmhCUC9KUE9Gd1BUZGhNNXVj?=
 =?utf-8?B?UHJEa3VjMzBIZGgyc3Q4K2RUQ2YzNXMvdnhoY0pIVDFrM3o5d0VtcDg0VXF2?=
 =?utf-8?B?Rm5HZUZZdUhFL2xMNXFEVHpyUTFRaUYwMks2VTBFTnVocGdGRXpIdTI2Szd6?=
 =?utf-8?B?RDNFYlZLeW9LTnR4REcyS2pGT1I0aUU2R3d4bXVRSDZJSWZFQTgyZVhSdjJu?=
 =?utf-8?B?Vnk3UnZwZTlKWEJ1VWF5MW9NL2pmTWdPeTRzdlpoNnpxR29UL0VyY1NwN3JP?=
 =?utf-8?Q?quyvv5zKgdqjb6vd6DCIPBFGip7KmeU6Pi/jp0Z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea67cf0-1051-43a8-16a3-08d933362745
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 15:23:13.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMB7ni/uEgjXgo6zZl/ZnU7D8WH/VaqKRkbNObX+xNdSKGN9p+aYexoToMO0dM5jFKLMUPGt75fogGFm57SSDY0iN+p2L+lbaZt6FybT9TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
> As done in BlockCopyCallState, categorize BlockCopyTask
> and BlockCopyState in IN, State and OUT fields.
> This is just to understand which field has to be protected with a lock.
> 
> .sleep_state is handled in the series "coroutine: new sleep/wake API"
> and thus here left as TODO.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 49 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 3f26be8ddc..5ff7764e87 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>       /* Coroutine where async block-copy is running */
>       Coroutine *co;
>   
> -    /* To reference all call states from BlockCopyState */
> -    QLIST_ENTRY(BlockCopyCallState) list;
> -
>       /* State */
> -    int ret;
>       bool finished;
> -    QemuCoSleep sleep;
> -    bool cancelled;
> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
> +
> +    /* To reference all call states from BlockCopyState */
> +    QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* OUT parameters */
> +    bool cancelled;
>       bool error_is_read;
> +    int ret;
>   } BlockCopyCallState;
>   
>   typedef struct BlockCopyTask {
>       AioTask task;
>   
> +    /*
> +     * IN parameters. Initialized in block_copy_task_create()
> +     * and never changed.
> +     */

That's just not true for method field :(

>       BlockCopyState *s;
>       BlockCopyCallState *call_state;
>       int64_t offset;
> -    int64_t bytes;
>       BlockCopyMethod method;
> -    QLIST_ENTRY(BlockCopyTask) list;
> +
> +    /* State */
>       CoQueue wait_queue; /* coroutines blocked on this task */
> +    int64_t bytes;
> +    QLIST_ENTRY(BlockCopyTask) list;
>   } BlockCopyTask;
>   
>   static int64_t task_end(BlockCopyTask *task)
> @@ -90,15 +96,25 @@ typedef struct BlockCopyState {
>        */
>       BdrvChild *source;
>       BdrvChild *target;
> -    BdrvDirtyBitmap *copy_bitmap;
> +
> +    /* State */
>       int64_t in_flight_bytes;
> -    int64_t cluster_size;
>       BlockCopyMethod method;
> -    int64_t max_transfer;
> -    uint64_t len;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QLIST_HEAD(, BlockCopyCallState) calls;
> +    /* State fields that use a thread-safe API */
> +    BdrvDirtyBitmap *copy_bitmap;
> +    ProgressMeter *progress;
> +    SharedResource *mem;
> +    RateLimit rate_limit;
>   
> +    /*
> +     * IN parameters. Initialized in block_copy_state_new()
> +     * and never changed.
> +     */
> +    int64_t cluster_size;
> +    int64_t max_transfer;
> +    uint64_t len;
>       BdrvRequestFlags write_flags;
>   
>       /*
> @@ -114,14 +130,11 @@ typedef struct BlockCopyState {
>        * In this case, block_copy() will query the source’s allocation status,
>        * skip unallocated regions, clear them in the copy_bitmap, and invoke
>        * block_copy_reset_unallocated() every time it does.
> +     *
> +     * This field is set in backup_run() before coroutines are run,
> +     * therefore is an IN.

That's not true: it is modified from backup_run, when block-copy already initialized, and block_copy() calls may be done from backup-top filter.

>        */
>       bool skip_unallocated;
> -
> -    ProgressMeter *progress;
> -
> -    SharedResource *mem;
> -
> -    RateLimit rate_limit;
>   } BlockCopyState;
>   
>   static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
> 


-- 
Best regards,
Vladimir

