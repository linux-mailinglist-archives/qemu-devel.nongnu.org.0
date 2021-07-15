Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E63C9F60
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:20:07 +0200 (CEST)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Ha-0001aI-0G
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m41Fc-0007P6-BF; Thu, 15 Jul 2021 09:18:04 -0400
Received: from mail-am6eur05on2124.outbound.protection.outlook.com
 ([40.107.22.124]:54976 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m41FZ-0000Lt-Rz; Thu, 15 Jul 2021 09:18:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDUXzuMbx1gfzSAReNtU+PuUUkeiuvTBNPaio0+iqscPZCd6+ubL6jbDxOvw2TmuYSlNGJLkaGw/e/jociSq/D5MNuytijVsCHaMfunDFjVuI/3+xkWPupyMG2dxeddIDIup2lcCCtLXpdQUf8k9MYCgZPu3DPJSF1uPrTo1u2KZDvTdTOOla+Crc20L1nAWVjVCF8QNFYKwLhqh5peyd8gIojMqhJc3/I1Ea3XsbMH9grSiE6H3yyN0bp/vXrbu/nWPVrN+J+JSjiDcse1olbyUMMMzlJYfgHou8v4p98l7kgDBTheyKBZ2dP0Gj4EtA/nCAXLgozV2hic0SXQDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uvVpwjcMI87IiSijRfAFmafHWbOMgQPuZl0/EgrvbU=;
 b=XEpJm8Ez3O6xmfFlEZQqY58U+ybJDYDY6BD9TTij9fp+Kv6SabHC9UXr42/m/oUmBv8sEXjJ3hnNHseMVLAD8BLkYQII24eShUY10xlsREWd7W9SXU/0NHHHur6eXdVIl8EpUWJqI+RDgWAdV5ohpZ1xQHBcBsfLzaKG6oYTDw/0vmkWHNxoZ+PvGW6mTtWN9aQjgb7m8rZA8ixzqESpyXVFewgJh3NvkQwBKGL/ngtXPunpQ4P8oCeKIioFF+BF/3YBYlp9bADXwBsIQ7DDM+c1BV1T//OQy0TOoYhPDpMgiwf6HutsStOxH4mbNthBrWNbBRo6QSHgefMcjYhIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uvVpwjcMI87IiSijRfAFmafHWbOMgQPuZl0/EgrvbU=;
 b=W+/aeDCVogz1fnQ7BeASl+n/P87SdqSE4kS4E1wCHw7XjUWqoPPLI0jFDxVnG5A3Z0Z56YPPPdxquvz4x9wOQGo32rM2fc2tGtqGbSnu41RKs5+rzAP660Y4xnSLo9Y2KiHkpXmCyWWrDFfVvO1acXlheIYVxM0tVVfpBJ6YN+c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 13:17:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 13:17:57 +0000
Subject: Re: [PATCH v5 4/5] replication: Assert that children are writable
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1626090553.git.lukasstraub2@web.de>
 <360083cb9c08e364eb99e232b2705226b23f4503.1626090553.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f49a6d06-44d2-da51-c955-2e03702c9833@virtuozzo.com>
Date: Thu, 15 Jul 2021 16:17:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <360083cb9c08e364eb99e232b2705226b23f4503.1626090553.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0089.eurprd05.prod.outlook.com
 (2603:10a6:207:1::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM3PR05CA0089.eurprd05.prod.outlook.com (2603:10a6:207:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 13:17:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f72b114-a675-4dc6-00ea-08d94792f681
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-Microsoft-Antispam-PRVS: <AM6PR08MB29814E22A085139B8630FD75C1129@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vretGGdXkpVZBBeEzoJO3YkQBoXyG3Poktwe4+bq/NVJy/J7arhspkVxXuvlPIAbOBtpGTTSPGfErL2T6gFRj45dBVijd96az7htj1SV9iYlospa0oq4fP7Ilqn2HBARE7Gi441RRN78/yJ/hgVVOrySDYPa5fn6x7z3m+uqrfdVZ7KVTfTwUoXtl+Lnwy4Q5kiLONEufYKfws0E1sqbLZeHJDj35VrBBKyV26SM1xCOhiQX6at/e+y0Ia5EuG4ZtJIUlM+XeDHtIktQVQmwLYjiBHptGiSdhdv+sW9uGK/g/agZTVetK6kRUKy+baRHpEo4/QTkld5Avl4ILN0rStlYZ/D1yONzkfjTQfQjaTk3Bs1vO07xxasgz6HBtTHyS5DSseGQaK8ZkixfgcCQXYif/qC5igH0e/xSKbmxv+2LnNpgm5SL9ucZL3lBnnHei/S+PjIcMAGCl+6MOHx/6cquMmIaRDiM9uC4jtfZNo9N0EK4xcxArrIVKju5ocbM5H+HMQUlftmb3IGberVb8oVRULcJHJJA5EbHbR0K+y925OuDtW4Bc+3Pb8oKliWP1x3zQawuM7zmZVLLdKcoXywREenQk8LFhlLSCRVaYn75kPeGrt2U/OHXn66UA7ETB7ZeUt+hrrU155qZfEPGL379MwuQhpBV7T4hBshIcUjpTUIA+P76OYPWKRGSaNmuD35dOWBTHfJLtyyHY+/D8/kUCZ1d9KovFuGDAQez9HdEcXja1ZxkgPTnVDAXiQphAXgy76Z4M6Szots+4W4v0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(8676002)(6486002)(8936002)(31686004)(36756003)(956004)(38100700002)(38350700002)(2616005)(5660300002)(52116002)(66946007)(16576012)(86362001)(31696002)(66556008)(66476007)(83380400001)(316002)(4326008)(54906003)(2906002)(26005)(186003)(478600001)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?BUpTcwz8+8ujGEt8tIZwyIorwdeUL/bjW/hlsemjcdIP55Uas4W89xc1?=
 =?Windows-1252?Q?3fqnVGg/V6i6WPDMk8TDR6iwLGheq29d3i7LEw4NTIVD9+fIak29p0ej?=
 =?Windows-1252?Q?ocfEsdCUw1dqA4IdykrZJRBgV8e5vd1TU4lzgPFhHKgCnX5zgf0kLigb?=
 =?Windows-1252?Q?JUwYIJpxl1YWmBEJ1BocZxKR1Uk4m9gHkzBCYEGdIjZQjrsGQcX0sb5R?=
 =?Windows-1252?Q?tdGwn76ePfRfy2lG5VLaW+H3Xcmon2dRllzVSuJYPl/VuZKYUqD0RnhG?=
 =?Windows-1252?Q?fE/Up9NMtbwumA+TPlWq5oLmpZz+CoP1c/S1pay6UKe+fDdMDOpHWYkv?=
 =?Windows-1252?Q?4UT2CEplJAzIu3tBxLuelUFA6MAhlWhEZ4NkiRJc7a2sHLFfOJ+NAPry?=
 =?Windows-1252?Q?xPg2NkwHr5gyRFj3FZi3zAMrfisWx+NS+QiJa1ceBo4c0YKDLWYzOb3t?=
 =?Windows-1252?Q?q7HBaBDDYm7wN4/3EL6ILeZKHryD1Jnj6uCCacvTckTPIvTnA9C7fIxe?=
 =?Windows-1252?Q?uE5No2p0h799IUvSZEvLu4gMcdj4x0CqiTpipZMyZ4Sn/KnUAE45qjXW?=
 =?Windows-1252?Q?kJfouvbMZ13JTZnSgCFokj7N8cAkE6UfWCjHs52qs4Z7hpp9KOE3xe7c?=
 =?Windows-1252?Q?RsV9pwa3S9kdQyTkO7JAYQUrufvPYLrNP3J4ZD+3JLWvaHNZCYVGD89A?=
 =?Windows-1252?Q?UXgRd/2vcPoRl1ZlBwNmd9yZOiNlx7hKbXZkkitF3k1Ppy/vhpy8BHUj?=
 =?Windows-1252?Q?+vQtSxkELygLKwuInTRrrjZcJumCNXcKO/B7IJEHYfdOQjQFskIlYa83?=
 =?Windows-1252?Q?OsZ9I2xd/BmfOzOIAiL7FQe0H6KrYwLN2NFVU/dGRK+8KlG/UXkt2zfE?=
 =?Windows-1252?Q?ZG77P+B/33+9HlAncQxEaewZpwXpz/Le8ZZRKQRAixzqSzACsjhPPvWt?=
 =?Windows-1252?Q?0kDVvAvys3wgewiIZ3V4YSr2DE0jw4zgaOHdI+psIIOikByL01DGxt0y?=
 =?Windows-1252?Q?4DsZkCgdGl+zd4Zl9v3KHPrVALpKZE0PRNJbEt+9S8VrKdOeU6phaYdr?=
 =?Windows-1252?Q?nIGYYUQ57ghVYOPx6G0/BD1M9Ku5IRpuzSxImBldIQDicr44RnuBw6qc?=
 =?Windows-1252?Q?AGGzsX/pHwz7yyKIywvkTGrORNUJGA5NoL0DWxNgPV59gOTuLpchlr/v?=
 =?Windows-1252?Q?n+GpH1NwlAOx3T1M7CG1NWtt8N+FFnpIdQFd6zv47WurA1yZDWk5WR+L?=
 =?Windows-1252?Q?CXYnEMIU6D3O2N+uwk+GxPw5v89/BF3aAB072y95L52SsHeUXSMgZyGz?=
 =?Windows-1252?Q?uWcwXWcbDt45MV0b9R3Xj3TuRrjYGoJEWczjfcsOOqEYGUHFQ6wJvwL4?=
 =?Windows-1252?Q?SU80FaSglleMzk8BWU7tfC+pf3vtbBUv9vEiXTaGADpa5bULVJ3CpABO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f72b114-a675-4dc6-00ea-08d94792f681
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 13:17:57.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/RBxcIXawycInyN96kqq7tGLlzXW6/r3uLLFS+Okk5Xg3OQQQCw3ALgta2Pwje5gNCSdVrlT/z8Q6LjYRGPR1DT9eQEBAWvORrkTMbioa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.22.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

12.07.2021 14:54, Lukas Straub wrote:
> Assert that the children are writable where it's needed.
> While there is no test-case for the
> BLOCK_REPLICATION_FAILOVER_FAILED state, this at least ensures that
> s->secondary_disk is always writable in case replication might go
> into that state.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   block/replication.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/block/replication.c b/block/replication.c
> index b74192f795..772bb63374 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -261,6 +261,13 @@ static coroutine_fn int replication_co_writev(BlockDriverState *bs,
>       int64_t n;
> 
>       assert(!flags);
> +    assert(top->perm & BLK_PERM_WRITE);
> +    if (s->mode == REPLICATION_MODE_SECONDARY &&
> +        s->stage != BLOCK_REPLICATION_NONE &&
> +        s->stage != BLOCK_REPLICATION_DONE) {
> +        assert(base->perm & BLK_PERM_WRITE);
> +    }
> +

write has assertions in generic code so actually we don't need this.

Also using this additional conditions is not obvious. Better is assert about base without extra conditiions exactly before while loop.

>       ret = replication_get_io_status(s);
>       if (ret < 0) {
>           goto out;
> @@ -318,6 +325,9 @@ static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
>       Error *local_err = NULL;
>       int ret;
> 
> +    assert(active_disk->perm & BLK_PERM_WRITE);
> +    assert(s->hidden_disk->perm & BLK_PERM_WRITE);

Oops, bdrv_make_empty also has this assertion inside. It also is satisfied by BLK_PERM_WRITE_UNCHANGED, but we don't work with it here anyway. So we don't need it.

> +
>       if (!s->backup_job) {
>           error_setg(errp, "Backup job was cancelled unexpectedly");
>           return;
> --
> 2.20.1
> 

Sorry, seems my suggestion to add assertions was bad, as we already have them in generic code.

-- 
Best regards,
Vladimir

