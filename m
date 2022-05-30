Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF55387DF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:51:13 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlQ0-00062k-MN
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFc-0000y7-53; Mon, 30 May 2022 15:40:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFa-0000FA-IN; Mon, 30 May 2022 15:40:27 -0400
Received: by mail-pg1-x533.google.com with SMTP id 129so6610682pgc.2;
 Mon, 30 May 2022 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSS6iC8IugQOuzyUFIXMiVvOv251XPyXPK3tC9x4hyc=;
 b=H3qxdWwfvp1zQ5AW6Tg017juJR+zl9WAyu9URFuZ8EII4r963Bql+/ncYsMdER51cy
 OREd1RD6NTZZo9uZANgW96JwnLD6+5Qnr/VEias5IT8osibLSuhHilSbbDak3/OI2Pf2
 ETEWby9Sc8u1YtvBNSTSTd1VTkV4lb+4E14pHqWdUHnhSCV1swPvpgq1kYahdP4Ho1i6
 S+PHZuBcSOXM5kShRI94UDzJTRDKrWOeedxMBg0RbOZqBUL4Yt90oJZsUZcbmL8p4Z8a
 fVP4X8bIPlZyGAarugtP9oWmrCKaht9lyfiRdZOJh569cdzJwccfuX+4n6gaX2p5v5qK
 GV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSS6iC8IugQOuzyUFIXMiVvOv251XPyXPK3tC9x4hyc=;
 b=lpooyJkCJk7M2Kv6F844Cc31+ofKHfm8MJ42NzFC7UQVKwg5dOsR27dtC+zxfCoP26
 HkVbirGCrhYhY0ECAjzsAtXKBRsat9V8NfEESfSVIlmm6rskSsfLrufmjTQhF5YCF55N
 26jxOZkVj0oyE1IRlqb7nKguCptoDKE9TC2a3jO0tPrqYlxO2ixllbj76avvAQUMeHfR
 NalP1hWbecaN9BI22/ZsRDijJv5Qvldf9unDRkolnyDEKwUxr8viXr5l1sgefJkCZKlw
 uNxyddjN7+JNu6vEr0qju492CvD32acBiEfH497ecpbYh+GVLlHfJiskq5WTAy+r021r
 y/Jw==
X-Gm-Message-State: AOAM533/09sxt8WtBAWKua5EGjZVQ7ow7jWkTF8aE3I5I2sUpWt4Iq8T
 1m1sehJuaspJh93+SOZs++VYgt5lOVI=
X-Google-Smtp-Source: ABdhPJz60kRxQuKzV0irftgtixR8zFDaCiQ5NndPu8QVcwtLj1VIJW6SBm72l3QxEXpJv+BM7cuRkQ==
X-Received: by 2002:a05:6a00:1a91:b0:518:7bca:d095 with SMTP id
 e17-20020a056a001a9100b005187bcad095mr48085587pfv.13.1653939624542; 
 Mon, 30 May 2022 12:40:24 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170902a71400b0016232dbd01fsm9572052plq.292.2022.05.30.12.40.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 14/25] hw/sd: Basis for eMMC support
Date: Mon, 30 May 2022 21:38:05 +0200
Message-Id: <20220530193816.45841-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The initial eMMC support from Vincent Palatin was largely reworked to
match the current SD framework.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
TODO: Do not inherit TYPE_SD_CARD, duplicate sd_class_init()
---
 hw/sd/sd.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/sd/sd.h |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b2f16dbb73..8b178aa261 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2166,6 +2166,19 @@ static const SDProto sd_proto_sd = {
     },
 };
 
+static const SDProto sd_proto_emmc = {
+    .name = "eMMC",
+    .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
+        [5]         = sd_cmd_illegal,
+        [19]        = sd_cmd_SEND_TUNING_BLOCK,
+        [41]        = sd_cmd_illegal,
+        [52 ... 54] = sd_cmd_illegal,
+        [58]        = sd_cmd_illegal,
+        [59]        = sd_cmd_illegal,
+    },
+};
+
 static void sd_instance_init(Object *obj)
 {
     SDState *sd = SD_CARD(obj);
@@ -2284,9 +2297,38 @@ static const TypeInfo sd_info = {
     .instance_finalize = sd_instance_finalize,
 };
 
+static void emmc_realize(DeviceState *dev, Error **errp)
+{
+    SDState *sd = SD_CARD(dev);
+
+    if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            error_setg(errp, "Minimum spec for eMMC is v3.01");
+            return;
+    }
+
+    sd_realize(dev, errp);
+}
+
+static void emmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDCardClass *sc = SD_CARD_CLASS(klass);
+
+    dc->desc = "eMMC";
+    dc->realize = emmc_realize;
+    sc->proto = &sd_proto_emmc;
+}
+
+static const TypeInfo emmc_info = {
+    .name = TYPE_EMMC,
+    .parent = TYPE_SD_CARD,
+    .class_init = emmc_class_init,
+ };
+
 static void sd_register_types(void)
 {
     type_register_static(&sd_info);
+    type_register_static(&emmc_info);
 }
 
 type_init(sd_register_types)
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 0d94e1f346..e52436b7a5 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -93,6 +93,9 @@ typedef struct {
 #define TYPE_SD_CARD "sd-card"
 OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
 
+#define TYPE_EMMC "emmc"
+DECLARE_INSTANCE_CHECKER(SDState, EMMC, TYPE_EMMC)
+
 struct SDCardClass {
     /*< private >*/
     DeviceClass parent_class;
-- 
2.36.1


