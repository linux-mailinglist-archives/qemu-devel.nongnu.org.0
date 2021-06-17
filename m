Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE253AB327
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:01:35 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqiE-0003em-F5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbB-0007gT-0T
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqb9-0005OT-He
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id v9so6462869wrx.6
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mF7eiAdIfTv9rlxceo15bFIxRiqB6zGPW3KZaJR5WqY=;
 b=JPiiubiExRrQKBsdszp7UUvTYYhP0JJkS8zd/Voextvc83gla6v7bKo/p9EuBXcTHK
 kK6LtQeWATZc8kBPBsAoV6UpFkPVlfDe0MH7/+C6LwAcvJwny6UdrKjniGQEADe2Ebf6
 w3pSKIQ0wIAxctL2tj30eKV5yPO7gl5RpeQjNqRYOd8cO2yQeKlDpgxHgdoQLkQRfp5c
 Q2gp2C6hXQXfRHpBxN3tFgqzfUJ5JXtxJTudZYt5OibUyQc+rTrFaxfahfwumD3NAhCP
 E2O2UH+O/77PYxgOFxbUAB4nvWZmdHA4Uk+fW93aHDP62WvLDnkfbynccnZy3PRxIOov
 LEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mF7eiAdIfTv9rlxceo15bFIxRiqB6zGPW3KZaJR5WqY=;
 b=X0tEtx8a5g/KciSv47VRcwqYRS/N8oyFKxr1AY+FX1hOkjzwYaELiRtj50fq9eRCQN
 T+D75Xj7/I3hoWrp8Nh87wBGBJc9oscwYBe5GcsGJCx3DR3teubnzZvfXVWPIjpAyFWJ
 nnKBRX20RH6inxcISMC4kocrWAUKQthvV6aDWkpJCzLeqzRwT4+d3MIDuLoSRNoxj7GZ
 cjkbGjmCl2M6ysII3R0A0WrjpJ+rLVrDceZMGFwR8IxyArpgDI00UfHsXlVuUtQtvu3o
 EWCLClm0EqpIpQqyRDCs9p2BcDTtu922TLcNJ3d50o6Qi7KCdTNGo4CFB3iY3igbRCTZ
 j/eA==
X-Gm-Message-State: AOAM532kebthDgqKy+gE8Zzmj/zs5CDcaQp5x/oiJqg5+hTkTfxr5UWa
 7UWiEpONkfXH0WS2Fme3PGg5XkS91eifCw==
X-Google-Smtp-Source: ABdhPJy7L9o0KzEjyXX1qK62ulMKIaKv2GZAJCvx2gqqCFd3u/qYax0aNC2uDu0Z8yii393mGwUAdg==
X-Received: by 2002:adf:a1c1:: with SMTP id v1mr5230119wrv.234.1623930854005; 
 Thu, 17 Jun 2021 04:54:14 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q3sm5353360wrz.71.2021.06.17.04.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/15] hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT
 cases
Date: Thu, 17 Jun 2021 13:53:27 +0200
Message-Id: <20210617115334.2761573-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

To allow further simplifications in the following commits,
start copying WRITE_I2C code to the READ_I2C, and READ_I2C_MOT
to WRITE_I2C_MOT. No logical change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 148b070ce4a..9cc9cf3be32 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -133,6 +133,26 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      * Classic I2C transactions..
      */
     case READ_I2C:
+        is_write = cmd == READ_I2C ? false : true;
+        if (i2c_bus_busy(i2c_bus)) {
+            i2c_end_transfer(i2c_bus);
+        }
+
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            ret = AUX_I2C_NACK;
+            break;
+        }
+
+        ret = AUX_I2C_ACK;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                ret = AUX_I2C_NACK;
+                break;
+            }
+            len--;
+        }
+        i2c_end_transfer(i2c_bus);
+        break;
     case WRITE_I2C:
         is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
@@ -163,6 +183,39 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      *  - We changed the address.
      */
     case WRITE_I2C_MOT:
+        is_write = cmd == READ_I2C_MOT ? false : true;
+        ret = AUX_I2C_NACK;
+        if (!i2c_bus_busy(i2c_bus)) {
+            /*
+             * No transactions started..
+             */
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        } else if ((address != bus->last_i2c_address) ||
+                   (bus->last_transaction != cmd)) {
+            /*
+             * Transaction started but we need to restart..
+             */
+            i2c_end_transfer(i2c_bus);
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        }
+
+        bus->last_transaction = cmd;
+        bus->last_i2c_address = address;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                i2c_end_transfer(i2c_bus);
+                break;
+            }
+            len--;
+        }
+        if (len == 0) {
+            ret = AUX_I2C_ACK;
+        }
+        break;
     case READ_I2C_MOT:
         is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
-- 
2.31.1


