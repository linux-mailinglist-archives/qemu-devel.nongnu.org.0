Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DC68E25E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPV1q-0004Xb-1t; Tue, 07 Feb 2023 15:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPV1m-0004Wu-VO
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:57:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPV1l-00088d-HN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675803441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cw+FX4yFxWwJG65wfdR80F0s3/NDMRCnt1RRDz1Yisw=;
 b=ChNqCjQ5zo6lldFihTWYodCWD9PmoG6O5cFF0W6kPN8DEL/tpSKusvdasaMuu0V+YcRm4/
 NI3KyoxsXoWgNk4hRy9rSRJhuLgPk6U0D0pDJWX3iUQ7y0sypZxGUMibis2qCkdauK58k/
 krjMa30kIv2w3EfiNvcVSRrp5CEaMnc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-Npw1xAaqMg6QcLex5VwbTg-1; Tue, 07 Feb 2023 15:57:20 -0500
X-MC-Unique: Npw1xAaqMg6QcLex5VwbTg-1
Received: by mail-qk1-f198.google.com with SMTP id
 u10-20020a05620a0c4a00b00705e77d6207so10478026qki.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cw+FX4yFxWwJG65wfdR80F0s3/NDMRCnt1RRDz1Yisw=;
 b=wN8bErJSuDCgWFTVJlK9m8fczKkQdqKBWR53EEnLoN8iCTUBpTR7NjD5l+zpWsIlaO
 VrjGR3E7yUdcJS62e0J3c4ysDSRMS7uWVDnNu1fIR8yRxLBTJjGORHgTENgwY/5MexDL
 389StcJk4jw/oXC2MJnihn7S6GFE0uWdz2gcC/paDmex/K8q7blvIyfcp/6Bbuv8Epdr
 IzAvUdc2WNHLB6fflhJcYJ6FAK0NG3Lgx1m5wuzqL1rBYs4hJMxHkf+K0bnhRRmvzNR1
 h3vaK+61BSniWUee4Oa4KlNhQ8oLfBPtpLrI5uCGu+5sjgFmHZp0iEj2t19lgsykJLzo
 UXnQ==
X-Gm-Message-State: AO0yUKVOGtjcuoWNrucxSzwNSo3skIF/dnedvZwjlVXTOW8WRsDnCQN/
 tYlbK59FmFplqd7j//eskr1Xjjag0dTAvI+SMb6t6LvulhnNCYKkwJy+0zgwbjLTGwF//YdyYxk
 WGUygcESLxrv1ALdRsCUl7LXRBFuX76z44pFjkSUHLd1CdA8AEXpDDolBfqQ6Pfz0ZF/70g==
X-Received: by 2002:ac8:7f4a:0:b0:3b9:b801:8744 with SMTP id
 g10-20020ac87f4a000000b003b9b8018744mr9935883qtk.4.1675803438799; 
 Tue, 07 Feb 2023 12:57:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8QJ5km9YjlovYVXxfaFu/gIrf92fyj9iiP+8SQ3zR+il2Sa0eo/rnq+x6c5fgFBYjuYdB76g==
X-Received: by 2002:ac8:7f4a:0:b0:3b9:b801:8744 with SMTP id
 g10-20020ac87f4a000000b003b9b8018744mr9935851qtk.4.1675803438504; 
 Tue, 07 Feb 2023 12:57:18 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a05620a0f9800b0071ba3799334sm10113731qkn.58.2023.02.07.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:57:16 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 2/2] util/userfaultfd: Support /dev/userfaultfd
Date: Tue,  7 Feb 2023 15:57:11 -0500
Message-Id: <20230207205711.1187216-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230207205711.1187216-1-peterx@redhat.com>
References: <20230207205711.1187216-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
system call if either it's not there or doesn't have enough permission.

Firstly, as long as the app has permission to access /dev/userfaultfd, it
always have the ability to trap kernel faults which QEMU mostly wants.
Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
forbidden, so it can be the major way to use postcopy in a restricted
environment with strict seccomp setup.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 util/trace-events  |  1 +
 util/userfaultfd.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

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
-- 
2.37.3


