Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4AA3AB319
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:57:38 +0200 (CEST)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqeP-0005D1-RC
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqb6-0007U5-KD
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqb5-0005Mp-2q
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id e22so2861829wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePgJDFFOw4rGg/va2x01kE3ubJf7MZ1h52aSuruLrco=;
 b=HnNmlRALfMLH2OE+ckY37Pm42oO7kVbaezU//2KLKTCN1Sv4SBCZ8MLb2qXOylccdX
 3axcG7n9mHxmzJJi6rvWaz0Cf/ZSygugBKywmAPdZNQzEF6MbZqW1paXCceiaVyQbhEs
 yk5pHXgAdZtpXOXw2O1cgQ5PtGM2mZoEv0Kk923tf2777S7uySiGgaFoDa+/k5XPcml8
 BjHbThrXV6LYdx6OzBb7LkrdqOMVgCzVULxHkI20WlPQHiQBpJrDPXaHrCGbpQxv0dpZ
 B1vVsMAhrc04GD4KoBqECRGMIU64zVnSaV7YIkQIcMnB7a/REGpEY0HYeYtoxxs6nEzu
 NJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ePgJDFFOw4rGg/va2x01kE3ubJf7MZ1h52aSuruLrco=;
 b=IwFw3bTxjeYIti5eBl7Jav9WM4HrM402/Smg+BQrg1CCJj5MJUabrWPXo0IGip22rd
 XivqKGFPan0hvUqgKMaDVnP4+DZVZC2JSdLfb9svDnVIY/JYQWree4U7tCaU63JbM1LQ
 Sq9LRMz4reniS6Yu8XTl2+NPXgZkJa3E+Ey4+9wIcD+VkKNvNEO7vAQKQ23KPJ+mSJWO
 /Hw/cpjcUaiQyVHqbiKyJQqwVmsq/8hLVeKvrqmQZqFOwM0QUruyJE5a1XHmWweMcLOn
 pNhs3NdKYyuXqjFmi+djYO+dUozvu6NkOCgEVslCAFGNxSbdzHgaKp59gETua5Dj0ieE
 Et3A==
X-Gm-Message-State: AOAM531+07ePBnC7I0qeX/7zhN7v+mLQHfaOp0ygeMzomDI9/Wn+vmjO
 b976WJFBdmKeI536TjlXf4oH8+j4Pm/jzQ==
X-Google-Smtp-Source: ABdhPJzo3GW4MCp+ya2yUhB9nqqkgHhkW4zzJmMBoU+eZC81lsQJ4Z7tNOPrzcpZRWwq7Jvjs6Y+Bw==
X-Received: by 2002:a5d:5903:: with SMTP id v3mr5164227wrd.285.1623930849399; 
 Thu, 17 Jun 2021 04:54:09 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t16sm5340426wmi.2.2021.06.17.04.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/15] hw/misc/auxbus: Fix MOT/classic I2C mode
Date: Thu, 17 Jun 2021 13:53:26 +0200
Message-Id: <20210617115334.2761573-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
uses incorrectly the direction of the transfer (the last argument
is called 'is_recv'). Fix by inverting the argument, we now have
is_recv = !is_write.

Fixes: 6fc7f77fd2 ("introduce aux-bus")
Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 6c099ae2a2d..148b070ce4a 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -139,7 +139,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -170,7 +170,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         }
-- 
2.31.1


