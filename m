Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD689321B6
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jun 2019 05:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXHWc-0001DO-SG
	for lists+qemu-devel@lfdr.de; Sat, 01 Jun 2019 23:51:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.zhang@intel.com>) id 1hXHSr-0007EC-1I
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.zhang@intel.com>) id 1hXHSq-0003Cu-0F
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:51833)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chen.zhang@intel.com>)
	id 1hXHSp-00030z-Ns
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 23:47:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2019 20:47:19 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
	by orsmga005.jf.intel.com with ESMTP; 01 Jun 2019 20:47:17 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Date: Sun,  2 Jun 2019 11:42:38 +0800
Message-Id: <20190602034239.23225-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
In-Reply-To: <20190602034239.23225-1-chen.zhang@intel.com>
References: <20190602034239.23225-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH 5/6] COLO-compare: Rename the
 colo_compare_inconsistency_notify
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

We have add the notify_remote_frame function for Xen,
so we rename the colo_compare_inconsistency_notify to
notify_native_frame(KVM-qemu COLO frame) looks better.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 19075c7a66..101c1f477e 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -120,7 +120,7 @@ enum {
     SECONDARY_IN,
 };
 
-static void colo_compare_inconsistency_notify(void)
+static void notify_native_frame(void)
 {
     notifier_list_notify(&colo_compare_notifiers,
                 migrate_get_current());
@@ -449,7 +449,7 @@ sec:
         if (s->notify_dev) {
             notify_remote_frame(s);
         } else {
-            colo_compare_inconsistency_notify();
+            notify_native_frame();
         }
     }
 }
@@ -606,7 +606,7 @@ static int colo_old_packet_check_one_conn(Connection *conn,
         if (s->notify_dev) {
             notify_remote_frame(s);
         } else {
-            colo_compare_inconsistency_notify();
+            notify_native_frame();
         }
         return 0;
     }
@@ -660,7 +660,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
             if (s->notify_dev) {
                 notify_remote_frame(s);
             } else {
-                colo_compare_inconsistency_notify();
+                notify_native_frame();
             }
             break;
         }
-- 
2.17.GIT


