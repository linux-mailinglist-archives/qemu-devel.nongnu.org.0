Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14847D4D5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:07:34 +0100 (CET)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n049N-0008Ij-GZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045J-00050V-NU; Wed, 22 Dec 2021 11:03:22 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:2823 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045G-00043n-SX; Wed, 22 Dec 2021 11:03:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyxpKISccq+ebovNA2tsmISqBBb0uhXs9cut2s2BLgiO73Zpl9jLYIt7+fOguhrIEiOjnjZes3OfG3haUYkQtAfNNioYP8hM4I91C5dVycTe8iOB+YinOfsK99TTimUbSEQXM9sX/Q+iu9TZUkMKh4SCFpOaFazFpqeby0cnhxRnKL+kKM+9h5m+XvGycxzLdMk8YCk3WOkYA6M9ywxjPB/RH6PGb7mrI7EF3fkpPHJxCoF5Oe0gFcj6ivR3YdD0KE/L2vaezno+IhjLO0J4O7FSP5hgDfaSHTqk++foUadpQcuPjo0kQB3eDgURBRdm7tt68vegLAAiFwd99YENPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEUHKsR434FlW2xvNwek+bipA3zdn8m3wAv7arxBqzw=;
 b=gdfIB6LAmX3PDGjQ+SZ0jIvmlM3Bzhj4+FEgOzs150tmDUllHcMTVAdRMQslnIXooGP6IBWd/Kq1XPmh4PdYXUBk/lGS30EqcgI1N62SVUt+W25JXwg6UW7oNzVy8MDJ05HbwczSm7azyY0v7NJrTVlFaPYLfTlS3iTmIUsGZc1GaRAtQjsxzpLUVBxn8Co66OrU8NegejONM309DJ8iAfAK/DA9h5Tc3O9y840OzWAHnXiXZb0TqWvMWGthgNV49DwXVzgbYtJb/AkbgwoIjTIWod3itR8vHPCrYDX1z6f9/6UroM7zoQm6VvapHMahS6FFju2anBEWHJVfb2LU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEUHKsR434FlW2xvNwek+bipA3zdn8m3wAv7arxBqzw=;
 b=NT2kQ+b50xv81nwSEfqoVDQowHriTSfMaKHZfAk7kkL3/HMS7xWfW86Lm71mki0Z8ycdKT36P0hauMn2vwgy0MIrRpsgjePrzHHrRJX7uRTm63U1w5YS6URqrPl1INHkGMh/JLK1VrnDi+lR8/aRd53+a/g0QjCI/gK6CEOyblU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 16:03:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Wed, 22 Dec 2021
 16:03:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 1/4] block-backend: blk_root(): drop const specifier on
 return type
Date: Wed, 22 Dec 2021 17:02:51 +0100
Message-Id: <20211222160254.226909-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222160254.226909-1-vsementsov@virtuozzo.com>
References: <20211222160254.226909-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dff2d1fd-3ccb-47ba-9507-08d9c5648d11
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148CF6D151B532899473A88C17D9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOXFtntPyRYa5kO3nmHwHAeS07nedtVeTdryhdTEH4VvB1EqIRoY+RJyM45jFdwS/+3LHq9oAXdnUCilEasuwrdOglPfLrkSrYHYLbZAhHHeMYVA0Yhvt3o/pKMb3sNHsy7bPuRDyTq6aPU5vuwfmsaA3OMGs/WRDQyKr7J9lcCo7dPhmB4Bu1Pt9zE9s/AGxnPyn+9BLr+IQJsdKkVUvSPvXECZlxK/Pdav0SZVpZ+3PyFpjukfXfmWavPq/l+q+m/mXL6A3wdEFAkLtqEOgWAfopfPkCvMv7lpZp+7iuxVckgjCWclsuxcAjYdGAlqFmoA0wUpKxuXUNgJqPjQ856f1s6tKE7a5GhX7wn5H9wY9eFKYqr3PvCvtFSocitrkQJeyXO8ie1eWN7kL5TRHTY4/wWm6ma75x9HSj86IsbrFlok6yuhB/Ky7zunEg+0p62NA9YxHW0Um62u2e1aQwM+tsky//s+rgYnyRetlA0jc96piagLEIPm1yxlrALCEqbcgULjZrUCwjV1pt57FkLcze54KfFvaJttfj2Ld8AJgNC0ll4YuC/TPpE2xHLqFgjcSPwJnDNM3xi/v2NzhJhWpSoAi2uSCpPsjiGYjCBtuyvP5U1SsFJ5cEVQXKSBB0jtKJChVKvqhfz/JEPYVsHdN9AwbA0YgnI+9w6Kx2B48dJg27jD9mEY6dAEXwVN9ebU6mjQ1RjoTgK9ZYspvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(6506007)(316002)(2906002)(6916009)(2616005)(1076003)(5660300002)(83380400001)(6666004)(86362001)(8936002)(6512007)(66476007)(36756003)(6486002)(186003)(26005)(4326008)(8676002)(66556008)(508600001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Mp04MWxrYMw9/CeWuAKM8v2IvOOc/qo8S0Wuo7p+1mhNdVlg6a1IvBass7Q?=
 =?us-ascii?Q?+zEBjF9mFeA8T4LL4lHx1cGPxuSRV1x/GaXmfa8Syj6j93bDtHpSJ4+BkCZf?=
 =?us-ascii?Q?czyX4w9GBYwQb64dlyNzV6Ms//THVpGllyx1cpH/Gs0GUUQ2znCbnoSCIigB?=
 =?us-ascii?Q?m5TMd+cRqkwSrQ6GiYj9BxkmeI9+ZdwY3iE1kvGE7CRe06vCCgarsYRTFrWN?=
 =?us-ascii?Q?IPAy2A+2mZIaFBzL3Wi+w1XhgXdThLtN/fvrvc1wane1qLiZsmb5xgkOoQpD?=
 =?us-ascii?Q?2+KKC58dOyF2KATt6zxLiTFyJeYbIO4xr3zuI1ZAiRfHGMdOlPEr2ODiyo7e?=
 =?us-ascii?Q?r16vIIMYNZ4hTbKGIHnFbn/3lnPSH3nbp/RhNdEEw06CT1DaTkua/iYBzxYV?=
 =?us-ascii?Q?Dt7UC2T6YS/t3/Bz4GGgIMfYpLAC6e56DuQeJxFEcwCC90ILOjXWTS50jYBc?=
 =?us-ascii?Q?Ie2p8zx2UvupcJ1Fn5SHL2LfL/qS/DRvxi8cV2VqybbvakWF5e2QCy3cZiFt?=
 =?us-ascii?Q?fSVgCfJYhI/kt18A9elaVuhgKml4iWQrd3O2myQA+KQJVrspIra/T8vM5Tk7?=
 =?us-ascii?Q?x63C2W3zIDqyvQSI84GCeeQmAm+zmEI7d11OCB5kOaIx6Y18uPhhWQD4t7a3?=
 =?us-ascii?Q?WSvkcgVS5BcW11pdHU6bM9ThqaMBrj/FblNaPqkFhmKyAjzl8oW3sRuoUgls?=
 =?us-ascii?Q?PY+RGRqeN1oLkCnctRewDxMgesMFh5EUDGhapex1uH7vf/7Y+f144q/C87Kc?=
 =?us-ascii?Q?kCU/tPfzbHs0K2ZKWgK+e1MI44rdlE4fGDbUYPZVZFFZQAnZ2P1g+V1+Wz4R?=
 =?us-ascii?Q?avNcl/iD9g2iFxoOHsRITeCYdgqW6yf7fmzgJIA3H7Crg9dtgGTQBVbbEGNY?=
 =?us-ascii?Q?Ri+3+bPaZJ6KApNIEiGa7NI4txWr8mqcSM2WaesoYAYGpsTZ/zJIQIR+CB11?=
 =?us-ascii?Q?GQPALv0xH5tYDUo2ksw4M9ROE+5pMxObj9PbIRSA5BizPseLORoUPOlYL7pi?=
 =?us-ascii?Q?Tcead7CQQhcLLnoV+phEubYPcOJjwyiMa7bLb73QpW47OIC04W1ZE09FjtfR?=
 =?us-ascii?Q?j+9Xr4DzaEL7rc0ppv3FsN1ClgkjFmbMW/v/VFfqQbNNJNoLlrfxRNn9gLPk?=
 =?us-ascii?Q?OpzAXtniPabhbxnmz5uSZXA6PUT69zjFikjG1N3lR6utd++oS7Cl1YW0HjgZ?=
 =?us-ascii?Q?6CkeKiusP9mN1Bf+i5X4K+9eV2ZGyKf0+T+CDNjgduGeIUWCPQ5klXJXISd4?=
 =?us-ascii?Q?TxdwzGqPSFb+u1Hg3ZJmFPXtEAOIfvcWtMQUgV0ILxfg5yzXocU4/nbOz95c?=
 =?us-ascii?Q?J9NU3sesWDCq+s5b9ANSz+17OGrABFjeMU8x5nnmmMQweeDj/qJz7cgOl/Ra?=
 =?us-ascii?Q?Qwe381UqkL1wvRYIYQEnb+pfTW6LeAr4vAodhPsIcuDiA+ofz0hXwK/RALL7?=
 =?us-ascii?Q?S6watt2RaUxmFjprwpNa7m0YH6rJbLywLxVCPD/Na0UJaO09npqSr4xf0Mk4?=
 =?us-ascii?Q?M40r7IKDyMxd33a8/UgmRhqdLXxqaxG6VNVh9vi6cboim3nnHZbe1xPvHJwX?=
 =?us-ascii?Q?X51zQ/Prfu99muqcfEZNjX6eniK/ZJxCUVd5OAgLns2kV3gRPsw+t7+R+XAd?=
 =?us-ascii?Q?1/mTn4tLTXvQ2uo7kZ0j7q1+kpem0PLf8vstIn+O3Pwmfi83g7Q+agSvlF3Q?=
 =?us-ascii?Q?i+tuOe3Xd0u1oq9X8G7D7RoPKR4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff2d1fd-3ccb-47ba-9507-08d9c5648d11
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 16:03:10.6602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vmVT6rZo5CVWOOmSBfI53CcG4KiM5CHRoVNIErFgdarGXolQF9QPMZo6mbUZoZFMdeZReetmP/hOgF5NK42aN+2otl0mKkr/6wkOuxUs40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We'll need get non-const child pointer for graph modifications in
further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..904d70f49c 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -277,7 +277,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..d994a0f096 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2438,7 +2438,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.31.1


