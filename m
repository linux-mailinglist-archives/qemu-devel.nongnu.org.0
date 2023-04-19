Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24306E7F6E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:18:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAVK-0004uf-1f; Wed, 19 Apr 2023 12:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVC-0004tr-As
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAV9-0004zh-P1
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mA6pp+vQCW8Hb5Iclg6SNJ15lnYctRVp38DJGWj5fhY=;
 b=I+aeU46KRRycz4hPqYihaHOP+QJOZELyYC25jOBT80RM7Fmvmf0/lwt2zWLJxyVXgdgep6
 pIXfBfSUTTz2320ylY8kyVXz0d+AP1i+arSwm5ICWVNEZ4usDCUqjz9gzPB7um+trtJGI7
 FIb5FjbEUbp9j9b/Pbrp0iU8JzWvEGY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-_CjkED3zNbCNJQMvrAIC9w-1; Wed, 19 Apr 2023 12:17:45 -0400
X-MC-Unique: _CjkED3zNbCNJQMvrAIC9w-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74deffa28efso1952985a.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921064; x=1684513064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mA6pp+vQCW8Hb5Iclg6SNJ15lnYctRVp38DJGWj5fhY=;
 b=bWopprWBY/rI9/CxZNYKL2S3ZSJXxkGYnf6HRm9WTBM4vL4kcpfnRYW41QCmFAjCwq
 xj6rAciySXfQ3zcJo/mJ9qb3c6XeXXoq0F34x9IUFCGo+IpnSlNtYLnzF4kKBD03dYRq
 tqkUcbigg4JjIipi/JhQn0ewThXMHt5AF897Ln9aCzsDJsn3L3VeJ6RZOkwQNpk7/ZLU
 Eg/6IV2umFgU44Iw0tqS44Rgfaf3lk4853QmhJzXi0NiRgYBzHD9FPXkwvi2nmF7GwBZ
 AqiGEf3hmwBvWaxG0BFCmGmdgsPl4+pUGbJy1Sya61W7tQ6H6FDK3WaqGxyRCH32t9dt
 1ZgQ==
X-Gm-Message-State: AAQBX9cHYYHImWdV5ap6QDkAxKf4gWEq5cq4p6rS1HHW1jzaeotW9yN4
 6brmG/dNHgxvgOf2r41XtAn8yrPbPlVjwdu1okQ1wt34JBZQSa9uZtpde4gQ0a1gPc/ysEcJxdy
 3jgTnk2UtWoDqkpDPNEGEDCcBmB9VWVbTriN6HxEKQw2z9pJEshk1IZ2Ifbt4eCYsHvQchvJF
X-Received: by 2002:a05:6214:5095:b0:5ef:55d8:7164 with SMTP id
 kk21-20020a056214509500b005ef55d87164mr27129894qvb.5.1681921064215; 
 Wed, 19 Apr 2023 09:17:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aGq6yiCVVvI3FKrZ3g4JSBLM9hafVsuOJ2GPEm6J1FzZQ3o9FhsCeOd5Ts7ZuneUwowk+TJg==
X-Received: by 2002:a05:6214:5095:b0:5ef:55d8:7164 with SMTP id
 kk21-20020a056214509500b005ef55d87164mr27129846qvb.5.1681921063884; 
 Wed, 19 Apr 2023 09:17:43 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05620a0b0c00b007468b183a65sm351481qkg.30.2023.04.19.09.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:17:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 1/4] util/mmap-alloc: qemu_fd_getfs()
Date: Wed, 19 Apr 2023 12:17:36 -0400
Message-Id: <20230419161739.1129988-2-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230419161739.1129988-1-peterx@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This new helper fetches file system type for a fd.  Only Linux is
implemented so far.  Currently only tmpfs and hugetlbfs is defined, but it
can grow per need.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/mmap-alloc.h |  7 +++++++
 util/mmap-alloc.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 2825e231a7..8344daaa03 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -1,8 +1,15 @@
 #ifndef QEMU_MMAP_ALLOC_H
 #define QEMU_MMAP_ALLOC_H
 
+typedef enum {
+    QEMU_FS_TYPE_UNKNOWN = 0,
+    QEMU_FS_TYPE_TMPFS,
+    QEMU_FS_TYPE_HUGETLBFS,
+    QEMU_FS_TYPE_NUM,
+} QemuFsType;
 
 size_t qemu_fd_getpagesize(int fd);
+QemuFsType qemu_fd_getfs(int fd);
 
 /**
  * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5ed7d29183..ed14f9c64d 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -27,8 +27,36 @@
 
 #ifdef CONFIG_LINUX
 #include <sys/vfs.h>
+#include <linux/magic.h>
 #endif
 
+QemuFsType qemu_fd_getfs(int fd)
+{
+#ifdef CONFIG_LINUX
+    struct statfs fs;
+    int ret;
+
+    if (fd < 0) {
+        return QEMU_FS_TYPE_UNKNOWN;
+    }
+
+    do {
+        ret = fstatfs(fd, &fs);
+    } while (ret != 0 && errno == EINTR);
+
+    switch (fs.f_type) {
+    case TMPFS_MAGIC:
+        return QEMU_FS_TYPE_TMPFS;
+    case HUGETLBFS_MAGIC:
+        return QEMU_FS_TYPE_HUGETLBFS;
+    default:
+        return QEMU_FS_TYPE_UNKNOWN;
+    }
+#else
+    return QEMU_FS_TYPE_UNKNOWN;
+#endif
+}
+
 size_t qemu_fd_getpagesize(int fd)
 {
 #ifdef CONFIG_LINUX
-- 
2.39.1


