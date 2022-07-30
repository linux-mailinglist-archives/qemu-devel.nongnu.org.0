Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A0585AE1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 16:54:44 +0200 (CEST)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHnrX-0001sF-Lg
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 10:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnp-0004cD-2i
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:53 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnn-0007a5-HJ
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:52 -0400
Received: by mail-pj1-x1031.google.com with SMTP id f7so7229186pjp.0
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=syegDozyseUU5fCu7uAkgigwYdqDyHaqtGywnxSE5dY=;
 b=RD86hUB98JZ7/uSRJrWpP75KVcOeiY6VUrR3OVrTgZZex7JqyMIsJKgiXs/M2yBqgL
 3Fr+YHpfvVNcny8IuUA11fjqDoXeWlRWYDZrFHm5VM6M72pWLVbH5pTX/O+YDh80nM+d
 pdtqWZT/5y7BgymgLZB9SeZvYGFRc23BswfNb8rxkCGeuAAnTkar3QadKjh8OrweqfC1
 Qo2Y9C17GXhjbMM4/7ndo2D4MZIrieH6j7eZDjl/uZTxVGoGMQI0UGTssRvWKEP51+D7
 p2aAjBFKRfN+r/J0HClck4mKIUav73s5dC1OhA+cngNcKmvQnY3G2RO770po5I7VXGYW
 Rurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=syegDozyseUU5fCu7uAkgigwYdqDyHaqtGywnxSE5dY=;
 b=LVanwZTH+2aCRw1dtlUDFw5edNwZFxejTg2tT+T2to1+0AiXqmJoVCcrJB6niYxkYZ
 VxTONRnZrsyg0ckaLbO0LidEUZJughOqbyYRnKfthqT8wNbmR/LAoHI6u2parSq/ELUM
 j/PiFpiFuq5BK/J/jU2EoW26QU4M2W4hVSw6BZFKXl/aJFG/dC7necvxNet+6CY0p8NH
 8qAi3Xrig4yoMUnBvGdZV27BiBZwbxUf9FuU7Of+Lwbi7apeWdCA5zzpd6mNCxVYyt0S
 nWfRSClJQ8c3VeR8IehqiiQK7OWINQ9FtI7QkkCFWAehC4kMSv8HJiXeIyxWba3Hh6DG
 i5Ww==
X-Gm-Message-State: ACgBeo0FkWi95Qwy7WbFfmTX9MutchSb4wkoVfeishrWbZzKQ1pANes8
 vSdHEkF8FuhFVIW6GsCD4u52cERdfW8=
X-Google-Smtp-Source: AA6agR6C5jOpOfrXrEiGNJw13wpf1BdCfvBScHr4XHVX+k/+1nauTSgOTtokeJ4S8yKnIGVU0fEwhQ==
X-Received: by 2002:a17:902:db0f:b0:16e:d419:85db with SMTP id
 m15-20020a170902db0f00b0016ed41985dbmr1736988plx.82.1659192650054; 
 Sat, 30 Jul 2022 07:50:50 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa78f0b000000b00525343b5047sm4882499pfr.76.2022.07.30.07.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 07:50:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 4/4] tests/unit: Update test-io-channel-socket.c for Windows
Date: Sat, 30 Jul 2022 22:50:36 +0800
Message-Id: <20220730145036.865854-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730145036.865854-1-bmeng.cn@gmail.com>
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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

Enable the following 3 test cases for Windows when AF_UNIX is available:

  * test_io_channel_unix_sync
  * test_io_channel_unix_async
  * test_io_channel_unix_listen_cleanup

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- new patch: tests/unit: Update test-io-channel-socket.c for Windows

 tests/unit/test-io-channel-socket.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index 6713886d02..ec5df32489 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -179,10 +179,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_async(listen_addr, connect_addr,
                                     &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -206,10 +208,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_async(listen_addr, connect_addr,
                                     &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -236,10 +240,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_sync(listen_addr, connect_addr,
                                    &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -263,10 +269,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_sync(listen_addr, connect_addr,
                                    &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -367,7 +375,7 @@ static void test_io_channel_ipv6_async(void)
 }
 
 
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
 static void test_io_channel_unix(bool async)
 {
     SocketAddress *listen_addr = g_new0(SocketAddress, 1);
@@ -398,6 +406,7 @@ static void test_io_channel_unix_async(void)
     return test_io_channel_unix(true);
 }
 
+#ifndef _WIN32
 static void test_io_channel_unix_fd_pass(void)
 {
     SocketAddress *listen_addr = g_new0(SocketAddress, 1);
@@ -491,6 +500,7 @@ static void test_io_channel_unix_fd_pass(void)
     }
     g_free(fdrecv);
 }
+#endif /* _WIN32 */
 
 static void test_io_channel_unix_listen_cleanup(void)
 {
@@ -588,13 +598,15 @@ int main(int argc, char **argv)
                         test_io_channel_ipv6_async);
     }
 
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
     g_test_add_func("/io/channel/socket/unix-sync",
                     test_io_channel_unix_sync);
     g_test_add_func("/io/channel/socket/unix-async",
                     test_io_channel_unix_async);
+#ifndef _WIN32
     g_test_add_func("/io/channel/socket/unix-fd-pass",
                     test_io_channel_unix_fd_pass);
+#endif
     g_test_add_func("/io/channel/socket/unix-listen-cleanup",
                     test_io_channel_unix_listen_cleanup);
 #endif /* _WIN32 */
-- 
2.34.1


