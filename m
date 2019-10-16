Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED53D8FB7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 13:39:33 +0200 (CEST)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKheO-0002gy-L7
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 07:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1iKhUC-00013R-Vf
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:29:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1iKhUB-0005Pb-Ig
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:29:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:55321)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1iKhUB-0005OK-9h
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:28:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 04:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="208393367"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2019 04:28:49 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/4] net/awd.c: Initailize input/output chardev
Date: Wed, 16 Oct 2019 19:22:07 +0800
Message-Id: <20191016112209.9024-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016112209.9024-1-chen.zhang@intel.com>
References: <20191016112209.9024-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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

Find and check the chardev awd_node and notification_node,
The awd_node used for keep connect with outside(like VM client/other
host/Remote server), and the notification_node used for do some
operation when disconnect event occur.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/awd.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/net/awd.c b/net/awd.c
index d42b4a7372..ad3d39c982 100644
--- a/net/awd.c
+++ b/net/awd.c
@@ -42,6 +42,8 @@ typedef struct AwdState {
     char *opt_script;
     uint32_t pulse_interval;
     uint32_t timeout;
+    CharBackend chr_awd_node;
+    CharBackend chr_notification_node;
     IOThread *iothread;
 } AwdState;
 
@@ -175,9 +177,30 @@ out:
     error_propagate(errp, local_err);
 }
 
+static int find_and_check_chardev(Chardev **chr,
+                                  char *chr_name,
+                                  Error **errp)
+{
+    *chr = qemu_chr_find(chr_name);
+    if (*chr == NULL) {
+        error_setg(errp, "Device '%s' not found",
+                   chr_name);
+        return 1;
+    }
+
+    if (!qemu_chr_has_feature(*chr, QEMU_CHAR_FEATURE_RECONNECTABLE)) {
+        error_setg(errp, "chardev \"%s\" is not reconnectable",
+                   chr_name);
+        return 1;
+    }
+
+    return 0;
+}
+
 static void awd_complete(UserCreatable *uc, Error **errp)
 {
     AwdState *s = AWD(uc);
+    Chardev *chr;
 
     if (!s->awd_node || !s->iothread ||
         !s->notification_node || !s->opt_script) {
@@ -187,6 +210,20 @@ static void awd_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
+    if (find_and_check_chardev(&chr, s->awd_node, errp) ||
+        !qemu_chr_fe_init(&s->chr_awd_node, chr, errp)) {
+        error_setg(errp, "advanced-watchdog can't find chardev awd_node: %s",
+                   s->awd_node);
+        return;
+    }
+
+    if (find_and_check_chardev(&chr, s->notification_node, errp) ||
+        !qemu_chr_fe_init(&s->chr_notification_node, chr, errp)) {
+        error_setg(errp, "advanced-watchdog can't find "
+                   "chardev notification_node: %s", s->notification_node);
+        return;
+    }
+
     return;
 }
 
-- 
2.17.1


