Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B9693C9F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwr-0002B3-3I; Sun, 12 Feb 2023 21:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwo-0002AB-LH
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwn-0006tK-0C
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OmubI2NEZicuPkXPyraesqovkN5V1ARkv7LLLCRMM0=;
 b=gwRHgQVYvI36i9JLLiGBuEtwr/G4f2UoqpFHbia4R+ixl0y3hlftgVNuxSEGt5O0Dv6Isd
 gXDvkgvZ3f8k9L9vxqjZgn++WvJyzNQ8ZaN3C/jrLJximOxMNJ0En6PhHmDRf/qbzdfkhX
 taoGynuSMqrOx4PDjr1JZXeVYfLl0d0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-NxLEf6pfNGW0kAS5OZu16g-1; Sun, 12 Feb 2023 21:52:02 -0500
X-MC-Unique: NxLEf6pfNGW0kAS5OZu16g-1
Received: by mail-wm1-f72.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso8388323wmp.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OmubI2NEZicuPkXPyraesqovkN5V1ARkv7LLLCRMM0=;
 b=mjztFUnxPeAnOksN2pZys8ceBY0wgPjR/anV6b3znoxVJFVuQzk3HzdROeSXTnXLmZ
 vVDygGdunM00/ovKaxj2IZypwdGHteQeT63MYZEe+WWmpuDA8cuRCN7JDuU0qkamkg50
 gREBdVkOoVap9uVmY+kySfM6I1Z2SUqRV4KGUhkH2Ae5WeoqgTWJMKPjvgdaK4m88bjK
 gfXptzlMqNsGM9hv8xj6cqM+C5Ue7WS9TC7s98UvDlPGNFAX500Mj8zXwViHG0lWu+o6
 m+/N2Db383k5kOl1CNVVXCy0+wDqPZiNfL9U45dThuFfSeSCByeQglietpnqvNo0uUoh
 b1PQ==
X-Gm-Message-State: AO0yUKUkEZ9mMwQLIbhjdl2lSs1ttlpEPc/QcwTeS3cO2urOxK+qkkqR
 CItVoGVD1htSnhQnbDo/K8cCd9Oum0r5W5W+t+yrXZ1I/zej0LHZsLaF/SOvQbzPAYBwFkOyyCI
 LNCs0bfC0i5BXZyIId5Nm3XQitkwcsF8jx8TwH2j+QSXVnFGZ9PtSRd9Sj9o1TbbvU34yRSYt
X-Received: by 2002:a5d:44c6:0:b0:2c3:f534:67b3 with SMTP id
 z6-20020a5d44c6000000b002c3f53467b3mr19781953wrr.23.1676256720889; 
 Sun, 12 Feb 2023 18:52:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+XmQP6yyfclPif2uPQymsWwytLhMOk9we0ppZUPzNyug7vHOwAYOJ+MojLyInFZJ8Zw4XLpw==
X-Received: by 2002:a5d:44c6:0:b0:2c3:f534:67b3 with SMTP id
 z6-20020a5d44c6000000b002c3f53467b3mr19781939wrr.23.1676256720657; 
 Sun, 12 Feb 2023 18:52:00 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5d6589000000b002c559405a1csm1103706wru.20.2023.02.12.18.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:51:59 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 05/22] util/userfaultfd: Support /dev/userfaultfd
Date: Mon, 13 Feb 2023 03:51:33 +0100
Message-Id: <20230213025150.71537-6-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
system call if either it's not there or doesn't have enough permission.

Firstly, as long as the app has permission to access /dev/userfaultfd, it
always have the ability to trap kernel faults which QEMU mostly wants.
Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
forbidden, so it can be the major way to use postcopy in a restricted
environment with strict seccomp setup.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 util/userfaultfd.c | 32 ++++++++++++++++++++++++++++++++
 util/trace-events  |  1 +
 2 files changed, 33 insertions(+)

diff --git a/util/userfaultfd.c b/util/userfaultfd.c
index 4953b3137d..fdff4867e8 100644
--- a/util/userfaultfd.c
+++ b/util/userfaultfd.c
@@ -18,10 +18,42 @@
 #include <poll.h>
 #include <sys/syscall.h>
 #include <sys/ioctl.h>
+#include <fcntl.h>
+
+typedef enum {
+    UFFD_UNINITIALIZED = 0,
+    UFFD_USE_DEV_PATH,
+    UFFD_USE_SYSCALL,
+} uffd_open_mode;
 
 int uffd_open(int flags)
 {
 #if defined(__NR_userfaultfd)
+    static uffd_open_mode open_mode;
+    static int uffd_dev;
+
+    /* Detect how to generate uffd desc when run the 1st time */
+    if (open_mode == UFFD_UNINITIALIZED) {
+        /*
+         * Make /dev/userfaultfd the default approach because it has better
+         * permission controls, meanwhile allows kernel faults without any
+         * privilege requirement (e.g. SYS_CAP_PTRACE).
+         */
+        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
+        if (uffd_dev >= 0) {
+            open_mode = UFFD_USE_DEV_PATH;
+        } else {
+            /* Fallback to the system call */
+            open_mode = UFFD_USE_SYSCALL;
+        }
+        trace_uffd_detect_open_mode(open_mode);
+    }
+
+    if (open_mode == UFFD_USE_DEV_PATH) {
+        assert(uffd_dev >= 0);
+        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
+    }
+
     return syscall(__NR_userfaultfd, flags);
 #else
     return -EINVAL;
diff --git a/util/trace-events b/util/trace-events
index c8f53d7d9f..16f78d8fe5 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
 qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
 
 #userfaultfd.c
+uffd_detect_open_mode(int mode) "%d"
 uffd_query_features_nosys(int err) "errno: %i"
 uffd_query_features_api_failed(int err) "errno: %i"
 uffd_create_fd_nosys(int err) "errno: %i"
-- 
2.39.1


