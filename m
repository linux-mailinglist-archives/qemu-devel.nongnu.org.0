Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C33A0F03
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 10:52:36 +0200 (CEST)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqtwx-0008O9-VO
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqtvx-0007fX-E0; Wed, 09 Jun 2021 04:51:35 -0400
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:61628 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqtvr-0000DX-Gm; Wed, 09 Jun 2021 04:51:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9js41Mb0pa75z4cBx0bxqnjTMLW8UOIVCoiL+Dkg16Z2+CIes5SdO1pRZIdGAPkZKpFIHvEhJztm46fsK6u50GwOWCrZKZEOeI1BbGZRiynatP+mVtJtBRpQCw3jB79KhVIHtZ6xSCOBjPrhk8R0jb2Kfl1i/OZ0333xeta1Q2XLzbSQ8Xr6VOAUA+ojaQXcyrAEtXEGh6JjIJL2wBG22r4FazEbmwYiuQfmX1qtd9kHGCdLjkV36CZej2NSZYCxjTjoSaGo8P7zs+K8FRj6AOQDrPFfQcoFzN3mXnkyEe2t+I1Gr5b74hrNFSmiLyfXZVnTnUF7nA5CnD6kyaMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9GQkc6oaFSWobBLIQfpPhQGzqq8M5G4MRs1wzbu5Ns=;
 b=X1p3LzwycnO9eLgks5NhKglcVxTfErD1vXDqiq61bscCVpjqkfWmCtB2pkOPB57WzWqhOB3ykdWFbZRrDVITg1/jTMwSo5u3EkUAFkrB9w2qGNrIYoJ0RTpDC3on4Yd7f5wEFA0Tvnl4e8uemfMYATT7oBK+Tci9+Qgvk1goxp7ADkd2yxoS/2DCaQ3xIF1sx2kgQ4c7EoPVfXpmtaxw7JE4AZCAAsOkILaIer9nCh+UAs+Th2osxkBPaAW5WHUQolOG11iKaUl6IfCO6kWXkgJ/cmqhjS8buhI5W+aLEv/b4W3UTKfROKAS1Ga7wlFqlSStSeN86+IQ+wuu7yiOBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9GQkc6oaFSWobBLIQfpPhQGzqq8M5G4MRs1wzbu5Ns=;
 b=kA8APVgxHonnf78wWLu+DxlI0Jo6iMCve6E3jVOpOUCiiolDtS+qaFWSbISxTF9D+hTqFJb5Oe5wbucROLiAANE6JbABdm9WESy05RkXXobuwmriKmrujm0IjPOP+iGljDaIh+vwqmVsKV98/tmBi9DdrDk7MjvoqTHx2p2gDFM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 08:51:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 08:51:22 +0000
Subject: Re: [PATCH v3 1/5] block-copy: streamline choice of copy_range vs.
 read/write
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ddc23736-d6ce-cdde-21b8-f809ef65ea65@virtuozzo.com>
Date: Wed, 9 Jun 2021 11:51:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608073344.53637-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 08:51:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59c2cbe4-5ce2-4346-d2c9-08d92b23c1bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6168:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61680D74E1798519E9759640C1369@AS8PR08MB6168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +33nMMU0Os05nHHnmhxYuPRIGr4cIBCkU9zK0rvVYy1XjQO4NwcE1eGFcTSiyQNoT7LEKMcT7tJ1yiQDJuFt8GfdpRzEDXSWQyXrlDPUWZDpud94AOzb1VDgtSfGCPsqVde3Pt6BpnEctKWRPSemNSTw2HoktJhvPHCJff1kUROdjvIuSNbeD1S5xWEG58T4NC6rNyuZnrvCNfYkY50FV8LRYb90d7cEC2I29PmIMpvfVbJT8ukBvkKuw6j1HE6WuE+MbjQFLzceSV8OVoEckY1SpxdqQCl+ktOrWVAJfpSbdhmu/wf678E0B8Li/J1EAcUiBiEAniYMErDQHJdjGs5CZmMMA/dj8PjncHrkFsC42kdWIqW5wcmhzl66/5aUEgDWdgeU5+O0Om7LTS8uddj+xs4X6KsLXK1qe9XlA2pINYJcRWLWKJHKWgz04U9y6zMIg1ezye/sJLBnIDREMW8VZNpNwHwabSfzQvb8H183KNJ8S1b8wrd7mfokTjbJ9e93C/3JfGFB0Kjwq5pnRLFcD57FXqL02eOxMHfkHbLjSPEETsg+3DjMkHdktwK0S7rLY5sN2O0sD2RmNU3JPyjnNQpsZ5UHENLIKWAIvDD6aXKxo7yUHPY5jP5gcsJk16vV1ZIjyWMJ5HaaHqIiqZ806QaKUSCaCFwNB0Q0sncF0tL0ypJuTBLXW2+pnnjMIGf6b3eRzarTBFzJYHY5xR5plrmMse7mRn/9hCgCqJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39840400004)(38350700002)(36756003)(38100700002)(5660300002)(86362001)(2906002)(66476007)(6486002)(31686004)(66946007)(83380400001)(52116002)(31696002)(54906003)(8936002)(316002)(8676002)(16576012)(956004)(2616005)(30864003)(478600001)(26005)(186003)(16526019)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFlwNXFNUkJyNUNROU0zd2drUHhodUhOL2VqNmhoODRlRkRiZkhoM3g4UUhB?=
 =?utf-8?B?YnZFZlZHaWNWMWNCZEVhQjYzb095aWNQcnkvSDI2NzFLTDN4MmhxQ25wM0RZ?=
 =?utf-8?B?UlhrS3pnNGZIckYwOTN2OE1VWm45ZnRaUVVPV2tiWnJtRHpKc0ptclJUKzU1?=
 =?utf-8?B?QWRmNktVTXovWFlvR1JjUGp1OGd4cUo5TU55eTZaM1V5cE85YnBtdXF5T2hG?=
 =?utf-8?B?RkVVK2o2KzllMC81c1B0NTJPRTdnVHpESW1Ja1NydjAzQXZmV2RCN3JBWnFI?=
 =?utf-8?B?UmQyV2NTWHFnTG5Wd3RpOUhOZ1ZiRDNnY2h3SFlGNG0wakdSQ2dLY0EvUU9p?=
 =?utf-8?B?YWEyaWFqUWNHYlRiSThDYkVMRG9SVWdKTDFWcFhDME5kSlMvQTBIcm1UT01w?=
 =?utf-8?B?encxUlcwcTVzbG8ySW1tRUhrTWczOEh1Y0VTd3VxcDBGYldBV3FDNzBDTHNQ?=
 =?utf-8?B?UUtkc0R2S1dFNlBFNjlXblVrVmdjNm1zUG5tMHB6bkVtV0NOaUVFMVZUVGYz?=
 =?utf-8?B?Kzk0Si83elRQd1hUZ1had3hVdkxxRml5c0xKUmtlWXFUdU1tbDFYTm9UK3pF?=
 =?utf-8?B?dlhhMUk4MW85SEVUTEpjNllhQktNVXNKV0tCVW5XY3dmQU1rSHVOekpsVlRB?=
 =?utf-8?B?ajRXSWJ5UU5vODl4WGcrQUs4ZXM4L25zb3BFNFkvTEdzVXhaUStiUWRZd0NU?=
 =?utf-8?B?TThkRHFabUt2M3BkbFdCZlU0NmVsdDVEV0V6SEdnbmNBajR2T0VDMmpIUC9Y?=
 =?utf-8?B?ZWpWL2RYd3o0VU50ZDZtbHNmYkRwNk1HUVhmWUxZTFVZTkpQYlBqbFNabVF0?=
 =?utf-8?B?eTF5OGRibzFiVWxyYWlZK015VEt3TktkSHFCNXBqcldOOURBY1hqcThlSGl2?=
 =?utf-8?B?dkl6WkU3bytORmRvZmxKcnh3U1RkSXNUcTJSZTJ2TWJHWC9QajZHcktta2JE?=
 =?utf-8?B?YmRRdEJjdHdSdkZpdXBybEVMcmttYjd4STdwRGFJT3NVVHdMQmdVZ1dwT2Rv?=
 =?utf-8?B?S2RhTGVrSlhWUklqa1l6VkxnUDRFZ2VNSG4vVXlUTDg5cjhMM2krOEVxYUN3?=
 =?utf-8?B?NHhBWkxVU1JvUm5vY0tqaUQyOTVNOWRrTnlyeXFNTzA3NDFxeVVjTmxvTzFE?=
 =?utf-8?B?N25YSXJTL2xMcGRZWU90NEFmL1k2dlJkMXpwU1V5Z1ZjUlZZRTV5TUlaOGhq?=
 =?utf-8?B?c1p1ZCtPd1QwOVJUV2M0ZzNqZ2N3TnN6RC9NbWFtRDluQ0NrK09La2NSQlpE?=
 =?utf-8?B?SWd4T0paZndDVWNWTXlwR0paUXBza2dlM3MzbUlJcHF0OFYyV1pZblBOZ29o?=
 =?utf-8?B?TFJTTkp6eHlSV1NsQXlpREpROHpHMldIMjlRbis5eXlxTFk4dldGM0R3VmNH?=
 =?utf-8?B?RHc1QUNrRldNNlYzby9tZ2Q0WjNLQVU1b1hPeUpLdG0rQlFzUC9RMlN2Tkp2?=
 =?utf-8?B?ckFkYi92T3ZOSndVQkFxTHVZQXhIVkg0YUJ0SkVJM2Ruc3liOVpVc1RzWGhT?=
 =?utf-8?B?ZUN2LzJEQjhqVEk1aytRNUhSRTd1NE1xWHhPT2VlMnZleDBlSm00OUdXYWor?=
 =?utf-8?B?N1JwYTFBQmhjZzZzdTFYcTcySm9kb3lUMU02TFFiTXRmT3cxbldFZ3NIUlRk?=
 =?utf-8?B?VGVGQmlnVFdRdXBhd2RXZnZNZE5SbkYzY3A3R0h3eExvQXNMYUVvZ1IxckF1?=
 =?utf-8?B?UERvSVRnL1ZpdTlla2Ywd25peEl3b21TZFQzckVuMW1lZy9KcC9yVWRteGNx?=
 =?utf-8?Q?GIl3TrtVA2zdSAEq84rydGlkC4LSPk8+95uybSl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c2cbe4-5ce2-4346-d2c9-08d92b23c1bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 08:51:22.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J28D3VztqfOSo2dAF9btrBIR3DbUBUIjrYEtqVYugW/j0UI5EmzWGlx695SgRZ7y+5E/ZNHkG+HVw8ZEmfdKtoHn3OFSeWl+TxumIosQ3Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168
Received-SPF: pass client-ip=40.107.22.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Put the logic to determine the copy size in a separate function, so
> that there is a simple state machine for the possible methods of
> copying data from one BlockDriverState to the other.
> 
> Use .method instead of .copy_range as in-out argument, and
> include also .zeroes as an additional copy method.
> 
> While at it, store the common computation of block_copy_max_transfer
> into a new field of BlockCopyState, and make sure that we always
> obey max_transfer; that's more efficient even for the
> COPY_RANGE_READ_WRITE case.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

In general looks OK to me, I mostly have style remarks, see below.

> ---
>   block/block-copy.c | 171 ++++++++++++++++++++++-----------------------
>   1 file changed, 85 insertions(+), 86 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 943e30b7e6..d58051288b 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -28,6 +28,14 @@
>   #define BLOCK_COPY_MAX_WORKERS 64
>   #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
>   
> +typedef enum {
> +    COPY_READ_WRITE_CLUSTER,
> +    COPY_READ_WRITE,
> +    COPY_WRITE_ZEROES,
> +    COPY_RANGE_SMALL,
> +    COPY_RANGE_FULL
> +} BlockCopyMethod;
> +
>   static coroutine_fn int block_copy_task_entry(AioTask *task);
>   
>   typedef struct BlockCopyCallState {
> @@ -64,8 +72,7 @@ typedef struct BlockCopyTask {
>       BlockCopyCallState *call_state;
>       int64_t offset;
>       int64_t bytes;
> -    bool zeroes;
> -    bool copy_range;
> +    BlockCopyMethod method;
>       QLIST_ENTRY(BlockCopyTask) list;
>       CoQueue wait_queue; /* coroutines blocked on this task */
>   } BlockCopyTask;
> @@ -86,8 +93,8 @@ typedef struct BlockCopyState {
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
> @@ -149,6 +156,24 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>       return true;
>   }
>   
> +static int64_t block_copy_chunk_size(BlockCopyState *s)
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
> +        /* Cannot have COPY_WRITE_ZEROES here.  */
> +        abort();
> +    }
> +}
> +
>   /*
>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
> @@ -158,8 +183,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
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
> @@ -183,7 +209,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>           .call_state = call_state,
>           .offset = offset,
>           .bytes = bytes,
> -        .copy_range = s->use_copy_range,
> +        .method = s->method,
>       };
>       qemu_co_queue_init(&task->wait_queue);
>       QLIST_INSERT_HEAD(&s->tasks, task, list);
> @@ -267,28 +293,27 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>           .write_flags = write_flags,
>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
> +        .max_transfer = QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
> +                                        , cluster_size),

It seems unusual to not keep comma on the previous line (and it's actually fit into 80 characters).

I've grepped several places with '^\s*,' pattern, for example in target/mips/tcg/msa_helper.c. But at least in this file there is no such practice, let's be consistent.

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
> @@ -343,17 +368,14 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>    *
>    * No sync here: nor bitmap neighter intersecting requests handling, only copy.
>    *
> - * @copy_range is an in-out argument: if *copy_range is false, copy_range is not
> - * done. If *copy_range is true, copy_range is attempted. If the copy_range
> - * attempt fails, the function falls back to the usual read+write and
> - * *copy_range is set to false. *copy_range and zeroes must not be true
> - * simultaneously.
> - *
> + * @method is an in-out argument, so that copy_range can be either extended to
> + * a full-size buffer or disabled if the copy_range attempt fails.  The output
> + * value of @method should be used for subsequent tasks.
>    * Returns 0 on success.
>    */
>   static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>                                              int64_t offset, int64_t bytes,
> -                                           bool zeroes, bool *copy_range,
> +                                           BlockCopyMethod *method,
>                                              bool *error_is_read)
>   {
>       int ret;
> @@ -367,9 +389,9 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>       assert(offset + bytes <= s->len ||
>              offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
>       assert(nbytes < INT_MAX);
> -    assert(!(*copy_range && zeroes));
>   
> -    if (zeroes) {
> +    switch (*method) {
> +    case COPY_WRITE_ZEROES:
>           ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
>                                       ~BDRV_REQ_WRITE_COMPRESSED);
>           if (ret < 0) {
> @@ -377,89 +399,67 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>               *error_is_read = false;
>           }
>           return ret;
> -    }
>   
> -    if (*copy_range) {
> +    case COPY_RANGE_SMALL:
> +    case COPY_RANGE_FULL:
>           ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
>                                    0, s->write_flags);
> -        if (ret < 0) {
> -            trace_block_copy_copy_range_fail(s, offset, ret);
> -            *copy_range = false;
> -            /* Fallback to read+write with allocated buffer */
> -        } else {
> +        if (ret >= 0) {
> +            /* Successful copy-range, increase copy_size.  */
> +            *method = COPY_RANGE_FULL;
>               return 0;
>           }
> -    }
> -
> -    /*
> -     * In case of failed copy_range request above, we may proceed with buffered
> -     * request larger than BLOCK_COPY_MAX_BUFFER. Still, further requests will
> -     * be properly limited, so don't care too much. Moreover the most likely
> -     * case (copy_range is unsupported for the configuration, so the very first
> -     * copy_range request fails) is handled by setting large copy_size only
> -     * after first successful copy_range.
> -     */
>   
> -    bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
> +        trace_block_copy_copy_range_fail(s, offset, ret);
> +        *method = COPY_READ_WRITE;
> +        /* Fall through to read+write with allocated buffer */
>   
> -    ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
> -    if (ret < 0) {
> -        trace_block_copy_read_fail(s, offset, ret);
> -        *error_is_read = true;
> -        goto out;
> -    }
> +    default:

It would be safer to explicitly write remaining cases here and then abort() in default:.

> +        /*
> +         * In case of failed copy_range request above, we may proceed with
> +         * buffered request larger than BLOCK_COPY_MAX_BUFFER.
> +         * Still, further requests will be properly limited, so don't care too
> +         * much. Moreover the most likely case (copy_range is unsupported for
> +         * the configuration, so the very first copy_range request fails)
> +         * is handled by setting large copy_size only after first successful
> +         * copy_range.
> +         */
>   
> -    ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
> -                         s->write_flags);
> -    if (ret < 0) {
> -        trace_block_copy_write_fail(s, offset, ret);
> -        *error_is_read = false;
> -        goto out;
> -    }
> +        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
>   
> -out:
> -    qemu_vfree(bounce_buffer);
> +        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
> +        if (ret < 0) {
> +            trace_block_copy_read_fail(s, offset, ret);
> +            *error_is_read = true;
> +            goto out;
> +        }
>   
> -    return ret;
> -}
> +        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
> +                            s->write_flags);

alignment broken

> +        if (ret < 0) {
> +            trace_block_copy_write_fail(s, offset, ret);
> +            *error_is_read = false;
> +            goto out;
> +        }
>   
> -static void block_copy_handle_copy_range_result(BlockCopyState *s,
> -                                                bool is_success)
> -{
> -    if (!s->use_copy_range) {
> -        /* already disabled */
> -        return;
> +out:
> +        qemu_vfree(bounce_buffer);

label inside switch operator? Rather unusual. Please, let's avoid it and just keep out: after switch operator.

>       }
>   
> -    if (is_success) {
> -        /*
> -         * Successful copy-range. Now increase copy_size.  copy_range
> -         * does not respect max_transfer (it's a TODO), so we factor
> -         * that in here.
> -         */
> -        s->copy_size =
> -                MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
> -                    QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
> -                                                            s->target),
> -                                    s->cluster_size));
> -    } else {
> -        /* Copy-range failed, disable it. */
> -        s->use_copy_range = false;
> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> -    }
> +    return ret;
>   }
>   
>   static coroutine_fn int block_copy_task_entry(AioTask *task)
>   {
>       BlockCopyTask *t = container_of(task, BlockCopyTask, task);
> +    BlockCopyState *s = t->s;
>       bool error_is_read = false;
> -    bool copy_range = t->copy_range;
> +    BlockCopyMethod method = t->method;
>       int ret;
>   
> -    ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
> -                             &copy_range, &error_is_read);
> -    if (t->copy_range) {
> -        block_copy_handle_copy_range_result(t->s, copy_range);
> +    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
> +    if (s->method == t->method) {
> +        s->method = method;

you leave another t->s occurrences in the function untouched. It's somehow inconsistent. Could we just use t->s in this patch, and refactor with a follow-up patch (or as preparing patch)?

>       }
>       if (ret < 0) {
>           if (!t->call_state->ret) {
> @@ -642,8 +642,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>               continue;
>           }
>           if (ret & BDRV_BLOCK_ZERO) {
> -            task->zeroes = true;
> -            task->copy_range = false;
> +            task->method = COPY_WRITE_ZEROES;
>           }
>   
>           if (!call_state->ignore_ratelimit) {
> 



-- 
Best regards,
Vladimir

