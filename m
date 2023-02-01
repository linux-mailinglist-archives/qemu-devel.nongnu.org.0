Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBA68705D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:12:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKNu-00077h-JU; Wed, 01 Feb 2023 16:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNs-00077T-JM
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNq-0003MS-Lc
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwX6daCXY7REmaoACPNUmVVDKJxtfUrHZB8wxWOFAo0=;
 b=PNDdrHIgL4XAgstbNhRxGqWU29GDcF4g/AXKlucUxZFnNp2B7HNCbI+0cFfGEKhWPB/5lB
 ujUF3BcpoGPTFb1gxlQuvyfzyWZaFaTqrW0IAwmPkYWPcDh68OagBVes+R8FJWM0G5kQqv
 ez6Nn7RL3esuf3CjKikItaYbkJDoI98=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-yZ3ykgMcOve0kY3092aYXA-1; Wed, 01 Feb 2023 16:11:08 -0500
X-MC-Unique: yZ3ykgMcOve0kY3092aYXA-1
Received: by mail-qk1-f199.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so80200qkg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 13:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwX6daCXY7REmaoACPNUmVVDKJxtfUrHZB8wxWOFAo0=;
 b=M6liVxhQTI62FUPcrLfWbCDnnOJ3rp0LajDW3fvjYcB9Nvul6jAqUzadei4RHDOUkU
 vxFeBqDRbtzZsu+IEdfJBQgOUwmj/0bEhKDE76SRCsH8m62e+N/vcMmEt587A213SKc+
 g6ROVfQA+y+/H6CRCviwzeEnnZ3G0juvb0/AbrwmtTAl2Gval9mDmJP2cIdLp1LgqyUx
 pFdqERWBmD25F5gRtb0EvMVSLUDErNqFoE7n4L0kZFqSE1Sz2xKn8e4tE+GdA3bw+xe/
 uVrV0Rwlix6cQ6xo1HZptAO9TIX7aLc4OE5uxpSVhSJFOM4oeTZax6aAVpC3k3w5AFXz
 bgeA==
X-Gm-Message-State: AO0yUKUUifwYAAk8jmyJQWXXz/8XusXl2d+6OW/AwhVIuqriTPZIXYIO
 XVPGyvIFza08Jhhr+aoQGdegeTZmhtO3/tIhlcOrFg3mzdIeFN+6UMPtmftLvRO/WmDyAXRmx6q
 1kN6x/bMizawgXzPZhtWgLHIJsq3TpdADgrxl+XR8MIYVIdKY0cKosTAXk9gqj7Wb
X-Received: by 2002:ac8:6f11:0:b0:3b6:8ece:cab9 with SMTP id
 bs17-20020ac86f11000000b003b68ececab9mr7034083qtb.2.1675285867363; 
 Wed, 01 Feb 2023 13:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9WFWCNPBxs2f+iVt2uXDYdbjo+hkMm2DPuw9MZpI6EaQ2C8d1n2P5cA0KrW1NCv56/sC+PiA==
X-Received: by 2002:ac8:6f11:0:b0:3b6:8ece:cab9 with SMTP id
 bs17-20020ac86f11000000b003b68ececab9mr7034044qtb.2.1675285867026; 
 Wed, 01 Feb 2023 13:11:07 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 ea17-20020a05620a489100b007204305dee4sm6331403qkb.19.2023.02.01.13.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 13:11:05 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peterx@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
Date: Wed,  1 Feb 2023 16:10:55 -0500
Message-Id: <20230201211055.649442-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230201211055.649442-1-peterx@redhat.com>
References: <20230201211055.649442-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 util/trace-events  |  1 +
 util/userfaultfd.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index 9845a2ec81..7dceab51d6 100644
--- a/util/userfaultfd.c
+++ b/util/userfaultfd.c
@@ -18,10 +18,47 @@
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
+static int uffd_dev;
+
+static uffd_open_mode uffd_detect_open_mode(void)
+{
+    static uffd_open_mode open_mode;
+
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


