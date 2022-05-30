Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF55387CF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:42:33 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlHc-0001wZ-2u
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEe-0007Ky-K4; Mon, 30 May 2022 15:39:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEc-0008Jn-1D; Mon, 30 May 2022 15:39:27 -0400
Received: by mail-pg1-x534.google.com with SMTP id x12so10866736pgj.7;
 Mon, 30 May 2022 12:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e9iS3syVNTGY9f8bav4NL3gx/ZBjKrH1QuSH4Tv1Ag0=;
 b=R9Yz3cIKXhKw53+S9lt/uXc9PueL+E3rfVqulJo4868+qYo08axpd7SsDqeOMKRTOK
 x2OchxUNmM+eZKxM0LdNmpu9H5CGMNqgvrfNznuT/H3cI56P1deukoNnTA164Triew+T
 qcTuO66XSXeHeBWtmR0zc8E9vVLrKTXeHht7JYM7G1wBQFvlME4x4JB58jnsEhns+tTW
 BipUj9fR8OyvAFqugUDybqzbD7KDpK/AjyabG922gymPjKyEVN0O+OlnNygnQyDNjCpe
 azDS2eRvQ68EaVHj6gkO4kQJrmUlaDkhDS4fG1c2b1yrUzncagAYHQBY3uY/eXL8WkDA
 lEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e9iS3syVNTGY9f8bav4NL3gx/ZBjKrH1QuSH4Tv1Ag0=;
 b=VWd5ZYvaC5Z7r9RSFI7X1yT71n5v2fATtkxk32xDSo0Qcyk4sKrTybni+HuEQN35HC
 Jr+lsbQTKRmY4qTWMOdeUAPe5St7s36d4mFgvQasTcKbfgyfhm6fOEmUWu6IlgTPcIKt
 ackXlae2uOwoEV+C/M01xsU+6mvrq7S3Ew7c1vRVtlS+ht3n/WeA+usNE7CczQE69leB
 zZfyzpNfaGpUlxo2gRA5A/OnhsyEqeAeoDrdntFrCgFTycyu7eLUu7Q3pLoaHT5JVMW2
 OND3Rb6b8hIp8LBBN9Wehxn/mSPQxN9IchZneQpS9cCfhQkJlsML/jKGHMJm7IhTklmR
 ThGw==
X-Gm-Message-State: AOAM530Roftjo7Miug5vHk1bNriIVv1/XphhC80SfatMDtQ7ZcYSqkw6
 zjDETcBl45Qv5jQGbm7fSlKoHWWSkjU=
X-Google-Smtp-Source: ABdhPJx8mTB/ay01HHdAdPoy7Ii4Y9hgY+NijyuAy/sLoUBZYV2OBwrciX9F05/lH8KX1my/KXVVLA==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr58591902pfu.6.1653939564231; 
 Mon, 30 May 2022 12:39:24 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902904a00b0015e8d4eb29csm4297505plz.230.2022.05.30.12.39.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 07/25] hw/sd: Add sd_cmd_unimplemented() handler
Date: Mon, 30 May 2022 21:37:58 +0200
Message-Id: <20220530193816.45841-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
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
[ clg: Fix redundant assignment of .cmd ]
Message-Id: <20210624142209.1193073-7-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bda24bc042..e018498b10 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1011,6 +1011,15 @@ static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+/* Commands that are recognised but not yet implemented. */
+static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: CMD%i not implemented\n",
+                  sd_proto(sd)->name, req.cmd);
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1565,9 +1574,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
 
     switch (req.cmd) {
     case 6:	/* ACMD6:  SET_BUS_WIDTH */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->sd_status[0] &= 0x3f;
@@ -1698,12 +1704,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     default:
         /* Fall back to standard commands.  */
         return sd_normal_command(sd, req);
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.cmd);
@@ -2139,6 +2139,9 @@ static const SDProto sd_proto_spi = {
         [26]        = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
     },
+    .acmd = {
+        [6]         = sd_cmd_unimplemented,
+    },
 };
 
 static const SDProto sd_proto_sd = {
-- 
2.36.1


