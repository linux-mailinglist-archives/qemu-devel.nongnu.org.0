Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877E587A98
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:23:00 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIp3D-0001Z0-13
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXt-0001dk-7H
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXr-0002WT-HC
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id p10so12959300wru.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OHhq73fm8+f50i3SsK6KIm2w+P/uTjdSWyXaYAVfPmw=;
 b=d2PFGlNHyilP1qGhXUsSePE+kWq8KxNU9JRna/aRj95f5cBn7o/vWAxD9pWkIhl+gt
 b/mBbx4oVfTS0I5g0Xhv2VGBd9Af3/EBB0kPwSKnFhqsYof+x8GADDNQwtkvfRO+lRJx
 lVNNBiZbTwuqyNCuVmf/bsJI1WmzOaiW0bmYUjoFXU6k51JJboQbzb94SvSir05y9ce9
 fdjwoK8I1uj2XQSWpYriY49Le3/LZ4DpXL56e71YusR+K9sGB7LOS4sG8zyn+tLnn8QL
 2kjfjEbILCag/1yFxLZZEJskaxD/RhsSvYGL3Ab6jTHtNF7wCAU70NI+vCJyrugSRPNd
 ITWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OHhq73fm8+f50i3SsK6KIm2w+P/uTjdSWyXaYAVfPmw=;
 b=SdfzbcBH4UWK0NcMemKnkEN2g+MIcTaucQ/Vfbwrb1Si6vBCuTLuI0Lt4S+qkbQNt0
 I9AAe959Q69VDih3znGOzXImhr9f0zAKJ0xeC03HIGKRU6h3nwcAH1xXPIgAg6pl+YFQ
 DXA92OQjiJw61GKvu8KIzbJr5ZfxVSsZWZvTHpqJHb2gAWjM4egGO7vFZwY/ZsCvAiAW
 H+kVKBOGfSmZGiUKgOfbdPPr+AsM9XKf0UVXcakY+pRynjGKL6aWDgyJsMnECwYv3Ig4
 QuDXhVTrTyUHrOsfcsCQHL0NKs/EDHWPUHNA8OBMf3u1wljlRPMUX2WMdKMVmql2ll0i
 P4hQ==
X-Gm-Message-State: ACgBeo1pF/omufxgrCjJWmDni6NVCAyulGCFcJM0i7j/GlU4D7iY46ly
 7F2/vHkwNkzaR27I/cnKrHEzMw==
X-Google-Smtp-Source: AA6agR7zYn7z2qUh4757aPAoIbaVe8OpTnO49J/BLd8uP/ylrTLql2lRr9tv819CudKgHDCjjJTS0g==
X-Received: by 2002:a5d:64a3:0:b0:21d:ad9e:afd7 with SMTP id
 m3-20020a5d64a3000000b0021dad9eafd7mr12280767wrp.524.1659433834170; 
 Tue, 02 Aug 2022 02:50:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c2e5100b003a3186fa559sm17081020wmf.29.2022.08.02.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 225CB1FFC8;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 16/22] tests/qtest: use qos_printf instead of g_test_message
Date: Tue,  2 Aug 2022 10:50:04 +0100
Message-Id: <20220802095010.3330793-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
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
index d958ef4be3..b30bbb30f7 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -321,6 +321,11 @@ static void walk_path(QOSGraphNode *orig_path, int len)
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


