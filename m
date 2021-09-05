Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B592400FD1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 15:11:49 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMrw3-0001d0-0w
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 09:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kacper.slominski72@gmail.com>)
 id 1mMgnq-0006PA-MR
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 21:18:34 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kacper.slominski72@gmail.com>)
 id 1mMgnn-0000sR-FP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 21:18:34 -0400
Received: by mail-lf1-x12f.google.com with SMTP id k13so6141093lfv.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ee+EgfRy3iZCySKs9MfTFWgNmeXLkC/aDuiEn3H3Uc=;
 b=mq3VLxYebAhxa2jyudmdN7mfmnLu4MYfvne9ioeZILM8Ony+f8P25EuNkF4v1Sq75q
 on9ntW+qnv0aRiT8wvr8e/lpsadnzVcDm1/nA0LrPBpqFLQT3kcfbwlLfn2rec7gpvNv
 TVTvP5b8PnrwFQ01fFMiAhXDnkY8Sw1JMBVHT1k5+TSOKcvfOlqBE7e77qEPdeAO6r3G
 9fDK80TGI01LxGj3u4fTipgruuiohbOdC2jOwHdrBxwZjIFE1nQxNU7F4rfYcvNtrige
 in9BBj3jh6b7uS5Mdcu7Po4/YM9nXFzUGDkni08MI+/ONPQJVtIEzV95G5BbsJMMjXxx
 yVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ee+EgfRy3iZCySKs9MfTFWgNmeXLkC/aDuiEn3H3Uc=;
 b=IkIGa7g8TUWLwtatGFoQ3udi0mucLwJp6LA7MUX3XbVLfy2JOPP77KjangNrC8Z+gI
 uuOcHMQXYORP3ZGwgxNPO/luoX1XQhKIsn4CG+6T7sD8fGlivTJiw+njVqA01zdR9tqZ
 46drgDCBPtMFvjZzyqo24wRPngxdYk82juiiWvb8MceqS57En+ncR+Vo2C2i7+Zhk2gw
 L5dzdDTqkJgRClXZDP0fubIfFvdko/MXGfBzQZg9aTsvAJL9J2+D847YPMiH78bFMxWg
 Zt8zZOFvatyX6mwZwnDncdfXJz0s3fUJpk1PkjD9u+JcEj2nD281L9SlhV+pm9s6es8t
 /B+w==
X-Gm-Message-State: AOAM532L5AlYCODzVFX2gRbJs+Lfp8IFXkATGvrsLSfY/f7DuocE5JuC
 pgyRpLRRRSb1eugJKv3ZOUG84GRtG3Zitg==
X-Google-Smtp-Source: ABdhPJzVt7LpkpQCM/AoHbPTAEBuOkB+bZzNYXZ0p56LrieqmbQQZqVtPT/rITgQslrsLSLktZEtNQ==
X-Received: by 2002:a05:6512:3e22:: with SMTP id
 i34mr4984880lfv.374.1630804708889; 
 Sat, 04 Sep 2021 18:18:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a31c:a041:2580:752e:ec59:7d79:2681])
 by smtp.gmail.com with ESMTPSA id j17sm368201lfe.55.2021.09.04.18.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 18:18:28 -0700 (PDT)
From: =?UTF-8?q?Kacper=20S=C5=82omi=C5=84ski?= <kacper.slominski72@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] util/compatfd.c: use libc signalfd wrapper instead of raw
 syscall
Date: Sun,  5 Sep 2021 03:16:22 +0200
Message-Id: <20210905011621.200785-1-kacper.slominski72@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=kacper.slominski72@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Sep 2021 09:10:30 -0400
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Kacper=20S=C5=82omi=C5=84ski?= <kacper.slominski72@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the use of native signalfd instead of the sigtimedwait
based emulation on systems other than Linux.

Signed-off-by: Kacper Słomiński <kacper.slominski72@gmail.com>
---
Apologies if I CC'd the wrong maintaineers, it's my first time
submitting patches to QEMU. According to get_maintainers.pl this
file has no maintainers, and the only system supported upstream
that supports signalfd natively is Linux.

Glibc has had the signalfd wrapper since version 2.8 (2008), and
musl has had it since at least version 0.5.0 (2011), and as such
I think using syscall directly is not necessary here.

Found this while porting QEMU to Managarm
(https://github.com/managarm/managarm).

 meson.build     | 7 +++----
 util/compatfd.c | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index bf63784812..bcdfea5492 100644
--- a/meson.build
+++ b/meson.build
@@ -1415,10 +1415,9 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
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
2.33.0


