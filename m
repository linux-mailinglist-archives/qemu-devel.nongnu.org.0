Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B682306DAA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:38:05 +0100 (CET)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50wO-0004q8-CN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pU-0007G1-Ik; Thu, 28 Jan 2021 01:30:56 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pS-0001DE-OE; Thu, 28 Jan 2021 01:30:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j11so165739plt.11;
 Wed, 27 Jan 2021 22:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+nUxbD7OBql8LM3iJZPpv3YM4qCKFlEktpo4pY1M1Y=;
 b=X94N42WMt/FwAX7RlK/OfiC4MxzYJB49qBMG0B8tQQjhbvYfD3enV1FpkAWfk9kxK7
 4f7rVdSxf1ieikFZm2Dtro7SyJ8Qqn8zZM7XhFjQS3rH4JZ6AMPh7FC04Vyts5AnyGqZ
 YBg0rGPQkV97k7T6yfSkvLRrOZ8JQZAT8tsepEFEKzCU8kL5DOtBbPOi/XpjI21T+8pI
 BO5kN46AoAmj6bKGkND0+isrwz9nbQS49GbWfeRffyPSnBm+lOtSeo8VMb3Ej+GTijYz
 RMR5N3+LR4nww42gL4GpwDM7/HHJ/5EfCiAG8BnMFB5+Cy2jtLwYVDrczlCkD6jtI4wR
 GE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+nUxbD7OBql8LM3iJZPpv3YM4qCKFlEktpo4pY1M1Y=;
 b=EoT9Y78MCrIpa/vbyhp/VIvuR+IKJZ+X0F4B1tgqJu+eGJS/XoVkZDv4uxvQSznr5G
 npoaXm2Pq0DHv2La+FXC2ElE606H0GSXMiCFx6cwd8Y21yf0qPHxfo8faZNMrJr2IXi2
 uFdcNqPGfBKQ/dgjvTWWTT4uQEm4OqMqir5ziqHULWw9iZk23IgI61Dq4GQqMO+hzfIp
 pRJsjVC8GF9SF8qNejKVFAqdhmkPvA8MDPjoT05rIICXX6hkFCChWmOAI5yfFEeIt4vH
 dzgnzA9B87sBFxl+P75a3nQ2gAtgcyQs7hTEmoejeWdOaQYwdADc9wFr96ayQrVh0/7b
 j94Q==
X-Gm-Message-State: AOAM532LQLv5brs7avSOdsakojoSrG5csPprhFPyU4XuO29I9zhlgnc4
 0ILGHZM3fsqGCnQKH4PVXI8=
X-Google-Smtp-Source: ABdhPJwdKGANXyRFj9pfZf2dw3X9vayyNdaU+XkHWVNIdoe8zW6CoGLnwH+BbcWeBLyFwXnF8fSvbA==
X-Received: by 2002:a17:90b:370d:: with SMTP id
 mg13mr9707075pjb.161.1611815453147; 
 Wed, 27 Jan 2021 22:30:53 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:52 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 4/9] hw/sd: Introduce receive_ready() callback
Date: Thu, 28 Jan 2021 14:30:30 +0800
Message-Id: <20210128063035.15674-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present there is a data_ready() callback for the SD data read
path. Let's add a receive_ready() for the SD data write path.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 include/hw/sd/sd.h |  2 ++
 hw/sd/core.c       | 13 +++++++++++++
 hw/sd/sd.c         |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 05ef9b73e5..47360ba4ee 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -116,6 +116,7 @@ struct SDCardClass {
      * Return: byte value read
      */
     uint8_t (*read_byte)(SDState *sd);
+    bool (*receive_ready)(SDState *sd);
     bool (*data_ready)(SDState *sd);
     void (*set_voltage)(SDState *sd, uint16_t millivolts);
     uint8_t (*get_dat_lines)(SDState *sd);
@@ -187,6 +188,7 @@ void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length);
  * Read multiple bytes of data on the data lines of a SD bus.
  */
 void sdbus_read_data(SDBus *sdbus, void *buf, size_t length);
+bool sdbus_receive_ready(SDBus *sd);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 08c93b5903..30ee62c510 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -160,6 +160,19 @@ void sdbus_read_data(SDBus *sdbus, void *buf, size_t length)
     }
 }
 
+bool sdbus_receive_ready(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->receive_ready(card);
+    }
+
+    return false;
+}
+
 bool sdbus_data_ready(SDBus *sdbus)
 {
     SDState *card = get_card(sdbus);
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 946036d87c..c99c0e93bb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2037,6 +2037,11 @@ uint8_t sd_read_byte(SDState *sd)
     return ret;
 }
 
+static bool sd_receive_ready(SDState *sd)
+{
+    return sd->state == sd_receivingdata_state;
+}
+
 static bool sd_data_ready(SDState *sd)
 {
     return sd->state == sd_sendingdata_state;
@@ -2147,6 +2152,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     sc->do_command = sd_do_command;
     sc->write_byte = sd_write_byte;
     sc->read_byte = sd_read_byte;
+    sc->receive_ready = sd_receive_ready;
     sc->data_ready = sd_data_ready;
     sc->enable = sd_enable;
     sc->get_inserted = sd_get_inserted;
-- 
2.25.1


