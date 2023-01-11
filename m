Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F93665695
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWot-0003Rt-Ou; Wed, 11 Jan 2023 03:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoj-0003Jt-NC
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoh-0007hK-Kt
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d17so14307800wrs.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1k/7mPGH5gDcWWku0OjBNNAk942aGuA5NQSFVWJSqE=;
 b=YdQP44UzORDUM2gwiED1ZAncZYIEgNPk70Z3okWesFAwhaGWfhuhu6JLrgH40cEJtF
 TTpCt2psGRmAcEKuYxWBi3EjnyH0zeyDXAtc1wfDFYIwUr/Sc08EVNfeS5pYFF/86aCm
 0LcYjO11dWnRTvtqy+jX5yd3a8YKoLpnOn67MkbtcDjix9WTJLdrcvxpT3I66SlMo9Dm
 uQjc4WCRLuhxjVvTmQDGprBglJYCqQOVZJ+hKrnM2KxqxLyeFjJzJ3VS/JdE55ZjnAZl
 rd/dTscwK1UsoJU3wbYzAOr1OqVCFqhpBkXJ+FFvE/+RsOEqMOJxdSWhfsauAaWxbHLz
 FaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1k/7mPGH5gDcWWku0OjBNNAk942aGuA5NQSFVWJSqE=;
 b=G8islpwpYhiqsiigudBM/qRCi0c15EZh86kDlmf53NK8wC1/E6iEmEiVEA16n6qdNH
 ijIvFMI3tpYXcKNHQ9MQ2UdOZ6VxA5MeP4TifKbG6YXmd7JsT4upWbpPrrazrvQloc93
 HUjMboaCxr1bDa6nWA8Pad4edpOFCtdU+AfVMLjbWmVwzFu0+FGWTDHsvb7xakItG9/Z
 yUDCUUF+hC24OyUQ6B+kE7NWr7pdHeSXzhQBQyqZtmEZ1waxtj9uuaf9M+yIQdWFNWRE
 AbbYRKkgwkPegSOufZNceRYchnsSb0yQGdZr8xY0uy9L7IxNEs8IXhW6EuikDWXZ30Tm
 0VNQ==
X-Gm-Message-State: AFqh2koqwD259tI1xOE1tZyj89Dyj3smjkUaJlo4AFMN7ZCz4V9aDRYS
 Uilh2G013l6kDvbjTYMhj4frIsm2i7yrTpbE
X-Google-Smtp-Source: AMrXdXvLPAAKcHV8R87KoUQzAUQdVq6/x2i8Rm3Xz9N0drkvk7SF6WV8XxLuQdMTSvAt99FC6MS35g==
X-Received: by 2002:a5d:4587:0:b0:27f:a81:b819 with SMTP id
 p7-20020a5d4587000000b0027f0a81b819mr40538188wrq.22.1673427037903; 
 Wed, 11 Jan 2023 00:50:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b002683695bf97sm13029515wrx.58.2023.01.11.00.50.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/5] hw/i2c/bitbang_i2c: Trace state changes
Date: Wed, 11 Jan 2023 09:50:15 +0100
Message-Id: <20230111085016.44551-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Trace bitbang state machine changes with trace events.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 33 ++++++++++++++++++++++++++++-----
 hw/i2c/trace-events  |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index bf4b781393..efc49b7502 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_BITBANG_I2C
 
@@ -26,15 +27,41 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+/* bitbang_i2c_state enum to name */
+static const char * const sname[] = {
+#define NAME(e) [e] = stringify(e)
+    NAME(STOPPED),
+    [SENDING_BIT7] = "SENDING_BIT7 (START)",
+    NAME(SENDING_BIT6),
+    NAME(SENDING_BIT5),
+    NAME(SENDING_BIT4),
+    NAME(SENDING_BIT3),
+    NAME(SENDING_BIT2),
+    NAME(SENDING_BIT1),
+    NAME(SENDING_BIT0),
+    NAME(WAITING_FOR_ACK),
+    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
+    NAME(RECEIVING_BIT6),
+    NAME(RECEIVING_BIT5),
+    NAME(RECEIVING_BIT4),
+    NAME(RECEIVING_BIT3),
+    NAME(RECEIVING_BIT2),
+    NAME(RECEIVING_BIT1),
+    NAME(RECEIVING_BIT0),
+    NAME(SENDING_ACK),
+    NAME(SENT_NACK)
+#undef NAME
+};
+
 static void bitbang_i2c_set_state(bitbang_i2c_interface *i2c,
                                   bitbang_i2c_state state)
 {
+    trace_bitbang_i2c_state(sname[i2c->state], sname[state]);
     i2c->state = state;
 }
 
 static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 {
-    DPRINTF("STOP\n");
     if (i2c->current_addr >= 0)
         i2c_end_transfer(i2c->bus);
     i2c->current_addr = -1;
@@ -73,7 +100,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             return bitbang_i2c_nop(i2c);
         }
         if (level == 0) {
-            DPRINTF("START\n");
             /* START condition.  */
             bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
@@ -122,7 +148,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             /* NACK (either addressing a nonexistent device, or the
              * device we were sending to decided to NACK us).
              */
-            DPRINTF("Got NACK\n");
             bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
@@ -147,11 +172,9 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
     case SENDING_ACK:
         if (data != 0) {
-            DPRINTF("NACKED\n");
             bitbang_i2c_set_state(i2c, SENT_NACK);
             i2c_nack(i2c->bus);
         } else {
-            DPRINTF("ACKED\n");
             bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 1);
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index af181d43ee..2a479c1c12 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -1,5 +1,8 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# bitbang_i2c.c
+bitbang_i2c_state(const char *old_state, const char *new_state) "state %s -> %s"
+
 # core.c
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
-- 
2.38.1


