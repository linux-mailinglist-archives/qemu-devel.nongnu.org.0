Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F038CBA4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:12:44 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8hX-00015W-E8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk8fq-0007UR-Ax; Fri, 21 May 2021 13:11:01 -0400
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:64161 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk8fi-0000c3-CA; Fri, 21 May 2021 13:10:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq22RuoDn2opqaUUIunsQ1PINVESy+F8kMmkrYnaJXHGL5+bzC+9Ofj8rMmBPvGk6Zhh7xkKIT4714i/gEzRsIWgOXzvfybcWZPxHOCeaZa5eoyuUpMHKvv/JJ9JrRTcnxpNFmePzv6NJ5CC7c20aAPSPD063njk+1hWi2SVXGGZwssJml64zwK3GSg21Jq9fSYHKCJiRQaGz0lAFY7q10hCYmcJTP0AYHwAkz5HPEVpgmecOxmNcdd5jcB40AfCGpDmzivsyPIIfVN9hIJm9fmqu0W0ycuM6coUuVS+Nqw8A+79wpyH+keetHt9y6F++f2xpxZ9wqR2xyBr/FBT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTi7D4n7EdrmtE/wWn9EQ03P+wwrJ/Hqb7nsJyYCNsw=;
 b=WFt9X1lrPxbNZZTE70f2PWDlzUQRvk2mi94+emcEVLaDf2QKDf5zVBktuqaPDyR9yy/lWpAUP/7uYLzb+Hop/PlByAEyTu0ZhTPbAGgXWCO2TXomQffORCSYex1KSW7Z5R29FZW/eMrT70vHn8Ao6VNm4zeAZUqmk3baUcr8S9AR80olPmGv6XFAvp9MdPSu/K52+Pz5KT6xFoy5dUpjso0vLvveXz+oeN4w9OKExHM1qUc/Ud2pLt2gjs9UqpIfcJbFOMe2LqKqMshXBklsZgmpp4UoGEbkEwINeAiEGFf2kAY033Za+ZJpEifK2W7Jo9utYcgu+iCYeBRVvPeZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTi7D4n7EdrmtE/wWn9EQ03P+wwrJ/Hqb7nsJyYCNsw=;
 b=uXiJq8Ja+0ZaBE52aKyHGkovr9PzcsupeD4ngsXkOLIabPtPAkYHM5nEYzd+udkR+tG5zMDmBgJne/fJH/OIX+oiAuPFOCOi0uCxoE4OOzDz5oN5jjQkb0Q4wxuFnXvBowG2xp8ro9UwyIflrJq74jNA8L/23CaTrgaWEMOhpxA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3767.eurprd08.prod.outlook.com (2603:10a6:20b:84::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 17:10:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:10:42 +0000
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
Date: Fri, 21 May 2021 20:10:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-8-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 17:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b903d16-1ea8-48d1-2cc2-08d91c7b5d97
X-MS-TrafficTypeDiagnostic: AM6PR08MB3767:
X-Microsoft-Antispam-PRVS: <AM6PR08MB376789C0C5B8B2776437C6DDC1299@AM6PR08MB3767.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMqW9BRI+iTdUqySSkigXGo5ImQiJsL6/0mNhuHy6eJm83Abf2PyMV8g2ICx5E4SBlaPBty7cJJe1oNdR5pABNMrTQRYTrtm1W0n5tNvwgJS06hZ1ML9P5A3HzyeLjM2H3H8wBuCuZu5z07HvIEb+cEaN7TtafzMIij2TmorzZD8qHiUyuMa4Ici2Lr+f5jhHtl0/YCCjYrwnVLe4ZoFa6qYS+IYopnJD5TFEpyieK5I9JwBavgoo6+97tO1DStQaD6q7YFbZvPsqp86Rt3GX71QOAwBAYwts7Y7T3/stG2GNN5jhoEa5XINeTyNIec8LPwKbX4GzUqLyDqARqbrNEap2lHgsOfkgEi4tweIzfzVPctaCkw6xAy3zuONZ9M1jF9eVaRRBrADrcffTwxmB0mGaSCYxLMp9pYBbu5EQsiTA2qfaQBr6oIFMA5nUsTRKdCmVq6/usysFpGEZOiIS/6xUSGNtuR3MwnTmbVEOqpSzSGdajXmvtDOuDtM1QcgqKWBmmEm7C9NxdUO58U/nz4Vysyvi+WCU/MSC0Xrvojs/HE2ECufYVR61/QzPMQLs9c15E2KnzivqlwxLXuVMLzLv9glhbl8g0CL9k0WI9Sq3EXyrO8c7NoxdcmgBxffWhhRfTbb4pLaENwbXKIc6C1oCHHwOUrfRHMWIbohIvwFeaeh2iM/d93puurbT40B5botDY7E+Ag2G7nUNUQudczRZ5Ay0n63ovtEhO1dGnVfsIza22sgTh6x0RDwUqUm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(366004)(346002)(376002)(16576012)(316002)(54906003)(956004)(8936002)(5660300002)(52116002)(2616005)(66946007)(31696002)(4326008)(6486002)(31686004)(66476007)(66556008)(8676002)(86362001)(26005)(186003)(83380400001)(36756003)(38350700002)(38100700002)(16526019)(2906002)(478600001)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUNBYTlVNVEzbDZDQUFSYUpHSC9LWnRYNlcydFg2RThSZUxhNHJFdUZnRlBm?=
 =?utf-8?B?dXgrVnFFcFlQK05JblY5RzdPV3BzWno4OFB5cnBvOG1Sb1ZjTUNUS0lmZlda?=
 =?utf-8?B?Z3NuajNWbkFQak1MNE4wMlpVbFQ0M0R5c0NkdmlWREZUbC9aajVBaGJvUmFx?=
 =?utf-8?B?amE2NlZwL21na2JtWnA3V2tCZktWTk8yRjg3T092ckFXcHRyWTNMZVMzQVhE?=
 =?utf-8?B?S0lwZWRuQW5jOUtyTTFDT0pkVDB1QnY4aHZzM2pqTTdaTDJnUlhrQjhpWWVN?=
 =?utf-8?B?MFZQZjdkR1BCeTdqNGg4N0lYempoYVFBY1VtdnZsRm1TY1lNdEQ3eDVxUi9O?=
 =?utf-8?B?V2hmWjBNbHhCdXFGbVpxR1M4akY2VkRrejErcTZ2NjhBNUhrOXBDbndRYURa?=
 =?utf-8?B?UmRia1RHZXZJeFQwS3pDcVhBLzRvWU9aRnNUT0Rxd3hncExEZUV0Q0F5dURw?=
 =?utf-8?B?Z016a0l1YjNHOU1MbFE4akFNN2ZjMkJiN0d4NWd6cGQxTVZUZmZ2aC84YWNt?=
 =?utf-8?B?WENpMXNHa2RwRUJsdm5oMVBwbHdBOHl2eHJxTCtscitVdGhTeWhpR2dnWUo4?=
 =?utf-8?B?ZFk5NVpQOVhpS2lvdkk1R2lVaW5TZ0Q5eE5aUEUyWTNEOUJ4U0ZLNEhZRXNj?=
 =?utf-8?B?NFNrbSt6bkdiME9KbmVxeFNQQnl6UnoxU2xsRm5VV2JEa3lHWVJWRW5JdkN0?=
 =?utf-8?B?dGVRR1IvOFk5WmR5QVNxTk5pS0Y2V211TmxkUlE3aS83eDBBOEtHVVZ6QkFa?=
 =?utf-8?B?QUh0N1kzVGw2L2Z0K1JWWXBpZ2RIa2JBbVNtbXdVWnVBcTZyTVBEcmwrcVF1?=
 =?utf-8?B?bXU2ZmNtcU83Y3RrcWxYSW0wcElISlZuKzZnVEtjWG1nbHplTDhidHI5WE5P?=
 =?utf-8?B?b05NSGhlYWJqUDZNMXdGbG90SEVUMTZEZ016ZlhIeUNIdkFieFFzMkVPeS9u?=
 =?utf-8?B?TkJLQ0JtTzVuVTlxUG9uSXJoVmE2UkJ3a1cvOVg2MXl4NmdWRmtGY2ZNUDJs?=
 =?utf-8?B?c0p6cnhnZjZ5anMzMitEaVpxRDIrR1dpSXJsM2YzZVY5Nzc2UjFLTzRQMnNX?=
 =?utf-8?B?alBwREJmNUVSbHZhZHo5cjZrR1hJS1RtM3dhTEhXTU55UTFtT05NZUo1TTdB?=
 =?utf-8?B?c2p4ektMOVp1OWhtbFN4bWljSHpVRWxIMk9NV2hRY3ZLNDRmbXdTODBTV2F6?=
 =?utf-8?B?b3plcjFWTEw4cXdHUTRVeDdDOGhXRU1OOGIxRzJMZlo2b2ljWm51TzRLRDBO?=
 =?utf-8?B?YVlsbXpIY2VaSTJtbUdLbGk3MlN1Tjh2WVBrUW5wWGRJUlUyVUdVTDB6Qm9i?=
 =?utf-8?B?OEpOUHBFV285Q0FwOEpGSWtkWG84b0JMV0xHSG1pc1o4TDdSa1dSdy9qTzZr?=
 =?utf-8?B?SHBEWlpRaEk5VElFNzJFcExmQ0hnYW03SFBUc3VLVjlFbVB6a3BMN2lxc2tu?=
 =?utf-8?B?eVFhRG5nZjQ4aGZCa2tyOC84NG5aVnRwd2RrSG1RcXpjOTE2Y3FHbkZ6Z0hl?=
 =?utf-8?B?Zzd3Q05PSUE3N1p3dy9iN3Ard1M0d1RkajRnY1g3cHE2ME1uWlhqUGtnK2hX?=
 =?utf-8?B?MURweVVsbjIrVDlHRFpXSWtRQ213RFg3c2ZJenNVY1hFeU9pRE1abWY2SzRJ?=
 =?utf-8?B?UmxIYkhodm80dktmNC9KUjhXS3RkUEgzcWZWMUdTRFkvUitHV3dRdWE3eVhL?=
 =?utf-8?B?YWw4Mzh1Qk1taklIdStvdFYvNzc1amJPSnlqRmxSeld1ME1KWGY4VkxVUStj?=
 =?utf-8?Q?Rj2g2kxIHfhxp6K9Y/UJ7wGWffTBRyaL0psR/WT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b903d16-1ea8-48d1-2cc2-08d91c7b5d97
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:10:42.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ll7bxj3qGcM/+lpd8EIg4FAY9taPH79L3X/58EXiTqqcCRYxo8u5/i6CJChoD66N4/eKB0GPi4H2cBu3WbqTtfUaqseL3nXBsrHko+qiD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3767
Received-SPF: pass client-ip=40.107.22.98;
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> With tasks and calls lock protecting all State fields,
> .method is the last BlockCopyState field left unprotected.
> Set it as atomic.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

OK, in 06 some things are out of coroutine. Here could we just reuse mutex?

I believe, that we don't need any kind of protection for .method inside block_copy_state_new(), as it's just a creation and initialization of new structure.

And other things are called from coroutines. So, seems no reasons for additional atomic access logic?

> ---
>   block/block-copy.c | 37 ++++++++++++++++++-------------------
>   1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 573e96fefb..ebccb7fbc6 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -108,7 +108,7 @@ typedef struct BlockCopyState {
>   
>       /* State */
>       int64_t in_flight_bytes; /* protected by tasks_lock */
> -    BlockCopyMethod method;
> +    BlockCopyMethod method; /* atomic */
>       CoMutex tasks_lock;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QemuMutex calls_lock;
> @@ -184,7 +184,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>   
>   static inline int64_t block_copy_chunk_size(BlockCopyState *s)
>   {
> -    switch (s->method) {
> +    switch (qatomic_read(&s->method)) {
>       case COPY_READ_WRITE_CLUSTER:
>           return s->cluster_size;
>       case COPY_READ_WRITE:
> @@ -338,16 +338,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>            * buffered copying (read and write respect max_transfer on their
>            * behalf).
>            */
> -        s->method = COPY_READ_WRITE_CLUSTER;
> +        qatomic_set(&s->method, COPY_READ_WRITE_CLUSTER);
>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>           /* Compression supports only cluster-size writes and no copy-range. */
> -        s->method = COPY_READ_WRITE_CLUSTER;
> +        qatomic_set(&s->method, COPY_READ_WRITE_CLUSTER);
>       } else {
>           /*
>            * We enable copy-range, but keep small copy_size, until first
>            * successful copy_range (look at block_copy_do_copy).
>            */
> -        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
> +        qatomic_set(&s->method, use_copy_range ? COPY_RANGE_SMALL :
> +                                                 COPY_READ_WRITE);
>       }
>   
>       ratelimit_init(&s->rate_limit);
> @@ -432,26 +433,24 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>           return ret;
>       }
>   
> -    if (s->method >= COPY_RANGE_SMALL) {
> +    if (qatomic_read(&s->method) >= COPY_RANGE_SMALL) {
>           ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
>                                    0, s->write_flags);
>           if (ret < 0) {
>               trace_block_copy_copy_range_fail(s, offset, ret);
> -            s->method = COPY_READ_WRITE;
> +            qatomic_set(&s->method, COPY_READ_WRITE);
>               /* Fallback to read+write with allocated buffer */
>           } else {
> -            if (s->method == COPY_RANGE_SMALL) {
> -                /*
> -                 * Successful copy-range. Now increase copy_size.  copy_range
> -                 * does not respect max_transfer (it's a TODO), so we factor
> -                 * that in here.
> -                 *
> -                 * Note: we double-check s->method for the case when
> -                 * parallel block-copy request unsets it during previous
> -                 * bdrv_co_copy_range call.
> -                 */
> -                s->method = COPY_RANGE_FULL;
> -            }
> +            /*
> +             * Successful copy-range. Now increase copy_size.  copy_range
> +             * does not respect max_transfer (it's a TODO), so we factor
> +             * that in here.
> +             *
> +             * Note: we double-check s->method for the case when
> +             * parallel block-copy request unsets it during previous
> +             * bdrv_co_copy_range call.
> +             */
> +            qatomic_cmpxchg(&s->method, COPY_RANGE_SMALL, COPY_RANGE_FULL);
>               goto out;
>           }
>       }
> 


-- 
Best regards,
Vladimir

