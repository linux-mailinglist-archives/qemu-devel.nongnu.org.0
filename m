Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D745387DE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:51:12 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlPz-0005x1-Cp
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEU-0007BY-Vk; Mon, 30 May 2022 15:39:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlET-0008Gv-7Q; Mon, 30 May 2022 15:39:18 -0400
Received: by mail-pg1-x532.google.com with SMTP id a63so4705880pge.12;
 Mon, 30 May 2022 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=htoy1+loy6kPJWKosohY2nohbhdVtDpnoBU7PmIuli8=;
 b=GGJ7MGvc3WA9oHu/FBuyNJYnKNgZ2SkA2VGpsNIGcCxYWQQeDFGzpqfJSrp6Ai9WKG
 GI0F80yw79iS1WSVhKZ7TDCd7jierZgnxtMx45A7X/jnNkooU4LSff1axz8Pzb8gqNt+
 UFf08msCfI9sEiCUMDV/gq/dGVaEyAvTO9qNBfdvvvZsezSpz+XmRF2IMXJj0WoOBvYl
 BPIdfW7Z1JW9MBSlULl4N9IbJaeTM9ftn26JhAFN1P0FjKj863vnNurBCFB+KIvOnd4s
 YNckGLFFaFSihNBObjoxC9kr6vtqqLihZaIFElcyzJp9hX2mPNTTO4JKxGcHbakKYVoD
 4zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=htoy1+loy6kPJWKosohY2nohbhdVtDpnoBU7PmIuli8=;
 b=7eZkHbVxLC2cSiRioO0SbbXoDpyOE1CKAOINLn4WQ41z4/thk0z481HVnHBzoh8bel
 vel4YOBSW8HTKGimWOQ1W06g5BmnVSCM0a/O5wznYKuglksJ54W6M95wYWOyw+xtQvSP
 T6CFIOb45itcP0JUHcqLpTpvZryH/vy7f3DPYBYubE5TrJ6QHUzpkted6VLJAhZh2Y0h
 +WKnx8a3RuEU19SAwOsYzIP+k7q2pqciO7DaBzziR8J+XCPsghP3qC5wlwd/Iksj/5Ao
 bSOL3yfAoRAL5yjPiXmHPpkKiEaMmrJb/6KF55Fwxh1cnajwttLL+m27Jkh+D2nbs3MH
 L7eQ==
X-Gm-Message-State: AOAM530rSBB15SzRydMSgUytxWfshGMPuSC084LK4WQBH615NOHtOHTD
 Plw7eYF1qUnWWfss74Wu6clOQAu43ks=
X-Google-Smtp-Source: ABdhPJybmg9WgakZcfzcdkhPRG0Rdpv5HRDMG777J9iiE83ocidjl9X8Cfo5v4dty4sL+o/6FNsNRw==
X-Received: by 2002:a05:6a02:10d:b0:381:f4c8:ad26 with SMTP id
 bg13-20020a056a02010d00b00381f4c8ad26mr49199622pgb.135.1653939555486; 
 Mon, 30 May 2022 12:39:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a17090a598500b001e310303275sm54897pji.54.2022.05.30.12.39.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 06/25] hw/sd: Add sd_cmd_illegal() handler
Date: Mon, 30 May 2022 21:37:57 +0200
Message-Id: <20220530193816.45841-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
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

Log illegal commands as GUEST_ERROR.

Note: we are logging back the SDIO commands (CMD5, CMD52-54).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-6-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 62 +++++++++++++++++++++++-------------------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ed63528615..bda24bc042 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1002,6 +1002,15 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i for spec %s\n",
+                  sd_proto(sd)->name, req.cmd,
+                  sd_version_str(sd->spec_version));
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1054,15 +1063,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 1:	/* CMD1:   SEND_OP_CMD */
-        if (!sd->spi)
-            goto bad_cmd;
-
         sd->state = sd_transfer_state;
         return sd_r1;
 
     case 2:	/* CMD2:   ALL_SEND_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_ready_state:
             sd->state = sd_identification_state;
@@ -1074,8 +1078,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_identification_state:
         case sd_standby_state:
@@ -1089,8 +1091,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 4:	/* CMD4:   SEND_DSR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             break;
@@ -1100,9 +1100,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 5: /* CMD5: reserved for SDIO cards */
-        return sd_illegal;
-
     case 6:	/* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
@@ -1118,8 +1115,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 7:	/* CMD7:   SELECT/DESELECT_CARD */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1249,8 +1244,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 15:	/* CMD15:  GO_INACTIVE_STATE */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->mode) {
         case sd_data_transfer_mode:
             if (sd->rca != rca)
@@ -1303,7 +1296,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            goto bad_cmd;
+            return sd_invalid_state_for_cmd(sd, req);
         }
         if (sd->state == sd_transfer_state) {
             sd->state = sd_sendingdata_state;
@@ -1314,7 +1307,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            goto bad_cmd;
+            return sd_invalid_state_for_cmd(sd, req);
         }
         switch (sd->state) {
         case sd_transfer_state:
@@ -1357,8 +1350,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 26:	/* CMD26:  PROGRAM_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1508,15 +1499,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 52 ... 54:
-        /* CMD52, CMD53, CMD54: reserved for SDIO cards
-         * (see the SDIO Simplified Specification V2.0)
-         * Handle as illegal command but do not complain
-         * on stderr, as some OSes may use these in their
-         * probing for presence of an SDIO card.
-         */
-        return sd_illegal;
-
     /* Application specific commands (Class 8) */
     case 55:	/* CMD55:  APP_CMD */
         switch (sd->state) {
@@ -1557,19 +1539,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 58:    /* CMD58:   READ_OCR (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r3;
 
     case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r1;
 
     default:
-    bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
     }
@@ -2156,10 +2131,25 @@ void sd_enable(SDState *sd, bool enable)
 
 static const SDProto sd_proto_spi = {
     .name = "SPI",
+    .cmd = {
+        [2 ... 4]   = sd_cmd_illegal,
+        [5]         = sd_cmd_illegal,
+        [7]         = sd_cmd_illegal,
+        [15]        = sd_cmd_illegal,
+        [26]        = sd_cmd_illegal,
+        [52 ... 54] = sd_cmd_illegal,
+    },
 };
 
 static const SDProto sd_proto_sd = {
     .name = "SD",
+    .cmd = {
+        [1]         = sd_cmd_illegal,
+        [5]         = sd_cmd_illegal,
+        [52 ... 54] = sd_cmd_illegal,
+        [58]        = sd_cmd_illegal,
+        [59]        = sd_cmd_illegal,
+    },
 };
 
 static void sd_instance_init(Object *obj)
-- 
2.36.1


