Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF793C2039
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:50:55 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1lHi-0006N8-CP
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1lGO-0005Q6-7o; Fri, 09 Jul 2021 03:49:32 -0400
Received: from mail-db8eur05on2119.outbound.protection.outlook.com
 ([40.107.20.119]:50622 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1lGL-0007KW-Gv; Fri, 09 Jul 2021 03:49:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ36NAmvdzBoQSy/SwmLrgle7qU14MyJyy+d+foPBEjZBJWRz9RfbJ83tgDnYOIIk+mcmk9aFW7cWhzRiJGBYkiXkbWF6Tr54WtKHiAtS0vBx5ZqtwoGHyn2ayps374PQKdMaEjAT1Tm+OPB3iEhZOa1mguFkHYNRn/R50SMYzSpOpJrIxHAk9INDwNDrylFvqnewrgIKQbNBJPeJDs7i8N40gfHyhJnFVHSQg08Omczm50CCpkAPmvLxstLxRKCa/+ObUCex53ixuw2p1Hc/tdRdzp2dqTvqmy08C/tVFYElised2IYBytdSMWIlwAcBFsDj0QB6F/Qddx6R+108w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE+i0QzPt/2DNdAAE+n94iK89f5Y95WtswfD5hBr1JY=;
 b=QzAKjNuH+ogO/p1MkQMvSbYC4wt8sDasUjUjH4400IGaNGwd5vC44HloosVdRUbHkG23yWgs9TzngIkarct2/j4Ay+XOahZlSs1d02O9TYxdbqlleeB/CQoqittzU0r1qcu1hFlf3Uclq0qjjCV1A1PDKx9WeLUkxjmFIz7kHPpOwBNSf1JqdehFaiIh0Xk5fWjufBaVLctmgjPEWmaqZPo+Bfwy6JbjDZx1b91FwF4Ab1BBs3GiVYGapWPlW6XYzqCgaAi4Q7Poh4ea5pplBg7PcQI4YIQxBfAmHnb16WVnmvSZSOVmCVz0OBnx/cUWTMmFrCk2Fu2p2gpwWMRQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE+i0QzPt/2DNdAAE+n94iK89f5Y95WtswfD5hBr1JY=;
 b=t7zpWXWzrvsq3RZayVBqlCZXQdPZvAISv9XaGN2ovffB5LqDe7rFFyypRI31rDWKiq71odbZejG62jrVEaF/dhRTQFRKyMj9/bJ6dQEUgXHalQZQmWbjgp1r6PNCnIbpiixFSlkhCYr1osVXoho1uT6xw+E8QnjHQgXSf0OpG94=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Fri, 9 Jul
 2021 07:49:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 07:49:26 +0000
Subject: Re: [PATCH v3 4/4] replication: Remove workaround
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1d86fa67-930c-2a6c-ab01-37a798c794d1@virtuozzo.com>
Date: Fri, 9 Jul 2021 10:49:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR0701CA0050.eurprd07.prod.outlook.com (2603:10a6:3:9e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Fri, 9 Jul 2021 07:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d57ebd2-7771-4688-75ff-08d942ae12f7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:
X-Microsoft-Antispam-PRVS: <AM6PR08MB421560D4BB6B8B2A97B1FBCCC1189@AM6PR08MB4215.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sURlVSiFXJz0h0H94bwZNMV5wDEuWiPIRo/uaStxjbMTTzzL1RBpblq4JZowz6u92XWBXM/gBdAbQNTFV30DqEElR1XY7RLQkuqVWIBuEXbgOc2YCk5MyFV3Roz1wobZMyeKG5cXqYrelz85AtVDNRDNmMldqPe66cOiIFMnq8yC2qi19hcAJSGBEeGpKlcYOZv32HMPv6TRh9rwWP6peTs4dn+qRtnm5TgjXbzPAF5pV1FpFFGMXeH/QNZhSv7RVneSfBHo1NORUo0q2+Y1zKb5dhZNfKFAmUD7zrJkaYyZNmjPylteSIXBjCXiKvQS92xX0tMKEptcMPlPibDM+9XN62Nf0ztT5fq7BPKR0GAEdV6m1S/ZSHJ7MFQWuqZk94tHo1tVxpcO+m0AIWnOZiNmBBWx4RoNqhX/0EUfgshhXnnLBIa4LuJ2TlMzMHsLtZuifkQRvLi2G6lJYZ3CrezS5HjmAJSsgxL6eW5MaXavqKhCs5GjU+bi+ishGwFUJnVOb8IzU3VGR02vq25AoFhJs5ph2crdeQwZNPLJ0JYemXPMQLaReHPvqtLypvmCfaUf3HUQn2eJJVARurS9hqj6r8v7D00eyegLq9drVxuQxBB3Tgco5RY0e79X442CofopsRm+tqI4H3vOhJkKyGKAV38NVgAFFWVsTXIqZ1+LYdICaSqhgGqdAPODfS+SCFa/jmIebzvMO4irZP9VQBTYmt6B3yjSHJVHn+VQ8zN2xOa8OVAkDJm8lKfp1LLbsu+U83lBjBidxcRl4hkkZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39830400003)(376002)(478600001)(956004)(36756003)(16576012)(5660300002)(54906003)(2616005)(6486002)(38350700002)(186003)(38100700002)(4326008)(110136005)(52116002)(66556008)(66476007)(31696002)(83380400001)(66946007)(26005)(86362001)(8676002)(2906002)(31686004)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Er01TS5o9RYoR0JiUWKfKiVd+zs0ikyyvcK3gypZ/EBZCy8I0sIfu7Jg?=
 =?Windows-1252?Q?gcGwUfWlGKjeTsrUJ9yY45WKgQpICdORr113cpdagm237OgGw/W4Yavw?=
 =?Windows-1252?Q?wd53HTS2GfSv7LgJ3pPiSJ2VSuIyU/uvS3fL5OBLy8VCk1Mq3LZYLNw2?=
 =?Windows-1252?Q?9Y2Iz3IUwGgSFQiYXh+9vBVRPP9Bsg06rRGDu4NQGaCKV8F1npTUyeqW?=
 =?Windows-1252?Q?gEaCs6caDviBkKG9Qhn8OGbLTMynHQFzHwID9Xz8D6Jdy7FzqDnaBZrM?=
 =?Windows-1252?Q?ia7zADaZvUDFhe9OJr+fPdXNt2TENEqHheGq5R3cxe4d0euA0fhhrpby?=
 =?Windows-1252?Q?4bUiQlgg3vQJhZbwr9KNjmvtijuvhUvNyF4wJAlp/ZYegmNLdSYKgRuj?=
 =?Windows-1252?Q?zU1SqDRKNCePZ4XAOJ/PnOTnHzRPHV952Au/eiXBPXnBsc7u6+QwygAN?=
 =?Windows-1252?Q?RGaE19QJhDGXogXfR/X4IiJZcM4zgUCgggqvKg/vgq66guQKnLNMgH9H?=
 =?Windows-1252?Q?rIw6tHd0zzPFYY9kcWwaeWUdNVjh0EXZjdEBg0ki/B0EdnJ6i7+dEwFV?=
 =?Windows-1252?Q?KY55E8EQSXwjLr/8eF4kxl41TCBWKJFbQACyVCAJNCDK+RoM1thjRMKZ?=
 =?Windows-1252?Q?Qfj9M4WwD0TicbRIDyoXCJrSAW7bTljwLJTsM9/A/SciAjV1110TeIip?=
 =?Windows-1252?Q?tM9/eF4Q+fQI61w0M8yFpM7+4BxITZrmT9NBXvjr60BE58+wD3nt9qGp?=
 =?Windows-1252?Q?5ULTih2DoIZxC077gWaccEZljmbPvPN4S0O/cgzoxet42aC/IkJ8TIBS?=
 =?Windows-1252?Q?jOUaBqotW1PRItJupZ4gQFxCC/zMC3Ik8cW6CD8CDeLST2qzr6AwoMmv?=
 =?Windows-1252?Q?IFJDUy+bq9o0ItM0iAd3nR/AL+mmaEHwa1OYk81A7+rNZXvFgp50eDpo?=
 =?Windows-1252?Q?M1NA/djBuF9g3EDjzG54uph3QsUwHtx2r5/WklmmI7HrDlGptWywKD8I?=
 =?Windows-1252?Q?jeCQs0szhEtmv4REBC10GkjnwKDX/In2M7MM9cv0hFX9sj0YHF6PylXR?=
 =?Windows-1252?Q?e3RPMmH5w1qlPQXEIXQKyuWfQWYAAcaJ4iZ01OMOpRmOeOdheJOgWks+?=
 =?Windows-1252?Q?iKqyh9tUxhqGdOAFea12tyHF3vq7nAjG82hxgvh4bNaRGndavtXxU+hm?=
 =?Windows-1252?Q?8YcdesslCvffTs9kbnR9KVDJyRZq2O2i8RZ66sipNpF6qLJRofpz7SNg?=
 =?Windows-1252?Q?VIPFViWXrESlq3H2WC6onJ2wg/VJtGqza/igaCs7I7uWkFcVKrctelr4?=
 =?Windows-1252?Q?6zJ4IfV/u7eQGqGEJu3CQdMFWmkorbwsmp8SJBmVRewm++csPsNnAL2a?=
 =?Windows-1252?Q?IT6c3TKySCHQqIX3cG+TrunuqQqOM2qkJl6X20rtWK0Z+JUxNCm3zr0g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d57ebd2-7771-4688-75ff-08d942ae12f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 07:49:26.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqZpiIRN0upVATMX3t8B0ObozIeEyUMHcB44Y4KSVjd/SRvjeeIvqWvaKI4qkWIK+0OGfw9tGyvpDKYDzX5WvHvAO0762Ss4dgmkPQrrQxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215
Received-SPF: pass client-ip=40.107.20.119;
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

07.07.2021 21:15, Lukas Straub wrote:
> Remove the workaround introduced in commit
> 6ecbc6c52672db5c13805735ca02784879ce8285
> "replication: Avoid blk_make_empty() on read-only child".
> 
> It is not needed anymore since s->hidden_disk is guaranteed to be
> writable when secondary_do_checkpoint() runs. Because replication_start(),
> _do_checkpoint() and _stop() are only called by COLO migration code
> and COLO-migration doesn't inactivate disks.

If look at replication_child_perm() you should also be sure that it always works only with RW disks..

Actually, I think that it would be correct just require BLK_PERM_WRITE in replication_child_perm() unconditionally. Let generic layer care about all these RD/WR things. In _child_perm() we can require WRITE and don't care. If something goes wrong and we can't get WRITE permission we should see clean error-out.

Opposite, if we don't require WRITE permission in some case and still do WRITE request, it may crash.

Still, this may be considered as a preexisting problem of replication_child_perm() and fixed separately.

> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

So, for this one commit (with probably updated commit message accordingly to my comments, or even rebased on fixed replication_child_perm()):

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> ---
>   block/replication.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index c0d4a6c264..68b46d65a8 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -348,17 +348,7 @@ static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
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
> --
> 2.20.1
> 


-- 
Best regards,
Vladimir

