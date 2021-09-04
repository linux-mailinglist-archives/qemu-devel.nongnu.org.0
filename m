Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E4D400C23
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:37:31 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYfa-0006cn-4v
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTj-0002vr-4P; Sat, 04 Sep 2021 12:25:15 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTd-0007GP-Nb; Sat, 04 Sep 2021 12:25:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYVT/nvwh3KJZjSX8RXOKXEz/X9vKGTs5uT+j40/nK5zcrJFjZBpY8USpZRKBY4y9/Y5pHfIyF6Rp08+YLUqEFnzmNaagSY5t4gOuM3ssvSrQzuC+ib/ULrEGPJiTFiwloBwViIZKwbvAdYiDipmbi0I2U6wnqioDUgZTFHDvdhwvd5fV1wpeZzJa8yukltjiSQc1KlGoL9spKOnQIsnU9sFRSfPm6Slng9nodGuNQOIMxsAncOHmp1UTOKiSO2TOf8XYFi2kmmg3iShRohcRaQ845JwOl2ZP/3++eETTEHUZ23Bk+6xgIW9BbIpcCPmvqIRIYi4+g6dihptIJO2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PrRiZInqt1ZZmVKT8YYaZm4oCmPuP62IFgAFRHl89b0=;
 b=fDEaEK6xHbpYWkrswhf9u1xQ/p3IMOt3C1ZhqDPwCf5aNRh1PvHcaG1negnLDvWsrsZhQEVQJWGuNI1zSviDL8XrrarNhpzW3SuQpHNYYgTTh3Vud3KhuIZS1H0B0rfMtis9APQI0zGHgfx+VYkyaWT2kx5KWbKBhyRxIbn1rf5EgHnrVrx6vvZKFQYyqytM/m1SPodpAiXznIy2g2FWwbtBLkkcYTFvoz2Lw3V/Nmh5vasBKFHsFuQ+5ENnFsGQ0u5qKE5zEQlK/x4cMKxhSrn2mlZENTK5WCDtaPcBwLUfGAM6wUDCo8yZ2e59iaYBKs5JFIf6OkZVa4cGxZongQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrRiZInqt1ZZmVKT8YYaZm4oCmPuP62IFgAFRHl89b0=;
 b=OESoKWu05PIoSlTAcPgUmMzH8uEQzjTNPpUeCNO4M31FKpQm8tbUBCMxaJKpHmz6OSBTiEwWxvOYGdsyjhegGX0vftvq6SveG+vFFoFUi0o2HzTVYYEg65/OPUtZ/Bv1Rqi/zyiNPcPe0QcC6q9L4vj/4xPI1AOgCHgEYsTJFoA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:25:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:25:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 07/11] qcow2: track guest io requests in data_file
Date: Sat,  4 Sep 2021 19:24:24 +0300
Message-Id: <20210904162428.222008-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:25:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d1c80e5-c593-40a1-9c97-08d96fc08b08
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69045293039AC70EDB90B9C7C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oq+Hyfjp1SIQ1zQF8VQoQzVeb3OpkuhXg4t9M+t1IhjuVH7IlYbNRvCjk1A9oXHsrSFvuHlPNWiAv9DG7eesztt/b7pOh1BMx2LGYtz/FbunF/UT0hcL9gQWVKchUEVdOl8WLpkMew+6Oeycc01i3fwA/3ugebyzgItPG7E1hzDtKMNvJ5T+vI316tLxh7+0W/UBSbPw7V6sPTQOpJwsFr2f3uQNcSLRMOn7pF9rO8TJ2E67oThc5eUhdBszsJ1l7LNGSZ/d5AkKGQgf5A4MXAj7g92tmjESVe4gYSomW60yr5vyEUvsAMCa6/c3pL5i8I18c8WF7f0hXKON0pUW691yFOxSj4ABPmm5AY9auMRwjmShFhGRVvjTP73vqWFC3MiiAQQ4TxYJRsS7Q+refe+ch3rYo47zo7DNJt4S/lCUt4izrVGJHoDsSraXNs4A3PRh7MROIB9lsv5cvQSRua5HlKhZWmCyyHLj47nweRrOKXbJH+SwBHS5K9IJrpGAGE7e3gmyasTLc+7iv3CQp4UvZb/+ILtc5txOQK0Hky60n699ZuW+2cbsDaZXyo6mbp3JmMSxExrwWQRjdOra0mty9+IQ65GGAsWxsBGpi/t6YgovEoghrG3vUHI8OehY2OlCj2YeGUZPxEfH9Wc7BLEW7cWQZd+Uaom2pJzd7LBf9bnKUF7IPtZ4tpnzAjq5MV7hqpbVj41ogicxuXNvRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(19627235002)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DawuWUaX0CfRcxfIxriKb8wNRu/S0VD63/sdCEVT20Msw+T/NV3Zgm9FqIJC?=
 =?us-ascii?Q?OCLCEx/javyffUBAYT3f3/qvevhizMR2kfWRDUXBuHicblojYKKLUDwYTEEU?=
 =?us-ascii?Q?B58NyT6ABEppjQ6A3g/L2PchzwqWZioLoEoM9Ft6LlmcHfGy4D0Qp2u6EscH?=
 =?us-ascii?Q?Kahbllffi/WYy0m7GQtezhfW2uIXtwdgdbCTyMAyQvQGp9el2sv/DjQVyJz3?=
 =?us-ascii?Q?9mVhLvmVWnWzy4FI2RqIRF6Km9vD+aUj65ALdaKNgKHM6RsXzg4gmpXLeAoS?=
 =?us-ascii?Q?ZnlczGrrndkTdDVAFGzqmDLht6YBY+CpwMFK4zPO48z65DfEZJVNJBebv6pU?=
 =?us-ascii?Q?aLvlyPkSkn9+/UpAGm0X+71F7otFvAvefTF0XUvhbn4kFZvAuLnhSTzLf/Ij?=
 =?us-ascii?Q?XirA4wfqV6UY0fGwhVIbi0+i+QPFEKROoWPQqXWeRFD8op4Jr5pjx7pCAOn/?=
 =?us-ascii?Q?z0hQTjdPolPuo5uCBIthgZj5/sPD1FnX0T9+f3Y4Apc55myi2htIdlLvKNWE?=
 =?us-ascii?Q?ot/4D0TsSGbsD4gU3FFIh6lynDFtPId4UwX8/iS4wa+PwG2FN2MEPn6G0p+Z?=
 =?us-ascii?Q?BTfAjET+UaYM2FVklM+kyagaGhzk6w3TzQAO59UId/KUZmW1BEoGSGfyM9DW?=
 =?us-ascii?Q?a69f7EEdEB3DPtLog1N4d80a+7nG9Ut5LmuYNAB/TDMVMJTYnUcHUaxLT0+F?=
 =?us-ascii?Q?8zV0+GQDg0wVeIvHru0cuSKc87FbBfjpYisYrn1870Sz75b5LE6AGyVqXrgp?=
 =?us-ascii?Q?OU27qekmEyUwVdV9oKPK2i+iMREoR2KIhElbTrdCxLpG+hCb9c2RYfeTYpiA?=
 =?us-ascii?Q?MniAdyTRhXWFO+R3mZb1KFPio9WMIbp0035nVBPXE/j0cf6TWbrsnYHTvHjm?=
 =?us-ascii?Q?238HRv4ijgMUn8MTOnxizQrns0h8wf3Sis7g9PcpkjnOA3DIGgednALewLRk?=
 =?us-ascii?Q?swhwGP/IJCrvmQ7Via8vitMLVnhscDTCJWBZaLh/yAVkaVhvM0fuq6y1vkBt?=
 =?us-ascii?Q?G7VQy2Z+hS/9x23KFYqIoZENLXJqOZvTrMuacJQjdCRVnaB5DfwtQf7t4v4U?=
 =?us-ascii?Q?haOnQwGUlKRDcF6p2438MgnujE1SNJyK0kPknykrjtiNFQHVwsJnP/ryM3Ur?=
 =?us-ascii?Q?utv0X/UYH+bLHNUhvehSalPSeD8FgQc14XakV4Kbd2hWrksymVjxIB5kLxJO?=
 =?us-ascii?Q?zlS7dtNTEesZCSFqPkIPy0IgamddP5FjoK2P/0ARNZGI3+tOn/thJE5cd0Vt?=
 =?us-ascii?Q?Q32P1WBhljp0Qe0jIkPh7MYHqG4cVBp7/X0wCFAgqiJxc0JoEtKdPz2lM0Rb?=
 =?us-ascii?Q?QynGNwIa3F5lItXShrWz2YsW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1c80e5-c593-40a1-9c97-08d96fc08b08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:25:01.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwYTMavb9vFW//l/4wMva+tDniWdq+yMdAlNhSq5dcCBl38F9ySSZLoIJapr3lSi5Lcmxz1LnNbp407PZ1AfNcS/dGvOOsbQdLtsqe8PvqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We are going to fix a bug of reallocating host cluster that are under
guest operation. For this we need to track these operations.

So, we create BlockReq objects during guest writing and reading data.

That's important for synchronization with further host clusters
reallocation code that we create BlockReq object in same s->lock
critical section where we get an offset.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 8aa5679fe9..aefe6558b6 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2212,6 +2212,8 @@ typedef struct Qcow2AioTask {
     QEMUIOVector *qiov;
     uint64_t qiov_offset;
     QCowL2Meta *l2meta; /* only for write */
+
+    BlockReq *req;
 } Qcow2AioTask;
 
 static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task);
@@ -2224,7 +2226,8 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        uint64_t bytes,
                                        QEMUIOVector *qiov,
                                        size_t qiov_offset,
-                                       QCowL2Meta *l2meta)
+                                       QCowL2Meta *l2meta,
+                                       BlockReq *req)
 {
     Qcow2AioTask local_task;
     Qcow2AioTask *task = pool ? g_new(Qcow2AioTask, 1) : &local_task;
@@ -2239,6 +2242,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
         .bytes = bytes,
         .qiov_offset = qiov_offset,
         .l2meta = l2meta,
+        .req = req,
     };
 
     trace_qcow2_add_task(qemu_coroutine_self(), bs, pool,
@@ -2260,7 +2264,8 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              uint64_t host_offset,
                                              uint64_t offset, uint64_t bytes,
                                              QEMUIOVector *qiov,
-                                             size_t qiov_offset)
+                                             size_t qiov_offset,
+                                             BlockReq *req)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -2300,6 +2305,12 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
         g_assert_not_reached();
     }
 
+    if (req) {
+        WITH_QEMU_LOCK_GUARD(&s->lock) {
+            reqlist_free_req(req);
+        }
+    }
+
     return ret;
 }
 
@@ -2311,7 +2322,7 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 
     return qcow2_co_preadv_task(t->bs, t->subcluster_type,
                                 t->host_offset, t->offset, t->bytes,
-                                t->qiov, t->qiov_offset);
+                                t->qiov, t->qiov_offset, t->req);
 }
 
 static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
@@ -2327,6 +2338,8 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
     AioTaskPool *aio = NULL;
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
+        BlockReq *req = NULL;
+
         /* prepare next request */
         cur_bytes = MIN(bytes, INT_MAX);
         if (s->crypto) {
@@ -2336,7 +2349,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
 
         qemu_co_mutex_lock(&s->lock);
         ret = qcow2_get_host_offset(bs, offset, &cur_bytes,
-                                    &host_offset, &type, NULL);
+                                    &host_offset, &type, &req);
         qemu_co_mutex_unlock(&s->lock);
         if (ret < 0) {
             goto out;
@@ -2354,7 +2367,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
             }
             ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, type,
                                  host_offset, offset, cur_bytes,
-                                 qiov, qiov_offset, NULL);
+                                 qiov, qiov_offset, NULL, req);
             if (ret < 0) {
                 goto out;
             }
@@ -2523,7 +2536,8 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
                                               uint64_t offset, uint64_t bytes,
                                               QEMUIOVector *qiov,
                                               uint64_t qiov_offset,
-                                              QCowL2Meta *l2meta)
+                                              QCowL2Meta *l2meta,
+                                              BlockReq *req)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
@@ -2582,6 +2596,9 @@ out_unlocked:
 
 out_locked:
     qcow2_handle_l2meta(bs, &l2meta, false);
+
+    reqlist_free_req(req);
+
     qemu_co_mutex_unlock(&s->lock);
 
     qemu_vfree(crypt_buf);
@@ -2597,7 +2614,7 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 
     return qcow2_co_pwritev_task(t->bs, t->host_offset,
                                  t->offset, t->bytes, t->qiov, t->qiov_offset,
-                                 t->l2meta);
+                                 t->l2meta, t->req);
 }
 
 static coroutine_fn int qcow2_co_pwritev_part(
@@ -2615,6 +2632,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
     trace_qcow2_writev_start_req(qemu_coroutine_self(), offset, bytes);
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
+        BlockReq *req;
 
         l2meta = NULL;
 
@@ -2630,7 +2648,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
         qemu_co_mutex_lock(&s->lock);
 
         ret = qcow2_alloc_host_offset(bs, offset, &cur_bytes,
-                                      &host_offset, &l2meta, NULL);
+                                      &host_offset, &l2meta, &req);
         if (ret < 0) {
             goto out_locked;
         }
@@ -2638,6 +2656,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
         ret = qcow2_pre_write_overlap_check(bs, 0, host_offset,
                                             cur_bytes, true);
         if (ret < 0) {
+            reqlist_free_req(req);
             goto out_locked;
         }
 
@@ -2648,7 +2667,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
         }
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_task_entry, 0,
                              host_offset, offset,
-                             cur_bytes, qiov, qiov_offset, l2meta);
+                             cur_bytes, qiov, qiov_offset, l2meta, req);
         l2meta = NULL; /* l2meta is consumed by qcow2_co_pwritev_task() */
         if (ret < 0) {
             goto fail_nometa;
@@ -4045,6 +4064,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
     qemu_co_mutex_lock(&s->lock);
 
     while (bytes != 0) {
+        BlockReq *req = NULL;
         uint64_t copy_offset = 0;
         QCow2SubclusterType type;
         /* prepare next request */
@@ -4052,7 +4072,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         cur_write_flags = write_flags;
 
         ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes,
-                                    &copy_offset, &type, NULL);
+                                    &copy_offset, &type, &req);
         if (ret < 0) {
             goto out;
         }
@@ -4080,6 +4100,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
             break;
 
         case QCOW2_SUBCLUSTER_COMPRESSED:
+            reqlist_free_req(req);
             ret = -ENOTSUP;
             goto out;
 
@@ -4096,6 +4117,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
                                       dst, dst_offset,
                                       cur_bytes, read_flags, cur_write_flags);
         qemu_co_mutex_lock(&s->lock);
+        reqlist_free_req(req);
         if (ret < 0) {
             goto out;
         }
@@ -4129,6 +4151,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
     qemu_co_mutex_lock(&s->lock);
 
     while (bytes != 0) {
+        BlockReq *req;
 
         l2meta = NULL;
 
@@ -4139,7 +4162,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
          * the refcnt, without copying user data.
          * Or if src->bs == dst->bs->backing->bs, we could copy by discarding. */
         ret = qcow2_alloc_host_offset(bs, dst_offset, &cur_bytes,
-                                      &host_offset, &l2meta, NULL);
+                                      &host_offset, &l2meta, &req);
         if (ret < 0) {
             goto fail;
         }
@@ -4147,6 +4170,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
         ret = qcow2_pre_write_overlap_check(bs, 0, host_offset, cur_bytes,
                                             true);
         if (ret < 0) {
+            reqlist_free_req(req);
             goto fail;
         }
 
@@ -4154,6 +4178,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
         qemu_co_mutex_lock(&s->lock);
+        reqlist_free_req(req);
         if (ret < 0) {
             goto fail;
         }
@@ -4565,6 +4590,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     ssize_t out_len;
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
+    BlockReq *req = NULL;
 
     assert(bytes == s->cluster_size || (bytes < s->cluster_size &&
            (offset + bytes == bs->total_sectors << BDRV_SECTOR_BITS)));
@@ -4594,7 +4620,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
 
     qemu_co_mutex_lock(&s->lock);
     ret = qcow2_alloc_compressed_cluster_offset(bs, offset, out_len,
-                                                &cluster_offset, NULL);
+                                                &cluster_offset, &req);
     if (ret < 0) {
         qemu_co_mutex_unlock(&s->lock);
         goto fail;
@@ -4614,6 +4640,11 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
 success:
     ret = 0;
 fail:
+    if (req) {
+        WITH_QEMU_LOCK_GUARD(&s->lock) {
+            reqlist_free_req(req);
+        }
+    }
     qemu_vfree(buf);
     g_free(out_buf);
     return ret;
@@ -4676,7 +4707,8 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
         }
 
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_compressed_task_entry,
-                             0, 0, offset, chunk_size, qiov, qiov_offset, NULL);
+                             0, 0, offset, chunk_size, qiov, qiov_offset, NULL,
+                             NULL);
         if (ret < 0) {
             break;
         }
-- 
2.29.2


