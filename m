Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3442CFCB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:03:52 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map9z-0006EQ-CY
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIK-0003yn-HQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:22 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIJ-00034n-1X
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:20 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id a16so2726536qvm.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XX/jGrUjlGVuib4H2fZzgMtat+B8v1Q0qiLhHS8LE0c=;
 b=qgJNUjdO+2CXhT1qncR4+/ws8RPirLMRWchgFbAPNTAdxf4dpkqcuO7MtbXf7NAgua
 jrxA/Ugk23uudHR0rjazp6HDh0LYoPvURS9dCmXDdBf1YRaufXJiMvtOcxNniAm3pz73
 +GjNmabkf3dXcAu53IetYQxr1UMe8FEPtDd4XxYhDLSO33lugKEg63NgMxp0LTcQ9z10
 DM+cgIVoHNYbfiRCaR15lMjBfstUJU4Gmm2O6w29X9EgLa7zlVEI8Cc6UMCwnl/Ton59
 nGGBcQ1kdbHIkXHmk1kEKUKMn8QMB0BkGgtig9GGvsjK2le5N/o1ymzKKSTxyuDNoGNy
 5TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XX/jGrUjlGVuib4H2fZzgMtat+B8v1Q0qiLhHS8LE0c=;
 b=QVYvCXMpkaKKMj+yOy6ObA4fAMcNIL6qZb5PD7k1Uz1rUBuJVP9fXyRp90WL59j8fE
 4sIVH+e89194GiuTkw4xrarRqR0ioClP3z4BRhsMRdvHbDqx/iexb09gE7esXug55OxA
 CKkJkmzRtfFECpH3go8crs47MAwrE6QgY/ch2robP82zJsVrd5hjINIex/ZPq+zk6h7N
 JgvqUGF++tepare8l6SxPZfs97uH1Ht2OCAh/QYEVBmacESHAZ8kDLfBCVNf32jNMaqc
 heXxagyl1HrTxNhGcqbdouRX4WSp6pEc9YkhqTcZj+8yKT9ifctBbSiJ3svS4bC7lh0C
 GFtw==
X-Gm-Message-State: AOAM531FjFBxtTrBKf7uv6EjpZ+0+omuwvI59MaTzF3gMkoo4mnubkCV
 7bFBqM+XJrg2PO7DDiMjWCdw5W75DbqezQ==
X-Google-Smtp-Source: ABdhPJzoXpT3FXU/WGFjB9mf4Fq8RkY/02zpYXDU9mlmnC5lfydBqVf/JV09Nxq4XgX/IYSIlePtWQ==
X-Received: by 2002:a0c:f806:: with SMTP id r6mr1782166qvn.49.1634166257777;
 Wed, 13 Oct 2021 16:04:17 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:17 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Wed, 13 Oct 2021 19:03:55 -0400
Message-Id: <20211013230405.32170-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@alumni.harvard.edu>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@alumni.harvard.edu>

 - Guard Linux only headers.
 - Add qemu/statfs.h header to abstract over the which
   headers are needed for struct statfs
 - Define `ENOATTR` only if not only defined
   (it's defined in system headers on Darwin).

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
---
 fsdev/file-op-9p.h    |  2 +-
 hw/9pfs/9p-local.c    |  2 ++
 hw/9pfs/9p.c          |  2 +-
 include/qemu/statfs.h | 19 +++++++++++++++++++
 include/qemu/xattr.h  |  4 +++-
 5 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 include/qemu/statfs.h

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 42f677cf38..d9d058b756 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -16,7 +16,7 @@
 
 #include <dirent.h>
 #include <utime.h>
-#include <sys/vfs.h>
+#include "qemu/statfs.h"
 #include "qemu-fsdev-throttle.h"
 
 #define SM_LOCAL_MODE_BITS    0600
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
index c857b31321..2f0e960162 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -32,7 +32,7 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
-#include <linux/limits.h>
+#include <limits.h>
 
 int open_fd_hw;
 int total_open_fd;
diff --git a/include/qemu/statfs.h b/include/qemu/statfs.h
new file mode 100644
index 0000000000..dde289f9bb
--- /dev/null
+++ b/include/qemu/statfs.h
@@ -0,0 +1,19 @@
+/*
+ * Host statfs header abstraction
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2, or any
+ * later version.  See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef QEMU_STATFS_H
+#define QEMU_STATFS_H
+
+#ifdef CONFIG_LINUX
+# include <sys/vfs.h>
+#endif
+#ifdef CONFIG_DARWIN
+# include <sys/param.h>
+# include <sys/mount.h>
+#endif
+
+#endif
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
2.33.0


