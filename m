Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93A2B83BE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:23:59 +0100 (CET)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS7a-000255-KE
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpv-0004xD-Q9; Wed, 18 Nov 2020 13:05:44 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpg-0008Qn-7w; Wed, 18 Nov 2020 13:05:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khj07gxJf2oqz6JU8OqdMAnGqwaSbocHy+fhGL81bhmn+edYy9wjlqEz88H8LWgZLWo7xKNJvoyI2q/qdDy9wXg7214QlbRNg1yrDvz1+YFhXSujurcHSKPVX95zzPw1pj0yDLu+rvnnOfp6oYc1SjbphZITP/1eV079GMR8q05k2dmaBYbG5+M3o14OCA0z+bMBEp0Ct1GJJ6HU0RjtyLcEpDpdY8H6Gg9ucAV/fq2QHD3erUIurTCnbt14N/iEahEZdHEDbaKkZMcXnzIZCHLqCY513balWfsYVC3hkGwBEx74qNYS8zsGlMZinM0DiSaWR57wEjF5Zu2lvyI6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHE9bzaBfBzcr9lo7hxZU+5+d8G+ER3zknAfD6yNi7g=;
 b=Tr0wY0ik//HpfA4Hc0pt2Oqkye1S62gS5K5e0xewjHvb+p9wgZ6d7q4tEW6BH2uaNIfZjfJZD+dk0evESOALg/EHP6XaQe6Z9L11qjcTYrOfiinE9+3PZXU6JgxA11ZCbJMOWY/cLZbLg6lFTnxWRi7Hc+I2O4FkjQRGqAHcWOS+xBl7E5oygtPIWbaqlOzEQmCtkeuvM+wl3Kh2eMPUyajVQ+AAaSB8QHJz/LJ18R8PVmn4OhZRPPQMuwP18PZR/LaXmL+VV3vy98uo5uRs0/rSipLuFzsTWVtzT5o9rwnsdKxu7SKA92hU9LTLfVgVhu2wKNUgMYqQRp7SFtP6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHE9bzaBfBzcr9lo7hxZU+5+d8G+ER3zknAfD6yNi7g=;
 b=DDyhxhLRTg5Pg0zg7MuXnIvL0uQJUaMM+I5bXjMnoXbtUV0HRrs+GZwNRylHHprh2ogjxpAkx4AoxV7avknh0+5/y6HelS4Z6xNZ3H3YGpmNuFkNDnn8l6BTauEM6Y0rpLSN+8ENIuh1jpWQ2uSAiuUZm7m98A9SRYAkagHhlsI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 10/11] block/backup: implement .cancel job handler
Date: Wed, 18 Nov 2020 21:04:32 +0300
Message-Id: <20201118180433.11931-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ae24eb1-1701-4481-088c-08d88bec73f0
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912A748C0C80269EDEE9753C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDwytjmYXpJhuP/wLpeVrOo1qgJHOy8B7ir22IwHPWpGETth3G3suJ7ppvkxHDWCjOdHMDCAzf0DInsWzchxW3YsXa10pfChMGulyfnhwRdg8uQRTojiQrl6xrXlIWehxhtFeDVzf/uSRx4mG/r2np6qUtmas2FogsRpBkqWvSmExZMQlCtHPaAJxQf2mKOKHa2nF8kUd651y/9xd6p6Yelw3YKvlBdc0oTxDyliWNpkr9/qh7yP32tR6Hc+wDb3+ogY+7aXmic/6MUAct+a9gtCZtjt1UZIysAGhboKKEyAsWO+ZqM9usaNt7xZHuhMFahIlnZuPSeFvrGrkl5fwISexOKLwyd3+Cy2wDQ6B2xyxo5EV0cTfUod358oFTFN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: eMvpxpnlTWJvN9w58ovmB/rwHoRe60rA6Kq7LouNroSkKWcBxC1R6ePbufGHnhU7WSLl6DPFli6b9wcd/3Qr/Gl58cALxcv7askMkF2X1WD+3cn6Ir38hmYlnyQaQRrolrghRObCgeFwFuWZhKuxLGQGRMUmu/RKyjkJcRxHXh75JSzkZqH+ZKprLZiBqM46LovCQgII+7jaaWC2o+s8FJHmM6HbAT9zHQLAoilPHNf1+xxo0BBnl1lHzt4GeyLS0f+LZkH7xULxt/654AW7CBXgOp57KR4ldUwi/9Nw6WQa3bDmONuNzoALtIhQPdwVDI1lnY0+R34S6Gy7qCx8pH9tXibBtKMsE8mPuiYDvtXfIDWkHBZijVWMvH+MsNRJFvPvObsVhkOp85BfCaOLIB8iFu5jgWlQHc6+z4Yqivy3cJ7ZTRO+dw/SdEDc+Wh79hqJTabpicxRFDIaz/muMzmnxeEaPSMmbRxn8ucqegElUN/PJc+UnRBDOADkDtUsK6yv2GXqsEZFFrd1uf9amXowJxrYe98Cw/z1xEriRCqmhIkjbnkZ8mH17xEA9lL5LnYxRg0ZMyExWmjzTQi+Lley8vETPSTTCnszbQEjcLGuQgSNAt66tzwwtj6UPuSiZx4cLUOhx1++WpQDnyyNvA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae24eb1-1701-4481-088c-08d88bec73f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:54.7823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS1BwZegJHHeEUtE5Umow4Vag7E1UJN1cePiJIWxAUEN+Vtgh1TJW01ehsWMFeTirR0xT5TF1CKNah4Qv9ZxLuXbs8BRl2qxtmC+Rh2xINg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:46
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Cancel in-flight io on target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/backup.c b/block/backup.c
index 9afa0bf3b4..9878594c83 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -36,6 +36,7 @@ typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *backup_top;
     BlockDriverState *source_bs;
+    BlockDriverState *target_bs;
 
     BdrvDirtyBitmap *sync_bitmap;
 
@@ -279,6 +280,13 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     return ret;
 }
 
+static void backup_cancel(Job *job)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+
+    bdrv_cancel_in_flight(s->target_bs);
+}
+
 static const BlockJobDriver backup_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(BackupBlockJob),
@@ -289,6 +297,7 @@ static const BlockJobDriver backup_job_driver = {
         .commit                 = backup_commit,
         .abort                  = backup_abort,
         .clean                  = backup_clean,
+        .cancel                 = backup_cancel,
     }
 };
 
@@ -456,6 +465,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
 
     job->backup_top = backup_top;
     job->source_bs = bs;
+    job->target_bs = target;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
-- 
2.21.3


