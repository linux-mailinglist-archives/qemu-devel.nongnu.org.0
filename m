Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F261BD7C1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 10:58:49 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTiYK-00054u-Vv
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 04:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jTiVc-0000rk-53
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jTiV8-0001BE-HL
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:55:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:25913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1jTiV7-0000wb-II
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:55:30 -0400
IronPort-SDR: 0N+vlx/ELAfT5oIF/ePZwBRbQFV+MakLSGnSBew8Ia7rpK5HlUfbfGfnClNejhKgeD92p1uR7z
 W6/BRXBXyaqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 01:55:26 -0700
IronPort-SDR: f+c7rNMlyGB4ZDKLhVjyNARVSQZ5ut6OSNUKkx1QxvDtcF0XOuLKuYpkfDpFvobpv/g3A/0yRS
 8QKcGSxvorZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; d="scan'208";a="459114622"
Received: from dazhang1-mobile.sh.intel.com ([10.239.48.70])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2020 01:55:24 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joao Martins <joao.m.martins@oracle.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v3 1/3] exec: fetch the alignment of Linux devdax pmem
 character device nodes
Date: Wed, 29 Apr 2020 16:50:09 +0800
Message-Id: <20200429085011.63752-2-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429085011.63752-1-jingqi.liu@intel.com>
References: <20200429085011.63752-1-jingqi.liu@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=jingqi.liu@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 04:55:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 192.55.52.43
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the backend file is devdax pmem character device, the alignment
specified by the option 'align=NUM' in the '-object memory-backend-file'
needs to match the alignment requirement of the devdax pmem character device.

This patch uses the interfaces of libdaxctl to fetch the devdax pmem file
'align', so that we can compare it with the NUM of 'align=NUM'.
The NUM needs to be larger than or equal to the devdax pmem file 'align'.

It also fixes the problem that mmap() returns failure in qemu_ram_mmap()
when the NUM of 'align=NUM' is less than the devdax pmem file 'align'.

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 exec.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index de9d949902..2c3444e47e 100644
--- a/exec.c
+++ b/exec.c
@@ -77,6 +77,10 @@
 
 #include "monitor/monitor.h"
 
+#ifdef CONFIG_LIBDAXCTL
+#include <daxctl/libdaxctl.h>
+#endif
+
 //#define DEBUG_SUBPAGE
 
 #if !defined(CONFIG_USER_ONLY)
@@ -1736,6 +1740,46 @@ static int64_t get_file_size(int fd)
     return size;
 }
 
+static int64_t get_file_align(int fd)
+{
+    int64_t align = -1;
+#if defined(__linux__) && defined(CONFIG_LIBDAXCTL)
+    struct stat st;
+
+    if (fstat(fd, &st) < 0) {
+        return -errno;
+    }
+
+    /* Special handling for devdax character devices */
+    if (S_ISCHR(st.st_mode)) {
+        g_autofree char *path = NULL;
+        g_autofree char *rpath = NULL;
+        struct daxctl_ctx *ctx;
+        struct daxctl_region *region;
+        int rc = 0;
+
+        path = g_strdup_printf("/sys/dev/char/%d:%d",
+                    major(st.st_rdev), minor(st.st_rdev));
+        rpath = realpath(path, NULL);
+
+        rc = daxctl_new(&ctx);
+        if (rc) {
+            return -1;
+        }
+
+        daxctl_region_foreach(ctx, region) {
+            if (strstr(rpath, daxctl_region_get_path(region))) {
+                align = daxctl_region_get_align(region);
+                break;
+            }
+        }
+        daxctl_unref(ctx);
+    }
+#endif /* defined(__linux__) && defined(CONFIG_LIBDAXCTL) */
+
+    return align;
+}
+
 static int file_ram_open(const char *path,
                          const char *region_name,
                          bool *created,
@@ -2275,7 +2319,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
-    int64_t file_size;
+    int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
@@ -2311,6 +2355,14 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
+    file_align = get_file_align(fd);
+    if (file_align > 0 && mr && file_align > mr->align) {
+        error_setg(errp, "backing store align 0x%" PRIx64
+                   " is larger than 'align' option 0x" RAM_ADDR_FMT,
+                   file_align, mr->align);
+        return NULL;
+    }
+
     new_block = g_malloc0(sizeof(*new_block));
     new_block->mr = mr;
     new_block->used_length = size;
-- 
2.17.1


