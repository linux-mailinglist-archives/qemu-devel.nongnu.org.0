Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71850538800
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:02:20 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlal-00011o-8l
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGa-0002S8-QP; Mon, 30 May 2022 15:41:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGZ-0000Pv-4h; Mon, 30 May 2022 15:41:28 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b5so11033794plx.10;
 Mon, 30 May 2022 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ttuQlAhLvhQoRUw1TZJLfp+t9TBlRFis3dat+1QSh8=;
 b=I9B14NU45VohPfR5NnNMws5CDk5zFs01LYDtv3To3lMUB7snFP6JiKBFu6mvtOhXes
 BVse0+BiRSHY+UDMZh6tgOKub8CZOBowRVasLydoyrScLk9llB10TF7AJ8qUiDwZ+5Dg
 mnSWgNrDjLDQg1bE/KdbrzUaVyPmRBtf5qpkQz15+xe+NkvhvSAaXv0+WSRh0AJTSQJp
 h1WkSxUouZjLBWmgbCTadoM6tgOMVkGN4s0cuEGmG52pV9xZgh9RuqFaVzWk1CRApKIc
 bsY8SCh034sQG3FL6szCOjXOo+t/DWkGJ5m/vSICfSRVZ3xHITnylm5uhYa87ALC6epT
 UEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ttuQlAhLvhQoRUw1TZJLfp+t9TBlRFis3dat+1QSh8=;
 b=wE0xz+QX4XzKlBgDPIaNYqFjeO2QKrwXEMYOg98ChQTfPNt5BV990Fn2IuFzyHuSpR
 yM+KtiEBA5YnOy4twsqcliGO5MMBe9Y56+z12pb8BR8vZMeQi7CO2iSaU4kYp9R95m0Y
 Kk8SLgmpqVoxgnH9nfavDU/vZyStWaTUp/ARW7vZhSHUOWDUWYrmRmv1I/89cwUZWPjN
 teoBwVVXnwIrqht2bQW3XCQ27ET/SsUjulytMWfvoDGv26wNuMzZtH+T8lEQKzcNJZcc
 emaV+W+d3OorT/uH6xHy68BWXbTDOwlnEOPc3CRy0CZKVUPI6S1jBkX4wNQtgVOAdRME
 ybZA==
X-Gm-Message-State: AOAM530oKyqEX9uNntTs8E/xzA7MskHApweYijtNJ5iLrfult1W+n98L
 Cm/44GD/d+zkYnMJxobSevVQaLoSXYg=
X-Google-Smtp-Source: ABdhPJyFkjYbTyf8UbKyTv32ZMoW1EQ/Bth5TAFTlEASRUlSKnSQdcbcg85yP0eXhe6+sxno+nCI7g==
X-Received: by 2002:a17:90a:d515:b0:1e3:1d65:e06b with SMTP id
 t21-20020a17090ad51500b001e31d65e06bmr3477019pju.24.1653939684356; 
 Mon, 30 May 2022 12:41:24 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y63-20020a638a42000000b003fadfd7be5asm8771965pgd.18.2022.05.30.12.41.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Subject: [PATCH v2 21/25] hw/sd: Add mmc switch function support
Date: Mon, 30 May 2022 21:38:12 +0200
Message-Id: <20220530193816.45841-22-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

switch operation in mmc cards, updated the ext_csd register to
request changes in card operations. Here we implement similar
sequence but requests are mostly dummy and make no change.

Implement SWITCH_ERROR if the write operation offset goes beyond length
of ext_csd.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[ clg: - ported on SDProto framework ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 672af1e839..907d4f5760 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -476,6 +476,7 @@ static void sd_set_rca(SDState *sd)
 FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
 FIELD(CSR, APP_CMD,                     5,  1)
 FIELD(CSR, FX_EVENT,                    6,  1)
+FIELD(CSR, SWITCH_ERROR,                7,  1)
 FIELD(CSR, READY_FOR_DATA,              8,  1)
 FIELD(CSR, CURRENT_STATE,               9,  4)
 FIELD(CSR, ERASE_RESET,                13,  1)
@@ -873,6 +874,43 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     return ret;
 }
 
+enum {
+    MMC_CMD6_ACCESS_COMMAND_SET = 0,
+    MMC_CMD6_ACCESS_SET_BITS,
+    MMC_CMD6_ACCESS_CLEAR_BITS,
+    MMC_CMD6_ACCESS_WRITE_BYTE,
+};
+
+static void mmc_function_switch(SDState *sd, uint32_t arg)
+{
+    uint32_t access = extract32(arg, 24, 2);
+    uint32_t index = extract32(arg, 16, 8);
+    uint32_t value = extract32(arg, 8, 8);
+    uint8_t b = sd->ext_csd[index];
+
+    switch (access) {
+    case MMC_CMD6_ACCESS_COMMAND_SET:
+        qemu_log_mask(LOG_UNIMP, "MMC Command set switching not supported\n");
+        return;
+    case MMC_CMD6_ACCESS_SET_BITS:
+        b |= value;
+        break;
+    case MMC_CMD6_ACCESS_CLEAR_BITS:
+        b &= ~value;
+        break;
+    case MMC_CMD6_ACCESS_WRITE_BYTE:
+        b = value;
+        break;
+    }
+
+    if (index >= 192) {
+        sd->card_status |= R_CSR_SWITCH_ERROR_MASK;
+        return;
+    }
+
+    sd->ext_csd[index] = b;
+}
+
 static void sd_function_switch(SDState *sd, uint32_t arg)
 {
     int i, mode, new_func;
@@ -2257,6 +2295,19 @@ static sd_rsp_type_t sd_emmc_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
     return sd_r1;
 }
 
+static sd_rsp_type_t sd_emmc_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest req)
+{
+    switch (sd->state) {
+    case sd_transfer_state:
+        sd->state = sd_programming_state;
+        mmc_function_switch(sd, req.arg);
+        sd->state = sd_transfer_state;
+        return sd_r1b;
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 static const SDProto sd_proto_emmc = {
     .name = "eMMC",
     .cmd = {
@@ -2265,6 +2316,7 @@ static const SDProto sd_proto_emmc = {
         [2]         = sd_emmc_cmd_ALL_SEND_CID,
         [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
+        [6]         = sd_emmc_cmd_SWITCH_FUNCTION,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [21]        = sd_emmc_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
-- 
2.36.1


