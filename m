Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384055EC367
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:58:17 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAAC-00023a-8F
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S4-0003Mx-47; Tue, 27 Sep 2022 07:08:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S2-0005Gk-GB; Tue, 27 Sep 2022 07:08:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id cp18so219446pjb.2;
 Tue, 27 Sep 2022 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=RABEUmJw8JGaUOCeN0U+UTu4ceVB12uKJnHa7M1GtXSPS9g2KJ7nCruzCT47MuGKii
 Po8rfI7GuIYB6f3pGi7XfwIzdzE6p4cdRfro4aKxAV8KQpkJj/3MG6niQmyAKfiLUJfx
 2WYL0aPQ4DdnEkF4CObLDh2OtMu0sIPIF767oUYMvL++Um+KaoAi14Vv/Upquqk+ei79
 SFtaLzlonVInx3eXBjyg9ZWpFcS77bja2YidN2yXqJoQhFnYh2Gr/xqcFKrLKRtokl+w
 pKapXjhNO+arEeuCXhogkBfN1C5YXJaK4MeLPmd+FARNts5sOeImEo4hJfSUVSk98uAn
 2XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cdOM1RV7vfdzIOgDlIpgFRBOhfRCBARffZGNXtbDMOw=;
 b=tCxmW0bsrvs3cMAWIJvC48ZndPUPFQx7jqRU01vHE2eVoFk95+OO3Kt4dh7j8UpQA0
 4pP4EGcUo0oufFGv7eBb8A8U73uBZw1BgCQqPGcWVCQ4TAmx3umyL+aMdpkJCoG5NNVp
 45aj2+vVgjjsoO/qL0ix4rtZDKQWP8IDygO1qSx+DFc5ffQQ0Oh+9dH/LjLi0w6iIDA2
 MgbS4xHYFOk+4r09liW4AzmtEDBOcui5Ycjytu0eQ/r1ZKG0I4wZK+vaY9RVfugeztkV
 lPi7YBkIWO72lPvWH2dSQVtC1NUDJ9BjElYueZRnBu0Yd3rXfkXetVsfp84frBg3Qgy0
 eSjA==
X-Gm-Message-State: ACrzQf0vdsm6YaNK2U9mOO8m6NYgcEX4bLrDD7svSFpwy67FVL7U4Nyl
 YAUD03n999gd57xero40Vl9jRXn/3Dc=
X-Google-Smtp-Source: AMsMyM55CJdBpyH2tFA/gc6cL6C2trEv4EIBMpqBmNqgqr3sipluyinxoDZWz8T834wtTaB7e3HbPw==
X-Received: by 2002:a17:90b:4f8e:b0:202:dd39:c04d with SMTP id
 qe14-20020a17090b4f8e00b00202dd39c04dmr4101906pjb.66.1664276911603; 
 Tue, 27 Sep 2022 04:08:31 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 41/54] tests/qtest: microbit-test: Fix socket access for
 win32
Date: Tue, 27 Sep 2022 19:06:19 +0800
Message-Id: <20220927110632.1973965-42-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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


