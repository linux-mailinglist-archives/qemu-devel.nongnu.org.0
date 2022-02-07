Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAF4ACC43
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:47:24 +0100 (CET)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCn4-0004Qh-Lg
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgU-0003u4-GC
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:34 -0500
Received: from [2607:f8b0:4864:20::82a] (port=38810
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgQ-0005gx-14
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:32 -0500
Received: by mail-qt1-x82a.google.com with SMTP id r14so13313953qtt.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxpmZw3wmO9sFibs7RvAQEwmqAN1NAVfo7lSbvdzrZQ=;
 b=f0JiPQGgzMC3ayqFywiy6RlsTQ4rEegTUwK/qLXjaWrbbav8eNDXR0yyROzsFPDzqJ
 p0SIF0ZlyTiZ/DTWu3A9anIbAXJqR6rBQxR36W7GES7HtBNpE5FFbm+e5v9U5uioBTK4
 PM6v/8a02ygbXk72jThNrURCz25FRyhIwd5UlB9xGrIyuAO2RKwQykAlRzi2jfU6ulAT
 PzAvqkMLXiR+bHU0RPZpPmGh3ZCO20gtmt40Cp3CIYCGWRUwIO9RyhUuaMB0VaxHTlJb
 5X60u+XcNYE/bE2gUv3QwiIlSu/Mp4V326Ci4nLHfoSiSxvxZNwOzK7yE2Aoya7tp+d3
 wJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxpmZw3wmO9sFibs7RvAQEwmqAN1NAVfo7lSbvdzrZQ=;
 b=sNADiojzelscU4FTfBMmidlP8Ws5P8XUfdURmGXGS1CjW4UQNQHAQxpsU1+SsWsezM
 pEupaUFoBGlEEMklELJQ4XfPtT3WWzOTUBvxh4Iv8GP9Mj/tt+g5T+3WQrwAsQ5M+Vtb
 VWvMJbyoOzUeU7ekRNGFnqgGXcjrjiHnfryA0ZdEn+v0KxkOYvWauLPWYi6mrZupUagl
 P12B6oQaapsigZ2311GxZKzRxltORXZ06XnUVYurDARBCyJ1osWs7LfTfP5jdfe8A2yk
 hv6V3MmyfB12Ki9+D25aNxXwJwEaxpC1bp9pB+nL0doJjWllt9VIYji5vRUia1wPhMDo
 3oEA==
X-Gm-Message-State: AOAM532CyUecggRUAz92NhiJgLMjnrIusejwnq+KLYNbJB1pgA3k5tj9
 oPA22KVFXrarm1nwvoaYxzRJJF/YckDAZA==
X-Google-Smtp-Source: ABdhPJzRe3sQOp8ZUjTOAv1vBcoq1/jihlUMB+PfbtgvBwm2ut6z8OFdm5+pNghiru9mCOvkA2c7dw==
X-Received: by 2002:a05:622a:1356:: with SMTP id
 w22mr1277671qtk.100.1644273628294; 
 Mon, 07 Feb 2022 14:40:28 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:27 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Mon,  7 Feb 2022 17:40:14 -0500
Message-Id: <20220207224024.87745-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

 - Guard Linux only headers.
 - Add qemu/statfs.h header to abstract over the which
   headers are needed for struct statfs
 - Define `ENOATTR` only if not only defined
   (it's defined in system headers on Darwin).

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

While it might at first appear that fsdev/virtfs-proxy-header.c would
need similar adjustment for darwin as file-op-9p here, a later patch in
this series disables virtfs-proxy-helper for non-Linux. Allowing
virtfs-proxy-helper on darwin could potentially be an additional
optimization later.

[Will Cohen: - Fix headers for Alpine
             - Integrate statfs.h back into file-op-9p.h
             - Remove superfluous header guards from file-opt-9p
             - Add note about virtfs-proxy-helper being disabled
               on non-Linux for this patch series]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 fsdev/file-op-9p.h   | 9 ++++++++-
 hw/9pfs/9p-local.c   | 2 ++
 hw/9pfs/9p.c         | 4 ++++
 include/qemu/xattr.h | 4 +++-
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 8fd89f0447..4997677460 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -16,10 +16,17 @@
 
 #include <dirent.h>
 #include <utime.h>
-#include <sys/vfs.h>
 #include "qemu-fsdev-throttle.h"
 #include "p9array.h"
 
+#ifdef CONFIG_LINUX
+# include <sys/vfs.h>
+#endif
+#ifdef CONFIG_DARWIN
+# include <sys/param.h>
+# include <sys/mount.h>
+#endif
+
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
 
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 210d9e7705..1a5e3eed73 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -32,10 +32,12 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include <libgen.h>
+#ifdef CONFIG_LINUX
 #include <linux/fs.h>
 #ifdef CONFIG_LINUX_MAGIC_H
 #include <linux/magic.h>
 #endif
+#endif
 #include <sys/ioctl.h>
 
 #ifndef XFS_SUPER_MAGIC
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 15b3f4d385..9c63e14b28 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -32,7 +32,11 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
+#ifdef CONFIG_LINUX
 #include <linux/limits.h>
+#else
+#include <limits.h>
+#endif
 
 int open_fd_hw;
 int total_open_fd;
diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index a83fe8e749..f1d0f7be74 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -22,7 +22,9 @@
 #ifdef CONFIG_LIBATTR
 #  include <attr/xattr.h>
 #else
-#  define ENOATTR ENODATA
+#  if !defined(ENOATTR)
+#    define ENOATTR ENODATA
+#  endif
 #  include <sys/xattr.h>
 #endif
 
-- 
2.32.0 (Apple Git-132)


