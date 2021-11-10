Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646644C121
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:20:44 +0100 (CET)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmap-0007RD-6g
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkmYA-0004nv-E5; Wed, 10 Nov 2021 07:17:58 -0500
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100]:65183 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkmY5-0006Z8-BG; Wed, 10 Nov 2021 07:17:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY2isxCDQP+Lh79dGSbu2jWx7WEkKZfk16q24jDxU/5JdbTWOJJ/ip3p1alKQPczhZPmWDZhFUJrRqLJPobW2RSQ8neKSOmy4CyLos1t5XuiNUF5UYT4e/0JfcwfG+qgXk6V6aK04MuGLCybncuPnFmtkyJqEzjjcfqQDTqFaQuZwGPk+Uvkc0XiiFP14bQIBxExpmuUkc26OraCq90J6xfyUCbRZZLxjmcTbCjozQY17ZFziid+dlRck/3fl59P4PagDUbQz7oAXMjx7uFtVRUNFJc7T7QM1uinm2DetrMGjbsNIvViPDbmHnADmWzpmuPW4JvJmhYSdXK/qSslHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kkW7JrJP+DsaSedCuUEXLuPSBrsSvCWcQ65Jc8jWQs=;
 b=KG305dkqV5SvHmtWXfeYm7XMfGhwKeD+8gaSlsrFajckHy6eNXitLymNzyvkTufEvrOh58q67oC1jiFiq5NoPTySzKCL/zhwz4JuHHyTcBmJfUNyQbXWJ1fRirU2ClzJazdC7sfWjDl8Y7q3d8Mhgnp17SDH69hn+duiHNieyapTs9R2C78MebzB7z0AwfAAFtCeuApTg1EOv4+NXTMWdd0RM7Ig1CiFAgmG+IZxSWgCMhw0Laikt8khthohc92qRoeQMj4DauT9j9e5BXqk91uYC2yhIQNM/fc8w3w7M7aeBYzFKKAU83m9OolAJXd98Q3uNl2k8vT4KNkz2jW6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kkW7JrJP+DsaSedCuUEXLuPSBrsSvCWcQ65Jc8jWQs=;
 b=O5Y/v1ZPpS66PqKjBGtn8Fpkzk7pr3iqpCpFv5WH4Bj+vOAXqdbOOJ4W7F0elqntoBEdahWYNG6w8Ru36KqRRHIRP9F6uarr4m/XEAwAr4ghKi95O6I4p7NjjK2YdlGV5Jl6BfoObtnCveOw4fFFqbtNkdRjJTC/tFaZxQSUyvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 10 Nov
 2021 12:17:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:17:50 +0000
Message-ID: <767e3d50-0c3d-23dd-a69b-360bb557b169@virtuozzo.com>
Date: Wed, 10 Nov 2021 15:17:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/7] stream: Traverse graph after modification
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104103849.46855-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Wed, 10 Nov 2021 12:17:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd244804-8a71-4fd4-62e7-08d9a4441ced
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-Microsoft-Antispam-PRVS: <AS8PR08MB687032261157419D0C7446FFC1939@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKco83Y6QDOBIr0RWCFoZFUgUYJHyk5SS6rq/eq5VinFQWWQ8LcNJhMKErQrZiKKkF3RoYfxvQqM94ub0SSgrg+IJob20itLfU0u1UocloWwLyi9tNTKoV5I4Rq7jzgQNoW9lcYyQ8An6IBovi4uZaniFX3EzGI1jRrVtDcSGl/SSAr1kJhHffVu71+cE/g8GY1P9YKB1oaQmuCcuM/rCbVORMOH0zaWPMrnMpQ64SO1xpOYl+FFXD+Qx3XioJn35dAZqD0Vh45hgSOKkvw4bw6atDwNmMjf9tV3/5ssW1JA9csPfw9TrK1DplzwdR13rAK/+U9fvRDaKXWVemtIy8x7EywJOgfIel/cB8U+rR4uVF+WvBqohQJljsh/jim7kyptGfHw1bWNsuBjtFiLe9efYnZ3lJksWoaiZXyfTWTWXjYi4e2Gy/2xBoF6nuZo73/PwO49NtVAz/NDUMIB0GEwMNRNmr1jJbu/t1e3seDZn0FuQmsQJkTwRWmobTAEM9UPWQCnZH1tcMHsLBd/aLr5XuIRe3ZljvZh5QXmdvDwaCjUwcj99TV8wFMpjVKcpPaDmipuwfiWBNO50Yaw8heEGFEHMyKSEF+FWVeaEb+S5w1wkOIw7SAfjuyLNuUbfzeBdms2wiPwNDTsWrkJKl8757dLltBVDHfY1qQ5GPRHRom0GHZFWlIZhBESurAeZHDvu7YYGqWr+FGCJwI4ac7R3yjq97w/aGpGsKHG12ou3ErkentmFpbZABXskfV/SJTiDaTgYU8D5WPTyNtcnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(8936002)(8676002)(4326008)(66476007)(66556008)(26005)(86362001)(5660300002)(31686004)(83380400001)(956004)(38350700002)(31696002)(38100700002)(316002)(52116002)(16576012)(6486002)(36756003)(186003)(2906002)(508600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdXd3ZiSEUrYzFzVTBVSFAzeU9ybXFHc2FpVjJTZW45dGFIT2kvclFtanI5?=
 =?utf-8?B?ZlFocVN6WER1SkRha1hCZzR0SUVWSU5yU0tka1JTUE5VTW9ZaEs1Rm1YMEFh?=
 =?utf-8?B?azJMKzJlU0xDVmlZT3RLa21sN3ZORG4zbGJjQUt0eFprcnJpcVVDbG1YMWpv?=
 =?utf-8?B?YUg1clpPTWJZU1g0Z24yYzhTaTFuY2NLZGpXdC9hVG42MHN2TGJnWVJHVy9R?=
 =?utf-8?B?WUtLeUJSVHVFQllhK0tvL1llVElZSU1xTFFjMnpoN05QNnpndjhVTldOS3ND?=
 =?utf-8?B?dm5FeVc0RDdJTWhYTnR6dGhGdEJJRU9rdTl1NDMydWJlNHp6MzBJUStXVmhp?=
 =?utf-8?B?Y3RVNXJjeUlVT0tYdW5QTyt3c0xEcVhQZEoyUnpQV28rOGl1cUhjaW9yb1N4?=
 =?utf-8?B?bVJiVWEvcEZKdzZCb0oyMGx3RFRUd0p4M2pob2RhekFKSUNhTXlZamNrd002?=
 =?utf-8?B?SWUxSGtyYU1LbTB0Q1ZqQTYvNng5cGRDQnduS1hNeUtOdW0zaHJxYXAzVlY4?=
 =?utf-8?B?dU1ONEVyeGowYzNZSVhZNHZFSjIrbmlVa05wVVpQdjhPOTNkQnByblpVRktq?=
 =?utf-8?B?WHE3NU9BeWFsZEJ1WHNmRG5TSzNwekJtdm5yM1d5VVBHa2dJUXdxT3hMNlI5?=
 =?utf-8?B?NzJCa0lvTjU1S0lNSXg4OHp2dENOeEdLeVE5Y1FOQUFIR3B1bFQwOW81K0lZ?=
 =?utf-8?B?dTJSZXlyYWljRjhCK24xejU5eFB5VFA5OVUwaFlBOWRzaEFtVHp3cElYM01n?=
 =?utf-8?B?Tnd1Q1NocHlUZmtaVlpDemJ3L09GVWFuYTNoOFcxbFFkSk1TUUtYeVZNRGNB?=
 =?utf-8?B?eVhSOW13NTVKdEZZQlJJTUJaVCthbHB3dC8xZ3pQc2UxaFNmUFBsMUxGa2p0?=
 =?utf-8?B?TVhTSGhjSnUzWDA4anZHU0hxRmVtanBFeVl4dFJFdW5PRG5GbGhXWUlSQjAw?=
 =?utf-8?B?OUdabUdDTm5kdWplNWJaVHRGd2Q4dWNDOUVHazYxamRWMUFRQitGeXdoaUtm?=
 =?utf-8?B?TmRCZForcUUwWmFVM3BaZzRIMmwrUDl6Q2srT3g5djFyQXUvMlFKME9BVmxU?=
 =?utf-8?B?UU5mQ29DSFQ2SE5sclIwMkt4TnRLQWRkUmRRSWZ2MVNQR1J1SVU1aHFtUWJt?=
 =?utf-8?B?ZUU5LzMrQ2tTOVNXRytEbkxWY1I3WXU5RlV6aWs4MFNqR25xRStRVEx5QWlt?=
 =?utf-8?B?cEsrc2l1Q2crbnlrWGtDcFUxM0QvYUc5UFgybkIzUkM4UHVDZW1KTXJsbHFJ?=
 =?utf-8?B?aUtmTm94emF0NTJtVUk2S3gxcTJocXhibDVmcUhXbHo4NjhxTWpGRFVoa1JX?=
 =?utf-8?B?S1dVSzcrL2trSHFCaGk1bWdPVHFsNWNrVFJyZFdpbjJXaHJRTEpCVmUwZ0hq?=
 =?utf-8?B?QlE5bTBJMU1QNTM5U0tzMGRwNXVMNmR3K29sOUxQQkhuNXl0eXpxUHVJU1B3?=
 =?utf-8?B?SnhES2xTZFFjM0N0Z0FyWi9GbWhUZS8rcEtOS3orcjNlTkpqVVlYOU1IUmpz?=
 =?utf-8?B?aUZxNmlYV2haU1poNkNzSmQwZGpRa0ZYWWp4MzZabkw3a3p0QnlNMVV3YVR4?=
 =?utf-8?B?Skt4NTE4Y0p6aTdRaUFibEhhekVkMzgzWXJac2RqRUxzSUFScnhaUDNtOGdw?=
 =?utf-8?B?NlRJN1JTQk4xTDFRUjkzVERZR3VkY1ZQZ0lSSXI0Q1JOODV6UkNuZk5zdzFI?=
 =?utf-8?B?a0tjU0QxN0grcVkvUmRKVmpGK1hCN0FIbW9wRGlMblZIai8vWnd0Y0NZTEFG?=
 =?utf-8?B?a1JCRi9ZbEZEd0x0ckE1dytiQ0tyd0hsSkF1cFpweXVrSEp1NytNaGZ5TW9w?=
 =?utf-8?B?cm00aXBIZkxJcEVUZDJyL0svMmtRSWt6UmZNVDNXWXB6dmZvNVFNSEI4NTNP?=
 =?utf-8?B?MjFQSm84V2xjeEMrNDZMWDNOWitLWGhMZmEwb0xELy80bk92N3ZqUHB4NHNz?=
 =?utf-8?B?YnhDeWdaclllQXZsdE9OT3c4YmRQYlhJd3VBNEVCZ1hqakxySkFkUlNHL0c3?=
 =?utf-8?B?MkJMNG9CT0txUTh0UnlRUjRaN2xhaVFaT3dhR2FLR1R4eENNVFNPZkx0SEU0?=
 =?utf-8?B?TmxkeUdjMWw5U0Rmc3VyWkF1c1VYcGlSNHAzWW1KUGMxcHVYRDNGNU16My9N?=
 =?utf-8?B?M0w0aXBRenJub2ZSYkl3N0Frbkcvc3p2d3dyZVBjRUFoMFQ0OEFMelBSTWlG?=
 =?utf-8?B?WTZGSkxYVERCZElocVFnY25USDc4bGVCbmFDM1kxYnhEUlNnQWd0SGNqYUZl?=
 =?utf-8?Q?0XVHgQi/t+FDOXFDfalDyrCq6xg/KSeIwbbUPAIzgg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd244804-8a71-4fd4-62e7-08d9a4441ced
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:17:50.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hhJX6YZQvwHCK3qd+oSRpTeQtmArIftA2k/WHhyNjUythoHNY6WT7Y69yclGd3uftT42+XWd72z9yRtvQVFyKlxfkFKCWh2or+7T9GSxI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.7.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

04.11.2021 13:38, Hanna Reitz wrote:
> bdrv_cor_filter_drop() modifies the block graph.  That means that other
> parties can also modify the block graph before it returns.  Therefore,
> we cannot assume that the result of a graph traversal we did before
> remains valid afterwards.
> 
> We should thus fetch `base` and `unfiltered_base` afterwards instead of
> before.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

The fact that other parties can modify graph during our graph modification is a global problem.. The patch doesn't fix it, but reduces its effect in specific case.. OK.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> ---
>   block/stream.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 97bee482dc..e45113aed6 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -54,8 +54,8 @@ static int stream_prepare(Job *job)
>   {
>       StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
>       BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
> -    BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
> -    BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
> +    BlockDriverState *base;
> +    BlockDriverState *unfiltered_base;
>       Error *local_err = NULL;
>       int ret = 0;
>   
> @@ -63,6 +63,9 @@ static int stream_prepare(Job *job)
>       bdrv_cor_filter_drop(s->cor_filter_bs);
>       s->cor_filter_bs = NULL;
>   
> +    base = bdrv_filter_or_cow_bs(s->above_base);
> +    unfiltered_base = bdrv_skip_filters(base);
> +
>       if (bdrv_cow_child(unfiltered_bs)) {
>           const char *base_id = NULL, *base_fmt = NULL;
>           if (unfiltered_base) {
> 


-- 
Best regards,
Vladimir

