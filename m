Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF33319BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:21:58 +0100 (CET)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUeC-0006zN-Ux
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAUcL-0006Pd-Mw; Fri, 12 Feb 2021 04:20:02 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:57829 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAUcH-0003fk-Qe; Fri, 12 Feb 2021 04:20:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvGC47qdWbTk7h5OJ9dLRgB+cNlGNUek+zk91Kk3HfCNgl0+vUZZVaUG2So9yTobS/ShKI9p++KUCNq4sYask1yDE7F3PD6yuFJTMgGNsNau/qe7udfrKa+FNkC6GI+/5Qi3nEhQ3AbBK/0WiCTt8oQKnk3j1CP3qud5PvPOcCgYCMBSqsZ+jiJaBUbD0acMdEmrX692xpDw6bNpXFbJpj2fUZ+zLWMPFD2nm0s1VO1+G07UyQRLP0uZqziNzGQwuTE90mrF30uDzvwUeG0dkro487Ng0oVdu0KftveaC7iKbGT7qOiuI4ifP9m2R4jkDue21O9WhM9DU/Cgw+j9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX4FKPlFo+tDNecHPSm1/WNlAI69nYTjT0uWCIEcWjw=;
 b=Mi+2t59FJxxLFZFhWhtSPsxsuypEsRZV87OiXiBTUP+73cPXELK4Iy2asYgemt0CTM1yjT1nL+3lqWywzzNZayhrGi4soOQOqd5XA4HG2rNMVRNCkuHe2PY36OK5wq9Xd4al7yF12ZGhseDYA3IpQsj4TXZWuk8ExsQyHniIzCBq0uqUnNRxBjoCg8BJ0lgN0LJlvd9Tzbxj7dNNZN2dmxVnaHmGnIeo36711z9m3tdgCbG1Xw9xuZzp1xT4FzwMG5LAJoMwsiNGB15HuwOa+X4LsjRqrq3dMfCWf5S8wa/Usj6bMI/zW0zSq6WHRTfg8I9Q3oWonVOQrDfZOjyy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX4FKPlFo+tDNecHPSm1/WNlAI69nYTjT0uWCIEcWjw=;
 b=NrwSpZg6jhm1dvAC1Sb8nbKmP/4e7uD0G1Ic22CmTMyZaE5eiOXv7AxWsM1zCZ+uRqHkYPzJ+lNsTAwF0SjXHQKE0hs8WHa3ncpt2HVgVdBOj8XVMu6XKqrWSXDj1PcTZj8ZJbWQy1xD4goZ3N+2lErvCqxEvNFvGg9+K8pEAKk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 12 Feb
 2021 09:04:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.034; Fri, 12 Feb 2021
 09:04:51 +0000
Subject: Re: [PATCH 1/2] block/mirror: Fix mirror_top's permissions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <182ee6e2-865b-5d83-a7d9-c95e2a5f44df@virtuozzo.com>
Date: Fri, 12 Feb 2021 12:04:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210211172242.146671-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM4PR0202CA0023.eurprd02.prod.outlook.com
 (2603:10a6:200:89::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM4PR0202CA0023.eurprd02.prod.outlook.com (2603:10a6:200:89::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Fri, 12 Feb 2021 09:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f89138-d164-43d7-2bd0-08d8cf3540f2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6152D5EF60B7E78898528C6FC18B9@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crFcaPWcWsdwEWTu5RwmzOEsr3+5zc/5PLu+mIUIHPdp6ONyS+Vjp743SPtBR+RVICwC/gF1S5sJHMEeuKqUCNDZ0LPLdSjuaz286cN7hJmrpl3VocZ8IaQtGXuFZTEtPiAYRYozBw29Jt62u0UVZpPp88E8DPLEoMZe18BjGS0dA3z8qBp8Pu7bP8QbG4h3aARCgCaUp5AIRUavOlE50fmHzLyVbo1GvJQzaQd5wI5sroqYobzekvSVpOkRsUy9Od2vnJDqj+9MzRnb3BfZnLagSP7eZ08IYN66p6tW4v5mPZw8WBo6dis2WesJ2pVu873khX63vV0kGySCqhYeDTAROjNIsTEy3PxYfWPIudK4tGEP3q2o6poRYR76xAa9FSFqmT5eP1Ckl9aLS0zNk1QRlZJKB6PYxgXI+hKPtTTgz2cagpJ15iVaddqwCi2gi1aRiMfJs1OcveAvFryDQs9XHgN1MzeAqoGh0LI9DE3VfL1OpsxcEuHYp5nEpkUTBh3PqNIR7KvkonVtDagZ8E/12eu4TgOtl/GddHnMKNnRGmd97BGmlmU58PAZdStWIc/fVSkE28IabFOnE8Jg/dhCmr0ceJ7Bx7h7rQx83FA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(376002)(366004)(136003)(396003)(66556008)(956004)(66946007)(2616005)(31686004)(8676002)(66476007)(83380400001)(8936002)(186003)(316002)(5660300002)(2906002)(4326008)(52116002)(6486002)(86362001)(26005)(16576012)(16526019)(31696002)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGdWK1Nsbms5S3FUVit6WnM1citxYUJTbEd6SXd3UG1PK2syZHMwcnc4SGRJ?=
 =?utf-8?B?azd0WGtEb1Rwc2J2Z1ppa2V5M0I2aHpvYUNGVTUydTRoWGZnYTAwOG55NTBa?=
 =?utf-8?B?cU1YV2ZpMnFFQ2ZDbG9idTBDNDVIUEVISVpLRVRGSUE0WXJ0d1VYK2c4MlJ2?=
 =?utf-8?B?MXBkMG0yTWc5WGlWRmZ3a2JnTDI3SFNCTzEwSElhRHZydFdIWDZCRXpVS09J?=
 =?utf-8?B?VkQ0YUdiNmRkeEJXMlQ2TlVjRnE2R2xLekxYSEx3VVJCblFzQStKVkl5TE9r?=
 =?utf-8?B?N3BvbUZEREJhQ2pUVWFPV2xYdUFQSXZxUHVPRnJHRVNKa2l3VzZYWDY5N1Zq?=
 =?utf-8?B?alVDbjQ3Uk9oVkx3enkrdk1PSWZBZVBHd055VG1Zb0RnMnl4enk1TmdaV3BY?=
 =?utf-8?B?QUpJZGhEQUgzcTlrVW50bS9oVHNuc1BpdzdWb0oyWE13bG94RkFqN0wvdzg1?=
 =?utf-8?B?c0N4MUExUElFU0dpQkdSWW1TZm94NFlERkttdlpna3lKZjl4b3FnMGRVV21E?=
 =?utf-8?B?bHo3Mzd3YXZVdFpVc0VhZUJ4SFZDNEFwOSs1bERlRVpuZHFPTnQyaWdTV1Jo?=
 =?utf-8?B?eHRYZnM5b1lPOW5xTGRMV2JXRzg5NGMycXhWeGZHT3J1TnV4NVphbENhczN3?=
 =?utf-8?B?eHYvWE1jT3g5Y3R3OUhNRk9WbVk1c0dCOE9TN25laGozVW11YWhocXY4NHMy?=
 =?utf-8?B?ZXZqRU1kd094UTlDSUtpZnJ1S2JTVlJaTzVWMVdaUyt3bmJVZjNJMlBRbmRn?=
 =?utf-8?B?OVlaOTJ5RU5NaWt0NnJ1ZWF0Q3NuMUZ3ZHBVdzJYZ2tlRm44Qm41dzNEQWlT?=
 =?utf-8?B?Q0FRWmRnZy9jZ2hNL1FnR0tnMUY1YWZ5YVIzSmhPQU1HSlRZWllodVRsZE9F?=
 =?utf-8?B?V2NWemlIM2JVa09GSWZyaFVyaEVJVUorb1dhbHY4N0VlYTg0cjdvRm1aZjhV?=
 =?utf-8?B?RWxyWUlFUTEzeTk5ZTNpcFp4cjBOLzJnUjZRbWVkSUs2OGVDelZXS2JvT1Jz?=
 =?utf-8?B?ZytuVUlQWUx1THhEWWVnTGFvOWFMNTIrYXRPZHFrcVduYzBUb0VOdXEwNzdm?=
 =?utf-8?B?RkE3SkhTbXdheUorV2p1Z2svTy9xVHhWVXEwZjNnQWl2clNVaXFsRXNmTC8x?=
 =?utf-8?B?RXFGc2dmYlVpY3RkWmxhQVhZM2ZKY3lGR2UwRmxKcDRXY1l5T1h2SnpUQzZi?=
 =?utf-8?B?SkFoZmdTdEdsbVFkOXovdHNQWlBWamYyODc2QzlnV3hCcFY5ZmY2MkoyZzZR?=
 =?utf-8?B?d2owU1dyUFhsSFFuczRFNk9aanA1K1NBME5OQXlERW9NSytOR0JxNjQ3RjNR?=
 =?utf-8?B?VmJFSVMvbXVHcFMraDhOY0VrMGFGM2N1ZHBaNUsxQ1JyODF6NTBYMkpKMWF1?=
 =?utf-8?B?WFhSbnVFSjY5R3RPVDNMUGNhbkFtUFVFTitrdk1RSXB2TjZ4Wk9oL2praStB?=
 =?utf-8?B?MXdXMFBuQUlPNVd4MFVsOTJtbzlndzBYNCtFakRmSlcvcnZ4am5ISnJEWXFO?=
 =?utf-8?B?bG9HL09NenZ4VEE1WUFEV1NnaTFVWUFqL05oMFN6WWxjakZyUGlDU3Y2TlIx?=
 =?utf-8?B?UUNQbTErWDhvQTgzSnVnVHk0SWoyNlI4Q3VVSW5TeVppeVAwcXNISEYyaDd5?=
 =?utf-8?B?WlNkVEFZWVFra0w1ZHlBMzRPMkNjZ3VIdWkzYkJEY090UW1OV1NybC9SVFF3?=
 =?utf-8?B?b3dxVGVGeis1eDU3cjd0MWNvRzNQRXBjWFphWHltQXA0R1o0by8wMTE1bndI?=
 =?utf-8?Q?DG/TMLs8IZBI0J7kkuHVlO1LhX1T1wM6AiPZELY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f89138-d164-43d7-2bd0-08d8cf3540f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 09:04:50.8518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaUhfuIzOGmOVsrCgQvGYruBYi7hu7x/UrSxBAvoF1/Y3LivFk2GbxaHgqj30YcHisP6zUiR9OcrJc/VlSAFqgpy6uPzu3p8lKpS6n2TYiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Received-SPF: pass client-ip=40.107.14.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.02.2021 20:22, Max Reitz wrote:
> mirror_top currently shares all permissions, and takes only the WRITE
> permission (if some parent has taken that permission, too).
> 
> That is wrong, though; mirror_top is a filter, so it should take
> permissions like any other filter does.  For example, if the parent
> needs CONSISTENT_READ, we need to take that, too, and if it cannot share
> the WRITE permission, we cannot share it either.
> 
> The exception is when mirror_top is used for active commit, where we
> cannot take CONSISTENT_READ (because it is deliberately unshared above
> the base node) and where we must share WRITE (so that it is shared for
> all images in the backing chain, so the mirror job can take it for the
> target BB).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/mirror.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 8e1ad6eceb..1edfc3cc14 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -89,6 +89,7 @@ typedef struct MirrorBlockJob {
>   typedef struct MirrorBDSOpaque {
>       MirrorBlockJob *job;
>       bool stop;
> +    bool is_commit;
>   } MirrorBDSOpaque;
>   
>   struct MirrorOp {
> @@ -1513,13 +1514,27 @@ static void bdrv_mirror_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>           return;
>       }
>   
> -    /* Must be able to forward guest writes to the real image */
> -    *nperm = 0;
> -    if (perm & BLK_PERM_WRITE) {
> -        *nperm |= BLK_PERM_WRITE;
> -    }
> +    bdrv_default_perms(bs, c, role, reopen_queue,
> +                       perm, shared, nperm, nshared);
>   
> -    *nshared = BLK_PERM_ALL;
> +    if (s->is_commit) {
> +        /*
> +         * For commit jobs, we cannot take CONSISTENT_READ, because
> +         * that permission is unshared for everything above the base
> +         * node (except for filters on the base node).
> +         * We also have to force-share the WRITE permission, or
> +         * otherwise we would block ourselves at the base node (if
> +         * writes are blocked for a node, they are also blocked for
> +         * its backing file).
> +         * (We could also share RESIZE, because it may be needed for
> +         * the target if its size is less than the top node's; but
> +         * bdrv_default_perms_for_cow() automatically shares RESIZE
> +         * for backing nodes if WRITE is shared, so there is no need
> +         * to do it here.)
> +         */
> +        *nperm &= ~BLK_PERM_CONSISTENT_READ;

this works only because we don't assert READ permission on generic read path in block/io.c, like we do for WRITE..
but this is better than pre-patch anyway..

How block-jobs and filters works - definitely goes beyond our permissions architecture..

> +        *nshared |= BLK_PERM_WRITE;
> +    }
>   }
>   
>   /* Dummy node that provides consistent read to its users without requiring it
> @@ -1583,6 +1598,8 @@ static BlockJob *mirror_start_job(
>           return NULL;
>       }
>   
> +    target_is_backing = bdrv_chain_contains(bs, target);

may be initialized together with definition..

> +
>       /* In the case of active commit, add dummy driver to provide consistent
>        * reads on the top, while disabling it in the intermediate nodes, and make
>        * the backing chain writable. */
> @@ -1605,6 +1622,8 @@ static BlockJob *mirror_start_job(
>       bs_opaque = g_new0(MirrorBDSOpaque, 1);
>       mirror_top_bs->opaque = bs_opaque;
>   
> +    bs_opaque->is_commit = target_is_backing;
> +
>       /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
>        * it alive until block_job_create() succeeds even if bs has no parent. */
>       bdrv_ref(mirror_top_bs);
> @@ -1646,7 +1665,6 @@ static BlockJob *mirror_start_job(
>       target_perms = BLK_PERM_WRITE;
>       target_shared_perms = BLK_PERM_WRITE_UNCHANGED;
>   
> -    target_is_backing = bdrv_chain_contains(bs, target);
>       if (target_is_backing) {
>           int64_t bs_size, target_size;
>           bs_size = bdrv_getlength(bs);
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

