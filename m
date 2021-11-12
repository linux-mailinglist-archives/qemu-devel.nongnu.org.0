Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138244E61F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:09:22 +0100 (CET)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVMv-0002jg-03
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVKm-0001ge-Um; Fri, 12 Nov 2021 07:07:08 -0500
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:42966 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVKj-0005hm-SD; Fri, 12 Nov 2021 07:07:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIbLcpY8hHghdoc1jp3NebQ5lCgKo1YxBV6J2dKiQmpvuWtkN1ptLSSWciu0xxbNpxK1e1gAdMdq839gBubI3Pm5Y2vakQrhFOfBStvZgvjtvLmE0Fcn0PbJsd8Jh8GwfEsNniwiIwW2TGMZJcayhP5VhaGkvZkrwgbJtChvCOrSN2R/03ru+yL5fkxrVR56mBXzue3Kj9G6OYSzs5cj3FPvXmC7dVEE4SOykj8eTWTcpYLmrmwRduFsIjb247CPR5boIhHySivcA45Tc/0GerL7qQB4GEOGBdWOrF99UeXHogk+nTJSjAZLDW8445hvgNYnf/rQAw7EnPPOCFFQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PK+mbK26WIVS7u6aeNpZfZ+O4TpEEgqYxJAaeD7cJs=;
 b=HvKsRoU+Q7Ggqn9qj0nIYVEbbkHAxY/VxjrbsDVkRUda+ekGW+hAzjvjVjNgemtDe2vDxXMWdIeWvXiSR0+O5CVAtEq5k1WwxwC3/SjNF5fpIfkVfb5XxyES+SyF3rz1vlcz//353u764EwosJeBdVrnVLiItGNlrZfNKzuOpvEUFV1BKDu6eEnWRnTlW8qN0RdMqWRnW46hbH8KxOtWZMm4MG/N54vdccB+hw2jMuPtt2w8qUJ7N54uqLPZugGopTqCAiXoLWb3kaPZcg1K+hIt+sLK3tYKWj3chCz3RYJfo4e0sd6jorwja2yaTU9kwOgN2MQeMR737fNV0YjE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PK+mbK26WIVS7u6aeNpZfZ+O4TpEEgqYxJAaeD7cJs=;
 b=DfDydiMQEiRsXHZ9amHXCPLwpsOEzm/IHlMCyshKBRBEEuXdV9MPzaOkYLsfESPyFTcqFVKFRFJS0nTh4DbRplt3zP5QeSEufGK78toib6fZtVHQsJEnOu0Hh3dWeJnrko8MwowxCwQU8JXYfwLh8tWImI8D4TJkBi3xXQBkoxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 12 Nov
 2021 12:07:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 12:07:00 +0000
Message-ID: <a1ef34a2-c60f-f27f-aebe-dbb66274d65a@virtuozzo.com>
Date: Fri, 12 Nov 2021 15:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 05/10] block: Pass BdrvChild ** to replace_child_noperm
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-6-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-6-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0066.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AM6P195CA0066.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Fri, 12 Nov 2021 12:07:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bde8fd-08eb-415b-98ca-08d9a5d4eeaf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-Microsoft-Antispam-PRVS: <AM6PR08MB322495E44968A40A0F7C7943C1959@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7JAp5ITSriFpkasooxBxbNkw0L19DllbuxjzG2WbXhwCR5uwWI/oz6uvi/dYNG/U4AX+RwC3rKrwVgdeDGvTIBJ1mpg2I5Qa1v+SXvgPrGn/jOuZ2iCRCZfE8OijFOvPQJrrKLcAvkmV3VvSZ9yiMsAiqlylnkwYJdgcZewW3YcNYZ6IIh+g2EZxctfMDngd7Pn3L9MKtNP8Ps8B7c4L6crWMmaLArOhwms6mH6P51Ix+oMRph1JQUaP4/IhKn60fQro4rRaKsLgqRlqd9X4LPzpOSia4BgqA6VuC4zTAZp3eMASZ39XrOF2A7dyW/zThVqHO9S2IMNOntIJ3qdHw6frLx8EJVJRF07dCI8a0+LC3xDESyG2mOqszApZYYaOAKTtU1P9ENwcXZj6xCrnWFhsYx7Sq+5qyoKCZFJxw8P+jG3GXHD80Ge2r6y/dFDQRo9iFsEkkaQ16yVzi9hR7CibXH68WBlp3L2yWBPerA7pCLsP6uTiB2JsN/KTBIE0lCLhsJK79KwZGwfy3Nyh2zXpmLFGYLgf0eLDbdmAmc+WSkL8VIqX1gNtE5wGS6lY0PccXsKmDl4iguSlnV1KDCPjK2Lztw+9zbFc5svvqqf6lpGm+MDRLmNxARrO+VBbseFTVk4A3CYhP5Z6nd1ajg9ZLu5LEUJ819GFqWjjCmkIghm8GA4RW2+rqZpSpMTvZiErOYZzJJIxd15/ttKNTlfOO4c7s6lDlBweUKsRBxrgwCcFJ6gpt5I0a5u9jC9p1R/oa73mg04XnZPYNiciQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(2616005)(38100700002)(83380400001)(66946007)(316002)(8936002)(31686004)(186003)(36756003)(2906002)(26005)(5660300002)(6486002)(8676002)(508600001)(66476007)(86362001)(4326008)(31696002)(956004)(66556008)(16576012)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FlZU5hNTR4WkZSRUNDYkZVaGxOQ3RlWTN5Y3FycmtXcHBxYlVLOHlaMXpF?=
 =?utf-8?B?SnlCT2F4T0FpUTFPc09GYUlVdGdoVm94bDdNNGN2Qy9QbWpUTTJpNy9iSnpj?=
 =?utf-8?B?N0ZJTGk3SE4zS2pUT1FPS1dXQXh2OEZmbkJiUzB2Y1hpTS9qUVNVa0pOUXlN?=
 =?utf-8?B?RTRhczZqMWNEVkw4LzUvMnAxbE9aTk8zWE5OTVE1K05pK0lKSUh6SXdxUGlW?=
 =?utf-8?B?cmdleWVoZnc4SnJLSGh5WjI4bUFnQm5pTVdvTGZra2pMRXhWVEZkTHpjazRk?=
 =?utf-8?B?TFZvcVQyL20vVUQxUk9ybzdUNUM4NUtoWnkzby9KSXcxWXgzRFdEV0Raa3F4?=
 =?utf-8?B?NVU5b2JSNFVicUViV09weXk2eHkxemZ6YXFqR29QbWh3amcyWHpVMGVTMnh6?=
 =?utf-8?B?VzlySUN6aVErQkV1UzdlTEFFT0hKTXlYcW9KeDBBY1J5WjdoZ0dhQ1AybjVl?=
 =?utf-8?B?bFlISUo0b2Qva2FEeXE3VmlrM0tRbTl1eHM3ejdYZHprZ1psWFBkaklsTG9Z?=
 =?utf-8?B?UE9HZ0xkVHZwZ1FlaFV1alhCdmgvQUdYRnNNbUl4a1BmdFFwdWhMN3VVNFlC?=
 =?utf-8?B?cTNsWk43WkZ5SnFIZDNObHZMQXc0ck1YNlhuZXovV2FRQ1BVU21xK0pvc09X?=
 =?utf-8?B?aVFKWkVvWWY4eGZ3RERoRVQ4bkZPTnlHMHU3TXNyaTI4d0VuMUJ3TUIxM3g4?=
 =?utf-8?B?MUJaZzF2QzNMZUZlTlQzOHhYRnkyeXlhSHNsWlVtSVE1SkZXdTBPWG5jNXFy?=
 =?utf-8?B?cDV3MTlZaDBwNUZuQWZySEtEbWhxSmsvenpnQWRESW5kcklmMXdaZjg1WDZz?=
 =?utf-8?B?RzJjemFBNGxqQldqTDVoNFBhcU1QUWxvSEdDOHQ4bzMzL0UxMGk0YkNaR0VP?=
 =?utf-8?B?SkZPbjJUaHJ3SDEwOEdhamNLSUx6Tk9CdlZFdlc5N0tDRlc2ODdBNU12MEsy?=
 =?utf-8?B?T3V4QkhSUXNYbDNTYlBvY0VmWXFCODFCeEpLd2FMVDA5SjdIVFNKM0ZMMktP?=
 =?utf-8?B?M0lrNE1BbEVDSnhuUmdvVldNTHNqaW5sTzJaa3RJVElPeXVjWVdxMGZIQlp2?=
 =?utf-8?B?QkRwNEE3NHZhSzlNTkw0ckZDUFRaVFlwWkZCTjhLd0hoMVJib21pSDFqZjE0?=
 =?utf-8?B?YnFrb3VzaThYY2p3TEtSZm9VZm44M3l2bEhYdmJDUVRXNzZ1VXJSRzBtd1F0?=
 =?utf-8?B?cnVoWkdVWW9XZlhTRVlYdDM1bXFRdXZuSjhpUEdrM3BPQ3BEcmhLWjRLVUpi?=
 =?utf-8?B?azlaRnBhVTlhNjdsUCswbFNnV2Vlb2pBV05NNFZoMExMVWc0YUF1RklESm1L?=
 =?utf-8?B?Yk1zM3NyV041NEVsQi8rL3Y2Q1FUYktqcE5Xek01SEhmTml1bHoxOUtCdXlB?=
 =?utf-8?B?ak9CaHRhMWNha0U5QjEyeUJlMVFKWFRZV0ljaXZEKzA0SFNYZnhUM2FlYkN5?=
 =?utf-8?B?Y3YwaUxnNUgvQWIyZlVQZGdublVEa2NvTUtVWld0R1dzQi9LaWhLUUJKaS93?=
 =?utf-8?B?TUcvQnZnMEh3ZzJ0b1R6MkhCMVlrODJnQUt1SjZveGQyRXdKUGtiMU5JbWJQ?=
 =?utf-8?B?YkZTN0phUWw0U3JJRlk2dmM3bmh2SC92RHg3TGhreEh4bFNld3BuN3FyZWhn?=
 =?utf-8?B?S3lBeE0zSWFocnMxN3lNckJvUFNzOU02QlNLRmptNUJFY3M4MjZGOEVnZG4w?=
 =?utf-8?B?NTg1NWE0TG91SXZQR0NzT0NaSEthWC9oM2JCc090OGR4KzQvb0VmZXoyY2wz?=
 =?utf-8?B?RjFOWFNIbmVjYUhNU3BLMUJVMEtRSFhDUmxBVVQ3M0tuL0ZPaFRndnJSY0R2?=
 =?utf-8?B?Vyt5YnlXUlk5ZXBBTzNPKy9abWNVRlcxN3NxcTRYdzltbVRoTHdXM1BJbG55?=
 =?utf-8?B?endsRHAzNkJqZzZ0RkxlaHJESkJoZ3hWY0pKNkRlL0xtY3FmTHJ0TnpBR2My?=
 =?utf-8?B?YUtHZG1WcWhpOU5GSzJ3UlFkNHZlMjcwbVpOSmdzWU5SOEtpT01VZUhTNzRE?=
 =?utf-8?B?emtkV0lJaFN0MWM3Zmt5MDJRd1JPd29jdjNzNEZRMmZiaGZQZnVLbkVwSmsx?=
 =?utf-8?B?RzBQRWt3VGRRR2U4SGRBc3V2YUt2aU9pa0cvK3ppOW1VMlZnNDkyNmc4aUhr?=
 =?utf-8?B?YWgwREx0dklidnhOZ0treUwyblp4U2ZKMk9ZRm5UVWMzaS9uMEd2N2NHS1Jq?=
 =?utf-8?B?NkRqWU5oMUVSR2VwQ2ZCYml2M0JJSTd0clJld3lIbjYvVWFldkhaRFVaTzJI?=
 =?utf-8?Q?cLtgkOUpEUrbwxAedMLmr4OhIXlWy40lHxlIpI1S4Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bde8fd-08eb-415b-98ca-08d9a5d4eeaf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:07:00.6557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUZa4zF9gXKgPd+r2E1u9lrKEkH2QM+0QzA9oWMyhKZgLZxhlX6iCDAkunwuh4XqqVPbsE1+nYeBrkKawcdlc73Xrkyq2xSwRxR/kpz4LwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.20.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.11.2021 15:08, Hanna Reitz wrote:
> bdrv_replace_child_noperm() modifies BdrvChild.bs, and can potentially
> set it to NULL.  That is dangerous, because BDS parents generally assume
> that their children's .bs pointer is never NULL.  We therefore want to
> let bdrv_replace_child_noperm() set the corresponding BdrvChild pointer
> to NULL, too.
> 
> This patch lays the foundation for it by passing a BdrvChild ** pointer
> to bdrv_replace_child_noperm() so that it can later use it to NULL the
> BdrvChild pointer immediately after setting BdrvChild.bs to NULL.
> 
> (We will still need to undertake some intermediate steps, though.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Series already applied, but I still feel myself responsible to track how transactions changed:)

Don't bother with applying my r-b marks into applied series.

> ---
>   block.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/block.c b/block.c
> index c7d5aa5254..d668156eca 100644
> --- a/block.c
> +++ b/block.c
> @@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>                                      BlockDriverState *child);
>   
> -static void bdrv_replace_child_noperm(BdrvChild *child,
> +static void bdrv_replace_child_noperm(BdrvChild **child,
>                                         BlockDriverState *new_bs);
>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>                                                 BdrvChild *child,
> @@ -2270,7 +2270,7 @@ static void bdrv_replace_child_abort(void *opaque)
>       BlockDriverState *new_bs = s->child->bs;
>   
>       /* old_bs reference is transparently moved from @s to @s->child */
> -    bdrv_replace_child_noperm(s->child, s->old_bs);
> +    bdrv_replace_child_noperm(&s->child, s->old_bs);

  - no sense / no harm in  clearing the pointer, as it's a field in transaction state struct, and should not be used after abort
  - hard to say do we really need clearing some another pointer, upper level should care about it

>       bdrv_unref(new_bs);
>   }
>   
> @@ -2300,7 +2300,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
>       if (new_bs) {
>           bdrv_ref(new_bs);
>       }
> -    bdrv_replace_child_noperm(child, new_bs);
> +    bdrv_replace_child_noperm(&child, new_bs);

  - no sence / no harm, as it's a local variable, which is not used anymore
  - most probably we have some another pointer that should be cleared, but it's not available here.. To make it available, bdrv_replace_child_tran() should get BdrvChild **.. maybe later patch will do it

>       /* old_bs reference is transparently moved from @child to @s */
>   }
>   
> @@ -2672,9 +2672,10 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
>       return permissions[qapi_perm];
>   }
>   
> -static void bdrv_replace_child_noperm(BdrvChild *child,
> +static void bdrv_replace_child_noperm(BdrvChild **childp,
>                                         BlockDriverState *new_bs)
>   {
> +    BdrvChild *child = *childp;

No real logic change for now, OK

>       BlockDriverState *old_bs = child->bs;
>       int new_bs_quiesce_counter;
>       int drain_saldo;
> @@ -2767,7 +2768,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
>       BdrvChild *child = *s->child;
>       BlockDriverState *bs = child->bs;
>   
> -    bdrv_replace_child_noperm(child, NULL);
> +    bdrv_replace_child_noperm(s->child, NULL);

More interesting. Currently bdrv_replace_child_tran() clear the pointer as last action, so later we can remove this last "*s->child = NULL" as bdrv_replace_child_noperm() will do it.
No harm: in the the function we use local variable, initialized as *s->child.

>   
>       if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
>           bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
> @@ -2867,7 +2868,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>       }
>   
>       bdrv_ref(child_bs);
> -    bdrv_replace_child_noperm(new_child, child_bs);
> +    bdrv_replace_child_noperm(&new_child, child_bs);

Here child_bs must not be NULL, otherwise bdrv_ref() crashes. So, nothing would be cleared.

>   
>       *child = new_child;
>   
> @@ -2922,12 +2923,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>       return 0;
>   }
>   
> -static void bdrv_detach_child(BdrvChild *child)
> +static void bdrv_detach_child(BdrvChild **childp)
>   {
> -    BlockDriverState *old_bs = child->bs;
> +    BlockDriverState *old_bs = (*childp)->bs;
>   
> -    bdrv_replace_child_noperm(child, NULL);
> -    bdrv_child_free(child);
> +    bdrv_replace_child_noperm(childp, NULL);

And here for sure we'll clear the pointer

> +    bdrv_child_free(*childp);

This obviously should be changed in further patches

>   
>       if (old_bs) {
>           /*
> @@ -3033,7 +3034,7 @@ void bdrv_root_unref_child(BdrvChild *child)
>       BlockDriverState *child_bs;
>   
>       child_bs = child->bs;
> -    bdrv_detach_child(child);
> +    bdrv_detach_child(&child);

  - no sence / no harm, as it's a local variable, which is not used anymore

>       bdrv_unref(child_bs);
>   }
>   
> 

Patch is correct:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

