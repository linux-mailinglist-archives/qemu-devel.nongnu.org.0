Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3182C0D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:37:51 +0100 (CET)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCyU-0000eX-30
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcT-0003KX-Ql
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcO-0007qG-2k
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pq/ZnvvCO6MBzWiF2YzPTUcG77dSzqjhU5UWxsruWtM=;
 b=LDHU/klI0zrLMoHdV62Lsf6g/6VNbQYK97XR2JricgogCisBjnrJrfw705aHNRiaAHwpXX
 XSZX1jrN7Ib3SZCIiragTNehT7+QNHgqSaRsDSfY+V1wqNUcBI8EQGpenxECW7UblXTxZf
 MOBklF7YXGYP1l3h282jJgYIxmpBUbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-4rxqOK9MOXaV--4CK-eTDA-1; Mon, 23 Nov 2020 09:14:57 -0500
X-MC-Unique: 4rxqOK9MOXaV--4CK-eTDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B45DF100B715
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79AF560C66
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/36] vl: extract machine done notifiers
Date: Mon, 23 Nov 2020 09:14:29 -0500
Message-Id: <20201123141435.2726558-31-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c       | 24 ++++++++++++++++++++++++
 include/sysemu/sysemu.h |  1 +
 softmmu/vl.c            | 24 ------------------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a5cfbcc7cb..745531c9d9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1166,6 +1166,30 @@ void machine_run_board_init(MachineState *machine)
     machine_class->init(machine);
 }
 
+static NotifierList machine_init_done_notifiers =
+    NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
+
+bool machine_init_done;
+
+void qemu_add_machine_init_done_notifier(Notifier *notify)
+{
+    notifier_list_add(&machine_init_done_notifiers, notify);
+    if (machine_init_done) {
+        notify->notify(notify, NULL);
+    }
+}
+
+void qemu_remove_machine_init_done_notifier(Notifier *notify)
+{
+    notifier_remove(notify);
+}
+
+void qemu_run_machine_init_done_notifiers(void)
+{
+    machine_init_done = true;
+    notifier_list_notify(&machine_init_done_notifiers, NULL);
+}
+
 static const TypeInfo machine_info = {
     .name = TYPE_MACHINE,
     .parent = TYPE_OBJECT,
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index c94b2e7159..1b62deaf2b 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -18,6 +18,7 @@ void qemu_remove_exit_notifier(Notifier *notify);
 
 extern bool machine_init_done;
 
+void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 86ace29f98..7e13bb4a59 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -204,9 +204,6 @@ bool qemu_uuid_set;
 static NotifierList exit_notifiers =
     NOTIFIER_LIST_INITIALIZER(exit_notifiers);
 
-static NotifierList machine_init_done_notifiers =
-    NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
-
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_EMULATE;
 bool xen_domid_restrict;
@@ -2432,27 +2429,6 @@ static void qemu_unlink_pidfile(Notifier *n, void *data)
     }
 }
 
-bool machine_init_done;
-
-void qemu_add_machine_init_done_notifier(Notifier *notify)
-{
-    notifier_list_add(&machine_init_done_notifiers, notify);
-    if (machine_init_done) {
-        notify->notify(notify, NULL);
-    }
-}
-
-void qemu_remove_machine_init_done_notifier(Notifier *notify)
-{
-    notifier_remove(notify);
-}
-
-static void qemu_run_machine_init_done_notifiers(void)
-{
-    machine_init_done = true;
-    notifier_list_notify(&machine_init_done_notifiers, NULL);
-}
-
 static const QEMUOption *lookup_opt(int argc, char **argv,
                                     const char **poptarg, int *poptind)
 {
-- 
2.26.2



