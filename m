Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4225387DD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:49:54 +0200 (CEST)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlOj-0003hQ-4n
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlF3-0008Dq-M1; Mon, 30 May 2022 15:39:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlF2-0008M5-3Q; Mon, 30 May 2022 15:39:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h1so1844542plf.11;
 Mon, 30 May 2022 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JuLLPKf5etqKtzMV1e+zTPwwL4KsbIS19QbNZINfse4=;
 b=ZRqod1Q7YmTBj452aoyNRhjZlArBNQvT+74bq8kRvJLa1WQIVHFxsJUTn9bMWVL5m8
 Dh9drbe17v49ilUkEn1hUIj8fIZ++ngCw+50z9harj2uT4gW85vmZXxYTDTHz/S5oVkc
 sNje+uxQDFnc3Eq7vSOHhUk5h3K0N0fYbApiK9/7sydQVMBCEULWuDUuI6WjevV8pV7o
 8Na6UlZduzLQcrOqGYYkJ13bwe7sK2my61DPVqovhe+ZEMUuy29ReTQx8+ZdHT3FYQLF
 f+OLifeemwM1cehjUox58CBP2RbieP2CpDdxzGNyH6oYCcWjsbIvEKEuMZZ7TQeyjB5Q
 2qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JuLLPKf5etqKtzMV1e+zTPwwL4KsbIS19QbNZINfse4=;
 b=hTrLTCCT70VxB2UE6wCnMFgbBZJxSXo7a4/QZ98GmteFKssgwibNKraXf4Hzeaxt05
 bn94UkNjI9yKB81psmPBz7Aw/zKUT9IZ7bAHD/GzuYMeW0LqPKexhZtcYJxLcDN7zFbJ
 3KxN07Grojc644sMtOF4yak9uCS2+GDe1p9iMiy4JBdx5Jg86w3CWB3Dzx9TJHPChfpH
 2tOMjSXqjfxq5gbrifUIyl85d+5em4+BADP3B3B2wPykBlNQfvfG60Gvvlf2jsXiSisi
 6FCLWkIt7Z6+3XDaOiLjdVaGKrwSnNOFO8Jpw4tyqCDbBWO8sqEQT9DIsoKKMQF6blJS
 XN5g==
X-Gm-Message-State: AOAM533d8CUhKmYqY5uAk4RjmWgNnNB7QSDYdY5pCSjBaJ/UdsMNR0K3
 pEMvzop7g8xtQZnZpxRDve8QkIhG6L0=
X-Google-Smtp-Source: ABdhPJw9Z08wzNeAyl4y/l0TM/N+Uc/nSItxjUnOCOM9ZZVMviCPqeU9Gg4I0v+WfeFiiNVbiZkLbA==
X-Received: by 2002:a17:902:9a8c:b0:162:22ff:494e with SMTP id
 w12-20020a1709029a8c00b0016222ff494emr40745614plp.77.1653939590307; 
 Mon, 30 May 2022 12:39:50 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a170902729800b00161ea00350bsm9601596pll.277.2022.05.30.12.39.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 10/25] hw/sd: Add sd_cmd_ALL_SEND_CID() handler
Date: Mon, 30 May 2022 21:38:01 +0200
Message-Id: <20220530193816.45841-11-philippe.mathieu.daude@gmail.com>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-10-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ac81e1c667..b56b8fea41 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1037,6 +1037,17 @@ static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
     return sd_r1;
 }
 
+static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_ready_state) {
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state = sd_identification_state;
+
+    return sd_r2_i;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1076,17 +1087,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 2:	/* CMD2:   ALL_SEND_CID */
-        switch (sd->state) {
-        case sd_ready_state:
-            sd->state = sd_identification_state;
-            return sd_r2_i;
-
-        default:
-            break;
-        }
-        break;
-
     case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
         switch (sd->state) {
         case sd_identification_state:
@@ -2148,6 +2148,7 @@ static const SDProto sd_proto_sd = {
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
+        [2]         = sd_cmd_ALL_SEND_CID,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
-- 
2.36.1


