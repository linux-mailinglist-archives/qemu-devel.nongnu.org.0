Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4CA413850
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:30:00 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjah-0004m4-FQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSjWD-0001S3-Ab; Tue, 21 Sep 2021 13:25:21 -0400
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:34548 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSjWA-0001I9-O2; Tue, 21 Sep 2021 13:25:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU9j7LwartMU2J8/lFUaJTPBtcZogOaa0xve1QQova7ohF4BoBEaYNDd990mUwoCgAvAWbgYiPz/cQkTz3g7iMNd5jMZylKB00EzdGoDolL9FHuJ/sUHWeg3CNgvUUhljWtqJbXmDEfUOuV5y/oH86RvHbZMtm+6J9DnAjpKCleK/NeCgiBVZj+sSCjyAYlpKyfDhY5u4ATBFEvQTMS40FTdVhu8dmUMCr3le0iasuGcY6c7V1+RPXWP9xeJenVTFvCXUATQiwm6d/yMu1hp9rFQv1I+2q/ELGlnRYXvq87Rtv8ckUcUV+zdDkA+x3Yh7wA4g6YPSM/gAvaAPrxwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+6o3BtoTprOW+9ajh3gdQQiX+BYnp/HaVjabcbdrxWQ=;
 b=Rvdwj8nAccYj6n7RdMfgkZCwE8weA92YuEIUjnRVolvWSPaP6O4ZjFnNlxvl4AszXu9USRQ8wPHtYhBozJT12YfR3oOLtyB2Ak28t6cEyw/vRlMYbF5YfyIbMOZRxHmHUYk/9tiaB/2KZiPiUcdQ9bP43qQPpwM1Kw89qJKMTfMkLwWtVQMl49EMCj2PWz39Awwgvpa9WerZvsErBcfsn0PDauEB405CftT+aV2Lr+0qjBZN0UBsomQZ7uluOUyHzR0DbtEHiPLtIz2GShEmrYBGOq9gQOiW84BtMa54Wdlo6QlIKoKEIJUdih1hF6xnVoAmVfbJcgrcTalHb9UvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6o3BtoTprOW+9ajh3gdQQiX+BYnp/HaVjabcbdrxWQ=;
 b=RfUTZpcEUYJNlDD3NIuJXCSbRrDjTygCWbVRKrUgSn8MqXG+2N0usxoeqnsOwru57MJISU1AXs/vIY9rqCvcNdMbS97pSLpB88bryJMGQsLsROu5iz1xF4QSfTtqnDm6oN0qFyKm9P481fR/DUtztPAZdlSBmcw2wQ6OC2E+Nlg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 17:25:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 17:25:14 +0000
Subject: Re: [PATCH] nbd/client: Request larger block status by default
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, Kevin Wolf <kwolf@redhat.com>
References: <20210921161703.2682802-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
Date: Tue, 21 Sep 2021 20:25:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921161703.2682802-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 17:25:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a155f29-1ace-4b19-caa6-08d97d24c606
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839CA9B5CA0783103D39D98C1A19@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aky8QzLCh6GmsmSwPUCuqRYBejKPtIOuCh5BaWAzhnUp6wipxkw71C+FhJP+JWmWm4Cfo5l0PxOobu2TDA+2JrcrZL5bTd9j6kLhSTEvTMWWoleyIt72r/S/hR1yLYhiYUZ1ZcEBqQrrtFw8sZxhgbJQyYLrfKIbdQs/7ZK5tsekciNrp442HYTix8oXl4KK67YJ68LlRnwtnveYS55YJ1dY9zwvf5jicwV2minfQeY2NtWzl5VLImnZSlHs5nvYnwuRk7ppsbMUE7Ub4z/dE9y5xjm8SYMUcSUcbGdGl70RdBnIBZ+bR8qAGI7cFRVVNAsCNTaD6b2sDRLCuzk2epbOOxJnnVWjPsWfN3JsS2uj7TSzh/jqHxs9ZLJ61vY9jJ17rFrzkJ0Ho/Crewd82NHNFU7OPfKqDUyHsUdgGqhM9B7Bnq8bmE7pFllU1o51CSBq6FcFJYRic9rFeu0sooKI0jTXTPvxSud/gqTCqhDmIqmkuFxRHspETpt2rOWvzLpaly5T8/2rCBEtKVZfYXZSIXzt14ZuLGY8F8pyrhIvJuk0fQ2ExhtLRrRD0Koq7d4wB7vBvSUIj6Wpa4yfGx79my2PCXcuQ98oQ/aGIKAldXkxYbih09L5m0l2r3RV51Aq68uuv0SuloRAoesMZH4taIJc/9FSRb47LRiiyzULViR2zkYXxLJ9AKf0W4iDJNbtj7+StCsY/WOvtmG9ge4yQlNs3D827rnATNwwGr1SGA3/bJjAU4BFnD7zFxXuwzn7LiFsbbNaLVZ7hDfrkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(52116002)(8936002)(26005)(5660300002)(31686004)(31696002)(6486002)(83380400001)(66556008)(16576012)(38100700002)(66476007)(316002)(66946007)(36756003)(508600001)(86362001)(186003)(8676002)(2616005)(956004)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRMZTE1TUpPVTY4ZnViRHRnemthQ2FQV1hrcE9CZkVEMklobHdSeExyU1RF?=
 =?utf-8?B?ZG93UTFwMnZhanI2QTM4MUQzTlA5N1F5Skk4Z2tkQk5zdm92aWV0TkU0dzZy?=
 =?utf-8?B?MW1OOE1ONzVSbzNTclFJNDl6NDQ2S1hIYmNUaWNSNm0yb3p5cThSZGcvaDF2?=
 =?utf-8?B?K01OaDVTTUxhRHJIV1FyMy9XWkU4aGhsTmp3SXlVdVgxTy9NaXRtTUN3TnVK?=
 =?utf-8?B?ZUUvbmsrb0tFVUNuLzhaQTVrVVNaWlcwODJxZ0t2MFdTYUxwWGFzYThLa1d1?=
 =?utf-8?B?NXRyMy85U3V3djh1cGNQSmFSaHMzRVZiRW12YWFoa0dwcklUQjg0aTEzMXFQ?=
 =?utf-8?B?YnBneGFMWTdmMFlIUTVrdmUrS2lwRFVyVk11dUVmM0RzV1hYYXVSckdGeFM0?=
 =?utf-8?B?SHVuYmhLZENNMXB1MUN2aldPOHRsRkhqR3lCWjlNbTlJcHFlTDl3WFlTSWYy?=
 =?utf-8?B?aFVkQlIxeTI3UnhTbjJGSEpBT3N3RHZWOGpGanl0ZzVkQmpFN3FnNnBKVVRC?=
 =?utf-8?B?eHNvOVpsN2ZqQ29NZ1ZvcGxaRFVGKy9SNU1rNmwrWFM4Q0l6S1JKQkM1T3Vo?=
 =?utf-8?B?OENOdHJJYys0NGlwT1FFcUJwa2QzTUZJTlgyVmJsejlDVkpmb3ZHVzhVMC9Z?=
 =?utf-8?B?ZWZTTERreFowSEFSRUdCWCtpNGRtOHJlVWNydktTSlJtaUM4bTJUcDI1RXlP?=
 =?utf-8?B?ME1Cb1VCdURsYUt1THYyVUwxTXhHN2hVSHRHV1NCVDR0VlBFaXFBbHUxRWVm?=
 =?utf-8?B?WUU0YVVFaUxTQ1daRTh1a1UwUHdFSmNMbGUyVU5sUlJlQy9nNGsySmxJUlFs?=
 =?utf-8?B?czJrcGdIZjdvWDdQZlZ2cDJGRlRZTWQ0S25JSG10SldRZEdxNVQ0Yk5qOXYr?=
 =?utf-8?B?a3ZtaUFRREUvMlVxL3lPSGVnd1ExWU5YYVJZMnhnamlvMU0wRHIySy8waUYv?=
 =?utf-8?B?K2NhaVJXRUM4RnFUWk5FNlFodGJRNE82UERnVUllaXNCMU16bjIxYnVHM3Rr?=
 =?utf-8?B?VFIxekl2bTUrTmZzakxNbksxT0ZCM1ZNWEtabTBTNlNDemRQNzFDWFUxQlVy?=
 =?utf-8?B?NXRENDB5ZnlsWFVwSHpCU2lnNlg4SEY0OHVCVDY5ZGR0eXlYTExuRDQ4SUNB?=
 =?utf-8?B?eWdRM3pqamR1Um5FQ0dIREM0MyttZFBhMHNhMFdlQnNxTlVvaWJyZnBvc1d5?=
 =?utf-8?B?S2tZRG9NYk1KWFdydW1OMUR6VnZoNUx5YkZGeHBGcWdnUExRZTB3WmZoNXZ0?=
 =?utf-8?B?cGw3eDJZcmx4bGlvMFJCb3Z4dVRtTlNWNEh5ZjU1dmxUVHdWRTBjQSs0Q1Qr?=
 =?utf-8?B?a0RLa0N4bFpTZVk3Y0dzZHd3cENkQktTbW1TTUJqMDFhWUJTcVZKUmNOYXQr?=
 =?utf-8?B?S1Zjald4ejNhV0wvWnVEdGN3clA4bzRFV1lmaFd6Y1RGbDlVTXF0SnhGYUFT?=
 =?utf-8?B?Um9FQzdRaDZveEx6ZURCQkN4TWVNSVNmb3RHRXh0cDlhd2NjS3VCVWovbnNH?=
 =?utf-8?B?d2piTmI3bmlhVE5rcWtOUkZoTDlnc0lmeUxRV3o5VFNpQjQ0VkFYWUNqajlH?=
 =?utf-8?B?QVBoQzRzVStTTm9PNzhxdEt0a3RjS21sL3pRUEN5QU5lTUZ0am13Y1RxT2Rq?=
 =?utf-8?B?MnlLdzFTbVliRjJueGY2YzhDUnBteUZvMXpyMDZYNkNad1VlN0trTVpnSnhD?=
 =?utf-8?B?aFR5NVk5cEtLQ2xGRmV3d3VKM0tJakxZbmFDQytGVDFSTU4vYzVhU3c4TkZp?=
 =?utf-8?Q?QAEG68bJT4chcBhmqoYt4rp3TnDcj4Y3qFpegm7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a155f29-1ace-4b19-caa6-08d97d24c606
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:25:14.5927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7b35L00tvL/Cvp7iHl3bWtm4YIYFM0caxfjYU0GX2N7IxnnK2NZ53zoeK3KkiJypgxo202jxt5Vswr/MmUZaq2Vz1iuVynZek2sOXU4ciM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

21.09.2021 19:17, Eric Blake wrote:
> Now that commit 5a1cfd21 has clarified that a driver's block_status
> can report larger *pnum than in the original request, we can take
> advantage of that in the NBD driver.  Rather that limiting our request
> to the server based on the maximum @bytes our caller mentioned, we
> instead ask for as much status as possible (the minimum of our 4G
> limit or the rest of the export); the server will still only give us
> one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
> but now the block layer's caching of data areas can take advantage of
> cases where the server gives us a large answer to avoid the need for
> future NBD_CMD_BLOCK_STATUS calls.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   block/nbd.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index f6ff1c4fb472..7c4ec058b0aa 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -1479,10 +1479,15 @@ static int coroutine_fn nbd_client_co_block_status(
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>       Error *local_err = NULL;
> 
> +    /*
> +     * No need to limit our over-the-wire request to @bytes; rather,
> +     * ask the server for as much as it can send in one go, and the
> +     * block layer will then cap things.
> +     */
>       NBDRequest request = {
>           .type = NBD_CMD_BLOCK_STATUS,
>           .from = offset,
>           .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
> -                   MIN(bytes, s->info.size - offset)),
> +                   s->info.size - offset),
>           .flags = NBD_CMD_FLAG_REQ_ONE,
>       };
> 


I remember we already discussed that, but can't find.

The problem is that it's not for free:

In server code in blockstatus_to_extents, we loop though the disk, trying to merge extents of the same type.

With full allocated qcow2, we'll have to load all L2 tables and handle them, to merge all block status into one big "allocated" extent.

Maybe, we need some additional negotiation flag, to allow BLOCK_STATUS command with NBD_CMD_FLAG_REQ_ONE flag to return an extent larger than required when that information is available for free?

-- 
Best regards,
Vladimir

