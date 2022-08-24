Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B259F7F6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:41:11 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnol-0002WQ-Fq
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuR-0004AW-LD
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:51 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuP-0001br-Vs
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id s206so14562245pgs.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KoPI4eXuTPrxafT3ECcIZJJvMLwXtdkRP59ne1WxHZs=;
 b=HpR6r7lFNgVnv5TTgYMTT85ojDH9R5bGU8TzcUviZNPTDLbQmqUOtVqT8wJZbThJTN
 q+kipI5ERspKLaZNFz+I+s1p86MKuEWJuHQ4jcwhw+5jeDDBp4o6VXsLoZegZP3w52Bp
 nhF31De5ews9lUm+Sql4IrNQ6iB4DjXKPXsHvfNmneTKz6KUhUyg2JBRHY8reviUon6/
 xdfxr0d+zumf+PwdUktkgegcBA6D0HyTSFMRQY4eftCftyCtnKqfrWC3H5SLN7l6n7Rp
 eMllUuekKQByaKI1/6eTl6Z1aCic9BXYxCOeZ/rpDqQ9mIWLjd+00FRE2UaCmM0DXqSB
 riow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KoPI4eXuTPrxafT3ECcIZJJvMLwXtdkRP59ne1WxHZs=;
 b=L+RS7CpNdE9vkraAv2kp79adtN3bmfJ4IboA//AzOl4TaVSllCxmKeOliLU0SpWpb0
 Id2VoSuuMP4j4AAGZFCSSDmq3biu4xnbZ0wI2P3L939/dAdLUV5fAmrcCYPEVT+ikTxn
 VKVzZpaGzK5jRov2pgPV/J9nDPRiqf1ebiufd9K8YGuRSAVms9Y1NTrwIbfJML9HKzFF
 KCzX7n5FAtnwIengb3mLFydazO/gbq2fFVokAvBmozBb0j53Pf8Jtu5oop1CyTjy6BuL
 lIntO25wBWEzYC0l5Nx4bQjyssIW4ycGuG1wU+dDNdcgXb5oFsKPDz2fBS6ju2Um8w/2
 siIQ==
X-Gm-Message-State: ACgBeo1HHhbU8lPVrJV/NMEHEPKMbIDlgnBf40xWaA5aJYPlfmOLxolt
 rJXUtWHhBIZ6xLUAyHPrwBZfZekNN8s=
X-Google-Smtp-Source: AA6agR6WysJXSwpm6X+LW2edpDXbbPpHLrV3NVja2kl0R7CZoKaPsKsstR/e56wxnxm/6B6qvF/heA==
X-Received: by 2002:a65:6755:0:b0:41d:70c1:be0 with SMTP id
 c21-20020a656755000000b0041d70c10be0mr24234622pgu.99.1661334168420; 
 Wed, 24 Aug 2022 02:42:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 28/51] tests/qtest: libqtest: Exclude the *_fds APIs for win32
Date: Wed, 24 Aug 2022 17:40:06 +0800
Message-Id: <20220824094029.1634519-29-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
---

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
index b7b7c9c541..1b24a4f1f7 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -594,17 +594,20 @@ int qtest_socket_server(const char *socket_path)
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
@@ -613,6 +616,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
     /* Receive reply */
     return qtest_qmp_receive(s);
 }
+#endif
 
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
 {
@@ -622,6 +626,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     return qtest_qmp_receive(s);
 }
 
+#ifndef _WIN32
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
 {
@@ -633,6 +638,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
     va_end(ap);
     return response;
 }
+#endif
 
 QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
 {
@@ -1329,6 +1335,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
+#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
@@ -1348,6 +1355,7 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
+#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.34.1


