Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC980320225
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:18:02 +0100 (CET)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFyD-0005zm-NP
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtx-0000YH-St; Fri, 19 Feb 2021 19:13:37 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtv-0005Rp-HY; Fri, 19 Feb 2021 19:13:37 -0500
Received: by mail-ed1-x52e.google.com with SMTP id q10so12714433edt.7;
 Fri, 19 Feb 2021 16:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vf9l8Dn1Veypozrh6l7QkCHwWHZG9oxTlNpxX7vPzt0=;
 b=Lmsi4kJ99L8vcRN5RuitDAkjx9fRGZNpcKWejAcIfr2y4gYZ9URjuTxmRqJhWvlTpK
 dLHAE2mXJEHWdxud9MP3Y8mkAJsWIlLZIkYNNeEjY2Nryp+gniCYg6kSfGWH/EqJm3un
 4+uNkulYfkHEC4lERJ1shsoYuGOXW78cWDdhNqYIGYjlgXC1LvMnwwNkNxaJI15OApW/
 onqvVMnMSZGtG1W5DfhwCvW0Fg/Fps2M3EK00iXEJA3xT2gzJOhbhadqRWy8Bn5Tim7+
 IeXsmkuwGlgtpFWe/doow9wO2rNhgXPH8yOMgEw7r8EB2ZFA3LkJ5JdYPeL7GvOHBx6m
 fumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vf9l8Dn1Veypozrh6l7QkCHwWHZG9oxTlNpxX7vPzt0=;
 b=d+LTfWhZS1ZYcz9dMhcASb+bKylpnyUEnUrbq8u+igAKru6RWovmuV0kSRwad2sten
 wNBenNmX4tFwwCmDhpGdt83vY4hcWeyEXM3JX2lm69p0jAD0fhxe0hPoyHI4LxG8u5xy
 V29NJQFagpB+Cotv8Lndk7N4PvSyMffaCNEOQ/Ltfj43TcrbpyI/98OcrVtDZZWL7r+u
 0HdyPfsSyqRGBGafmyq54jMaHUD7X8tEK2TZyFl7GVafq9TamCYfAv6TT615R6VkXeGu
 OGnOaorsHqyBHdXOmQ+z0pbQR2ErI9oVoKYctZUaqkZhbg8vOsLU6DF66e8pgcHuQGkn
 NQlw==
X-Gm-Message-State: AOAM532AjqT35V7910NG5GsDKMQmh8/PEAtW2Jivuf7m9AklzctFI+j6
 2ORPioPLXi5FXujJp59twcc9Bp8wJwk=
X-Google-Smtp-Source: ABdhPJwaTS9epjjveIRV5FkOCpz07FQxlcTFVWxthZOxNDNnCaPWbfg+LjsdzUlMLjB4P4bl4pZ1/Q==
X-Received: by 2002:aa7:c944:: with SMTP id h4mr11652307edt.233.1613780013479; 
 Fri, 19 Feb 2021 16:13:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h4sm6344518edv.80.2021.02.19.16.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] hw/sd: Introduce receive_ready() callback
Date: Sat, 20 Feb 2021 01:12:55 +0100
Message-Id: <20210220001309.2225022-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present there is a data_ready() callback for the SD data read
path. Let's add a receive_ready() for the SD data write path.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210128063035.15674-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h |  2 ++
 hw/sd/core.c       | 13 +++++++++++++
 hw/sd/sd.c         |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 05ef9b73e56..47360ba4ee9 100644
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
index 08c93b59034..30ee62c5106 100644
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
index 5de9e0a6c20..172e83f99d9 100644
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
2.26.2


