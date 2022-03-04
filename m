Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDD4CD517
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:23:46 +0100 (CET)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7uL-0005Uq-BO
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bca156323feb554c2eb54aa3888a4445666437b@lizzy.crudebyte.com>)
 id 1nQ7lt-0000lP-5P
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:15:02 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:49909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bca156323feb554c2eb54aa3888a4445666437b@lizzy.crudebyte.com>)
 id 1nQ7lr-000667-FH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=KO3uCcDtoP8ypvHqVZeogjqwQxCYF7uWlWLOucj+apQ=; b=PQG1q
 E4KgRSngS09ShDII/fCbrzpF6fTn/eAcusTM/YRBvgaihmEgJxHTuCxbkaw2R06hnZV6MvlUX6K0y
 vNSnl4h5mshCLoaWr/fbtNgtxnjBCG0iJ2U4pUY8bZFbm6OE4PoWfm54wp2N9YWQa0FIrIlLiDTvF
 8+tSOvvGwNyvZfHfxvXVDQrimkzvMSo8Yyy7KwfTttEBUi2D3YFuv9pt63PdEBkzl2gTP/sGjrMRT
 Hlf4DVT0WXjE8mnQzTBn31gbZgsV3L2cC9Q6DZDXqdiwNTv9rUh9BDw/mugogNKWlrfBNipgsI1uj
 enOqpJdAxtnL4zMmdUVBwaBmGXj0w==;
Message-Id: <9bca156323feb554c2eb54aa3888a4445666437b.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 01/19] 9p: linux: Fix a couple Linux assumptions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=9bca156323feb554c2eb54aa3888a4445666437b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220227223522.91937-2-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
2.20.1


