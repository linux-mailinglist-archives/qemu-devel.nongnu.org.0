Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3B5387E1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:52:25 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlRA-0001BI-Qj
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFC-0000GR-A0; Mon, 30 May 2022 15:40:02 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFA-0008MJ-Kt; Mon, 30 May 2022 15:40:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so11742716pjh.5;
 Mon, 30 May 2022 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ExL56MzpCj++F0LIP8Goq8EPnsP+R6HFgjnAJW1UmM=;
 b=Cxnz2D88ORkUjbW/NGUvUNNYUVDYnANua15RSoKo4WOhP5hpb5jCUUiWiBG/+U0UY4
 t4KPFDPy1uLmWNBvBFeomb+G2df6nG03Q0E4RByQ7HCaqKWwoE9Lc/gcFk4kPnoems9D
 PC/+0nq2s/md1jYYqZb1S55YUwW6KN4uRBSE4c+pW5FG8tZJVJyAFgWd4f2QuTQodfAO
 gYjiNddRPYznTT8PnP65akyFRofSbkPnXrVJAioZ+rhWfjqUuicnPujuSl+OZpeoJ9zk
 25NR71K6+Zwet1NZ7Z47C6PBJ1KBMesDG9PlYEHGYRl9L8755Hc/vNbjLUrTdoZo+ipJ
 4lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ExL56MzpCj++F0LIP8Goq8EPnsP+R6HFgjnAJW1UmM=;
 b=VCXGxSV8aSbq+PC8aGGbDDn81e2nri958D91bzNUTcmHV29/zy7v5d8jN1N3UW+mPj
 mDe+avjcyo319++jm96JeQJWYqDI6eylw5JylQdCJbj1w0tkxLKGI7c+s3TEAObliVkq
 iLz4hbn8l0FI1EHfP67+VKajibbBfNFzG4CN3Kmlikch+9h7AP4wjxlfLBiTfO63WU5k
 7vIZuVznxX+qb7COeRSxJ8xb5dBupjYA+Pk0AHt5mpr9yvwrQ1pqk6Wp/bB6Q0mEOO05
 AVU2BO9Tyo1c3hKdEP4c7QFY+ohTQCmyiWGVttkp/ZtmoOh7/c1eSGbkRhiIACulxYPZ
 NKTg==
X-Gm-Message-State: AOAM533buxuJmwZR+VaFnh/C6suoHg6uYVV8SfnMQNolR4f5clz/Csia
 QvXJiXvyc2MBYdZySshZlqDNqMlypxg=
X-Google-Smtp-Source: ABdhPJyPT0whsWu7revV6CoMiOi8S8bfXuR9sC5CB57Jvc3zsd7ryI/gzpvQ3+mhQmJ31g+tgyQh7w==
X-Received: by 2002:a17:90a:ba15:b0:1cb:be7d:bbca with SMTP id
 s21-20020a17090aba1500b001cbbe7dbbcamr24348284pjr.143.1653939598913; 
 Mon, 30 May 2022 12:39:58 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a6387c3000000b003fba6db1b50sm7059321pge.85.2022.05.30.12.39.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 11/25] hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
Date: Mon, 30 May 2022 21:38:02 +0200
Message-Id: <20220530193816.45841-12-philippe.mathieu.daude@gmail.com>
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-11-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b56b8fea41..2fe05c5a3d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1048,6 +1048,20 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
     return sd_r2_i;
 }
 
+static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
+{
+    switch (sd->state) {
+    case sd_identification_state:
+    case sd_standby_state:
+        sd->state = sd_standby_state;
+        sd_set_rca(sd);
+        return sd_r6;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1087,19 +1101,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
-        switch (sd->state) {
-        case sd_identification_state:
-        case sd_standby_state:
-            sd->state = sd_standby_state;
-            sd_set_rca(sd);
-            return sd_r6;
-
-        default:
-            break;
-        }
-        break;
-
     case 4:	/* CMD4:   SEND_DSR */
         switch (sd->state) {
         case sd_standby_state:
@@ -2149,6 +2150,7 @@ static const SDProto sd_proto_sd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
         [2]         = sd_cmd_ALL_SEND_CID,
+        [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
-- 
2.36.1


