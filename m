Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6449560C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:41:50 +0100 (CET)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfBk-00017u-TI
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:41:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBS-0002ab-EP; Thu, 20 Jan 2022 11:21:13 -0500
Received: from mail-eopbgr60119.outbound.protection.outlook.com
 ([40.107.6.119]:9553 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBP-0005q6-8P; Thu, 20 Jan 2022 11:21:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI7RslUCoLdZtgjSzkldYhhREKul7U/ce/yGbeEaYvw8ImCXfM0JRZC2l6RGvMIicpdb9DFwtfIuUUPWHWYH7lV3pJMkhs/9JDaiaRJrNCoVy1N3nh7JbJj7VUpYJxAsJmpq1KrW3d0jJViyS6Sbc2rX9uNNPJZVMxaopvF31RLgNSnyDMAXEPZ/F13gMoB2PSwxrmi/ZRs9WMmcIM2vj/B+hQFSDh8bXTUqXFPdIw+IQ3Pg0SPp1J2BadnFylgFTGesTj4Oz2Ack12Bjof2Sh3NtklucSs3fM6w0CYegxqadEEbp7hYUJulJhE3yB77r0NAjm2oU8Cv5M+epSH5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XphkeIN3GJyD4VhIQzCRKGqlEWSP1GAF6GjlKtgaEVg=;
 b=RIlknJxmjDpb0cnCpWl/xzY1uKQCDktY7DSeNzXR99oJpZ/AVEUdjcJtPoWysS8kdj8oEudeZZ3v6OQpUFuWw/62ZysjQMLCuTQPZrwjUwR3Ew+JdqG4zSj28/w9rhCS/nU//cPXUrDVLTE2FxN2nBjvDyRGMqO2Csf0uuvbgqumSSD0jgetqDfqntueAgbNMR5Jx9+FsH7uB9u6iloWnbGEkoo+pPk1YmooewNheyfm/oqw6bqkOMWwJVAAt8hPbc+xaH+4MtdeLqcKZG+/VvfmSVREUwEAxM2YAOP7lJGhDUiGs65480JoH5klk4//UcUkBs1UwIOjNgsNWZa9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XphkeIN3GJyD4VhIQzCRKGqlEWSP1GAF6GjlKtgaEVg=;
 b=iLeZvlnXPpOi0PlRmBF6iLK63ecaesCSFSm1NtzA1D+sCcdbOh7v8se0UO5YBSCZ6dlyljA810GAh/hTyIWZqEz7Euic4Oyj+XDIDTvGWtPqI2WpTUsY22BI4B5KiLYx22mUhen5L1V0lusavDosxWHOHT+oz/YoUoWaCc7U2+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VI1PR0802MB2238.eurprd08.prod.outlook.com (2603:10a6:800:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 16:21:02 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6%6]) with mapi id 15.20.4888.013; Thu, 20 Jan 2022
 16:21:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 1/2] qcow2: add keep-dirty open option
Date: Thu, 20 Jan 2022 17:20:42 +0100
Message-Id: <20220120162043.2693196-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
References: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0118.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::23) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37e6f83-84a2-498e-b65f-08d9dc30d945
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2238:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2238B1F088F67C89E086E52EC15A9@VI1PR0802MB2238.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBXWtmpdDtxbnswq1eYCTb2VYL00N1SZKdSHZ7gGRmGXraQnQWsml+AQTwqaJ4te9nz3hcp6/pqiPSU0nyG/2vmBW9pQIidxoWX5HWin+GHo5FYOovdmYk+J3sybf+m7fcxiGnQ05ynQjZauwFJG4CvQuMhN6nFaw1PJrbSxgG/A6I4fkbCBjEAztXdfQmNbs4OUVX8um3pHK7SIrt0atFyDJqsjaWI++EQ0wI1rjg7Qnoe+Uu002/77Y52XaEwwgJBYcR/2ZOdqWBML4AOQ3NIzoGuZSn3oq4wsAHjOGAENKljrYwApFvl88nQmA5MGTQ4zRu6VLp8tHdlG1SRFH2mHfW2uKmzkepKKx3cd6Inr2WYYDnF1lVEN/O+LPb+jjfCH4Ems7lEdxtXJ+lChMQKyMIxs7TIAmR7Qwr0XHOL2SUhG1TlsJDDScFlxTQnjfz7ZhVMyVDb4XNzyEXN1dieNWeXQMWfv60JForpK1vBUPR+aj5kPoFaNHhUN2NO9pg8Qy/R3CuclF2Kot+NqGZ+HIFsA01ucnBbnKZ48cErdZUKrscWb+PGKhuFckjwni/ATb+rAIXpKmoECAW0F/v9n92epZK6Dr29P7kVnTEBRKGOpEIosSPLRSC2OQVs+XrgIU/hZZXvb4km4VbCvA26QW7KPu13RS0nScZItEWEA98Nkws/OuPAdxVwHYStIOS0kDPzIqV/15+Bza2cKGIob5rtklzgP6klP6gHbJKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(83380400001)(36756003)(66556008)(6916009)(2906002)(8936002)(316002)(26005)(8676002)(4326008)(107886003)(2616005)(6506007)(508600001)(66946007)(86362001)(6666004)(19627235002)(38100700002)(52116002)(6486002)(1076003)(38350700002)(186003)(5660300002)(6512007)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ufoDhjNrjnIOcZjDypZh2Mqd1oca4x1jzEmBsyIdUQUW4mX+/xpp9/EctzJ3?=
 =?us-ascii?Q?SeS2ND6oZbiAxCV4/0EEGfRqhfnvcnrn6pLc0BQHdNldk340bROh1hKp9whj?=
 =?us-ascii?Q?gUBnrU/cwhT8wsTihhVDHIOKws7c9Ya+GIaAEA4l8kHHm4QqSnnzm2ogsNs7?=
 =?us-ascii?Q?RdGSH016ejGT3/nIqYSsYzK2aTQAC0PuqGPJu6dkih9OO4iUIDcXPgcrAh+1?=
 =?us-ascii?Q?d8Gr+/l70oyReze6Au6574XTce92GZ1+/zvphecnnHfNVY9QFNZIg3HBBO5o?=
 =?us-ascii?Q?V9ppw8cbUr5V9C3YNv4/LkWgMXs7zRMTNbV2xD9fonL59g6nUv8ZGcGibGZU?=
 =?us-ascii?Q?YZZeiolIY+zjtLBH9ZykANt1udtNvpXtIVrDTSem99M44kqy+qJ4S1D74mi5?=
 =?us-ascii?Q?xpidnoX/Y+O+mNBSQRt9J71rNCmRpF0lFWB5J7ZZobttOIa+QgsmT0j0E4xT?=
 =?us-ascii?Q?smk6M+gfV8emLVRZT8lE6dLbMrVIFb/Nkn/HAH1xAsvQtuYZ6+fblRdNUpl7?=
 =?us-ascii?Q?hAxeJlpUzue0ggWb6Y/8veh7mZyysh3u7Pdpf70CTNjr6KMt1+jT2KZmWx0p?=
 =?us-ascii?Q?qoVWI5q4fJysvvv0y0fmFLkH6kZ8SLRwCEox8CVNjZSnRAGANotFrAibgjhl?=
 =?us-ascii?Q?s66QIaGvO5FyqVHwI6vC2WosFrfd+FmS3+F/1E1E7KxbknCGlFNzwRwkFXcR?=
 =?us-ascii?Q?e8MFANg4IWTCnhEpwrGf9Gr73DxVqxpN/6Du3cBAxG6E3YeMPoLGStQyDM/d?=
 =?us-ascii?Q?Rx7g0QZhGMCzQGzY/vLtrsyu9aWo47nkRSRlBUwbfXwxTBVGYfzWijWl5yil?=
 =?us-ascii?Q?2P9keIFAwlumOUo8re3kvC/m6qrJ6I3ILgHZqXYROKNhULU1zS2+upkgGkEx?=
 =?us-ascii?Q?IqcpcuK/Ai0GT8eiYVKtqRliwz8tb3D14vlv/dBmtk4+z3+DmtfvYzberje5?=
 =?us-ascii?Q?iIRdPFF61huaWo2KECMdXODVbqUuZCleuGoCDJ+A0niNAORTFXb7nJ9YSYug?=
 =?us-ascii?Q?v21uDXP/ayifHe+I8GLeCtyN1+24tDIwlBnc3poY+/HrVwHuMZNN3r/tg9sA?=
 =?us-ascii?Q?4NERMTyGVsxfd7xcIQ5PY0o+i7lczpdH6QpgvOfE56GfHznPHg/AAfGZUme2?=
 =?us-ascii?Q?6txJepDD4D563OKi4K77CCe8mLNCsTBvSS10bP5mmUo8H9tKsi1qDWWdR8xu?=
 =?us-ascii?Q?/YPb+Vi3QQajp6xSpZJ+QjyjlG48epvyqzrI24lgk9X2GbeAVT9zlq30+RRE?=
 =?us-ascii?Q?w71573pt4wVPpNGmzybdx+axCYCS28zU0fbH3d6iDiT7ravAvB6MiIQWOUg1?=
 =?us-ascii?Q?hAHwH9WC9rOAKLaFL+RB5JnHirZC9bIDcNbjxQ5DKVzoudpv5tJFpiK6VQoG?=
 =?us-ascii?Q?SMiW8fpAXEKB1g+B6llaR01MBvhN5GZWdeZVY4mmaEvPw95myS98d5AXnBUE?=
 =?us-ascii?Q?cUe0hHFFNCCVF//ZsZpJszbLvokxMz/gC3bs5L2mTsoCyAJutyTnzOmGgVff?=
 =?us-ascii?Q?fXKsyvDhkVN5zB3+wc14WT6+Ts0BAfEinczZ2P8gIaotx/FFNIW7u0BPDM69?=
 =?us-ascii?Q?E8v7n2oPO2vNB2GrAIwjGkIqxJSldqODgPKGQm/8GZ4BvuJjFxvJMDXKAJhG?=
 =?us-ascii?Q?aDg3ZorqZz7O2kWp+kHQiVQidNxSyYjRSmJpqV8p3XxMGMlfGa/N6eQ1LucI?=
 =?us-ascii?Q?gvhptbiK2Ki2GZMCqm/jRUoVMCU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37e6f83-84a2-498e-b65f-08d9dc30d945
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:21:01.8587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVrLNuf/bM/J8sU/UhSFpYI7E0u86+bsZsLMVWsoZxynQk0vVFhNS9fEbR1owSheWT5mZlFKUXPq9ZOvMqLMx4SJy53ioTzRxEDOfhfnBFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2238
Received-SPF: pass client-ip=40.107.6.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Consider the case:

Thirdparty component works with qcow2 image, and dirty bit is set.

Thirdparty component want to start qemu-img to do some manipulation.
Ofcourse, third party component flushes refcounts and other metadata
before starting QEMU.

But the component don't want to clear dirty bit, as this breaks
transactionability of the operation: we'll have to set it again but it
may fail. Clearing the dirty bit is unrecoverable action and can't be
transactional. That's a problem.

The solution is a new qcow2 open option: keep-dirty. When set:
1. On qcow2 open, ignore dirty bit and don't do check: caller is
   responsible for refcounts being valid.
2. Never clear dirty bit during QEMU execution, including close.

Details:

1. For simplicity let's just not allow keep-dirty without lazy
   refcounts.

2. Don't allow to open with keep-dirty when dirty bit is unset. This
   may mean some error in user logic.

3. For implementation do the following: dirty flag
   in s->incompatible_features behaves same way as without keep-dirty
   option: it actually designate status of refcounts dirtiness. But we
   never clear the flag in the image, and we remember that it is always
   set.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json |  5 ++++
 block/qcow2.h        |  2 ++
 block/qcow2.c        | 66 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..3e35357182 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3228,6 +3228,10 @@
 # @lazy-refcounts: whether to enable the lazy refcounts
 #                  feature (default is taken from the image file)
 #
+# @keep-dirty: whether to not touch dirty bit. When set, QEMU doesn't
+#              check refcounts on qcow2 open (ignoring dirty bit) and doesn't
+#              clear dirty bit on qcow2 close. (since 7.0)
+#
 # @pass-discard-request: whether discard requests to the qcow2
 #                        device should be forwarded to the data source
 #
@@ -3276,6 +3280,7 @@
 { 'struct': 'BlockdevOptionsQcow2',
   'base': 'BlockdevOptionsGenericCOWFormat',
   'data': { '*lazy-refcounts': 'bool',
+            '*keep-dirty': 'bool',
             '*pass-discard-request': 'bool',
             '*pass-discard-snapshot': 'bool',
             '*pass-discard-other': 'bool',
diff --git a/block/qcow2.h b/block/qcow2.h
index fd48a89d45..696e13377a 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -130,6 +130,7 @@
 
 #define QCOW2_OPT_DATA_FILE "data-file"
 #define QCOW2_OPT_LAZY_REFCOUNTS "lazy-refcounts"
+#define QCOW2_OPT_KEEP_DIRTY "keep-dirty"
 #define QCOW2_OPT_DISCARD_REQUEST "pass-discard-request"
 #define QCOW2_OPT_DISCARD_SNAPSHOT "pass-discard-snapshot"
 #define QCOW2_OPT_DISCARD_OTHER "pass-discard-other"
@@ -376,6 +377,7 @@ typedef struct BDRVQcow2State {
     int flags;
     int qcow_version;
     bool use_lazy_refcounts;
+    bool keep_dirty;
     int refcount_order;
     int refcount_bits;
     uint64_t refcount_max;
diff --git a/block/qcow2.c b/block/qcow2.c
index d509016756..1c42103fb9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -514,15 +514,17 @@ int qcow2_mark_dirty(BlockDriverState *bs)
         return 0; /* already dirty */
     }
 
-    val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
-    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
-                      &val, sizeof(val));
-    if (ret < 0) {
-        return ret;
-    }
-    ret = bdrv_flush(bs->file->bs);
-    if (ret < 0) {
-        return ret;
+    if (!s->keep_dirty) {
+        val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
+        ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
+                          &val, sizeof(val));
+        if (ret < 0) {
+            return ret;
+        }
+        ret = bdrv_flush(bs->file->bs);
+        if (ret < 0) {
+            return ret;
+        }
     }
 
     /* Only treat image as dirty if the header was updated successfully */
@@ -549,7 +551,13 @@ static int qcow2_mark_clean(BlockDriverState *bs)
             return ret;
         }
 
-        return qcow2_update_header(bs);
+        if (!s->keep_dirty) {
+            /*
+             * No reason to update the header if we don't want to clear dirty
+             * bit.
+             */
+            return qcow2_update_header(bs);
+        }
     }
     return 0;
 }
@@ -709,6 +717,11 @@ static QemuOptsList qcow2_runtime_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "Postpone refcount updates",
         },
+        {
+            .name = QCOW2_OPT_KEEP_DIRTY,
+            .type = QEMU_OPT_BOOL,
+            .help = "Keep dirty bit untouched",
+        },
         {
             .name = QCOW2_OPT_DISCARD_REQUEST,
             .type = QEMU_OPT_BOOL,
@@ -966,6 +979,7 @@ typedef struct Qcow2ReopenState {
     Qcow2Cache *refcount_block_cache;
     int l2_slice_size; /* Number of entries in a slice of the L2 table */
     bool use_lazy_refcounts;
+    bool keep_dirty;
     int overlap_check;
     bool discard_passthrough[QCOW2_DISCARD_MAX];
     uint64_t cache_clean_interval;
@@ -1088,6 +1102,13 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
     }
 
+    r->keep_dirty = qemu_opt_get_bool(opts, QCOW2_OPT_KEEP_DIRTY, false);
+    if (r->keep_dirty && !r->use_lazy_refcounts) {
+        error_setg(errp, "keep-dirty requires lazy refcounts");
+        ret = -EINVAL;
+        goto fail;
+    }
+
     /* Overlap check options */
     opt_overlap_check = qemu_opt_get(opts, QCOW2_OPT_OVERLAP);
     opt_overlap_check_template = qemu_opt_get(opts, QCOW2_OPT_OVERLAP_TEMPLATE);
@@ -1214,6 +1235,7 @@ static void qcow2_update_options_commit(BlockDriverState *bs,
 
     s->overlap_check = r->overlap_check;
     s->use_lazy_refcounts = r->use_lazy_refcounts;
+    s->keep_dirty = r->keep_dirty;
 
     for (i = 0; i < QCOW2_DISCARD_MAX; i++) {
         s->discard_passthrough[i] = r->discard_passthrough[i];
@@ -1810,7 +1832,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
     /* Repair image if dirty */
-    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
+    if (!s->keep_dirty && !(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
         (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
         BdrvCheckResult result = {0};
 
@@ -1825,6 +1847,20 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
         }
     }
 
+    if (s->keep_dirty) {
+        if (!(s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
+            error_setg(errp, "keep-dirty behaviour is requested but image "
+                       "is not dirty");
+            ret = -EINVAL;
+            goto fail;
+        }
+        /*
+         * User guarantees that refcounts are valid. So, consider them valid,
+         * keeping dirty bit set in the header.
+         */
+        s->incompatible_features &= ~QCOW2_INCOMPAT_DIRTY;
+    }
+
 #ifdef DEBUG_ALLOC
     {
         BdrvCheckResult result = {0};
@@ -2826,6 +2862,7 @@ int qcow2_update_header(BlockDriverState *bs)
     uint32_t refcount_table_clusters;
     size_t header_length;
     Qcow2UnknownHeaderExtension *uext;
+    uint64_t incompatible_features;
 
     buf = qemu_blockalign(bs, buflen);
 
@@ -2846,6 +2883,11 @@ int qcow2_update_header(BlockDriverState *bs)
         goto fail;
     }
 
+    incompatible_features = s->incompatible_features;
+    if (s->keep_dirty) {
+        incompatible_features |= QCOW2_INCOMPAT_DIRTY;
+    }
+
     *header = (QCowHeader) {
         /* Version 2 fields */
         .magic                  = cpu_to_be32(QCOW_MAGIC),
@@ -2863,7 +2905,7 @@ int qcow2_update_header(BlockDriverState *bs)
         .snapshots_offset       = cpu_to_be64(s->snapshots_offset),
 
         /* Version 3 fields */
-        .incompatible_features  = cpu_to_be64(s->incompatible_features),
+        .incompatible_features  = cpu_to_be64(incompatible_features),
         .compatible_features    = cpu_to_be64(s->compatible_features),
         .autoclear_features     = cpu_to_be64(s->autoclear_features),
         .refcount_order         = cpu_to_be32(s->refcount_order),
-- 
2.31.1


