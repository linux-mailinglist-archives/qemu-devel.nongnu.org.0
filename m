Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6120719C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:56:54 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo35J-0003xf-N5
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zj-00014v-Un
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22798
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zh-0001I2-6n
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gq6A4Pmc9D+wI4Z4Xz25DoQrl3qHiAAck89mQP9dahw=;
 b=FmOIftKy1BbaE+eAQzUjbpupW6wQoobfgpaug3rs71eCcXGPuAbuOC7savNwPQD+YNtrFo
 5E8vuqZScw8YzU5YB5BUaEfSHbai0zmD/GmwI95HCdtTLdGRtYvVIxzJgQXAzAvdj9YVrt
 v0gLSXyhLb5+XpLaNZQZxSo0aQXb2ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-Aj7CYDDlNLuGvGuePXWmVg-1; Wed, 24 Jun 2020 06:51:02 -0400
X-MC-Unique: Aj7CYDDlNLuGvGuePXWmVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3461005512;
 Wed, 24 Jun 2020 10:51:01 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC561DC;
 Wed, 24 Jun 2020 10:51:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/31] exec: fetch the alignment of Linux devdax pmem character
 device nodes
Date: Wed, 24 Jun 2020 06:50:26 -0400
Message-Id: <20200624105048.375353-9-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jingqi Liu <jingqi.liu@intel.com>

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
Message-Id: <20200429085011.63752-2-jingqi.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index d6712fba7e..37c921f364 100644
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
@@ -1745,6 +1749,46 @@ static int64_t get_file_size(int fd)
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
@@ -2296,7 +2340,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
-    int64_t file_size;
+    int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
@@ -2332,6 +2376,14 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
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
2.26.2



