Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310225E932C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:43:03 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQyJ-0005Tr-1l
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsE-0003Ph-6J; Sun, 25 Sep 2022 07:32:38 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsC-0006SV-Iz; Sun, 25 Sep 2022 07:32:37 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r62so390384pgr.12;
 Sun, 25 Sep 2022 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=ckQm1fbAl9t6B4cGBfQxqm7V7vseIckI5swjAOXzsBs5s2ph+lRuq6Yk6bxqFM/8nl
 MeX9A0d8aMxtMyWQWjez1bup8rizgea+bBdYMvZA8xcPrK/EVLFAq56e69ZJ+CvRz6Ta
 uaZmHeKf5NZa0Mdjkpdc/iWIkTEdLPZTCVlK5xX9RMQmpCHJII+4ngNn2NFN82VVL5zp
 QevNsje6x9Rhhx8woqENCMndCI0WpWWKIjcghKO6xgdXSuEQiOnmoHjsEqGf6nTXP1j6
 6NQ7XjH3b8hmXNnfU4vOPipGbvbYG4IZaVkTUl3d9FRgxs5BH1uMhBR2p4VuFcSOYNV6
 Cbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=haUwKDLqAD+Sa0JbXHBovarSdK87o7kjCvQK49Fq0R0uOH6Ldi9WfHXj/iRtrqJqTD
 ymfCItcNGMeV5k5sL+Cn3ao3z7vEeoLb1Obu3Xl7niwEkMjZ9jLQTU7F2wL5hpTvgYon
 QR+mlXk/ZciloPNPYt3pVvtMc3BxoMSeE0mg5GU1BbcvA5kyRvHKAyvBd6grYPuuRPpE
 LUNcQH5AUewaaJE64Gk7nhDn/PmamC/Olk/W3sR2SM1DSW4E5vhxb70GHAv/rm4DlSQz
 FdcnFeFB9ZEjqR68Wz5fdKsGjM7EGgcqpsYm8XOftCAcWfSmV1kxcDUexBSDHbrj3LZZ
 M1Eg==
X-Gm-Message-State: ACrzQf27LuULOV6w430v1YrLnDXGPvJ1Iw/5q+8b2sVN/GF7MJBGjWB1
 MNAKHYmgMCzrkYO5OkLAxciZYu+Oi3w=
X-Google-Smtp-Source: AMsMyM4oL0h8hnl2A8YK4HFYPQRMitc7/hF9PEg9p+IEuijli9f6v69p/RHyauZtbZWczZ3M2VGW7w==
X-Received: by 2002:a63:31d6:0:b0:43a:1129:e485 with SMTP id
 x205-20020a6331d6000000b0043a1129e485mr15393067pgx.177.1664105555146; 
 Sun, 25 Sep 2022 04:32:35 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v3 44/54] tests/qtest: microbit-test: Fix socket access for
 win32
Date: Sun, 25 Sep 2022 19:30:22 +0800
Message-Id: <20220925113032.1949844-45-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Sockets on Windows do not use *nix-style file descriptors, so
write()/read()/close() do not work on Windows.

Switch over to use send()/recv()/closesocket() which work with
sockets on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

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


