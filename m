Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B12CB79E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:49:41 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNpU-0000Sx-F9
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDC-0003aV-LU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCU-0003nR-Rn
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAg+V9T3Kp/BE3sC6lddtN0wcVqe++cKySiw5Ax5D1o=;
 b=RL5WTS/6wARn4gXfTbtQQsFVN7Y74S73kIek7VxmHM4NfUHQAmrD9VLi6rvvOfuYAkbHs5
 0g7QIfYVdnjWi17rVJSnFY59iKdwTcXVHUkn0o3YyTNC80i/fGnXDkLwhoqmx/5oKMQk+D
 6Su0CzUi5wy7bjAAbOX9N6icPmvDWiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-G9p0WL7NN-u52zPeS0Ff9g-1; Wed, 02 Dec 2020 03:09:19 -0500
X-MC-Unique: G9p0WL7NN-u52zPeS0Ff9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1AE45708D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE1D5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 077/113] vl: extract machine done notifiers
Date: Wed,  2 Dec 2020 03:08:13 -0500
Message-Id: <20201202080849.4125477-78-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
index 28aafc1101..852ecf08e1 100644
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
@@ -2451,27 +2448,6 @@ static void qemu_unlink_pidfile(Notifier *n, void *data)
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



