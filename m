Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580D42BB48
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:16:05 +0200 (CEST)
Received: from localhost ([::1]:34308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaMm-0002gx-Bk
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEc-0002Bw-27
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:38 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEZ-0005ct-8M
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:36 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g10so7368041edj.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEqa38VkLdIJcTdcKrh0XIzK4SvxOQGWMtjVV5oHctU=;
 b=pZaUE7sGgdnzlctV2mAKWva5Am5xIl55cxClAGRTP/vaA3GcF//HwAZGplUhnyQCKH
 Bzd/6SnZqBB5FTyK4+y4qBFOrxxR5AxdKnvbSj29vt4odgLnNBfZeFh3ZAG3/yGIwrMr
 x7fdefAa8V/+uz8KfDBWLoS/YDLWZGpUAPBgsTknMpKYerZitOebtyf6kRev0QyYVqG2
 zCQrFZSg6fPW/lBmQkG294fyWfyodOx7usOs5uTxbQjTaajkrTzIKvXPTyoaU87l8D9S
 Em3rGuwdPt6NH6O8LcTsFCRPMrYavb8Aibp/MahLJecJEdrA5DyfNAWepzEhp/ecdK8p
 E/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AEqa38VkLdIJcTdcKrh0XIzK4SvxOQGWMtjVV5oHctU=;
 b=FtXqzNYG73cZjvG6h5kRNPUiNYwvmFMHWiBrzQpJEL7z2sKpT0Zae9mHldBzgdCBiZ
 nLpSTNW+CWo1cM2OFqADOFMvP9bS4Z8rMHhE7app43vGSSFkas7z8LXdI5apuOgi2pa3
 E0ygY2D/fP6NV7CX/vcXKRZEJRaqgQdFSb8vu49dBBvWSdKU+duDoy19gJvK14Wgs67b
 R+LMqtAtC86t4rC9qBZH5Y4gV5AopzbyoWa59p0e3TPetCIP0+mKiVW4Ug9w713UUT+r
 YJqtSDdYSwEe3BkHyBfyv9KEGLRILK5DBkC1uirOxyNc3d9uqyeyPQADLxIE6pqNa/s7
 F3BA==
X-Gm-Message-State: AOAM530qa7y6abcf+QLkt4ItdaTBQxDXj2Ie6FeZU4kDf+bQlSJxa/By
 b3GQM9r2AngGVRscwIyzPJ7vNQPB65A=
X-Google-Smtp-Source: ABdhPJw8iR1pZHS4U1faeeqhM0VYR9sYwEGZlrjk0vpFhc0B88txUUo3As7by6sUMuZVOScdZK5hdg==
X-Received: by 2002:a05:6402:11d4:: with SMTP id
 j20mr7703153edw.267.1634116053526; 
 Wed, 13 Oct 2021 02:07:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/40] util/compatfd.c: use libc signalfd wrapper instead of
 raw syscall
Date: Wed, 13 Oct 2021 11:06:53 +0200
Message-Id: <20211013090728.309365-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Kacper=20S=C5=82omi=C5=84ski?= <kacper.slominski72@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kacper Słomiński <kacper.slominski72@gmail.com>

This allows the use of native signalfd instead of the sigtimedwait
based emulation on systems other than Linux.

Signed-off-by: Kacper Słomiński <kacper.slominski72@gmail.com>
Message-Id: <20210905011621.200785-1-kacper.slominski72@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build     | 7 +++----
 util/compatfd.c | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 99a0a3e689..2d373a61a6 100644
--- a/meson.build
+++ b/meson.build
@@ -1420,10 +1420,9 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <stddef.h>
   int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
 config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
-  #include <unistd.h>
-  #include <sys/syscall.h>
-  #include <signal.h>
-  int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }'''))
+  #include <sys/signalfd.h>
+  #include <stddef.h>
+  int main(void) { return signalfd(-1, NULL, SFD_CLOEXEC); }'''))
 config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   #include <fcntl.h>
diff --git a/util/compatfd.c b/util/compatfd.c
index a8ec525c6c..ab810c42a9 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -17,7 +17,7 @@
 #include "qemu/thread.h"
 
 #if defined(CONFIG_SIGNALFD)
-#include <sys/syscall.h>
+#include <sys/signalfd.h>
 #endif
 
 struct sigfd_compat_info {
@@ -96,9 +96,8 @@ int qemu_signalfd(const sigset_t *mask)
 #if defined(CONFIG_SIGNALFD)
     int ret;
 
-    ret = syscall(SYS_signalfd, -1, mask, _NSIG / 8);
+    ret = signalfd(-1, mask, SFD_CLOEXEC);
     if (ret != -1) {
-        qemu_set_cloexec(ret);
         return ret;
     }
 #endif
-- 
2.31.1



