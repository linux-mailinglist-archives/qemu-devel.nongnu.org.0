Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433623D795
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 09:41:54 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3aXB-000379-Hf
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 03:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1k3aWC-0002KY-EB
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 03:40:52 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58124 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1k3aWA-0002nd-Ks
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 03:40:52 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 327E7C38B321F7540E09;
 Thu,  6 Aug 2020 15:40:43 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.151.115) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 6 Aug 2020 15:40:33 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 2/2] migration: add vsock as data channel support
Date: Thu, 6 Aug 2020 15:40:30 +0800
Message-ID: <20200806074030.174-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20200806074030.174-1-longpeng2@huawei.com>
References: <20200806074030.174-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.151.115]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=longpeng2@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:37:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: longpeng2@huawei.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vsock channel is more widely use in some new features, for example,
the Nitro/Enclave. It can also be used as the migration channel.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 migration/migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3160b95..fcf7974 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -383,7 +383,8 @@ void qemu_start_incoming_migration(const char *uri, Error **errp)
     if (!strcmp(uri, "defer")) {
         deferred_incoming_migration(errp);
     } else if (strstart(uri, "tcp:", &p) ||
-               strstart(uri, "unix:", NULL)) {
+               strstart(uri, "unix:", NULL) ||
+               strstart(uri, "vsock:", NULL)) {
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -2072,7 +2073,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     }
 
     if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL)) {
+        strstart(uri, "unix:", NULL) ||
+        strstart(uri, "vsock:", NULL)) {
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
-- 
1.8.3.1


