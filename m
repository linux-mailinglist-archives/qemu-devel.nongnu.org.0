Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CC38F1FD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:05:32 +0200 (CEST)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE1D-0000xR-Pi
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeS-0004yC-Rv; Mon, 24 May 2021 12:42:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004OY-4K; Mon, 24 May 2021 12:42:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id l1so42789619ejb.6;
 Mon, 24 May 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzYzur0aoGcQcPzxTRLpL0L9tdlIkO4njHPHcUkBeIQ=;
 b=fF9MQQEH/u2jop2j8HBHUka6Vpd6AoxtdU9D+oA4n3aoYUXKjJOW3yHaVfohLWPgL/
 nSLxWw02J94gsbL00TD4J53taEO6KwG/fLkc0sN+egDK/TNKopZ5x3RhLtqwqg1mh42o
 L1gu+gN5WoWFLOtGeGGv1vooapul5drBJa3bfdnAuzrXqzTI+i2+n9x0Xgj6cfw7ZL9Z
 yUtZz2YgYbBaTW+mYPdxX5B86TnYL9zKgfrzmnw9wBfvEbmy3Y055klhW8MWTAxN+k28
 YWjzjDxQa0ESm4adhk9vflr0/m41+3nz+BpCDoXss9JOt9TbNmErbfyMwPX4x79kCDF8
 vkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TzYzur0aoGcQcPzxTRLpL0L9tdlIkO4njHPHcUkBeIQ=;
 b=hrg6/7V0MOKlFY60bg8w2JZ6b+kufoKMdfoohb9sUdtrNlIzMtbqKzwHF9oYy29rJt
 hb4VdDDqFCjjwS6w9tnR/B34pzDqosJDvcUrGDbobyQgjFkjxhGZKVW+1gBpi1MN4J0o
 Jloef75EM2KPefVAm4Xot8Dnm3O2/hYlr8jGwqyxPVidbiGX9d7uXryMIsNaQRwa63F7
 DpAp/F9fDRL60Tu4PRDYa8SesjTZgw891jkeec/56OHyg7sN8OnT2McMSLyAN/Pk4fNK
 xnvfmlSGAF93ZS/WqKe3cAaYjxB8gxNr/VxoYals93nN8o4oq0ZeaDpt3gDGNnvHEYhT
 yVSA==
X-Gm-Message-State: AOAM53246GkMxPlaDk9lhxf9Hnv93QXDrSZmadnb30MgXuDUoYZOfkwf
 DIJCnp9OOO24bs0meq/rwwEi5msKEMb1Jw==
X-Google-Smtp-Source: ABdhPJwZ7h5UKZz//VJPfPgt/Ib4firFw7zs2fc6MOuXxYpeGnBLrPMMb5mb94eWIZL4lVK2sv+b8Q==
X-Received: by 2002:a17:906:914d:: with SMTP id
 y13mr24144351ejw.489.1621874509087; 
 Mon, 24 May 2021 09:41:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] qemu-config: load modules when instantiating option
 groups
Date: Mon, 24 May 2021 18:41:27 +0200
Message-Id: <20210524164131.383778-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org
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
Cc: qemu-stable@nongnu.org
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
index 21e55718a6..6054f6f0b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2627,6 +2627,23 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+#ifdef CONFIG_MODULES
+void qemu_load_module_for_opts(const char *group)
+{
+    static bool spice_tried;
+    if (g_str_equal(group, "spice") && !spice_tried) {
+        ui_module_load_one("spice-core");
+        spice_tried = true;
+    }
+
+    static bool iscsi_tried;
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
@@ -3386,10 +3403,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
2.31.1



