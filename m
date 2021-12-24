Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E834647EFD8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:38:47 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mec-0000NU-PI
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcn-0006Xr-CW; Fri, 24 Dec 2021 10:36:53 -0500
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:56161 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcl-0000hE-Vh; Fri, 24 Dec 2021 10:36:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqAsfo+lm/9RdP5wPf5N/xDk0hfwZ7dn+AQoQQHP7Mw/HO2yOhfKv/rrGRA7D/87p/H9Z3KqSTSVIBqSkvi9LNOgNzj0gkhnm+irgz4EG1VCRm0eZE9KB77vexQHXRJfWijFMqp5PY6wGQtMyMbNunAtGRxTrrFLRfDyDGdKj8B0Rq6v/gd3Hj8U73r2oQgdVkirMC4QeMDewqn7p/A8mVwH/sdYCuLQXFQkkvFfXIhSBrxyv1wPs3jEEwkgwAfZi1ZwnBKrcD5/fw54tGje9J+5GCl+ebgzp49MlCm8QsjS8n9rp5Gt9+1wv4mMvvicbq5AUxD6bJE23InniWQ0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETrBO321JCwwtX0BLRKxi8KVt/FNRfW3UXu4Gsf6qeE=;
 b=Abpb2BrarnXKbbjUJSkwqfSuFkE7j/0fz7qDRJ9+5sTtRTCzjnkW1IehUnjq0NtR0RhKAAMIAp94LFfE3+R8aTrWg62TDqdJV9CgEEKhJtOvbMpafW1OEbBLPg5AXjMSHsFcOgxctFnLIwFYc6KL7eXQWz7f6UhhX8mqRu+Jn1WkZGccsL/0bTMLnv1p+X1Q5x3VQXahyhpBCesgVDVxXooWajtjlhQeabcdc53hQCPjcyB3ikafOTGbIgWc6PLR5Hhs+ScmcFdaCsiXeh9Rv4KebQupeBMGBZL3JZJlcqkOxUP4v3zmwp6cbRhdd3TWAcXkejBd+of65KM/pu8AcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETrBO321JCwwtX0BLRKxi8KVt/FNRfW3UXu4Gsf6qeE=;
 b=j+JcKNHEQ8RfkjSaL7SkpbKso2TkHqdXbGHyIUjXmc0qANdTcOvCNbN4HQjs5kRLuJWGWpNT5fNkaHpKzGogjvJBB7RF8euh3FOYIecEYrGRNNg7tcxonwBGylE4c78+X+wkrlOOLv3ji6E8IHWHJbsGM2TZgKNF2v3+2CR9bco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6769.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 15:36:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 2/5] test-blockjob-txn: don't abuse job->blk
Date: Fri, 24 Dec 2021 16:35:49 +0100
Message-Id: <20211224153552.2086061-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df4794d-3b04-4df8-3df5-08d9c6f32001
X-MS-TrafficTypeDiagnostic: AM9PR08MB6769:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6769E9587B574C3913A145F9C17F9@AM9PR08MB6769.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIWqPyUZJDraA64qTVQZhgz3A6dYhnowLGDI3ZPKEnuwPT2Rkr8/RUjfCESdGrgV/8uAkR2FAtqqElkV1BmHP9qEp/gt+B5vsG98/V2X+5qDyTqulZQXOmnz6vTNkCVS0XwaJn01VByJuBIoWlB8qqTvMgJ1FFKNYMEuZgL5JobuMjm5AcCEXuz3kXLPfiQh7mJXDaTVCf5HxMCWrnBLPClIDnyVcqneXW7+D+LWVGB7SmolR9RYCM1rYfmlyfA7t/6iCrN0njXM7H5iNhjcOmNzcpgtCRwGN3Ax2tTLT5SP6lrAi7n0gPW97teehbTUimpJKTr920llamm235hdn+n7p02xQrxZv/Uu+nYJLwNfa+HBQb7PBFf+/clVcn/dZc/w9AHVy1FMercqW9LzOBMR2VUhpJis6SKo3KiWH0HwQW6ll+RU8hvzPvDQKwKFzD4QnZg3ZnqXLkTRKt39kCDyB/jxXt0gkq0ZYmHhl28wZtrT0u/2390BeaOF6chqSV1PE2EkG5swyyHebCqz6NQ0qngDLPb1jlcKQWN/UNJUzly3JIxYcf7RDLKP4rwg1E+EoPoDLVqA8sloZFZaalxg8YxdLvXkgj4VD1kpycQssxXOfvX7+FS0tAqSdhRjAauG2Ywu0mJCYDoM3pduO/GnpHsc1oFb6orXYcaIzFIFqSpL9tIMCnCAsGCzJWg7y7z36ScIhKXjYFGUTSHC4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(26005)(8676002)(6486002)(6512007)(5660300002)(1076003)(107886003)(6666004)(4326008)(186003)(2616005)(66476007)(66556008)(83380400001)(38350700002)(36756003)(86362001)(6916009)(66946007)(6506007)(2906002)(508600001)(38100700002)(52116002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GjA8QHyXmpGzJtg+Coaz9+vndVf0XE/y+E9SRTAbWn7JQVZtIhZZLCHA4124?=
 =?us-ascii?Q?WxvFYCkoQJ4cTGuOPYzjRpvNa8rr1dd6Axb+OMm3r142ja/ayHVDS3hkbgmV?=
 =?us-ascii?Q?9clfbL+b2zPCPKWkD9YwcpcEedvRSmDM5qpbPpWsM5Iil6kflbvq85OlEdrO?=
 =?us-ascii?Q?bVuknafYTaduGvfqw+nEBMuXaRxxlsEO237gvwBkPj8jKa6p5Mb2dZ71+jpM?=
 =?us-ascii?Q?7PumF5fGUUxNzHv55kbV9Np0IgFSXhZzF0VUrQCHkc7lbgNlM0hSbrWJIhse?=
 =?us-ascii?Q?lY/TJjSg1rjbHOVj5tWLwGCNgO8ERL8pPRLj64RJHMrVQPb3XUXjNqxEz1VA?=
 =?us-ascii?Q?SnirQ7sxqmSjy1pkx7d1KlhzkqFMTpHEurXQkqolPQ9adJO5sQIXdH6zBOnC?=
 =?us-ascii?Q?3ClQnv1X+YdUCipbMd1zpke1as7QakmxLGP4D2ZmhUUBsvC2jZW0Uj/OIhRv?=
 =?us-ascii?Q?KPmb3rA0QQrRdSeTALQ4X3JH/8zbNNFUmrz/T+3bHEnB+Gs9INEUvcw+x2IV?=
 =?us-ascii?Q?vndnG1r9XWFOcn/6mR6BAMhNrDK+n+97So5Khi1QnBJNCNrnqxc94NIoSv0s?=
 =?us-ascii?Q?E2rAWSXrIrosXHD/MjtahxxRoycWoNeXhFKx11l4Dhb9F3am0MB3yjvuDa71?=
 =?us-ascii?Q?hWmHEcJ2MBBJE+E8Qa4dja5kHBOTG0XSqT4RbSzlp2q9WQGF0HytY/VDWP7s?=
 =?us-ascii?Q?YkFVUuURdBjHOgX6UW4fDU96I+s2tYQ/dK19TKYSlYTM+QwGfiYzfXUXIsFA?=
 =?us-ascii?Q?wwj+6F3L+WiFriWuGHbKJGvhigMCIGyz4gxoTwzNglIp4/1F9fYTDy5tHPgT?=
 =?us-ascii?Q?3M5uYKrgW/BrMypuDQTFS9XmNbtpMaKJlHNXpieF5vfYA0KzJK8OSw2yWv/u?=
 =?us-ascii?Q?avqDsCURbdJ1wb3i7Ek7IVbKDyUDVBO9spH1vLFem/vMec4VHL3Qu4my+COi?=
 =?us-ascii?Q?ETot4Pu+CSQsiO5XW6umXb8YmTLFMC4uIvr2v/qHd41qLUF0+5+6NRVnwNad?=
 =?us-ascii?Q?swoKiSVUNOK5I8NMk1u/imM/pgNr221pQxwYlFekf51z/ZsQBsYJ2qHFphAT?=
 =?us-ascii?Q?ndqAYU9tCMJB/vsZIcpPLJd1VGmvdfhapcpzqQ5FfK0jeIXGP/TW1P0Ft8cW?=
 =?us-ascii?Q?rVzp6O/T979/F8irj0GfnAwJr3jqQMV+dTz+z3PsSrMD5rnACNNDQoHhgv8I?=
 =?us-ascii?Q?lApD8E5Y28LbFms5BY64FxHqB0CqaKEPJcij4NKqwDpRzz6FqeHZDf3k1OYW?=
 =?us-ascii?Q?4oqlzycn1VNyQ63P5SctTTERRFwIi4fQ6Kysexd8TxqQsAFh4TO/e8tgnbgO?=
 =?us-ascii?Q?9mim7Wa5g6T+wzzZz1mLHlK/KHg/Gpp+Ze0gMgKGE2go9FFPzxf8TruJgfgE?=
 =?us-ascii?Q?WWgPW5Z+O5COxQ9a1AYAQR+CYdYqbiSL7kdCs10/GP6ucjPsS9OI5kGb2m31?=
 =?us-ascii?Q?Pa/Xub9i7glpV0PaIpV92PZgdyCFcDWVGFgl4Cilq5n3zUCIRECWTEO2/0zJ?=
 =?us-ascii?Q?tkMHfIB9vwWDG451GUMM28fnxPpZGLQOZ5FmB29WkEJfuNK/tul6pfMo82fi?=
 =?us-ascii?Q?0akgvgRcWRnqyDSP3k2drXp42la0FO6RHfTYq1Xf6DiO9XbHVosBXPpdxgkJ?=
 =?us-ascii?Q?TRdDxla/uppUJnxDsspO3uLXyDhRCYKnB8Fp8y51xNZyLcVmPhCbASXg97QY?=
 =?us-ascii?Q?ak8WB8fYnUY2qV/++BAmTsqU9K4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df4794d-3b04-4df8-3df5-08d9c6f32001
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:16.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YS/w2xv0di1w3RGHWZmHri1y0e4lAD427IfFY4Lrt7hZK38Xi4Mz4FUXp0NH3dei8NABF2IBaw+sAc7RQdM2gN40p92ezQ22gr3h85ozXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6769
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Here we use job->blk to drop our own reference in job cleanup. Let's do
simpler: drop our reference immediately after job creation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-blockjob-txn.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 8bd13b9949..c69028b450 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -25,14 +25,6 @@ typedef struct {
     int *result;
 } TestBlockJob;
 
-static void test_block_job_clean(Job *job)
-{
-    BlockJob *bjob = container_of(job, BlockJob, job);
-    BlockDriverState *bs = blk_bs(bjob->blk);
-
-    bdrv_unref(bs);
-}
-
 static int coroutine_fn test_block_job_run(Job *job, Error **errp)
 {
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
@@ -73,7 +65,6 @@ static const BlockJobDriver test_block_job_driver = {
         .free          = block_job_free,
         .user_resume   = block_job_user_resume,
         .run           = test_block_job_run,
-        .clean         = test_block_job_clean,
     },
 };
 
@@ -105,6 +96,7 @@ static BlockJob *test_block_job_start(unsigned int iterations,
     s = block_job_create(job_id, &test_block_job_driver, txn, bs,
                          0, BLK_PERM_ALL, 0, JOB_DEFAULT,
                          test_block_job_cb, data, &error_abort);
+    bdrv_unref(bs); /* referenced by job now */
     s->iterations = iterations;
     s->use_timer = use_timer;
     s->rc = rc;
-- 
2.31.1


