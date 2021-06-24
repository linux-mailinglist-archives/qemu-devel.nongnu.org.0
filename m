Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35D3B313C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:25:13 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQI4-0002c3-JO
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFw-00077S-ML; Thu, 24 Jun 2021 10:23:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFu-0000FF-UR; Thu, 24 Jun 2021 10:23:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id e22so6905681wrc.1;
 Thu, 24 Jun 2021 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVxnyFp5X4RvfAz2vnlIan698SUObGu/Nhwh+sEDGac=;
 b=WhK6ZkefnVJUiJs7Q+1UM0lAaxjsCTUvjhKZuwh/neGP3YjWBpAzJ8VNaaFWi30XBh
 ysyEj+34Y0sdsRyHG34XkwRL9HNTGzZCu/6EiCzDPCtbleIdBeZJy4Kbut4nlOq7hw+Y
 sWQ2cQeVdgP2sq+eVoa6bHC0d+7AeLGfzxmOwxCF6TCBqZzixCjXbbDSNEHyv/ZWwa1c
 UUR2Q6Y0qn6bh7/SibUpHVfamlRsDfnmtuX6cRfOVwumvQmm5nADs2mTFFvS5LmCG7qr
 sT0TmklwnwvBTZOeESc4uqzEE362xcHgUO6lVB+10dMWAi1GHMmocEpZMDSTBbmww/WJ
 R+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BVxnyFp5X4RvfAz2vnlIan698SUObGu/Nhwh+sEDGac=;
 b=FpA7VRMfYojUQssxDO+JFW7R9IpAHOVWtElQ5UbZ4ywFNjIqCPBI6Lyi6YN+QCPHQL
 oLfplivhFuiFjyylQvtRpZU0MSpXE5cRKXSwqhjgCgVzHEypCrlbFgHYcNKEQxXl5jVc
 bV6YBb0Yl8gLBqQFtvRphngfLOMhV0CtBFawdwWFw5OSGxy7ylaLk5qyMYjKkr7Do0Ef
 xj5nu2jEcg6S4u0oKU7gM2HzraecKdVOr4f+HT/y1Gnd0eN9VfQ1qbXmf1McXQXaScDP
 Q9EpsRabC0xtWI5ZibAHbk3mWjIaLK4xsdCzWK9snyotuC/l9r0tqgqtkvHVCGzBYuiW
 UDRg==
X-Gm-Message-State: AOAM532Y39HKFmDhNzDRAqdM/CHWYKF78IQSSNoJQzq7LdZIVzdYxBs0
 JlZNdnf43GQYroXGwr2e4ZWNzTI1YvVQRg==
X-Google-Smtp-Source: ABdhPJyZ+JFNU+nEyUcFLAc7xjhTk3YRbK5fq1M1IrZDNGVV7W6mXO27YOd4QSIS0II7V5tsWBl34A==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr4845878wrn.3.1624544577177;
 Thu, 24 Jun 2021 07:22:57 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 2sm3286882wrz.87.2021.06.24.07.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/10] hw/sd: Add sd_cmd_ALL_SEND_CID() handler
Date: Thu, 24 Jun 2021 16:22:08 +0200
Message-Id: <20210624142209.1193073-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 hw/sd/sd.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b63d99f7da0..70dde5ae0b8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -999,6 +999,17 @@ static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
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
@@ -1038,17 +1049,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
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
@@ -2105,6 +2105,7 @@ static const SDProto sd_proto_sd = {
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
+        [2]         = sd_cmd_ALL_SEND_CID,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
-- 
2.31.1


