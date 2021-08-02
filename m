Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C283DDFBE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:00:16 +0200 (CEST)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdAd-0003i9-2S
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5U-0002sX-FQ; Mon, 02 Aug 2021 14:54:56 -0400
Received: from mail-he1eur04on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::709]:64771
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5Q-0001rV-Rt; Mon, 02 Aug 2021 14:54:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT0QX1hdEMUeg3m4jK3mPDan9F69rsTELzqvn6AV1eHV8Ih1cKF0KP8ce6sFKEHvzI/Cgh9W+jOd/7KUD6Z2CRu8eT8tRLQ17XsfloenCHpNnm/RYgkGTl3LOd1rmpnoi0wlESXW9CeaACnVF5DYXVlKL0R7xN383qGXsFWpdeaAXkBRcmtUNrWjMxkEffAk1Q3q674u+qYkMcVjk2kOkiW9pRod5JvLNCAX/npjUPfNoFyTKXkEhM+GyO9WxBDcExSorCbPwVbOg+SvyI5xvSACtevgwi2pebBiw+ZOzs7rjAt+JRBlEUxixcyW/iWwAJICZH8zwoxq40axFf1f2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDHfmb2zGqdhCkB1byIMwN+CYve3TbKGtmmzqg2aFAo=;
 b=TXwl8+/ns005+Vx7V63NxcfyvCFpUGGOc94FzGX1QJUCpZOGUpYhw6sgH80h6hdhBiGVvErvcYfpE4YkkNCFjDn0BGAD83XliIwGoCLPBUIZTbZPudendekapAUBoT12PHAs+5IgsreJSfQPyjdM505H9XS39yYR9ikLHLjIv2IrnLxNb3l9iNEjGkrn7tHfm/yPahBJAuVmlB4JGp9eVAq9ZAlPzTr2DMD1EwOfcYGUI/faDB3Mq3xSUosmJc+HXu92NJCMxHUywG2c0vi7gmT/FQfykuQ2XJiZaJ+uZOiLjuLZw0SqyienrLDW9b/x5jbldn6l47+Rjl2nj7YHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDHfmb2zGqdhCkB1byIMwN+CYve3TbKGtmmzqg2aFAo=;
 b=cQQ8GS8qgaw/DOOePiFiyE/yR2qJMNRyGAJ8nF9GLlR+gDfgYDKhSCMt1jWVCUB4QfHg3R4T0Qgt+YHCd1/d4FG2HPZUYmbXTLGDZOWT+deNAVOKp162qvvDzuKdLOGB8jBdjkp7meOqT6wO33mltDBMT2aHd+4Tow6N0XETvnU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 18:54:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 4/8] block/export: realize BlockParentClass functionality
Date: Mon,  2 Aug 2021 21:54:12 +0300
Message-Id: <20210802185416.50877-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace51682-cdc4-44e8-d7b5-08d955e6fc4a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4278855E996A0B2EB07F4C72C1EF9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAJ1+xrOyuG+SYoby431UHBeO/zHGidmOi2FpJ/xbcHnecNiL1mkbjZTEe+FJwtYdFbWBDiNIF3JvUuUeY+DsHYJHo+n/oYTArVmjqyiFLHC5r/THIN1Ht3DyNvN53+VRCaApGfXNDY4CBuyZP1G1kOg5arUhpfojWtQONqXP2lrF3/lWFCfSlrseOFWgaQhWWXOJqUNQ/1fM/4XLXqww6nfANp7/41zkk3RX3lAUyXm7hhDWcJ7TUC8Y4OHwyv2lBPkYMs9UJBJD70NrrRNxbgWYBf3B3YTq8VtKRMc/eKI1O8xPZFT7UGfOTsBIp6OJdGNpAMLhPM2TLzZAS+BdmkPpnixEZmG6echpRcZeigX7B/QcTEQSyCgZrHdzX1mzBorlrwR6X9X67pA93DWKBKNd0whgrIDhiTuO4qHPWQawuwbPeLQoV80Bt0D47GaHbhN2+FnEQ/xNiOHKSuafWkrYQ4mscSbJZCc7JxnChkESxLVRi+uQS21TCp6JwUliHIzOqEJwUZ3lXoXFglDmJqhT3k9L3DsaLHArOujZDS0OajLzYfb0VwjjDPqVPJzf4RUXwo5kDFHb+s7z5hkRxbFAulLK0uSRonxTO/cRo3ExbgPMJLdJajgAEH/pFXioMN7mOYXivJm8Ynzf1QCmp48kHnXcQ9n0Mv01nEsQoMgtvHKCO8YMlDpwPEH1bXJLnSteofj5pYtCfTd0BpRQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(186003)(6916009)(52116002)(1076003)(83380400001)(8676002)(6512007)(38350700002)(38100700002)(2906002)(7416002)(6506007)(2616005)(478600001)(6666004)(36756003)(5660300002)(8936002)(956004)(4326008)(86362001)(26005)(316002)(6486002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYqVj/JqzT7bByi8mZWpvbStEZJkUrRcbjHyoWupHqu5W4ha3kdFANGSZgG4?=
 =?us-ascii?Q?6m8yxVfPsBQ/ua8U0F8kqxZkxIrnl36mnAbLF80bXPf8isC4BW7fYReVOYnm?=
 =?us-ascii?Q?5Wv3kZZPl4Zt7rLEUD7dfWhUUVPoLJj1HUc27YV9Kn4jbFtZooFzWGRv4Ojp?=
 =?us-ascii?Q?RnMS0QrTf5sz5bFaOY5NyY1c965AjPoUFziQkNUs8Y0jskwp4ISR10Goj+t8?=
 =?us-ascii?Q?j8fiGr+hRJ7nxuAcwUTBVo30eBegs4/91OsTD01CSVeGZirJZOOpwzdCNLYr?=
 =?us-ascii?Q?6fGPwJu4l2tYmenvsIM0bPM5OSVntXONMKLqfCXhPLHr7KPiHGOckwgaxqUq?=
 =?us-ascii?Q?Glk1Cc1Om374N28A7duQmbnKbIVXci/k/c+D3bayNs4A4cqQtT+zGHciKKLj?=
 =?us-ascii?Q?F10z5KobjjfzJV2fZaENYO21YiwTQ/DSKT6UmniiwRwtKQWbgmE7sJZUmOcd?=
 =?us-ascii?Q?ykn6+o/regxe7RGUAhaBnlRd0y+EXTDesg+vnai1e+9Mn2U8TYaeG+q0Bd4x?=
 =?us-ascii?Q?6eNGcFSTkl6soqMbUJqo7RDK19DV8YZQR0hHrv3esYLADrbTngZE2T42tPdJ?=
 =?us-ascii?Q?QmgFalJPepp3InhDH79W2gxquP/R73xaNA4rGJxjYe+DrzO/SoDyDFyF4lCG?=
 =?us-ascii?Q?KGYM1yhLYy7vjkYpc0RkMbzCunMpiqitjAP2C9U0sW5VoQqp3lnTMdkIZMue?=
 =?us-ascii?Q?wo8P3Duu6KcN8muiaGQoSboCVJ4c3en5BBh0nIB9d+KAhqNYu6mCamP2IVRl?=
 =?us-ascii?Q?tlGqtLjMD1daoXLhFObeJOU66FC7aH+cIeYge0YLFbTgbqkXNISpjANI5yWT?=
 =?us-ascii?Q?mlYl8KtsiqExFvfON0nf36bIWKjYYhHld/xLVz3lWU+KhBq1tcWW/s2p2U8t?=
 =?us-ascii?Q?UDJd1Yj3IM4Y3D42arazQ6r6KXzaLN5UfHkRnqeMtdf6MUXmu71Ech6tSwrx?=
 =?us-ascii?Q?oHimCd+Vv5kQKhUriKdt8aJcPjswRg7Clwar3c42l7rz4oYkOlFqFn/9uEDK?=
 =?us-ascii?Q?N9yF9A6P4n60Zr9TbeXPVtpt7Ea3d1HDywoqmSHCOlD/6I5HM8Q2g4/MqZ9E?=
 =?us-ascii?Q?C35dujlW2yBGyc0a5xan3GSzwySd0BdyspBmjS2TwKRF/e+8AnpN0wOobLQk?=
 =?us-ascii?Q?00y+TXv9p5uabTlkkAtUdv+0yFLB5uAlTz63n685sekKT90yeQhF0ISZXcdS?=
 =?us-ascii?Q?CTToSl8mPXAAOopeUmCNyyX2XqUMSrCDYrLWz4Ufj82y+IFNcEc0dORnEwSr?=
 =?us-ascii?Q?CQOZFV95vOUy3oHFhN2MHLms4BEl5gGBvAA8QsDDgnfK0BSuc5eD+BDL6CfH?=
 =?us-ascii?Q?sH0/kV4wDzkxNr/MXFBH/hCf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace51682-cdc4-44e8-d7b5-08d955e6fc4a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:41.5378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAHfQll46ootUb/4jQyIKTugo3XMZ8PhTkp8g11HpQmXtXv3SYlwzcGBxVUXJirH7j86x+W0gq6gBz6OZ4aXYksNRSJQsaGRCcbdBJX6QWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe0d::709;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/export/export.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..39b45feafe 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 
 #include "block/block.h"
+#include "block/block-parent.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/iothread.h"
 #include "block/export.h"
@@ -362,3 +363,46 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
 
     return head;
 }
+
+static int blk_exp_find_child(const char *parent_id, const char *child_name,
+                              BlockDriverState *child_bs,
+                              BdrvChild **child, Error **errp)
+{
+    BlockExport *exp;
+
+    exp = blk_exp_find(parent_id);
+    if (exp == NULL) {
+        return 0;
+    }
+
+    if (child_name && strcmp(child_name, "root")) {
+        error_setg(errp, "Block export may have only 'root' child");
+        return -EINVAL;
+    }
+
+    if (!exp->blk || !blk_root(exp->blk)) {
+        error_setg(errp, "Export '%s' does not have a block driver child",
+                   parent_id);
+        return -EINVAL;
+    }
+
+    if (child_bs && blk_bs(exp->blk) != child_bs) {
+        error_setg(errp, "Export '%s' root child doesn't match", parent_id);
+        return -EINVAL;
+    }
+
+    *child = blk_root(exp->blk);
+    return 1;
+}
+
+BlockParentClass block_parent_export = {
+    .name = "block export",
+    .find_child = blk_exp_find_child,
+};
+
+static void export_init(void)
+{
+    block_parent_class_register(&block_parent_export);
+}
+
+block_init(export_init);
-- 
2.29.2


