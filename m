Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C5581A49
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:26:15 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQC6-0000em-5j
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8C-0003LR-DN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8A-0002OI-9Z
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id bn9so10575923wrb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgdjLK+rHmGYzX+axfdcXU3cC80ktttNYMslWS8NxWI=;
 b=bxqWqE5cdTZyQNhToMXoxCgKMRyOYgZEl/xoUkm3uBAbqW1J3E3JcxNGIFFCYcik8R
 v1an9MAOYZ+Py5I3CKXRsjGiorpPEd8/6MsNlXctQ3PkSEF/CNepV6nRBQDE+CfaL9kz
 AUQ++dbXJoMY8clgcu/WNQvdMrVqakcmMWlpRTo/CA8CCP6j9ihRLX0nTvgzUEEDnnfL
 L1x5g8fBiotXQxH/sXDG1CRofmRLH2o5tkcE8KVDyD965oFnGXvCZ/W0hsVZQBI2ac4b
 bI3FLNUGDL/DxTpbFmrjzVBZZqYQ1X26LnR4R00mQwvbj6nvEgN0zoleH2FFlSj1nI/t
 M2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgdjLK+rHmGYzX+axfdcXU3cC80ktttNYMslWS8NxWI=;
 b=RVigpPd0v0Xxi7yj3HlbIdibeDLLjcxGja8EIodUa9yOGtcgWnVHU7sEkzUpNLUECg
 1DTqdgUZbrFOztmQZLvQGIq+dC8iB3fCDwrzzhGQm1FNBG8r2IW/rrmUvLP1vyVVUd5P
 RXyj68cGdY2LILVtL+7MzeDiVv4L3N5DTL4kldDX/KtmcJBMt2IQmx1W/xj7M1R6y/O1
 vYr8XteUTP5XRUvrlyvYHMbiyW3DVRjDVpQV6kwK4YYqHefxoI0EcOdBRO65KwpPQgyr
 uQbWWSzDlwFhFHdR7BzECI1bZAgl3quXAhDq0ZTgd049AmL2dMd1VkjH9oiVfNWM6Vax
 ujzw==
X-Gm-Message-State: AJIora9Byg8cb7jxinwofLhpGBopL7HwS3QFAr3krompXdlN46Ihx6cf
 yrklziDpHEkei+AG4ECCymhdqA==
X-Google-Smtp-Source: AGRyM1tCxn4NvieKVmhr1NrJdwHDx9kyJ3juDJ2rxFRZZ7anLDB7SC54Qjzgv0ia5sxTjgtTz6/ukg==
X-Received: by 2002:a5d:588d:0:b0:21d:a5d2:42d5 with SMTP id
 n13-20020a5d588d000000b0021da5d242d5mr11559128wrf.588.1658863328911; 
 Tue, 26 Jul 2022 12:22:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm15502588wrm.28.2022.07.26.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 919121FFC7;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 15/21] tests/qtest: use qos_printf instead of g_test_message
Date: Tue, 26 Jul 2022 20:21:44 +0100
Message-Id: <20220726192150.2435175-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user tests respawn qos-test as a standalone process. As a
result the gtester framework squashes all messages coming out of it
which make it hard to debug. As the test does not care about asserting
certain messages just convert the tests to use the direct qos_printf.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/qos-test.c        |  5 +++++
 tests/qtest/vhost-user-test.c | 13 +++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index ac23def284..d0bdf06fad 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -320,6 +320,11 @@ static void walk_path(QOSGraphNode *orig_path, int len)
 int main(int argc, char **argv, char** envp)
 {
     g_test_init(&argc, &argv, NULL);
+
+    if (g_test_subprocess()) {
+        qos_printf("qos_test running single test in subprocess\n");
+    }
+
     if (g_test_verbose()) {
         qos_printf("ENVIRONMENT VARIABLES: {\n");
         for (char **env = envp; *env != 0; env++) {
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 8bf390be20..968113d591 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -26,6 +26,7 @@
 #include "libqos/virtio-pci.h"
 
 #include "libqos/malloc-pc.h"
+#include "libqos/qgraph_internal.h"
 #include "hw/virtio/virtio-net.h"
 
 #include "standard-headers/linux/vhost_types.h"
@@ -316,7 +317,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
     }
 
     if (size != VHOST_USER_HDR_SIZE) {
-        g_test_message("Wrong message size received %d", size);
+        qos_printf("%s: Wrong message size received %d\n", __func__, size);
         return;
     }
 
@@ -327,8 +328,8 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         p += VHOST_USER_HDR_SIZE;
         size = qemu_chr_fe_read_all(chr, p, msg.size);
         if (size != msg.size) {
-            g_test_message("Wrong message size received %d != %d",
-                           size, msg.size);
+            qos_printf("%s: Wrong message size received %d != %d\n",
+                       __func__, size, msg.size);
             return;
         }
     }
@@ -450,7 +451,7 @@ static const char *init_hugepagefs(void)
     }
 
     if (access(path, R_OK | W_OK | X_OK)) {
-        g_test_message("access on path (%s): %s", path, strerror(errno));
+        qos_printf("access on path (%s): %s", path, strerror(errno));
         g_test_fail();
         return NULL;
     }
@@ -460,13 +461,13 @@ static const char *init_hugepagefs(void)
     } while (ret != 0 && errno == EINTR);
 
     if (ret != 0) {
-        g_test_message("statfs on path (%s): %s", path, strerror(errno));
+        qos_printf("statfs on path (%s): %s", path, strerror(errno));
         g_test_fail();
         return NULL;
     }
 
     if (fs.f_type != HUGETLBFS_MAGIC) {
-        g_test_message("Warning: path not on HugeTLBFS: %s", path);
+        qos_printf("Warning: path not on HugeTLBFS: %s", path);
         g_test_fail();
         return NULL;
     }
-- 
2.30.2


