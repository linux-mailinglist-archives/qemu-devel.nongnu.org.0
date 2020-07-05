Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35792214F9F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 22:52:18 +0200 (CEST)
Received: from localhost ([::1]:52448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsBcX-0003dO-8E
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 16:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBXB-0004kj-Tc; Sun, 05 Jul 2020 16:46:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBXA-0000q9-6d; Sun, 05 Jul 2020 16:46:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id f139so39591232wmf.5;
 Sun, 05 Jul 2020 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9r/UuMNriotkB9gXNJa6dykrAj3Jm9YA/tEThvkByFI=;
 b=XCFxlx/+OKFUTT9H1bSYw9a34DB2DnStTMlRHTeJX+STyC3PCjjO6V4LueXAeuWddy
 mgVcF+yjl91IJSQbwjl4ibglXO73LXhtdpsigv8VrUe+ksLjdaP0EC+TJgRTS0kFAONO
 tsW9hgiuz/pZVTGJox/JHUXsbzuyuvOZVO9B1PEINypJs+r3m/X2rOVju6cXQ0ddn5Po
 ArWyos2HTJ2ZBkrqZIhHYfpvOdiLNQeSSuyvwSkYP+Qa0yCpMVZej4R/0iyLUKQ2wknS
 8d6zLwLsVS1NS/XtpDx9ROCM8uhYGuO56ymKVHDafSMsHk1vLYYfUXuHuk8ochExs8+z
 kfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9r/UuMNriotkB9gXNJa6dykrAj3Jm9YA/tEThvkByFI=;
 b=KAHsc0I3tNmPElpY/MQRvpdfjdB1Kbksx/95jOWRV+/qVyyjsvoGXABddwMcD0sYv7
 4X1zxL6DNg6MyXz4w8utfSGQ3T8PwxMrwoBAsHd4iSo2hS4PqLKmevniTH8VZXdU6wmq
 jZMlsap+uKDDakewP2FK8qXEcCIULHE/nOIBkHvvZm+bMsbVfUW16uS4w78qHiFYnHkI
 gfDdba2jBj8VmqsYsbwyTUTUN+FC0YvppWYDaTeccQ5frPHsczVi/0PQegBV9t9OR0EE
 c/oFu4/9l3e0qwTtdOxo7di02megZzv/Tp3UcJAFJXjmWCFAxKmMrRK8RZ3+pjoBAMOg
 QFIQ==
X-Gm-Message-State: AOAM530Q1r846H1F28sV7mM5DJVfmomqx9QiD4FV/feQvoGUg+iTrt8+
 i678xVWAdsuDRDiJ+VeCYjDpCEBC5nI=
X-Google-Smtp-Source: ABdhPJyE7dTtryLtaSUYdhYaKoVGMGVmflRl2pVmy6IPbvISfh4+5Id0+WwPDEvWgbtN0G0g0KTCPw==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr47109373wml.95.1593982002099; 
 Sun, 05 Jul 2020 13:46:42 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/10] hw/sd/pl181: Replace disabled fprintf()s by trace
 events
Date: Sun,  5 Jul 2020 22:46:28 +0200
Message-Id: <20200705204630.4133-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
References: <20200705204630.4133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert disabled DPRINTF() to trace events and remove ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pl181.c      | 26 +++++++++-----------------
 hw/sd/trace-events | 10 ++++++++++
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index f69488ebac..574500ce60 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -17,15 +17,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-
-//#define DEBUG_PL181 1
-
-#ifdef DEBUG_PL181
-#define DPRINTF(fmt, ...) \
-do { printf("pl181: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
+#include "trace.h"
 
 #define PL181_FIFO_LEN 16
 
@@ -158,7 +150,7 @@ static void pl181_fifo_push(PL181State *s, uint32_t value)
     n = (s->fifo_pos + s->fifo_len) & (PL181_FIFO_LEN - 1);
     s->fifo_len++;
     s->fifo[n] = value;
-    DPRINTF("FIFO push %08x\n", (int)value);
+    trace_pl181_fifo_push(value);
 }
 
 static uint32_t pl181_fifo_pop(PL181State *s)
@@ -172,7 +164,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     value = s->fifo[s->fifo_pos];
     s->fifo_len--;
     s->fifo_pos = (s->fifo_pos + 1) & (PL181_FIFO_LEN - 1);
-    DPRINTF("FIFO pop %08x\n", (int)value);
+    trace_pl181_fifo_pop(value);
     return value;
 }
 
@@ -184,7 +176,7 @@ static void pl181_do_command(PL181State *s)
 
     request.cmd = s->cmd & PL181_CMD_INDEX;
     request.arg = s->cmdarg;
-    DPRINTF("Command %d %08x\n", request.cmd, request.arg);
+    trace_pl181_command_send(request.cmd, request.arg);
     rlen = sdbus_do_command(&s->sdbus, &request, response);
     if (rlen < 0)
         goto error;
@@ -201,16 +193,16 @@ static void pl181_do_command(PL181State *s)
             s->response[2] = ldl_be_p(&response[8]);
             s->response[3] = ldl_be_p(&response[12]) & ~1;
         }
-        DPRINTF("Response received\n");
+        trace_pl181_command_response_pending();
         s->status |= PL181_STATUS_CMDRESPEND;
     } else {
-        DPRINTF("Command sent\n");
+        trace_pl181_command_sent();
         s->status |= PL181_STATUS_CMDSENT;
     }
     return;
 
 error:
-    DPRINTF("Timeout\n");
+    trace_pl181_command_timeout();
     s->status |= PL181_STATUS_CMDTIMEOUT;
 }
 
@@ -262,11 +254,11 @@ static void pl181_fifo_run(PL181State *s)
         s->status |= PL181_STATUS_DATAEND;
         /* HACK: */
         s->status |= PL181_STATUS_DATABLOCKEND;
-        DPRINTF("Transfer Complete\n");
+        trace_pl181_fifo_transfer_complete();
     }
     if (s->datacnt == 0 && s->fifo_len == 0) {
         s->datactrl &= ~PL181_DATA_ENABLE;
-        DPRINTF("Data engine idle\n");
+        trace_pl181_data_engine_idle();
     } else {
         /* Update FIFO bits.  */
         bits = PL181_STATUS_TXACTIVE | PL181_STATUS_RXACTIVE;
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 5f09d32eb2..a87d7355fb 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -62,3 +62,13 @@ milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value
 # pxa2xx_mmci.c
 pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
 pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
+
+# pl181.c
+pl181_command_send(uint8_t cmd, uint32_t arg) "sending CMD%02d arg 0x%08" PRIx32
+pl181_command_sent(void) "command sent"
+pl181_command_response_pending(void) "response received"
+pl181_command_timeout(void) "command timeouted"
+pl181_fifo_push(uint32_t data) "FIFO push 0x%08" PRIx32
+pl181_fifo_pop(uint32_t data) "FIFO pop 0x%08" PRIx32
+pl181_fifo_transfer_complete(void) "FIFO transfer complete"
+pl181_data_engine_idle(void) "data engine idle"
-- 
2.21.3


