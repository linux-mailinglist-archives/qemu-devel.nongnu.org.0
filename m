Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421E678F81
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKBE1-00071W-Ln; Mon, 23 Jan 2023 23:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBDl-0006W7-NK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBDj-00051R-HJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso12934430pjd.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKz8NM0/A8Hgswx+4MXKSDHppx0dxLxGzCKxbK2Z1F0=;
 b=De72z5h2GxsDFdpyccY0iODIcwTPuPeAlxB7vR3oI1OSBQ1qyeKJuYAm0vJOinCsT9
 NHVBiiqSYNGZQiqtzHbEzLIyYGEqa4nUbAbYtptT2YMzMsGEB/gM21y19Lms5aFeJKMH
 nXz9XG8UCkx9h4xalbRBlC4/+897GN+mLbMe1XNGX2BdOqpRc6xl+YVSJATEUyQFbrO3
 fU+M3dG+rimA0DmhtjWn66JQ/ozJFZJJMosCmSZ9srsZobbas2YJ4W+SptOHadPD06Vk
 8Mdu98sP0VACBVLp4jzz794KBWK4DrY0DovcpBLZi16qdofbNCe0D+GLaI5TducfOl9z
 Y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKz8NM0/A8Hgswx+4MXKSDHppx0dxLxGzCKxbK2Z1F0=;
 b=BUbi5oVG2HeyPL2GZIIfgNDbDQwC9o2AjHpivvTpMa2s7ae7BTVlrJD9GCuvfqpQiD
 se4c6QGVvGIDA4NJ3sDfJMrT3mI7hCTPJZp2HY3BBM5NqJIPXh9xrnb58qPJGMvti1MZ
 CO54PAmctXyExngAkrauBiu7flabMcmYQtJFy9oXI5w5AtxkKMK37RaDwHzu8h8F/O34
 2w0nlia1wgESyh1lZLEwNjlZ5s+Aw+DX4JXD28N5/fj2N7qA4TEsbsblr0XY6MOJOL7X
 DzWvltTUxH+j2a+Wb3lGDTvEYirXjIoSPWFfpREiVZrKYR+3V8LZAuKFX1C+1pRXOafr
 /UVg==
X-Gm-Message-State: AFqh2kq+Tv7DlG+H7rs2ueV5oNLudFIBVGTHIj2sFGiWgV2JuTSLKQjC
 VTw4n3eRLk9AVjbQtQzjkU92cw==
X-Google-Smtp-Source: AMrXdXt7qlhfEJQNv1unAAlw6DDRWVijqVVcY3fk+qFbGoODiaJv3T+1WGze4+xDCz/vs0E73use7Q==
X-Received: by 2002:a17:90a:c28e:b0:229:7ff9:6fd2 with SMTP id
 f14-20020a17090ac28e00b002297ff96fd2mr28947817pjt.27.1674535662470; 
 Mon, 23 Jan 2023 20:47:42 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a4d4600b00226f9c7474esm7324855pjh.54.2023.01.23.20.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:47:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 08/13] tests/qtest/e1000e-test: Fabricate ethernet header
Date: Tue, 24 Jan 2023 13:46:45 +0900
Message-Id: <20230124044650.14144-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124044650.14144-1-akihiko.odaki@daynix.com>
References: <20230124044650.14144-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

e1000e understands ethernet header so fabricate something convincing.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/e1000e-test.c   | 17 +++++++++++------
 tests/qtest/libqos/e1000e.h |  2 ++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index b63a4d3c91..98706355e3 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 #include "libqos/pci-pc.h"
+#include "net/eth.h"
 #include "qemu/sockets.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
@@ -35,9 +36,13 @@
 #include "libqos/e1000e.h"
 #include "hw/net/e1000_regs.h"
 
+static const struct eth_header test = {
+    .h_dest = E1000E_ADDRESS,
+    .h_source = E1000E_ADDRESS,
+};
+
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    static const char test[] = "TEST";
     struct e1000_tx_desc descr;
     char buffer[64];
     int ret;
@@ -45,7 +50,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
 
     /* Prepare test data buffer */
     uint64_t data = guest_alloc(alloc, sizeof(buffer));
-    memwrite(data, test, sizeof(test));
+    memwrite(data, &test, sizeof(test));
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -71,7 +76,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     g_assert_cmpint(ret, == , sizeof(recv_len));
     ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
     g_assert_cmpint(ret, ==, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
 
     /* Free test data buffer */
     guest_free(alloc, data);
@@ -81,14 +86,14 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 {
     union e1000_rx_desc_extended descr;
 
-    char test[] = "TEST";
+    struct eth_header test_iov = test;
     int len = htonl(sizeof(test));
     struct iovec iov[] = {
         {
             .iov_base = &len,
             .iov_len = sizeof(len),
         },{
-            .iov_base = test,
+            .iov_base = &test_iov,
             .iov_len = sizeof(test),
         },
     };
@@ -119,7 +124,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
 
     /* Free test data buffer */
     guest_free(alloc, data);
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 091ce139da..5e2b201aa7 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -25,6 +25,8 @@
 #define E1000E_RX0_MSG_ID           (0)
 #define E1000E_TX0_MSG_ID           (1)
 
+#define E1000E_ADDRESS { 0x52, 0x54, 0x00, 0x12, 0x34, 0x56 }
+
 typedef struct QE1000E QE1000E;
 typedef struct QE1000E_PCI QE1000E_PCI;
 
-- 
2.39.0


