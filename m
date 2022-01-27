Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC149E98E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:59:29 +0100 (CET)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD93Q-0004ni-Hi
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD894-00043N-ET; Thu, 27 Jan 2022 12:01:14 -0500
Received: from mail-eopbgr130133.outbound.protection.outlook.com
 ([40.107.13.133]:11264 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD88u-0002aA-Kc; Thu, 27 Jan 2022 12:01:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEwL0x2SPltNzikxI89dpXdVLNcfH11cJWrNEx8WvSVlv2jzlXEEw5W6t3lrrHSSHNnArDI5oyra28onTmdeN2tLO5d3ZHA1uSRtDHyNftZwyWI64hlhIj4WH0IerXF+hTxhXeQll3aW7z53YkKodeqOgjBeR3xXU74f3inpgUMjSHreAk4jbAwPe1y907c83KTh3iamFleL2ZPofgOgZTWO62kxr3seoSY9IsiZ8kwZrPYVH55nJtlOQeYOtNhsgHYVECby2JnzzADvC1WRUz0uOgWs0RzCQorp13SNoOd3drKrT7tfx9HOEsVTlhnp3hLJ/ZCPXXogYMazG4/F9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0MZ5Jr9yXpAHqEj/OXuwecvceID6C3pGppqTcnvA6U=;
 b=jIma3wc1BDE2GbGyIOQCvHqWqAaUDLRn08SScQbPZ8xiQo6PC/gxbl7wb5fHaMG2kLuoysTUfjiYtnely7rTtI/6pGdNUauRRM2sS94DyxWBgE4LMMpWsUDTBuXia/dNsNvYWQhRqH7PeK+qvjPQ8gHvniKp1ij6p8BQo3cmQc+CwORYoD5Eor02kZU8RYaZvTLPxeoYmSF2gsZaIBb8RfUvAFLd/Q66/gWXq+jDyhPxaIeVWn5iUAZOS5WGimGGeUVPW6QASZXtjTkw7PGkP1ujK5TNhnmdnzAaGPW9IGPXJd7grJc1wvKWTTTuqzQEc6OOETjTOFWJt8Njj8RiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0MZ5Jr9yXpAHqEj/OXuwecvceID6C3pGppqTcnvA6U=;
 b=sx4WLEE9CajexUUXpUWTwBFo610zBP+XjX2P28zHiTXEMrL/jQKamLAdSTGDrzBOb8aBmS2fFUhZi+fOIwlECZS+NwDpIt312WuqLhhg4lrIvTOhPMWLK/UL73udJPWM+fRNW6H06SyGElunVVRgWVR3DZ6me8Mvngi0JANG+fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4436.eurprd08.prod.outlook.com (2603:10a6:208:13a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 17:00:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 17:00:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH v2 1/2] qcow2: add keep-dirty open option
Date: Thu, 27 Jan 2022 18:00:18 +0100
Message-Id: <20220127170019.3292051-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
References: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35ebdee2-e24a-4804-ae48-08d9e1b68605
X-MS-TrafficTypeDiagnostic: AM0PR08MB4436:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4436BA022115186F3D5C4D63C1219@AM0PR08MB4436.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEubmmTQvCnWi3gvABQ/4Yhx0AVr8XM2XYK+bkXxrd6eWgrs9rxQW54BLeIl4lYqF9QmCoLocxcpqAsCc7X2CgdeiiaF6IFvUytkhOUg8j/+IOG9G8/yfZH1EmlJUW9Ec1ELORsq1W/7WLRNr7ec8XWF406jaJi6QeNZdLi0fnh8EHpla1GD5WKiF6Dq8xmMnm2+1owTgoXzGZ7YMwDElvUu3Y2KnaSaSoNa9s9vFNQqs1him9CWfFmhKXimTQ1LudaNFPDBxtVZQem197HBvoWTH0UVnCcWk0h7w4Pbkh+VKX7r0mXiYiUudBwyP2xkjgW2LRdJgECTkZjiyI/RNWBHIQmvb1xonPTibuMLMbkG6xLRa1lAb/2X/VHTseFyhRwfPTyhwnw8z5bFEB6AFifADHK5hLY1lNlDkxeX/1hh5kGidaGS8InYYvlRj5ZrZP85o3UEpQTxbGd+iNj1Zw5daorJ1Vx/A6Wl0wTTch/f3kH3IpUTQ+PvAXfEcOOKeVKynGoQbVYm7+OMWZAkrZN1z+p4Xdb9I9PqD22pBjSTKC3ljTUmA3MXsm9cI/keNmAE5s/RSxAs2ORqcpZoi5RebQ2V/VHRDcZCpcBl/MHJuyg143pv5qg/aPOYDOoLSrKFV6AdZFX6zA7oBHgz2jZGdQrgruvIVkd9pHePg8K7LBx7i5QYo9WxHxoZvJ0kp5mpMTEYizWBJoL/zrPgK3kdZ2//tALktKJIJdpypdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6666004)(6512007)(2616005)(86362001)(6486002)(26005)(186003)(83380400001)(52116002)(6506007)(1076003)(508600001)(66476007)(2906002)(8936002)(8676002)(36756003)(66946007)(66556008)(6916009)(4326008)(38350700002)(38100700002)(5660300002)(316002)(19627235002)(14143004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IIbXEiUCdCTFR2tUZHvkT6Sj/9SKaXBb54ltNsI/lFE0zpokREsJs07eDcp2?=
 =?us-ascii?Q?RmhoAdfwb/+v/U9ovEK6TCnsGrkxsQuc7dubm4PqaLOdfTbho6AnAZuDAmwm?=
 =?us-ascii?Q?/TC0k8wlUja7rsU/H9xdb2wlrA86oeqYZeNZAEC/KqXItuKgA/O2HOqUi3x3?=
 =?us-ascii?Q?P1ZGckp9iGfeC8Xx0WKQwJRbxxvmSfPfpYnKCnpn5vCGyT6Dfd2qyGAUlMXY?=
 =?us-ascii?Q?EziHvozvqF6cSCgbXMbyy8c4m9n9hepFfzUvlVMOUFjA+drDDu8m6cE5daT3?=
 =?us-ascii?Q?GtndYrjkK9wcmLVcYvYUcEzTU5mpmIzud2L1eNJuVQekVryDzvLKMu0XiHw5?=
 =?us-ascii?Q?IGx3LFAI0Zo5MLGxQ43ZZ2ClMr7pG+MtHmyo9B+Xp6KbVpVWMSUoKwOSsGxE?=
 =?us-ascii?Q?KbkmSsMwSjC8mytbbKQLKgH3UOALIOI6Z+hal2vEqB7Z/vZR4DsqrhsxUTTS?=
 =?us-ascii?Q?U7jPZ8OidDGtblpTgD6X7An38w0k/tVAY9vJ6+YZYEFis0udRL2gwKuoZWmF?=
 =?us-ascii?Q?ev1x8KKMDTu7XJ2+4z2X/jxFGoabKy3haAVyt0qQLeyKGiqAJJQpXPWoa4ww?=
 =?us-ascii?Q?G/OMmeH29XUalSCQqMFcKKf8nKkGwbQXNlPNo1HRYW4zmj/aIJxrinJiUAIw?=
 =?us-ascii?Q?0DbmyqYSYfSNQn8JHrJvhZBJ2B8CVKgJGoW511nUX6rvN+WXBaIvdhbpMRY/?=
 =?us-ascii?Q?C6Dp+tSAh97rWWm7smBYrfYvInq/w5w+7DGm2DhLG1ALnKA2TPxxBXdy0Ojl?=
 =?us-ascii?Q?qkqY1S+Bd8BOETKQLHhV12RtMMMXD5Dhzb1lm9glMMqmpKjyetz7uAm/wO/K?=
 =?us-ascii?Q?ifB1AoyMfY2Ra3STOK+Mf9S1898Jbe6uaZafHxSPGli9GdTWsGrIO3Ic8slw?=
 =?us-ascii?Q?L/k6SkHftEVwnC5KnoTk2Pe5pJ/z6jTlgfyp2vY+4uxNZzBaIDzz89e3pUSe?=
 =?us-ascii?Q?3V6b5JYebhwHMh+eJnZt6tPxdQHVHz2sYAeHHtmd4eF/r1ojjFy2w334diWs?=
 =?us-ascii?Q?FG2Xt05g7N2hXKlwZ+AsLfrUvU62+2KkKOFgV1wBljFGxprESoOZtKYpk9P/?=
 =?us-ascii?Q?JmnHbzyFqKlZrsDVwsbngqNuQtsaUerGWj4SxKOHfeeSF/JKP9hvnXULKQI3?=
 =?us-ascii?Q?TyqPsBWI3GlR6PgJffcfULJv+PurbmJrcbolWHbOQyWxgBn2nQDDxCnjf0n9?=
 =?us-ascii?Q?n86mZ7Gh3y6dEYqb6DYnzPEoOUD5d0hMQFH96r1L17EZVbP13ZARhc6KjnPE?=
 =?us-ascii?Q?0SgutJ6yLH12A4Jy2YY8OkkoXQYcB89lul6kJB9G+ZYk0jYjxUIKKKFZKPst?=
 =?us-ascii?Q?qaiuuQ2JSIsmrN+qzAI7sWY8PxxUOX57mmCpor7LlfD6f9pv52jrbgooxUtY?=
 =?us-ascii?Q?zvAMBz2yi7cLar0MhQXirIk5KH1BHpgsrYyUuO1sNJXVmv13ooaD/hkVCA6f?=
 =?us-ascii?Q?GHe/hfGyJMA8nDR2JRp4AQf4AfaWGkFZltNqL+KSVZ2hsvV913RfbNcYIcoq?=
 =?us-ascii?Q?XpyePeXcweUIPLVXkZTq/+aSV7374syWykW4xL50RGpkTk63ke/xvUoKI9ac?=
 =?us-ascii?Q?xwErHKOv+KeS4YNgOTObSP7c4raLzO3TrXJFQsQC6N9BhEe/L0CIl9enAc/T?=
 =?us-ascii?Q?vGUQ7Duiqx3Kh29T0f8m/8IsH5ibdYk/6CpX8UxscyLyUARhadMGLMcl/ESN?=
 =?us-ascii?Q?aRiUazlMDJHYd51p87w9g1LsH3w=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ebdee2-e24a-4804-ae48-08d9e1b68605
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 17:00:29.9702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hGjAZaxkUt8BcmENB4sGhLR3x6rlKNtyqrNgoy0f9jpi/kPZSI5WmQ1dvTnUQ421ITIR7YouTvIFGGXSt/Opt4E5+Up2wPN5TQPtkCFSsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4436
Received-SPF: pass client-ip=40.107.13.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
 qapi/block-core.json |  8 ++++++
 block/qcow2.h        |  2 ++
 block/qcow2.c        | 61 +++++++++++++++++++++++++++++++++++---------
 3 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..4b5c6d7935 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3228,6 +3228,13 @@
 # @lazy-refcounts: whether to enable the lazy refcounts
 #                  feature (default is taken from the image file)
 #
+# @keep-dirty: whether to not touch dirty bit. When set, QEMU doesn't
+#              check refcounts on qcow2 open (ignoring dirty bit) and doesn't
+#              clear dirty bit on qcow2 close. When true dirty bit must
+#              be already set in the image on open, otherwise open fails.
+#              When true user guarantees that refcounts are consistent on
+#              open, so the check is omitted. (since 7.0)
+#
 # @pass-discard-request: whether discard requests to the qcow2
 #                        device should be forwarded to the data source
 #
@@ -3276,6 +3283,7 @@
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
index d509016756..ee82ef2a8f 100644
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
+            .help = "Keep dirty bit set",
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
@@ -1088,6 +1102,8 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
     }
 
+    r->keep_dirty = qemu_opt_get_bool(opts, QCOW2_OPT_KEEP_DIRTY, false);
+
     /* Overlap check options */
     opt_overlap_check = qemu_opt_get(opts, QCOW2_OPT_OVERLAP);
     opt_overlap_check_template = qemu_opt_get(opts, QCOW2_OPT_OVERLAP_TEMPLATE);
@@ -1214,6 +1230,7 @@ static void qcow2_update_options_commit(BlockDriverState *bs,
 
     s->overlap_check = r->overlap_check;
     s->use_lazy_refcounts = r->use_lazy_refcounts;
+    s->keep_dirty = r->keep_dirty;
 
     for (i = 0; i < QCOW2_DISCARD_MAX; i++) {
         s->discard_passthrough[i] = r->discard_passthrough[i];
@@ -1810,7 +1827,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
     /* Repair image if dirty */
-    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
+    if (!s->keep_dirty && !(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
         (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
         BdrvCheckResult result = {0};
 
@@ -1825,6 +1842,20 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
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
@@ -2826,6 +2857,7 @@ int qcow2_update_header(BlockDriverState *bs)
     uint32_t refcount_table_clusters;
     size_t header_length;
     Qcow2UnknownHeaderExtension *uext;
+    uint64_t incompatible_features;
 
     buf = qemu_blockalign(bs, buflen);
 
@@ -2846,6 +2878,11 @@ int qcow2_update_header(BlockDriverState *bs)
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
@@ -2863,7 +2900,7 @@ int qcow2_update_header(BlockDriverState *bs)
         .snapshots_offset       = cpu_to_be64(s->snapshots_offset),
 
         /* Version 3 fields */
-        .incompatible_features  = cpu_to_be64(s->incompatible_features),
+        .incompatible_features  = cpu_to_be64(incompatible_features),
         .compatible_features    = cpu_to_be64(s->compatible_features),
         .autoclear_features     = cpu_to_be64(s->autoclear_features),
         .refcount_order         = cpu_to_be32(s->refcount_order),
-- 
2.31.1


