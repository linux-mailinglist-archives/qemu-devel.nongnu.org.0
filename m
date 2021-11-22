Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C502C45877C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:51:22 +0100 (CET)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxYH-0006eB-Rf
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWS-0003zc-CL
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:28 -0500
Received: from [2607:f8b0:4864:20::f36] (port=42677
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWQ-0000wa-Bb
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:28 -0500
Received: by mail-qv1-xf36.google.com with SMTP id b17so11328019qvl.9
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PAA64zpjMOFdawCQAcn6F45dhsKweSXc7go9O2m/FPo=;
 b=oR8ec3YtpGnwhb7J8fHWwltp5Ev4N3en4WIOt8J6/THMrfgZ9oO/3TDAJu8r9cmND/
 MBQNyv75ZHHRCyg/mF/DlipHwQ4o591O39DKN6rKHAUfAMfmQzXOxPBIUG7TOpUj/RCS
 Q9NG2f0K51iWjz+bvzTxxlpFkozBJSZe/PqyLvLtdY5+ifPaRscaLF7gfR9+eUpnz9L6
 a/td7PpuBTYFXPJ0+U6+e4C4vgU61y5N8k3fBn6GVZK4pf8//StKZ6eMw1xkYiWdulGZ
 uynksfH6iN2sHTYh6XTI1NSjgivHed7v4mkTPXJTMmO4lMi/Rq3i66rsllxturCpyOTh
 X4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAA64zpjMOFdawCQAcn6F45dhsKweSXc7go9O2m/FPo=;
 b=3yUiqVp8HtOauGhjBKrdAI7M6+M5CkPS0hI2lV8jk5IZ+xahf5jw0WtHgBHQHqENJ6
 YcGXpU5bNt+jgmCQAUGcGvZUWb08yYLJtvxcVq01/n6+20wjoHvfggEmSD6UgkPYXLho
 OvBiyxwGE9/8U3Aq75NJBxNFZQNuymIUaOg7SzD4Nei/eJ4FPsvldMo3xecQi/8Pk6dz
 yi3Gv7CkvM9IFq3TjCcEqh5mQvP0K/M006732GX8eM7aaJ2ndB7inPa6TwyJR5dEhUXI
 7aUZOOchMXe8Y+ado4DrlHxdAWcu6Zi/7qtHLq35o0xKhG1OgU8h0830ciV0M1Vv/aqJ
 ZfpQ==
X-Gm-Message-State: AOAM533njrzmlz8H+1nhPrCS74jForddU/k/1Hkst65WbxAbbnNedCun
 94cTLT8ecaKnqFzriPa8iIh+mAyukvSOkg==
X-Google-Smtp-Source: ABdhPJyZv6y4NeddVUsDG+PKyal2gCSDFoTIx4BQ0Lb2FP1kCNP5B8sFjqBBxb5G85Koeq5O97qQRw==
X-Received: by 2002:a05:6214:1c8d:: with SMTP id
 ib13mr97863154qvb.64.1637542165312; 
 Sun, 21 Nov 2021 16:49:25 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:25 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Sun, 21 Nov 2021 19:49:03 -0500
Message-Id: <20211122004913.20052-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@alumni.harvard.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@alumni.harvard.edu>

 - Guard Linux only headers.
 - Add qemu/statfs.h header to abstract over the which
   headers are needed for struct statfs
 - Define `ENOATTR` only if not only defined
   (it's defined in system headers on Darwin).

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Fix headers for Alpine]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/file-op-9p.h    |  2 +-
 hw/9pfs/9p-local.c    |  2 ++
 hw/9pfs/9p.c          |  4 ++++
 include/qemu/statfs.h | 19 +++++++++++++++++++
 include/qemu/xattr.h  |  4 +++-
 5 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 include/qemu/statfs.h

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 8fd89f0447..16c1a9d9fe 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -16,7 +16,7 @@
 
 #include <dirent.h>
 #include <utime.h>
-#include <sys/vfs.h>
+#include "qemu/statfs.h"
 #include "qemu-fsdev-throttle.h"
 #include "p9array.h"
 
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
2.34.0


