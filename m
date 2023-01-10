Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11610663C4A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA1E-0006l1-Hy; Tue, 10 Jan 2023 03:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA1C-0006j4-1p
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:30:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA1A-0006Kk-1U
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:30:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ja17so8178981wmb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTYPqD95cY5TwqXLZ5zIgXtmsM6zTeYLc7VV77204BU=;
 b=eggjPYCc4xn/NK5p5yg68Sq4fZyFvEQtpAOmXKiQ0G+NdIfSHKHWSriObpl7Cvz1FE
 9FV40vwFJmLxn02ypMbOi588HbamYm27/7Cf6fjbwGsgN5dE85Fxn65bFleAmA+5ufdq
 xjwBI8Zzs+7HyD/6iBW2ufpD3jylMG29FMO8qFzEgfn/oXxp9QtcSf+Z0gs53AGBxR3V
 +HaXe9wRAXcv9azkxqVxdWQ1p45VMsQDUvOoqU+p4gNTNgqldz/NpSa9/eJs70tM6mt9
 uGnwcS2iDhidHTR8n9yY5gELuhYxtY9PJhSCPnljM/fuTIvjOT2cYxkfvQ4I0OCDmHIU
 ghZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTYPqD95cY5TwqXLZ5zIgXtmsM6zTeYLc7VV77204BU=;
 b=duX4PjxwclOQRMNjQpT0/4KGVamncQ5Y0YFsk2mglzwSVveCyF9zlKwfB1ghejrcFV
 W3PP0R20Kt09bDoZBcak6sP/NLGTiEP9ZOrcGfIhqvc5T/JVMKGChz4/ae9AAeoJs4th
 VHplzps+34mgGeMmwamkETrn5bZTyHV8qMdXqGOGiYxUD1z7tZLxOQn5wyKkZF5DnBMg
 Ntvu2Klzpa90SHNFIXiYr52vDVNGboUsLVyaZSX2VU8QdT+YtK5WtfUhGd3EPJO70UW1
 40eVdMuVET6271AK7LP7vfm+QNkk+OjLNlpWSSe55b2/JtB6hKvAhKtcd19dVq8rDoGZ
 aVmQ==
X-Gm-Message-State: AFqh2kqEh7vGI5yXrw2OSdDqKLknf017InUcAxtVaQva/yaaku0sGQZy
 xDssb5Upb6QOGGzSveLpComfZD7abNUbLxoe
X-Google-Smtp-Source: AMrXdXtcXJe/pm61EsruafLc5p6O8B7f0PR/fGDYkhTtJ81G9ReJXYrc/2ULCFzCAf+eZMYJhRNJgw==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id
 m8-20020a05600c4f4800b003c6f7ff6f87mr49313237wmq.11.1673339398585; 
 Tue, 10 Jan 2023 00:29:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm841192wms.3.2023.01.10.00.29.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Tue, 10 Jan 2023 09:29:32 +0100
Message-Id: <20230110082932.24386-6-philmd@linaro.org>
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

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 8a67ff6fae..d6589f0d4a 100644
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
 static const char *sname[] = {
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
index 2a479c1c12..b0ab237b0f 100644
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
2.38.1


