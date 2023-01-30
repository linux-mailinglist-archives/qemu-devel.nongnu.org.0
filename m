Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9268111E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUqc-0002WN-0a; Mon, 30 Jan 2023 09:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqZ-0002T3-9d
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqX-0007pI-CA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:23 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o13so11203698pjg.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goNZXi+496BZC1ZhDc/tL5bYnDtq6XrKLbKXyYyq31k=;
 b=7vjgPi91tN8SRIiH9G5c/N8HTMLP7443tt+5yjQ+ksf6aaM087PZS/y1ad4XXMtAjY
 rJR0r3DfH0vDYuXvxzw2+8VCpUr0rfI0gWX37gJRDTjM4M9ZjLFNwouTcOhgGaB/c7Et
 a+0PlJ3USg2FGriIiAUegrPb1Bj5u8hObjjadfZ1FV+IOSFmZiKhvLBggRLiLDCUA8Du
 vSulq+lBSZlCzuxk9ul4XbfmIjHzkJcwB0ZPhuioMp7/nkOIoXgQfhrUUsySBg7OQbxm
 rHVRNQ7J55o7bgtxLTwJFp8kJakpTs+J77sxKpDIwXGqklOoDKGbG2KhECuq2lLKIvj8
 YZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goNZXi+496BZC1ZhDc/tL5bYnDtq6XrKLbKXyYyq31k=;
 b=VqASWK6J8mZ0Oq/WiKAxrcr1tslJnMkzcgdNbcXj612e2e6o/TBnFXnkeqZolMU+SW
 tuVu+Zr0h3nF7UMkYk1crkDTj393HOOJTG56oGdLe6ghtH87pZ/vaUPw6eLcOoArNd6Q
 A8NRKmQR+0KKn2aLZO0qtqIYbVzq1Wu9bwdHZxqB+R9LwDFu2EWrXJvSLRwTPGSyMjme
 cYY842HbVVhoovkWBdEQhgIOtIVHhAZt8x+TmEfiUe0ahJR9HBzyUdwRvAwNSdNzcLNI
 e0RMuDNLpbJ3z08pqaNZb4ahK8nwHmPhcQqv1YvNjP+eyJ/4qqIJ8LC8wfQNhiCWLWSU
 pO5Q==
X-Gm-Message-State: AFqh2kqSk7LwgzfESTXZXTwrRrmbNHlVIf6jscQtPqiU+on1ZtCkw+DG
 Mf6dzRgGcJlX5UiAYgcd/WPzrA==
X-Google-Smtp-Source: AMrXdXsym+2Ed733gBaz1jzVImfU6r9sc8ByJNgEn3jiWOziYx0WDyS1q4nViZMgkekGAaUqxFf57w==
X-Received: by 2002:a05:6a21:3a48:b0:ad:4be8:5984 with SMTP id
 zu8-20020a056a213a4800b000ad4be85984mr56067286pzb.27.1675087759920; 
 Mon, 30 Jan 2023 06:09:19 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u70-20020a638549000000b004468cb97c01sm6962977pgd.56.2023.01.30.06.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:09:19 -0800 (PST)
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
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 5/9] tests/qtest/e1000e-test: Fabricate ethernet header
Date: Mon, 30 Jan 2023 23:08:05 +0900
Message-Id: <20230130140809.78262-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130140809.78262-1-akihiko.odaki@daynix.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
2.39.1


