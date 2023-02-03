Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B256689BFA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4f-0006jQ-RQ; Fri, 03 Feb 2023 09:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4T-0006f4-Fq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4K-00054x-87
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j25so1277741wrc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vPVJCWB3C3sZSgsGNanDCbKT7SX6LCAO601kW+euxik=;
 b=FpBIaM3XdddGB2IqZS6R6yqeKLqK6EJv9gHWvP6NcL8r8e3HrOK+f7xwhPDegBBZxE
 7bgdmGRo5q/qvcuhZq4lcYYVDUSbovpuFFy2DEsT3qDQBVx1lpXRosPD1dFpJqpzJSIQ
 gGWEccvvUpTR+0lBRLh1+pMGRrpDe0WmR9BQgosv0saE9wwejkuAS/6MhYeNhngRw2aR
 ZQxPayLjM9eu0jvGBoXR3fOASwhJTDaiaX7VIWbsCbskpBMAMHQGn+9cK0BMRIl0HPYj
 0oVrGK9zam2EVoxb5lgtrqdrsNpLPPlikgMjjHYGcRi5sO/slugTCQUlB1n/1V3HZZLw
 fA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPVJCWB3C3sZSgsGNanDCbKT7SX6LCAO601kW+euxik=;
 b=QwuKdKfgEVT8uCpSMmlaqZVHRgUC/Lo2rd+Kme9EIYpH35Qfuzb6IKvnP9bqQifEr+
 FReG7KDhqlo77llb5VZ9ffY9m2FPaqCdpePtrAREIvp3op6yuQRlwxmcsfExxfJOq41Y
 aCewqYiHMRneWSNO6RgX4X0ow2Jcp8b+xn+YXWA4pS+K+2QX+X3kQftRtWXjm0j2wPsE
 o1uW5uo7H1iEaq2lGRHCDlgbb6FersYviu8sxQFziTqYpT/Wx52nI4n2S2rUKMG8bvBF
 pKEhiS8thuh6C9dz/8eaTUa1PxQUnjqOx6wmuEGQ38RngUuION0m46Ne5RsC7WeqcD2e
 NpqA==
X-Gm-Message-State: AO0yUKXAOGvhNZpQ2Qwa7r/wJBZNXnTs+qYnZe38Wmo+C+xVvVb7bpHg
 SULdkvon6l291Pnr7ufYTxg/ciF6cIzFWpTQ
X-Google-Smtp-Source: AK7set8JjjZnBojYAoZb036LVdh5Ta9k6ZTCZqi4fP63my9/p4AadujjH6zMH5cnZS1RKX2JWnBABQ==
X-Received: by 2002:a5d:5092:0:b0:2bf:9468:340 with SMTP id
 a18-20020a5d5092000000b002bf94680340mr7874118wrt.19.1675434574257; 
 Fri, 03 Feb 2023 06:29:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] hw/char/pl011: better handling of FIFO flags on LCR reset
Date: Fri,  3 Feb 2023 14:29:00 +0000
Message-Id: <20230203142927.834793-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Current FIFO handling code does not reset RXFE/RXFF flags when guest
resets FIFO by writing to UARTLCR register, although internal FIFO state
is reset to 0 read count. Actual guest-visible flag update will happen
only on next data read or write attempt. As a result of that any guest
that expects RXFE flag to be set (and RXFF to be cleared) after resetting
FIFO will never see that happen.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230123162304.26254-5-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ca7537d8ed2..c15cb7af20b 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -92,6 +92,16 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
+static inline void pl011_reset_fifo(PL011State *s)
+{
+    s->read_count = 0;
+    s->read_pos = 0;
+
+    /* Reset FIFO flags */
+    s->flags &= ~(PL011_FLAG_RXFF | PL011_FLAG_TXFF);
+    s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -239,8 +249,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & 0x10) {
-            s->read_count = 0;
-            s->read_pos = 0;
+            pl011_reset_fifo(s);
         }
         if ((s->lcr ^ value) & 0x1) {
             int break_enable = value & 0x1;
@@ -450,12 +459,11 @@ static void pl011_reset(DeviceState *dev)
     s->ilpr = 0;
     s->ibrd = 0;
     s->fbrd = 0;
-    s->read_pos = 0;
-    s->read_count = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
     s->cr = 0x300;
-    s->flags = 0x90;
+    s->flags = 0;
+    pl011_reset_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.34.1


