Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380D301EC0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:35:08 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m6F-0007Ca-Bf
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m03-0000lh-N1; Sun, 24 Jan 2021 15:28:43 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m02-0005SX-Aa; Sun, 24 Jan 2021 15:28:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id i9so2465443wmq.1;
 Sun, 24 Jan 2021 12:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OXE2ghwu/u4aUK+J3Nc88xMP1SZwgJgIRrsmYs8INU=;
 b=Fpg6V24l1DjGB4gs7vV+NgtFU504NpKBadkEWUju0Iy2nhqjR8OZYnehu+mDw5LNLs
 WDjpjdwbN2Nv0Oufxba5oVgq50OLWp318wele7ILzxgfi7p/t+e9uWKdLJ0lw5MlhePV
 u3vIwm5idR92Nb0NY4vnRr1C0YoDInsy36mKpIhX5qWCViXig3oZHor+ykCxkVXXB5Ha
 nUbiKvww8Bm7Ff8/xaIg/9cl+boz6/u+ulTFsQm28bjA/eNaLS1X46tts6uQBOH+hzgb
 eSyULyhF1OfQUJJrQg9LgfQJ5xVdYAWDhMEz0RPgISxGmhnCbWlPvr+XKloOj9dha239
 MVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0OXE2ghwu/u4aUK+J3Nc88xMP1SZwgJgIRrsmYs8INU=;
 b=nqYsX1xutpSQIuhBUGGy+C3axdAfu1mVzNYgGtNu+WrYIwd2LzRH/cgOiHKqzOkS6f
 nQwmc7bVMA7qMPAGk7g1kAEy0eB5yoKrg3sAh4wvSeM7ooQFoposaaQ2DIdpyBz0LRMD
 DyjhokRAPKonV8ZR9tSiia2ENu2rB822SOFzJsQryQ8sjDti016P1UKmJjV6fx2zauht
 id3OA2JohQGjfa0RT7Jxlag0r7rDf0JlQX6NpsULPRQ46gLXehSHnZZf3GzI4b7BXvCz
 MyBjWVduhoy8ULXzaJXRTy3fFnyWGY8LTt23dtuWU3BPiAatk2aQSVFmoump3cSMmNTx
 B6ZA==
X-Gm-Message-State: AOAM532bbOgKtXe3KMAt58Y/JyMjDPFS36jLlXTiD+wtxh8ISmP2F7kt
 Qz6aPVTG4Sm2vjo7hPuMs7+3x44ax9s=
X-Google-Smtp-Source: ABdhPJwWU7fdvvd14ySUsV82xUMtCofipzK9ODnEz2vI4g52A+uetBU9wf2OEApHMMmdu7SC9FXL3w==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr3993239wmk.72.1611520120615;
 Sun, 24 Jan 2021 12:28:40 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q6sm17888028wmj.32.2021.01.24.12.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 4/6] hw/sd: Introduce receive_ready() callback
Date: Sun, 24 Jan 2021 21:28:15 +0100
Message-Id: <20210124202817.2624557-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present there is a data_ready() callback for the SD data read
path. Let's add a receive_ready() for the SD data write path.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-16-bmeng.cn@gmail.com>
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
index 946036d87cb..c99c0e93bb8 100644
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


