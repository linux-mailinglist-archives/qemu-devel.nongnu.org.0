Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7E1D4918
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:09:08 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWL5-0003Dk-7x
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZWIi-00086b-3y
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:06:40 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:56400)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZWIe-0002LC-Fp
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=4ymfCBhOY6lBmpgVsJ
 6NfZIV/jErcC0Pk1R62zigyjA=; b=NisD+8ihvIyjYtHKArtcMKe/TUjNeHypTQ
 cdXhqNMDVwkxOl8uDFC741ZIuN9v00HzzIjVaj29/+iXrgxaNZN4SaCy5oD+Iexq
 KgXv7OV3UjESB/cvGqwWdYJqk1QPOguuB6fAqO1ZQ0jYhNbKpZ9tVuuBimsRH8Ld
 hbxPvTh6o=
Received: from localhost.localdomain (unknown [114.240.93.195])
 by smtp3 (Coremail) with SMTP id G9xpCgBnt5uKW75eMHSGBQ--.172S4;
 Fri, 15 May 2020 17:06:25 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] tests/util-sockets: add abstract unix socket cases
Date: Fri, 15 May 2020 17:06:07 +0800
Message-Id: <20200515090608.5373-3-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515090608.5373-1-zxq_yx_007@163.com>
References: <20200515090608.5373-1-zxq_yx_007@163.com>
X-CM-TRANSID: G9xpCgBnt5uKW75eMHSGBQ--.172S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw48GryUCw18JryUtw1fJFb_yoW5XF4rpF
 yfKFy5Kr4rAFs29w43JayDJr1fGrnYva1jy3s3Awn8Ar4DKw1YqFsYyFyUtr17JFW8Jw4S
 9FnIgF10g39xtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6sjUUUUUU=
X-Originating-IP: [114.240.93.195]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhElxl44KmzOlAAAse
Received-SPF: pass client-ip=123.126.97.3; envelope-from=zxq_yx_007@163.com;
 helo=mail-m973.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 05:06:29
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 armbru@redhat.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add cases to test tight and non-tight for abstract address type

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 tests/test-util-sockets.c | 92 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 5fd947c7bf..2ca1e99f17 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -227,6 +227,93 @@ static void test_socket_fd_pass_num_nocli(void)
     g_free(addr.u.fd.str);
 }
 
+#ifdef __linux__
+static gchar *abstract_sock_name;
+
+static gpointer unix_server_thread_func(gpointer user_data)
+{
+    SocketAddress addr;
+    Error *err = NULL;
+    int fd = -1;
+    int connfd = -1;
+    struct sockaddr_un un;
+    socklen_t len = sizeof(un);
+
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = abstract_sock_name;
+    addr.u.q_unix.tight = user_data != NULL;
+    addr.u.q_unix.abstract = true;
+
+    fd = socket_listen(&addr, 1, &err);
+    g_assert_cmpint(fd, >=, 0);
+    g_assert(fd_is_socket(fd));
+
+    connfd = accept(fd, (struct sockaddr *)&un, &len);
+    g_assert_cmpint(connfd, !=, -1);
+
+    close(fd);
+
+    return NULL;
+}
+
+static gpointer unix_client_thread_func(gpointer user_data)
+{
+    SocketAddress addr;
+    Error *err = NULL;
+    int fd = -1;
+
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = abstract_sock_name;
+    addr.u.q_unix.tight = user_data != NULL;
+    addr.u.q_unix.abstract = true;
+
+    fd = socket_connect(&addr, &err);
+
+    g_assert_cmpint(fd, >=, 0);
+
+    close(fd);
+
+    return NULL;
+}
+
+static void test_socket_unix_abstract_good(void)
+{
+    GRand *r = g_rand_new();
+
+    abstract_sock_name = g_strdup_printf("unix-%d-%d", getpid(),
+                                         g_rand_int_range(r, 100, 1000));
+
+    /* non tight socklen serv and cli */
+    GThread *serv = g_thread_new("abstract_unix_server",
+                                 unix_server_thread_func,
+                                 NULL);
+
+    sleep(1);
+
+    GThread *cli = g_thread_new("abstract_unix_client",
+                                unix_client_thread_func,
+                                NULL);
+
+    g_thread_join(cli);
+    g_thread_join(serv);
+
+    /* tight socklen serv and cli */
+    serv = g_thread_new("abstract_unix_server",
+                        unix_server_thread_func,
+                        (gpointer)1);
+
+    sleep(1);
+
+    cli = g_thread_new("abstract_unix_client",
+                       unix_client_thread_func,
+                       (gpointer)1);
+
+    g_thread_join(cli);
+    g_thread_join(serv);
+
+    g_free(abstract_sock_name);
+}
+#endif
 
 int main(int argc, char **argv)
 {
@@ -265,6 +352,11 @@ int main(int argc, char **argv)
                         test_socket_fd_pass_num_nocli);
     }
 
+#ifdef __linux__
+    g_test_add_func("/util/socket/unix-abstract/good",
+                    test_socket_unix_abstract_good);
+#endif
+
 end:
     return g_test_run();
 }
-- 
2.17.1


