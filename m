Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5158F4B74B1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:30:10 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Wa-0000b9-5J
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK380-0000Uw-HE
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:44 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=40636
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK37y-0002j6-H6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:44 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id v10so26537qvk.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/a52Ymyen9MRJFePDxCcyYr+mACfmfhjAFtBkPNnik=;
 b=bj7+aSCws3ia/mOQt+JJ63Hv+pmA+6X/usethwlir31+s8ZXX5E4jKmcG8VE8BlFsQ
 eX7NlY4x2v0PEIWXPEuCPOBOqmK0Y3DUbT3+pSVvZFsfDzPb9tEewTv4goFp23/E1CRT
 5JZtMS3pW8j7sBerC47zKFojaPTHVJ0aFxiipwP6IWwsjIDB6fHadBI6BpOcT2M/v4wq
 t8NB9kI1sFC+jiiq8IOyOp6WEl/1fJpVAc5InLxEK5/PEWDXU81mBwC4KEmbbbrKEBT2
 epKYJD81Oq6ESyTqJ1eGtpvyMV9CEq07QhQSjlcHwFn4LBzztDKvROqjlWqt/KDFhGOb
 2Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/a52Ymyen9MRJFePDxCcyYr+mACfmfhjAFtBkPNnik=;
 b=qYV+pG8lmitu4ZEWjxMfzt4wWducWgBN2OEZid91dHvY+ox5u+8V/O/zfkq+GFw0za
 B7+/hv1xFwwW7TxtGm6IylLET1xdDj3dMj4VrtZqbfKOXmwsx1B7vYZZZBaPnjLruvvd
 Vy5bfvV2BGy0pIl4nqEd/ogNfu8lWk6bb5QB9zvOo+tjmCMRnVOjTSQtE3C4s80eYz+E
 EmwVqV0BKRXZKwG22bkk18MPj2ngy2QfGUIcwCl/vyYK0xd7KJq6Y+DFQE04iqtRzYKH
 c1IeRKLGGC4LeD6fV1lwD3KOXty9yjCHJR+ADGM58+edlXxM7MiczcbtmUGBx2bzdGwr
 RdsQ==
X-Gm-Message-State: AOAM530xJVbeHH5Syjdu/uixjsHnzrqeUvgxvBg/ph/FwbqaN2zdubGJ
 0ZFs5Ii85jEwvaVVYPdbQG5gv+226UkebA==
X-Google-Smtp-Source: ABdhPJwR6/OriVWYUayfUKBTmm2E9EYc5Lzc+DO/8v/SibYPfgYsXJRZMunQxrGMMB/7kstsM1Q08w==
X-Received: by 2002:a05:6214:5005:: with SMTP id
 jo5mr422712qvb.19.1644951881040; 
 Tue, 15 Feb 2022 11:04:41 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:40 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Tue, 15 Feb 2022 14:04:16 -0500
Message-Id: <20220215190426.56130-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
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
2.34.1


