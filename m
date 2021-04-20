Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF2536585F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:05:48 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYp8V-0000WI-R0
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYp65-0008N0-QW; Tue, 20 Apr 2021 08:03:17 -0400
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:11742 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYp62-0004p6-IP; Tue, 20 Apr 2021 08:03:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifJJ+NTmUw0xnM/+BR9Q/jybKtiQqIwK7ZMA8X6tMHwG8yHBtK/9EXdD84M+VzCtR9OYLm592pMCLGyRK9mj167JoiGuCNhGvukbyooqJ5YRuwDxOOrlBFCGGP/6bzjG9aXdDRwGI7V+rtWDG8XvNDBdhuMGwVgffQUs4pi/V2EeAM2Td5+LpgnxeJfW+D2bC2MStlbEne4FSwHlYoj5v8ndiOzI5jbedZCacf0nNp2m6S2wHoJ83yTClaeqpu/z+pR0rjLhsHVgg59CKsRE9zRw092K38At/EWEx1pTaDOm9Xq91w3cYuxKuVqe8i4DvtcPK9XFjoSJiOJOntdn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W2sYuKnmiGZnaK4hriTvj/0C91h3dRjQNkvqTwq5BA=;
 b=EM+/pME85WFjKobtyAc97decESeIfuiVEB1+uSpOQ7iZaw25D9OkV3mgqpDrNcyX5cO6V1fnxWmn+crswEFWr5yuvb5xEKMyyjdxwVmKTAoz64DvIEchyUK0JGI1Jrq7WdOGg8/zuaQ98kGsBtwsvzKoW4p/njwdA1OEVGOt+ArjYMFBCrRcg/quDiSNA/S9kZ+/qhWakRLruWezT654pOIrMOPZIBSBECuNxgAD7ZZDaY8kwONV2bu9GRP4zO/iKBRobeE0HF5udMnuYGHOg2S9CH07Vwuul5cLtGzIvfWHilIAmbMoUi+jmSCuENq1Hp0sTG5ktCmAitAmq7AYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W2sYuKnmiGZnaK4hriTvj/0C91h3dRjQNkvqTwq5BA=;
 b=DEcenkF5PgbFc228BtYg50cDNldUfBrWw1nUbbp0S8XbZ2oKYjg6lrbArBEF/WGseYzyBjHNb3u9V+B4wQuLQTwr/Alz/6bFQmDMUrjfCHESvbMTEwroyfXSCxRE7hXtt0RKGW2wPdNY4GPf/1IkxWNxjbCXwXYueb4r3+B58nE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 12:03:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 12:03:10 +0000
Subject: Re: [RFC PATCH 1/3] block-copy: improve documentation for
 BlockCopyTask type and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <20210420100416.30713-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9576b9d5-c40b-14d4-399f-4d14473433bb@virtuozzo.com>
Date: Tue, 20 Apr 2021 15:03:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210420100416.30713-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 12:03:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1157a7e8-3069-461b-f764-08d903f44431
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20345E4A0B21823D7A0CBD1BC1489@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KIyPlQkcCRUyUGGIYGfIyPaXX71bL1VrKxzHE/8bmkCbddj7J7wlZOgCKvYhAmIFTMcEkjWcWV96pVtD82ETO7AeTwUH0hiGM6m7L0v8n/1edf8xRTj29EXa/0g6DAGFJE8AQHo2HVxeeihVPRukATsJj3LYuOVGxirFoF2K3eQEbH4fNEVt63F8XU8WW0NAVpZTUdMgsd1TW0nEq95xWm0Llgr/I/vybNZKtlkI83U+Qrs+JcaJLssdsyoTRw5SQVhvjAqXY5H741RUNvqAcc2mlOUKGgHt4FIIRQobxJ3Zn/9k/j0rCT2DwYRI2aE8KJw7zMVk/jKjZPyFKzQAAorcdNLv2/cqYo9LaRtvBb+7i+PqOcoFBYuNSJdFS2LJPQ3gwWwHS5IqopRKbXcG2j28p3po7A81D4WH0nLHR9b9HcMqkSeeoDCS4qAl3LVa7IVtmU5ySC3K9XkBXOqEVR3E+qxpufR1tIIv+vEqQNBUPmOCpQOA19infnbaF0E3gJz52fVkJqHauQPqKtcIc9Bw/IXBiutaF6ATT92n5q9F6krBh27iq51wUwX7ymdKV7y0hcQz/xezVIfAOYO8QAASUnwg/Doe5bOxW1rqK//28nUTjgZVX6ObFP8ieKcdQT6XekkQ7hio2ZxUX8Gc79wDXvrJ2+gyCVY+l2tX3kVznClk2rWhMu/IMDTE/wr7M4Zv3upyLZefEvIEuN9LD8cStQNWGUYwZWCXZFEzpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(16576012)(478600001)(66946007)(186003)(16526019)(316002)(83380400001)(52116002)(2906002)(8936002)(36756003)(26005)(8676002)(54906003)(956004)(86362001)(38100700002)(2616005)(66476007)(38350700002)(66556008)(5660300002)(31696002)(4326008)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SC80OHp2L0k2elVnWUI3VWl4clhtVE5hNjdMKzBlQm84TnpCMTc1Y2JmUkVW?=
 =?utf-8?B?bUEvd0Zqb0EzbklUMnJGbGxVREdnQUJtUE9kNm5saGtOU0Z1Z0hrMXY5T3d4?=
 =?utf-8?B?NVQzT1RjU1E5Y2xvVXlxbXNCMkVTZXI0TFFuWkIxYkt5SHdLSVZQME03WnB3?=
 =?utf-8?B?eWVVNjNWa1JpbnZTZTlNTkZYSE1aQzRScnlBcGErNUx4RFpjelFXMnhDdU5E?=
 =?utf-8?B?Y0tpa2ExbkN4ZDVvVEV0cnRQUTVtVkhvamhWeHoyK3k5U1ZLZ2JtRlhNRDJl?=
 =?utf-8?B?TXJzZ3F1QXNFcjBDVi9tb2RTKzZYVlphaWZvUklibUtTaW9xQjJBZlZteDQx?=
 =?utf-8?B?Q0o1T1NOZXRqUlYvOHlUcHp5U25BNUNlVjQ5ODM3MlA4dTBoSGFEeXRaZzll?=
 =?utf-8?B?YmNBTFVIQVcxc3RXcERzYzVOY3VOVXZUbVlFRHNsWlVFMTFBQ3VLVzVTaktY?=
 =?utf-8?B?ckJuWkpjM2VEZmhsVVV3enJxRWNVYVFEeUVPTkdVWUlzRUNMOUQvZWc3bWNS?=
 =?utf-8?B?Ni9SYjduU21Gd2xUVVJnZG1kNTEwQ3VKc0RLM2hGNjVyR0tzRG5kMGpuQ3hn?=
 =?utf-8?B?NTY1Q1VmU01pRTJTZ3ZacXVHc1RDbFR6ZitnZTdKUDVwWGtNdlBnTXh3Z1ZN?=
 =?utf-8?B?amtwUEkxdUxRbSs3SHZ4WmxBT3pnL2VzakRoTWw1VDBvUExBV2E0TkdEY1Jh?=
 =?utf-8?B?cG4rSm1pR04zNDA1YUIweE5ic01hanR0Q0JoRzdHVTNiWmNtdWdWbGxTQWFz?=
 =?utf-8?B?SFVaY0ZvZ3lxVmJZc0I3QWtha0czOXNFZEZENkp2YXQrbWlEN1pVZEFFQnVr?=
 =?utf-8?B?QzZuNDVqS3l5Y3ovTlQ1L3ZjVW80QnBsaEVFaDhLRkFnaDlCYmpUMGZteVM3?=
 =?utf-8?B?QUZtc0pvMytkYU5XL3BEZDhNemszSGhaQ21MVktSMS9IVlpYTWlzN2tLa3RL?=
 =?utf-8?B?VFFRcmQ3eGVnaXJhLzlYd2JwR2REOElSOHhvWVZRNFp4bDlGMmsyOXM2RFlB?=
 =?utf-8?B?dzNRRTFQU21JTms2bUlNR2pVajlhalpMWTkwVCtZbEM4dDJZUFpTR2NGbzdE?=
 =?utf-8?B?UEdQVy9DVi9aVitBNUNxSmtxK1FmaEVva2FpTkhSRVd1dG5vbkFkMHMwWkNa?=
 =?utf-8?B?c2RyREZsYzhQQ0tvTGE2bVdMZWhMS1d2bmRsUnEzNXlmbUNKd0ZWSG9xZFZY?=
 =?utf-8?B?b2ZzTkRsUmEzQysxdGRheFRZL1FSSzRMQ3J6K0F5Q3c4ZXg5Q3hocGNqdld5?=
 =?utf-8?B?OFljMkRXNWlOalZOVTZ4Unozc0JGZjFrb0dGWlFETkthajM4VWplUzBxSllW?=
 =?utf-8?B?RndHcnZqWURqY2hhSlVrV3FGSHlENzhoSEpMTk45dkNmdXM3VjF6YWwwWTBP?=
 =?utf-8?B?TGdOK2VCTWlwRXRQRnN1SXUyZ2d1eWxDcExxeCthVDV3WGFTN255LzFqclVD?=
 =?utf-8?B?cjlTMUpmeUtzeXFpdGp2RnBlZzBtSlIwdDAxU3hQR2VXSm5uOUcrWWVrTERn?=
 =?utf-8?B?RyttR2pjd1M1N0loUXBUdDI2dFlzNFFJZ2RYOExWTmcrMGRuWElhRWxJNTBz?=
 =?utf-8?B?TXBsM3NLNW1RMmQrL1ZCUVpXc3FLdGszdG5XdDk5WC82ZmJnaWVQeng5eTcv?=
 =?utf-8?B?cDZpcisvTE94Y3JzMzFXRmlrSXlwUmpPeWdVcEp6VWdUdDBYNDhrd1IraDF6?=
 =?utf-8?B?Wm80dWRlWGV2QkgzSk52aExRbGdRVE1vUHd6c0wvS1VkVWtOeXJVT1B0MUJh?=
 =?utf-8?Q?ym0GJGwB1TRp8gsmfR4t7ZjA3IshpkO9HGsoVk9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1157a7e8-3069-461b-f764-08d903f44431
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 12:03:10.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoBObsBaDSUiMdI4K90AA26hhP2QvI6V8u+8KTxatgHsf4ANB8wRLxamEE1+bEzbh3pLy0PPNIC+QtIV7FVp3p01/LsgDBEVEyGMx6AkE5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.0.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
> As done in BlockCopyCallState, categorize BlockCopyTask
> in IN, State and OUT fields. This is just to understand
> which field has to be protected with a lock.
> 
> Also add coroutine_fn attribute to block_copy_task_create,
> because it is only usedn block_copy_dirty_clusters, a coroutine
> function itself.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 39ae481c8b..03df50a354 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -48,25 +48,32 @@ typedef struct BlockCopyCallState {
>       QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* State */
> -    int ret;
>       bool finished;
>       QemuCoSleepState *sleep_state;
>       bool cancelled;
>   
>       /* OUT parameters */
> +    int ret;

Hmm. Somehow, ret may be considered is part of state too.. But I don't really care. Here it looks not bad. Will see how and what you are going protect by new lock.

Note, that ret is concurently set in block_copy_task_entry..

>       bool error_is_read;
>   } BlockCopyCallState;
>   
>   typedef struct BlockCopyTask {
> +    /* IN parameters. Initialized in block_copy_task_create()
> +     * and never changed.
> +     */

It's wrong about task field, as it has "ret" inside.

>       AioTask task;
> -
>       BlockCopyState *s;
>       BlockCopyCallState *call_state;
> +
> +    /* State */
>       int64_t offset;

I think, offset is never changed after block_copy_task_create()..

>       int64_t bytes;
>       bool zeroes;
> -    QLIST_ENTRY(BlockCopyTask) list;
>       CoQueue wait_queue; /* coroutines blocked on this task */
> +
> +    /* To reference all call states from BlockCopyTask */

Amm.. Actually,

To reference all tasks from BlockCopyState

> +    QLIST_ENTRY(BlockCopyTask) list;
> +
>   } BlockCopyTask;
>   
>   static int64_t task_end(BlockCopyTask *task)
> @@ -153,7 +160,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
>    */
> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> +static BlockCopyTask *coroutine_fn block_copy_task_create(BlockCopyState *s,
>                                                BlockCopyCallState *call_state,
>                                                int64_t offset, int64_t bytes)
>   {
> 

We mark by "coroutine_fn" functions that can be called _only_ from coroutine context. block_copy_task_create() may be called from any context, both coroutine and non-coroutine. So, it shouldn't have this mark.


-- 
Best regards,
Vladimir

