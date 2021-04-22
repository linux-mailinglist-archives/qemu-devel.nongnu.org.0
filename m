Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8044436851F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:44:38 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcRR-0002TS-I0
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEn-0007e1-T5; Thu, 22 Apr 2021 12:31:34 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com
 ([40.107.4.129]:3204 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEl-0003yB-OO; Thu, 22 Apr 2021 12:31:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9aG/2NTuK4L1b47xGHVropXE0ltoxz3pyQCa7hys/UKYHu/mridpnh8DXxtqqOVYzTFTp3jLfRpvOvY9tZVB7FS5Q8evBctKzB2p7dBQttR9qDRoppIr6TcSsoWK87BeXgDFPzmIXsFXp6kE2JsoyjJyfdZbPux4Lyy0RU8AHir6mZsYgjpq3LTd5yP+j5ut3WUcsTpC57y6dfCfLben2mka90jlb5pWaS+AWQ2yDKA6KqSzNPcfiI/9TzMihK35DqDMkTeH3eHW/RkpUz8jG6mGtE6gJhzWpNIyWr3G8C7jvD98bmVImQtY9t2o0Cw9p9eZVuAVGcc/VVsitoAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0aj8X3EAh1h1aoYAEOld6mkPEkYJEWMxFysi/PMbYU=;
 b=iq1+6lUR67QNY5ChfsvMg+N1XvUeEkAresyjH2P113spcwPmFQ1XyyZoPjDYAdT6NHCvRFE5hrY3gN7FZhGV/QlbHETBThGEbBozJRfFxSNAQ5IHYF0LSgvIAJMvHnWJbpWzsXYbehPDbvV38ryn5imwg3gMATXbxu20+lX8mBMTgO38KvQHvivAQPDgV+rNEd8kMk7vthhqHhkvU5jsCY1LvopOJaEM/95aph7jDQp7ipo0KWCjrn8Qd1A6qU2OyJeK7SFTu2pcnmQRv2bVIdS4PSPd0wsMBVnNNv2+YqledjHPiJhhEMMyL90kircBJiX2EC5IE5qylQPO4KT3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0aj8X3EAh1h1aoYAEOld6mkPEkYJEWMxFysi/PMbYU=;
 b=UzHCbdCmgN6C5NvtNb5WhhxPTaZOVK54/H0dEcLL1LfgTnhNJ5zLRme1Hkhz14//bSzwsyEKixbgRrGR/ZYCLqXk8fUffLXvcpxyMRTjpwjpTadkPcyUj3WxzCAlLLhcH5Lx/XxEePdckHElJPkPHD3ooby2IcUwmcqnZeVsduM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 12/12] qcow2: protect data reading by host range reference
Date: Thu, 22 Apr 2021 19:30:46 +0300
Message-Id: <20210422163046.442932-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 413ddaa3-34c4-43de-b2e5-08d905ac0b13
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38613854B181DA25A4DB2A7FC1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TWImK05cqVO6PC35KAwSrxRLp5q5i1dmeB89ZSGa+56dMZtOaVf60lwou97QglbvKtgO26mmJ5kuMAURxJ4PZEs53To07ceBGQb6VotKXjmWXqcNKjx2tXJnpZEfHhkw7O9tRroazyp6ESd0/dnGBMQ5BBY4kEvShk8Jv4W2lu7za6Xjp5xpaU1NAc1fPbj0uoGUn+ilktf0mb6Yy4OBlbeSI+horxStJhb/3FSSJpv7cAMTTh9+fe5hMP0mh7+YvchS9nbKg5GDO/Vo+zJkOfaZBwnKr7SNTyQHXdpdrTB/33+lPlERUl+i6DfLYosQ56xbrsVbCxtP1uotmbF7J1r2NEwjZZ2FfKWKPUaVEYfy4U1VtredrAovY/SWnrrh/lMtRojI+3hiC4FbGwazmGwXvAA2LR3fzotpkfcsDa6yNUb8y33ZNK0H2e7N5ExGypqoNrhAfSYT7Or4S4JFOy/JBLCpXrgiSotD5/Ox2rV/tanuv7bX8Nsy7c7XjJImknurRji4tVgFX8pcB9NAIUsJmKhz8/YoOuSFErpl+vQwvOZWsliAjt77EHwvspmcGCOsOjdJ9PIUzHpXwfoNrNRGNRSJsduSlOt2xDbnVIPDS4BUriIijTaGXd2ugMF/X7T2WAAzSvr58PpthxYB50Cekdg2dLvXCIvIkGjseWLfxTBfe0KSV6K/S3TJ0Nij
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(19627235002)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uRAD/1B9iIEWb9DcK2AJ7/dzc1qcQ5wV1LTK48as4q/cYo5hc4Lj+z/2gSjx?=
 =?us-ascii?Q?B2VyNL9tzPYF4mtjLypw/BZ30xsyTkyWwnEDlMRzrCNZXsI94uG1xYqfmxdu?=
 =?us-ascii?Q?IMANaexlgv4Oe3KBYpPtjZeTwC0dSa/1bIPadhPRPz7qZnU7fvayajfYqDUT?=
 =?us-ascii?Q?n/HbV64lK22O7dXhTQI7CXfDxfqzoQiKf6oLehsWFS05dERMHhkf/xhYT8Qb?=
 =?us-ascii?Q?lryV9kal/dPT72egUbwIPF+7TrRlg3ddMywH3lktmxgtFsmXOTTtq5WuOa82?=
 =?us-ascii?Q?0bbhSr6DIy9Lio9XFcy5mv93M5Y3BM5+xRGHhvnG9OLyy9L/A24xXmAPzsO5?=
 =?us-ascii?Q?HiBYREPNvjFthgFtipyOX5NYpZKQV78EMdpiYtGSszRYm/rwAqy4t8vmLrgE?=
 =?us-ascii?Q?9draxWuztEkk/5IdFk155VzN4gHO442gHSczAmJ47NpIbk2BtzTa9lsJaCZC?=
 =?us-ascii?Q?Z18VB5VepZMEfZvO9LQQTIsl+tnVJjH2vO2JCKGdwEtPERiEBoOVXnjdjPZM?=
 =?us-ascii?Q?XmUmzT7+FVg63VXuJbxcaH4AlZnvHCUQAznrPTGCHHBuBJo16I0p1GOaX0FU?=
 =?us-ascii?Q?v4JiFun6gkw7gTQFW9cPrteBJYCe3c8UskzZv46sVN0Kb5vSSwFHIbtKKnH9?=
 =?us-ascii?Q?8AxHizSHTic5t7jKESZad3/hBVm4VSENJBpn2eIgOwzqx2cP8HQI6nQAkK70?=
 =?us-ascii?Q?VZcBgx8lRnX4foWtubzOEjdiHoXecIzmG3S0Dw/NPsSL11HCRATwoUQpHCOk?=
 =?us-ascii?Q?akyBQg1GutGDuqSrLj4EVaH7pAQaooG1Yo4QtJBT3CaNxyfBm/pM04ocgMo4?=
 =?us-ascii?Q?GQAIRXiy8wgU1EVyJCRaawDpU8Sn5iuqgzhBWS7315+riMkT4UlDMFxIzM3U?=
 =?us-ascii?Q?Un1w2+4hfJVgoUbYUwSMG5uCDVJNpp8lEOqg+eBZSs5d7By2+DNgv8tSj+bF?=
 =?us-ascii?Q?4U+DTV7ZaVH4RWboiO0dOkUeRnzxCJiytMizP43r5aOUtZXCBMhRepCLu551?=
 =?us-ascii?Q?TVmH5AyTu31o3MKNCN6R1FQVrR5qbmt5+xm1cYPMpdU8d75oI5x2tyX3ZLzt?=
 =?us-ascii?Q?n9/JpikZIxgyV5Qk39+/gn7+26kcBY7kuoWT2vPiBrH1P1Lbjlk6N+876Q1d?=
 =?us-ascii?Q?/Vc9x21etJI+eIOJLcmEqZ5xRjeenpPiD4rribDscOrn5Hl3fs13Eg4dfmd+?=
 =?us-ascii?Q?JXVRDipGfA+ToIyTgR7dP8ndfWCZB3bd21CoWsmqCaD09qQ18ezBM4rOpCQx?=
 =?us-ascii?Q?QUX9Dg12d9wl3JPTDM3FWBGJdD+vxx/QtkggLXadeAe+DZKyO1JfPFoME+iQ?=
 =?us-ascii?Q?wlO+JnyiWwijktsIUrXrZBCT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413ddaa3-34c4-43de-b2e5-08d905ac0b13
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:12.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F9Dn3SdVJUDbhriGhZk0z3s4acfoSMeqrKrIWZzmBiMXea/q4XmRtssORVVc/6TGHiTpNg6Qv1DpDAsVmnKjrMseO5Jx5qEGNfXiQMZUco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.4.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Similarly to previous commit: host cluster may be discarded and reused
for another cluster or metadata during data read.

This is not as dangerous as write path, we will not corrupt data or
metadata. Still it's bad: guest will probably see data or metadata
which it should not see, so it's a kind of security hole. Let's fix it
too.

Data reading goes through qcow2_get_host_offset(). Let's reference
range returned by this function. Read path differs from write, as we
have to handle compressed cluster descriptor. Also, we should handle
ZERO and UNALLOCATED clusters, for which we have nothing to ref. So, to
keep the whole logic in one place, create qcow2_put_host_offset(),
which should be always called after qcow2_get_host_offset().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h         |  3 +++
 block/qcow2-cluster.c | 38 ++++++++++++++++++++++++++++++++++++++
 block/qcow2.c         | 15 +++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index c40548c4fb..2ac61eccc5 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -926,6 +926,9 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
                           QCow2SubclusterType *subcluster_type);
+void qcow2_put_host_offset(BlockDriverState *bs,
+                           unsigned int bytes, uint64_t host_offset,
+                           QCow2SubclusterType subcluster_type);
 int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                             unsigned int *bytes, uint64_t *host_offset,
                             QCowL2Meta **m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 999a739024..126d95b062 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -568,6 +568,10 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * Compressed clusters are always processed one by one.
  *
  * Returns 0 on success, -errno in error cases.
+ *
+ * The returned range is referenced, so that it can't be discarded in parallel.
+ * Caller is responsible to unref by qcow2_put_host_offset() after finishing IO
+ * operations with the range.
  */
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
@@ -721,6 +725,17 @@ out:
 
     *subcluster_type = type;
 
+    if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+        uint64_t coffset;
+        int csize;
+
+        qcow2_parse_compressed_cluster_descriptor(s, *host_offset, &coffset,
+                                                  &csize);
+        qcow2_host_range_ref(bs, coffset, csize);
+    } else if (*host_offset) {
+        qcow2_host_range_ref(bs, *host_offset, *bytes);
+    }
+
     return 0;
 
 fail:
@@ -728,6 +743,29 @@ fail:
     return ret;
 }
 
+/*
+ * Caller of qcow2_get_host_offset() must call qcow2_put_host_offset() with
+ * returned parameters of qcow2_get_host_offset() when caller don't need them
+ * anymore.
+ */
+void qcow2_put_host_offset(BlockDriverState *bs,
+                           unsigned int bytes, uint64_t host_offset,
+                           QCow2SubclusterType subcluster_type)
+{
+    BDRVQcow2State *s = bs->opaque;
+
+    if (subcluster_type == QCOW2_SUBCLUSTER_COMPRESSED) {
+        uint64_t coffset;
+        int csize;
+
+        qcow2_parse_compressed_cluster_descriptor(s, host_offset, &coffset,
+                                                  &csize);
+        qcow2_host_range_unref(bs, coffset, csize);
+    } else if (host_offset) {
+        qcow2_host_range_unref(bs, host_offset, bytes);
+    }
+}
+
 /*
  * get_cluster_table
  *
diff --git a/block/qcow2.c b/block/qcow2.c
index d0d2eaa914..d3461b7243 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2069,6 +2069,8 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
         return ret;
     }
 
+    qcow2_put_host_offset(bs, bytes, host_offset, type);
+
     *pnum = bytes;
 
     if ((type == QCOW2_SUBCLUSTER_NORMAL ||
@@ -2227,6 +2229,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
     return 0;
 }
 
+/* Function consumes host range reference if needed */
 static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              QCow2SubclusterType subc_type,
                                              uint64_t host_offset,
@@ -2272,6 +2275,8 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
         g_assert_not_reached();
     }
 
+    qcow2_put_host_offset(bs, bytes, host_offset, subc_type);
+
     return ret;
 }
 
@@ -2320,6 +2325,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
             (type == QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC && !bs->backing))
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
+            qcow2_put_host_offset(bs, cur_bytes, host_offset, type);
         } else {
             if (!aio && cur_bytes != bytes) {
                 aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
@@ -3968,6 +3974,12 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
             return ret;
         }
 
+        /*
+         * We do the whole thing under s->lock, so we are safe in modifying
+         * metadata. We don't need the reference.
+         */
+        qcow2_put_host_offset(bs, nr, off, type);
+
         if (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
             type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
             type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
@@ -4064,6 +4076,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
             break;
 
         case QCOW2_SUBCLUSTER_COMPRESSED:
+            qcow2_put_host_offset(bs, cur_bytes, copy_offset, type);
             ret = -ENOTSUP;
             goto out;
 
@@ -4079,6 +4092,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
                                       copy_offset,
                                       dst, dst_offset,
                                       cur_bytes, read_flags, cur_write_flags);
+        qcow2_put_host_offset(bs, cur_bytes, copy_offset, type);
         qemu_co_mutex_lock(&s->lock);
         if (ret < 0) {
             goto out;
@@ -4700,6 +4714,7 @@ void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
         (*coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
 }
 
+/* Function consumes host range reference */
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
                            uint64_t cluster_descriptor,
-- 
2.29.2


