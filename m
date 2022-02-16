Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BF4B91EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:56:26 +0100 (CET)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQPZ-0004lK-RC
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG6-0003mD-BW; Wed, 16 Feb 2022 14:46:38 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG4-0006Dk-Gu; Wed, 16 Feb 2022 14:46:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvyYKLYY4zwncIyN4kvY5LIzh8m/wNbn3iFf8Pa9tHyAnfq0+gU9TxIcmo7zWNe1id7MCGhhqwEgafTP4EZYq9MHySrfsGluPRyZomc546a0m8cgrQ++0jEaSNKp+sJ1r1VWJPHuWoTv7AEjj3E6AUeAUuc6RPwx2N+VhEBuedeLMAgpt4uw9iqZfMy4XFO6zRyKQ7CGg8LKuy9YShbgGJxTmrBU/6j3p3NndIsCY7VnGUiBnJMdjKghHUZRPDJGkEESSYV+jvQunqg46/T+GJL1DTHpP42yLMOJA6W+erKy9AVSoICXzKFhdWLnhNT/Or/TgxVuW3J7FHtJemXRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSeJFcaR+Y9z/xfrWpjzrvsrjHMBseTfOpFHi1tqows=;
 b=cDPEkj1sSZxfMwcvnnhhQi348Dg8MIA08MXRsmld3GusuNPO0SglCucm/2Mt6LR+sTg5CBJBzVbs+vvI/Xg5NW21p0dsK7g2U6otz9EskWfa+9Bx6IHXIDysNHycviFjd2/bXHvPjUtScdd1pu6P0KAUyCTBMkie5MSrgPVL9Eq4tDBQbAjFfRCpOn4nFch6yMO0Bb+8MJJBdXyFM/4NIVfqOjm/+PAKSWd13mzhNCcp7Qtw4BZdO2eISJGrWcvNYdiLfce8sUSMNsmtwDBU5+CFhvtqEV5Z0P8cZdQ3t/k6qORI3MuLCz9T0nSNh6YdplctQJwFXVbc+K9oVin6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSeJFcaR+Y9z/xfrWpjzrvsrjHMBseTfOpFHi1tqows=;
 b=rgOV2K/O15yLywgl1ScgR6JGyjYbF1it3ulmlJp2siiqMb7alYKylvB1/tzSZT7yKlBGI3Ge0P0oqBh19fHMBhGbwzCbrd2BGeLJSKKohQ5v3xuYxvcVtEPZfzHwfCsd13AbnN6c0Q2LzMpsydmE+TrWTu+vMLUz52oNGMcg6W8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 04/18] block/copy-before-write: add bitmap open parameter
Date: Wed, 16 Feb 2022 20:46:03 +0100
Message-Id: <20220216194617.126484-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19aa0161-22ea-4ff2-b1be-08d9f185061e
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28517F1698ABEE6924276E35C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34nRb5rbANSMRJSSbRGKNlClyN1/TlzQU8YbEVuuF+DkC9gQljW+eq5rKmEbsAZp2e3cxP1E823Pksh39cZ+1BCWDj4D9hhjzlpmMj7UoSNuOsO2Lo7e2pyL/VPTp74gF3G5tTX8nzO9X9M8JMuFA9oLeHcQpArEn6SFHMUZcrAjWJsSBdcndhstTWDrjKASMoip2anuwriPvRYtYFfMSJCA6SO4VtGliYB2HFT2jz6FTXlK+FnxhsYVOCSIUKlUcKJD0kANLmy83MNSdWaTwt5IPx7E3RICcTSnUto/Tov2nqS6w2INHZKTJ6Dcy1PcPzuLWiHbnLe/X4cTZTpEj4P5BKBJkkMO6pr4zbvsNS0MmMU7/8bz4+Ftnlu8YCnRELX1BR3B+RosHRZy2qQ1hWfDBjGaSSE3dGBcbn5a1VYBwgR7Qm6Om7ib2LAYt5zGSjIv8DdRAsXJU2C3wsSMZxJWxfnQj3JWI32yCT8vSLSI26iqf55KRoRP1SDa1ByJtn/+2bHSnJN+VnU7wPhXpb9ZdzbbQuN5DHDoR/mmrkw11u9UeI3XI0VE7IgAgib7Socy3vVr543uvx2UTvrZYYySTaKQhCpTWQIvnfzEy6rUY8K7TCthpkIJg8WabGhGd+ErMxaJUbfRh3cWbk8cIOpepZOP4NNuC/b6VbpJHztAv4jypRLGDHzqYb1Ba8ABP535tbpEyJRxnG19lG0F7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jW6wPnK+WGRbbRvEnkQ+V1wKJx7qVNflyC2AoPGpAM3ViTc5ZOx6MXy+ZVCc?=
 =?us-ascii?Q?P0jCAXE4aQhik/Edanhvt+vYs6HUdGLqMIBW+KJL1rTcOtphQBcScp4O2ae0?=
 =?us-ascii?Q?NHUVp6aBxwFo/97PChkJ0+riWLwJfeiUD0OmVWnIp1Zt/KrYEmE4S2uWwBzg?=
 =?us-ascii?Q?7GUy+7wfEnzLErsqT/7IUWqE6b4+OMCpRlQLf5ao7m29uX8FxhqqsRQzwyku?=
 =?us-ascii?Q?8shYkT4IsprulEYUFO6ac2MHVMK9PYg/ZJ245G0ytZi6P9fsz5wTqGleiJi3?=
 =?us-ascii?Q?iAbXDfV6AmoCSM9MGoihhaH50j+s3L6oMJ5lyCtEKIbsV6UAQaeWWlHxr1eu?=
 =?us-ascii?Q?BdXzLOHuGdz48Jp7QVYQqZbcVlcnDkCgnhieWrhmmPu5IYJeN22aA8eljL7i?=
 =?us-ascii?Q?tsu9dw6OgchWtttXEOUiRbji8XBlJxK3kUuZ7T7xad8+FMLHg9kVvHEo30rK?=
 =?us-ascii?Q?Vmk8g4eRaH6VZFbmkPJjUkU/aGM6O2txqsb7pCNHiI81v+Sllcb35ZwUXTrD?=
 =?us-ascii?Q?/jeIwPwMEKvJwio3epIg4j2lSKhdPHQNppO75tb13gSUFRTnB12BAY7TN9JV?=
 =?us-ascii?Q?ykl0fKQCIknuM82VEEaGkzrQC8u7LC9KlmZubD8+Qy01yvhB7lrPCt2dke5o?=
 =?us-ascii?Q?++0PTJsc52EgEAxbEjriarrPYllcF9Oa/e4ldYo95s2OOe/HERYgdeYg4yuV?=
 =?us-ascii?Q?5y5tpdjIqpDMSOmOj8qyLrJMQGTzZ2MxbL4JyZ5nEFT7gsCYsEOGkWN+Ai1t?=
 =?us-ascii?Q?QzFAcCAcYsq9kbTIj2c4by0vAFoZ/SlLFjq4aW/4r76B1WJSg0G+j9udJxVh?=
 =?us-ascii?Q?VGvfPXlHviEtPqxzPNfKVEAifGLvxDp0FTuW2qFeZ5uDfM47dbe0QWhVTaZn?=
 =?us-ascii?Q?kOTDvjUi2bAKCFmkSVgHBZ1IpOZh5ueKoE/LnDa1duPdz8qQx2rW5TakaHtl?=
 =?us-ascii?Q?+Zjl0Wb9nmGMAjVY72mabl26AKDj56pIdnH2yvwXL/gNfQ89iS7PkX3LH+QX?=
 =?us-ascii?Q?Bv3A1eTE0Wc3DHAJllRNVYDNBbbdHusxoi+IxBHHUBP4QTOB88RC8uxX8tFE?=
 =?us-ascii?Q?ihkk1kw+AWmWTTa2Zxv5pyV36gzzypp9Yr/+Jkze4A47ri84BbfxeL0t0wQv?=
 =?us-ascii?Q?oze0He+t18MieG9cm4kwfi1n8YiOAG9kUbcdDz8Zr+OT6VRIbTP+zC0OZ1KU?=
 =?us-ascii?Q?qTeHfmWXAHBkWBkf2Tbih6GU2LZUyyRwfW2FdpfvemtT5M8Ui05+B95zQhbq?=
 =?us-ascii?Q?MiGUinFMwAkwU46Asp3gBbBSNyLyDzAtcTS7AQbI1RqAISWkDr9nQguPhnHF?=
 =?us-ascii?Q?t3WtOz7k0jEZaigtAgAFkJ3krRXYXOYXFzdKNSrH0wBYNsg0VzEWX8gie++S?=
 =?us-ascii?Q?w+Sb6hNvqvm/8ne9/zRtV7Nrhw92zXpmCz7X5PlC6bbV7U2m6CklvtSBLrL1?=
 =?us-ascii?Q?zet2d/MHNuaZGeljdLBnw/1VeJJ3o0ghq5LHvD23ewEr60DqUVqZJow+hRNO?=
 =?us-ascii?Q?eNQmOo8eLtUYJ/3KCdfAcGzvQ46/BYvZpWRcyNsazG3IRnsKeF/EiEaFU7xx?=
 =?us-ascii?Q?OkwMI1nwGk3+NMHq8GC+jZfsNQUgVt96vCvUxavYOfg8xQ5InVN/GgD5UnL/?=
 =?us-ascii?Q?DkEzmQ6c+5W1xp56VVvDFkS7weMfrHJwgiZopibKEP3zcmxGDZ0l8HlR39uf?=
 =?us-ascii?Q?T7tYHg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19aa0161-22ea-4ff2-b1be-08d9f185061e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:28.6192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb7inxvi2pOe4Dl39EsYSNhyfIzA/eedTBXDphqOtQQGCinhoUj7F+qTvsmKqHhOUMOuWIRiJJZeFtVNAK72CfT/y6hK7smO+B2pRypRQ90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 10 +++++++-
 block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..3bab597506 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4171,11 +4171,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter.
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 799223e3fb..91a2288b66 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -34,6 +34,8 @@
 
 #include "block/copy-before-write.h"
 
+#include "qapi/qapi-visit-block-core.h"
+
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
@@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
+                                    Error **errp)
+{
+    QDict *bitmap_qdict = NULL;
+    BlockDirtyBitmap *bmp_param = NULL;
+    Visitor *v = NULL;
+    bool ret = false;
+
+    *bitmap = NULL;
+
+    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
+    if (!qdict_size(bitmap_qdict)) {
+        ret = true;
+        goto out;
+    }
+
+    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    if (!v) {
+        goto out;
+    }
+
+    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
+    if (!bmp_param) {
+        goto out;
+    }
+
+    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
+                                        errp);
+    if (!*bitmap) {
+        goto out;
+    }
+
+    ret = true;
+
+out:
+    qapi_free_BlockDirtyBitmap(bmp_param);
+    visit_free(v);
+    qobject_unref(bitmap_qdict);
+
+    return ret;
+}
+
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
+        return -EINVAL;
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


