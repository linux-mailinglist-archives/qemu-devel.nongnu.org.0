Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D975EF471
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:37:52 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrrE-00033Z-4Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMn-0001PF-Um
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMm-00023P-8q
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nz0okoqs97AGg9QA1bZOrRakGbAfb/yIQpkpq/jAzbA=;
 b=USJS4s/pS2U9fz3amyB13aOvQon2rQqOdZq5I8JdZp59srDUzFXnUzzPrwIBKXemF+QcQN
 GSkLGKSNBeOwxJ9y2WXfE2ET5Gzopf+JcUQj7DbW3iYpZCaXWHKaNgyOpX1XXsGlXCN5KB
 k7THc6C+t2adzg2bCylyfYmH17ujBaE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-tOU4JisnOdi6_1YfwJkf6Q-1; Thu, 29 Sep 2022 07:05:55 -0400
X-MC-Unique: tOU4JisnOdi6_1YfwJkf6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A0C738012CA;
 Thu, 29 Sep 2022 11:05:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D465C207B34A;
 Thu, 29 Sep 2022 11:05:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Guoyi Tu <tugy@chinatelecom.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 7/8] oslib-posix: Introduce qemu_socketpair()
Date: Thu, 29 Sep 2022 15:05:07 +0400
Message-Id: <20220929110508.1323529-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <17fa1eff729eeabd9a001f4639abccb127ceec81.1661240709.git.tugy@chinatelecom.cn>
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
index d55af69c11..827a7aadba 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -253,6 +253,25 @@ void qemu_set_cloexec(int fd)
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
2.37.3


