Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3F38B291
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:07:43 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkH0-0004gQ-Fa
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkD7-0007Fs-A7; Thu, 20 May 2021 11:03:41 -0400
Received: from mail-db8eur05on2135.outbound.protection.outlook.com
 ([40.107.20.135]:5889 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkCz-00049p-HG; Thu, 20 May 2021 11:03:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEdZFlaJIUuvSPqdGMfyhbvFdJsH4D3W0FM5JnKNpZe3FV1BlVomVXoVJWqBUKQ5xL/R3+Yr+0H3GDW7oy6+yp+J66vAHvurVNotUqoMJkgEe55DP3kELJ/QSyoGaUWbo3Gz6Z6g/mbY60jfXLY+ipsYoxGQzst2IuEw/AUBfNe8Qdktbz+/YIlzBdVJ2TIqt6AAC0GJUSjfl4U9XmugqJ0wTt4s7hELVgy/8oZ+adtTC3rT22QzDvGTuEepuXOzZIN6EiuBczuBR7MY0PdVHK9SXqbGA5Elz53ZTVkqitr8YojpWjtRRmIGtKQKR79uW4k6lZOQP2qqFTu+qMgWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDg/Vv6F15beWgLwAwcDZaPvwcGSEOHTH+UgR+TDL8=;
 b=l6Y09YOJsk8Lm3tyJ3kdHctho+IcOs09UFlIe+mM0BlwaiGYX/Kl+IIUl5XOnBB+cVHQfTM7hVTJIn6n7kT1EDvsT4o/EE52lreVR5HtrisnBVphAlWwK76C7gbGP/TFjFdkHIvuDyqWXnhCxCBWsmewhCcksrEFzNPBhCeTuJ48RSgnobzHnXPMt76MQXkqNMa4qzhM9ubqWraLMnH46FoU/I+6KefTQOeRPNK9N7+dT+P3vSL5jUpg4SsZEUUygTEFXKvAhGt1Svl7CASaq8fAcKXPhtqHQge3LWKw05fGWhFR1DpgB+amdyPAYH6M46vXaUmUk1pMbggw50Kw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDg/Vv6F15beWgLwAwcDZaPvwcGSEOHTH+UgR+TDL8=;
 b=IE3H6beYDLVgudlLJ9FmmObI963QpprAyRTrlWajEeeiP3VO0ed1sYnw3MXjbcn9sN16RgOo6aDW5qAJSwwijq/jiB5vy22FqaVuZJ3VDNOLHRBB4ZkY0ZFvOZnj+aQYpRL/4LMU35xM7myvNC9xbGTyOu+QZh6/ikc0iYctgLw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 15:03:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:03:29 +0000
Subject: Re: [PATCH v2 3/7] block-copy: move progress_set_remaining in
 block_copy_task_end
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <231533a3-bc70-6f02-4df4-e4432ee135c3@virtuozzo.com>
Date: Thu, 20 May 2021 18:03:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR3P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR3P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 15:03:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89e1340a-ef75-4ca3-6fae-08d91ba06d36
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334754999B46760AF9C089BC12A9@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:58;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uevnhFsb+3CpPX2DQ/Vp/KEvHX2LSxrT5KRgDajoGpPrTr8zqxF3AsPaa0hZLatRipf03mctsDPKb/NXRKaH2FhZynHiz94JI4XS9o0rXULzLd3ayIIz8F/Nlsk00rSgJJJmSX2fN2UQl024TJuVVPvCTWADiUVCnqf2JK9Io28Gma1Ogy2l7qSN6CyS1lTKgDJ7qZbu0PJg7RuaDsZC5vrbwuEEpkCD6vPlgxfilJdKxLGF3KBmkq2BfL8FWuw9mI6exxE/+swt1II6R1YOcG/Ret3Gij99JXPgQ3gJQxMeJduJVe4ob+y7qlXP/fWqjv1NWFCESD5ioTzyCxDsid9AMHPriXiLp59Pej0dbyvHvWTEB+Eg9RDfGWo2YJm6MIszuqS4Jvkxda2Hg3Ecm6vnqg4GSevfv87RhmEKwu6VKBKgiM01US7Jb5HVa4TUTGeW9la8S8hqjVojxZyOkceAVGAM7HIekclBz0FZIv0elzbAUDaXNkujklor5pE4GVud7Su3aLqGy1dz/JQeEu5DpvoC0vyzqS2vcEjQ4J/75er1ryZJNc4N5EMNicRXkoldM6BwVk5Yaqbt6brJOXbLS04zLKaCTlJL6tw/dRdYqbwMIYa4MQ8zz6BXJbqZYAP0nTIUpP5KG7dAPJL5Kv0F1mwIP6FJXBySRqNN5/DsGTZ1c+/bXBaMuR6ZTwfGG7qT5syHGNeMtE7oKw9RnfymnchLiC7RYlaWNROC3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39850400004)(346002)(396003)(366004)(6486002)(66476007)(66556008)(66946007)(86362001)(36756003)(2616005)(38100700002)(478600001)(38350700002)(956004)(8676002)(83380400001)(186003)(52116002)(31696002)(54906003)(2906002)(4326008)(16576012)(31686004)(316002)(5660300002)(26005)(16526019)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MU1pdlkrcnJLTTFGb2ZwYjdOWW1SZEJXT0U4VTRydGlHY1c4RnRIT3dzaTMy?=
 =?utf-8?B?ci9SQUFSK3I2M2pYajA4ajc0OHR5cHRybnoxUDdjQXN1YXpyM2RwTG9UekU0?=
 =?utf-8?B?QWVhcXpKd0I4MGpneHlxZHZpdngvNWtSVzNIMC95ZzlxeDZncE1uTGxHakN0?=
 =?utf-8?B?NkNlZWVGdTkxL0x6dTRrVjRqSGloQ0s0K3FxSDcrbzlTNkdmUnlwZFdiL3Nr?=
 =?utf-8?B?UUhORDduRDdVZmZ0TFZIdUhVbFYwdndHSzl1TnVYUk80SnFKSk54TDhhemxW?=
 =?utf-8?B?bCttWXdmdmlpUnlEMlQwZW92NXRsN1JvUDQzRnB4QkZaY0pRZmd2aVpJV1hM?=
 =?utf-8?B?cFBuV05CYzdDeGNwY1Z0L3Ixek9qalBWek02VHIrSWdTWU9VN0d4V1BmcStJ?=
 =?utf-8?B?cHdhSUYzdDVJUGhxOHpQaE5MMGluN2dNdG1NTkduclkzdERuNXNPZmo2TFRz?=
 =?utf-8?B?Z1pyeUlwSDdCWEZ2bW5YdnZ3ZlFaLy92YWIzVW05RS9LN21KaDhmemIyYmQ3?=
 =?utf-8?B?Z3lpcUMvNHhVdEcrcTJPNlVPNGZLV2JuOTlZYTdCR2IxVzhNQWVnWTY4ZEhO?=
 =?utf-8?B?RklKcGR1U252QmtPVGdzeUR3MXhMS3I3bEJDM3ZPY29KNm9IOGV1NDVZWWtD?=
 =?utf-8?B?RmxoTG84aXpXWDlGYWJjckRiVUg1Nmg4T0FXUXBsV3JGeXc5dXcrS0JwMm0r?=
 =?utf-8?B?MFA2YkV4OElrTXUvL1RLWVhGeGgrNy9HdjYzRmNwRzgwelBTYWRJd3RWVnJn?=
 =?utf-8?B?VWdXNndKN3IvbVlNYzdObEx1VlkyazJCK1BEczJiYTNEQUhwRzBET2YwdzdR?=
 =?utf-8?B?anNsL3diL3FvckVkZkJPTlV5Wk1sLy85QWVudkJLZnV3WFNrMTNzaE9oejB2?=
 =?utf-8?B?Umt3UGdjUHFlcmU0OVlzMGp1clhGNTkvQXY0anp0RnpqWDN2TS9ybmZJTHVH?=
 =?utf-8?B?b0o1OXVlQ0VZcm50ZWQ3eWhoU1hac1gvVHdyYjZkSitmNFJrWWxOL1BtQ05S?=
 =?utf-8?B?QVB2aUQxMktlVFhXdjYvU1dYVTZNZHliUnkvV2lIM3UzT3p4OHVPL21iZ28z?=
 =?utf-8?B?dlVDSmZyKzEybERnV3BTK1g2eTIxTFZiZW9mVE1wdFhvVkNIMm01dStzM1ln?=
 =?utf-8?B?QW9nb3JnZlArL2t4elp6RnlHVzlpMHlpMnJxZGFXYlBMZVI5eVNNK1lvRzFm?=
 =?utf-8?B?bDNJMUoraWFCSmx4K29EbTJhTHFBVVhzTnNDcDBEalRzVzdwR29sL2xJUk5W?=
 =?utf-8?B?NkgreE1WTFZOOWRhTExkbnBhTVBSdlJVNzZVNzRIY2M3RzBZQmdRRWUxWCty?=
 =?utf-8?B?aHZndFhaTmhkaXFjMlBNcVVnTWwzUzZlTzJTbUpQYjRqWmlQOGtGMzFub0NN?=
 =?utf-8?B?SG1TZmt1dW5aS24xL29KaVJTVklvWWtYdTA2RWlBRitFNXFGSG9uTmhONVhh?=
 =?utf-8?B?V2pRMDI4WkR3TkcrYUZ5WEdua21DMXBPRW9SSTdTV0xuZ0ZSand4Z2pIOENT?=
 =?utf-8?B?Vlc1L05ISGFVNUpRakF3ZWpLVzc5L1BKcnZzYmxUWkJqL0E5WDFyNEVRc3pt?=
 =?utf-8?B?b2tHbVdwTkp6Nk4vdWs3M1VwZHJwbjJJTit6Uy95Z2hlRWJ4SExHY2tCbzNL?=
 =?utf-8?B?c0lYalBaNmRkeFNYaFgxRmRPL0NHay85UitZbGRURVVBUkMybFdWcDBoUUFR?=
 =?utf-8?B?L01KQTdtU3pnaFhUa2hNUTE1czBMZ3p6dkpoczQ1bE13ZWxsTEh0S3l5cTZ6?=
 =?utf-8?Q?n2nsg1+LSCZsDHC14oeUY8S580sWaKXtJIV4oIg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e1340a-ef75-4ca3-6fae-08d91ba06d36
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:03:29.2080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kaYmTr+4ss2oegHwJwUiE55odzI7ZhZdU0dRPFw+jmLjeBiuTdm3o2xLGkbC6gbjNyccXJu/tO6mo0oz1QsCdGr5x6QuRUWi7cH8Uuib4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.20.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> Moving this function in task_end ensures to update the progress
> anyways, even if there is an error.
> 
> It also helps in next patch, allowing task_end to have only
> one critical section.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/block-copy.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index d2d3839dec..2e610b4142 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -264,6 +264,9 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
>       }
>       QLIST_REMOVE(task, list);
> +    progress_set_remaining(task->s->progress,
> +                           bdrv_get_dirty_count(task->s->copy_bitmap) +
> +                           task->s->in_flight_bytes);
>       qemu_co_queue_restart_all(&task->wait_queue);
>   }
>   
> @@ -645,9 +648,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>           }
>           if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
>               block_copy_task_end(task, 0);
> -            progress_set_remaining(s->progress,
> -                                   bdrv_get_dirty_count(s->copy_bitmap) +
> -                                   s->in_flight_bytes);
>               trace_block_copy_skip_range(s, task->offset, task->bytes);
>               offset = task_end(task);
>               bytes = end - offset;
> 


-- 
Best regards,
Vladimir

