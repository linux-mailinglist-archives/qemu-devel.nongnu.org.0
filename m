Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A545BE58D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:18:59 +0200 (CEST)
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacDK-0002Zk-9o
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ4-0001HV-Sx
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYo-0004rK-MZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b21so1907530plz.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3+yjqfv6z1umkAWfalloUAoEl8FsRBb1xm1eNDtEso0=;
 b=L1nAIht+b9lFj0xxHkiUDxNNOH4b8FTSbuSy5qBeiwkxOlR1ETpuvFB4HRPzSnEpO6
 oAmSVauzlhCaJV4Na0e43zaVQkeB3Q31VRZ1qEIBsRoTfMps+4KqI/Zaov1G3MdC/HsU
 4aE6r/86UBCfAw9G4qxqMtsuDgcFcURXlU6sXHJP13JVKq28iIgdROuanWWBbEajN+1G
 gsfQ8RDplTQ2Oax3d5Ef9JnyD9sUqFLS+89og8845/xppemKv58FiXRNN0F350Xv7PX3
 y304OczfpSdZlfcJ8uMvn0iFlaKE3vbKQpQRTXDxkHlhqQVjGpAiXCiX47Xtv7IEF8yl
 EoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3+yjqfv6z1umkAWfalloUAoEl8FsRBb1xm1eNDtEso0=;
 b=dw84hAAV3AYj2iNG0QRzi8UMcjJNG3+R/JIVzNH+JxzzWEmkv9qn0/pxGpL0u/nBK2
 8ikKIZH+9rnQdCMH+G1X0Qu0KRXYab5V5NxQWZ7uf1l4zF+Dm4/va87UwFr8UyVSz6Ht
 07C0GHt9QdUVLVRKvlYSwYc4+hi0AMkSbFxV1Q/k/rwsP+H75JYyRDYIQbsTYFcWOUWt
 pZU5H3b99sJWvxolR4lceEvvart0nPECqpDYgnFalU/HgFWmuuwsEeFJhoBnWzSHDgu/
 J0f9+P4hZCR3O074mhreY/hcwzgtIbIwH7XB6bHti7hfWZLw8OpjdtGdwzxohdQDLfyV
 cNNA==
X-Gm-Message-State: ACrzQf0ZTWgTFWC9xR86VYGmfM9mC1c5YJTv687nvo9UzbgrCU70alsu
 cnP84/189roT+Tk6sWWWAK+6xMKX2sc=
X-Google-Smtp-Source: AMsMyM7A8MNTwdwHpbK3Ege3oHVhcCDSU5MeEI4CWrMDr/Z/5L1jGSVPSgOp7uYc7lV/k4t7w5T4AQ==
X-Received: by 2002:a17:90b:3615:b0:202:a996:c9a3 with SMTP id
 ml21-20020a17090b361500b00202a996c9a3mr3181461pjb.111.1663669980115; 
 Tue, 20 Sep 2022 03:33:00 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 17/39] tests/qtest: libqtest: Exclude the *_fds APIs for
 win32
Date: Tue, 20 Sep 2022 18:31:37 +0800
Message-Id: <20220920103159.1865256-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

libqmp.c::qmp_fd_vsend_fds() is not available on Windows, hence any
APIs in libqtest that call libqmp.c::qmp_fd_vsend_fds() should be
excluded for win32 too. This includes the following:

  * qtest_qmp_vsend_fds()
  * qtest_vqmp_fds()
  * qtest_qmp_fds()
  * qtest_qmp_add_client()

Note qtest_qmp_vsend() was wrongly written to call qmp_fd_vsend_fds()
previously, but it should call the non fds version API qmp_fd_vsend().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 94b187837d..3abc75964d 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -94,6 +94,7 @@ void qtest_kill_qemu(QTestState *s);
  */
 void qtest_quit(QTestState *s);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_fds:
  * @s: #QTestState instance to operate on.
@@ -108,6 +109,7 @@ void qtest_quit(QTestState *s);
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
     G_GNUC_PRINTF(4, 5);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp:
@@ -152,6 +154,7 @@ void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
  */
 int qtest_socket_server(const char *socket_path);
 
+#ifndef _WIN32
 /**
  * qtest_vqmp_fds:
  * @s: #QTestState instance to operate on.
@@ -167,6 +170,7 @@ int qtest_socket_server(const char *socket_path);
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
     G_GNUC_PRINTF(4, 0);
+#endif /* _WIN32 */
 
 /**
  * qtest_vqmp:
@@ -181,6 +185,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     G_GNUC_PRINTF(2, 0);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_vsend_fds:
  * @s: #QTestState instance to operate on.
@@ -196,6 +201,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
     G_GNUC_PRINTF(4, 0);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp_vsend:
@@ -743,6 +749,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) G_GNUC_PRINTF(4, 5);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_add_client:
  * @qts: QTestState instance to operate on
@@ -752,6 +759,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
  * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
  */
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp_device_del:
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index a25a8b47d0..8b804faade 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -592,17 +592,20 @@ int qtest_socket_server(const char *socket_path)
     return sock;
 }
 
+#ifndef _WIN32
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
 {
     qmp_fd_vsend_fds(s->qmp_fd, fds, fds_num, fmt, ap);
 }
+#endif
 
 void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
 {
-    qmp_fd_vsend_fds(s->qmp_fd, NULL, 0, fmt, ap);
+    qmp_fd_vsend(s->qmp_fd, fmt, ap);
 }
 
+#ifndef _WIN32
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
 {
@@ -611,6 +614,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
     /* Receive reply */
     return qtest_qmp_receive(s);
 }
+#endif
 
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
 {
@@ -620,6 +624,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     return qtest_qmp_receive(s);
 }
 
+#ifndef _WIN32
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
 {
@@ -631,6 +636,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
     va_end(ap);
     return response;
 }
+#endif
 
 QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
 {
@@ -1327,6 +1333,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
+#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
@@ -1346,6 +1353,7 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
+#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.34.1


