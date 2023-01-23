Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C7677CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzw-00067l-Vp; Mon, 23 Jan 2023 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzW-0005wA-U4
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzU-0002Mg-1T
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10622400wma.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ajiuKuxh7mBml7IbKxk3IiOiyKWtjxLpWptuFD5vSqA=;
 b=iIvtyJ0ZlaFi6umY76siNSJc+GznIVIm5Xcro+uY59F16XwmbQyecIRg4py1Tyj5ky
 jO+R9c1dyrqrzv2RvNXFz750m4n2ChxFBdnrpMZEFF+wrpZ7GHwHddsP8i2muqPtM6FK
 r2cwtTito0jEKRoykhBcU6QAem2QcVRtr28vF7xdN/bEocBjwDRcMrXAxHnjt3B2D/oy
 EpQ5FE9bbXUDxmClRxlxv/W4iJ7SG8meovUdbm5jtG7AqbBtmjOd9/7Y9tEyAsU4L38z
 Dn8p1hW5tL6g3awXQHNmQzEJAtauGLzNjwUOV6VtXmkvn/iQMkAWdXRlp3kS0D2sKjJT
 0VMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ajiuKuxh7mBml7IbKxk3IiOiyKWtjxLpWptuFD5vSqA=;
 b=ZReGUgk9lH9Gq0kXz2SG4IftEoggesttezdBu3boMZCrugYn1d5CzR5gmT9JECtNgh
 ZnEtArRIognCWPK4i9BbfC2dzkK4brpMR1oqJyJb1fjTky9q8BtAidTNZFQ3Lm0c3aqY
 7cQ3VgD69BG5NcG7to3xVar4T4MaQEnEkEZhROzdnO1C6zNfiLhMAygxY6JwRdtwTvcX
 M3XS6ImzshP8w+Rk4OfggKl2cmEECrIL4QMktJE9RfAJ8t7kP72mT3+Uq2GGxA8qHO42
 KzD7E1rg79nan4GxIUWHuXmLUEIfhueX6KO/ErU79v9MazTinSU8318mKhuxy0z8OY6z
 gR7g==
X-Gm-Message-State: AFqh2kr42eXdwQAGMv239ldFGgQ758vVgU7ksEKPLyTbf5ff6meNDhsl
 gEjmRSywCz4yhmyffljfnPbQWT1tsSG7Ia+R
X-Google-Smtp-Source: AMrXdXvnRE200a1hsI1zhGKqV7Jt0WvLJns2SB8YPaSSmRzqgSmSVawXCmSF6F7+bxxfg+zC0STnzw==
X-Received: by 2002:a05:600c:a29f:b0:3d9:f42c:56c5 with SMTP id
 hu31-20020a05600ca29f00b003d9f42c56c5mr24002311wmb.4.1674480962334; 
 Mon, 23 Jan 2023 05:36:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Mon, 23 Jan 2023 13:35:34 +0000
Message-Id: <20230123133553.2171158-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20230111085016.44551-6-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index efc49b7502f..bb189547651 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -18,14 +18,6 @@
 #include "qom/object.h"
 #include "trace.h"
 
-//#define DEBUG_BITBANG_I2C
-
-#ifdef DEBUG_BITBANG_I2C
-#define DPRINTF(fmt, ...) \
-do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
 
 /* bitbang_i2c_state enum to name */
 static const char * const sname[] = {
@@ -71,8 +63,10 @@ static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 /* Set device data pin.  */
 static int bitbang_i2c_ret(bitbang_i2c_interface *i2c, int level)
 {
+    trace_bitbang_i2c_data(i2c->last_clock, i2c->last_data,
+                           i2c->device_out, level);
     i2c->device_out = level;
-    //DPRINTF("%d %d %d\n", i2c->last_clock, i2c->last_data, i2c->device_out);
+
     return level & i2c->last_data;
 }
 
@@ -137,11 +131,11 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
         if (i2c->current_addr < 0) {
             i2c->current_addr = i2c->buffer;
-            DPRINTF("Address 0x%02x\n", i2c->current_addr);
+            trace_bitbang_i2c_addr(i2c->current_addr);
             ret = i2c_start_transfer(i2c->bus, i2c->current_addr >> 1,
                                      i2c->current_addr & 1);
         } else {
-            DPRINTF("Sent 0x%02x\n", i2c->buffer);
+            trace_bitbang_i2c_send(i2c->buffer);
             ret = i2c_send(i2c->bus, i2c->buffer);
         }
         if (ret) {
@@ -161,7 +155,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     }
     case RECEIVING_BIT7:
         i2c->buffer = i2c_recv(i2c->bus);
-        DPRINTF("RX byte 0x%02x\n", i2c->buffer);
+        trace_bitbang_i2c_recv(i2c->buffer);
         /* Fall through... */
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 48aee4887c4..8e88aa24c1a 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -2,6 +2,10 @@
 
 # bitbang_i2c.c
 bitbang_i2c_state(const char *old_state, const char *new_state) "state %s -> %s"
+bitbang_i2c_addr(uint8_t addr) "Address 0x%02x"
+bitbang_i2c_send(uint8_t byte) "TX byte 0x%02x"
+bitbang_i2c_recv(uint8_t byte) "RX byte 0x%02x"
+bitbang_i2c_data(unsigned dat, unsigned clk, unsigned old_out, unsigned new_out) "dat %u clk %u out %u -> %u"
 
 # core.c
 
-- 
2.34.1


