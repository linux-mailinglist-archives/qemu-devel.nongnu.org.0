Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B759D6B2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:43:53 +0200 (CEST)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQRr-0004zy-Mm
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQPA-0002dF-H8; Tue, 23 Aug 2022 05:41:04 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:45126 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQP6-0007tq-5n; Tue, 23 Aug 2022 05:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP52t960gxb/AHagdS90BdLmaAn6F7/9gseeNY7A/Hn4EcGAmlxIl6Ei8TLbHh0F8BcjOXyZGq68I5osPOHQlq/T9+TI0f4h9nAAFbvbzz/qegtzCL7IrkhX7SoOoEho7aakA9y5wcCBcY/cAdi07BACTni5DlQ+jrg6mjcPYsWI9nhrzbe+Jkb4Q9pvpdqhjgGfzyJF6WeFS5wcafeQNN14bQQtdD8RxKSh5ZcMEz3Wec/jMuSQC0ih3ohwaz1vnE9RW8cFbFc1sTtQqbBWKpIpRNvotSW71s1Yn7vZjq0dTDLHDzLT35SiXauooBTH+hqJzzUFI4XcF7+sPjBiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzM9puSUTGCuic4JegvKI6taBbpuT4TF5ZYUVaScQoQ=;
 b=LKFPuiLzkGE3OxF7q9na3ku1L5Do9JOqxpOx52OeIGjxDctHOduGnHWXlgAeAoXxgFsZhz+zzT3tciD5m+okkwCBUCoiSTCp9zbPJcx/N7teaOUAWsopbHCZMHvbN3tvtuR4O5ylD+7KLnRPUgBgUA5Vvu2JKnAdbpgclqshWT1WOm0zMeihQ2fs8YjcEx7hycljg8bhO/lsUqG1ZCpk9eSFeZEb51li7SbeYTKF9AUcmo4nhxrFhwXtmzAwXQT5cXKeozn9duuhZvMQdV41Y3ZDOPgdgdmiyFkAiwNbGPagtFRCVBJII63hxEhg8/c6ZIHud8ARyM1rHnyfbVasng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzM9puSUTGCuic4JegvKI6taBbpuT4TF5ZYUVaScQoQ=;
 b=dk7WLcn36ejtnBqYt++Lyrr2kXOLDqMab9Ve0s1qRnCc2Ig8gbPNiJ+AmYMzp2gZGUZm4mBUVMY8e8K/yShB/GV4SKejqiQN+MCoL4AQ0g1h5icXL3ePQt2+pVbIL3IxDhET6qwkD659ADj3YORG9aHl/b7R4c0oAMJQdvpPvJXDuqvFpzy+6l+lt7VArryoHjLyS9BjnWmyqjtZHwQWCf+tpFrC3+WWSz5m7VyBANPCMKjzy/f9zLBq1B3ajHyyPG0OniZdUx5qBS1BBVHOyDjkcmVwSoLs6TN5PiwS5R1kR498l8Df9TabJUMC63OUsj9ZsduNutY/ZUklA8EzxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB7663.eurprd08.prod.outlook.com (2603:10a6:10:319::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 09:40:53 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:40:53 +0000
Message-ID: <68e6f899-9b4f-c589-4d8f-21c8ffa7a264@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 7/9] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-8-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220822090517.2289697-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0602CA0020.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::30) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f1c42b-7086-4ed0-10ef-08da84eb924a
X-MS-TrafficTypeDiagnostic: DU0PR08MB7663:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TF5EsMTLIHMK6fxLX29e7stoirYJ5VXCsAAUOjMdX7xqkHemaXaNfruW4vOIINDSb0R7+d0vLKmnRE0KIZcYi5DFv2zw7tvpTT6t0B7KzV9O4G8T9J7qtwXzlIYQR9vrdxIE6y/4IM8vTp/PNnH06BNaxtrht/zaN7S3Bx7Vq2Tkj/tOLBZ8R7PsKIBgsNQKCnCRTOcDH7g6fr4DnX7YoaNrXhPR4+Kej8Z+wki4lv9Z2gWOoLoPc8Ph7GH7pYEdWw6o2E+NpVDcDpj96eANFkJ5Y+/odSsybTcQxGZ7Ok+cTNIibagYP5JcNmB2713SMmo0yKDCuD8xp3bEmmyLobi7GLQMOyc92MW1OXfES62OSNnorgwTFK2ZTYfkR/ykuHEw9PVWA1JZiEun7aoORNxW5PfCnvYEE14lUQQVoBAl+0Md0FtLywmOLyop7tTH+V/6drQK+nGa3o15AL9cG9peOlqvfMfZeUWODKRYdAs2CK503Bo1JjUJMBY9D6AY+viMCG3WbdWnzCiqGWOmoIoiz6sr7UPSRGxTvknp/DKW9zSb4+f+5G7fq114eaFbytRcjmqRXUNfhmKpeTNIBr3tEsMkW22/owAF3ZiDmRZI/JvUCttDRJWrmLC7FXiSt7jUYJHUY/sKEX4/v3rN2xGYPTbgoeLN+3HuSfhYFECd+yE083Huh3Yc554ZKft2ayIR3X/ycq+i1fSYngJ9PEd31ps+gMTpkCroI7ZHuDAM9UoDdu7LXg/IKJ7TxRsm8gnibimdhIr8AgNHoVC5IYaSAvXZmpYIq0amB7Rx1Y06lvpK4oKgX1GBVJeyBo9XST5Ubhb+H0e1lUhyMf0rMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66946007)(8676002)(4326008)(66556008)(66476007)(86362001)(36756003)(38350700002)(38100700002)(31686004)(31696002)(83380400001)(186003)(26005)(6512007)(6506007)(41300700001)(6486002)(478600001)(52116002)(316002)(2906002)(2616005)(53546011)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3kyeU5uK0RjV21ZSkVvRWs1Y1lYZmx2eU5RL0pKWk8yRHFtTmRrTUtYOTdy?=
 =?utf-8?B?YnZweWF6STZsQ1lyVWdaRysrbmNIZE5Tekx5NDNUUnJEWFVWRy9uVlpuQU5K?=
 =?utf-8?B?OHlFRVI1Z09kdVBlNU5RbXVwMFVnQ0RLdWV1eDM0RGJhMXpmNXh4RjFoL0M5?=
 =?utf-8?B?eFB6QzRRbm4rbFd1cVZlT044WVUvTHgyUUFueCtyV1RrUkxZaDczWkdZc1F4?=
 =?utf-8?B?aVRjTjlnT3R2MXJhOWZWUGw2OUtVbFdUaDU3engxeGFNazZhVVJ6K1R6MWh2?=
 =?utf-8?B?Y1hZWVg4VGpSek5JTXFTY3pONkpzRHV4OU5CSDU0NFJmek80dWE4dmZ4ODFy?=
 =?utf-8?B?SVViVWZpOVJXVzlweERoS3RTeElQYzhPTzBBY1R0Q2pzc1NobTdrRDh0YlF2?=
 =?utf-8?B?VnQrRjg1RDJieitKeHcvM2hJcE1kZDhGZWhWT253WFMxVjhpL0dZUGU1UVoy?=
 =?utf-8?B?U044VUdvbDhFSGIxTjhFT0lyM3hNRms2eThzMGd6U3h0UmZJNXV1eVZMczEy?=
 =?utf-8?B?b1dnaG1EbHl1YmVsL0NFK090VzFWTlhaR1h0VjB6K0s0Wm14MUZzZmtjdUJi?=
 =?utf-8?B?N1h2N0NoeHpLajh2dEcrcDg3WVljNnl1VXRLaW9oRXR1QzFGTW5qekdISG1N?=
 =?utf-8?B?YWtOYklKeXo3bUpNcVFjOWMzL2pBMHY5TjFRc1Y3bUdtTEVHVFdhVURXK0dV?=
 =?utf-8?B?VGZ2UFNDTzlUd1FYVXF5amFRVVgvbkRydWRsS3VsMFVyc01Yd3VOWVI0TlpE?=
 =?utf-8?B?RXJYVkZMNGlqdXdyRWNmYXJhQUVrZnQ1NzEySG4vdm9UeC9RNFRiZnBOdGl4?=
 =?utf-8?B?cnprWGh2S01nQ2RFZTN5d3pyMkhobTYvaDBuU1JnWW1La0RQbkErWHhINnla?=
 =?utf-8?B?UnVORzFBbEhPbDk1a3kwL0cwNFkrRFBFdU1FVnpIbVhwMFYyZnJlcDR3bEFV?=
 =?utf-8?B?THQ0WWhOZTVUTi9xZExCTXZCUlljT3I2QTVMci9YcmF3bVRSdnJwU0k2WjN3?=
 =?utf-8?B?ZURUd3VyMjBxOHZ6RWQ4SWFqVk5taVlFOWUvMlhBaFM0cVU1bVlScjZoV21z?=
 =?utf-8?B?c1plTmpTQXdXeUZ3Q3FFdFlMQWlSL2dLVlNaRzZkSXRWNFdGTDVwTFVQbXVB?=
 =?utf-8?B?U0lOZGUrazZBbmNmVFVDVUtaZU1YbXlRNyttQTNzdXYrbHJzR01aY3dJTHZN?=
 =?utf-8?B?RmNnbXJtRk9iWFNZQUpYQmp3Vk84OWdHZGVNNzEzQmhjV3VJbVR6ajlFNkdH?=
 =?utf-8?B?cjRFVEV2YkFNeFZvQWd3Q0phN2hTWEoyTDhoWWFmNS9uNyt3Ui9sQW1SMVdX?=
 =?utf-8?B?dG9DZ1prVzZRSHRLQy9Rbm5mdUsvWHp3cEs1ZDJMa1RDYm9WTmFoUk56ZmtL?=
 =?utf-8?B?Zk5Ka2hBL3dPMFRVc2tjNjV4c3J4RFNWZHRoSW5HVkZna1B3ajdlMHFNUmVK?=
 =?utf-8?B?NU4yY0QwZlU2TmVBZ0Racy9LYVB6b0wxam5xVDhNQm9LcnpWOXZRT2dMTFFD?=
 =?utf-8?B?eXhJdHJWa1FFRnFxdi9HMGp4QVB2ei9EMEx4VnFZaUpkQjR6b05BUUk3RFdH?=
 =?utf-8?B?cjROYjJWK3RKbHJhYXdyejgrd01rK05rbEYwR2N0cmIzRC8zWERDaWQ3Tk9u?=
 =?utf-8?B?V3hHd2VOTk1aTzRFdXZKa1ZJWE8zUW4yekpyaFFab21aK0h2V3ZYa1hHTlpt?=
 =?utf-8?B?NnVDaG1pamdFdjh4MWJQL2NqMTZlRmtURGJsbGZWczBVQjVQSlYxbm5PMVBI?=
 =?utf-8?B?MGlSVmpOSmtndStJcUhoamxLZXJHZUFUREJDbjBLSkRhNmhQUWlHSndHcGV1?=
 =?utf-8?B?OS96T0ZpQ29odThsZklIVUJVR2E0dlRGRmRPMWYrNDh4WmN5M0NvMTRDalY0?=
 =?utf-8?B?bktQNTE0TWVEaElEV3gwS0t3aFBLVWJNRm9FUU9kTmM3OEdWUDFkRWtaQi9a?=
 =?utf-8?B?RmJQMG9yamswaFBSU3dXY2VBbjlPczc1aklWU2ZtaitFRmk4S3I2Ujh0dWRU?=
 =?utf-8?B?d1F3SXpSWWxNSUdZN3JRNmJLOG5JQnIxL2RwYVV3eGZIampxS2ZGRlloWm9I?=
 =?utf-8?B?NDN1VjkzcFlNWVZkZHBvbGlhdFhTdGMralo5NHlQTFNHRUQrenJGOW1iZHBk?=
 =?utf-8?Q?7FYpgtDl3kkcgq4y/RzTNNWW6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f1c42b-7086-4ed0-10ef-08da84eb924a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:40:53.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8AjhAtOULL6dwRPINRq+cS/Xgy3gKc+KbTFhtwtRlUtQpl6WpvuYhiZ4S5E39yTaRjTNEGelZv+z/DiW5nmZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7663
Received-SPF: pass client-ip=40.107.5.103; envelope-from=den@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22.08.2022 11:05, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 87 +++++++++++++++++++++++++++++------------------
>   1 file changed, 54 insertions(+), 33 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index bf074f247c..12e8d382f3 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -468,14 +468,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> -    int ret;
> -    uint32_t i;
> +    int64_t size, off, high_off, count;
> +    int i, ret;
This is not we have agreed on. 'i' should be uint32_t
You have fixed parallels_co_check, but this needs
the fix too.

>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -483,41 +482,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return size;
>       }
>   
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
>       high_off = 0;
> -    prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off == 0) {
> -            prev_off = 0;
> -            continue;
> -        }
> -
> -        res->bfi.allocated_clusters++;
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off > high_off) {
>               high_off = off;
>           }
> -
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> -            res->bfi.fragmented_clusters++;
> -        }
> -        prev_off = off;
>       }
>   
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
> -        int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
>           fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
>                   fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> @@ -535,11 +509,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               if (ret < 0) {
>                   error_report_err(local_err);
>                   res->check_errors++;
> -                goto out;
> +                return ret;
>               }
>               res->leaks_fixed += count;
>           }
>       }
> +
>       /*
>        * If res->image_end_offset less than the file size,
>        * a leak was fixed and we should set the new offset to s->data_end.
> @@ -549,6 +524,52 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           size = res->image_end_offset;
>       }
>       s->data_end = size >> BDRV_SECTOR_BITS;
> +
> +    return 0;
> +}
> +
> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> +                                           BdrvCheckResult *res,
> +                                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int64_t prev_off;
> +    int ret;
> +    uint32_t i;
> +
> +    qemu_co_mutex_lock(&s->lock);
> +
> +    parallels_check_unclean(bs, res, fix);
> +
> +    ret = parallels_check_outside_image(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    ret = parallels_check_leak(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    res->bfi.total_clusters = s->bat_size;
> +    res->bfi.compressed_clusters = 0; /* compression is not supported */
> +
> +    prev_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            prev_off = 0;
> +            continue;
> +        }
> +
> +        res->bfi.allocated_clusters++;
> +
> +        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> +            res->bfi.fragmented_clusters++;
> +        }
> +        prev_off = off;
> +    }
> +
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>   


