Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3750D2F8F9A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:08:14 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tjx-0007Ib-A4
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQY-0005Vh-2s; Sat, 16 Jan 2021 16:48:10 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:54721 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQW-0007Dt-B9; Sat, 16 Jan 2021 16:48:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a++wrZ13wAe1wkM4ucQqNsip/elOnV425RSOnyXTompbhnnLrGmfNKrfrqfdpgRZRuh3WxLHLL+CUp+htQiXhq4dj+ZNJdUTZvlnngMnUzHkqdKppsN7PhIpvFBiCYMmSccyKVcC3d6UsYKCbs/BcAXaQCQzp7LutQMr6VsbPSsoZvvdRELk12drGVwuXvS9kqeZXpzPsDfzDLSGCoOKc1bF444i35AWEYqinoD8WrvPlAI6faQ3BPcx/cAlTPjo/CUX85IrtqH2SfKmf5uSiN1yQcXGkLH4r78t3M3uXaontbhXSy6TeHZ/VRCe8+te0pEMLUOxpXgCARImIxpEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB3VHByP9BBCf1ZFPCl0eFT/sC7DSM1D7c7aouCfIto=;
 b=BIy0Ezga0c0A+A0ehdA00GMSAJDga7CA+ZL+apBB2jbaW8pynNXHElsTlkTpW/vgo6JEoR8aeSBXnctMxGxfX9auP48gO1Or5CxooFTt1JiX4bci2WoaRVhBWW9dhbNSeY/g0+MIfGtJHlnAEgRY2PsRkmGy1Y0gJtgcfpPqN1d9P0Ult7FL602vUrRcwo5IJSM8ovTfP7GQZJKkgWsrhfbnSPJAfgSMpq8xr75Cd6d8UQsIuOHlceiSl/tKfOaNotAgBQs41F4Te82PbD0lE4yGCOsuKT1NwkDYDWp6fk+ScVhn69dYBHwn6mGb8o0MGKXDY7X3q1khT6erumHAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB3VHByP9BBCf1ZFPCl0eFT/sC7DSM1D7c7aouCfIto=;
 b=uWrBhz4aJYMEEOyQROdJAl9jtpgAQeSgFXcOUskQ8ihXeDCj2im3OACmyNKaDA9rOknbJ8IY5C+cjx+oGKfDHk4QvUZkXsKKyAiED0eqS7Ec+MrRcDrupbkOXEHFB/yUn2qkxTM/xyo0hN2xs6XRdmldSW2jAFLBGDrP552wtw8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 16/23] block/backup: drop extra gotos from backup_run()
Date: Sun, 17 Jan 2021 00:46:58 +0300
Message-Id: <20210116214705.822267-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7232979-ed86-4066-6de2-08d8ba6862a0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354217EA2598209228647DE4C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0utqKvTu6KiSy7gwBjcmGNGJwphYi1n0/b+F4NKU3+eE9vWRTZfY86E5xmX7p4ueHuS/4vKoLbDD/Kjn/d6tdBQTKuDQw5XNem8i8vBqAnd+ESxvOopMMkL763i6wHlwh+eClwHAiQwJqAacgCtlj2QefeCJrVBod9Fx2KztVcoARaLkMuSz1/8xrK7D4hOi97QsV4Th3WomW4deV67aAeQp01DKy4DEGMpYl1R/68VsYB3LsrIFDl9EUgJ7n/Y2QuvSwQHqAzbFrdMIFeuhEIGlTU9dh+056uqV4o7HIGtax5jgtm40QdxcMePn6RmZB/pXCtDgSctdhVMaURGc9+Xu34Gs2ejuVotjclzDJlHVv1mMU/aHOP/XiE1sGqJVJyxaz2V6Qb0H+Qx1jBMy4UBKETo2CM9NDlQ8Hs7irvCJPA3H/jvkmr+THME5lLncmKALULFqMHLmIaZzsEATVZQ8bcT0mHvDE0zagDFuIi4xIhf6fdUr5HFN7hn/K86UlVEcg6tQnjEqGhR7XSpFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F1EbE6kwHoUq7ulP2sEJtqXD55YvizydsK+GqMNFF1yCxAFU2sGc2l47l2Zd?=
 =?us-ascii?Q?AFBJMPgKfj5WLaREQWeZ0GVVvjtyl+ly6QGd4FXIgnekP0N8tqAAe70pFt8A?=
 =?us-ascii?Q?+mMKj+6ZRdvqeEtPwl1T/JWBD+m3uR3jnravWZT8tAcu5vtofR7P6MyTdq44?=
 =?us-ascii?Q?L7fTUy2WvDxT05XgpYbYRQ5P6ZZzdKH/4BAGsXlpHzzpxHW/i1fJz9dwhkFe?=
 =?us-ascii?Q?C2SBuSLRKCvr+JbzEvW/ON6K+lkLg2ozXHkocYrkR9nfbSrTfGIHpnxU/fln?=
 =?us-ascii?Q?bQmGepZp1umgaErMXqyWnOekcC8BxL4cg3WEXVV4qw/B6Sdjg3y0XJ7YVSNy?=
 =?us-ascii?Q?e8LzUqk7QsPun8w5DTUcC98xqOPyyXHeg57bCzRjL0HFbMSwRXfCOZSH7eBc?=
 =?us-ascii?Q?hepiTPGsxbYXluYA7uqCx2Dnl+835TQ2RYe3YqT01W3ayWBteQbst+zTjVtz?=
 =?us-ascii?Q?q89wY+PCaCgb3HS0ArwOk3yUdTNo2Sp9JNLYlCjHRvCJGASp3yZGoE+ep3+a?=
 =?us-ascii?Q?JceAJMGNdfh3djL0O3+lBEoGg1xv3WUMx2GSbkKXuG3TtSZ6WezlpUkvOtL4?=
 =?us-ascii?Q?TA0kuZjbDHHnqL4cCgnTyEojfSrqdUf7cNk5lE7ul5PuYAXZF9ECV4MhQchl?=
 =?us-ascii?Q?lagdRUrFz5p9SHDz3FPiz2w2kQTyZA3VRoczN9u9iM+0sz4KrOB2SXF1w50u?=
 =?us-ascii?Q?9dK0aQFYHGvMIi/z5SNgRSxpfTH1+tQaqIx+TNV9GfYj2aqj+82l7QRa+9gM?=
 =?us-ascii?Q?gQIh19npBd3jGo02GnD25rZX76GBgVNkScjXaRNilVRrtvNMnRQ7E5Rvd5iS?=
 =?us-ascii?Q?3thVlqsqA+vegks2MUx8cQ25v01JRL/dJd/w+4gP0/7uk9SySw9mpQ3vu+mn?=
 =?us-ascii?Q?2o4vJ3nq4l+4atSy2Nly0nmA97zQvSehBFHk/uuQSpO8MbVKpTW86oVUk+Sg?=
 =?us-ascii?Q?G1vKhxM7QRw2KCjYRZNIsixZASVvZv4/8Y8pxQEN+gJK9RnePpKeGlDZGrLN?=
 =?us-ascii?Q?1rFI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7232979-ed86-4066-6de2-08d8ba6862a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:56.8454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaCP3d6R0xf6K2yrfMiCIWTGSDF0VPVAX0o6xHKiwoNmToRLHVDLZBPW47QhbLuPktJDxYpl8KqQyNtSEnKwsKx5+RHc1hp18PbqaG+LLko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 5522c0f3fe..466608ee55 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -236,7 +236,7 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
 static int coroutine_fn backup_run(Job *job, Error **errp)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
-    int ret = 0;
+    int ret;
 
     backup_init_bcs_bitmap(s);
 
@@ -246,13 +246,12 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
 
         for (offset = 0; offset < s->len; ) {
             if (yield_and_check(s)) {
-                ret = -ECANCELED;
-                goto out;
+                return -ECANCELED;
             }
 
             ret = block_copy_reset_unallocated(s->bcs, offset, &count);
             if (ret < 0) {
-                goto out;
+                return ret;
             }
 
             offset += count;
@@ -273,11 +272,10 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
             job_yield(job);
         }
     } else {
-        ret = backup_loop(s);
+        return backup_loop(s);
     }
 
- out:
-    return ret;
+    return 0;
 }
 
 static const BlockJobDriver backup_job_driver = {
-- 
2.29.2


