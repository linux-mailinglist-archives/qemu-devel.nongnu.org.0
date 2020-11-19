Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3B2B9383
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:19:40 +0100 (CET)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjqd-0008Dw-Me
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoB-0006MU-Nd; Thu, 19 Nov 2020 08:17:07 -0500
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:25503 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoA-00062k-0b; Thu, 19 Nov 2020 08:17:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGasQk4wL5bg8+FJxU4oaVUoiDRUK5l5F4AHmLQhAHdCxBF09liIk1oyAflrRbOgiDrPdglM1G3iQPM9zfmhgqtiRZ5MICie5XPI/hfhvaeF8NSIzSS1huBmD3QDMQ7bUhx0Ibq8EaoOrVgO373Yqd9Pkz/k2ktGEDYPonbOROxouufxsVP7LJ6ZMuBAzHgj1ahOeoyRUcG9ex7WCVVna2ll+y/RxY3CFAjcFFR8mWcMD/so/uWBei1WAB9ARH7gcj+p9FBcon05DMpUIqjZOd8uq0zRKhn8EPi/jRT+8cLMGdKTg5cnGtwuUUfHkiaim+Lj6fiKA3dKrsa2sAB8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0vRQ0TExNIEsENGqdmA0i+Xf951sMXTLkpjL1WLdSE=;
 b=lf8RB3QQBdiFLat9W1SaujTC94GY9fv3FigZhlJHyhdySK5+fwj3lfXnG4an7geJdlJzly7RV8ckLi0kWf9RzM3f39Q5q6S+8b2JvkeMGZ3AzCS97v4+Oybj7igXrItbaFa+z6IsuQxffr+3rsS1MJq5iLUDLL0ARuivi1wMyEO97Uk5VkOywcOrU+ai3PzPOhMibB9igoHR7/DESCXlEq6Sc91COxMyc6//8clGXAcG8FyGt+NM9xm62Y4oy6gNJRaIU1HLEM4UcWzwrDPRcflS5AUmN9M+wJcyIV1zGzKvYSwed7kauj+h9FcyfgLv0tbRjkaogEjpe1GXwxVcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0vRQ0TExNIEsENGqdmA0i+Xf951sMXTLkpjL1WLdSE=;
 b=no59NQLQVF39Wj0K//oa91R4EVI78ntA6cCnZfegTGDLmqGMCNfZrq9JmL+cLp7rM8zDqkfMm7pBgte3yuSwOKOtRNLGn8KzqF86P8GsClteGRX6n2fFCTf1JnkGRlMs7GsyB3e096P+JmLGTa8A4bMohP3Hh/pK+xf9et8NsGg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH 2/4] blockjob: add block_jobs_info_list()
Date: Thu, 19 Nov 2020 16:16:32 +0300
Message-Id: <20201119131634.14009-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201119131634.14009-1-vsementsov@virtuozzo.com>
References: <20201119131634.14009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.89) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 13:16:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562c8365-5433-4ac1-2311-08d88c8d6062
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB184431FA836BB617981E7BE6C1E00@AM5PR0801MB1844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dl7Tmo/eMeASKLIE5I7SUuL75Cn7KwhdQcIdvMofherSm4ZcCg/VYE+PiTMTIp30iOh1zhlOpf4K67EzVfHnZ8KHnsVhubDrhQMGgtBJ+s9mcleH5UfWaCCeNwh4T8OodcTdSMt4bYPTRMvdIgnt97scYOxx4d79d0aBmoJErAAWc0hGjFXlTGBDYP35d0TCSDuc0hnOw0+cGPgwaBsLYiL0MUB6TmZ/yntkzrN+Sc5Zpu6cNrWgB732UrEIt0BcPbxEdb9/Ri0vaAxXVPzZCWfqyAAi+PR78e10UFr5pfvqh2hrfWRs7K2G2RL22fuenkEtbknSPK6cEix4B4mZCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(6486002)(36756003)(186003)(16526019)(316002)(2616005)(26005)(4326008)(107886003)(478600001)(6512007)(83380400001)(6916009)(8676002)(6506007)(52116002)(6666004)(2906002)(8936002)(956004)(66946007)(1076003)(66476007)(86362001)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 8Q3PDLFrjbcUf0po0o9kntmZBMgTx5KMqVPVDSBPQA//eqovPJvNcUiGdDNwSYes3Sic8bWoDz3xR00vL6PVAffNQ88+9ritN8nr8QkB3A7/awgMrjVrTWyZWE0crPpnIoTtk+bgm9O8qZWMqYzn3zYBKa0Er7AlMGTK2oDSMES/C+k3FWj0DhOIkZ7pwU+5zM0RgxyXKm446uEfPLtFftrAyrOj3BxxDmd7KWYglVGOiS2Id88nK90daVKzCe705VdKha8MPOwoNEZKaIjiwwQP+tnC9DIVe8OAC1gSdvWSIzTO73WhVjP0hVnDRDNFjonz/wKiPdoLYNsiW//uSSrMN2EH59WrXDQnvHkOOBOF6r5QIA9mC6meZ52MtMQarEJpO735lSHsYwt6Kg1aJ2rzEQCdhxRT9RTvBvGXRf4+FlkSUQm7L8/X1zSOFnngYh9EMeSWf4j+cqz6jCwfTCm9RtrNM8RemY94WwblQvQUm2ywKGOhwu885iHnjOYnb6lBScIFkDMan7a77HpFBC/isrR2Cbn2Nf+O0by43Vr1abyVA0tNiBSJKn1YjNmIrAHyHvGqdtKvujtoMRfEuq/5NKpIPV4hl5w2nMJDHQLlyzF4noQ1PMwH1Awl1AHVNZc/PGxGXiLsNuy9hVMWEA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562c8365-5433-4ac1-2311-08d88c8d6062
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 13:16:53.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QcFPOXe2kPd4Sc92rP09slsEEcIrUqH0fSYHbtAoXihmXtlA5VIOpzglkHniOdNBGvSQfN3OB4ePzDu4x6nAfU79d7k8iss3CC+qKFNIxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:17:00
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_block_jobs() functionality to blockjob.c. We'll need it
in block.c which is not always compiled together with blockdev.c

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob.h |  7 +++++++
 blockdev.c               | 26 +-------------------------
 blockjob.c               | 29 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 35faa3aa26..2e66d529e2 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -173,4 +173,11 @@ bool block_job_is_internal(BlockJob *job);
  */
 const BlockJobDriver *block_job_driver(BlockJob *job);
 
+/**
+ * block_jobs_info_list:
+ *
+ * Returns the list of jobs info.
+ */
+BlockJobInfoList *block_jobs_info_list(Error **errp);
+
 #endif
diff --git a/blockdev.c b/blockdev.c
index 6f103e5ce7..b5f11c524b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3670,31 +3670,7 @@ void qmp_x_blockdev_change(const char *parent, bool has_child,
 
 BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 {
-    BlockJobInfoList *head = NULL, **p_next = &head;
-    BlockJob *job;
-
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        BlockJobInfoList *elem;
-        AioContext *aio_context;
-
-        if (block_job_is_internal(job)) {
-            continue;
-        }
-        elem = g_new0(BlockJobInfoList, 1);
-        aio_context = blk_get_aio_context(job->blk);
-        aio_context_acquire(aio_context);
-        elem->value = block_job_query(job, errp);
-        aio_context_release(aio_context);
-        if (!elem->value) {
-            g_free(elem);
-            qapi_free_BlockJobInfoList(head);
-            return NULL;
-        }
-        *p_next = elem;
-        p_next = &elem->next;
-    }
-
-    return head;
+    return block_jobs_info_list(errp);
 }
 
 void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
diff --git a/blockjob.c b/blockjob.c
index 98ac8af982..9d0bed01c2 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -515,3 +515,32 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     }
     return action;
 }
+
+BlockJobInfoList *block_jobs_info_list(Error **errp)
+{
+    BlockJobInfoList *head = NULL, **p_next = &head;
+    BlockJob *job;
+
+    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+        BlockJobInfoList *elem;
+        AioContext *aio_context;
+
+        if (block_job_is_internal(job)) {
+            continue;
+        }
+        elem = g_new0(BlockJobInfoList, 1);
+        aio_context = blk_get_aio_context(job->blk);
+        aio_context_acquire(aio_context);
+        elem->value = block_job_query(job, errp);
+        aio_context_release(aio_context);
+        if (!elem->value) {
+            g_free(elem);
+            qapi_free_BlockJobInfoList(head);
+            return NULL;
+        }
+        *p_next = elem;
+        p_next = &elem->next;
+    }
+
+    return head;
+}
-- 
2.21.3


