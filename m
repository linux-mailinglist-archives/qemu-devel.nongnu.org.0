Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59633A8166
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:51:29 +0200 (CEST)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9TU-0003WK-My
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hj-0005yj-1y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hh-0002nM-Dg
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id d7so3114140edx.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiu7ziiW42i1lxDyJDOcGawcWvmvcODGC75HldQeDRk=;
 b=lQxL379DhxgUWpAJfrA82dAZ0ysdESPV/NEVnr8aggPJxUFECQhTPHGtIrFzLVuvtu
 C8a9PhHzDPKUljMIsyTJdAR8SxEQzR6d7okmti/kpgpcC7TZUgvqm3kvbAaXwKmoOOMR
 egvlkBs1En077TNLayc4ItcDlB/rDpvchXr2jqYe2f6RUFkoHDiOl5d2owIH5ZkyRJ1d
 PxZh4xqAtJNLhi8PTjqk5R1cQ6OcjyGIr0WhsjhP/umvKfxAdq+3XbnDDWh99urWBhyy
 zP+A/JctyEmkCmW23qmDekHcgAbpAT0cV9OUIC8AFb2/9XVLqvh0SHWh2eYWar1f9c27
 w3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hiu7ziiW42i1lxDyJDOcGawcWvmvcODGC75HldQeDRk=;
 b=NrJeGqAyMjSOZJIS8GTPoBbG4V6NweaCY5KANz/RAdicRdknAYr6KTrAcSMGlnjfDA
 6J8Sejpvw+b9SyMR/nsGhT5eu6mHQbY47jd44QGndvozvfCMmvA13VKwJMiF+ruuDzCL
 GPcXLkhVnCJM/aoaI8UU02ZbfLR2LqRgIra65i3S0IoHPhpIjSAJom8BZ/C48jloHr+K
 kjuTLJ0iA9ta6u2f0g1WxlVA9KCuDU8ajpxUiMxqWyF0FxkiDjF5YO8KyyrD+/QjwGh8
 1cCIaY5LY+JqtcuzeH7zUlAKgFjnDwdkJyX+fZyygj8YBqoVlZW99gmtX6co0umhx7OE
 UDCA==
X-Gm-Message-State: AOAM533c0iwie2uOd8PmP/pDMBKAx+YaJ/p4Si8yrnn5ZXRFzIDN1m0Q
 gkfmI/V0ggdKyNGi4NunU6US8WFs5C4=
X-Google-Smtp-Source: ABdhPJwr+cJ6MMta0BTczuubnzM2LVT/QuLplVvHjti4KW8/s0DpTjV2AcMfFznYkvsQF70Pk0xNPw==
X-Received: by 2002:a05:6402:510e:: with SMTP id
 m14mr23346690edd.225.1623764356062; 
 Tue, 15 Jun 2021 06:39:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] util/mmap-alloc: Factor out reserving of a memory region
 to mmap_reserve()
Date: Tue, 15 Jun 2021 15:38:41 +0200
Message-Id: <20210615133855.775687-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to reserve a memory region without actually populating memory.
Let's factor that out.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/mmap-alloc.c | 58 +++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 24854064b4..223d66219c 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,6 +82,38 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+/*
+ * Reserve a new memory region of the requested size to be used for mapping
+ * from the given fd (if any).
+ */
+static void *mmap_reserve(size_t size, int fd)
+{
+    int flags = MAP_PRIVATE;
+
+#if defined(__powerpc64__) && defined(__linux__)
+    /*
+     * On ppc64 mappings in the same segment (aka slice) must share the same
+     * page size. Since we will be re-allocating part of this segment
+     * from the supplied fd, we should make sure to use the same page size, to
+     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
+     * avoid allocating backing store memory.
+     * We do this unless we are using the system page size, in which case
+     * anonymous memory is OK.
+     */
+    if (fd == -1 || qemu_fd_getpagesize(fd) == qemu_real_host_page_size) {
+        fd = -1;
+        flags |= MAP_ANONYMOUS;
+    } else {
+        flags |= MAP_NORESERVE;
+    }
+#else
+    fd = -1;
+    flags |= MAP_ANONYMOUS;
+#endif
+
+    return mmap(0, size, PROT_NONE, flags, fd, 0);
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -104,7 +136,6 @@ void *qemu_ram_mmap(int fd,
     int prot;
     int flags;
     int map_sync_flags = 0;
-    int guardfd;
     size_t offset;
     size_t total;
     void *guardptr;
@@ -116,30 +147,7 @@ void *qemu_ram_mmap(int fd,
      */
     total = size + align;
 
-#if defined(__powerpc64__) && defined(__linux__)
-    /* On ppc64 mappings in the same segment (aka slice) must share the same
-     * page size. Since we will be re-allocating part of this segment
-     * from the supplied fd, we should make sure to use the same page size, to
-     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
-     * avoid allocating backing store memory.
-     * We do this unless we are using the system page size, in which case
-     * anonymous memory is OK.
-     */
-    flags = MAP_PRIVATE;
-    if (fd == -1 || guard_pagesize == qemu_real_host_page_size) {
-        guardfd = -1;
-        flags |= MAP_ANONYMOUS;
-    } else {
-        guardfd = fd;
-        flags |= MAP_NORESERVE;
-    }
-#else
-    guardfd = -1;
-    flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#endif
-
-    guardptr = mmap(0, total, PROT_NONE, flags, guardfd, 0);
-
+    guardptr = mmap_reserve(total, fd);
     if (guardptr == MAP_FAILED) {
         return MAP_FAILED;
     }
-- 
2.31.1



