Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35559F89D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:30:40 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoai-0006uv-9u
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv6-0004UF-RC; Wed, 24 Aug 2022 05:43:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv5-0001qE-6Z; Wed, 24 Aug 2022 05:43:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso957475pjd.1; 
 Wed, 24 Aug 2022 02:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=absMu0MsCcS+D8Q8iKeaSzi8XuqAyekaCuc9H9DLYbc=;
 b=NDv6cXqYoVIT6UlJFchvJvI+7vc9VAWbvNd8EzFyl0Xyy9JSejdoTtHowjqeyY5WN/
 1SjWn/ZzooHtZMTLk2ehGXnsRGzjFJ9iCQnlZjpLjLHsUBc4Q7EPJ8ADRtBSpIfAhg8l
 D5gfwgybFUY3yOy6LSUSSwp6gcG9DPlBEIFnSQRmhKB0GXQ+edUtrSbFoIYelcp9aPtN
 4ji2U4v+N3tcYObSlcRmJTPdEMCceVHQbOvD2s+rNDGN1+gBWln4jwOS24pkmv/RURMf
 Ax6TSvJmbDivLCmMM0G1bUVpFLM2EOKffasyDtVcFH4JSqv6KSRiPcEKECN65oi8mTe9
 Oksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=absMu0MsCcS+D8Q8iKeaSzi8XuqAyekaCuc9H9DLYbc=;
 b=EM5Qe0V6Akki9ilSurkQJ/a3S+rpowIoF6rqkt0PvstLfWEcVEZbt4A7TwlG5aahm6
 0vXBrw6BgORxIpR71hHVgmH49KzpWKRyXAqS8Yd/QHOBsnh6ZYO0A+oFQPaQxu1ZEJYd
 7cAwL4Rr4vr4IdOYW9kTPayct1ZMK+E3KVrLe1a36xsvGXXg7jznIvE7qScxq9T5z3sN
 wsI/8Fo+7uj/1cQxTc4jOqnJU/andLLS4i5lAaPKEA8y76eolUi733LBRtswcP1yG5Lb
 KtjH4WFdJ2+k6TTJz3dGbZ49TluGxCwueioB0WtQfycgO51Hv5/WzJdRSt2SQ/isNANu
 d5SA==
X-Gm-Message-State: ACgBeo2qrqdWwsnN62wcZ8okwj2SSrUycgklcwtvFDuAf7laqhx2VYUn
 4xL8uxxbU+5ZQmzkcODvDvrJjWyWTW8=
X-Google-Smtp-Source: AA6agR6KlU+xRZ2lkZP2HppMEyj38xUjcrmF2XbzsyhEkWSoBlawKVR+FaBgroKzTEyBH2FLgMiS4w==
X-Received: by 2002:a17:90a:6b0d:b0:1fa:c6fe:db6 with SMTP id
 v13-20020a17090a6b0d00b001fac6fe0db6mr7432037pjj.99.1661334208035; 
 Wed, 24 Aug 2022 02:43:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH 44/51] tests/qtest: microbit-test: Fix socket access for win32
Date: Wed, 24 Aug 2022 17:40:22 +0800
Message-Id: <20220824094029.1634519-45-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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

Sockets on Windows do not use *nix-style file descriptors, so
write()/read()/close() do not work on Windows.

Switch over to use send()/recv()/closesocket() which work with
sockets on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/microbit-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index b71daae9a9..4bc267020b 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -51,7 +51,7 @@ static void uart_rw_to_rxd(QTestState *qts, int sock_fd, const char *in,
 {
     int i, in_len = strlen(in);
 
-    g_assert_true(write(sock_fd, in, in_len) == in_len);
+    g_assert_true(send(sock_fd, in, in_len, 0) == in_len);
     for (i = 0; i < in_len; i++) {
         g_assert_true(uart_wait_for_event(qts, NRF51_UART_BASE +
                                                A_UART_RXDRDY));
@@ -77,7 +77,7 @@ static void test_nrf51_uart(void)
     char s[10];
     QTestState *qts = qtest_init_with_serial("-M microbit", &sock_fd);
 
-    g_assert_true(write(sock_fd, "c", 1) == 1);
+    g_assert_true(send(sock_fd, "c", 1, 0) == 1);
     g_assert_cmphex(qtest_readl(qts, NRF51_UART_BASE + A_UART_RXD), ==, 0x00);
 
     qtest_writel(qts, NRF51_UART_BASE + A_UART_ENABLE, 0x04);
@@ -97,17 +97,17 @@ static void test_nrf51_uart(void)
 
     qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x01);
     uart_w_to_txd(qts, "d");
-    g_assert_true(read(sock_fd, s, 10) == 1);
+    g_assert_true(recv(sock_fd, s, 10, 0) == 1);
     g_assert_cmphex(s[0], ==, 'd');
 
     qtest_writel(qts, NRF51_UART_BASE + A_UART_SUSPEND, 0x01);
     qtest_writel(qts, NRF51_UART_BASE + A_UART_TXD, 'h');
     qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x01);
     uart_w_to_txd(qts, "world");
-    g_assert_true(read(sock_fd, s, 10) == 5);
+    g_assert_true(recv(sock_fd, s, 10, 0) == 5);
     g_assert_true(memcmp(s, "world", 5) == 0);
 
-    close(sock_fd);
+    closesocket(sock_fd);
 
     qtest_quit(qts);
 }
-- 
2.34.1


