Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3434CC69F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:55:48 +0100 (CET)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrYB-00085V-84
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:55:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrND-00045V-VN; Thu, 03 Mar 2022 14:44:29 -0500
Received: from [2a01:111:f400:7d00::710] (port=7585
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNB-0004Xj-Hz; Thu, 03 Mar 2022 14:44:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWjeKkVmi5KjgiWZVIa7gxRn1Kp7a8iRzSUC9XjUEO2seMAGTT+q/ZwGUtWBTPglvAF6vkfFBQNWDhJ8e4pSqaWf1pSvHMkPz3BVTDEbefiyyCjcTqWGLaX9bygByTMLb/ggzJYvjKYeRWh1q0VZG5BUEI9GGbv9UV0qCCNuorVgPuDEN5FKXY1rjGthEeqI3ACZM5EmL+uFLI/7fGwut7A94OrhhwSKwI4bz1JmFGpvT0mxD3iAEOZRaJ1jQuZpwLEQpe1vmXl99H0ZxLlLcmNx+VmJZEI+3M6aGIxwAull7mL3FU5eFjgw371E0W2Z+Qrz5PzZyP8KrUHjRtBUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HtyEbIetknDkkiwoMp7l6ByM0scW5D5ktNgrms1+XI=;
 b=DtPjjku0v748tWqHzHbIAOOIrjxbCi8W6Lm+SFlvk6mQEjTwJlSejIuZCm/RPT6BqxlAe5zS2n/z6Ql7DsPqcfNOHRgpl+4oJs/IV7RGuD7SQ/F7p0GlUzm2hdr0Wty2SzwZhqmD8xyTBeuIVgzVp83RbPtWsHB7vDNoNLE1w0sOUUSISGP3D7niWVp8mdrCS6NAfwdjhWE/FO1igIx9JlfJr+x4E6n79tLv3bvGKjQMuHncA9PGvNFEvMEJTCJhc/O/EmXr2hh+s9A4enaJec/jfp+OIwkkLXK1lI59xSeMLJ5AGiA17ptt5A2xF/FPrLL5Nkc2i508MOiY6p2YDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HtyEbIetknDkkiwoMp7l6ByM0scW5D5ktNgrms1+XI=;
 b=ZXaeSq7zw8URoSUvUmDK1i4RrRg+VeGlHvRpis8TUdhQX/qmcMBHbXTDnFtrHtf7tLBchWwfgcMWhY1bDZZQ0pnI1GZGz6SJCyUHejz3IDxohWjmcW7f52+hNpr/0QQCDypRH9771ebYIg0NW2GyKYvK1LbYzbF9jIBudcHCUAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 11/16] block: introduce snapshot-access block driver
Date: Thu,  3 Mar 2022 20:43:44 +0100
Message-Id: <20220303194349.2304213-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc61fa07-81f3-4be5-983f-08d9fd4e317f
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736A0069D9641CD69A6DDEEC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkzMhn1bNde2B+lQAyg1ZxtL51iQTfTIjcmE6gy8h3SzTrVsNEbbmj610zHA6vXdDHJDQ82BwqSqw4EwnMYcPT+B/9Lbcql94lbdTkIH5JA+fIIg9RsjUHqJ+xyayxXYnQcTpLA9AObuw9i60POJAmAXRwSwOTfvF5rxSvwKITfU0ZvaKQuLnbkxg39JJhJu0j0KHSloOwC4VXDmO+CRvUKEKRb9WPGGQjvipANq/fweYMN4O3Iq4G/41DmtTPZH0bPJQMfMGhhcAIW3uY5rOOYJzsRwdhU5d3Z72efgHInyjfQK5yuZ6cLMi1/Yl1khYvOEIhpOJlQcPwwYG5FGLVvogBvcfqMQf1zJL6/AujQwdseBrlxtp/Kq+V766a6Jwwuh3QGkh8b64nmTZi+TF6tMDv/Hu7mBrswzFaoOI8SeHlOJ5ABb8qGPAezEEpSc2Lqs/yE8f+5PVsT5a5MB5szd5JgCqzb0Af32njrLNYN1dzHxTjkD9jNhsCMp24U2TGuIDt8ViSUrOfLWA5eElJNvglUJQVUzukGR6F/asvErSh/8HfftoFGGMrSXDsm2iKjzKke+ftXRTNBEVAbFP3DK7Swti4nC/I7B8/H2F3d9TrzRFIpPrw2Uq7wqxdf6XvG1hkV8O1fniWDbMVOr6dRvuRmLaxoB4ICsEhpfNcUIt39q1ogar+HbKZVVh+wAdK9qswFYIoDDeBJCd6CWAZRc02Xv0b01yOwrF/3Cua0yXLwyznptAp7dmpmcZTnQRb8YuCUoP1LYg7o2vMSrqFbCdbQlGpNBs/TqbznTmCashGwqo8FePt8t9RKKK11r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZcffdD/yp+ktLcOcQu5m//RkZRl7t/s/iWBzXigSUzQaV5xZaSK0j2G1FXm?=
 =?us-ascii?Q?+nSVNBg2fZJqDUkuVsQs5/Xx3BVh1i2HtdLeYVqM5vshvZE/RHtWvz1buP85?=
 =?us-ascii?Q?qiIT7uvQJlkLiURFc2Qdwa7fV/nW2Lwa3CHVGCAdwEHNUkv9DOOU2N/Foxkg?=
 =?us-ascii?Q?Yhv+6Fs0lGyD9YIzAroUwTrRvZwhPei9WjFcocQJk8G777WwVbuLbLT+BXcA?=
 =?us-ascii?Q?W1IK2OcMHf5BixkhsHRTZw+gCmlHOIYfY61mHIkZ8BR0Q5cz5NOgWkSB3uKR?=
 =?us-ascii?Q?N+TfPl1JZOYUaD467x16AtP5b9gGfqGDJgL4VR576HD04RUn+G+Ia4iu6zrb?=
 =?us-ascii?Q?+H9ckqwfBRApyr+WD519eFcV6qZRdrQb4nR4m+2D2iVBWNHo0q0EaCZK9rDe?=
 =?us-ascii?Q?1KRgWp9XPtv6Qyi09AV/rrV5Pe0lpUFqjnMnL2OXxGCbI1VR+pru5jijRxcX?=
 =?us-ascii?Q?1bZY+H22E0gLpohah7mwO1P3JYHWtwnZQc380kdQxPK8JPJsslcAiPNmG28N?=
 =?us-ascii?Q?+FZ/XCQtl2T3pv4f95B8NvC9EC/sBFTCMMTZqNAO7jdg011jJRuJ8hC3tu/d?=
 =?us-ascii?Q?eiveQ0Jm6nGV0w8U6RkC1tDJpTs9oa/Oes7DUJAUex/+I58hno77/1lOsTIk?=
 =?us-ascii?Q?M7g9Kb74VTVSBTfsJ0Li3j3v6a4HQFtlkJvS9rezSNsAeDNlFn7zPm13RhnZ?=
 =?us-ascii?Q?kC6Ja8v2q1w2OScStYMf8ZzDFOlF6I+eywvsP0lxfntjUoCRIV7WrrP+xxkY?=
 =?us-ascii?Q?TnMVLUSGC8jh1BmCl6ccHFLgrN9UQX3eF5XrW7DgBsEJuU2DaG4lqYa9QfkO?=
 =?us-ascii?Q?2yoJGTcT9dBE/UyoNOYhW0SeKVR8DdGvUtEGQreUaH/WXx13lFgPCwLOnXPS?=
 =?us-ascii?Q?5aVUMsGkeZMinCebaRoOqit0KTLaItvwFn2OGaRANsc3oiDIRwFLpDEMfK2g?=
 =?us-ascii?Q?yLmrr9QtVonC/QAq9crKwgM+iIsA2osASSEpI32yMBW4Fbg4AzHOqhgTwvTH?=
 =?us-ascii?Q?IFoK+euCjz7buyltgxzi3dGx16WjKGUt1Po70n/hEqL0j3cimD6ndCVISpBP?=
 =?us-ascii?Q?2FxcHcOORfa3mfHvV8GpJNhFxmoWnjtfFFNOJTfFKxK1DOLS9fe6IXfIEkBD?=
 =?us-ascii?Q?jxAJxUtLEIBlmCckTQUriL0rlcLqk/tl4h7X2lu/dRPoO3C5geI4IoCdWlhc?=
 =?us-ascii?Q?eBl7EedHVG5Cb5AMZS8UE+j9UXh2vuaaRDCCHOgInn5YNUGtSXCCcr53HBRf?=
 =?us-ascii?Q?1UakK9aIMDqu+cpwn2iQi24wwUu8RjIgkHzDxFl22bt3sVPZpPc2OG1ZgNGI?=
 =?us-ascii?Q?p8788fuUcodX5f/jWdAckcrLMXG2d4Z83E4J276kRTqO1HXke6EIPo5vPYyB?=
 =?us-ascii?Q?fAMAMZxpU9nA4yToSa9ZWrfwzhx2sRUctKoYfzfYNMH38O3h9b2IX278Q6Up?=
 =?us-ascii?Q?FWIMVD+wS2/iJdrWFh1AjfAo8csq3w0ycbboZobv+h0CfIOmxRIBzEmIvrBZ?=
 =?us-ascii?Q?qpCXNN99jJ+Xf77AESjXUqpv2Wrb+pKgscnING9pCeJ/+8TYk0vDgsNXmgBA?=
 =?us-ascii?Q?jbgbc9GQFu30AW9IHYaATxMj3xRkpdIA2jyhMssriVCLMa8NIqyVh3xsn15i?=
 =?us-ascii?Q?L+nvfAV7KYEs23jzjo041QdLF9abAbNJxynnox73GfbrImlxFcXcdqs5FTX4?=
 =?us-ascii?Q?fvIPOA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc61fa07-81f3-4be5-983f-08d9fd4e317f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:13.1701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddfeGpbhnDAMem93U8WTfVuIlVa3roIvlc1Otp3EPRNAqmLbAyPjqYRP9urJM6gDmrXnVgj0vW3L/9aG5ix5ApjE8FYPU6MFsc5JbWsC7cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The new block driver simply utilizes snapshot-access API of underlying
block node.

In further patches we want to use it like this:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

This way, NBD client will be able to read snapshotted state of active
disk, when active disk is continued to be written by guest. This is
known as "fleecing", and currently uses another scheme based on qcow2
temporary image which backing file is active-disk. New scheme comes
with benefits - see next commit.

The other possible application is exporting internal snapshots of
qcow2, like this:

[guest]          [NBD export]
   |                  |
   | root             | root
   v       file       v
[qcow2]<---------[snapshot-access]

For this, we'll need to implement snapshot-access API handlers in
qcow2 driver, and improve snapshot-access block driver (and API) to
make it possible to select snapshot by name. Another thing to improve
is size of snapshot. Now for simplicity we just use size of bs->file,
which is OK for backup, but for qcow2 snapshots export we'll need to
imporve snapshot-access API to get size of snapshot.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      |   4 +-
 include/block/block_int.h |   6 ++
 block/snapshot-access.c   | 132 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 block/meson.build         |   1 +
 5 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 block/snapshot-access.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ffb7aea2a5..f13b5ff942 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2914,13 +2914,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @snapshot-access: Since 7.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             'http', 'https', 'iscsi',
@@ -4267,6 +4268,7 @@
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
                        'if': 'CONFIG_REPLICATION' },
+      'snapshot-access': 'BlockdevOptionsGenericFormat',
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
diff --git a/include/block/block_int.h b/include/block/block_int.h
index c43315ae6e..5c8ad9ed78 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -385,6 +385,12 @@ struct BlockDriver {
      * in generic block-layer: no serializing, no alignment, no tracked
      * requests. So, block-driver that realizes these APIs is fully responsible
      * for synchronization between snapshot-access API and normal IO requests.
+     *
+     * TODO: To be able to support qcow2's internal snapshots, this API will
+     * need to be extended to:
+     * - be able to select a specific snapshot
+     * - receive the snapshot's actual length (which may differ from bs's
+     *   length)
      */
     int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
new file mode 100644
index 0000000000..77b87c1946
--- /dev/null
+++ b/block/snapshot-access.c
@@ -0,0 +1,132 @@
+/*
+ * snapshot_access block driver
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "block/block_int.h"
+
+static coroutine_fn int
+snapshot_access_co_preadv_part(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes,
+                               QEMUIOVector *qiov, size_t qiov_offset,
+                               BdrvRequestFlags flags)
+{
+    if (flags) {
+        return -ENOTSUP;
+    }
+
+    return bdrv_co_preadv_snapshot(bs->file, offset, bytes, qiov, qiov_offset);
+}
+
+static int coroutine_fn
+snapshot_access_co_block_status(BlockDriverState *bs,
+                                bool want_zero, int64_t offset,
+                                int64_t bytes, int64_t *pnum,
+                                int64_t *map, BlockDriverState **file)
+{
+    return bdrv_co_snapshot_block_status(bs->file->bs, want_zero, offset,
+                                         bytes, pnum, map, file);
+}
+
+static int coroutine_fn snapshot_access_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int64_t bytes)
+{
+    return bdrv_co_pdiscard_snapshot(bs->file->bs, offset, bytes);
+}
+
+static int coroutine_fn
+snapshot_access_co_pwrite_zeroes(BlockDriverState *bs,
+                                 int64_t offset, int64_t bytes,
+                                 BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+static coroutine_fn int
+snapshot_access_co_pwritev_part(BlockDriverState *bs,
+                                int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset,
+                                BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+
+static void snapshot_access_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
+                                Error **errp)
+{
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    return 0;
+}
+
+static void snapshot_access_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                BdrvChildRole role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    /*
+     * Currently, we don't need any permissions. If bs->file provides
+     * snapshot-access API, we can use it.
+     */
+    *nperm = 0;
+    *nshared = BLK_PERM_ALL;
+}
+
+BlockDriver bdrv_snapshot_access_drv = {
+    .format_name = "snapshot-access",
+
+    .bdrv_open                  = snapshot_access_open,
+
+    .bdrv_co_preadv_part        = snapshot_access_co_preadv_part,
+    .bdrv_co_pwritev_part       = snapshot_access_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes      = snapshot_access_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = snapshot_access_co_pdiscard,
+    .bdrv_co_block_status       = snapshot_access_co_block_status,
+
+    .bdrv_refresh_filename      = snapshot_access_refresh_filename,
+
+    .bdrv_child_perm            = snapshot_access_child_perm,
+};
+
+static void snapshot_access_init(void)
+{
+    bdrv_register(&bdrv_snapshot_access_drv);
+}
+
+block_init(snapshot_access_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 101eb50619..4f0cc1e448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2520,6 +2520,7 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/snapshot-access.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 41e9cc5dc3..038a95689b 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -34,6 +34,7 @@ block_ss.add(files(
   'raw-format.c',
   'reqlist.c',
   'snapshot.c',
+  'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
   'vhdx-endian.c',
-- 
2.31.1


