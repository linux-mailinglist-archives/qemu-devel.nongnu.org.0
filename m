Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F046B59105F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTDB-0005DG-2F
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oMT5r-0007wI-R0
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:47 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:38288
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oMT5o-00029Q-Kj
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:47 -0400
HMM_SOURCE_IP: 172.18.0.48:45914.1860825121
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 0982B2800AB;
 Fri, 12 Aug 2022 19:44:36 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 5780c06b26034459af61b9476233f7a0 for
 peter.maydell@linaro.org; Fri, 12 Aug 2022 19:44:39 CST
X-Transaction-ID: 5780c06b26034459af61b9476233f7a0
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: tugy@chinatelecom.cn
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 tugy@chinatelecom.cn
Subject: [PATCH 1/2] osdeps: Introduce qemu_socketpair()
Date: Fri, 12 Aug 2022 19:44:29 +0800
Message-Id: <211833676831b86d70af12df9912aa971d46092b.1660303075.git.tugy@chinatelecom.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660303075.git.tugy@chinatelecom.cn>
References: <cover.1660303075.git.tugy@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226; envelope-from=tugy@chinatelecom.cn;
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
 include/qemu/sockets.h |  3 +++
 util/osdep.c           | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f..52cf2855df 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -14,6 +14,9 @@ int inet_aton(const char *cp, struct in_addr *ia);
 /* misc helpers */
 bool fd_is_socket(int fd);
 int qemu_socket(int domain, int type, int protocol);
+#ifndef WIN32
+int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
+#endif
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
 int socket_set_cork(int fd, int v);
 int socket_set_nodelay(int fd);
diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..4b1ab623c7 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -481,6 +481,30 @@ int qemu_socket(int domain, int type, int protocol)
     return ret;
 }
 
+#ifndef _WIN32
+/*
+ * Create a pair of connected sockets with FD_CLOEXEC set
+ */
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
+#endif
+
 /*
  * Accept a connection and set FD_CLOEXEC
  */
-- 
2.25.1


