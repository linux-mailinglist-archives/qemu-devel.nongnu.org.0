Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8B3B314E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:27:51 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQKc-0008Ax-Fk
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFr-00070M-MX; Thu, 24 Jun 2021 10:22:56 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFq-0000Ba-55; Thu, 24 Jun 2021 10:22:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d11so6942492wrm.0;
 Thu, 24 Jun 2021 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8335+v657OPgDsK3i2XqXKBZf94tMX7vRL29WozTPg=;
 b=CLkN++yy9BXjHS2qH/B5E95OKZWRRN5saro1Wf67AuLEMJo80tNEDmLr7Ors8xQVQW
 VAFQDjLbYTsCupcrb4H9b6h5INNz+KFfBRqkopRrQ9yAiNbvhfoAQrfizky855FaJK7J
 lKMu5t6GX7wm5l3rOmcICtIGpR/4QXxhZngR6fadN4/7TkcYbD16qPMQcM0cqDd/M8Ci
 +pgRt6PIdlj7k432Em8ha+eVISpAvgA1Bl5o84mV4TtBfw0oFMV7hpB+fMKniFj/r63L
 yOeLo15mF+bAXJOGHZU0TTiyglcT2z0GMP5wpt6tDduShI7Hv3h+SYu0mRgBPMk5uwzv
 PJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N8335+v657OPgDsK3i2XqXKBZf94tMX7vRL29WozTPg=;
 b=V0wePsEpDVrMtRuY0uW3SFgyyWep1YruyPVirqg6RPOg20Hqn2vYR5vd0IZpiI4SCU
 vgvdIYlRbOavK8oUkrFEkPsA7sG00+sXI9C8g8ySIYziRLPn58SPTl23Uy3vrzCX/bMH
 hOjQb2Bbs8jQGmwJ7JJ5I5Y1Nb10RQtvxh+s3iMSnAm+/WK6CvmUZ18qFtGZrFqrLpKY
 p/uQYl4O6tNaDqVmvDvR9ZgRr2F+s5sE1+U0VTEe/OQA2qcKWzULdDYkp3UvBqluTRo2
 tiQN/zl1mcM99xiTyPxewxfhXdghYz+ziA9U3pv6xhCu9gfN9XQxAMgX0Q2z/59TruGf
 FQJw==
X-Gm-Message-State: AOAM533jpagyibLU91sL/A64Ws7V3HP/2np/58nuoWt87JBr+E1iK9X7
 ZvX8iHy7yZXfMaKvFf/ouCF9itZTbE+pQA==
X-Google-Smtp-Source: ABdhPJx2tqlVjvLafFwiH8HczgnO6SstZ8R4E6rKVkEhI2aXimHZmll8dQtjHLJPJfODTdnMoMrEcg==
X-Received: by 2002:adf:e112:: with SMTP id t18mr4847275wrz.46.1624544572324; 
 Thu, 24 Jun 2021 07:22:52 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n65sm8621361wme.21.2021.06.24.07.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/10] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Date: Thu, 24 Jun 2021 16:22:07 +0200
Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 3ef6aca89da..b63d99f7da0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -992,6 +992,13 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
     return sd->spi ? sd_r1 : sd_r0;
 }
 
+static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
+{
+    sd->state = sd_transfer_state;
+
+    return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1031,10 +1038,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 1:	/* CMD1:   SEND_OP_CMD */
-        sd->state = sd_transfer_state;
-        return sd_r1;
-
     case 2:	/* CMD2:   ALL_SEND_CID */
         switch (sd->state) {
         case sd_ready_state:
@@ -1579,11 +1582,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
 
     case 41:	/* ACMD41: SD_APP_OP_COND */
-        if (sd->spi) {
-            /* SEND_OP_CMD */
-            sd->state = sd_transfer_state;
-            return sd_r1;
-        }
         if (sd->state != sd_idle_state) {
             break;
         }
@@ -2088,6 +2086,7 @@ static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
+        [1]         = sd_cmd_SEND_OP_CMD,
         [2 ... 4]   = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [7]         = sd_cmd_illegal,
@@ -2097,6 +2096,7 @@ static const SDProto sd_proto_spi = {
     },
     .cmd = {
         [6]         = sd_cmd_unimplemented,
+        [41]        = sd_cmd_SEND_OP_CMD,
     },
 };
 
-- 
2.31.1


