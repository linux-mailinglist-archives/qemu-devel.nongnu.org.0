Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548C4623CB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 22:54:30 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrobU-0001id-IR
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 16:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mroaW-0000ts-7T; Mon, 29 Nov 2021 16:53:28 -0500
Received: from mail-eopbgr80120.outbound.protection.outlook.com
 ([40.107.8.120]:53988 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mroaT-0007t8-BG; Mon, 29 Nov 2021 16:53:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IufFCzEEhcmeD0ngZy4DWCFg0rI0FdCDR83vAitpWriY0tc30gEMFU3Jt60BsTkLwAhh9rmrHBZrWmF8kRq0AuGyfE080RK9pFBoE8g3J/pplLAtWBJDUVoAkhvcLmPxAn2fL55uil0R4B5Ph6IEOK/bSWTbGWvHYGjSQX3bgRdeosEPqJ5NAYDadAaZBYq5Yux0xnsl+tFmaQNsCjeGVGe9VQqP+WnegfbvATpMQBB3en3phwvagC8NjGuAmsSMgncAO68Y1UuiMlh6mguPrXVuB/oBp9qGJmAP8hN6cd3SVan+7nkBTuBuYrglZRtHAesWaifGY62MOqGw4TAsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EChBBtlu+qK8/A9GEZZdnMH/f2HAvaoaV82ntI+q5M=;
 b=bfpyIgnoVPVN3C5rwaLekKstLJYOQbvD9jGmLuMziOk9p3S1viTXVg03EBchnF7hlezH6SfL8T2BtNQ0hoI3MmrQlGDqaA1z0L/fRNqkINPxBn6x6Wev8WOZnjjkm8otT/yVp27F39cawTSrTyGlGTDYlHOMWlTpEsVqa23wY4VEeyaCN1GfgofNmJeAGiomuOQXI4HLFS8FacmyRYFpzIw78KmooOwJifQHue5dycC8WzjtKLtFPA3bRISyZVlFngyf046kG+wuzSJBQcDzBsgRkXNitjTipNjYNBEkfuF9HWZbayCRlKNR17LoQzfOCuACROFo/jPkbCtazXhE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EChBBtlu+qK8/A9GEZZdnMH/f2HAvaoaV82ntI+q5M=;
 b=A9wzTMEJB+qaEmSMd8hJO8Osp0d3Til7s2X6opkwf1UlQTNFMb46+6pN6015vjAl+Rl/p7JZhqiuChi/Tyn9dcLswETmNOd7VfgxSq9IT85rSO2qhSPbMmYeNAQcxS24EOb+n+Kfhvx/41IUnxUL8v6IM0HNv3QVyIScpmnbkwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 21:53:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 29 Nov 2021
 21:53:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH for-6.2 v2] block/nbd: forbid incompatible change of server
 options on reconnect
Date: Mon, 29 Nov 2021 22:53:00 +0100
Message-Id: <20211129215300.1468291-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0246.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0246.eurprd06.prod.outlook.com (2603:10a6:20b:45f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Mon, 29 Nov 2021 21:53:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad524fc-dacf-4319-6aa0-08d9b382a907
X-MS-TrafficTypeDiagnostic: AM8PR08MB5747:
X-Microsoft-Antispam-PRVS: <AM8PR08MB57471BDB07ED61257635DFE4C1669@AM8PR08MB5747.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: morUMRDvx41VetoSmjdOezhot5cKZ7tJr4pJyHZsegIg/ARpeQSMVWlN8WSq1Zf/Bsry0MHOCAB98XnA7++cYgCR/iqi7UM+AEYPwVn/EloWusd32avoqTWwzGXdtVreZbHPsUe7zsFXJwSQUiCrrBHh4QMgoq/FnLsdHcxg2qNgu5IB9iCtXmScs9iF/qF6m7KKeWlCgOUAH8HCXfkItRQ3I9MKu9nkFydQ7B5gEvcVQKHpvSSu2U5uBKDvz4kJLiAKmcV6ci4mFFdKh6Cm2FnKdD/cZ0iZ2tJmgr+1nmKXES8ECVTUwd2raCj+VHAJfjxbnbKpCuTtsyWlivtl06d6h2nTE7VmcSOEB/+nTSR8lS8oAzrWJ+3QJWSyZCiAMEn4m9FWtcJXxLcIW1px+BhMakotanUcbwY1WTE1Vf6BvD7fK8KmjqPdio48Y4FTKfFpbLJnHwWzqRLBz9KTxdJsaSY4Gkac9wEnlvuHgwfSQiZ6aUMTaV6pDDJ6pmQjhhGiMLF6QW9PPewWfVDjsP3RVLiFacZsj0eQT2unpDz//aR7c3jke5ddYxH5nWr6hJE245l9hmgx/6nYnuIWKnW3V43YGORAj/C6rl1VHPWUok6ntYxobFQkgrPPiTRNVU99sJCJ69QuG/LiAlvQng9yensAdY+KvkYKKqqENY1aZfj9/EaDPkHW0lTwpm8oxJ/QmjMof3bhy7GPnVzqzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66946007)(66476007)(66556008)(8936002)(4326008)(8676002)(6916009)(26005)(83380400001)(5660300002)(316002)(186003)(38100700002)(52116002)(38350700002)(2906002)(36756003)(6666004)(6506007)(2616005)(6512007)(86362001)(956004)(508600001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M0J8RuKlo7Na2VqurCE9gmkN9IPcwIn4oKY0aKk87KttmsuV6424usVunCLz?=
 =?us-ascii?Q?sfZIKzYLz2cncH1Mc1voN/eoegtHnfx0zzlmZehKZibLVRptxzyO92mCTq2r?=
 =?us-ascii?Q?3jvs8mRRL4qeaPyEXj8yQ29VEKE5iguu8NolXREQEmIEiJK0Pdsme5yR7Xbg?=
 =?us-ascii?Q?xisDN9WlBIcd1ZOs4egufgis7IASj6kuRedFusohv10s+4DwiHf8RA9J6NsO?=
 =?us-ascii?Q?pW2+CdrndFKXiExZzI5DGlQDViwGgvRnKWcJz/gWZwpVLlWZCWaLa5ijdAiF?=
 =?us-ascii?Q?30PJtL7NNgDrqODU61oWztu7pzU/gY68CpHm8vG24xDWADOeVRgkFVbj30Um?=
 =?us-ascii?Q?IGAiI3uqxutLS4j04diSjd/aU9/dH4Tl6HoRt1N/9sNw95iWWqk+pnfzgwKT?=
 =?us-ascii?Q?1K4DLjlBbsFjeFE/s3x26HrpyKHyRPhSudl7Mm2wthI2ZAwVdy96cdCx2Y0b?=
 =?us-ascii?Q?fpLSAW2dW56uwq88tuTJ1hGtRJmc30oIQdVfwaN5ul7RnJy04P7Z7eJHrGky?=
 =?us-ascii?Q?FRZHdO13Ye+M+zPBobUwOn8YN8A+UGPY1ewJvqpAG0p/hYx8wr0jO8JEM1Zg?=
 =?us-ascii?Q?u+LqnFnPbZXHR3v4Dhge2vs4gtiNyoddAX39XvMn9RXPcysFwg63IY413wvk?=
 =?us-ascii?Q?r1YVuNEDIkL/h4NaeFZtjBgCdHntOPAoj+cPfnlWRKkd2neSe4za6SZHg4g3?=
 =?us-ascii?Q?xyNrYGb9oECcfOKTBKAWJG58E8eR7pjEu32bzp249OC6y2yGoamX3mlVLxEW?=
 =?us-ascii?Q?n8jG+gDZSPHV42PHqVHKnDZmldxK1NTgOJznVoxXZUpG900dOum/YliNtVJw?=
 =?us-ascii?Q?lM69HWLIdMoWzyC5FI+UOFLkpeBrRi5GFRBsVIaWQ2nAd+EY381XoKZdymLf?=
 =?us-ascii?Q?yUzefQL2MMtgJFH6qpYLR7drv6vQ55uWGFSIO/WhL1/WdvqcmMuVAkjwWvU7?=
 =?us-ascii?Q?lA8e2k4esRWcAXWsOjSZhVClbME/il/RG8rU/7z3ij505Mw8tU7GQWTp/+09?=
 =?us-ascii?Q?4feEnASoM25a1Z0od+zjf3nSbs7TqQKdNs8jLDQcwIwlB9RejyyTEsUUsvnO?=
 =?us-ascii?Q?77Ul23BAnkw8gqu8wT4T9Mfy63FhLZGOe+ZLoMnFJ5YUO11geJQL/+fJCnsL?=
 =?us-ascii?Q?mxIqF1ETTKehAD+N64m7IFjN7WrccN5rpkc2ziW05kaCz3bJGIQeJ6M+uEDA?=
 =?us-ascii?Q?YHvos2wheo/dYxOltSHXRuK/5M4S+Yf63Z1+n5d7iYk3j5ftfqbgE79/YvkV?=
 =?us-ascii?Q?eh3Z6KWeE5KeOQJY84IuHfrEYA1lYSIdWmAyy1eMBOSmBm1EXlJc1OmOdqdo?=
 =?us-ascii?Q?BkYVvRPY9Qt/pDoWWreCQC3eYpOH9MGzGmDNzO4OrTHCWmnvGFJZO9aMI2bA?=
 =?us-ascii?Q?eyENiGEecW0iKQ5WWetb4RkUVtDVw7+3TIeQSEdbgs7YKTaZCmNDzFM+5myr?=
 =?us-ascii?Q?2JAzSxAXYqNV3vG312ZwZWI6g7B6toSMw7uokT0UEjC9B9+CImYHJVNfDXkV?=
 =?us-ascii?Q?D0ma6hzRrpuzEM/blHrvfBw9Uh7Vt/CkIPJ/8Negrej13tsclXMCJMSD3nCX?=
 =?us-ascii?Q?GEnBSMrbnlOrctjiyPyomW4W6tmOs5k+9uW1VhFSRDCeAGzxYDcGe0KyWA4x?=
 =?us-ascii?Q?cA6Rc9s4w24DTNx5fj5CBlUzuBj6UpFvqHMjFh0EvdKKj6MzwJVMD5IuorKn?=
 =?us-ascii?Q?0HDQDdKasIqoQED2yNknGqPzB7E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad524fc-dacf-4319-6aa0-08d9b382a907
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 21:53:21.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9r7uCc8jjVzhcnGZBXVg6i9QkZ8g2oCV9EAhY6IJW62dXcyqUKo8R7BRvySgDOxDBTu7IvDK2EQrRiWT1MotIUmfz4d8Ojw1yGOfUFqtWso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747
Received-SPF: pass client-ip=40.107.8.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Reconnect feature was never prepared to handle server options changed
on reconnect. Let's be stricter and check what exactly is changed. If
server capabilities just got richer don't worry. Otherwise fail and
drop the established connection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2: by Eric's comments:
 - drop extra check about old->min_block % new->min_block
 - make context_id check conditional itself
 - don't handle READ_ONLY flag here (see comment in code)
 - wording

 Code seems quite obvious, but honestly I still didn't test that it does
 what it should :( And I'm afraid, Qemu actually doesn't provide good
 possibility to do so.

 Eric, may be you know some simple way to test it with nbdkit?

 include/block/nbd.h     |  9 +++++
 nbd/client-connection.c | 88 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b774..9e1943d24c 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -157,6 +157,10 @@ enum {
 #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
 #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
 #define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
+/*
+ * WARNING! If you add any new NBD_FLAG_ flag, check that logic in
+ * nbd_is_new_info_compatible() is still good about handling flags.
+ */
 
 /* New-style handshake (global) flags, sent from server to client, and
    control what will happen during handshake phase. */
@@ -305,6 +309,11 @@ struct NBDExportInfo {
 
     uint32_t context_id;
 
+    /*
+     * WARNING! When adding any new field to the structure, don't forget
+     * to check and update the nbd_is_new_info_compatible() function.
+     */
+
     /* Set by server results during nbd_receive_export_list() */
     char *description;
     int n_contexts;
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 695f855754..d50c187482 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -37,6 +37,10 @@ struct NBDClientConnection {
     bool do_negotiation;
     bool do_retry;
 
+    /* Used only by connection thread, does not need mutex protection */
+    bool has_prev_info;
+    NBDExportInfo prev_info;
+
     QemuMutex mutex;
 
     /*
@@ -160,6 +164,69 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
     return 0;
 }
 
+static bool nbd_is_new_info_compatible(NBDExportInfo *old, NBDExportInfo *new,
+                                       Error **errp)
+{
+    uint32_t dropped_flags;
+
+    if (old->structured_reply && !new->structured_reply) {
+        error_setg(errp, "Server options degraded after reconnect: "
+                   "structured_reply is not supported anymore");
+        return false;
+    }
+
+    if (old->base_allocation) {
+        if (!new->base_allocation) {
+            error_setg(errp, "Server options degraded after reconnect: "
+                       "base_allocation is not supported anymore");
+            return false;
+        }
+
+        if (old->context_id != new->context_id) {
+            error_setg(errp, "Meta context id changed after reconnect");
+            return false;
+        }
+    }
+
+    if (old->size != new->size) {
+        error_setg(errp, "NBD export size changed after reconnect");
+        return false;
+    }
+
+    /*
+     * No worry if rotational status changed.
+     *
+     * Also, we can't handle NBD_FLAG_READ_ONLY properly at this level: we don't
+     * actually know, does our client need write access or not. So, it's handled
+     * in block layer in nbd_handle_updated_info().
+     *
+     * All other flags are feature flags, they should not degrade.
+     */
+    dropped_flags = (old->flags & ~new->flags) &
+        ~(NBD_FLAG_ROTATIONAL | NBD_FLAG_READ_ONLY);
+    if (dropped_flags) {
+        error_setg(errp, "Server options degraded after reconnect: flags 0x%"
+                   PRIx32 " are not reported anymore", dropped_flags);
+        return false;
+    }
+
+    if (new->min_block > old->min_block) {
+        error_setg(errp, "Server requires more strict min_block after "
+                   "reconnect: %" PRIu32 " instead of %" PRIu32,
+                   new->min_block, old->min_block);
+        return false;
+    }
+
+    if (new->max_block < old->max_block) {
+        error_setg(errp, "Server requires more strict max_block after "
+                   "reconnect: %" PRIu32 " instead of %" PRIu32,
+                   new->max_block, old->max_block);
+        return false;
+    }
+
+    return true;
+}
+
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
@@ -183,6 +250,27 @@ static void *connect_thread_func(void *opaque)
                           conn->do_negotiation ? &conn->updated_info : NULL,
                           conn->tlscreds, &conn->ioc, &conn->err);
 
+        if (ret == 0) {
+            if (conn->has_prev_info &&
+                !nbd_is_new_info_compatible(&conn->prev_info,
+                                            &conn->updated_info, &conn->err))
+            {
+                NBDRequest request = { .type = NBD_CMD_DISC };
+                QIOChannel *ioc = conn->ioc ?: QIO_CHANNEL(conn->sioc);
+
+                nbd_send_request(ioc, &request);
+                qio_channel_close(ioc, NULL);
+
+                object_unref(OBJECT(conn->ioc));
+                conn->ioc = NULL;
+
+                ret = -EINVAL;
+            } else {
+                conn->prev_info = conn->updated_info;
+                conn->has_prev_info = true;
+            }
+        }
+
         /*
          * conn->updated_info will finally be returned to the user. Clear the
          * pointers to our internally allocated strings, which are IN parameters
-- 
2.31.1


