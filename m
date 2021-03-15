Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D933C275
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:50:49 +0100 (CET)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqQZ-0006px-Ez
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLqHm-0001Bl-Iy; Mon, 15 Mar 2021 12:41:43 -0400
Received: from mail-eopbgr10130.outbound.protection.outlook.com
 ([40.107.1.130]:57733 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLqHh-0002Fo-Vo; Mon, 15 Mar 2021 12:41:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxrFg5bLA4sTsy+VMC5CbSSPvyP5kyeBc6Tr0tOK+/3/Z7QbbmCYfSAUnURFPV+o+Ani/I/J1FV1HfJc1dBP+gIkVUtyjGxZrKJbXO6MisoHx8BhSQtylc+O3gnZDql5fz3Q07dDvUFIEoDz9F4PTD27MvX82jjShHXtCcL92nweLZJSUCob7nbwD5NdV62oOZ3pm4g+q1fCYcK9BATqRwxwWX9mMrrmQkWlnlROhTBiApPyta8mzU+68yZM7aWZtoOm4bXPrO4ua6WSR/W8+hfIxsuIymjDeiTckw/5hFaqiFma+8OYUbp3i7MPN6lRcvpdry+3WfM0CJdooe5hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZTSoRx9yBUUh1bdb89e0MoCu6TyCnpcZg/GAXImujc=;
 b=HWPCN1NRy6Leg+ccrdE+T3SZuJE8uuZa+lO9JC4lnf7ALJH1TqYO5x1U18wppQBtr8dCQUzgLlS/DVzO7iiFAt1nkamDqe0hUb8yY89vUnMGS2Hhl7n3KOVPap7O7eyymOo/tuBmYZATyrUYcA3CEMZg9exoQ4kMhWt8Urc3CZL/td5HDKaQmUddGVwBkNtOOeWgK38SgulfchLbiGyKfi+j6M9lfxdpwR/AJur/Y2tmGEUb0k88Zs+vEF00NfRJy+Iikhrd+t+IpgRvbQPZXlVJ1nKMvRqdLFMZU7KYdmiEd114vi0YnPJpn9QvgGZi9uEYh6L1YCrfisu2hwoFaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZTSoRx9yBUUh1bdb89e0MoCu6TyCnpcZg/GAXImujc=;
 b=VL1Xz2wjIifun/e+/KbUrvTPUvqF/95rv4ygkBtPZ+Qd2XMb0LNL8k8ZaplHecjI2GMvhbFdMuiT4htXHAKNS7E35FkUneplXHg7au79PxNDwFRPWnj6qXXPMRsWs73n/cwD0iIbDZTmuIQPN3kIGhjyFQ+Qz/EpYVQFUNfKeMs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2612.eurprd08.prod.outlook.com (2603:10a6:203:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 16:41:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 16:41:33 +0000
Subject: Re: [PATCH 3/7] block/nbd: assert attach/detach runs in the proper
 context
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-4-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6bc8bb0e-c22b-ccc1-4f19-5a7076f348ef@virtuozzo.com>
Date: Mon, 15 Mar 2021 19:41:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-4-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR0902CA0023.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR0902CA0023.eurprd09.prod.outlook.com (2603:10a6:200:9b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 16:41:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acfbf2f0-085d-479c-b89a-08d8e7d1316c
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2612:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2612B3BBA2F379EBF5394041C16C9@AM5PR0802MB2612.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMqFMZ6ccPFvHiPIFL5b/i/DVZZuNTIsM+dCkj8m+/Un6NndbxRnE0dm++SKr8iNVa5PNnNkXKg2A6kyPlJr27DXLW6aXIr5r2acczpf1bbLa33T21qrUTcbxdgcPbwOUJux+7KbHv3vj4rtDrJw8fS996i7EyHn5QEoObqJrxlyPd2n//+QnkgmoYNBPlPuzTMcWnAw4RisKszceT8RnpKpXA71/KlR6C6oS84So22KgcOTZz5qIGxj0n6OTVUkJOGl0VVCEgXfCW382ndSBGoY+TmxLDYVCQW8Ivgxe47laGogbWaFMH3w+5UZ7+wwKJNtfEptw7w1T3Snc+SHbX5oo8OKlfFSFthORvKFSqz9k7YVtx5+bFBb1KsGDtv4/QqaNzl0VB/k0vQVH0TqKg6r7jDcC5ECeHOc21vH6JbU7mYmiXyLt4eMLEUS3KOegfILWczJe+pSYrIV/sVfHU+FaOeYAzyD8cj354rMsyGVlswWtJI/I3dYv4Zw5k3KOzxilXyWDMMzxrz4VRIC1PNmhg/vCwNfe7eb5oSyUW+Cz8QZJyY8h3JnrXGlDlhcHhMRI/CM+zVlCr7GEvAtbbIuxAPnXaZ4tlPq567bInIuZvOxn+ZJqfcKfe531wZ2zXcgEqVA2mGXrbLGuYpw27HLlPmtj9goa+pKFGAtgi52QSlaeo1xJQb8/M09bR5cutzjiHmr0EYMS5bAslEQTR2olmKCZLexkN4wJSI/ILU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39830400003)(136003)(366004)(376002)(8676002)(8936002)(66476007)(66946007)(31686004)(66556008)(316002)(2906002)(16576012)(52116002)(36756003)(31696002)(54906003)(83380400001)(478600001)(86362001)(5660300002)(4326008)(186003)(16526019)(26005)(6486002)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVhSdng4dFpYZTc2MUVqMU1SZStaU2NpYlpFNnp0Y2hzUTVXVGNIbDZGd2J0?=
 =?utf-8?B?YUNCU1hVZWtvRXYvN1prN3d0bm5JbktGQ2oxaVVHMW8xeUlkdWk0YmVQb05a?=
 =?utf-8?B?S2FScXJSSFJmUWNySk9rNjRVbWs1R2QyUmdENmdJZzlxVnpHVzJUR2tmSzlm?=
 =?utf-8?B?aCt3eGFJSTA4UzZYTi9ycVpXdGRwOXR6VTF6NEVYTEI3WWpFYUhrL0FEdVlO?=
 =?utf-8?B?VGxSTWNxZXNoS2lyakV4Zlltb2lJdWxtV1lzY0lSc1VZenB1RFdwa2hwaDlQ?=
 =?utf-8?B?S1JKcVQwU2lBUXRRaFd1L0xrTGVOTG1kcDJTeElMMkswYUh5ZVN1UWxqYTRi?=
 =?utf-8?B?UkdIaUZ4UjY1WWpRNkd5WE9GaVZtUnhXeDZPVWZsQ3FxZHJuclJCYTkwQkUw?=
 =?utf-8?B?YTI1WEpOSHVNdmlYZ0pldDhaVzRCNlAvRVNqdEE1YXpDbTJNYjk4S3hSaEo2?=
 =?utf-8?B?VVFWRjZQM1VtU1JBR0F4cEFjQmhRR2thV1VEZnRPZmN5WXJpSXpsa2lvNHBT?=
 =?utf-8?B?Sm5wa09ZODhWMGxsVWo4dGlKRE41Y3E3ajdSN3Jvc1lHRFNCYUM5bkZnaCtP?=
 =?utf-8?B?ZXExRVZrSzdZNStjb3IxY1FwbHkwZGl1SFNjMkozdDVzb01uK04zNVdZVTZV?=
 =?utf-8?B?a3RvVzQ3VFVPUTJjbFF6OTljR2Qxa0pGZEV2VTBpWURuMTVVcGx4UjVOQmVw?=
 =?utf-8?B?UDFoMXBzbXpNbUYwWmNhTTY3Q3RONVpnS0VZOFB2ekRLRGhtNlQ2c2o1NFdY?=
 =?utf-8?B?azhvWndmZ05PaTEwQjhPaXE1MXBWaStickxVU3E0RjRjb0xrbWp3ODVHZk13?=
 =?utf-8?B?a3lKT05xTzFIbUxNa0dsZzFIR1pWMDZFK04wMk1jNk1xUi8wRmFrRzhUWjR4?=
 =?utf-8?B?L0pYL3VmbUJRMXdudXFHcWtISjNQSVZUTXJpeE9NQi85RzlPb2xXUlR6clJV?=
 =?utf-8?B?WkNNb1NHRFRDZWU3ODRXM0doWjF6QVNGWjJrN3MvQ0NYMnYyZGNiWTBSdDhK?=
 =?utf-8?B?ZlJPR0VFRlBTK1U5ZzRCY20wV3NEcGUzRGJBbWw5SU1xaWJkWnJlcDNOSE9p?=
 =?utf-8?B?eFdYdkFHbFBJWjVwK3hROVFVeUZlTzBybGlDL3pIdVl3MEd1M0hxWGdndGRO?=
 =?utf-8?B?TWIyYUYvOHluSm9jbXpCNjhLN09INDZibmpreGRwcDhwaFRyRUhWNHB1MGR1?=
 =?utf-8?B?M01QYURVTVJIVmlXTXdFWEc0Ym5hckRVWXMrMUtZendFeHpmU0FpRHNrem8x?=
 =?utf-8?B?RS93TUNHak1iRWhuY09BRHFsRkMyZHp1VXdkeDFoS1NzSkY0NDcwY3g3UUdB?=
 =?utf-8?B?UVZxeCt4dDZpWnI3TXhRYXlMSVViVzNUNHh0MXhzOUg0Z096aXZ4TERIVHRZ?=
 =?utf-8?B?ZmJkRWlreW45c241ZDN0NGJONk1zdWU3VklHK2pOYW5uYnBOTXVPTU5ZUGM5?=
 =?utf-8?B?U01SZjVqanN1RFQra2h3OFVtTXpqVzlSbE1GejZzc1JUalI4MnNDd0NwTFNO?=
 =?utf-8?B?S0ZodzN5dEkwaXRMTDk4WTluUEJ4UitPZVBteitpLzYzTHNoSGdLNHJyaUd3?=
 =?utf-8?B?WnR2WFltNno5akhQdXlyekVKYU5ES0NFaWhmS3A3RXZkTFRJcUZRd2VNSTdh?=
 =?utf-8?B?dUN4ODNmN3NxUVpiUE9aQkQxbktNMTl2VHdKaGUzeTlud0lUcm5aSmtrOWRl?=
 =?utf-8?B?YUdyVWozQ1RsVGpGT3liZTJBZUM0d3VwNjcxOE4vVGl5MEloWEdYQW5aNnFM?=
 =?utf-8?Q?mm5oTJtR6mTImi8WYbDZ0zfKDZEsdP0jeyEBqOh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfbf2f0-085d-479c-b89a-08d8e7d1316c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 16:41:33.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXIBK8CF125XNE5EU972+v+DvQaN/jmSLI8wjFdI/GTeNQ0SwWBAG9O5+AB7PMriVG/6l4U2bIGc/vGEy7xDwTmqvqsN0KZ/LhkCbhlh7WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2612
Received-SPF: pass client-ip=40.107.1.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

15.03.2021 09:06, Roman Kagan wrote:
> Document (via a comment and an assert) that
> nbd_client_detach_aio_context and nbd_client_attach_aio_context_bh run
> in the desired aio_context
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>   block/nbd.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 1d8edb5b21..658b827d24 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -241,6 +241,12 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
>   {
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
> +    /*
> +     * This runs in the (old, about to be detached) aio context of the @bs so
> +     * accessing the stuff on @s is concurrency-free.
> +     */
> +    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));

Hmm. I don't think so. The handler is called from bdrv_set_aio_context_ignore(), which have the assertion g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());. There is also a comment above bdrv_set_aio_context_ignore() "The caller must own the AioContext lock for the old AioContext of bs".

So, we are not in the home context of bs here. We are in the main aio context and we hold AioContext lock of old bs context.

> +
>       /* Timer is deleted in nbd_client_co_drain_begin() */
>       assert(!s->reconnect_delay_timer);
>       /*
> @@ -258,6 +264,12 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
>       BlockDriverState *bs = opaque;
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
> +    /*
> +     * This runs in the (new, just attached) aio context of the @bs so
> +     * accessing the stuff on @s is concurrency-free.
> +     */
> +    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));

This is correct just because we are in a BH, scheduled for this context (I hope we can't reattach some third context prior to entering the BH in the second:). So, I don't think this assertion really adds something.

> +
>       if (s->connection_co) {
>           /*
>            * The node is still drained, so we know the coroutine has yielded in
> 

I'm not sure that the asserted fact gives us "concurrency-free". For this we also need to ensure that all other things in the driver are always called in same aio context.. Still, it's a general assumption we have when writing block drivers "everything in one aio context, so don't care".. Sometime it leads to bugs, as some things are still called even from non-coroutine context. Also, Paolo said (https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg03814.html) that many iothreads will send requests to bs, and the code in driver should be thread safe. I don't have good understanding of all these things, and what I have is:

   For now (at least we don't have problems in Rhel based downstream) it maybe OK to think that in block-driver everything is protected by AioContext lock and all concurrency we have inside block driver is switching between coroutines but never real parallelism. But in general it's not so, and with multiqueue it's not so.. So, I'd not put such a comment :)

-- 
Best regards,
Vladimir

