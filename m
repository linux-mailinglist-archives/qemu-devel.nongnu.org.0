Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99B3A81C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 18:57:13 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha184-0005vd-Kd
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 12:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chen.zhang@intel.com>) id 1ha10U-0000Qh-Ot
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 12:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1ha10T-0007I0-RQ
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 12:49:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:62034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1ha10T-0007DM-8N
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 12:49:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 09:49:20 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga005.jf.intel.com with ESMTP; 09 Jun 2019 09:49:18 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>
Date: Mon, 10 Jun 2019 00:44:33 +0800
Message-Id: <20190609164433.5866-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
In-Reply-To: <20190609164433.5866-1-chen.zhang@intel.com>
References: <20190609164433.5866-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH V2 5/5] migration/colo.c: Add missed filter
 notify for Xen COLO.
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

We need to notify net filter to do checkpoint for Xen COLO, like KVM side.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 migration/colo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/colo.c b/migration/colo.c
index 8c1644091f..9f84b1fa3c 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -259,6 +259,8 @@ ReplicationStatus *qmp_query_xen_replication_status(Error **errp)
 void qmp_xen_colo_do_checkpoint(Error **errp)
 {
     replication_do_checkpoint_all(errp);
+    /* Notify all filters of all NIC to do checkpoint */
+    colo_notify_filters_event(COLO_EVENT_CHECKPOINT, errp);
 }
 #endif
 
-- 
2.17.GIT


