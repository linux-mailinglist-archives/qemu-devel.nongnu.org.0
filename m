Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DC3879B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:18:06 +0200 (CEST)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizbp-0008C3-75
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lizZk-0006AI-Ox
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:15:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lizZi-0008A1-BJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621343753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NZAKJXmtki95RHBXF8pc6iMkzeAeDyRn9Ggw9OeBXrI=;
 b=HhmYNzl+TzavvIbi6F+a2iUYhYWhEnAt1avu/WWWiFgbmAgF0R3D/RG2IUmVzvOEsEoKRl
 FIlvw47JoA7dpC7PsaeGjrgRm0YM4D/ahbXentg9TVEPXyuorUn7+7c6NGbs7XEVrM2xTl
 ouNb5wrgUStXEQ1FMgW9iWgjjsy9AbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-LjjKg4dzPlKgYfJfqIkrzQ-1; Tue, 18 May 2021 09:15:47 -0400
X-MC-Unique: LjjKg4dzPlKgYfJfqIkrzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4627E7B55
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:15:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20F2519D7C;
 Tue, 18 May 2021 13:15:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-config: load modules when instantiating option groups
Date: Tue, 18 May 2021 09:15:42 -0400
Message-Id: <20210518131542.2941207-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now the SPICE module is special cased to be loaded when processing
of the -spice command line option.  However, the spice option group
can also be brought in via -readconfig, in which case the module is
not loaded.

Add a generic hook to load modules that provide a QemuOpts group,
and use it for the "spice" and "iscsi" groups.

Fixes: #194
Fixes: https://bugs.launchpad.net/qemu/+bug/1910696
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/config-file.h |  2 +-
 softmmu/vl.c               | 21 +++++++++++++++++----
 stubs/meson.build          |  1 +
 stubs/module-opts.c        |  6 ++++++
 util/qemu-config.c         |  1 +
 5 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 stubs/module-opts.c

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 8d3e53ae4d..0500b3668d 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -1,7 +1,7 @@
 #ifndef QEMU_CONFIG_FILE_H
 #define QEMU_CONFIG_FILE_H
 
-
+void qemu_load_module_for_opts(const char *group);
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
 QemuOpts *qemu_find_opts_singleton(const char *group);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 11ac3750d8..d55424e634 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2615,6 +2615,23 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+#ifdef CONFIG_MODULES
+void qemu_load_module_for_opts(const char *group)
+{
+    static bool spice_tried = false;
+    if (g_str_equal(group, "spice") && !spice_tried) {
+        ui_module_load_one("spice-core");
+        spice_tried = true;
+    }
+
+    static bool iscsi_tried = false;
+    if (g_str_equal(group, "iscsi") && !iscsi_tried) {
+        block_module_load_one("iscsi");
+        iscsi_tried = true;
+    }
+}
+#endif
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -3374,10 +3391,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
-                if (!olist) {
-                    ui_module_load_one("spice-core");
-                    olist = qemu_find_opts("spice");
-                }
                 if (!olist) {
                     error_report("spice support is disabled");
                     exit(1);
diff --git a/stubs/meson.build b/stubs/meson.build
index 3faef16892..f3f979c3fe 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -22,6 +22,7 @@ stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
 stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
 stub_ss.add(files('migr-blocker.c'))
+stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
 stub_ss.add(files('pci-bus.c'))
diff --git a/stubs/module-opts.c b/stubs/module-opts.c
new file mode 100644
index 0000000000..a7d0e4ad6e
--- /dev/null
+++ b/stubs/module-opts.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "qemu/config-file.h"
+
+void qemu_load_module_for_opts(const char *group)
+{
+}
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 670bd6ebca..34974c4b47 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -16,6 +16,7 @@ static QemuOptsList *find_list(QemuOptsList **lists, const char *group,
 {
     int i;
 
+    qemu_load_module_for_opts(group);
     for (i = 0; lists[i] != NULL; i++) {
         if (strcmp(lists[i]->name, group) == 0)
             break;
-- 
2.27.0


