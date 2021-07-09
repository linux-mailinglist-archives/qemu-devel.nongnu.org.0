Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3F3C1FDF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:13:41 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1khg-0003gX-Ie
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1kfV-0001Kd-M8; Fri, 09 Jul 2021 03:11:26 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:51265 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1kfS-0005Zf-A2; Fri, 09 Jul 2021 03:11:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiIojIh2O8bhJT9l1NNKcRkBgmJxglUbNmTRRoaA75NDLECdv43QRMCuft0qHSQ7BulXEIjrGjvLQ3RbsFE7kz//29w1/gg0wg6mX1HODxgXDQrHtmBvyNPml/v5AaHsXse6qtts6aelJshQYJphIo0jhmv8FAvQC0KUJB//aEWDwhcl/GL1SAnEhR0LLb5DlI8Z0uvmsmSxzLErd12TxpYC5Q37gYH1FfAgqzskX7+MMr+v8RSQ3azxr4n1KVojsodFWMvkOCgvWgPwBlKmWX0mZkfXzSTOz/5rasRuriQjabv5AGjq43WIZSlqIwVVcJa48qGpoY+DyVw9Uk6uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IivqeQX7JuHueBiYQAtc68oPnhi5OCB+mNAYqqfO1+w=;
 b=PNbeKpko9CctYyMho0lMssOtP9asspFbdSxFT6f99zzM5IU2+qKT/fPeCnbU/WBWwFCr4qq/QPXBuy5HhBFwQV9we4qJa8etB4iN/s85r6rgneVmur5HaHQQS03inMn0pzFNGzi6NGqlkl5vWlpp8zNGQys2X0no/SwiVCzQisSD6uVKPn4JWScB6SHyTpfF72O5cGcFPav07VP9Ji5+jZQGpBGFJEoGinMzjW2sIPY/rf7I+cjQa8oopAF4hCZizq+fzzErStdlkpSTBz5Efs8zUZ/kY11FlSEuqrW/9n+b+HZuBBjdSFJeLgSlJiRKUEiU8TgmSjHMNDj+5YSVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IivqeQX7JuHueBiYQAtc68oPnhi5OCB+mNAYqqfO1+w=;
 b=Hk9lcmROB+bT1pOelH6wZMBPQbJW3+8NRy5klb9LAMYEHSEzPei8QmiIasKeYj2IGxHBC8v01BOVuIZ0ceAfQZpAnm0mt5BXEGxpYqtcwTvZ0x8RYWxciJkO462igWSbPB/e5czKG6qHNvilZtGhBc8He/iLEkFlRdFgynSQbiQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 9 Jul
 2021 07:11:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 07:11:17 +0000
Subject: Re: [PATCH v3 1/4] replication: Remove s->active_disk
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <dd6c3cd4bc77138918c31d590569bdf77b7cef0b.1625680555.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2351e7bf-f664-9c3a-126f-4741449ce0dd@virtuozzo.com>
Date: Fri, 9 Jul 2021 10:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dd6c3cd4bc77138918c31d590569bdf77b7cef0b.1625680555.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR09CA0080.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR09CA0080.eurprd09.prod.outlook.com (2603:10a6:7:3d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 07:11:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 286c836d-2543-4ad4-b26d-08d942a8bf1d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309ACA812D193CD3E602FC9C1189@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGF+X/wvo/p8szasQ8n74CUfWvyHjCBb7BubrcfbXBS0ASiAWMZfeNvwUGfLxW8u6AqrMJ4t9mcV0CWq18sByqH4eicTARxpxD86ArwkisqnNvVR+1R/HthwCIcAY+HxXgpJ2twGgFF/05j709enaBbrRR9FrsKAlcWUpDqBVYTshnxuSDrSCwiH5UgnX5qf5HZLtVxz02VebCY0NCYjYhU3KpdreGbyurGINgyJ5TRbNK3BVQauOxZMvpMcEq4KY3sIS58uqqyLIDtbgNrq6uouk7MMRnhS9e298zEMTc2+crR8xKTbqfdATXFyDt1VY6Z0FhQ7bLB42Ea3BC0J/AsnUPMHau7iXiV1gRq5JBrHozXRbAHkMIIG29Y8o3BJmKgRQ9P20BFapNGZLlEzogjUPYNFXTYewEcTmTWfaDNskrKKxctOgsylzEAmjddJOlujtFKW5xoDYfbddGiHyWFk8JT5BLpyTH8RGXb/YC+gH2Fd1JsYD5aolJ4uhI90LaV6RO/Yf27VJ0qv5FyGLCFxoSInAwmqrZ+eO5sCPXwqTKX0dxmJassC+EnEKrv/wmWVbt2ybh/zYrpW74MZzxn8U9xzBAHW0EprA1pLX2rkNJaPe+PWkaBAWSxPwiXHnTRqggn9nMk7XFSwZEt8RL4M/7d2U4G9kjjiOzmYi1sodrc7gdJ5MRPOsYnQb1Zs/3xyOgh8W836jXhGqbsmHwJjk0sfYz7A9tHhYY740X2xzlK6BD+RncDll/2BqmWVTeTqxpESW5W7ICeO/6ZVFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(376002)(366004)(396003)(136003)(66556008)(66946007)(66476007)(478600001)(2616005)(31696002)(36756003)(956004)(186003)(83380400001)(52116002)(8936002)(4326008)(110136005)(31686004)(2906002)(26005)(16576012)(316002)(6486002)(38350700002)(38100700002)(54906003)(5660300002)(86362001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?nxupWQ6KiOj5QCpjw39JrHq8AzHpQrQXIR9lDPMXedNT37bWzthFS6Dl?=
 =?Windows-1252?Q?/Ena4beRBLmTlFlgJAZVXarykmTRpQz0cQWvkbKgiWxOXMb09EacZmj3?=
 =?Windows-1252?Q?brBDmucH4yG7/DXpkBgmHJFWCd7dCYbIOXjEkpsheFYe/dBTxjVvJLa4?=
 =?Windows-1252?Q?iT2lABJa8J4nOTAzve3R44HGTfLZ83TC2A5JzD27K0LxBshu+MkYbaUU?=
 =?Windows-1252?Q?2hAbPdFTalFXKDmpx+fbqAJys2jneyMkN3mFtw6iKkgCHssal7sO9/0D?=
 =?Windows-1252?Q?KBvh6u/H4JE9jioPW4u1HUP3XgbnPI9hU1MCJeIgj2TaXRwksU8TX32C?=
 =?Windows-1252?Q?YGTikb5ubYNBgU3tol3HKxRh2HB+4bSNn48oUhH84SZX//IsbdY6edCT?=
 =?Windows-1252?Q?D3wnChnnlj71w7DbRSPLE+c+/78c294zyzxNh4DeQgBRPevViuICJ1NA?=
 =?Windows-1252?Q?kP3Al1ID1blAqlvHlbMgQIOc57Y9yeB4ZOaDftC1jA0H3fGrGvplXDGo?=
 =?Windows-1252?Q?JByyjFBCpciO71FDP7wtZckpRIEOGK8XUUnqWD92dj8D5qMO6HrnJvoP?=
 =?Windows-1252?Q?KwXTIQlG4kaGarwlVR140Rbo1WCLEzZf+fqc/zkVv/Vv5MnuP7jvJ0LN?=
 =?Windows-1252?Q?MEO0U+KimD4LWGYZaSlLUetH342gXtHpfecdCHKi155vMYwiPvgD/4cE?=
 =?Windows-1252?Q?KnO++rPTMn6nr8zJ+TjMP7p512vaF4j7aRpdDMQRXkCNQpKBTKfDxUAy?=
 =?Windows-1252?Q?kwoHSEeAF7RpgWVCQMrQGQ84bKG9pBQiR+qG8eqYqe7QWdKh/9kkXOdC?=
 =?Windows-1252?Q?a8X3ShRP5YWzT2H5BxEHLSBsBR8UF3Ufy4pgEy/4XkRQ0tMIR2iyibyC?=
 =?Windows-1252?Q?Lnd15cQMWTUVYWBm30HTXZC8EKPGhc6l75x/30dBtY6qRZ8+F8Iqdwnq?=
 =?Windows-1252?Q?T1a3y1gJmZTqfeqr0L3jcb98YEAAZ5RSDQBSgduCx0s3/e5f4I5KkS5I?=
 =?Windows-1252?Q?PabQl+THleDmzcSYpjUDxrxPTpEcbb634O2HI+GBzd2NuMXdMMGfKc5q?=
 =?Windows-1252?Q?nGEjouLXkuMB3ImcWq4bJfY8PymNSMeAA7z0vv41O4z1hIWwR2IFhjfR?=
 =?Windows-1252?Q?FJeA0sFTGEWaCdBPK690QQIAsimj653314D4F5WNRnIvGLkWc3jPhgfk?=
 =?Windows-1252?Q?sr9rHp9PVgkiNhMhVYlGkSG1RAttteGCSuTBdUTbaTffOHv92g9DVn8/?=
 =?Windows-1252?Q?EzeCafOfaR9pJSGXXNWYHiyUCedLKTMpPbNB1SsxoGAbLEUJu4c+AYL9?=
 =?Windows-1252?Q?jjk4M4ODyQTu24ZwYAuqFCY0dhlZ/PrVMb19Vkg5hjkkTovqFS/KnPBs?=
 =?Windows-1252?Q?CSvNEjjr9gJsu0iUOXEnOS9ol4S+Nv8LN4CY2fRhpy4z+JR+xBn2//aN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286c836d-2543-4ad4-b26d-08d942a8bf1d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 07:11:17.8895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/V4kii7ymumZg7FA9BPcRwAMN+Ik6w25kRu/O2o1oRIE8BadGMJQgqStNc3eFbfVrcoSUwgTfFBElEy7GG3y15DMoUp73toRvzLAkkbcaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

07.07.2021 21:15, Lukas Straub wrote:
> s->active_disk is bs->file. Remove it and use local variables instead.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   block/replication.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 52163f2d1f..50940fbe33 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -35,7 +35,6 @@ typedef enum {
>   typedef struct BDRVReplicationState {
>       ReplicationMode mode;
>       ReplicationStage stage;
> -    BdrvChild *active_disk;
>       BlockJob *commit_job;
>       BdrvChild *hidden_disk;
>       BdrvChild *secondary_disk;
> @@ -307,11 +306,15 @@ out:
>       return ret;
>   }
> 
> -static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
> +static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
>   {
> +    BDRVReplicationState *s = bs->opaque;
> +    BdrvChild *active_disk;

Why not to combine initialization into definition:

BdrvChild *active_disk = bs->file;

>       Error *local_err = NULL;
>       int ret;
> 
> +    active_disk = bs->file;
> +
>       if (!s->backup_job) {
>           error_setg(errp, "Backup job was cancelled unexpectedly");
>           return;
> @@ -323,13 +326,13 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
>           return;
>       }
> 
> -    if (!s->active_disk->bs->drv) {
> +    if (!active_disk->bs->drv) {
>           error_setg(errp, "Active disk %s is ejected",
> -                   s->active_disk->bs->node_name);
> +                   active_disk->bs->node_name);
>           return;
>       }
> 
> -    ret = bdrv_make_empty(s->active_disk, errp);
> +    ret = bdrv_make_empty(active_disk, errp);
>       if (ret < 0) {
>           return;
>       }
> @@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
>       BlockDriverState *top_bs;
> +    BdrvChild *active_disk;
>       int64_t active_length, hidden_length, disk_length;
>       AioContext *aio_context;
>       Error *local_err = NULL;
> @@ -488,15 +492,14 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       case REPLICATION_MODE_PRIMARY:
>           break;
>       case REPLICATION_MODE_SECONDARY:
> -        s->active_disk = bs->file;
> -        if (!s->active_disk || !s->active_disk->bs ||
> -                                    !s->active_disk->bs->backing) {
> +        active_disk = bs->file;

Here initializing active_disk only here makes sense: we consider "active disk" only in secondary mode. Right?

> +        if (!active_disk || !active_disk->bs || !active_disk->bs->backing) {
>               error_setg(errp, "Active disk doesn't have backing file");
>               aio_context_release(aio_context);
>               return;
>           }
> 
> -        s->hidden_disk = s->active_disk->bs->backing;
> +        s->hidden_disk = active_disk->bs->backing;
>           if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
>               error_setg(errp, "Hidden disk doesn't have backing file");
>               aio_context_release(aio_context);
> @@ -511,7 +514,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           }
> 
>           /* verify the length */
> -        active_length = bdrv_getlength(s->active_disk->bs);
> +        active_length = bdrv_getlength(active_disk->bs);
>           hidden_length = bdrv_getlength(s->hidden_disk->bs);
>           disk_length = bdrv_getlength(s->secondary_disk->bs);
>           if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
> @@ -523,9 +526,9 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>           }
> 
>           /* Must be true, or the bdrv_getlength() calls would have failed */
> -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
> +        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
> 
> -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
> +        if (!active_disk->bs->drv->bdrv_make_empty ||
>               !s->hidden_disk->bs->drv->bdrv_make_empty) {
>               error_setg(errp,
>                          "Active disk or hidden disk doesn't support make_empty");
> @@ -579,7 +582,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>       s->stage = BLOCK_REPLICATION_RUNNING;
> 
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> -        secondary_do_checkpoint(s, errp);
> +        secondary_do_checkpoint(bs, errp);
>       }
> 
>       s->error = 0;
> @@ -608,7 +611,7 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
>       }
> 
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> -        secondary_do_checkpoint(s, errp);
> +        secondary_do_checkpoint(bs, errp);
>       }
>       aio_context_release(aio_context);
>   }
> @@ -645,7 +648,6 @@ static void replication_done(void *opaque, int ret)
>       if (ret == 0) {
>           s->stage = BLOCK_REPLICATION_DONE;
> 
> -        s->active_disk = NULL;
>           s->secondary_disk = NULL;
>           s->hidden_disk = NULL;
>           s->error = 0;
> @@ -659,11 +661,13 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>   {
>       BlockDriverState *bs = rs->opaque;
>       BDRVReplicationState *s;
> +    BdrvChild *active_disk;
>       AioContext *aio_context;
> 
>       aio_context = bdrv_get_aio_context(bs);
>       aio_context_acquire(aio_context);
>       s = bs->opaque;
> +    active_disk = bs->file;
> 
>       if (s->stage == BLOCK_REPLICATION_DONE ||
>           s->stage == BLOCK_REPLICATION_FAILOVER) {
> @@ -698,7 +702,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>           }
> 
>           if (!failover) {
> -            secondary_do_checkpoint(s, errp);
> +            secondary_do_checkpoint(bs, errp);
>               s->stage = BLOCK_REPLICATION_DONE;
>               aio_context_release(aio_context);
>               return;
> @@ -706,7 +710,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
> 
>           s->stage = BLOCK_REPLICATION_FAILOVER;

For consistency, it seems right to initialize active_disk only in "case REPLICATION_MODE_SECONDARY:", like above..

But then, it becomes obvious that no sense in creating additional variable to use it once.. So here I'd just use bs->file->bs

>           s->commit_job = commit_active_start(
> -                            NULL, s->active_disk->bs, s->secondary_disk->bs,
> +                            NULL, active_disk->bs, s->secondary_disk->bs,
>                               JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
>                               NULL, replication_done, bs, true, errp);
>           break;
> --
> 2.20.1
> 


Anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

