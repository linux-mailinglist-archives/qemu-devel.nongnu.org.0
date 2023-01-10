Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2A663C08
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:00:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9wf-0005WC-S1; Tue, 10 Jan 2023 03:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wc-0005VU-UX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wb-0004Tp-1k
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:18 -0500
Received: by mail-wr1-x433.google.com with SMTP id bn26so10906852wrb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMTwqkBab9qLw7qsOi2RxqfZ6soVzk4ZQTHI3CEHkGc=;
 b=u3xuOp6W/3B1hAw29XFkYE8PIuOpvIPawpBszSXwSG6oz9rNLXTCtoz02q6xeWyzPf
 4N7EE6Myw2BbFRf1gUp3pJvv7m3/PCVTku0b38dEE67xcCDCA6sGQIWt49ZyY862ipV2
 yLvFkRxvGtBUBmBNHunDTm5jZRpM2qnJ9FPeKjKY8eL+MqFnCet1EjUN1XhKAX8cOcLQ
 QVHSjOJT5mc4X8DrTXOJE+io5Ni42j192E8COzwd9uhvK8ORTUWAFGE5Vp9xKioCtgrR
 CB+csQBC7tLSkI0OkN6DEHj8O8J9iEBNNZ9LE5Og31lWLpa27/bnVjDXEX6yKq3f2a3F
 F6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMTwqkBab9qLw7qsOi2RxqfZ6soVzk4ZQTHI3CEHkGc=;
 b=wEMl1blMNVKUecqWQ4HwOzbtAVe7B72hzbicIk7Jz02x2mClfuCTeeU4IpForh/82J
 1bDmyBcmrrVfso0Ek/gX5n8SCPVQwiTLSCwqljDFu7AuyA/Ln0NCca15SKDADRUKaf1S
 eCICx+j5fEkaNrFtm5QYSRz67stKGqgdDjWwIMaGwQwF94DlouvV2THvUDnG7C5C0ZlI
 zcBFNsE34q1Rfwu6gAnZDM2nMqZs6AjJ/93NsQsBO4Iur7TqmQhKm4KcCImQEGzCLLcK
 4qQXAZu+y67Nox6Q2ISoLORcfcmzhQaGZGrV95AhOX1uw0qOjENN+GQi0nslpFdPA9FW
 AXdg==
X-Gm-Message-State: AFqh2koKqI37trdvwyFdQdwTsML/SslZq6Iok3BnoYKpSvR4DHInGHte
 oowJ6axDlqfh7JqsYqlRHyMga1v7c5cU0J34
X-Google-Smtp-Source: AMrXdXs7yJeUnMWHV2IfW9LR8jvqc5krqkPNZYAtUC1OOm879PONHLaRWwlPFoHDgwNOFXzR5hV2IA==
X-Received: by 2002:a5d:6e83:0:b0:2b3:e803:a041 with SMTP id
 k3-20020a5d6e83000000b002b3e803a041mr11914969wrz.44.1673339114950; 
 Tue, 10 Jan 2023 00:25:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm10392844wrk.105.2023.01.10.00.25.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/5] hw/i2c/versatile_i2c: Drop useless casts from void *
 to pointer
Date: Tue, 10 Jan 2023 09:25:04 +0100
Message-Id: <20230110082508.24038-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/versatile_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 3a04ba3969..52a650f45e 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -45,7 +45,7 @@ REG32(CONTROL_CLR, 4)
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -60,7 +60,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
 static void versatile_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
-- 
2.38.1


