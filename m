Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E882E00AE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:09:15 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQYU-0004BI-8P
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWK-0003FE-LD
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:00 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com
 ([40.107.2.90]:62614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWG-0006a3-PV
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRJKBVYDTuoXEkKJwO8rXSd4dtJ3VkFn3KfEt3B3iBmZtqWA2HqrdAfANVSoxgynMIozBM73FcAK/4hBQb7ha7IkWcwO0qJu5bfaMb7iB1+FrqKzb2BjzP18UOY51q02dUkpCns/LcQX8wFFptynDkJ14XDrooA3YSDOzY0iDTO7UO5zLQ23l1waQW4xPg6kKchoVX+J3FOGtIiV4MIP7/B2WnhSGn2t5DcDpeTizpO9JUsDq0ymmvWkh/JMSEhoI3PnRLPsezVK2R+i2agN0Gp6UQ2j2pq3ifXP0WAhwDu57zqQTIUKMB3RXzrTL1FtDUXEjNnWcn4Jd94/7crDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg0DK8g1BSz/mJ4JBoyD8PyCT795P6OfRoaEr/iy7CU=;
 b=cZ2Uwvb46DAc5wkIVlR/9rqbcFqvSXhA1AfWd1I1PGjtT7+M1ASTx3lIVnuHag42YvxLr6a/bjurpyR3/tMoWsgE/JTk9zI2GnVs2I1VfRK3FmIM26vLVjOSTlO/omwjHoHITtCQJ4U4U1OiQKmNMK0w5R53vBmaLwrsqos0FkG8dAyQEkbbJ83rIOVwn2YcWSgevLEXjSb9/qFPanx8Pv3oNa2b6VFqMuR24tsicZgCRj4aS79KFpQLNk6UDkdA6MQEQepWnSqlOT5HjLoYG0sjltM7ZuVNalEGLtjH+w3NcXlL3t3us7ukFwwnO/jKTP2kyHe7kbc2K/LFQzVUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg0DK8g1BSz/mJ4JBoyD8PyCT795P6OfRoaEr/iy7CU=;
 b=eOF4OMUas0OdvKUczipIZ2yqET3mqJrahSvu6JVUHWYzgx1NRKNZpFcAhsFNzX4wN/za6fVMmmHx6yxsT5wky70YpuwcTyS2PmGeLuJNcv9i2y6fg7/zqQ+uRSuSAhSo7LJTvkhWyUmADWVEnBkGBJsvwElqfl6B133c5aiSVgQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] net/tap: drop duplicated tap stubs
Date: Mon, 21 Dec 2020 22:06:06 +0300
Message-Id: <20201221190609.93768-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d08a3afd-de59-4a02-c5dd-08d8a5e38821
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652337B3A6C2E1CB9C9D1ABC1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fg50n4vEhYjdolUVvXINThaf30k7tTR4k+dZZZDS5Mx3DUVXMPpRoF1DGFDQZiQsVIxkaXtzv9fKNkndOEbRPZ/abZWdrS+wTKP7YrJtpVT8F5V4dr3P4RXirH16RR63/xtzZmft2JW5z2Mh4CSZfj0O2oqiOTSSkOnajp3b1mGWqT3RTl4rhDdLPIs85/PsZGTsPWr2LtjsAA7LsWV4L+pQufnV3+UKmMmHzgdFqnL7GUqe9meZJpEzZ+YCwfxoSS0EWuRq+OU1sjInAJ6bVWFCr/b9r6z77XLxxPASnTyUH9yjA2g+fO2LghIc2ZDdKpKsaamOSsli3OL8MPoDJB60T0GH9YLRJvsSsr3UbbqRT5nj/KaTKnKG+ZYOzDwhSmu4i3l7MhmWTOpJbu9Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ua9mVl6YnNJ9dfm1aeroWqutBsT3tnKfOoALDm3v7nYWkOqg/PItI3fTItln?=
 =?us-ascii?Q?4HSUzuYC/i/3hlUNx3fFFXC7gGhkgc84nG5ftL/aJRAZUXbj57f7BddF0gw9?=
 =?us-ascii?Q?zXAlljXJ16cAXdQ0XSlCU32euHY3KsA9YZY77aBGCBpYfZR1lBXzOis+ND9c?=
 =?us-ascii?Q?n+w12mStv1IBPikILAccAx7GtR+fPpVmCkVTrfjPXWDkpt0dCGYl+5L/RIfi?=
 =?us-ascii?Q?xAtePyBuR2slBPJVpNP9Z5rDzZ4FbEntlgAxv/amfDf6VmAZ/rdiso5XzkCM?=
 =?us-ascii?Q?fKtEAZkWmDVA2dqFALCMuX07FmjmfSrH9zN3mKkJsF8H5MPPULV1afmmyQRp?=
 =?us-ascii?Q?pY3velHkIjB9rBRa0JQwE7AZmGaLcsFYsArTSPIhDhNiyT+U5GgGl+2c9H+5?=
 =?us-ascii?Q?PJad5C0gYxsNSWxmRA9fQaUDUa1NLmi77177yC4/x648XCKHjwdhb2RXDpgv?=
 =?us-ascii?Q?Kl26KKYlt3jERFzg9+ksT8D5piF9uwQhjWOXOWHcB9m6v2gdYPCat3Q0eTRh?=
 =?us-ascii?Q?x53IK4/qJZAYYzoPyqTBF/ydWS4sBOm8viDftKNcaThE/t3hMR7mddx9BHWc?=
 =?us-ascii?Q?3Cw92yUOdNMWcaONvgy5HEF13KNd2kzWZtH0zuPKxm7+DR8uXZMrLWkH30ax?=
 =?us-ascii?Q?znPcH1A91ZM4X0ypXT0orFBuqno5J9N/82DbLpSn3NM+Tm8EitN0pSENsgCv?=
 =?us-ascii?Q?TQ6vNcUTZQwiEEsRlQSARC4dNKkQi9beRS1ddn3HxqbJkycxbM25ehEwcJFV?=
 =?us-ascii?Q?gkEujLku30pLOO1ayMqvSURlzMJO/1tU3XSO0lKsVF+Bo86QoFeAzP7ueCAZ?=
 =?us-ascii?Q?Xdb7IR6HUlzqaxc4CJkvTnyl/vnZF/S7xXcJZ1M+J2Mh2JtRHZQjNi7jA5EM?=
 =?us-ascii?Q?GS+FObNglpMsQEPQlYm3Hr+YQx/brLYDGsYfB32s8wflfjJ7BMN/BDwZ3rWV?=
 =?us-ascii?Q?9+HJPB3kqs1R7wSPBjuma2PT+02UZwauYYfyiYblcNFr4AHDBl3hDcEbVnGP?=
 =?us-ascii?Q?Z1iK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:33.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d08a3afd-de59-4a02-c5dd-08d8a5e38821
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VlihD0hgJ/nseFiSguUaJqq2Y6TVXjugeW8rmePhNRchQYKJDrqe+rXc4MhtDlEOIFVB4kA+MY7ASIIL/887ADMcd2RJfD+pXFV5H5KI8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tap-solaris and tap-bsd realize only tap_open() interface and all other
functions are duplicated with tap-stub. Let's split tap-stub so that we
can reuse all stubs except for tap_open() for solaris and bsd.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 net/tap-bsd.c       | 53 ---------------------------------------------
 net/tap-open-stub.c | 34 +++++++++++++++++++++++++++++
 net/tap-solaris.c   | 53 ---------------------------------------------
 net/tap-stub.c      |  7 ------
 net/meson.build     |  3 +++
 5 files changed, 37 insertions(+), 113 deletions(-)
 create mode 100644 net/tap-open-stub.c

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf674b1..5667e87c9a 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -206,56 +206,3 @@ error:
     return -1;
 }
 #endif /* __FreeBSD__ */
-
-void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
-{
-}
-
-int tap_probe_vnet_hdr(int fd, Error **errp)
-{
-    return 0;
-}
-
-int tap_probe_has_ufo(int fd)
-{
-    return 0;
-}
-
-int tap_probe_vnet_hdr_len(int fd, int len)
-{
-    return 0;
-}
-
-void tap_fd_set_vnet_hdr_len(int fd, int len)
-{
-}
-
-int tap_fd_set_vnet_le(int fd, int is_le)
-{
-    return -EINVAL;
-}
-
-int tap_fd_set_vnet_be(int fd, int is_be)
-{
-    return -EINVAL;
-}
-
-void tap_fd_set_offload(int fd, int csum, int tso4,
-                        int tso6, int ecn, int ufo)
-{
-}
-
-int tap_fd_enable(int fd)
-{
-    return -1;
-}
-
-int tap_fd_disable(int fd)
-{
-    return -1;
-}
-
-int tap_fd_get_ifname(int fd, char *ifname)
-{
-    return -1;
-}
diff --git a/net/tap-open-stub.c b/net/tap-open-stub.c
new file mode 100644
index 0000000000..01cc03f630
--- /dev/null
+++ b/net/tap-open-stub.c
@@ -0,0 +1,34 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "tap_int.h"
+
+int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
+             int vnet_hdr_required, int mq_required, Error **errp)
+{
+    error_setg(errp, "tap is not supported in this build");
+    return -1;
+}
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 0475a58207..920b4df2fe 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -202,56 +202,3 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     fcntl(fd, F_SETFL, O_NONBLOCK);
     return fd;
 }
-
-void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
-{
-}
-
-int tap_probe_vnet_hdr(int fd, Error **errp)
-{
-    return 0;
-}
-
-int tap_probe_has_ufo(int fd)
-{
-    return 0;
-}
-
-int tap_probe_vnet_hdr_len(int fd, int len)
-{
-    return 0;
-}
-
-void tap_fd_set_vnet_hdr_len(int fd, int len)
-{
-}
-
-int tap_fd_set_vnet_le(int fd, int is_le)
-{
-    return -EINVAL;
-}
-
-int tap_fd_set_vnet_be(int fd, int is_be)
-{
-    return -EINVAL;
-}
-
-void tap_fd_set_offload(int fd, int csum, int tso4,
-                        int tso6, int ecn, int ufo)
-{
-}
-
-int tap_fd_enable(int fd)
-{
-    return -1;
-}
-
-int tap_fd_disable(int fd)
-{
-    return -1;
-}
-
-int tap_fd_get_ifname(int fd, char *ifname)
-{
-    return -1;
-}
diff --git a/net/tap-stub.c b/net/tap-stub.c
index de525a2e69..6fa130758b 100644
--- a/net/tap-stub.c
+++ b/net/tap-stub.c
@@ -26,13 +26,6 @@
 #include "qapi/error.h"
 #include "tap_int.h"
 
-int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
-             int vnet_hdr_required, int mq_required, Error **errp)
-{
-    error_setg(errp, "tap is not supported in this build");
-    return -1;
-}
-
 void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
 }
diff --git a/net/meson.build b/net/meson.build
index 1076b0a7ab..73b2ab78c2 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -32,6 +32,9 @@ softmmu_ss.add(when: 'CONFIG_BSD', if_true: files('tap-bsd.c'))
 softmmu_ss.add(when: 'CONFIG_SOLARIS', if_true: files('tap-solaris.c'))
 tap_posix = ['tap.c']
 if not config_host.has_key('CONFIG_LINUX') and not config_host.has_key('CONFIG_BSD') and not config_host.has_key('CONFIG_SOLARIS')
+  tap_posix += 'tap-open-stub.c'
+endif
+if not config_host.has_key('CONFIG_LINUX')
   tap_posix += 'tap-stub.c'
 endif
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
-- 
2.28.0


