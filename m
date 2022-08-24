Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E059F7E0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:34:56 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnio-0004Is-Sd
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuP-00046t-O0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:50 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuO-0001bT-0Y
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:49 -0400
Received: by mail-pg1-x533.google.com with SMTP id 202so14542886pgc.8
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=IfI/qWhUWiZQhG5XwWjV6xjarmHg12V73Blb6zZFpuQ=;
 b=lgIvNYS2uxagdXZauE9C99i9XdDYqd8KPAc1aWEHEl3QH9uGAj8wgzNykpP7DX0YqY
 2dE5eJBC9O5CBWv7EJpLMcAVgqCbzQ8bz3m4MEiqbBr1KnkOwxT3sz8Yw70UJ7WNtsSz
 31CuFlzqfgxQkQ6jdHUxfZhQmwkGiLyBdnezlzyDeJoNIwFRQHoyUd3zfAbwPmyqcEjJ
 D+dAeGva2CA5hZ54wRfOunVGapRIkhtNzrzB8QgAE+tQu2/SPMk9R1fR4hfB0uGFBw2t
 lAndgigtdIBo24kYN/5FxUZQpu/VAXhH1/lLRswBCZTFuy0fgFUAf4hXiuBk2X77xKTn
 j3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IfI/qWhUWiZQhG5XwWjV6xjarmHg12V73Blb6zZFpuQ=;
 b=kP4xGPpnuDqoy3H3j1rpXPV49UrjfS/rjeaLbi9HGv31ehdDKfi/pGrqy+yJBvy2Cn
 0AqPha+yZ2RZ9SFnpACRxpPXzptitilGJLns+qk3T5D7mi9YNBd1kcCNBXkNx0E9YVKf
 b7LR4DgrIbKyvHJ/J4p2Yd5eFhD11s/5VcT8pQnp24py/pOFGf1NgFp3tSa3QlSUARvm
 ili3KJQ6ZZkK/qryVHjyCalVXA1lZuXoTwgGnwez1u/7rUM/yQuA4o3nISRkgWvqJ7/J
 Z7yHKkWGaqUnAtiDUHDPe0ut2oFyMVLgo1a316IsButDkMOcHSIlbZkPapxIpLhmHmXF
 0Odg==
X-Gm-Message-State: ACgBeo0O4eFTyluYeXR9Om9vTZR78TaLZB32yovel4Y6O6GcLeduztxN
 0uGCRyE+fWPoB/B86bKBbWOgmrLfBVM=
X-Google-Smtp-Source: AA6agR5sJ9C0HFPuKJAG/c6z7BkLhItFVTK2K80PhDjyHaoJLFMEwWfHP7cOEBwuVq2W0Jw+keLmNw==
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id
 l16-20020a056a00141000b005285a5ad846mr29523999pfu.9.1661334166406; 
 Wed, 24 Aug 2022 02:42:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
Date: Wed, 24 Aug 2022 17:40:05 +0800
Message-Id: <20220824094029.1634519-28-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x533.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Socket communication in the libqtest and libqmp codes uses read()
and write() which work on any file descriptor on *nix, and sockets
in *nix are an example of a file descriptor.

However sockets on Windows do not use *nix-style file descriptors,
so read() and write() cannot be used on sockets on Windows.
Switch over to use send() and recv() instead which work on both
Windows and *nix.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqmp.c   | 4 ++--
 tests/qtest/libqtest.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index ade26c15f0..995a39c1f8 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -36,7 +36,7 @@ typedef struct {
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = send(fd, buf, size, 0);
 
     assert(res == size);
 }
@@ -69,7 +69,7 @@ QDict *qmp_fd_receive(int fd)
         ssize_t len;
         char c;
 
-        len = read(fd, &c, 1);
+        len = recv(fd, &c, 1, 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 909583dad3..b7b7c9c541 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -438,7 +438,7 @@ void qtest_quit(QTestState *s)
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = send(fd, buf, size, 0);
 
     assert(res == size);
 }
@@ -470,7 +470,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
         ssize_t len;
         char buffer[1024];
 
-        len = read(s->fd, buffer, sizeof(buffer));
+        len = recv(s->fd, buffer, sizeof(buffer), 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
-- 
2.34.1


