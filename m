Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BE3B3154
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:29:16 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQLz-0003Vk-FW
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQG1-0007Cm-Pk; Thu, 24 Jun 2021 10:23:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFz-0000Jo-Ru; Thu, 24 Jun 2021 10:23:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so6377966wms.1; 
 Thu, 24 Jun 2021 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odL4aPXo6G2NwNk7zPq0Akb4FqD4x5f/HsxoI2Fk9O4=;
 b=nwSHVBxvN19K6hEKysa0F/1wEeCA4nNxofX3HG8Hld4rxyJTjGzK0aLJGTmEcfjPqC
 Bu9lExkcH94jGRqoFuA63qhnUuuE4KfMxL3ypep6aaGIdWUFi8O2aX6rdqFdMXlBmvGo
 5oK58JukEhlXvvObg3GrGw5QOPTkA8jcLHDKBpXOO9gDm80mMOd8OUYLE6Zo4pZ7oJnc
 JZGEETznUgUM8d22gxKSFdfj52iE1hl4TgcAFthqpeC0TLJVmOE+8p1wHYFGVP17eIXk
 IhNYH9wwttQfrL9XlhBvzJs9/5BnPlIV7q7Q69DpSaAHPaZmW3DDDMU4ErQg9xlZ8OTV
 3pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=odL4aPXo6G2NwNk7zPq0Akb4FqD4x5f/HsxoI2Fk9O4=;
 b=S3TSl9TQImZqQi7EaRxjvLWbI8RZiVzCoZm3d/eS3bZk+60dmsn0SprVtTFe3q+6fb
 ErZfg8dS60zg+tqDksVLHgCGcKxrKJ4n0oAU78d1cAah9zVpkusNWmIhly4dDmIEG5Pv
 tkbY3ETyotHH069XZXpG7qIxU3zJXGca4kz64Mb2DiEL9ivtIjO5XG51w7hXbhwQSkaw
 j/FjUxYs4bTHAJqQVx25K17n7q7wa2rtI+N6zmaNGLCQerum/zB86+eVMhM+pEH951v4
 3sF0YEf8HGcWtsWywjfal76YvfDJwSVa4zmCcJKfFLJAA0k0DYuUbyFKbn6PN3RmaeFQ
 ZOvQ==
X-Gm-Message-State: AOAM5332xAP+80PREI8N2xO8j5TYX6VT8COvk6oN0d8z/sWJO7cBHShZ
 ob6lIa79PwA4zRBnnu8Qz/ydlktRKkTkgA==
X-Google-Smtp-Source: ABdhPJx5k0R3g7Bl5ZKKkl8eknVsO7NjOreXAuS9lJPJdQA6ayjudyNZbtfx6ajz4XVzxMUidrCF+Q==
X-Received: by 2002:a05:600c:a07:: with SMTP id
 z7mr4509002wmp.83.1624544582166; 
 Thu, 24 Jun 2021 07:23:02 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f19sm3287382wre.48.2021.06.24.07.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:23:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/10] hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
Date: Thu, 24 Jun 2021 16:22:09 +0200
Message-Id: <20210624142209.1193073-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
 hw/sd/sd.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 70dde5ae0b8..43a59b34ee8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1010,6 +1010,20 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
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
@@ -1049,19 +1063,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
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
@@ -2106,6 +2107,7 @@ static const SDProto sd_proto_sd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
         [2]         = sd_cmd_ALL_SEND_CID,
+        [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
-- 
2.31.1


