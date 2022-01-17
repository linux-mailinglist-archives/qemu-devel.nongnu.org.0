Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD54905BA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:10:57 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9OyW-0001Zh-0Y
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:10:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9OuV-0007lb-4o; Mon, 17 Jan 2022 05:06:47 -0500
Received: from mail-eopbgr20138.outbound.protection.outlook.com
 ([40.107.2.138]:9095 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9OuJ-0002ZV-Li; Mon, 17 Jan 2022 05:06:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2UHCdZt7hKq4ZGZ/ufTiXBoUH9ypW+0+vE0TUQ6gBMpvwf+sNgbWkL4ngegP/KqPt35VrXlrL1Nyxobb2tYwyEHdpT3WNhaLJ3wDzzPjjTcgTaVj2pXf9gLA7AS8K6Xz+E9WuGruqkjY0pKxwWe6jEj17ibkinDMvB6p0epeOrIEW+JfpgEDNPmWPNHy0wSFzcYHC9gNGRwNLJByHqiXi9DSDWjoVEJU77JRC2kuQ2zIaO685qEmjzVFWq2lbdBrsHvHu6zV0VriKCjzlL67J4ksYlOR0smke2xTfG5MF2/YPV1AcIq8+ShQJmYQE68Cyh6BePixq0c7XHR9Za7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3/l34FUO8QA76Gkt7/pDQUjZJ0VrG+nm8/jZ8ztZI0=;
 b=npYugfp3Sc0JCPRVcx7wbYcu4uGmDmSlFp/d2EGvW/gykJr3VAWhuV9YOu33noJ2U5dnt/CWBUFmXSgrtv2MdtpNWIM8WHsENYwGjtO/ewaDmEXgc04iFMECZX94OcCEUCM/rDP3cJMrD44RdaW8plIw10VdM7qObTA8zzzqs4ZFSLn0/iKBzmReeKdAVrNlGb6MX4Fbo4CVp8Q+6EOZb7FpurPFZ+/HQHxjh7K+JGjOnocAM5GysU5/bumPAxpQtXcuLkL07M8isj4DjSw06Pw+w3nRkCcSiMhVpKg/xq3AKeBTwGiw1nwuvUMWQTlccIDVNdHqey8vj/MRomLFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3/l34FUO8QA76Gkt7/pDQUjZJ0VrG+nm8/jZ8ztZI0=;
 b=XccTVejruZJ45xO3cDDybA4hLyLZWukLPl5J1y8rTkuyUZA+nWBcpG+DEOGe4lIqGKbJm5LzNxEOhnYwKvXAnbG0Bs/Up9oahhUjOM58wzGnU2wH6pTsRwILsbqYbm1C5gD/4jvKE6rZuKw2bw3gp5cprN9N85ufWBnOw3dZiNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by VI1PR0801MB1920.eurprd08.prod.outlook.com (2603:10a6:800:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 10:06:28 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:06:28 +0000
Content-Type: multipart/alternative;
 boundary="------------jhnDaor2s4lqfSD0ibTU7r8V"
Message-ID: <baa29d60-902a-e2be-cfcf-c66b39b21d50@virtuozzo.com>
Date: Mon, 17 Jan 2022 13:06:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-8-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211222174018.257550-8-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::25) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ea570c-f3df-40d2-bef1-08d9d9a10756
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1920:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0801MB192056016041A331BAF472BF86579@VI1PR0801MB1920.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTaGVufbYrycBFTvcjZsMCl9MWJcDi3bjrNm4zT4Jm47GSr6q0lB6g/jitNovUg+/AXDES6CAyK9cpBpLwjeW1JIBE++yHbwznomXGCFKtA53RixbMG0h9/mA7CAQyqLPZVnUlOEDh1YNFJYeS1s8hRuRGuB87KGPI3xNrmElX1RCe2J8Zil2ow3yVl4296nRyy/+hLxaPz3bnLeJ0f4uhjz444j9kjUSC0eUk+OgaMm05Th/3Wx22wR5iEViVhcvUk36mnLViAEkO98me/MgPkvY8KjIvVg9Sr/iK7e86EWZzafunW7guxGh1W/sLW6pOjZSFAlVaWgq8s9xL+QWDLWzMAlRRwCA5fJ/wKe9GW/m2hwfGBmmE9p8V+j9QMC4cSkEKCkF+v4GQmmGUQQSl9TFaJPMSTss3vboXVFwJIuxLYxVMZKq0B3VcSvjP2+3Crkachc4x/8fTEbscPmCsR2BAGauithbkRBuD6gRLi2IFgEYCZ3/U6XAtr5dRWAJ/naHk5rMzZtOn3fHzL91RTtBmifVf/nz2PCIgouDnJo2kAQ0tiQNO0rL+jfqbzbujBZYA7srzZ+IVEQD5SkD3YFJeQTX9CIxcHNutbbSTn9PWWNnLojbrP0yZfBM2EUjzjGNBKQNjXZuli7esNLM8m6ixqBVaW+UxvvhE4buQN7GgFEt/oCl6+HkZVJySbvdhmpIJ02km0bC0Pv92/aQizdt2l3XjqNEcdnpr8so0EoV3QIZmM2PJ2iTmFWZHFdsMGeObuFVQ2z7Bhcog8261uoBqWuixlz/lWgl2HdRVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(83380400001)(66556008)(36756003)(316002)(31686004)(8936002)(66946007)(6512007)(33964004)(26005)(186003)(53546011)(66476007)(4326008)(6506007)(2616005)(8676002)(2906002)(86362001)(38100700002)(38350700002)(52116002)(6486002)(31696002)(5660300002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEFkcTd6bHRSWG82b1RjNW9uSGw1V0FTNk9wdThaL1RNN1FiQUtBRThNM2c1?=
 =?utf-8?B?SHBFVEwxQVBSdGNWR2J2SUh5R1lXbE1zNUZkSDZQUHpYU0RFY3VUc0VKbDlr?=
 =?utf-8?B?WmtGdzZXYVdiUHZYRnhlblBLVnZ3VmVHT2w3Z1pRUVlGQkUvQmJuZ29RL1VJ?=
 =?utf-8?B?YUJVYldvZUg5d0dud2RyTkVjVzc2ZTJrRUZXaXhWMFRKWkN0aWpZa3dBelBl?=
 =?utf-8?B?KzJURVEyY3RWdXFyVmp0MTBNTkJCZFVoZG1kMy9GYmk0Rm00cksvZXhtVm1x?=
 =?utf-8?B?dzVSZ2txdGRrdjB3YnJvOWhvVk5ZNjBubnBQOFhxWFN3bTMzSEJwRDNaK3dV?=
 =?utf-8?B?NTdzcjkvQUQrWHhEVGFISE9FL1dtazJ5bFl0eTUrRFJQY2ZoODBPSk03UFlI?=
 =?utf-8?B?V0g4alJaUVUxSFQ5WVdCTmZLYUZ5TXhPNVhCcmlOTDZvVU1HeThwai95UjB0?=
 =?utf-8?B?MzgrMUVlSUJnaUZkekxRRXFQdnA5WFMwcEkvMkk2Y2lyaVVzSnMyZkhNUnpu?=
 =?utf-8?B?MlNWUWl6aExmRzQ4N21UWFZLdDhlRVV2VXNvM2x3WFBqNnJkazJhWndrOHZx?=
 =?utf-8?B?K3VUbGx6NnRQYUNtWVZMOVY1Y04rT0lXUDFUb0VIMXBNN2hoQ1N1cERQUDNI?=
 =?utf-8?B?NkNzSkNTS2ppNG92cmpKdkU4U1h0RTBLVDdYWWhLemptcUlTclVnZS8yYXR2?=
 =?utf-8?B?dUxSLzF2RDM1akVzQ3d0R29nZmgzNS9GQ1MxOFVxWVBLVGt3ZmdhenRleGxu?=
 =?utf-8?B?czVzS2FqSml5THh0d3BPQ3lYaEF6RkdDTGRGbmQ5VWhEejlFSS90OHh2V2pt?=
 =?utf-8?B?UVFPNldkK2NpOU9OVzJhQkFjcVR4SE5rRXlFb0hpRjBHZm9wd3hrSDg1NllB?=
 =?utf-8?B?YTBGVEpTNDdhK0FuTExUYW1vZjVqYnZZR2s0NWltN3VHWkwvSVJUYk9GQmdP?=
 =?utf-8?B?ZHNNbGo1dld0ZXdOZWdLVlVQbGw1eXVVQmxDRldpMURMY21EYm1TdVY0SjJk?=
 =?utf-8?B?T1NNMnFuQS9OWGd3VC9iSkYyeWNzdlJ2MHB4TXhIeFZjSm8xZklUQ1MycllM?=
 =?utf-8?B?MVp6SUV6R1pkakdOMTR3ZnVNL2xyVXBMaW5Hc2Rxem44K1ZPeitWanNCeGI4?=
 =?utf-8?B?a3l4OWc2a2xrdnFNMlNBMVhnSDR1U2ZXV1B4MWZNRWpVck84TjNJTjh5Yksw?=
 =?utf-8?B?QUZzOWNKSnQ4V0tnQm9IeU5VcGxRaFQ1eFJBc0pvdmVMZ0phRnBTenNBVXhK?=
 =?utf-8?B?WlZKOWxVTUNaVVQ5aHdrcHJLYllZQTBiUnkrdWlrOERzVVVvTjkySTA1V0gx?=
 =?utf-8?B?LzFrSkVSTVUyZkhoZDl0bFA1ck55ck1BVENHS3Y0TzdoeUJiVGI5UytydGwy?=
 =?utf-8?B?aWxBSm1WaW5BSHRheVNLL3M4S1NNWVVxSnk1U3FqN3pMYzdKazRvdWg2bnV1?=
 =?utf-8?B?UGx5eGMrUmRueHlBc3J0ckxUMDR4Ky91NUZiOCs0NlJFNHRUYzArdGJERlk1?=
 =?utf-8?B?L2Z1bWpYZWJOYVo4NUFHeDduYzRxZk9KUEtTVTRsdExCU2NLNVJOektXS1lN?=
 =?utf-8?B?aUQ5TzFOUXZGZ3ZrOCt1R0dYM21zMkRCcThMb2FjczdZdHA2U0ZIdzFQdkhw?=
 =?utf-8?B?MDc5MmFSV2tJSkpDRDN2YkZ5eG5MZzFaTzNIUWhWcHk1em0rczBaTHRJZWFx?=
 =?utf-8?B?blhCeXJKVzMvcUN6bzZrRktCeUVyeFF2TU8rZmp5UHVDOEVUL0tPMTdNUHla?=
 =?utf-8?B?UkZ3Yzl5UVh4SXpraVY1Y05raUV0UGNqOVFOZGxpS0cwRCtENUUyZjhMalRi?=
 =?utf-8?B?WjByRzFseWZQd2ZJVERxbWE3RmppU3psZHZPUEdPOTJQTlJPeFhtS3dRVzYw?=
 =?utf-8?B?cEw2ajBwVDlDQjVSV2phUXZZb2w4VFRtNFJXTmhSSjRRVWcxbjJmbEd2blBa?=
 =?utf-8?B?N01ISFo1R2M3Qnp1L2wxVm1maFA0VitCME1JMzk4NzR2TFp4NFN4dldEazFT?=
 =?utf-8?B?eWhjU0JyNGZFMElOZEU3cVA5bkFYVFhZVm9VNFFWWWJtdTU3VDRPTU1oWEFR?=
 =?utf-8?B?Vi95blVleHJEZkg2S3l4YjZzSnUrT1p3K0o3TWNqOFZXMzFjSzhtZU9WWjJu?=
 =?utf-8?B?aVdNSUMzMkhpWkZmTHNYb2M3a1JjWlNJQk1WcXJMajFjT3lsUXphcWlRZzZ5?=
 =?utf-8?B?b1N3TWRXczVIUFBhZndXM2Z2QnBTYk1BaVB6ZU9sc29ncGg2N1ZIWWpZejNH?=
 =?utf-8?B?ZzVIRGZXQ2dnNHpLN1g5ZFUwdktnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ea570c-f3df-40d2-bef1-08d9d9a10756
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:06:28.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNQSR7uAOJg+VhJr7FhJWVa02QZeMkTrAwJQGdorAwoRL26nFMgHrFBrczwVhugGqVZMA/1t6diu3mv64W9253Ba91AqP/uJFc2bFUvC2z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1920
Received-SPF: pass client-ip=40.107.2.138;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

--------------jhnDaor2s4lqfSD0ibTU7r8V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/21 20:40, Vladimir Sementsov-Ogievskiy wrote:

> Add a convenient function similar with bdrv_block_status() to get
> status of dirty bitmap.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h |  2 ++
>   include/qemu/hbitmap.h       | 11 +++++++++++
>   block/dirty-bitmap.c         |  6 ++++++
>   util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 55 insertions(+)
>
> diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
> index f95d350b70..2ae7dc3d1d 100644
> --- a/include/block/dirty-bitmap.h
> +++ b/include/block/dirty-bitmap.h
> @@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
>   bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
>           int64_t start, int64_t end, int64_t max_dirty_count,
>           int64_t *dirty_start, int64_t *dirty_count);
> +void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
> +                              int64_t bytes, bool *is_dirty, int64_t *count);
>   BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
>                                                     Error **errp);
>   
> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
> index 5e71b6d6f7..845fda12db 100644
> --- a/include/qemu/hbitmap.h
> +++ b/include/qemu/hbitmap.h
> @@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>                                int64_t max_dirty_count,
>                                int64_t *dirty_start, int64_t *dirty_count);
>   
> +/*
> + * bdrv_dirty_bitmap_status:
> + * @hb: The HBitmap to operate on
> + * @start: the offset to start from
> + * @end: end of requested area
> + * @is_dirty: is bitmap dirty at @offset
> + * @pnum: how many bits has same value starting from @offset
> + */
> +void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
> +                    bool *is_dirty, int64_t *pnum);
> +

I think description should be changed, there is no start and no end
arguments in function.

>   /**
>    * hbitmap_iter_next:
>    * @hbi: HBitmapIter to operate on.
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 94a0276833..e4a836749a 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
>                                      dirty_start, dirty_count);
>   }
>   
> +void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
> +                              int64_t bytes, bool *is_dirty, int64_t *count)
> +{
> +    hbitmap_status(bitmap->bitmap, offset, bytes, is_dirty, count);
> +}
> +
>   /**
>    * bdrv_merge_dirty_bitmap: merge src into dest.
>    * Ensures permissions on bitmaps are reasonable; use for public API.
> diff --git a/util/hbitmap.c b/util/hbitmap.c
> index 305b894a63..ae8d0eb4d2 100644
> --- a/util/hbitmap.c
> +++ b/util/hbitmap.c
> @@ -301,6 +301,42 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>       return true;
>   }
>   
> +void hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
> +                    bool *is_dirty, int64_t *pnum)
> +{
> +    int64_t next_dirty, next_zero;
> +
> +    assert(start >= 0);
> +    assert(count > 0);
> +    assert(start + count <= hb->orig_size);
> +
> +    next_dirty = hbitmap_next_dirty(hb, start, count);
> +    if (next_dirty == -1) {
> +        *pnum = count;
> +        *is_dirty = false;
> +        return;
> +    }
> +
> +    if (next_dirty > start) {
> +        *pnum = next_dirty - start;
> +        *is_dirty = false;
> +        return;
> +    }
> +
> +    assert(next_dirty == start);
> +
> +    next_zero = hbitmap_next_zero(hb, start, count);
> +    if (next_zero == -1) {
> +        *pnum = count;
> +        *is_dirty = true;
> +        return;
> +    }
> +
> +    assert(next_zero > start);
> +    *pnum = next_zero - start;
> +    *is_dirty = false;
> +}
> +

This function finds if this bitmap is dirty and also counts first bits.
I don't think that this is a problem, but may be it should be divided?

>   bool hbitmap_empty(const HBitmap *hb)
>   {
>       return hb->count == 0;

With corrected description
Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------jhnDaor2s4lqfSD0ibTU7r8V
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>On 12/22/21 20:40, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20211222174018.257550-8-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Add a convenient function similar with bdrv_block_status() to get
status of dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 11 +++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..2ae7dc3d1d 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..845fda12db 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: the offset to start from
+ * @end: end of requested area
+ * @is_dirty: is bitmap dirty at @offset
+ * @pnum: how many bits has same value starting from @offset
+ */
+void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
+                    bool *is_dirty, int64_t *pnum);
+</pre>
    </blockquote>
    <pre>
</pre>
    <pre>I think description should be changed, there is no start and no end
arguments in function.
</pre>
    <pre>
</pre>
    <blockquote type="cite" cite="mid:20211222174018.257550-8-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..e4a836749a 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count)
+{
+    hbitmap_status(bitmap-&gt;bitmap, offset, bytes, is_dirty, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..ae8d0eb4d2 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,42 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+void hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    bool *is_dirty, int64_t *pnum)
+{
+    int64_t next_dirty, next_zero;
+
+    assert(start &gt;= 0);
+    assert(count &gt; 0);
+    assert(start + count &lt;= hb-&gt;orig_size);
+
+    next_dirty = hbitmap_next_dirty(hb, start, count);
+    if (next_dirty == -1) {
+        *pnum = count;
+        *is_dirty = false;
+        return;
+    }
+
+    if (next_dirty &gt; start) {
+        *pnum = next_dirty - start;
+        *is_dirty = false;
+        return;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        *is_dirty = true;
+        return;
+    }
+
+    assert(next_zero &gt; start);
+    *pnum = next_zero - start;
+    *is_dirty = false;
+}
+</pre>
    </blockquote>
    <pre>
This function finds if this bitmap is dirty and also counts first bits.
I don't think that this is a problem, but may be it should be divided?

</pre>
    <blockquote type="cite" cite="mid:20211222174018.257550-8-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb-&gt;count == 0;</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20211222174018.257550-8-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre>With corrected description
Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------jhnDaor2s4lqfSD0ibTU7r8V--

