Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C84AB1EF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:11:00 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnsB-0003gN-Mu
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp0-0000zV-Tw
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:44 -0500
Received: from [2607:f8b0:4864:20::82c] (port=45882
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnoy-0001Ll-Im
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:42 -0500
Received: by mail-qt1-x82c.google.com with SMTP id o3so10372740qtm.12
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VrP8O0AdqK/u4F+RuTSoaaT8lvAheKukWLQXUnaYck=;
 b=cm+7X2v0MPt1a476I73XvMI7ucwl0A/FyGARTbgMzXn2++C8PkHgZJh7VfppzoVPRX
 R2nUHpRl/PgYSZ0lwUYc6H9DRhaKWLDut/OdVwzNSlo+pBd3owAZaY7XSD4jCYEiGQpS
 kT39PDcUIZA3cq6TZZZGhhlkdS73EoNil2mwbvPOMsX8VbyXmp2ktUmyeTthyW7cgiC7
 NujQuCUFVkadmGSoIHQ5NF02ZK4FR2Hd2Y2VNwcAvwdhKa+vA809SL7cEMlHLeubnfR/
 rwQc59JMk/IocK8+ysPFBT/ELhCIC0l4SxU3JmoQWIR6C4wqNubgoe9prRnAOscFPoDq
 YTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VrP8O0AdqK/u4F+RuTSoaaT8lvAheKukWLQXUnaYck=;
 b=aZn4vSLZ104Hel4Pv1r1Eh137byKQ09hdnG+ISt5dUPnSwjdddBrU8MczWBtzR5A0u
 Dmdl6so8nVAf+IlXD/SrcBWZ+w4MSTGwu3rENqINIFxmhTcoHiJjDR8+LeeBNJGcu6RB
 FBrok8GuMKHjdbXPNYg6AnwKjhZLmyEkmYllViFEhXCRTydQS4zXgN8ps+mmlErJQM4A
 DSKWjq2cleVvUGIbsklrR05uLMdfatftxg8hy2vq4svuzwdlAyzMNrIEyq3TEhZebJHU
 Rcny0OmzY8i44tdX3xOCruVtQJqNlRBg9h81PvmllUarGVdtjRxO91X1PjjjOK9uEo7U
 n1Lg==
X-Gm-Message-State: AOAM533e02pzfZBNjmhS/cpQRwtYrP3ltQWR/EBb1hSi5240E0bOvaWN
 zrTbCjB3tbwVcNS7oqEvE95tRpHQ57yjPw==
X-Google-Smtp-Source: ABdhPJyXZJATsMpQTOQ8m/RJKsq8N8z+GxFmARlupAnnjkwHnQoKJwrwHNBAvaaQiyZqmEpZHJlSxw==
X-Received: by 2002:ac8:6edb:: with SMTP id f27mr5923434qtv.372.1644178057676; 
 Sun, 06 Feb 2022 12:07:37 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:37 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Sun,  6 Feb 2022 15:07:09 -0500
Message-Id: <20220206200719.74464-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82c.google.com
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
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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


