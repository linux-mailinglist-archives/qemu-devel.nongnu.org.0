Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607592A48D3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:01:41 +0100 (CET)
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZxoa-0005Da-Cg
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxPj-0005uG-Lk
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxPg-0006ye-Up
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604414155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TD7SW6oID+mQnZFy+V2Ba30n404JJ+wGVVREK/DvNQg=;
 b=SVv42ByHYUU0gMHvCE/nKGUepcUaT1ragNRXVdFaeJ+1XWHOmW3oxQeIJQZLAq5e/z4i8i
 dB5KPyp+KxolN6PyVa6E0RuKwv/emI3PiizBz48vmkNLinAT5dPPiGSRL0/k+dIJv5B7H1
 cCRT/oVm3KcAU4AZlkSC+L8kFMQRtTc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-1DJSvekjP_6WegRXWGz23w-1; Tue, 03 Nov 2020 09:35:33 -0500
X-MC-Unique: 1DJSvekjP_6WegRXWGz23w-1
Received: by mail-wm1-f71.google.com with SMTP id y26so347540wmj.7
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 06:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TD7SW6oID+mQnZFy+V2Ba30n404JJ+wGVVREK/DvNQg=;
 b=EoTt7vPRYqdH5ogDbmp58hPXlfXgoJiPZZfCEQD09bErU3aTZPztQgkROgOGB+5voH
 7RLU6LCmEEAFvuv2VL6OSnNhIukVSUw2n0AkXx13tXYVMqz1+1z1+FughdmYgt0GraQq
 a8z1ksTl1Jj/x9nv1/97dg5cs8IBPMx2LQkEsLRWXa2A0JB7zEyEKDlwGH2Lu1VgZ8tB
 MXew6sNbGuVexD9zfosthET9YTcM3ow634sdw6R7luyE+pmUeBgMnIeVyTb3vw1E3H4o
 rE+KaqoEBw79V06Envls6bJex5F7+pf79y2mroaDBvXzNsjSYxz+J92tm1SZflTOO5+t
 uRAQ==
X-Gm-Message-State: AOAM5305mDp9A199UMY6GhEhu8jUklUdhNTFGVSSwL84h1jq/+54OlDD
 iBCvZRxaOmp0bzpEX5mNVnam/pFsmKeaw2Bp9Tp20LyEav+hZRXqsvUIt6Z9rPUP1sLA2LVx3RF
 7+dYSPDKwy6+7A7w=
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr26679277wrn.91.1604414131286; 
 Tue, 03 Nov 2020 06:35:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwztaqG09Ip5CpZXK94nMkqYjG1GdMbVOjL/YYa/YfVz66GAWws07A1GrfH10tClGMzPKmsew==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr26679259wrn.91.1604414131134; 
 Tue, 03 Nov 2020 06:35:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id t1sm25553923wrs.48.2020.11.03.06.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:35:30 -0800 (PST)
Date: Tue, 3 Nov 2020 09:35:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] libqtest: add qtest_socket_server()
Message-ID: <20201103142306.71782-35-mst@redhat.com>
References: <20201103142306.71782-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103142306.71782-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

There is a qtest_socket_client() API. Add an equivalent
qtest_socket_server() API that returns a new UNIX domain socket in the
listen state. The code for this was already there but only used
internally in init_socket().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201027173528.213464-9-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 +++++++
 tests/qtest/libqtest.c        | 40 ++++++++++++++++++++---------------
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 241b5f89fb..699be8c2a2 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -132,6 +132,14 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
 void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
+/**
+ * qtest_socket_server:
+ * @socket_path: the UNIX domain socket path
+ *
+ * Create and return a listen socket file descriptor, or abort on failure.
+ */
+int qtest_socket_server(const char *socket_path);
+
 /**
  * qtest_socket_client:
  * @server_socket_path: the socket server's path
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index ab34075f2b..d652ffc90d 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -82,24 +82,8 @@ static void qtest_client_set_rx_handler(QTestState *s, QTestRecvFn recv);
 
 static int init_socket(const char *socket_path)
 {
-    struct sockaddr_un addr;
-    int sock;
-    int ret;
-
-    sock = socket(PF_UNIX, SOCK_STREAM, 0);
-    g_assert_cmpint(sock, !=, -1);
-
-    addr.sun_family = AF_UNIX;
-    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+    int sock = qtest_socket_server(socket_path);
     qemu_set_cloexec(sock);
-
-    do {
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
-    } while (ret == -1 && errno == EINTR);
-    g_assert_cmpint(ret, !=, -1);
-    ret = listen(sock, 1);
-    g_assert_cmpint(ret, !=, -1);
-
     return sock;
 }
 
@@ -638,6 +622,28 @@ QTestState *qtest_create_state_with_qmp_fd(int fd)
     return qmp_test_state;
 }
 
+int qtest_socket_server(const char *socket_path)
+{
+    struct sockaddr_un addr;
+    int sock;
+    int ret;
+
+    sock = socket(PF_UNIX, SOCK_STREAM, 0);
+    g_assert_cmpint(sock, !=, -1);
+
+    addr.sun_family = AF_UNIX;
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+
+    do {
+        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
+    } while (ret == -1 && errno == EINTR);
+    g_assert_cmpint(ret, !=, -1);
+    ret = listen(sock, 1);
+    g_assert_cmpint(ret, !=, -1);
+
+    return sock;
+}
+
 int qtest_socket_client(char *server_socket_path)
 {
     struct sockaddr_un serv_addr;
-- 
MST


