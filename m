Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B984BDAD4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:30:40 +0100 (CET)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBaA-0007Wq-Go
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMB68-0002Ft-9Q; Mon, 21 Feb 2022 10:59:39 -0500
Received: from [2a01:111:f400:fe0d::70e] (port=46468
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMB65-0002gV-I5; Mon, 21 Feb 2022 10:59:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhyu60MkNfW3UdYn7uVI6jYdxbrh5DTNB7UU8sWR4ORNUbNsE4hE2bCfLUoyffGqYtghrVvISk5uqtAQ5LPnr4TCWlxStW3rxeJ1NjiLHi6RMWReVLToSSfOiW7UaEEr7DXHJIhEz5UazvnV/eY9nEYB8klw+YJSV0/C7CJxVbXWAbuSiJG+c3Y+FG/NFredEtnHKvXPOsHiBtytJrnE0xpEXwBrNzgVbf91mSCyQhIfzTD7T+u9FiMpl5IHn/p0vpAO5eZffy6IEAftk+dnzixk5z0K1IOhhXVL3Y57cXKdYap87i+N0GFZxf13r1qkFj0GINLWpdhqkEHhn7gIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o15zuchC0oH7u7eIh6n0SpQxCqsUeaZe3Q/AlSI4SBY=;
 b=DoxF4e0tvY9j3Rf5zrkIUMYRjkMUFNlHz0hYP0Psg8VBmL7LSRfeBD9gGOY+h+6oXTqcYivRUdKQKfh51WiHs9Br3wXbHOjxm7MxHKt40lyQLEo03rwLwXvrJVFLAtaWWsS/8NKiYW8itGuKFmg1fNbiv5O47EjA8INCJXO48PUSJ6TwjxX5O81P4beXK1aLT+hlqUYcoCwA30TJ366f7hK6xW1DmWxcMsXvXvxggmvNku6+ahccDaSsFPNc9pdhqVdndEhlGrtI1gRrKLthQXrzPIR0taMJLd6HMWqv2YclFTWRAi6Bwk5D4lBl4RNlCGwdTGzBRvCBLJ9+S8yozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o15zuchC0oH7u7eIh6n0SpQxCqsUeaZe3Q/AlSI4SBY=;
 b=Oa3GJ0ukLNNQ1d2K8Fzfh1dh3XqL2n38+5Owwjs6oeCWw+kQliezdr5htVM0lW+9FBm/Gl8HWhBCs62xzyWGmZrr/MbZk0fCuYaK1Xr8u5P3uqapQI4HYd/cfUyJ5MhpRwweS3wt3VjUYkjKx5TXXuft0yOvTbSJiKAyIdXEGG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0801MB1851.eurprd08.prod.outlook.com (2603:10a6:3:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Mon, 21 Feb
 2022 15:59:25 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 15:59:25 +0000
Message-ID: <66959a75-dc39-54b1-49f7-c01f11a6b2a1@virtuozzo.com>
Date: Mon, 21 Feb 2022 18:59:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-4-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220215175310.68058-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4272158-2f62-4d75-4bad-08d9f55321eb
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1851:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1851C92D785D3501ABBC8A9CC13A9@HE1PR0801MB1851.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLsxq+7hVQUXV28p5OuFIU7hBnm9lRPHwdhvT5VIWnLAU/q1JrhbfVBnUnpFqXqRsJs5to24yxSEJ1rsSPkmZ38ldk8JB9CdKY3/UDD9PJUcwHNM481+axbVbW4CDw087tKD6YNJG1qucX0f5A6TG514yisGFQMWXjiIDg5+UuoglYCkARVYpY/QJs48Ya+PDpdb7qd9undYR9GjxTdu3ShdFNlVLsTvadZuxvC0YWbDdq54r+W//Tk48xhPRuRmU4LuqwU5Cuet3yhXSA5o/ukrRs+1sGvkTATDWqX+5ywcab8R/H6rk1Reh5g+qCmLnE+zw2riygvf6tAvpJwbsKioNy37n4I1JkGpxVH1urI36r6k+o321zkFZ5vUXgHM7pCMG6MBgVrta8Ef4HuwshOUU6cYhNq62NemQbcupZVkIlSEh5HAqYBqwFuRUsmuSX7G5ybKt0j0Xth42raXwQIVHhUVMTxLJuuFV9BC34MtuY43Hp4lkr+csfaBF8b6LOjUH+7P3rJUC5Y7wHnjRMQ+EXJCaQSTcOhe5fZmuEkrDvcKB3gz5DrX/K/1dd0y9YdksrQNBwhBIVYK1o6eMZg0yuTa4ruU7xw+s47on44JAENi+VUZ7UZkf9U5OwCsyAc6jQMfziXMVrsscnWTKxndMBrsfhVNMFbFSBPndglkA71Jd5WdAx27EptQpMgN2w8lcZ+fbFsPIBNgr8zck9dSAuwfv+e1q+NG4PgBnWEj3waeY/hZfEEaKZ2Iy9bcV8yaod+VjiHQN04SpT71+4bnZdfZpdMDc/AxNGilBhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66946007)(66556008)(31696002)(6916009)(6486002)(4326008)(8676002)(508600001)(66476007)(36756003)(26005)(186003)(5660300002)(6506007)(38350700002)(2906002)(52116002)(2616005)(86362001)(6666004)(83380400001)(31686004)(6512007)(38100700002)(8936002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JTZkY4d1BLMHZkdE02UWxoQkpHd1kwc2JEVFhIWTFzWW9YdHpRWWlXL0Qr?=
 =?utf-8?B?WUxCRGdpdDFuWEdrUkh1SHdKUkI5eTZFQlZXaTEzVTI2NXNVNzZ4WW1MS040?=
 =?utf-8?B?N09aZFNuWkpXME55bVRNNHBiQkZqYkhCaGE3WmZ6S2U3SjZYQ2N1SXVkTi8w?=
 =?utf-8?B?d0Z4WWpQRGVkK1ozdG1pclZCT0dsMlBmV0tCaitrOE1Uc0xjUzkzSEFpblFF?=
 =?utf-8?B?c21JZVNuSVYvWWVtZVFKYmdNTDRoZXQyYUR5UUQyVWZ4OGtaVFVNT1N5M20x?=
 =?utf-8?B?c0ZKeUF2djhhQVMwVzIyMmk0M2IwbHQvYVJMNHFSblg3Tlh0SFlxT2RWU1Ra?=
 =?utf-8?B?ZEhqenBSYmZRNWRwTnpWdDFUK0RvSS9vallETmlvVE56dXZlNkpQVjdjN2gy?=
 =?utf-8?B?ZWtXY3FHVmp5OU5CM1lINFNtSUU5dWNBaW5UWmJLemc2aVUvM1hMN1lpZHZJ?=
 =?utf-8?B?U1VtL1hQdnRqcm44bXdYWjhtRXNLcHdGdXN3dEVtbXlhNTN1U2pNVjJqNzQv?=
 =?utf-8?B?bkdURnc1Y2VsWmlJc3I0TmhTYjM2anFhRW0vUjB5Mi9xMDFZZzBWQXZsNlJ5?=
 =?utf-8?B?dG1NL3Z4SHhKeGd4Z2c3Rm9oczAydFpsTVNGMWIxdFhXbE1aWlRZL2Vsc251?=
 =?utf-8?B?Qm0ySU1QaDlOMFI5RC9BVkRTQWdYRlpUTFhPUTdrMFJYSjJreHd0a09xOVBr?=
 =?utf-8?B?TVpTUCtEZmJUU0RGUiszR1BSdmQ0S0dhQTFac3o2NjhiK0tGWXFmRlorUGNq?=
 =?utf-8?B?RmU3Q1pROEZRTEwwanMzUXd4Tll3d3JQUTM5TXFaTVNFNGZKQWVQZkl2ZGdv?=
 =?utf-8?B?V1dFU0RNTmtlTkQ2Y2trOUhLOEplaTBRSDZjSDhHNm1ieTdqaVY1S2ppSHhx?=
 =?utf-8?B?cU56dm96cE1nR203Rm52a1p2WEdxa0U5NnN0NzR5ZU9ZYWEzQ0N4cG5YVjcw?=
 =?utf-8?B?eHlRT09CYmFDRVJrS1N2R3FwN0lZQkswM1pwN01hSnhYZ2duck9Bc3lUMU1M?=
 =?utf-8?B?RkVRT2E5cjlZYWJEdCtLWjlEYzVPWVhtZFlITUFLanRrZStjWHJzQlh2U1c1?=
 =?utf-8?B?NXlvOUhKNjZ0R0hJaHdIZzlJOW54TFdXUXhJWnhKK041WXhhSW9QQmRJVnFH?=
 =?utf-8?B?bkp0Y3pMNkNvb2dPOWdXUEZqdHdwbVVtcFFlSW03NVc2WFRCVVZoMktLYzhG?=
 =?utf-8?B?cjFjaWdhRWwwaHJIb0xnRWJjVkRiWko4UHNMUVd4ZVgramhiRzNmMFJmTHZh?=
 =?utf-8?B?SGJzY3E5WWN3bEVxak9ubjNtUEpxY0JqVi92VTZBeThGV3R2Y3pJbkVkMk5E?=
 =?utf-8?B?R3RZalBuWURUYjlMU3p1TERoRjQyTitBSVp4cWlMSzZUZUpDeDNRL0lRalNz?=
 =?utf-8?B?amttTkJEUXdzaW8wbWRnODVsOEg0SWxkYXlFWXlQNCtza1lIS0VQMUxRWXht?=
 =?utf-8?B?NXJad2o2bS9DZVF5d2EvbTd5MTNNcGtQL1ZhSTBYelkvQ3ExbTBrdG8xNVQ2?=
 =?utf-8?B?Z0ZmaFlWNTBBREg2MS9NL3JBRmxnNW93bnRuMWNyUUJKTG11eS9YZklqeE1B?=
 =?utf-8?B?RHJYN05tY0M2c2Roa1JrWmxxeWRUMlBVblNwNzdtSHZPU3NoQkRwQU5yUm5p?=
 =?utf-8?B?RVczN0JIUkdha1FWZi85cHN6SlJVZHN5S29aQU0xeFVDNUxlMWx6MUdseExy?=
 =?utf-8?B?NzNJTHhsTmN2SjlqMHhCb01NUHkvV24yQm5rVVVjT0tIbFhNa20xcU16bzR0?=
 =?utf-8?B?aWZ1ajIzRDJVTitQdnBhLzZMQkJORGdXb2paS29GM3lDNi8wQ3orMU0wM0Jz?=
 =?utf-8?B?WWVOV2h4MWdQWHBCaStzY294N0t0NXZPWmxSTUlBYnN2UXpvMFpqTTVTTVAz?=
 =?utf-8?B?cG5RS0pxQUhISStFMkJnbWVodUdTTnVEaFh0alNkUzZKKzJYYWlCVENhSHQ4?=
 =?utf-8?B?VTdaRHdKTWpYMWRtVUQ1UTRIU0FBdHpoTDk1VUdUSU9BQ2xKZ0ZTVWFYUThP?=
 =?utf-8?B?Ly8wd2NyZExDS2ZDbndqRTI2KzZhMW41Vm9uWHdWQVhUWTYxTjJ1S3c2YUQ3?=
 =?utf-8?B?OGM2cTFOYW5WQlJBbEVkWjc4OEJ1V05KS243RHRhMmZEajhBOGJSL1A4OUxm?=
 =?utf-8?B?VnpyTDF4ano1dWVQcFU1K2IzYzI4bVFNVDZIL2l6QloyM2RYRUhsNEVWT0V3?=
 =?utf-8?B?SC9pSm9LRktYb1M1aDhlc1hTVnZaQ084VVhpYkszZmhYNncyUThsZnZERWhY?=
 =?utf-8?B?YnVFSzgzeVQ0SGJiVVVhSVVpREZRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4272158-2f62-4d75-4bad-08d9f55321eb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 15:59:25.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5ris7+IeTJfka2l6XfjBy7hIN6SPi1seQQ8C1oAYr6BufTA85N68NFLamvLKyS97PMtMelA+LZ25LvsNyD6hQM4qOWET/No4BZ+dSa5A5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

15.02.2022 20:53, Vladimir Sementsov-Ogievskiy wrote:
> We don't need extra bitmap. All we need is to backup the original
> bitmap when we do first merge. So, drop extra temporary bitmap and work
> directly with target and backup.
> 
> Note that block_dirty_bitmap_merge() semantics changed: on failure
> target may be modified now, and caller should call
> block_dirty_bitmap_restore() if needed. The only caller is
> qmp_transaction() and ->abort() is called for failed action. So, we are
> OK.

But actually caller rely on the fact that target bitmap is returned together with set @backup and this leads to bug. I have to make a v2.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/monitor/bitmap-qmp-cmds.c | 31 +++++++++----------------------
>   1 file changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index a94aaa9fb3..2ce1b4e455 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -252,12 +252,15 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
>       bdrv_disable_dirty_bitmap(bitmap);
>   }
>   
> +/*
> + * On failure target may be modified. In this case @backup is set.
> + */
>   BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>                                             BlockDirtyBitmapMergeSourceList *bms,
>                                             HBitmap **backup, Error **errp)
>   {
>       BlockDriverState *bs;
> -    BdrvDirtyBitmap *dst, *src, *anon;
> +    BdrvDirtyBitmap *dst, *src;
>       BlockDirtyBitmapMergeSourceList *lst;
>   
>       dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
> @@ -265,12 +268,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>           return NULL;
>       }
>   
> -    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
> -                                    NULL, errp);
> -    if (!anon) {
> -        return NULL;
> -    }
> -
>       for (lst = bms; lst; lst = lst->next) {
>           switch (lst->value->type) {
>               const char *name, *node;
> @@ -279,8 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>               src = bdrv_find_dirty_bitmap(bs, name);
>               if (!src) {
>                   error_setg(errp, "Dirty bitmap '%s' not found", name);
> -                dst = NULL;
> -                goto out;
> +                return NULL;
>               }
>               break;
>           case QTYPE_QDICT:
> @@ -288,28 +284,19 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>               name = lst->value->u.external.name;
>               src = block_dirty_bitmap_lookup(node, name, NULL, errp);
>               if (!src) {
> -                dst = NULL;
> -                goto out;
> +                return NULL;
>               }
>               break;
>           default:
>               abort();
>           }
>   
> -        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
> -            dst = NULL;
> -            goto out;
> +        if (!bdrv_merge_dirty_bitmap(dst, src, backup, errp)) {
> +            return NULL;
>           }
> +        backup = NULL; /* Set once by first bdrv_merge_dirty_bitmap() call */
>       }
>   
> -    /* Merge into dst; dst is unchanged on failure. */
> -    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
> -        dst = NULL;
> -        goto out;
> -    }
> -
> - out:
> -    bdrv_release_dirty_bitmap(anon);
>       return dst;
>   }
>   


-- 
Best regards,
Vladimir

