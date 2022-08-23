Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EC59D2C8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:56:39 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOm6-00076J-H8
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oQOh6-0001WG-8l
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:51:31 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:46440
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oQOh4-0007uD-4g
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:51:27 -0400
HMM_SOURCE_IP: 172.18.0.218:36912.1263259734
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 31EE32800D6;
 Tue, 23 Aug 2022 15:51:07 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 12b6c66f5b274eb593bfc1590bad75b6 for
 peter.maydell@linaro.org; Tue, 23 Aug 2022 15:51:24 CST
X-Transaction-ID: 12b6c66f5b274eb593bfc1590bad75b6
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: tugy@chinatelecom.cn
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org
Cc: tugy@chinatelecom.cn
Subject: [PATCH v1 1/2] oslib-posix: Introduce qemu_socketpair()
Date: Tue, 23 Aug 2022 15:50:39 +0800
Message-Id: <17fa1eff729eeabd9a001f4639abccb127ceec81.1661240709.git.tugy@chinatelecom.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661240709.git.tugy@chinatelecom.cn>
References: <cover.1661240709.git.tugy@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guoyi Tu <tugy@chinatelecom.cn>

qemu_socketpair() will create a pair of connected sockets
with FD_CLOEXEC set

Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 include/qemu/sockets.h | 18 ++++++++++++++++++
 util/oslib-posix.c     | 19 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f..036745e586 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -14,6 +14,24 @@ int inet_aton(const char *cp, struct in_addr *ia);
 /* misc helpers */
 bool fd_is_socket(int fd);
 int qemu_socket(int domain, int type, int protocol);
+
+#ifndef WIN32
+/**
+ * qemu_socketpair:
+ * @domain: specifies a communication domain, such as PF_UNIX
+ * @type: specifies the socket type.
+ * @protocol: specifies a particular protocol to be used with the  socket
+ * @sv: an array to store the pair of socket created
+ *
+ * Creates an unnamed pair of connected sockets in the specified domain,
+ * of the specified type, and using the optionally specified protocol.
+ * And automatically set the close-on-exec flags on the returned sockets
+ *
+ * Return 0 on success.
+ */
+int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
+#endif
+
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
 int socket_set_cork(int fd, int v);
 int socket_set_nodelay(int fd);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 7a34c1657c..e5f5ebe469 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -261,6 +261,25 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+int qemu_socketpair(int domain, int type, int protocol, int sv[2])
+{
+    int ret;
+
+#ifdef SOCK_CLOEXEC
+    ret = socketpair(domain, type | SOCK_CLOEXEC, protocol, sv);
+    if (ret != -1 || errno != EINVAL) {
+        return ret;
+    }
+#endif
+    ret = socketpair(domain, type, protocol, sv);;
+    if (ret == 0) {
+        qemu_set_cloexec(sv[0]);
+        qemu_set_cloexec(sv[1]);
+    }
+
+    return ret;
+}
+
 char *
 qemu_get_local_state_dir(void)
 {
-- 
2.25.1


