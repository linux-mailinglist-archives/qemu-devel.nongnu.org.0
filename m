Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345534339A8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:03:45 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqeW-0007Fh-8H
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2x-0006Mi-7e; Tue, 19 Oct 2021 10:24:59 -0400
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com
 ([40.107.223.80]:21760 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2u-0002Sg-4q; Tue, 19 Oct 2021 10:24:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWEH5pkPgC7ib8TITomMjhz8zp40H0x4UXzAWtL69QkdRPyyMLEtXe3DHMuj9KQbmasUgRrg43Ox96fxSGZrq03xYk15611LZYARYz6AHXd0uGXcN3EQSxIrP0mDd6xRVyW9NWPrUAsbuABtXGQ9Aemnlo/a6SXzX4eBxTV5FBqhgn/ewRIOAMyhf75bX6QcR86PqKDYuiJL51uyRaANX1GDvLEtBaoMjXrlUtgXG3ihmAu5O9ufvEh8mb5R3wmOYvHjYhxOyQhDpIZwmNH028MHXq27lVTDVMUpWCopgQyPDZTMKdy9dWCnA61HCir/J2U6WgqUqClr0Ca1vozXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XoirFGDlPODTVsUIqnb/GA2XQ7bf4fHhSK/eNk0KW0=;
 b=TuFDV/lWJ5DW9X3yqbG0f0bI9q4sjEeoId8x1QJDz2zLmkK/OoOJBd9Mml9Q0p4UoTDtf8sjYlMbIxV6T8ndxGuQsbNLIJcAVetAEkNP/CGv5oXcLtlYk5E1LOi0fZOin1MV1Gsx53KayIE8slkymJggkURaDB/TG4gBYLXcuC6cKIT/jZxWZBaoj8FeFw7XAAlEKvRAM/t51i0iR1Nm7uETiKWkVnPRuR1x69IjOp4wNiNM1YZhGF3ikekPtacjM8b9lv33Cxe1h4B78ohVa995vAF2X6YmtWKaCEh28PdWMOlJ1fSYSogocWzttz+jaba/dLAub1YoQVZyqdtzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XoirFGDlPODTVsUIqnb/GA2XQ7bf4fHhSK/eNk0KW0=;
 b=NQFwPeAveaJPjXidaA7G+iwhG3auca9eQKA9SqGoDxm9lgDtD4JW0hEP4R0IGFgs6vkY8ahOplEWzFuiaV8LYM+viV0cDVjcmwByr2hIF+Joaq5FtO8C/1tTnj+VbRlXukv0eJTKlPXCBt4/IDPSvsUr455UeWzR87jETxnMjT0=
Received: from DM5PR10CA0018.namprd10.prod.outlook.com (2603:10b6:4:2::28) by
 MN2PR12MB2912.namprd12.prod.outlook.com (2603:10b6:208:ac::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 14:24:45 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::db) by DM5PR10CA0018.outlook.office365.com
 (2603:10b6:4:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:24:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:24:44 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Leonardo Bras <leobras.c@gmail.com>, Lukas
 Straub <lukasstraub2@web.de>, Peter Xu <peterx@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 35/64] yank: Unregister function when using TLS migration
Date: Tue, 19 Oct 2021 09:09:15 -0500
Message-ID: <20211019140944.152419-36-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f302acea-fb1d-45a0-dc57-08d9930c3319
X-MS-TrafficTypeDiagnostic: MN2PR12MB2912:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2912EE80E5416FC61CD7687295BD9@MN2PR12MB2912.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZsINbdZKhy+kSm1fFea6u7lZMfFMcRIYW1YTwbpH5BlGp0RkcLkz79UXoqify/TfL8g+JgTUArCNWmrwkrrkBKy6vU8SwVSk85hyIZs7ArJo/5HiC0dlPjr/dDAN6YnxBvXgBNDhuvLUBsejMCC11DTh4sQ8Of5NA5vMRA8dKt96ALtm7F+ekXlCIFlY917KmiZCp2UWz3TJtBtMkbUGv+m9RWDLnHf/lG0dwkIH9NILwzuGbxOr73LfFPpfmqoAYuf13wannC4D7rOmLCdxO1RJSTryq777JkUFbc0SEyiE+B+HGpf8eTAdMtX+lp1lDJfzi3QqggDUAedxwwmAI/KIg3rgjXhImk3POLvJnlVrq0V0nKRmtmxL69xR38NnPrEwSiaiZhWkhzkr8EktzuKVwuRiruF2tub7ab/94+3gpx2smMvTg0A8VW2WBBxdTNgdlw6BtcK3rLenA8DVS1mNFdntuJ9XNG+Tt55NIMdR0h09j1Aajm2pdRqo7UFBsAzBX68e4jCt4UmUhe3QIE5UnIg85/XOwa6SKMbULZdz7Wz58v0i1CQ9ctCrou85+SCmgFtwf4nOCw5lAdceKL6+BjmVyCq76/Dk+zAp+Of78LhtNbMi42spU9pjdcvmCLumKyRWVOOhi17vmDNDr/Zks7H00VTQteTfyL/kesPGb6ZbBkzze+GmCrZlagnKYJHVxbCp9j5ad1RM8773NyAuCT/G3P4Ud9w3FZU4iZ3bDkoRUkRbyplO28hIyBztyloCtltIjJwcMlE8+e7XKkRA3Rz+IkY5CoUfFtFht+ndCRotlkGGWQIon7u5pvx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(508600001)(16526019)(186003)(6666004)(82310400003)(86362001)(4326008)(966005)(47076005)(1076003)(26005)(36756003)(356005)(2616005)(8936002)(426003)(36860700001)(54906003)(44832011)(2906002)(316002)(5660300002)(8676002)(70586007)(70206006)(6916009)(336012)(81166007)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:24:45.5059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f302acea-fb1d-45a0-dc57-08d9930c3319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2912
Received-SPF: softfail client-ip=40.107.223.80;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Leonardo Bras <leobras.c@gmail.com>

After yank feature was introduced in migration, whenever migration
is started using TLS, the following error happens in both source and
destination hosts:

(qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.

This happens because of a missing yank_unregister_function() when using
qio-channel-tls.

Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
yank_unregister_function() in channel_close() and multifd_load_cleanup().

Also, inside migration_channel_connect() and
migration_channel_process_incoming() move yank_register_function() so
it only runs once on a TLS migration.

Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Peter Xu <peterx@redhat.com>

--
Changes since v2:
- Dropped all references to ioc->master
- yank_register_function() and yank_unregister_function() now only run
  once in a TLS migration.

Changes since v1:
- Cast p->c to QIOChannelTLS into multifd_load_cleanup()
Message-Id: <20210601054030.1153249-1-leobras.c@gmail.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(cherry picked from commit 7de2e8565335c13fb3516cddbe2e40e366cce273)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 migration/channel.c           | 26 ++++++++++++++------------
 migration/multifd.c           |  3 ++-
 migration/qemu-file-channel.c |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index c9ee902021..01275a9162 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,18 +38,19 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-        yank_register_function(MIGRATION_YANK_INSTANCE,
-                               migration_yank_iochannel,
-                               QIO_CHANNEL(ioc));
-    }
-
     if (s->parameters.tls_creds &&
         *s->parameters.tls_creds &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
+        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
+            yank_register_function(MIGRATION_YANK_INSTANCE,
+                                   migration_yank_iochannel,
+                                   QIO_CHANNEL(ioc));
+        }
+
         migration_ioc_process_incoming(ioc, &local_err);
     }
 
@@ -76,12 +77,6 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-            yank_register_function(MIGRATION_YANK_INSTANCE,
-                                   migration_yank_iochannel,
-                                   QIO_CHANNEL(ioc));
-        }
-
         if (s->parameters.tls_creds &&
             *s->parameters.tls_creds &&
             !object_dynamic_cast(OBJECT(ioc),
@@ -99,6 +94,13 @@ void migration_channel_connect(MigrationState *s,
         } else {
             QEMUFile *f = qemu_fopen_channel_output(ioc);
 
+            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
+                yank_register_function(MIGRATION_YANK_INSTANCE,
+                                       migration_yank_iochannel,
+                                       QIO_CHANNEL(ioc));
+            }
+
             qemu_mutex_lock(&s->qemu_file_lock);
             s->to_dst_file = f;
             qemu_mutex_unlock(&s->qemu_file_lock);
diff --git a/migration/multifd.c b/migration/multifd.c
index a6677c45c8..a8dedcf822 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -987,7 +987,8 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
+        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
+             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
             && OBJECT(p->c)->ref == 1) {
             yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                      migration_yank_iochannel,
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 876d05a540..fad340ea7a 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -26,6 +26,7 @@
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "io/channel-socket.h"
+#include "io/channel-tls.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
@@ -106,7 +107,8 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc = QIO_CHANNEL(opaque);
     ret = qio_channel_close(ioc, errp);
-    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
+    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
         && OBJECT(ioc)->ref == 1) {
         yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                  migration_yank_iochannel,
-- 
2.25.1


