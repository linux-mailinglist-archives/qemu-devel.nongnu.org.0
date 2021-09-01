Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4FC3FD1BE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 05:29:59 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGwo-0006UX-0o
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 23:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGum-0002wG-Jn; Tue, 31 Aug 2021 23:27:52 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuh-0007Ri-B5; Tue, 31 Aug 2021 23:27:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id x4so1389644pgh.1;
 Tue, 31 Aug 2021 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S6XOMnBqg+q/iZwtkF+R3AtXykZOGfgLhZhWsHmX3Ho=;
 b=ZO/GJwtXodtXPk3GYDAVBqcNc+qE0ZHXbIh7md2iy6m5iGOrMJJNzcWXi7H2T+82xY
 Tl4Joh3fmEMkAWKz1EqHVtGvS/sVZG9v3Rdhr4Xfyurz60xaqB49HrZS98kczwdR6xKY
 UuljagPG9H8EJN822il1ROB8UC+9orYiJ+gWg6R6Z3k2Qerg/qdx5g3NK+V6C94P+k5/
 4NpWAAys0qLFHYhSXSa3qBfccwH4I1TUlZBcf1GhlNGvr+YNAK21U9nlmSBR+JsXGoVu
 IHRMjuVZ+bKkKJWTelEowrqgoXE7+eFb09HcHlccVqh/RXiFmUwLenFyixHo/MljsITC
 nS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S6XOMnBqg+q/iZwtkF+R3AtXykZOGfgLhZhWsHmX3Ho=;
 b=mV8dlnBbRVxmDmZWzz7lX8KPJdk5J0p2sq4TJ5mB0Jiew0UoKFOgZGOOtyqFv7IDVh
 nAZDjyDXc15wObs/Dajvn9fa1gbDeHAuTaD87Ic9u+VwDfAq1aOsz7NoC5HHDgdUnBqD
 dFvV1pxxRzXZAOCzPUO1C6iPs38axsCX2rgW5tfkBWAy8gU0bQJFdmE1KR3YgInirF9R
 FqCaJsU1cvxZ4qOd6hLYn+HktiONxwKvmlaiO51IIGCqtQF1Dfx8C/Nzt1MBS2pfDSgD
 KVGNT/yAJhZtrq20RrGMOfQ32wQggO7+rQo0L9sXSYxeg4SY+SrFShFTfZ5X34GCRrjH
 rsAg==
X-Gm-Message-State: AOAM531Lv8COmTQusWKHLjv4sJIBFDHoWxl29tGqkdOAI3h7PjdibJmv
 Gecc36Lu/jkLrz9oyurkCfI=
X-Google-Smtp-Source: ABdhPJx5tF+09mkPULGsh/KcEkeriuKnyxIjREhKW6v5b3Wj4AiFPgwIY39XfLpJHIUORXsc94qA8g==
X-Received: by 2002:a05:6a00:1a88:b0:407:1f7c:60b9 with SMTP id
 e8-20020a056a001a8800b004071f7c60b9mr3667597pfv.77.1630466865652; 
 Tue, 31 Aug 2021 20:27:45 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when unclocked or
 in reset for uart_{read, write}()
Date: Wed,  1 Sep 2021 11:27:24 +0800
Message-Id: <20210901032724.23256-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901032724.23256-1-bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Read or write to uart registers when unclocked or in reset should be
ignored. Add the check there, and as a result of this, the check in
uart_write_tx_fifo() is now unnecessary.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()

 hw/char/cadence_uart.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 8bcf2b718a..5f5a4645ac 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -335,11 +335,6 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
                                int size)
 {
-    /* ignore characters when unclocked or in reset */
-    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
-        return;
-    }
-
     if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
         return;
     }
@@ -416,6 +411,11 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 {
     CadenceUARTState *s = opaque;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
@@ -476,6 +476,11 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
         return MEMTX_DECODE_ERROR;
-- 
2.25.1


