Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032A677C99
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:36:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzz-0006AB-Vm; Mon, 23 Jan 2023 08:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzX-0005wD-Bc
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzT-0002MS-VO
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:06 -0500
Received: by mail-wm1-x335.google.com with SMTP id q8so9011389wmo.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w55BWEiCagDu8rhFOm3b8OsC2R7luqRvAnPZEXr+dRQ=;
 b=qRn8xLe9R6b8GOWtOqQVwxcoPKV7XoJpE7FRmfruv6HkCNhRX/ThP7Wg3UxPQ4drmA
 9n56YgSYRfjOYoRs9yrxceOlEiCHdu0Om+/Ij2/lTBXsRmhWTltURDTlWgr3axfvB+x8
 5+iAIIrRM9bkpbcj8FMZqeI3HL8FItC+wpU7APLZYejY0HeIS9RkbbnGRz4+iGBj6gHM
 bHaUJ/wVfaNaaUC6ljWnoBB//M//pU0cyB1fZc9TjbKglFmUieYp4lzCjw3QqCROC191
 RNcczzHaxcUw5eHWz89PV3XWxAlDk3bxSXTsY//sGCDdHGG5wejodSDIlsS2G4U3QliC
 2A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w55BWEiCagDu8rhFOm3b8OsC2R7luqRvAnPZEXr+dRQ=;
 b=PHfJ3i0w5M1Ul9jT6sTzD4r7MEwyRX8UMTmIwfNSkmIWkFquX5cu3QaLjBIegw6N5h
 +AvOiO5BPaLfpspJXvUpfmHhJ9A8Nc6xvOGP+MH/37Rpt7btVAdFeLvBXz2M5MOaTphj
 J1hMs/UXqUdFD4gsD8BjiqU5gT5kQySTQuqp0Dy3E0GFqfjj3lmU8YX6pN2KhanTrIZZ
 rgQCWUBEjutSnZ3tRLlyI3Z6eOGKoOY2ALq52vumsiaurnrAWs3Q0G9OaJ64db4/QqBj
 Z++9knfUhW8Tj8zLXb941sGprq48FSHK64VbLw6ygxutg6hMlyl1+Imkk2vbvMPyOpIE
 boDA==
X-Gm-Message-State: AFqh2koGUnzAxt2hic82UuQqcvHm/1wnqv6p61dQITxLm5WCkQyQJbQG
 BEqptY0OGBzWyE3MC8NmKqaElK5XDeXhfmTL
X-Google-Smtp-Source: AMrXdXuUUaqwxWOV3AaELSN+sM8DdrpsCSeVLeAhqyyT9QbjPXXtb+4PdO+d/8ZbgKqv7ftFgrI3Fw==
X-Received: by 2002:a05:600c:354a:b0:3da:1f6a:7b36 with SMTP id
 i10-20020a05600c354a00b003da1f6a7b36mr24330608wmq.0.1674480961489; 
 Mon, 23 Jan 2023 05:36:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] hw/i2c/bitbang_i2c: Trace state changes
Date: Mon, 23 Jan 2023 13:35:33 +0000
Message-Id: <20230123133553.2171158-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Trace bitbang state machine changes with trace events.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20230111085016.44551-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 33 ++++++++++++++++++++++++++++-----
 hw/i2c/trace-events  |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index bf4b781393d..efc49b7502f 100644
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
index 52dbd53a234..48aee4887c4 100644
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
2.34.1


