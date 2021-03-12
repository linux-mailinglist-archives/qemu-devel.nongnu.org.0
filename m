Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC32338A2B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:33:39 +0100 (CET)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf6w-00026W-VA
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKexZ-0005Ia-8o; Fri, 12 Mar 2021 05:23:57 -0500
Received: from mail-eopbgr00105.outbound.protection.outlook.com
 ([40.107.0.105]:10126 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKexV-0007DA-Bq; Fri, 12 Mar 2021 05:23:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghNSouRwaRBqXh/hmopD18dLlx9JjhlZBShPBeFAdK3xLwhWJeX98+BrLIClAIk2LZvGCdWc8nvxNrDsdbBxiadca0ScJjF2RQYjRvGWHXjNM5TKR9kygGc2Xd7K21V8OCHOP+/upH2dFItro5v4sLAyxDOpEidVvS5QctJpmEeSOe677f/BamBn3E55RnS1yV5Bv8vqXLuK5SlV86Ti3EaN4CiuyWgeUCz0jbqXb8muww0YveJkwa9S+3FMhMG2JxB1N1w5HyTMX7dA5g4Rt9wN6zwzx4CaSZoUqwfTAZVoCT+buGdYNLo7uk5NmtZcC96GD5eQDfJQ8L87qlW3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWo+9uHVZGZiHOvKO3zF8phf9+uC/8HHPv1nlSsPYJ0=;
 b=AB0X3BOIwtB2RzeHyiSUkF+bGR6v91k5hOs7+zht5BKfXANSWb0mzQ3+NWGo/sUrLPAo2MutGuSkM8TMJJFhROVrly5xcSPBPgc7deHuGlKBvDP1X8ZEZ0+ti18zTH3PTfgFlbVDYeBwbkLQ0ZjYakWTi6706Q8NYI9t+fGtFdLqB426EUbWaHZlbSXCxG6LO9+U0HSWGcie13PnABLiG3w0X12X+YwrW6xqv2f3+wiveT6kBAaVZ17UKKHXNrE6GFic1Tsoikt3F2lFSZc3PWzjW/5N1lmcwIo6jIoxT02r+INkZFGCZ/hjgZF/Jam6WAFOHG4TG4nQ1tzyLQ34fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWo+9uHVZGZiHOvKO3zF8phf9+uC/8HHPv1nlSsPYJ0=;
 b=GpZKYsbEOSLSYTL7Nxp3xuTvILzhoRqwU8HFJUSQCLcEj5RB6jPAMQOcma4HGlecju4F5UvOf67VjMA0HajAOj1m/N1ftHgmkNYhuIW4W7P6oviSgxea+e0NTpzUmY4zuB7fOYVX5RzywUUhnKHBLIf3M8jmkrIFGv8fftaKqYM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4406.eurprd08.prod.outlook.com (2603:10a6:20b:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 10:23:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 10:23:50 +0000
Subject: Re: [PATCH 2/9] block: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:CURL" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-3-ma.mandourr@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
Date: Fri, 12 Mar 2021 13:23:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210311031538.5325-3-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR0902CA0004.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR0902CA0004.eurprd09.prod.outlook.com (2603:10a6:200:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 10:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb9703a-c392-46e5-fec9-08d8e540ed8b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4406:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4406E8C3E6DD55C8AF01CBB8C16F9@AM6PR08MB4406.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJ4o2/kAxe/eBAgqOIalR83EXfchdmYdmMZseiJAEFwY30FpClA5UQQ2yz0NlMZpuw7VMi5NHsTXbX6+7XNxX2DhvYBKf94qxxA+7Fi/uBUsHrAsyJ9+8NIEnvmWkHSfq1WA5s2xSwCr4sMBwBBmeX24yd8IswHpguN1jUOSvrOu7TikzqfgLfsuBtePNYuU/L6t2EYHRSZ4kWP81OBOjSwvMbaMsvvx1qopRjIw60SCMyxA3qgpHWHgAj4g7GCcGuqxv0fMBwOqOykW2FATMRMtlXRxox9SbgiiEQKhnEEy65vraxku2smQMQVI8KrIbj0h3yOi/6+Fgm9DLCNsJyQ16OftHqsGx7gs6Z6Quynu6RCkpIIsM52vZKFGPb8eQu+NsMDmBCFRssmIKe46aNGDBZvsz8yiY9JZD3vE1Qv2MyqdgZ2sJnmIHfzWNEwGrgFrn+1H6jouxLexCe0QGU7Mgf4iLLQO1JBpXfzhX1yuMrP/JNRx1gTB0XUYgGenmXVTFP2EQ9CFDYSBXNwbjpgVF5OyaraUdALJWwmRJdDDQQvM73B30tvQqMHOFt6rRM+Gxx/w+/34AxF+xdtN7eBnFEaaP5FsKQB4HQZVrLJXRR/YMOjwxrIswMnxG/ewo1DS210Cugegk+WWH1GD2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(376002)(346002)(136003)(31686004)(6486002)(2616005)(2906002)(186003)(26005)(16526019)(16576012)(8676002)(54906003)(66476007)(316002)(478600001)(8936002)(956004)(66556008)(83380400001)(86362001)(31696002)(52116002)(5660300002)(66946007)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXIySkpVRjI4a0dtd2RqcmpESHJRdGViUktEQ3lGb1hnRFF3SXRhOUd3a0xu?=
 =?utf-8?B?LzJkNHZGQ3ZOQjFLVmZaYnZ3SU96ekg3ZWszYmVja3UzaHdXbkpqS3pBSi9J?=
 =?utf-8?B?bGYyVitIZlIyZ1dSZHN2Q2twdS93UTNiNTNPZWhaekZBVkxNbE9XalpQbnRv?=
 =?utf-8?B?MDVIMU5FbDROYm5IVVBGSk5lRG85cnVyVnQxTUh5aVZFbm1VMTlleEFMeXcr?=
 =?utf-8?B?aUFmcG1lK1VVOUlidnFHeDRQRnlXQzV3OFllMUNYVVpJY2piSWVqaU1TMnJz?=
 =?utf-8?B?ZUE5T2pzV1FCWXRFVDNYQUVVMHJVUFB3WWpzWm9icUx2amdmTmRzWEZSNnJ2?=
 =?utf-8?B?Z1FOMnZDdGlhSzBIRG8wUHdLZmx3YXdURFVQcFp1V2Q2aEZPcWhOMzNvTFdT?=
 =?utf-8?B?eXZFNk5iU0NXV1h5bUpBKzFwVUxKb3JrdDdxU25OMWZpWXYrN3VSdUxHTU9T?=
 =?utf-8?B?K1h6aEkzZG53RDVnSnNNU096b0RkbDZpYnlIdURxcjF2eW1xSFBFNldjV004?=
 =?utf-8?B?MzF4dGM2UHBYRklqWE1mZklwdWZPNmlNL29wUDJpdzdmLzA5Qk54NWhsSnYy?=
 =?utf-8?B?V1ltVVNhYUdHQWlFR2FNN1hKWFRTZWMwZklqUVE2Q0lSQUtWNHlOTVVlck1B?=
 =?utf-8?B?ZFFjRDBrb3F3c3RlV056eXJBMk1FVFBHRDdzbW8vRFA5Y0FtbWo2RENIbk9m?=
 =?utf-8?B?UmpsbWd5NTlIazBNbDlNaUJhOU43MlBsRmFTZWNKNnRjQXpJWmQ2eUd4aFdC?=
 =?utf-8?B?ZEVnbkpzWHlVTHJUUVlOMko5WUlXTHk2Rjk4dDBSeER3UUFLSHViM1BBQlp5?=
 =?utf-8?B?c2ZWTXRmSmxrVGNneml2NmNtOE1iNTVVZ3dQRUwwYVplNi92aXQ2aHF3Q0F4?=
 =?utf-8?B?SHdHZDdXOVp4QkVSMDNjbjEzTFh4YUlsUzhKWGN4RFIxTDQ5eHQwakpWZHZU?=
 =?utf-8?B?NmN5dUhmSUN6SEtiUVc5TThsWnRsVGtoV3JMbDdhZEJUcHRKUHRsdUYrS3R1?=
 =?utf-8?B?LzgwMU1xZkNyNTJ3bHVqZmFRa0c1R0I4ODdrdUM0b21Cd0p3dEV1dnIvQXNt?=
 =?utf-8?B?SDVmSDlEUXpibEtyNzA3aEl6QWJMLzFpaUdadVFFUmx5NmxjWDhyQ2F2VkRq?=
 =?utf-8?B?TDBQeFJaNXdZNElacUU4bXFRb0g2YUJGdkg3Wm5EUHFhU2lZdlVnUVI4b3Bx?=
 =?utf-8?B?cTl4WnRnYzZTczVhcmhIRHlKY0ROb0FLNUgrbk9mVFREZEVwV0pDa1dZL0wz?=
 =?utf-8?B?b0sxV3VtN2NXSllLbzFHZVg3N1ppM3FsaXoySlRZMGZHTFZZcktxV2lySmhO?=
 =?utf-8?B?T1JldnRRNVd0UVBVazkwK2p4SDR2aTlLU0FLblg5L21qYkRJTzZkYkJZR0s4?=
 =?utf-8?B?dFdNWCt5eHd6NjJFS0ZOUC9qUFdmVmp2eW9NZmhsakFOd2UyMWxwUXB6TWNk?=
 =?utf-8?B?SmZEZ0Y1SDJmVnlRQWRRM1MwVi9odXZ0UjZnRlBGczEzbHY0N0J2RTcxTVY1?=
 =?utf-8?B?R1N0Mm82Wk1iZWE4Wms1TllibVhLemtVSWdzY1N5dVl1eklsNUdwOFVzYjVZ?=
 =?utf-8?B?eEI1MUhjK2ZhSFBIUW1RcThGVUd5MU0yTzR1citiM1BxME0zVzR3VzlrSkpP?=
 =?utf-8?B?UlltWGhxc0NZQXVlOU16OVFZSVFvOVJnS3ZrU3VONkpjMDNQS2VhUCtvOXl6?=
 =?utf-8?B?UXM3UmlSdWllMjRQZnA2Sys4Y00yMTlNUk5LSUQxendnYVA4Y00zNWZLdjI0?=
 =?utf-8?Q?I4+ZS9exGx9WtjmTxUv0cvvbX4ZJfbRjV11pTXH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb9703a-c392-46e5-fec9-08d8e540ed8b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 10:23:50.0670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8vDYcg7bVRE/lZGxAFRgI0tG3rtenKH/mCeq17nx8zoIy7x7Pa2680X8nBmtmYiE7NJ/me8njF6z0+nUubVYWq7PQL8a0/cpzwdUBjoVe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4406
Received-SPF: pass client-ip=40.107.0.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

11.03.2021 06:15, Mahmoud Mandour wrote:
> Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with
> lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).
> This slightly simplifies the code by eliminating calls to
> qemu_mutex_unlock and eliminates goto paths.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>   block/curl.c |  13 ++--
>   block/nbd.c  | 188 ++++++++++++++++++++++++---------------------------

Better would be make two separate patches I think.

>   2 files changed, 95 insertions(+), 106 deletions(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index 4ff895df8f..56a217951a 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -832,12 +832,12 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>       uint64_t start = acb->offset;
>       uint64_t end;
>   
> -    qemu_mutex_lock(&s->mutex);
> +    QEMU_LOCK_GUARD(&s->mutex);
>   
>       // In case we have the requested data already (e.g. read-ahead),
>       // we can just call the callback and be done.
>       if (curl_find_buf(s, start, acb->bytes, acb)) {
> -        goto out;
> +        return;
>       }
>   
>       // No cache found, so let's start a new request
> @@ -852,7 +852,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>       if (curl_init_state(s, state) < 0) {
>           curl_clean_state(state);
>           acb->ret = -EIO;
> -        goto out;
> +        return;
>       }
>   
>       acb->start = 0;
> @@ -867,7 +867,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>       if (state->buf_len && state->orig_buf == NULL) {
>           curl_clean_state(state);
>           acb->ret = -ENOMEM;
> -        goto out;
> +        return;
>       }
>       state->acb[0] = acb;
>   
> @@ -880,14 +880,11 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>           acb->ret = -EIO;
>   
>           curl_clean_state(state);
> -        goto out;
> +        return;
>       }
>   
>       /* Tell curl it needs to kick things off */
>       curl_multi_socket_action(s->multi, CURL_SOCKET_TIMEOUT, 0, &running);
> -
> -out:
> -    qemu_mutex_unlock(&s->mutex);
>   }

This change is obvious and good.

>   
>   static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
> diff --git a/block/nbd.c b/block/nbd.c
> index c26dc5a54f..28ba7aad61 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -407,27 +407,25 @@ static void *connect_thread_func(void *opaque)
>           thr->sioc = NULL;
>       }
>   
> -    qemu_mutex_lock(&thr->mutex);
> -
> -    switch (thr->state) {
> -    case CONNECT_THREAD_RUNNING:
> -        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
> -        if (thr->bh_ctx) {
> -            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
> -
> -            /* play safe, don't reuse bh_ctx on further connection attempts */
> -            thr->bh_ctx = NULL;
> +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> +        switch (thr->state) {
> +        case CONNECT_THREAD_RUNNING:
> +            thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
> +            if (thr->bh_ctx) {
> +                aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);

over-80 line

> +
> +                /* play safe, don't reuse bh_ctx on further connection attempts */

and here

> +                thr->bh_ctx = NULL;
> +            }
> +            break;
> +        case CONNECT_THREAD_RUNNING_DETACHED:
> +            do_free = true;
> +            break;
> +        default:
> +            abort();
>           }
> -        break;
> -    case CONNECT_THREAD_RUNNING_DETACHED:
> -        do_free = true;
> -        break;
> -    default:
> -        abort();
>       }
>   
> -    qemu_mutex_unlock(&thr->mutex);
> ->       if (do_free) {
>           nbd_free_connect_thread(thr);
>       }
> @@ -443,36 +441,33 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>       BDRVNBDState *s = bs->opaque;
>       NBDConnectThread *thr = s->connect_thread;
>   
> -    qemu_mutex_lock(&thr->mutex);
> -
> -    switch (thr->state) {
> -    case CONNECT_THREAD_FAIL:
> -    case CONNECT_THREAD_NONE:
> -        error_free(thr->err);
> -        thr->err = NULL;
> -        thr->state = CONNECT_THREAD_RUNNING;
> -        qemu_thread_create(&thread, "nbd-connect",
> -                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
> -        break;
> -    case CONNECT_THREAD_SUCCESS:
> -        /* Previous attempt finally succeeded in background */
> -        thr->state = CONNECT_THREAD_NONE;
> -        s->sioc = thr->sioc;
> -        thr->sioc = NULL;
> -        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> -                               nbd_yank, bs);
> -        qemu_mutex_unlock(&thr->mutex);
> -        return 0;
> -    case CONNECT_THREAD_RUNNING:
> -        /* Already running, will wait */
> -        break;
> -    default:
> -        abort();
> -    }
> -
> -    thr->bh_ctx = qemu_get_current_aio_context();
> +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> +        switch (thr->state) {
> +        case CONNECT_THREAD_FAIL:
> +        case CONNECT_THREAD_NONE:
> +            error_free(thr->err);
> +            thr->err = NULL;
> +            thr->state = CONNECT_THREAD_RUNNING;
> +            qemu_thread_create(&thread, "nbd-connect",
> +                               connect_thread_func, thr, QEMU_THREAD_DETACHED);
> +            break;
> +        case CONNECT_THREAD_SUCCESS:
> +            /* Previous attempt finally succeeded in background */
> +            thr->state = CONNECT_THREAD_NONE;
> +            s->sioc = thr->sioc;
> +            thr->sioc = NULL;
> +            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> +                                   nbd_yank, bs);
> +            return 0;
> +        case CONNECT_THREAD_RUNNING:
> +            /* Already running, will wait */
> +            break;
> +        default:
> +            abort();
> +        }
>   
> -    qemu_mutex_unlock(&thr->mutex);
> +        thr->bh_ctx = qemu_get_current_aio_context();
> +    }
>   
>   
>       /*
> @@ -486,46 +481,45 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>       s->wait_connect = true;
>       qemu_coroutine_yield();
>   
> -    qemu_mutex_lock(&thr->mutex);
>   
> -    switch (thr->state) {
> -    case CONNECT_THREAD_SUCCESS:
> -    case CONNECT_THREAD_FAIL:
> -        thr->state = CONNECT_THREAD_NONE;
> -        error_propagate(errp, thr->err);
> -        thr->err = NULL;
> -        s->sioc = thr->sioc;
> -        thr->sioc = NULL;
> -        if (s->sioc) {
> -            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> -                                   nbd_yank, bs);
> -        }
> -        ret = (s->sioc ? 0 : -1);
> -        break;
> -    case CONNECT_THREAD_RUNNING:
> -    case CONNECT_THREAD_RUNNING_DETACHED:
> -        /*
> -         * Obviously, drained section wants to start. Report the attempt as
> -         * failed. Still connect thread is executing in background, and its
> -         * result may be used for next connection attempt.
> -         */
> -        ret = -1;
> -        error_setg(errp, "Connection attempt cancelled by other operation");
> -        break;
> +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> +        switch (thr->state) {
> +        case CONNECT_THREAD_SUCCESS:
> +        case CONNECT_THREAD_FAIL:
> +            thr->state = CONNECT_THREAD_NONE;
> +            error_propagate(errp, thr->err);
> +            thr->err = NULL;
> +            s->sioc = thr->sioc;
> +            thr->sioc = NULL;
> +            if (s->sioc) {
> +                yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> +                                       nbd_yank, bs);
> +            }
> +            ret = (s->sioc ? 0 : -1);
> +            break;
> +        case CONNECT_THREAD_RUNNING:
> +        case CONNECT_THREAD_RUNNING_DETACHED:
> +            /*
> +             * Obviously, drained section wants to start. Report the attempt as
> +             * failed. Still connect thread is executing in background, and its
> +             * result may be used for next connection attempt.
> +             */
> +            ret = -1;
> +            error_setg(errp, "Connection attempt cancelled by other operation");
> +            break;
>   
> -    case CONNECT_THREAD_NONE:
> -        /*
> -         * Impossible. We've seen this thread running. So it should be
> -         * running or at least give some results.
> -         */
> -        abort();
> +        case CONNECT_THREAD_NONE:
> +            /*
> +             * Impossible. We've seen this thread running. So it should be
> +             * running or at least give some results.
> +             */
> +            abort();
>   
> -    default:
> -        abort();
> +        default:
> +            abort();
> +        }
>       }
>   
> -    qemu_mutex_unlock(&thr->mutex);
> -
>       return ret;
>   }
>   
> @@ -546,25 +540,23 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
>       bool wake = false;
>       bool do_free = false;
>   
> -    qemu_mutex_lock(&thr->mutex);
> -
> -    if (thr->state == CONNECT_THREAD_RUNNING) {
> -        /* We can cancel only in running state, when bh is not yet scheduled */
> -        thr->bh_ctx = NULL;
> -        if (s->wait_connect) {
> -            s->wait_connect = false;
> -            wake = true;
> -        }
> -        if (detach) {
> -            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> -            s->connect_thread = NULL;
> +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> +        if (thr->state == CONNECT_THREAD_RUNNING) {
> +            /* We can cancel only in running state, when bh is not yet scheduled */

over-80 line

> +            thr->bh_ctx = NULL;
> +            if (s->wait_connect) {
> +                s->wait_connect = false;
> +                wake = true;
> +            }
> +            if (detach) {
> +                thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> +                s->connect_thread = NULL;
> +            }
> +        } else if (detach) {
> +            do_free = true;
>           }
> -    } else if (detach) {
> -        do_free = true;
>       }
>   
> -    qemu_mutex_unlock(&thr->mutex);
> -
>       if (do_free) {
>           nbd_free_connect_thread(thr);
>           s->connect_thread = NULL;
> 


For nbd.c we mostly change simple critical sections

qemu_mutex_lock()
...
qemu_mutex_unlock()

into

WITH_QEMU_LOCK_GUARD() {
...
}

And don't eliminate any gotos.. Hmm. On the first sight increasing nesting of the code doesn't make it more beautiful.
But I understand that context-manager concept is safer than calling unlock() by hand, and with nested block the critical section becomes more obvious. So, with fixed over-80 lines:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

