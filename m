Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D780C22A5F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 05:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSYt3-0003n1-32
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 23:22:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYg6-0002Ja-4I
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYg4-0001q9-BP
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSYg3-0001pH-3F
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10AFD59449
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:09:26 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBD2210027B7;
	Mon, 20 May 2019 03:09:23 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 11:08:37 +0800
Message-Id: <20190520030839.6795-14-peterx@redhat.com>
In-Reply-To: <20190520030839.6795-1-peterx@redhat.com>
References: <20190520030839.6795-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 20 May 2019 03:09:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 13/15] qmp: Expose manual_dirty_log_protect
 via "query-kvm"
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose the new capability via "query-kvm" QMP command too so we know
whether that's turned on on the source VM when we want.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c  | 5 +++++
 include/sysemu/kvm.h | 2 ++
 qapi/misc.json       | 6 +++++-
 qmp.c                | 1 +
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 062bf8b5b0..c79d6b51e2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -169,6 +169,11 @@ int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
     return 1;
 }
 
+bool kvm_manual_dirty_log_protect_enabled(void)
+{
+    return kvm_state && kvm_state->manual_dirty_log_protect;
+}
+
 /* Must be with slots_lock held */
 static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
 {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a6d1cd190f..30757f1425 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,6 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
 int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
 struct ppc_radix_page_info *kvm_get_radix_page_info(void);
 int kvm_get_max_memslots(void);
+bool kvm_manual_dirty_log_protect_enabled(void);
+
 #endif
diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..ce7a76755a 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -253,9 +253,13 @@
 #
 # @present: true if KVM acceleration is built into this executable
 #
+# @manual-dirty-log-protect: true if manual dirty log protect is enabled
+#
 # Since: 0.14.0
 ##
-{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
+{ 'struct': 'KvmInfo', 'data':
+  {'enabled': 'bool', 'present': 'bool',
+   'manual-dirty-log-protect': 'bool' } }
 
 ##
 # @query-kvm:
diff --git a/qmp.c b/qmp.c
index b92d62cd5f..047bef032e 100644
--- a/qmp.c
+++ b/qmp.c
@@ -73,6 +73,7 @@ KvmInfo *qmp_query_kvm(Error **errp)
 
     info->enabled = kvm_enabled();
     info->present = kvm_available();
+    info->manual_dirty_log_protect = kvm_manual_dirty_log_protect_enabled();
 
     return info;
 }
-- 
2.17.1


