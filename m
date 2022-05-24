Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00D532F08
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:32:27 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXSM-0008D7-HW
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWeu-0004N0-1X
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWes-0005Sd-E0
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso1646825wmh.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8ciTvhxSJt5x501FNvMsdfAL7fFfmd90rVjD5hpgVI=;
 b=pnh4bnwMq3JDzoRqE2IJXmUT/7GtBFMyslEiI8F7GdDjCx6WYAux77fAzvyrlHMkdQ
 ob8M5hFG51GattIqu80KX3muPBzArMp+O7sWBkChC6VBFBTne+H6ZZ2u1vyiK+YIIcLh
 zuPw5YnCrBYpphxiCy9Yo9zTJpk/rfrwU6EmzckYQFU1JR/4dTegm7qJ9+FWYK8CRHjL
 ODid1SvoSc6ioeNhSn0ZZNbKvTNUVUOsRw1tOTAnC+Vk/oDTeOX47YGFq5xSf/jqxG6Q
 BGmRKQoToYxqMhpZSDF39en6S9uYHX9WDXDu34jcf90a5qj8ju0h9aZYNVKAeNH/4FF5
 2PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8ciTvhxSJt5x501FNvMsdfAL7fFfmd90rVjD5hpgVI=;
 b=COFCF7TOizFIvK/MoWekTx/i+o21FdtzfitjeH+Yoy/02mG9jDM4wR60glp9QmPSX+
 iS1pDsr5xAS9PytYzQSgJlkoKjXOsgk0BuVzRI9gmSLUq5Dm/ierOlaajWySLBYiWxAV
 3szxZUfHmiIXTcbjnCd2dPvcUjjXW2sKy+eae83WTffS5sPDGn3H5Hd2Dwk2Ye3UCOW5
 6YAAdpes/4Q6kVchLjoBR1C3CcINb9QRt9yOG+Kmed3fATJUAh4iL/AOaxf++3bWeVTx
 3Myb/wAtuZrGJS3oVTOFHvxxunbXO0i8nJC6C/aofAUsdHmfQxRtY3nutO9Ftom9mT1S
 oyZg==
X-Gm-Message-State: AOAM530AGYNi5RdhROHmwfU5SihLb2O0QzwIxDG05sYWEdqU1pZ3z56G
 wjbhDZya+fXREKj9gtFfNTh4EA==
X-Google-Smtp-Source: ABdhPJwe5h7Suru64uBPrKRstOPklloeCH1KhWkBnWuDOLG5NESRnEekW0CNUtKiDhVs2iQlXtpE2w==
X-Received: by 2002:a05:600c:384c:b0:397:404a:3ccd with SMTP id
 s12-20020a05600c384c00b00397404a3ccdmr4347076wmr.114.1653406877086; 
 Tue, 24 May 2022 08:41:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h25-20020adfaa99000000b0020fe61acd09sm4890040wrc.12.2022.05.24.08.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3145F1FFC1;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 09/15] tests/qtest: use qos_printf instead of g_test_message
Date: Tue, 24 May 2022 16:40:50 +0100
Message-Id: <20220524154056.2896913-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
index 46623da731..fef2471f8f 100644
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
index a2cec87684..90749c147e 100644
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


