Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E4373E20
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:09:30 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJ9V-0006Ct-8j
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leJ66-0004Tp-LL; Wed, 05 May 2021 11:05:58 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:53927 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leJ63-0003zC-8H; Wed, 05 May 2021 11:05:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqbGX85B9uoNsSscZS34j8zbdMbmq0fLV2OUA3gRYDdHUp9XsUenrPY2zmk1l645dAVGXzckSY1kCO8GMOuwYthzjquO7jiZQSqp1NNemQZzHbmTFVFX8+uUacvJwtMKktCCIr3pixgj8yQ3FVQk6NmkOZ/D448jUrEE0KGoGz0B0YoAw7rf0VbeR+M2avl8N9/L3upaEKCCzR0gq0YB0hA9DwPdTJll9DmcYUtRd0h3dktVqqIhrLskNN3LXrBUHvDT5X62gzoHuuYZah5VOCo8uBzPxPcGoZhmBgyB+DzBVHATeTwgs9rMtYWf24MBMJFERQom1QDTDP3QZoIJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnGyXyGOwu9gawcDW+WegFirsnGfCbSGGeH9yJYQgkg=;
 b=KosFY2E4s7OxyH8V2++O8B22f943PX1LO5WTKx4XVY0IesdgkRI4FkPm7h2adl676ZlmcHg5gU3dNHZ/WOzC/m8o7PV36L/AK9LmIXoVF/CKPNfbZUwNeH2LnL8uPLaJYNX1DzzJFmfcyTsJ773FQDRK4ybA1Ta9Ht+UqU/4XR+19MT6JmCb2iOKyfor9pH/1TmgK18n88Iau6kPdJ6SEBCmazUc8kdLrXpx8LejXcUE+9bWTiRqYeNpFOJcjqZdegkuEnZXX2kr8EZeLuq5ZXOyDGDm/ktrO3I2+m78rZ0p91xw7k4nPZi88Bqsz9c45cc7TVp/bJ5KAThrkHodBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnGyXyGOwu9gawcDW+WegFirsnGfCbSGGeH9yJYQgkg=;
 b=fGmpQ1cqStzbC9WOAx4RXWJR0DMBxu+kCHJ3Be8aXm49xfbmicu/AL6evVR31r+45RuKXM5VlYW19yWv83OszD2J1529/kX4HAj+0uDBX9ppSHgWMx5VjCpKPm2OBUU7Vd0MC9Afxo6kQzYnFq73mVaDERuA9fs847j/MBR4usk=
Authentication-Results: dreamhost.com; dkim=none (message not signed)
 header.d=none;dreamhost.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4721.eurprd08.prod.outlook.com (2603:10a6:20b:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Wed, 5 May
 2021 15:05:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 15:05:50 +0000
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 morita.kazutaka@lab.ntt.co.jp, gregory.farnum@dreamhost.com
References: <20210503095418.31521-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <29db0d1f-2d60-7df6-e6d0-97b89cf636ef@virtuozzo.com>
Date: Wed, 5 May 2021 18:05:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503095418.31521-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.29 via Frontend Transport; Wed, 5 May 2021 15:05:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7396355-8fd3-4809-0317-08d90fd7450f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4721:
X-Microsoft-Antispam-PRVS: <AM6PR08MB472132D182432F246A4E0D00C1599@AM6PR08MB4721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Is1EebqPjuZS4n62Hj9uW79nZpZOFjdf0lwHJClskRawPzHxZnyeh7U8FZgSOtf8goZtE6el4YnuwlOp3yD4cwfnAaokfTy1Y6Ejmku+k0UwIVWlYSgbaXjUY+IxodAtyQpAO1GVZ0MJxJMD3NsdvH6uK1IIirmjtfT8vjJl711iKgOchQ6RJkYe7dS0gaJD+hho7yTDFhXJI//x07eP2KWj9Jp13o9OSH9CvrQdxEDvIUuh7VwU8nwGeycCN1LP2HJJK5RyNqGBFr+4a7PzU55FE/+bSg+4DaypEB2WHmw4xOLl+YDP7DbQx7VnlWJrLaZO/3zK2KwSn2unU4AwQtmFpy878D6fGWHTfb7rdNFkq0HoOSkJK6T4vFE1xdE69/rseV3xYE0f7azcvzDkbhmmCM1/VkaVi4Rld8MnHfBlr+Ry8Aho4q2q1/FMVaS8QcmzO0x45omxQHMjKzoDF+xGBHbfiMyiKju06D1rkWuXi72Hm8njIo8Omm4LCz8BP+kEez5j68tJfaV0d1uTpL93PCbVEGVG2eqw0Hwpqp0UrP4ta0hLx2nb7d0GtJx+lhglNRgJLQutMaKOMs/VYFXUpEulyix0CKiL6YSF2ouv69x8ZWdU2Hnmfqe41sILjpTNunnHIRx0j0KSVj+aMcL+4dUfE8EEynIHACkfdANjvLCMC4N6yXeRdV9xtBEe6KmvyWPq/HpOA9rdY+YDrtRVwc9xC8RJC0GdRvSTgzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39850400004)(366004)(346002)(2906002)(83380400001)(52116002)(186003)(16576012)(8936002)(478600001)(31696002)(86362001)(36756003)(956004)(316002)(2616005)(8676002)(5660300002)(38350700002)(6486002)(66946007)(26005)(66476007)(66556008)(38100700002)(31686004)(4326008)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3JLWGthUTV6S00yOElVU0Noa09JRGhSNkovQ2ExcGpwcUNzdGh0ZFplc25w?=
 =?utf-8?B?bFFqS1MxK3dHL29EMkhmWnBtc3lSUHNvSUhMazRmTnNqQWF2VE03SEtNRnZl?=
 =?utf-8?B?MlRnOU5wTFdHZ3VqQTdLUHlhdXMvZDAyaFc5akZINW9HNzhnRFZGSUMwMzdH?=
 =?utf-8?B?a1d6Y09aUi9oWXQ2UkMybjVzVzUzekxPZDJBZkMwbWxodWRpaExTeGhUVXFn?=
 =?utf-8?B?YitPTWhGUUppYThLdFI0clN3YnpSUjRoREl1NkNPQkoxeVNhQk90b2haK0l5?=
 =?utf-8?B?Uzk2Z3VyVTJjeWpSNzJGdjNmR2hGbmZvbnVYTkxzWkQvVVlHblhRUWtPNndF?=
 =?utf-8?B?SUxGaUNINGhUZ01BdzNYMldSSDJqa2JoWndFWDJjTEkwam9OQVUzaDlORzBG?=
 =?utf-8?B?cElYMVNPQ0VSVjBvc2txdXVWRDhqZ1huY05TdHVoWFV5MzVQSkZXdGV0NWo4?=
 =?utf-8?B?c2IwdzF6UDVFTjJoVk5QQ0VnVVo5VklJNS90RjhFaHp1bUVHUk1TS1VrMzZa?=
 =?utf-8?B?bXFSY1dram1LOG40RDhGVnloWmsreW9ydWZuODdiMmN1cXEwWEZBQk81Rmt1?=
 =?utf-8?B?VzhrQitnSC91bEg3Y2I1eC9rL1NvWng3ZDZMcDBHYUpDZFZvYWdFQisyZVlT?=
 =?utf-8?B?cFZYSEdUdWFHRHhmdTZWZzNYd3RUN1BaSWdoUDRJaVlPYTBIdXNidXh1TkRm?=
 =?utf-8?B?UXRINnYrbjZ3L08zQm9aMzBQVXdybVZ6dmtVWjR1dnlIam9TVSthRy9LdllM?=
 =?utf-8?B?d1FadnMwTElNVlI5Z21ZVkluQ3BLVVdad1ZIbkV2WnoyZUdlSjA4ampxL0pR?=
 =?utf-8?B?b2o3blBMdzhQdDJEMWlGaDcyd1J0WFpSQjdPeWJ4WEo0VmdPUTZiRzRadm14?=
 =?utf-8?B?KzMzRGFZT09pdXRFRVVMSzltdnQ3VlFBOVp3NlVUWHh5anVuRjBITU9jMCth?=
 =?utf-8?B?YUwvNWhJV0g2WFNhMVAwZHlKZU5icUkwa3llckUvdFh0V2FUbGxJbWxqNFh3?=
 =?utf-8?B?Y2ZRVWNmTGkvdU9rVmdVSDRPc3RZN0VUc1BiWEFuUlZidlk2cDZpUGsrVjlY?=
 =?utf-8?B?ck1TMzFONisvZklXRnpubkFaWThQaDBEY1d6amo5MHpHQjg3VmJJbVMrdzlz?=
 =?utf-8?B?dGRTV3VvWkwrNjhKemdraTN3MUFSelp4ZkhYZ1VrN2hFd1FRY21GRWNIWm9s?=
 =?utf-8?B?YnhhNUx1Q3orOGhUbk5QUktDK1hHVlkrWGdxTmErRDNBMkdtVmEranBmcUhM?=
 =?utf-8?B?OWRLdDdITFFjTUFqenlySXBLRDNLTlowcm9Ldk1ZWEZpcVkzdmZKN0c0SHFR?=
 =?utf-8?B?MDBkcFIwNlM0NHZMMk9XdkR6Q0h4WHMvMWJwcEZ2dFJvaU1JWEdkM3V4b2JV?=
 =?utf-8?B?eWV1cWxHYXliNTJ3cEs3Tk9YN24xcS9RNnB3Qk5scksyNFR2OGorVHhWRFpP?=
 =?utf-8?B?TFg5Y0tmbnhYeHVOV1AxS2dGbGEweHJRdDVsYTRsMzRHWG0rMTR3QmwzWE1N?=
 =?utf-8?B?cFNqKzRSS3F3eXF4UUZRd0FzL2Raa09lYUkzcnlwTkRnbkJ2ZERia3p1WDJV?=
 =?utf-8?B?amxBYXdSYWdLdDJZNnN1SzAzRExlWEtMcjJGNVdjTEJkYzVKVUYxWjRDWjU1?=
 =?utf-8?B?eXJ4OTMxbkhDTGFHR2dkWERvKys0NWFDT1dKNlA4WXJpcnJncHBablc2dnlL?=
 =?utf-8?B?a2Z4SktkQ1NudHU2WmZjQ1BTdEhscllyMG9mQ1ZTQzNUNHQrekZ6VGpvaFJp?=
 =?utf-8?Q?HXqvpqobtHU/9++mwlScKROAP87gNxIuGGmeVu/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7396355-8fd3-4809-0317-08d90fd7450f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 15:05:50.2773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1Ne0rq1J+vGc+2sR6A/qwox/vJmZQnESq9xmGQ1gf+KNRpx21PRp9BMvQArG9RIU8x7PTt/N0mp/8IxhqqwFpd1e++n64mHRNiCgL92aoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4721
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

03.05.2021 12:54, Max Reitz wrote:
> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
> either bs->file or bs->backing.  

> We close that child,

Do we?

> close the node
> (with .bdrv_close()), apply the snapshot on the child node, and then
> re-open the node (with .bdrv_open()).
> 
> In order for .bdrv_open() to attach the same child node that we had
> before, we pass "file={child-node}" or "backing={child-node}" to it.
> Therefore, when .bdrv_open() has returned success, we can assume that
> bs->file or bs->backing (respectively) points to our original child
> again.  This is verified by an assertion.
> 
> All of this is not immediately clear from a quick glance at the code,
> so add a comment to the assertion what it is for, and why it is valid.
> It certainly confused Coverity.
> 
> Reported-by: Coverity (CID 1452774)
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/snapshot.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/block/snapshot.c b/block/snapshot.c
> index e8ae9a28c1..cce5e35b35 100644
> --- a/block/snapshot.c
> +++ b/block/snapshot.c
> @@ -275,13 +275,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>           qobject_unref(file_options);
>           g_free(subqdict_prefix);
>   
> +        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
>           qdict_put_str(options, (*fallback_ptr)->name,
>                         bdrv_get_node_name(fallback_bs));
>   
> +        /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
>           if (drv->bdrv_close) {
>               drv->bdrv_close(bs);
>           }
>   
> +        /* .bdrv_open() will re-attach it */
>           bdrv_unref_child(bs, *fallback_ptr);
>           *fallback_ptr = NULL;
>   
> @@ -296,7 +299,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>               return ret < 0 ? ret : open_ret;
>           }
>   
> -        assert(fallback_bs == (*fallback_ptr)->bs);
> +        /*
> +         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
> +         * was closed above and set to NULL, but the .bdrv_open() call
> +         * has opened it again, because we set the respective option
> +         * (with the qdict_put_str() call above).
> +         * Assert that .bdrv_open() has attached some child on
> +         * *fallback_ptr, and that it has attached the one we wanted
> +         * it to (i.e., fallback_bs).
> +         */
> +        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
>           bdrv_unref(fallback_bs);
>           return ret;
>       }
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

===

I still think that this fallback has more problems.. Nothing guarantee that all format drivers (even restricted to those who have only one child) support such logic.

For example, .bdrv_open() may rely on state structure were zeroed and not initialize some fields. And .bdrv_close() may just g_free() some things, not setting them to zero.. So we probably should call bdrv_open()/bdrv_close() generic functions. But we can't: at least bdrv_close() requires that node has no parents.

Not saying about that we lose everything on failure (when actually, it's better to restore original state on failure).

This feature should instead be done with help of bdrv_reopen_multiple(), and even with it it's not obvious how to do it properly.

The feature were done long ago in 2010 with commit 7cdb1f6d305e1000b5f882257cbee71b8bb08ef5 by Morita Kazutaka.

Note also, that the only protocol driver that support snapshots is rbd, and snapshot support was added to it in 2012 with commit bd6032470631d8d5de6db84ecb55398b70d9d2f3 by Gregory Farnum.

Other two drivers with support are sheepdog (which is deprecated) and qcow2 (I doubt that it should be used as protocol driver for some other format).


Do we really need this fallback? Is it used somewhere? May be, we can just deprecate it, and look will someone complain?


-- 
Best regards,
Vladimir

