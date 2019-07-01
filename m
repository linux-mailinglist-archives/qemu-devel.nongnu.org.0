Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A827321B4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jun 2019 05:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXHUt-00089e-KP
	for lists+qemu-devel@lfdr.de; Sat, 01 Jun 2019 23:49:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.zhang@intel.com>) id 1hXHSs-0007Gf-QT
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.zhang@intel.com>) id 1hXHSr-0003FJ-RF
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:51833)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chen.zhang@intel.com>)
	id 1hXHSr-00030z-Ji
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2019 20:47:21 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
	by orsmga005.jf.intel.com with ESMTP; 01 Jun 2019 20:47:19 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Date: Sun,  2 Jun 2019 11:42:39 +0800
Message-Id: <20190602034239.23225-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
In-Reply-To: <20190602034239.23225-1-chen.zhang@intel.com>
References: <20190602034239.23225-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH 6/6] migration/colo.c: Add missed filter notify
 for Xen COLO.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
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


