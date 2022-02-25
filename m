Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E728B4C524E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:54:43 +0100 (CET)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkQ6-0003hB-Gv
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFb-0006xo-Il; Fri, 25 Feb 2022 18:43:51 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFZ-0005gS-Sf; Fri, 25 Feb 2022 18:43:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ1YsyF9FV71hm1MrcIjlQ4Cv2fzvOhMVkuamXgF33iO50iFgnGmUT6zBUFVSVQd464nDp2R0kK5q/FNY5pdZ3zvT0n+w7ZRZsFka16jorG7F0kYVawhaHC7jP+aIpy0H64coIQC3g0UPYzdFHb/jt24lL5ts+0ZELetGmccXOqwrSQCekri9mr/I/aTmS+WJSngANvOk9PkzkcOIo8VS6oz6PLjfZ1IfcmXIhvF1m5I7D2VOHY1gsEsx7CGRNekMP8hMNC4YWR4hsRmeRK1Fq8RUYBHQ4SlEBjOXX4G7YoJ52/MgeNeqiDK5s/y9TDRgoEIyvGjdwZagoiOC2z/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahq4V2kJuB7Tb+C7mjrhPOk6UIZtItyx7XF2k96Y4Xc=;
 b=aCe1P/hCp6GtDpNDLB6a6/qtGrLCWimdPgg93V458FoyMqwYMW30pWFSEPokPLoWbvsmBofIyV9KAHv3xehoPhIflVGQ6eXJXl6euAFlwI0gojRIeIizMGsfMgnBz9kSYFT9VH6t6zINhLP2c+okBBcX337EJn54teNVcn/rznOYr3GQLOEcEEbwXVc3qAC/8lF8nvDBdMug2ALaTBpo6uuWugHmMmoZqMF9vb+D2D3jU3oLivEijMt72+gjDUUNLdkssnh1XzJhpLC1+nZX/wwspBoswqhV9JB8wA46p9OnAw/TwCMexkA3pbbXZ3DY+Fo5y3RrkkODrR2SukFzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahq4V2kJuB7Tb+C7mjrhPOk6UIZtItyx7XF2k96Y4Xc=;
 b=ucwilAzD8GJ65ovxsUIZ3LmOwpNH/SVptrJQ1MFQy4EhHgmnFbhF3hgWDCGKCCwZd6W80KOodcWq5ju0snDS9WLz0tqAMZYLyVP007fBU9hiDEpUNIY9Ry7pdc2tlqhj2CBo+Xa80kUvNsZRtIWq4gij1jXd74Vsn+a/soa0fa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 07/11] block: bdrv_get_xdbg_block_graph(): report export ids
Date: Sat, 26 Feb 2022 00:43:04 +0100
Message-Id: <20220225234308.1754763-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f131334-be87-423b-d3f9-08d9f8b8a7ef
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB417254C92592EE643AFD05A1C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlSptU962G33QTUfRDTdCR0TxKQV7cJ0A7rmgvT5pt2zE6aATsSYFbg189PYnJ6GFwiDN97YaswLBFlFvR6cljOIz7+Zm7ezRA2iKArH7b9VinLOk/mNAmZfb80Eqk0HIf5Ga+31A/3jk5frSCgu+e1Xl6J2s+jkxQPPwY1gFcrFKxgMtUDfDDJwMrD+KA38kUg6aOjlYfjdjF91OiH573sv1d9fxlV0uYeuNMHf21ApaWiahIz4bC/SHMuBuf8UhO2gw4QQ90CSMwvseK/QyLTLtjTt1lApoL8DLHrvQq5dQGPa9hH6h3s3yhdfOaL48jxx3oBKJAkYf/6/uQddT13B4hRrBfWmKbwcd3KwVUOH/EwGi/GRNV8t7gRUGuRcKnKLsLxTeN+VdFZm7EqAbMAemrSP0VoGMeIJHJ6RlItq81Q8gUXKbmtm59QU1hC4HXTLfWaR/wk9b02g18fkeBFJq14HskMwHqiu8YQRUdMCaVubcaE02p8Dbi7o4w0JJDG8lignxl5/pXpzlXjnTT+KcJ1Zjzu+Ok9X1jo6ioUXkctwQTTHI90mG0XCAUh9O72nghNMaDzjFUN6cckikaUI7VIocFP5aAho8kXq7GZK9piTDS3DF8AAgumyVvBpFfXNiZm2uL/JDYxt9dof4CyrMv+pMA37BxBQzObrlw8BfyOVsMiW01czAflfSsHF9sB/Lyp1tP28m/t6ZFC7AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wieumjv8nKsWCNuDRCkNcpjULKg9KmA30GqwPKWwSYiRLgQT8WfISM/G3eyE?=
 =?us-ascii?Q?xH7E1a904f9qZqhzM2Ee4ERzscGW3V/o2Uv+Y5mbvUY4xHKisMNFZ+AZ0dob?=
 =?us-ascii?Q?IlXWrd/SpP/4rOMyqQBXsFiqDm3IiLW0XJSBdNeeN3zVl0/IUOlUvSr0cEhM?=
 =?us-ascii?Q?Mp5kJfNJwxNUSy+EdN7/+wji0pZubFbf6nvZxDw6guGjJZ8UZUBmeCzaQmXU?=
 =?us-ascii?Q?bDhOxJVOH+Q6UCTn+F5+RczOJtuHVfXOqi+b7BhDLuUaBJ2Dfm/1VjSq+8kb?=
 =?us-ascii?Q?E79rHaGASkiFuaMIcgiTvQsxkmX31oBAP47qqpk1W1gdicEQG4AiAyc4kShh?=
 =?us-ascii?Q?R8YvInph5VkRirH3Qk7xwIX3lRQauza0HjdpFY1DbTi0ma+NnReGDlLVsC4y?=
 =?us-ascii?Q?fV6bsqMC0EBeIFnjUXpqFlbvj7v67u/2xQy7pdGfbQB427C35idVE9HFsO2Z?=
 =?us-ascii?Q?NfIJDp6s8fCW7Hd/KztRKZ7a52AMN2QYPC9doCBViDVnszKVoTOBhCfxxdw0?=
 =?us-ascii?Q?CTpZ1r5N7tM/E+h5wizxKTqxNUsQ5OyJhYMyyFl2xm2XaISQUGJAwwvWiuqC?=
 =?us-ascii?Q?nfKYScudqNrv4Lg8DbMNj57u3TX2DQlQEnMvhIW8FbHM6vYPmieibkIdr8fF?=
 =?us-ascii?Q?iEprun3LH9M4nGtwYWpMwb27hEK3gO0MaDUHXiRzu8/LbZ5FrFHXJpr+MVTv?=
 =?us-ascii?Q?F9KEnzfb4+rer/YbeXOLQxR22w/AdsGrWjYZILYXehNWGhHYmj3yBAUH3T94?=
 =?us-ascii?Q?BiXfxquImXK+XIj7naZQnbZQ0jHXjiZQpvIMgjlIPNoF06oYvI+r8Dt6EWSz?=
 =?us-ascii?Q?25muaGVl/W9I+dyz0OSF3MdKIj3NqIKOAStrl8IrwWtHiyhbUkO393AR0Ld7?=
 =?us-ascii?Q?ljKIFW39xFreB7SaDHzJYfQhovw7LWPnf2kb+YPVK9tLFC0B6jI1PATgI/bX?=
 =?us-ascii?Q?aHY0SuRVdQ+gER3PMdDpz/0/G9bp7oc/VmuYMcM00upcfj4sfnUPP19maWDA?=
 =?us-ascii?Q?zWavfW0ExCiZOAcsbjPb561cOd1GXCQ5PILXBAwDFfzGNqQES0QQ72L1Lz1p?=
 =?us-ascii?Q?1A1/xbSLDyG0Atq5sUmpA9hlnt1S1XJuXNftm8eRjzFtrJbJt7LQ/ZB+Edan?=
 =?us-ascii?Q?4WMQE9EohM2A0KzaHfDooHqrrYITPNnZul4j1z2tsMixSXXtJF6e3sKY5YCH?=
 =?us-ascii?Q?z6b6i98GjAQVsPs8dSR7LGGsHucuWaS6srpgTu7JWxST/1qqsoBTFVW0WBcu?=
 =?us-ascii?Q?b+8BJGDQpabwmHm3+SBy5SRSv30J5nNOImAjkYpfzoV69ch6sfj9LQOZZgv5?=
 =?us-ascii?Q?KuoeCQ6MSoFMYEutCEdGwxn313DU9NLCCyEXUe6QhnqK4iWndALJdYwUJFWV?=
 =?us-ascii?Q?yn3byPr/z6GgptFfP2EPQzmxX9bRu9bW4k2T9heyniBH0jKzCogWncEtVr6Y?=
 =?us-ascii?Q?30VZ7fpiBOLfTJRujcxG20SsGgRRqVuPzNQV2YxIHO8Fx2Yyy9NThBnrudQR?=
 =?us-ascii?Q?GM8kmFKT0IlneCftNp5xeJr6oWqkSdvWyfGBNo5fq7Lq4QLin3O27Wbvv2GS?=
 =?us-ascii?Q?5n6nloVmoNq9rI8Qlh0Pq7dC6OjPMSLgsmkvTBFQtj2yBIRDVZ91aBiLD8Ry?=
 =?us-ascii?Q?iKrZkhL4CzfOvxkZuDviYPoGMcNaSWvEqLfQZvaTwQlZbjaYA4Qo7co/sbps?=
 =?us-ascii?Q?recc5Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f131334-be87-423b-d3f9-08d9f8b8a7ef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:42.6693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMaraHuV+8AfvQnrvJIfqa3G6dd/Q93z+NBmjA122ffx5rWs1tqa91F8Kulmxi10TCWozQ/Ep7f+F8LfTXxbqh4mN6wirF2eWzshdEgv6Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Currently for block exports we report empty blk names. That's not good.
Let's try to find corresponding block export and report its id.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/export.h      |  1 +
 block.c                     |  4 ++++
 block/export/export.c       | 13 +++++++++++++
 stubs/blk-exp-find-by-blk.c |  9 +++++++++
 stubs/meson.build           |  1 +
 5 files changed, 28 insertions(+)
 create mode 100644 stubs/blk-exp-find-by-blk.c

diff --git a/include/block/export.h b/include/block/export.h
index 7feb02e10d..172c180819 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -80,6 +80,7 @@ struct BlockExport {
 
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp);
 BlockExport *blk_exp_find(const char *id);
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk);
 void blk_exp_ref(BlockExport *exp);
 void blk_exp_unref(BlockExport *exp);
 void blk_exp_request_shutdown(BlockExport *exp);
diff --git a/block.c b/block.c
index b2f55ff872..24baf58e80 100644
--- a/block.c
+++ b/block.c
@@ -5979,7 +5979,11 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
         char *allocated_name = NULL;
         const char *name = blk_name(blk);
+        BlockExport *exp = blk_exp_find_by_blk(blk);
 
+        if (!*name && exp) {
+            name = exp->id;
+        }
         if (!*name) {
             name = allocated_name = blk_get_attached_dev_id(blk);
         }
diff --git a/block/export/export.c b/block/export/export.c
index 613b5bc1d5..ca6c8969ca 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -54,6 +54,19 @@ BlockExport *blk_exp_find(const char *id)
     return NULL;
 }
 
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk)
+{
+    BlockExport *exp;
+
+    QLIST_FOREACH(exp, &block_exports, next) {
+        if (exp->blk == blk) {
+            return exp;
+        }
+    }
+
+    return NULL;
+}
+
 static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 {
     int i;
diff --git a/stubs/blk-exp-find-by-blk.c b/stubs/blk-exp-find-by-blk.c
new file mode 100644
index 0000000000..2fc1da953b
--- /dev/null
+++ b/stubs/blk-exp-find-by-blk.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "block/export.h"
+
+BlockExport *blk_exp_find_by_blk(BlockBackend *blk)
+{
+    return NULL;
+}
+
diff --git a/stubs/meson.build b/stubs/meson.build
index 90358823fc..92e362a45e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -2,6 +2,7 @@ stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blk-by-qdev-id.c'))
+stub_ss.add(files('blk-exp-find-by-blk.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
-- 
2.31.1


