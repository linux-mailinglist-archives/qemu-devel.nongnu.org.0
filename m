Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4595BE68A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:58:55 +0200 (CEST)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacpt-0000mA-P9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZM-0001Lo-CX; Tue, 20 Sep 2022 06:33:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZK-00050J-Rn; Tue, 20 Sep 2022 06:33:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso6330010pjk.0; 
 Tue, 20 Sep 2022 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=Z4owo7vrx89r1gRzYcIT4A5Mhg6AIFeduPasKpaIp6TH3zpWkVKjDgAUXNfv8NX+SZ
 6MtdQJ8qL30RCqAnjElvVnyMyxmXxuoxpkFDrQzHEdrU9kiLF5EN7dthAeAj4rHpcHGn
 cABxHPo3mV45NZGGDy2bUTfh3ksyskG0NxkyV1bUYQyjxh1o2LdKEhtBBdkLDrHLpJVo
 VKOZsXM+KrWWfcS73eqrxwZBV/SqHw1SNatT1D4Im7gedVMzI7JRnmr0cODelrqL03EN
 Ts1OIK1qT+b+q725/EQHmxAvgQVXie9sYmn+uQbhiLLOvrTILZ1qpkkAZc5WLXH3UB5B
 iESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=XRPRhu0fhaTKBFXs+1OZWjr4eCPKv7gPiT+p6aYFRlRQ4/+vfLdVtYIFFa14Ir8K4W
 pgpRmlzBXCcXmSxrNkC+N6dvcS6eWgsXeBCFCkqD93VsCzMe2aOMDYMkiohNJGQkR9R4
 KwlkhD7/xb8h/8WFmz8A2gVgfBvfRN1r6HwzjREL4QSXXnBqdW1Hx5hpdtultZ9PE1ME
 q+kpvZzS8HyNhJAGP0EcbK4wqfW/H10vuV5zJ5BPv4ql3YwhTpQweV4m+VNcqcosW+fm
 rhBvmbE5KEip7Cw8IqiX+SlB7RiqNgyOj7uMETyXDadWecQVVvwwhVJE0fb0vXLRbOPA
 IP+Q==
X-Gm-Message-State: ACrzQf3M2bKSMWh7boo1Hi25YFyG/RACK42EZZyQqIEU8RHeSiDB6Uf3
 /BL8l5Nn4DRAUnQuRcmlIv9x+7hUId8=
X-Google-Smtp-Source: AMsMyM7jveWXzUDw4xGD+YxsHD9EC4ar4wzRHYsndHgDsfFVgSTVVAxgrQKsG3Y0XlrqX6rAZlPzpA==
X-Received: by 2002:a17:90b:1b4d:b0:202:c05f:6ea0 with SMTP id
 nv13-20020a17090b1b4d00b00202c05f6ea0mr3193274pjb.7.1663670012840; 
 Tue, 20 Sep 2022 03:33:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 29/39] tests/qtest: microbit-test: Fix socket access for
 win32
Date: Tue, 20 Sep 2022 18:31:49 +0800
Message-Id: <20220920103159.1865256-30-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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


