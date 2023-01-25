Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222EF67C00E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKoRm-0003Yx-Gp; Wed, 25 Jan 2023 17:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKoRT-0003XX-CG
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKoRR-0003Tg-I0
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674686428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iimrtv416Tui0eaaiJ1lQTqJA+PJbQ6QOvunbrxTfos=;
 b=PLHK7trOZueERxBZHrJADnxU2Xy6pe3/GI0TE7tOaQIk75NjmYfrEW6c4uwUAuck88TbRC
 esppCRWnWHEDEy/heYgnwaWG3d0DdtmUrTnmhP1u3GexORuehu4XN44WMBUUhR5uF91DaQ
 e1nlZD9a/T9xGPBcy+Z6xniLSRyxXZ8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-hXCEvk6iOZqVvf_ZWpWpmA-1; Wed, 25 Jan 2023 17:40:27 -0500
X-MC-Unique: hXCEvk6iOZqVvf_ZWpWpmA-1
Received: by mail-qv1-f72.google.com with SMTP id
 px22-20020a056214051600b00537657b0449so53585qvb.23
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 14:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iimrtv416Tui0eaaiJ1lQTqJA+PJbQ6QOvunbrxTfos=;
 b=JNG5Zd4HxhMfpB9M8UFKmq00LWdjxi+s+6y8NCrjer8pnuow/teDQW15QqMC2XgHgS
 2Zp1WM1OpTBK4xtTC4vwiR3nODLOrIlKmm39b4Mr+ElK+YTKzu8I1Epm1MCbAwnNa6bt
 GNcanNp9uL7Bxp9U1xqbj336cl17IEVm4cW8bztNhOx2fH4ShD7EcigzhUVCIrJXI0iJ
 cMWRlRMF4e0CrxJn/cj8nfot+lI2ROVOzOUKTrvxCDq2v+kqweSn87ZANcRM2Uf1K9Cj
 BfnqeFjw5E798CoReqfe/3mdiYwMa8BdArE1TzCAUQCYWZAcx1RXLz2oMu7svdDoB4JZ
 MNlQ==
X-Gm-Message-State: AFqh2kqyNVFJROgcjkyaxmAhw7r6u+k5HqjYlFHIjIJkXPE2rENcwLvZ
 wzOP+ocCr1T1Eyr9RzSEpdjdDYAafPO+q2OpXEBfvynh7efh7/m/xBTbse1GRojIzKJ6SVEVgwc
 Ik/51YPuLwMKGxvpYxNt35QrHZKbaK3d00WkhxnicX9qOSB4nfTWV5PmbkN7/S/l6
X-Received: by 2002:ac8:7248:0:b0:3b6:35cc:a5c1 with SMTP id
 l8-20020ac87248000000b003b635cca5c1mr46962439qtp.20.1674686425253; 
 Wed, 25 Jan 2023 14:40:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1XrnDlYma0lhV4x0mCp0KJzgQWFQZZ2pqZySHO5puWWH30MTlFAeEt+sp7uCKRm3o9TpBOA==
X-Received: by 2002:ac8:7248:0:b0:3b6:35cc:a5c1 with SMTP id
 l8-20020ac87248000000b003b635cca5c1mr46962407qtp.20.1674686424886; 
 Wed, 25 Jan 2023 14:40:24 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 z10-20020ac8430a000000b003b6325dfc4esm4133279qtm.67.2023.01.25.14.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 14:40:23 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 3/3] util/userfaultfd: Support /dev/userfaultfd
Date: Wed, 25 Jan 2023 17:40:16 -0500
Message-Id: <20230125224016.212529-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230125224016.212529-1-peterx@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
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
 util/userfaultfd.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

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
index 9845a2ec81..360ecf8084 100644
--- a/util/userfaultfd.c
+++ b/util/userfaultfd.c
@@ -18,10 +18,46 @@
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
+
+static uffd_open_mode open_mode;
+static int uffd_dev;
+
+static uffd_open_mode uffd_detect_open_mode(void)
+{
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
+    return open_mode;
+}
 
 int uffd_open(int flags)
 {
 #if defined(__linux__) && defined(__NR_userfaultfd)
+    if (uffd_detect_open_mode() == UFFD_USE_DEV_PATH) {
+        assert(uffd_dev >= 0);
+        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
+    }
+
     return syscall(__NR_userfaultfd, flags);
 #else
     return -EINVAL;
-- 
2.37.3


