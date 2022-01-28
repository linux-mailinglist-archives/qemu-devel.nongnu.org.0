Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D549F056
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:06:32 +0100 (CET)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFih-0003mF-Un
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003ZH-F1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: from [2607:f8b0:4864:20::834] (port=41616
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005NF-DC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:52 -0500
Received: by mail-qt1-x834.google.com with SMTP id y8so3973654qtn.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/v0XF2RHAoH9pNxOZmTHbL6sT3vACQNy9UY2Pii5EE=;
 b=jDap7xbXjSD3QSqIOIzd09ur9P0nnw5knZjQym+aDJHUKFIaghGzkO2H/mn0TBYh/4
 sgQNUTeDHRO0u1JtRD2qOhlHVq9chqO9uQe1T/NEBsVHTjW6jBLIES8NXi+2slYwZ5G4
 BsudueTv2u6538MMc0Untsh1WPLxWbGBPMZubY+62CRqyXOf5fIZU89EM59/V/JmH29V
 XBjxOZFfLyIjTKutcUxLtaVUuInKFKz1uAKeBC/TI/luOeLFhhZ71oODFXhr1aNMCL18
 u0OAMDnwrvhdNroNgQ6b9XsDbow6Z21MiNMvGRlGFgG+GC5jBZtbClO0/2IsXn97nf07
 Sk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/v0XF2RHAoH9pNxOZmTHbL6sT3vACQNy9UY2Pii5EE=;
 b=l9t5pbLk3FORqn8YE95TYZqM++MIJnTd3SjAfXXnybXNp6fuMmNfQ/DqSRHzKMikJz
 TvsCFeRAvOU2FTo0XsyyzL7QbHufhD5kTvm5o6E2/1PNutuoNrtiMwKErGS910VvLvG9
 SCWakpfWeOyWn7Nm4nnG0fJvkB3MKhYOWr0jaIKSxTfFVoxUlMEdaDTzk3x9hwvxphHE
 pF3atkNrXoDfO0g+HNG5SqxK09DnNBtteoZ/mMh4VaELbpAkJHL3MkYi1v8N+EbIcTtx
 Rn9QU16sD55XT05IKNEOJ9OsT0zFAqur0VTCAOix/N/tnqcoXXd4YTaGd6cbPoPPqwdv
 pnAw==
X-Gm-Message-State: AOAM5339XIKL26jV2CCGqQLnSdAHGWsvYKLzzviyQtM8mDHXZcgSpd7x
 DrXN2T2SyjLL70jwOizF1NfZpEYAbxPfkA==
X-Google-Smtp-Source: ABdhPJx8lwH4a1QC2XlvSYFU8iv1IRQunXvJ/sfzX+LuREteNxUh93VKG4b7SWoFD9WQw5SclK8S6w==
X-Received: by 2002:ac8:7e88:: with SMTP id w8mr4624512qtj.447.1643331383895; 
 Thu, 27 Jan 2022 16:56:23 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:23 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Thu, 27 Jan 2022 19:56:01 -0500
Message-Id: <20220128005611.87185-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@alumni.harvard.edu>, Keno Fischer <keno@juliacomputing.com>
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
[Will Cohen: - Fix headers for Alpine
             - Integrate statfs.h back into file-op-9p.h]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/file-op-9p.h   | 15 ++++++++++++++-
 hw/9pfs/9p-local.c   |  2 ++
 hw/9pfs/9p.c         |  4 ++++
 include/qemu/xattr.h |  4 +++-
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 8fd89f0447..616c6f503f 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -16,10 +16,23 @@
 
 #include <dirent.h>
 #include <utime.h>
-#include <sys/vfs.h>
 #include "qemu-fsdev-throttle.h"
 #include "p9array.h"
 
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
+
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
2.34.1


