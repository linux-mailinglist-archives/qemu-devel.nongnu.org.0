Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FD506591
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:19:09 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi8i-0003lv-H4
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmF-0001FB-H0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggly-0004Rs-PX
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso809236wma.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwsg4VyYoYNXnwQej3aaj/VEd3qtRkQw8m6My/RvkUk=;
 b=f7EPt9z3W54Pk3V3UJg+UCxnhyS79WKyLCkUPLr+rOtZkKkERrtd1pTaZ07x5bZwQR
 WXKrkvWSMWpwIZeYdDwOH3/viXkOkNGpnD3DZrGP26KocVHBezy7lLMcDIduxmT67oa3
 H+GYU7JcJGspH6W0xCCtKLoHRGphisw8vu/FPZJNdKn8I26IhlFK7Rds/CbhrgvGy+q4
 O5xVGAculAO88nxP/sXHLNfNBnuJRT4UQojntJz5q4sKP38hnPXEAbDmWBZZvdICUHhN
 kHWlvkjhRVqsu3BZLoCJj+k7zc7qcxTK3csjmXNSItsgCtUAhLqfY0aPXRDZ9ROtZ0mL
 a1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cwsg4VyYoYNXnwQej3aaj/VEd3qtRkQw8m6My/RvkUk=;
 b=sGW1pXhIcZ5HqUYGyK3/X0zurDk2KWePe3K2YAtRCqA1H5yx0fL1EIprC0t4AHTW7R
 /3rwb8kOhDnjWX0MwEH/m9AfSjlpwv+Vgf4QG8DMTkJSuQBVhYDbNd+RM2Q6q/4b24YN
 xJ5zdYXh1z6W1U93r993k+3eE7YBbfJFn//6X2cv+2XL0B7TDN/hdgA2Frqr+JEr4ElN
 5RykiXZmQg6k4nfn3eDi3UBstzzUsVfs3FYD+10j/Nl/MriHjzCpNpDTeY3tB500cBNl
 xvoN2URJTPfiy3lszPs7kq3T/nfq6lQFIUkqoMyAqU0LhlpAtURIfGSSOmZPeCgyD00f
 hhZw==
X-Gm-Message-State: AOAM531RyBeWrrJucOhvAmT2Bu/asrvkPEPk1NbOnvXdLlvC7SnN9Xaq
 YovFWWk2G06eobLDVRHFAmRHA5MGRqGBQA==
X-Google-Smtp-Source: ABdhPJzW9qVHaHehIU8njxM3R54Yn4L/d4kPlcEse9VtHiKRyv1zgsHNFkmMJB4R211a3Z0ARdoWwA==
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id
 s17-20020a1cf211000000b003816c60742fmr14818388wmc.130.1650347493183; 
 Mon, 18 Apr 2022 22:51:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/53] include: move qemu_get_vm_name() to sysemu.h
Date: Tue, 19 Apr 2022 07:50:46 +0200
Message-Id: <20220419055109.142788-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PP_MIME_FAKE_ASCII_TEXT=0.999,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-26-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/audio.c           | 2 +-
 block/iscsi.c           | 2 +-
 include/qemu-common.h   | 2 --
 include/sysemu/sysemu.h | 2 ++
 stubs/get-vm-name.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 1c98964eb8..9e91a5a4f2 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -32,7 +32,7 @@
 #include "qapi/qapi-visit-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
diff --git a/block/iscsi.c b/block/iscsi.c
index 51f2a5eeaa..d707d0b354 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -28,7 +28,7 @@
 #include <poll.h>
 #include <math.h>
 #include <arpa/inet.h>
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/bitops.h"
diff --git a/include/qemu-common.h b/include/qemu-common.h
index fee2181af2..1fbc20e4bc 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,8 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-const char *qemu_get_vm_name(void);
-
 /* OS specific functions */
 void os_setup_early_signal_handling(void);
 int os_parse_cmd_args(int index, const char *optarg);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ff..10e283c170 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -13,6 +13,8 @@ extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
 
+const char *qemu_get_vm_name(void);
+
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
diff --git a/stubs/get-vm-name.c b/stubs/get-vm-name.c
index fa990136b0..0906303f73 100644
--- a/stubs/get-vm-name.c
+++ b/stubs/get-vm-name.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 
 const char *qemu_get_vm_name(void)
 {
-- 
2.35.1



