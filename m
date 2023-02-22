Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F669F6D5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:42:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqJ6-0003iR-KE; Wed, 22 Feb 2023 09:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ4-0003gT-Df
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ2-00023u-Rz
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDwV9NVTQ9xnrAkZPIYEhW7epM/BGeF1PsDaqusl4Jc=;
 b=SQEN1blxuonTruvNFD1IsAn67HYz1bxpxhFbmSH8M30RrT6nNaY1+iyyuGXmDZnaFf0gbw
 0/2F92FIqcyEQzsICVmFuz7gkOCkSOxkHXy00klm9XdOIDh3OqSf+UrcK2w/ctnUVzblVY
 rxuB1VerdCQDBSeEFbk0VMg/KzddnsY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-r3O8sdX3PjmyzFN5pG0EZw-1; Wed, 22 Feb 2023 09:41:15 -0500
X-MC-Unique: r3O8sdX3PjmyzFN5pG0EZw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so10762909edc.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDwV9NVTQ9xnrAkZPIYEhW7epM/BGeF1PsDaqusl4Jc=;
 b=xhLNtH2lpBTXqnhAyR+w9BPPO0aaCtllASe3P0fqmEBSSGxv8qu15hBHYi+2J30xNW
 wAuBsXewYLVGEuERGo1wQMJK+rwBth0ZA0p1xBDQfXZep6tS94IVTCJlPLpdof6zPmks
 9SzOyDULoffV8ltwW3kULfdLzh81vYTE4P6rMe413AbJ/yoNprN6phzH0XF/KhmiAHX3
 3O+yeBBfBvBG7Wjd8OlBU9mCvHlreNUGPGV9M/OI1AdI7s9vhL0Yv+eQV2p76XZgzXcq
 mAo8TSz1avvza1jrFfE/r+xI7aV5mLkliZI+3CJwGzd5A8eieUZYRj+OId2MOJCYu+tN
 E5/g==
X-Gm-Message-State: AO0yUKW5uP5MNlhqtAtYZ8+5+RR7MoCGFsPEDEQ0ya0VkfzrsNh0DeVM
 H7OkXB1jCVz80UgPNKnVvIpSpYA8jHre4yurNN2gVKS38329C/xpZzoochaQTqd/zQZ3bu9e8RH
 uofti2MYhYNX0rGmfyq9BzNjfeiBvEMHhoWjBTivQ5/nAF6eJ0v3n1ycYTr7q84NMzbw2kJTH
X-Received: by 2002:a17:907:3f0d:b0:8ae:6b88:e52d with SMTP id
 hq13-20020a1709073f0d00b008ae6b88e52dmr14960914ejc.7.1677076872859; 
 Wed, 22 Feb 2023 06:41:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+qKsypQyiMrAUGQ1JQVcRQWLg8O48gWDpxTkCEowDvjbeXnb2Bs3Y8YoneM4P+FS5ohZjbnA==
X-Received: by 2002:a17:907:3f0d:b0:8ae:6b88:e52d with SMTP id
 hq13-20020a1709073f0d00b008ae6b88e52dmr14960877ejc.7.1677076872493; 
 Wed, 22 Feb 2023 06:41:12 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 dt23-20020a170906b79700b00889db195470sm8450907ejb.82.2023.02.22.06.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:41:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/4] thread-posix: add support for setting threads name on
 OpenBSD
Date: Wed, 22 Feb 2023 15:41:01 +0100
Message-Id: <20230222144103.467002-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222144103.467002-1-pbonzini@redhat.com>
References: <20230222144103.467002-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Brad Smith <brad@comstyle.com>

Make use of pthread_set_name_np() to be able to set the threads name
on OpenBSD.

Signed-off-by: Brad Smith <brad@comstyle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build              | 12 ++++++++++++
 util/qemu-thread-posix.c |  9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a76c85531250..86e8ff91093f 100644
--- a/meson.build
+++ b/meson.build
@@ -2133,6 +2133,18 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_pre
     pthread_create(&thread, 0, f, 0);
     return 0;
   }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_SET_NAME_NP', cc.links(gnu_source_prefix + '''
+  #include <pthread.h>
+  #include <pthread_np.h>
+
+  static void *f(void *p) { return NULL; }
+  int main(void)
+  {
+    pthread_t thread;
+    pthread_create(&thread, 0, f, 0);
+    pthread_set_name_np(thread, "QEMU");
+    return 0;
+  }''', dependencies: threads))
 config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
   #include <time.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index bae938c67084..412caa45efb7 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -18,6 +18,10 @@
 #include "qemu/tsan.h"
 #include "qemu/bitmap.h"
 
+#ifdef CONFIG_PTHREAD_SET_NAME_NP
+#include <pthread_np.h>
+#endif
+
 static bool name_threads;
 
 void qemu_thread_naming(bool enable)
@@ -25,7 +29,8 @@ void qemu_thread_naming(bool enable)
     name_threads = enable;
 
 #if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
-    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
+    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID && \
+    !defined CONFIG_PTHREAD_SET_NAME_NP
     /* This is a debugging option, not fatal */
     if (enable) {
         fprintf(stderr, "qemu: thread naming not supported on this host\n");
@@ -480,6 +485,8 @@ static void *qemu_thread_start(void *args)
         pthread_setname_np(pthread_self(), qemu_thread_args->name);
 # elif defined(CONFIG_PTHREAD_SETNAME_NP_WO_TID)
         pthread_setname_np(qemu_thread_args->name);
+# elif defined(CONFIG_PTHREAD_SET_NAME_NP)
+        pthread_set_name_np(pthread_self(), qemu_thread_args->name);
 # endif
     }
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
-- 
2.39.1


