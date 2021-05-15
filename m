Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D1381934
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:54:30 +0200 (CEST)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhukP-0004xJ-7Y
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue5-0007CS-Ts; Sat, 15 May 2021 09:47:57 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:13825 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue3-00039c-Ag; Sat, 15 May 2021 09:47:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJCKhrUspyeDovLm5Z+gtVbdtOmM3Wp4dQUx3ZqN+I9SHBoUEHlPHPLMuBwM9gcVINKo8MjYghy4Nba7qx9eLxqsvn28gXTM6QwbuGqq1RRCsCCOTD1dAauCMIjvzmtUKTZbTcnaChNrSGxyK4D4nBeuxx3NHfmvfsoKrhpuR2oiMmEFi/Jpjk/23fEbYjX5nbn8T/bPBQ5YA0N06oaZ0kD4LTwBhMO8TFNzUcEjyxx8Px/I8g74BWH97t9/0YeRFSMyvGSC3B99X/mMi+hi7ID0QAYdcbOufRw0GMaiuEAEKudbxiipzHLWc2/IP14/2l8Ykp+H6S9PN63x/iq2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t34kUMCuL9BvKoa2lMzSS9HDBTMX3ZqYY8FXI5DFY8c=;
 b=ZifSuF/Sl+KFGC81l83xE55STQ0HnkiA2UcazIbJGBR5UdHRBJTMmxDtYFMwaGQVOfq+nnkxB7loB+yujze4U0TFq2rYoveXTHz87FlN6VUMRvzTzu8k2yvszBqOkM6KeDZRLqLZgxrYx81yyYI0FPHAS8vJzuVGmbUOmuTA+MWXJN+QmV96FHwxVKdNLF5O403ioJg6lQcdF5UBnwDmH29565NhWq6kgldmw4tDh2ypkDK92Cd65NNSjD8241kCSWT4zVYRq0xtXReO5JZprz8R+j6XoUzhIWnHxmqiew+s735dl5clfbwuu2qFoV44CGikLDgRagj//Bf23/cvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t34kUMCuL9BvKoa2lMzSS9HDBTMX3ZqYY8FXI5DFY8c=;
 b=QHSdG95F+BW/IkTfSQfF+wGZMZxnKweC/nTTo/CWAsWcDRvb56vc4jcQtIDwwb4Zah8nfuiiTOEb1Xa3cx1HcJGTkNnXH7z2q5/cEVRUxc5ikPc/ykQ2aHFTI4kG/uzmUDm1y8KajGfwdBn5QlYHu9YNFQC5bCIpEr2Zactcgh0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 8/9] block: Allow changing bs->file on reopen
Date: Sat, 15 May 2021 16:47:04 +0300
Message-Id: <20210515134705.433604-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02fc58e7-57b3-408b-7164-08d917a7fc66
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206BC5F1F286426FE63F415C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ep9FgmWbJ7D6QhqDfENCcuttYw6GqEM1I9+b+QrmSjXD6sjz7EFwxZbQyxS6LtCutH96jZOCu98CwQdrm8JUIwzVoiSiKvFuLFabM7lgkpjZrLaTdzBhj1AKuihDHoPX2i5+tJAiHYRKghdflU3UVSE1LiOEG5poHROZNKFn/6WlG+7WbJc9fd2NOn681MkmhHyIz9hMGsuH+LvmHM6dbwb4Lnrw1nEFiSPytEjMVjn5kj7liiJCOhlcSe2bDLNKmFdQj/RNFIziTEItQepy5pMdpxKV6t6PFQuVSJJ8vpDTB2rSoAixwdQg4E4bmi6OFo0hRZCnNDoSkrMRBBg65sWh/Gfjw3PGdHKde1Q0ZCSxSF9FoTHRf8xW20CEfqt9zLXXz53Le5C8B0hPIcDwwdULg1DALBgZS/xUg/2dimNy58dgfE5Ot0gItCzT+ym2V78bLvdLnspgQ0jvfz2OK9Wm+KL01TN65ENxW47e4AB+Mu8wawTNrubQYxLlv6+KY6KCFt90yoeLfYXWljTKQ/JIIyu1fEArxDTJXO+YLfFm0hKqek3AlWtYMQmOdLRReooEGJPvdDmy3E5ts34mQXgQ3ypo7Nu4DLh1Nb4rltKC3Md7P6FOvNPkjT/MRRbtkGt9CmsmUvvMZ6+M+F3XiQa1miEvpYO0r3MdL2ae9MNjqUWNQVzOYHQKekyz3KUm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(30864003)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZGuFnidPz89LYYbxdAi6NLb2tZ4laHLccp4bziYzseC2zZDfLAoD5cvHpJAo?=
 =?us-ascii?Q?3afMJH6s2r/H4w1P8NAaqokVo462N3eVh9wadN/cPCj+E4hzEaBo6SA3LIoe?=
 =?us-ascii?Q?ZU040JcLpLPn+7xp9RaMc+aH+8lCY/p8xsVQDiOLvu8M6ZuY5zgAbcavfmHU?=
 =?us-ascii?Q?86gvQmDEPc/eYQLQwPy7ByuiiqlF3IB06oIm/HEpSpjFLt6J2mdzOl+TTv49?=
 =?us-ascii?Q?FvhvtMXV3BN8KhzSGw/OykyzOJX2utFNHJ8XLhSJWLT4l6CWKhKOGAOdJpLx?=
 =?us-ascii?Q?2rGzUGcpjeP9gx23wk+wc85a0tAZK296rxx2kHgl1KK4aiX6U83gDDE4i6+w?=
 =?us-ascii?Q?1Hukj2fCTO1YQYN80N1kwUCjbf1Bc3gOcNWVNhe0WhTecYJs+CGjF+JTF85w?=
 =?us-ascii?Q?Nzv0QkQrx7bDam0Qx950LVZ30Gi1XpMdzkC32EMWRkaMHLl13ZOboaCMztIV?=
 =?us-ascii?Q?fhum/+RVpA1BxsHxCP+L3PDwSP6bKB9PFo8S167UViq4mJbiog3P+0/+Aoo1?=
 =?us-ascii?Q?oSf7NKMEJLz8894bL/uv29pHJGRVz2q8V2lfd/DtZWExbHTJDJSl3ZL9DsU1?=
 =?us-ascii?Q?w0d3oTGd9JaUy2p5ht6l/ug+BBQWfXCNzKwsLCKGShDcIq+QO0I66tRyXE3c?=
 =?us-ascii?Q?K48Ojwf5WdfDzXyCwLLPyv1L9HIQ/pliPuAnk2kr7by5WXj/Eh0YOeUFMasr?=
 =?us-ascii?Q?zAYn4BkXvZ0a3btbc1p9chblpbrZyI5Wj3fTiY7nO1U9jnI+V3kHSTdbh1MS?=
 =?us-ascii?Q?I1UlJppbF6eRM5rW6Qcd1coSepTZrYBU3ABkOgBnv94AweQi+Huk4vRF5Otq?=
 =?us-ascii?Q?dxvUcaq68wd6B4hlSMB5OVB66Mzw1riqmxn92wFpEBGBVH3RfB33geNqKsax?=
 =?us-ascii?Q?ES+FPtjxplZMHy7qjFszlJ34MRLoY3f69SkJKtuNFQZhMe3e2Y3gkXl+hpVY?=
 =?us-ascii?Q?kg6/Ic5SPQweYSA5x+hwMVFBenRCdRjLmCpVv17h8nbQLLYOk9pa4bXvXjao?=
 =?us-ascii?Q?r3ho5fWk5PnoEYymU/LyEyugjicX+o8Je03t+sxXhOS06NP6ayHlD7nIOgqL?=
 =?us-ascii?Q?QGYe+u015XLnz7JdmQaxl2pIIJShbnbXFHOquqhkFvlNPmeqIYvS/nh7/QvE?=
 =?us-ascii?Q?tu0RKCOO8JqcPzajUmXpc9mu3PgvmfodnBqKA0F1Iqy6+x34DgxbIVueiv3o?=
 =?us-ascii?Q?LZ6MjHLuH+CrNTyzY3w+7iN7pD4iFRTh+Sqos0cpIy4JZvFE2AlY06EOzFfH?=
 =?us-ascii?Q?HmqQRKcXvOt47IqTuPfk9Z6lslg4TQ0giJ9hoOS5kfMKXKyCVtSPiniqIEF1?=
 =?us-ascii?Q?oRFefD+7L6EokKuF5Iai5VVe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fc58e7-57b3-408b-7164-08d917a7fc66
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:31.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWV+WyXT/aaG6YD6M4ipammQyOwOrwOXJHluZ3RaWQVLIPPJ0AIQ186ykgCQ4wk16sSHWzwhGH45U1h/Ex1NNdEiAJfjldGj6zLvqzfIvSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

From: Alberto Garcia <berto@igalia.com>

When the x-blockdev-reopen was added it allowed reconfiguring the
graph by replacing backing files, but changing the 'file' option was
forbidden. Because of this restriction some operations are not
possible, notably inserting and removing block filters.

This patch adds support for replacing the 'file' option. This is
similar to replacing the backing file and the user is likewise
responsible for the correctness of the resulting graph, otherwise this
can lead to data corruption.

Signed-off-by: Alberto Garcia <berto@igalia.com>
 [vsementsov: bdrv_reopen_parse_file_or_backing() is modified a lot]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h  |  1 +
 block.c                | 78 +++++++++++++++++++++++++++++-------------
 tests/qemu-iotests/245 | 23 +++++++------
 3 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 0796f75b49..daae24073d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -209,6 +209,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
+    BlockDriverState *old_file_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/block.c b/block.c
index 819e133dfa..564443ac32 100644
--- a/block.c
+++ b/block.c
@@ -100,7 +100,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp);
+                               Transaction *change_child_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -4123,6 +4123,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
             refresh_list = bdrv_topological_dfs(refresh_list, found,
                                                 state->old_backing_bs);
         }
+        if (state->old_file_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_file_bs);
+        }
     }
 
     /*
@@ -4215,64 +4219,81 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
-static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
-                                     Transaction *set_backings_tran,
-                                     Error **errp)
+static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
+                                             bool is_backing, Transaction *tran,
+                                             Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *new_backing_bs;
+    BlockDriverState *new_child_bs;
+    BlockDriverState *old_child_bs = is_backing ? child_bs(bs->backing) :
+                                                  child_bs(bs->file);
+    const char *child_name = is_backing ? "backing" : "file";
     QObject *value;
     const char *str;
 
-    value = qdict_get(reopen_state->options, "backing");
+    value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
     }
 
     switch (qobject_type(value)) {
     case QTYPE_QNULL:
-        new_backing_bs = NULL;
+        assert(is_backing); /* The 'file' option does not allow a null value */
+        new_child_bs = NULL;
         break;
     case QTYPE_QSTRING:
         str = qstring_get_str(qobject_to(QString, value));
-        new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
-        if (new_backing_bs == NULL) {
+        new_child_bs = bdrv_lookup_bs(NULL, str, errp);
+        if (new_child_bs == NULL) {
             return -EINVAL;
-        } else if (bdrv_recurse_has_child(new_backing_bs, bs)) {
-            error_setg(errp, "Making '%s' a backing file of '%s' "
-                       "would create a cycle", str, bs->node_name);
+        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
+            error_setg(errp, "Making '%s' a %s child of '%s' would create a "
+                       "cycle", str, child_name, bs->node_name);
             return -EINVAL;
         }
         break;
     default:
-        /* 'backing' does not allow any other data type */
+        /*
+         * The options QDict has been flattened, so 'backing' and 'file'
+         * do not allow any other data type here.
+         */
         g_assert_not_reached();
     }
 
-    if (bs->backing) {
-        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+    if (old_child_bs == new_child_bs) {
+        return 0;
+    }
+
+    if (old_child_bs) {
+        if (bdrv_skip_implicit_filters(old_child_bs) == new_child_bs) {
             return 0;
         }
 
-        if (bs->backing->bs->implicit) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
+        if (old_child_bs->implicit) {
+            error_setg(errp, "Cannot replace implicit %s child of %s",
+                       child_name, bs->node_name);
             return -EPERM;
         }
     }
 
-    if (bs->drv->is_filter && !bs->backing) {
+    if (bs->drv->is_filter && !old_child_bs) {
         /*
          * Filters always have a file or a backing child, so we are trying to
          * change wrong child
          */
         error_setg(errp, "'%s' is a %s filter node that does not support a "
-                   "backing child", bs->node_name, bs->drv->format_name);
+                   "%s child", bs->node_name, bs->drv->format_name, child_name);
         return -EINVAL;
     }
 
-    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
+    if (is_backing) {
+        reopen_state->old_backing_bs = old_child_bs;
+    } else {
+        reopen_state->old_file_bs = old_child_bs;
+    }
+
+    return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
+                                           tran, errp);
 }
 
 /*
@@ -4294,7 +4315,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp)
+                               Transaction *change_child_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4414,12 +4435,21 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true,
+                                            change_child_tran, errp);
     if (ret < 0) {
         goto error;
     }
     qdict_del(reopen_state->options, "backing");
 
+    /* Allow changing the 'file' option. In this case NULL is not allowed */
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false,
+                                            change_child_tran, errp);
+    if (ret < 0) {
+        goto error;
+    }
+    qdict_del(reopen_state->options, "file");
+
     /* Options that are not handled are only okay if they are unchanged
      * compared to the old state. It is expected that some options are only
      * used for the initial open, but not reopen (e.g. filename) */
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index c7d671366a..87b59666f5 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -146,8 +146,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
-        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
-        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
+        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
+        self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
         self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
         self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
@@ -443,7 +443,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal operation: hd2 is a child of hd1
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
 
         # hd2 <- hd0, hd2 <- hd1
         self.reopen(opts[0], {'backing': 'hd2'})
@@ -454,8 +454,9 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # More illegal operations
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
-        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
+        self.reopen(opts[2], {'file': 'hd0-file'},
+                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
 
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -497,18 +498,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd2 is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # hd1 <- hd0 <- hd2
         self.reopen(opts[2], {'backing': 'hd0'})
 
         # Illegal: hd2 is backed by hd0, which is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # Illegal: hd1 cannot point to itself
         self.reopen(opts[1], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd1' would create a cycle")
 
         # Remove all backing files
         self.reopen(opts[0])
@@ -530,7 +531,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd0 is a child of the blkverify node
         self.reopen(opts[0], {'backing': 'bv'},
-                    "Making 'bv' a backing file of 'hd0' would create a cycle")
+                    "Making 'bv' a backing child of 'hd0' would create a cycle")
 
         # Delete the blkverify node
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
@@ -563,7 +564,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # You can't make quorum0 a backing file of hd0:
         # hd0 is already a child of quorum0.
         self.reopen(hd_opts(0), {'backing': 'quorum0'},
-                    "Making 'quorum0' a backing file of 'hd0' would create a cycle")
+                    "Making 'quorum0' a backing child of 'hd0' would create a cycle")
 
         # Delete quorum0
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'quorum0')
@@ -969,7 +970,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
+        self.reopen(opts, {}, "Cannot replace implicit backing child of hd0")
 
         # hd2 <- hd0
         self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
-- 
2.29.2


