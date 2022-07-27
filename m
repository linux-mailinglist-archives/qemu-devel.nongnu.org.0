Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA15827E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:44:10 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhKb-0001AN-Fs
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5N-0003n0-Od
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:30 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5M-000268-4B
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id p8so16087748plq.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDgvtILjqj7f5GpmrtAwzXuf0Dj9yuPEjtZ/JywTSCI=;
 b=jFQqEByrKfoCmaPxP29emG7lOgK3vdfw2yThoYKnTZe3b748sh2BnAt+pPcHSz7BAc
 9zMwUWP7I2WQa8hbOL0Ps/MorjVNV0TmzA9+eomvlR5lFdybXDLAzi1q5FLJHCHEYfqz
 e2nYiTey8LC56vO1VCONugJ3lMD//6RnCCWeYoA/BkXHUo9MXjdV5o80VIeRv2JeovB5
 qMKYEwb8ORNrqZbbZq9oYkNuZLIV6lfpmsQ5ANyPDc50CLIuxiPjNjPxherBVL5sLLtZ
 N002RB/nWHrtBChJLk/z195E2mpclWYgUucFRd2VUgzGSqNs2g/HtXvAv+7v3CChII3L
 C0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDgvtILjqj7f5GpmrtAwzXuf0Dj9yuPEjtZ/JywTSCI=;
 b=benOb2Q52+n772le8b5/fRDheqH7BeP5zTY70Vpez+Aq3d1r+O8XTOdyp+b65Wkgfm
 vokJxVdjQNNR5lIGPe0F8NN6iRYBT/FdFZ7Ojv1B36Ir6iiuSM4aKAXHAUwUGrbDbqbN
 F0ePOQc3G1l3Pi6cqETjSTDhwnfxPPwG+B4/Eh+d4SyxoKvRwv2qeeZUxEJQTV0mwzdo
 cU37zI0FQEaySAq/aDwxFgIZoug9jGQK/eHFB5DOrPT6uz8V10QB6DMol8dC9OUsR+Lk
 356O/yW35J8X9S4mxiIOeNHc5zEQBQD1PqeWg/0KP+lj529avVe8A31aOM6N9KUVN2fz
 7S0Q==
X-Gm-Message-State: AJIora+jpxnRniD64xE3L+5K0nsDKgQE77CwDtzn2cZQPQW0VZwdig3D
 dD5tgHuBE8uQetHZ5+JgYxTZ4sVSIPc=
X-Google-Smtp-Source: AGRyM1vFXDXa+yGKOQ85f7nocsiXkHWrmvHZIolu8DMKmZBl65QJbIThpvkvyu4+OesFhnpytGQ+Rg==
X-Received: by 2002:a17:90a:e7cd:b0:1f0:2304:f579 with SMTP id
 kb13-20020a17090ae7cd00b001f02304f579mr4677566pjb.212.1658928502177; 
 Wed, 27 Jul 2022 06:28:22 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 6/6] tests/unit: Update test-io-channel-socket.c for Windows
Date: Wed, 27 Jul 2022 21:28:02 +0800
Message-Id: <20220727132802.812580-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
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


