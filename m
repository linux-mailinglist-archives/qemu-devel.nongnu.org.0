Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94776663C07
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA1C-0006ho-B0; Tue, 10 Jan 2023 03:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA19-0006gx-EB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA16-0006KD-M8
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso11167864wms.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3fAH0u4CO+FRORAz0QlHL8PSjAcVIMkkv12suNzz80=;
 b=kqb4yADbvtKvCnlbrNu9NIj6vjEzfUz7MjJsVWdfHRHd6SVBf7j6Y2l6Aes7kg+kD2
 ttmODfhIPtZ2UOQN3OPJZ+3rRT+n/nnVYzGhYMeUWHny9svEcKlgYOKS9LPcYzOn2YtH
 pTEsFeyNtdqwiSIspy/7REabfK/W1EYM8RoaFL7kKGsI06KOWTDv6h7fyKfDk3t758Za
 rRTlAz+HBn6e7+LgWhFPDnhOoPHz+sb6v23dVQ3n/djjFEHPIVK/3IiBHLMoFyusudj6
 mpg9YXXB99SwHV2vldlwtZXIcBvnLCZsCcctHF7MBJp3iXDaWfvl2QbmRF/f9/L+8j+l
 G3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3fAH0u4CO+FRORAz0QlHL8PSjAcVIMkkv12suNzz80=;
 b=Q17+13NeWW6AUnaG33bxq5cM8IqSNdFz34YRv7gwhYteW6B5Xn5gDAfmGKvsZXSELa
 Yz0y/wA63QPhaAVrkkhTXN5zSbZwurxe1LNCc791EVB/3tsx78CsucOtTXm0XbRrLaty
 xLRu5E6doFVSiGFewx5G+N8fSQ/oIR+fLXlAc8cXKQvlgWqBZcGY1y6XZu6KxdDzPKCP
 ar10RcId1nz5WdBkBeLA7HXgvocJXRhexbULRV+03Nywu9k51yVKGGfF/HjeqXWvws8B
 jAY4vUoA2hd9/lKZqEEwYmfCDKpXZ54+mnmowtvaRumCqJIo9lgU3p7ipf8AQRF523O6
 ebQQ==
X-Gm-Message-State: AFqh2krTeeDG682boMC7GuLjcXzrmeheTcolbB37//FCiZVUTaORDn8u
 LjqEdkp8uuycecUrbi/t6Od0XBJnEcihHpkA
X-Google-Smtp-Source: AMrXdXvX9KUk+f52ZZseG4pI7G3oscEZIqgCkVGIlHJg/uOrQY9Irf/nWXxsAG9NvQzylvr2atVT2w==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr47600987wmj.12.1673339393679; 
 Tue, 10 Jan 2023 00:29:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm20981447wmq.22.2023.01.10.00.29.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 4/5] hw/i2c/bitbang_i2c: Trace state changes
Date: Tue, 10 Jan 2023 09:29:31 +0100
Message-Id: <20230110082932.24386-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
index bf4b781393..8a67ff6fae 100644
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
+static const char *sname[] = {
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


