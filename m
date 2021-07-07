Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A743BE882
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:02:47 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17CQ-0007iR-Fw
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m17BN-0006ri-SG; Wed, 07 Jul 2021 09:01:42 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:44163 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m17BK-00082x-SK; Wed, 07 Jul 2021 09:01:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfMA0lv/XlDKMf3GqtYqpJjigvK584beg3vlSJTLOHtkOKTggvswNvpv1yN3wLJKv1QykZgcsWngFn5EEhrcJfShp2UN2kDWEfMf2Za3PItOtPnkBZ53iG28TQg831JvardZU3/cBmn94x83Wt5qo9io+QjQOsCaZMm4kBSD3hk0/d/fYlQkxV6oIcKXSXI+Ebod9Hq3NRjo2ifGgFYlBbgkeL4ET2vHYwixREfDKSWUBtJKKz4Fi1zAVvFSALdMRZdEl/FyHrGMJ6tPBuqiJYDSTuPQ152tZbU46Jn2l25/sNKf2b/5GkSRzd9BY3BwYCX/LdRWbLOnRrxUhWDE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHYu5ry04I9xvqqgn0X0HUamK1Q39WBfxZhtULVHEZI=;
 b=GkQB8yV14q5altbjIXHlCCg5CcOfIYvnQy7zAYuGkrSlrVEmeYVSj5Nej0u8u49j4F+5d/BvmDnu+ckuxunG99w+MoAvOgw1NWp9NE6APBrUB/SzfzdKOQq/WnnIUC3oUGn4b9BoNRbWotLuz6OmUVJIv4fTrasZBT+YyZNv5VkDfXAMffRwbuLAjCRMvF5ENQ935jtFmmuzJ1idB3t/2BPPd8zo5U8vO7iZvmyT/AlfMbTGU2qLMeec3h2H6YHM+dg6ZCf+TOhJLpwod/Hx5SEUki4TXolx4GxkPWI8+0PvoZDfJPi3TXYmlzTpD2jTyrKWvpk3bADWl28y4JZ0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHYu5ry04I9xvqqgn0X0HUamK1Q39WBfxZhtULVHEZI=;
 b=j8rZpiXFxP7rU5T/Eq9JNjk3SQXs4emIYZOmjuuECJPRIWjzctkjmYxbZN3+910bvztHiCeuBwUU+kAGZhHhdaB3Cjj40hWmF261vNmwYWdc/ugy2Ct8QlT+juEaGMZsPb5tycKp7UbAC5pHwRxZ52b8ydWNYp08L9Sy94qiw1A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6855.eurprd08.prod.outlook.com (2603:10a6:20b:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 13:01:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Wed, 7 Jul 2021
 13:01:33 +0000
Subject: Re: [PATCH] block/replication.c: Properly attach children
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210706181138.1c0bacd8@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3dee7e1a-00ff-5f98-fb22-ffb248e1094e@virtuozzo.com>
Date: Wed, 7 Jul 2021 16:01:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706181138.1c0bacd8@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0285.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0285.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 13:01:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ba64dca-476f-46a5-51dc-08d9414758a0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6855:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6855BECF39281ADD19223E8AC11A9@AS8PR08MB6855.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tMJyeYb6aHLcZBrnfwol54JWNO42a4VSeDtF30tMpgP9HmPUbMfu2N70x3D237OB0GXnEA9QxEHBuKfKQ21xpjtqsuG0/bRXh5PS5IjCOAzgoz3gbP9ODa0Yc0m2Hh+sMbGLoGShqgv39QggHcmIY4jYClbxPug9NUhRS7OBHfrLg8naojB2RJ/xszVTW5u0l+fCI4+ldOZNwY+CNwnS6RdrQvRgyGcZfa6NFDcnMwYeXJ5Bv55RdFqvOXQn0JST3/wOOOxR/P15wLx82KkSe+/vRQmB5dbwpB9Q9uzbsfTxl7a08mGcH3hf6T8qaBLtPZboQJYVqUT3IvhRKeo8M5OCQ1f4sZ452Hs+/6FDZQfjm61F0Q8qVx4TWu7DPNqbdbOXcZrttzv5vVTCvc5uSVaqQiFvh3l9b7d/pyw9FictHvQQpUMTmwSwVSxd/97cYGIahKgaoGjZofTSMtOb2Me/wHLDa64irrNPp6godlwtSaxuErEjPXgCvyN8KuA6jL45zLb1Mm8UmS4vqFJ/50rt28bA76NYgtSbhDVWdK+/zcB55X/N1E7zzWQZiXOjTt2rqwmbSECTvRzAAiP60H9OwkowhekiwzoI2yxX8O8DiwerQJmdPRwgQCKybI1c1N7YIwR7gj9n+QrqccaHiHMq4VP2kbAp3PF+J3XqBy3Hmz+FDzsCgs8OXm/vwId6UGNJkqn0U04lfblwQDYc+PNO8UIB1vrGhqw9KUu7wBj7vhXaHPTOY3HGv4guayg1m83D+ywJYpf6awbV+J1b1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39830400003)(366004)(376002)(346002)(31686004)(83380400001)(36756003)(110136005)(16576012)(54906003)(86362001)(2616005)(38350700002)(31696002)(38100700002)(66476007)(956004)(316002)(6486002)(66946007)(478600001)(8936002)(26005)(52116002)(5660300002)(4326008)(2906002)(8676002)(186003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?2tUADB87Ip9FguNG8XLODOdC+fLAhSP1rTz1olFr2qBZVh604tZ2rWtQ?=
 =?Windows-1252?Q?PlfK46nmxFrrtCsVtts8YKW3KPXs5n+WZS9Q6Ur3gHwcAZkbCpg+nK3o?=
 =?Windows-1252?Q?qGy3PTdDVvYeKSSfQAjlQXw73tt1K1buefucTr+u17tvGvSbsCewzbBb?=
 =?Windows-1252?Q?Am5zpclq8p86oPdVLOZQxrC8Ee4PFBsM5jkdpI2XOJ0ceE5W+uNu6SpJ?=
 =?Windows-1252?Q?FyKYh//ZN/Vwpt+u9P/mlU3hpSjcMbx99gPL8IJb3sJcLIXNzVt67RMk?=
 =?Windows-1252?Q?pthaA8rfi9zqkH5Dx3tyzmstf4OIXO4aGQoKxD+a++V5Vo267ec1VRrb?=
 =?Windows-1252?Q?a/EPAPn2z61w+Zc7XPQKV1GixL8+hV2D7nm01yq6mDcl4zxSkB+5bskQ?=
 =?Windows-1252?Q?NzIp+DNjmbrZ1AmrYZlA/k2SPRarddqUgl3xycX5kUcxkxCOAXpTilgi?=
 =?Windows-1252?Q?9GPUt1v/END/fHD0WkCHbdAet+znaXH2YBSDI5zGveVm2a0ELfXVOCXQ?=
 =?Windows-1252?Q?kxWvREIcvIjfGElu7fYLsnpr24KgLJXJF5ypmQJLW2VEF8ICwjpY4pDd?=
 =?Windows-1252?Q?D7SiT8Ol/LqceTT0QOeT8G5d/VieoAGZQZsSeNN/e8I4cQovsKI1s37P?=
 =?Windows-1252?Q?6jrvz/9+LrWS0QJfA9Dt7D+1AgbmvvmJhT8c+vnRnjNVZ+IWQTcAtFad?=
 =?Windows-1252?Q?9zr/PoqHL8gacdf/QA1FWmKmHtIffB3cDOLlpun9QQRZ9VKVCSw+CL1o?=
 =?Windows-1252?Q?0jNQ4RQAoxHraHb+nWuRaRy+fTNpJ/9+yuO6KRuLLrA8N/va3xiPR1z/?=
 =?Windows-1252?Q?6G6/4CsOKP4e6OG7tNXS/06T/PsaTxdPOoNfQ03pN+Eu0iY8kZ6W2v3q?=
 =?Windows-1252?Q?SH2wGRrveJn311X05sO7y9MNfA+swH14oPCjjSXxJsQ7UL7S4BQog8Mg?=
 =?Windows-1252?Q?g4ObGWm0AVZtMmyvVlslvKWBjhTHdknX/CJFJQquQZsxN2SueV/GF7Pz?=
 =?Windows-1252?Q?DKTFVGF4aFKABIOkQ7M26HXtv/XdIcMk6kNJmiHmSNh9Vzf6VTlspyRg?=
 =?Windows-1252?Q?XFZerN1m+caLFtN3f0UO61Jh30gsWV6KxY1SATunDMT6GPH5HCyJvyrv?=
 =?Windows-1252?Q?e3Xq9VkRKxyfV08J2GjDib598WEYYU4RDNQELY0Q1/FbmYuGpap1dbIo?=
 =?Windows-1252?Q?eLFLSb7jMqLve5i/FyYOcZAqQ39NK/tRSEceniOu+7fZb6XrV3/kjeDH?=
 =?Windows-1252?Q?FyVMeVLPY561b/oz0lkTWAUDAyyDSIaeJmUIq3EkryjRS144fz6v/nCz?=
 =?Windows-1252?Q?X1GIO9eqvObwWJWpzy98huA2atfTJYVrck4x4Aoco3xnixP1TGeLvFM3?=
 =?Windows-1252?Q?5IibGgPBNGC0YFHcwgXs1MaSqDo8vwZ8LQArVUHSEyJKZT/5RZ0DhW38?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba64dca-476f-46a5-51dc-08d9414758a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:01:33.7310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UivysekOcrwEobTfPVHMkA9CIOtif89KBwWUAEk3bvqODocV8Eh6PQ1U7UPMDrkoxszGL3r9+FJwdZkacVpYRA4EeBc8hqaXuZqnpPfUZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6855
Received-SPF: pass client-ip=40.107.3.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

06.07.2021 19:11, Lukas Straub wrote:
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
> -v2: Test for BDRV_CHILD_PRIMARY in replication_child_perm, since
>       bs->file might not be set yet. (Vladimir)
> 
>   block/replication.c | 94 +++++++++++++++++++++++++++++----------------
>   1 file changed, 61 insertions(+), 33 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 52163f2d1f..fd8cb728a3 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
>                                      uint64_t perm, uint64_t shared,
>                                      uint64_t *nperm, uint64_t *nshared)
>   {
> -    *nperm = BLK_PERM_CONSISTENT_READ;
> +    if (role & BDRV_CHILD_PRIMARY) {
> +        *nperm = BLK_PERM_CONSISTENT_READ;
> +    } else {
> +        *nperm = 0;
> +    }

Why you drop READ access for other children? You don't mention it in commit-msg..

Upd: ok now I see that we are not going to read from hidden_disk child, and that's the only "other" child that worth to mention.
Still, we should be sure that hidden_disk child gets WRITE permission in case we are going to call bdrv_make_empty on it.

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

So, here you rely on BLK_PERM_WRITE being set in replication_child_perm().. Probably that's OK, however logic is changed. Shouldn't we always require write permission in replication_child_perm() for hidden_disk ?

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

That kind of staff may be done as a separate preparation patch, with no-logic-change refactoring, this makes the main logic-change patch simpler.

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
>       }, probably it could be a separate patch if it is needed.
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
>   , probably it could be a separate patch if it is needed.
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

Ok, the point of creating hidden_disk is to call bdrv_make_empty on it.

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

But s->secondary_disk child is actually unused.. No reason to create it.

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

For me it looks like the good way to update is:

1. drop s->active_disk. it seems to be just a copy of bs->file, better to use bs->file directly, like other drivers do.
2. reduce usage of s->hidden_disk and s->secondary_disk, like you do in this patch, using local variables instead. Also probably just drop s->secondary_disk..
3. introduce a child, to be used with bdrv_make_empty(s->hidden_disk)

And these are 3 separate patches. 1 and 2 may be merged, or instead 2 may be divided into two (to refactor secondary_disk and hidden_disk separately)..

Still, I'm not a maintainer of replication, neither I have good understanding of how it works, so don't take my advises to heart :)

-- 
Best regards,
Vladimir

