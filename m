Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2AC5387E0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:52:22 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlR7-00012O-2B
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFU-0000sp-3B; Mon, 30 May 2022 15:40:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFR-000073-Ug; Mon, 30 May 2022 15:40:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so191036pjl.4; 
 Mon, 30 May 2022 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/tjSehVrju13SeKU3/brCs7CeK81NyQsNDYvTYF194=;
 b=XeUS6LzmKdm6RCg3TBdJ50jab9Fj1lCRbShIjf7suxdqDuRuLJFxJLdE1q1Q3zQRin
 Q0p7PDBWYmv3rglt7ywKQacdPUDJHl0+XqbMTWAdBOnRT5Z+Er37FfbmU1iuM5ms50+U
 LDFAfVodoPvmV9aFZbSSAMZH59R+NkAUF+pc5mbN2cOR4kg2goppZ6galyzYHXpIODSL
 5XHQaxXLYXb/XqHyBlT9XzcwlzoNgx14UIj29k/TKwkPi5zRq+GUEYQ8Nuc9EpVfEU3G
 7pdXPyV+TgOzuXyzerX5kca5mrGqirOepwM6kWmBm+Iy5FJ3Xg5N2TOzdossef9WaNcT
 tD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/tjSehVrju13SeKU3/brCs7CeK81NyQsNDYvTYF194=;
 b=PY7VYMuRVBNkvW1miP9zQG/skGWHbjTG2MlxMbtVxvaGmOiX+78qOZYhCg8gP3sXQ2
 1c3zono9+/cEyyC4MewDmnFlR+I44onHvoMcRQxnHbWyIqeXSu9w1Rn7N1LPqke7aC86
 P7Q5efgmMAxM1QmOjHsXDXfg4OzdOKErErYepfMyIUb4kgDJnsegf31jQuJkNRNdc+pn
 CcoRRtpVhKyXu9dq6tja4I3baOwqK2N4dJy/JEAOTYSqzTVqWcbY7arWJyzy1I+Swzd6
 s7DKvThen4crgrPekqP7JZvKWBJxnAsiMj916IMjkM19+pzJcC/yuBp0ZcJLr4SqSZDZ
 XI4Q==
X-Gm-Message-State: AOAM530c/ZRk5FGEKwa6rOUaTWidFjCSMGEb8l+TxJuoiK3XfNVWljl2
 XOGk4STUfIngdWbaWvLWo3u4Hme/JgU=
X-Google-Smtp-Source: ABdhPJwLVvMsIzgxijS36RTcjazBZamT7M5hvMYu2ak8PHiFSnanhifV1lia71trQ6Nta9E5aWwZvw==
X-Received: by 2002:a17:90b:1bcd:b0:1e2:c8da:7c29 with SMTP id
 oa13-20020a17090b1bcd00b001e2c8da7c29mr11537386pjb.4.1653939615919; 
 Mon, 30 May 2022 12:40:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a170903204100b00163f35bd8f5sm1677040pla.289.2022.05.30.12.40.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 13/25] hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler
Date: Mon, 30 May 2022 21:38:04 +0200
Message-Id: <20220530193816.45841-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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
---
 hw/sd/sd.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a9130155be..b2f16dbb73 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1078,6 +1078,21 @@ static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
         return sd_r1;
 }
 
+static sd_rsp_type_t sd_cmd_SET_BLOCK_COUNT(SDState *sd, SDRequest req)
+{
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            return sd_cmd_illegal(sd, req);
+        }
+
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+
+        sd->multi_blk_cnt = req.arg;
+
+        return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1321,20 +1336,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 23:    /* CMD23: SET_BLOCK_COUNT */
-        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            return sd_invalid_state_for_cmd(sd, req);
-        }
-        switch (sd->state) {
-        case sd_transfer_state:
-            sd->multi_blk_cnt = req.arg;
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
@@ -2158,6 +2159,7 @@ static const SDProto sd_proto_sd = {
         [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
+        [23]        = sd_cmd_SET_BLOCK_COUNT,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
         [59]        = sd_cmd_illegal,
-- 
2.36.1


