Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B990B3BC31E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:24:22 +0200 (CEST)
Received: from localhost ([::1]:46858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0UCb-0005i9-RV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0UA7-0003TV-J5; Mon, 05 Jul 2021 15:21:49 -0400
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:41152 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0UA4-00051M-J4; Mon, 05 Jul 2021 15:21:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcGEEyiigPX21ko595JKjqWFa4wVNJVcd9sumsJvZIH8TOABj+KVXKfCGDXQ0c825BA0ObezBE1YTija84rYoyWnFHBdlSTdv4TrctdP/Z8Kt429B6BRvTAjZA0LtKq3CDaTKWCv+sKB7XM8ifJlJd5v/L/0ooxzqk6tOeqVZk98/nVvVh6+pMxkb4OxtAtb6YAjZKEVAnqVfLuux26GKok0EBIQ2BoqC2t6vLno50dKCDtAzhMJ0J3yevcrw9pqmIoL+yI7D6cWEn2j8yRlXc46uoBJSO04829nNC/VT7j93hLw5xxt1GS41NqRbZ4OcqHo/LGJPsoR6JVGJ+Y2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZ90Zw97CgJy5LWBAziXOMSVgZCv1/A2OMHdU3AmZaw=;
 b=FyEwrCa6j9qh49IU8ZJLnoX07HYHufyaSiC42E2e7Q3iAIi2iKyfriOnA4gpr2gbC2JjM6wMyPnlSbyuQ6SW49j9Z449MLTnl9s8GrD0w9GJY6E8SFp2pS2pkAtkFGa3BZR/y7DK2rSYtF8cNqT2qJIXKvlBySSROcTv4iP2NBMYG0uz8TvHUfG98CWDQWQTUTYb9VWlhqsyIKmE+CYEKJLeW/a8LfpJK84qNW/fP4yTSdEID0TDcnVZCieL7qJxv4UQehIJvExJCTI0LgqRoGSAzrO+D8VFPDHd4s9lQK0nqHDgx1hxL+lcpsOLOxl9S9Pc4bBINtQ6Mp/MrTir3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZ90Zw97CgJy5LWBAziXOMSVgZCv1/A2OMHdU3AmZaw=;
 b=E2s4kZ5au5xpdkKXSGW2Xb7YYBl72fS1ggQ/lC/x1QdfDlexcaGdOzcH119Z3sozYxz/ITRQgfoAWGND2z/gPpFqz2f9HVZoI+WZEKcgd17S63/zzS+y6ZnNK0hr0Iaz01eiQ8uVwKlhyS6zdOFsxbcZHBwyYCctsJay39jbPfk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5208.eurprd08.prod.outlook.com (2603:10a6:20b:eb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 19:21:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 19:21:41 +0000
Subject: Re: [PATCH resend] block/replication.c: Properly attach children
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-block
 <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210704125814.369c9805@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3b0ee882-e9ae-1e76-076a-f1a9ddd52f51@virtuozzo.com>
Date: Mon, 5 Jul 2021 22:21:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210704125814.369c9805@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P193CA0034.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P193CA0034.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Mon, 5 Jul 2021 19:21:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 364aefad-e395-45ae-6443-08d93fea1dff
X-MS-TrafficTypeDiagnostic: AM6PR08MB5208:
X-Microsoft-Antispam-PRVS: <AM6PR08MB520841BF0C94C1F10F39E70FC11C9@AM6PR08MB5208.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQyFK0rD+XR7MgmVQj0BvEQdvW9yhfjcCVyjcZfEOuqirAFGLfGZQVKPd4uEnVV67UZ8y148vTJa+qqpHMgg5ghUGnTHQJDeAozF7z4KfpbhzxSMI+Gdlp9nJvAxFCHI4DWpAG4YmAMtDExRHSypipCPajdfGZwV4juet4GEPWSSU94j88WafTNl+UBCoHMyBFD488UlnB5sE+YntaurLCKn7rFfqfFbCw9okayR9zTtI7jm2keKCYkhIp+ifxhaYX86R4Izaii+GKNXd9rdtG5eCeClhxMaEwZvmwZwlqu0M1av7S8looGPrKE/yNWkMa+Ja/tdX4Aee68Gd3srnHgKjzKAVf627WFys6rS5YhyQTW77cqzUlsArfvh5igQs5m+2DYmipR6XwUvUU4Zv5xFrM9ElWyobtl4dBLFGfkjSe1r+ZEhCp8G3bg2LMC7/ID56mPW35EnbFOHcf/AXSCxrELETphJUcJgizMfLPj8TFAmVNrNqB4ajcePNSGzb1MYXD6B+xnBSxDZi1Xwu4Bk2hcG8wjyMsXcNMtoaD+GW9vd0QkWiuNjQ2dtA+fUtZPOJ+Df4TVsglYWF/a84WkDOEi88yJyv/nA9OXC8y7yBF63MaRFIPucrQyGNW+mdZRozc1vH2m1SO4hkZNYwGGTZ0OkPfr9YjiVNaAmMFxgvjZT8wwI1f9/sOpe+0O25oNCqTAWuwJxrkTPVhELJFSnQHCyvVq4Oh45MfGgspkXvoAp7S12re0QZqQZFw3pVUK0u1Z6EmjjanCHjHkR4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39830400003)(16526019)(66556008)(66476007)(4326008)(316002)(54906003)(110136005)(66946007)(186003)(86362001)(2616005)(52116002)(36756003)(38350700002)(16576012)(478600001)(31686004)(956004)(6486002)(38100700002)(2906002)(83380400001)(26005)(8676002)(8936002)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?AgO358Og3od2el4fB5e6opyoZHtnxFOVP15EjCxSRHEhPf2YGfx3sR4b?=
 =?Windows-1252?Q?joSU01XxAlx92wXUJ7oKyJ+dP4E45Bo/6I8SltzWbucJLOQ0xBzJ5FJ0?=
 =?Windows-1252?Q?KZz9MO4YEusTcw4YXRpuIyK75BmnGZ9ghmFAM58JAqQLO+Z34ujHl9L+?=
 =?Windows-1252?Q?QvWoZlImigIUweHXnhusT4SoS1QSPx6MFysqbznnJ8LZ2WDNiEitMFQD?=
 =?Windows-1252?Q?FYOMQVzuPi0NOl8i/j4EOHbcno8JW7TRodWdc09WNb4zr7xq65JtOIUM?=
 =?Windows-1252?Q?BtL3AVRruzBCID8fNpy2cIbGaTZcwp7iMhuY+ym8TkR//KjSdH2QdO37?=
 =?Windows-1252?Q?PYl0eLfxYGRRtOjEVXGZ4F5fCF40+/9n0eT0NIuONuJ0tEnuoKqmksmO?=
 =?Windows-1252?Q?59U8IiuYtn7vnNxJzjaGgqSmgfyLP5KGY9Buz/GTEvMy19HJGpkgYRO5?=
 =?Windows-1252?Q?I04NWvE+77kv7robFlwaAnbtm2N/geSUDKFkJcIDIXntON9HR0I62x2a?=
 =?Windows-1252?Q?5s1qjQTC/Auy0IYaO0TK11zG/vqoWQ6d5He+2/EDlwCn6Eh0FkJD5+Mm?=
 =?Windows-1252?Q?RQVP8TOWvRr94ErPeGa/4dzHhgS/krTljsP/syuCeehPdtbc6XSm9oqP?=
 =?Windows-1252?Q?90j0WR3dU/jOe8nhN60Gz4ey/blIxUKxMygm2uAsT2gbFAI1MkmiGIBn?=
 =?Windows-1252?Q?4awN7M6Z6v0ZXfcZvtyFMFEEycSHfhgHaeQVuf2WY8UQ5QxJnYANlk6Q?=
 =?Windows-1252?Q?dP9Qvh6c9cnZscMxbnYyznA8Uk5SvZp+GWiDKOVo4C9os2hkFX/wTruw?=
 =?Windows-1252?Q?aJAQjAeSO91xcdHYkitpgSm8fYviOb6oJ9Z8oMipNRAB7U1XrZKienh6?=
 =?Windows-1252?Q?LY37F1qzXcyQcqy4Fj/2Ky12K1hKEY3MSQt8gQD7t2bv9IGOzZd3VPAH?=
 =?Windows-1252?Q?jTMZxdm8xljazpljjMkia25GERoYOuUjnMinNOXIwLRMM+bNDdU3YmZO?=
 =?Windows-1252?Q?xetUqhhgRGeaqbYjkWFRvu81MH1oUW7lcbgLOnOjUSK+1pN77oHEV6aL?=
 =?Windows-1252?Q?IcW9UvDxH5n0W+lves7944LpdN7d6ZCb3k15rpKWjwPSU9a2r6J02ZyP?=
 =?Windows-1252?Q?kFRx2ZLPnuZv5KYaILLdX4Ii7Z1Zj8y8zcSKozbSGKQ1KAoDrD0vX5kg?=
 =?Windows-1252?Q?LXeL0FGIFv587tN+L6y/spDBYAuVgDt75933u1HfFaP/JYC/46F+fB1y?=
 =?Windows-1252?Q?/I+l2ZWKxKbtok3CK1APnYxnH6FsADHtuU8+t4mmL0e+Yw1+tWlGae3y?=
 =?Windows-1252?Q?PjcYAoL2Lo94E5Mqf5Gi6UVAt/6ufeiXY4QwgUe3OfSnO9gshFAqpP8I?=
 =?Windows-1252?Q?3zrgjTOdA9UsVj+Z8xK7jz7/lH7wCvn3QsI15ltF1Xsb9hWbV+hULQaU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364aefad-e395-45ae-6443-08d93fea1dff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 19:21:40.9253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2C8UGMQlwvCTaAvCPIFl075z/7541tzwE9sga+DiB8/kovoINqSL7WP2blHiVlVUjTbGWdFlSWxMLYfNx/E2ZFnJx58sdIuHZy66CNYEro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5208
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

04.07.2021 13:58, Lukas Straub wrote:
> The replication driver needs access to the children block-nodes of
> it's child so it can issue bdrv_make_empty to manage the replication.
> However, it does this by directly copying the BdrvChilds, which is
> wrong.
> 
> Fix this by properly attaching the block-nodes with
> bdrv_attach_child().
> 
> Also, remove a workaround introduced in commit
> 6ecbc6c52672db5c13805735ca02784879ce8285
> "replication: Avoid blk_make_empty() on read-only child".
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
> 
> Fix CC: email address so the mailing list doesn't reject it.
> 
>   block/replication.c | 94 +++++++++++++++++++++++++++++----------------
>   1 file changed, 61 insertions(+), 33 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 52163f2d1f..426d2b741a 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
>                                      uint64_t perm, uint64_t shared,
>                                      uint64_t *nperm, uint64_t *nshared)
>   {
> -    *nperm = BLK_PERM_CONSISTENT_READ;
> +    if (c == bs->file) {

You can't rely on bs->file being set at this point. Look at replication_open() bs->file is set after bdrv_open_child() call finished. bdrv_open_child() among other things will call bdrv_refresh_perms() on parent bs.

> +        *nperm = BLK_PERM_CONSISTENT_READ;
> +    } else {
> +        *nperm = 0;
> +    }
> +
>       if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) == BDRV_O_RDWR) {
>           *nperm |= BLK_PERM_WRITE;
>       }
> @@ -340,17 +345,7 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
>           return;
>       }
>   
> -    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
> -                                BLK_PERM_WRITE, BLK_PERM_ALL);
> -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        blk_unref(blk);
> -        return;
> -    }
> -
> -    ret = blk_make_empty(blk, errp);
> -    blk_unref(blk);
> +    ret = bdrv_make_empty(s->hidden_disk, errp);
>       if (ret < 0) {
>           return;
>       }
> @@ -365,27 +360,35 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
>                                   Error **errp)
>   {
>       BDRVReplicationState *s = bs->opaque;
> +    BdrvChild *hidden_disk, *secondary_disk;
>       BlockReopenQueue *reopen_queue = NULL;
>   
> +    /*
> +     * s->hidden_disk and s->secondary_disk may not be set yet, as they will
> +     * only be set after the children are writable.
> +     */
> +    hidden_disk = bs->file->bs->backing;
> +    secondary_disk = hidden_disk->bs->backing;
> +
>       if (writable) {
> -        s->orig_hidden_read_only = bdrv_is_read_only(s->hidden_disk->bs);
> -        s->orig_secondary_read_only = bdrv_is_read_only(s->secondary_disk->bs);
> +        s->orig_hidden_read_only = bdrv_is_read_only(hidden_disk->bs);
> +        s->orig_secondary_read_only = bdrv_is_read_only(secondary_disk->bs);
>       }
>   
> -    bdrv_subtree_drained_begin(s->hidden_disk->bs);
> -    bdrv_subtree_drained_begin(s->secondary_disk->bs);
> +    bdrv_subtree_drained_begin(hidden_disk->bs);
> +    bdrv_subtree_drained_begin(secondary_disk->bs);
>   
>       if (s->orig_hidden_read_only) {
>           QDict *opts = qdict_new();
>           qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
> -        reopen_queue = bdrv_reopen_queue(reopen_queue, s->hidden_disk->bs,
> +        reopen_queue = bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
>                                            opts, true);
>       }
>   
>       if (s->orig_secondary_read_only) {
>           QDict *opts = qdict_new();
>           qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
> -        reopen_queue = bdrv_reopen_queue(reopen_queue, s->secondary_disk->bs,
> +        reopen_queue = bdrv_reopen_queue(reopen_queue, secondary_disk->bs,
>                                            opts, true);
>       }
>   
> @@ -393,8 +396,8 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
>           bdrv_reopen_multiple(reopen_queue, errp);
>       }
>   
> -    bdrv_subtree_drained_end(s->hidden_disk->bs);
> -    bdrv_subtree_drained_end(s->secondary_disk->bs);
> +    bdrv_subtree_drained_end(hidden_disk->bs);
> +    bdrv_subtree_drained_end(secondary_disk->bs);
>   }
>   
>   static void backup_job_cleanup(BlockDriverState *bs)
> @@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
>       BlockDriverState *top_bs;
> +    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
>       int64_t active_length, hidden_length, disk_length;
>       AioContext *aio_context;
>       Error *local_err = NULL;
> @@ -488,32 +492,32 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       case REPLICATION_MODE_PRIMARY:
>           break;
>       case REPLICATION_MODE_SECONDARY:
> -        s->active_disk = bs->file;
> -        if (!s->active_disk || !s->active_disk->bs ||
> -                                    !s->active_disk->bs->backing) {
> +        active_disk = bs->file;
> +        if (!active_disk || !active_disk->bs ||
> +                                    !active_disk->bs->backing) {
>               error_setg(errp, "Active disk doesn't have backing file");
>               aio_context_release(aio_context);
>               return;
>           }
>   
> -        s->hidden_disk = s->active_disk->bs->backing;
> -        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
> +        hidden_disk = active_disk->bs->backing;
> +        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
>               error_setg(errp, "Hidden disk doesn't have backing file");
>               aio_context_release(aio_context);
>               return;
>           }
>   
> -        s->secondary_disk = s->hidden_disk->bs->backing;
> -        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
> +        secondary_disk = hidden_disk->bs->backing;
> +        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
>               error_setg(errp, "The secondary disk doesn't have block backend");
>               aio_context_release(aio_context);
>               return;
>           }
>   
>           /* verify the length */
> -        active_length = bdrv_getlength(s->active_disk->bs);
> -        hidden_length = bdrv_getlength(s->hidden_disk->bs);
> -        disk_length = bdrv_getlength(s->secondary_disk->bs);
> +        active_length = bdrv_getlength(active_disk->bs);
> +        hidden_length = bdrv_getlength(hidden_disk->bs);
> +        disk_length = bdrv_getlength(secondary_disk->bs);
>           if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
>               active_length != hidden_length || hidden_length != disk_length) {
>               error_setg(errp, "Active disk, hidden disk, secondary disk's length"
> @@ -523,10 +527,10 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           }
>   
>           /* Must be true, or the bdrv_getlength() calls would have failed */
> -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
> +        assert(active_disk->bs->drv && hidden_disk->bs->drv);
>   
> -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
> -            !s->hidden_disk->bs->drv->bdrv_make_empty) {
> +        if (!active_disk->bs->drv->bdrv_make_empty ||
> +            !hidden_disk->bs->drv->bdrv_make_empty) {
>               error_setg(errp,
>                          "Active disk or hidden disk doesn't support make_empty");
>               aio_context_release(aio_context);
> @@ -541,6 +545,28 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>               return;
>           }
>   
> +        s->active_disk = active_disk;
> +
> +        bdrv_ref(hidden_disk->bs);
> +        s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
> +                                           &child_of_bds, BDRV_CHILD_DATA,
> +                                           &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            aio_context_release(aio_context);
> +            return;
> +        }
> +
> +        bdrv_ref(secondary_disk->bs);
> +        s->secondary_disk = bdrv_attach_child(bs, secondary_disk->bs,
> +                                              "secondary disk", &child_of_bds,
> +                                              BDRV_CHILD_DATA, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            aio_context_release(aio_context);
> +            return;
> +        }
> +
>           /* start backup job now */
>           error_setg(&s->blocker,
>                      "Block device is in use by internal backup job");
> @@ -646,7 +672,9 @@ static void replication_done(void *opaque, int ret)
>           s->stage = BLOCK_REPLICATION_DONE;
>   
>           s->active_disk = NULL;
> +        bdrv_unref_child(bs, s->secondary_disk);
>           s->secondary_disk = NULL;
> +        bdrv_unref_child(bs, s->hidden_disk);
>           s->hidden_disk = NULL;
>           s->error = 0;
>       } else {
> 


-- 
Best regards,
Vladimir

