Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1353B315D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:31:04 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQNj-0006dN-De
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFm-0006kP-UW; Thu, 24 Jun 2021 10:22:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFl-00007q-CW; Thu, 24 Jun 2021 10:22:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id o22so3161182wms.0;
 Thu, 24 Jun 2021 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2T5QOlfHrf7iG9/cLfyY3m+tgUgjAHfpuMa4aQXuhE=;
 b=pZK+OxXsw7rulKYQ+x9wUUXA4wmeLQgxKF4hLdhDvnTRLSrdKjTHQfgTMQ9h6kZlzZ
 JFhbYQThC0R3Bnd93pk+G6dn+HRHzuYR0ecxyqNHiQL4LinmIuzpYJJ59pyaUASPqbms
 lljuGdAOXtPkCo3vbZ0r6/OsiWgWpa1kIk0M5cdWDD642rpSjJeiwlQ+hbyOaof7g+L6
 XfRya3qV5+cf+f3tHqzgPRdgdf6brNxCmeCVTnY6hA/tWMlqDo51SeYqQT5+1CjSPlJb
 PUc+sxpRsKG96d0/mNOMHfoD04hZxQ+iMDuZc+bUsZjTu8AgGLboc5ybIekhTwmjRsaD
 yNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t2T5QOlfHrf7iG9/cLfyY3m+tgUgjAHfpuMa4aQXuhE=;
 b=XHRDE4km7zNaeyrJID2ANbU+14v11ANki3xTQR0hWq5Jz0kBalKUWmwPb44sWAzC5W
 cBXkpYpnehYhLZ8tEfRle2/T8cyPn2qIpV/GuwByrnt1PHrLGLE0tNVJLqnhOeVC1Kh5
 n6A83JewlR5zONlSAhviDEGl0wgUw69wrW8tHQISOU+CpfXY5HLvqQez1g6oDw371SPH
 FRlDeyNr5f6HZhE6hnzwGU0TnUhKqFo4jl5MmvBD+2KgplCShKcu3x35p1tLN3pI/UlT
 E645aJM6kavQ0jbaUUUJtEtTVAOq2HeRpF/iRtpneszrMK0WdWUrtIx611CkDEB3rvks
 cQHQ==
X-Gm-Message-State: AOAM531a+owy5xVjsROxVQ93PMUP9el8IYgn6Xfpu3QHhaeA1+LYYV5z
 m1qEc8NJpHofF3s5MruS3dCIpyoxGnMlpA==
X-Google-Smtp-Source: ABdhPJwX/d9F44h/H3fJPc3Pl7hu+ZBQexi1MfAoSkjYBSC2yDO48tO9JFqn98OSv5eCiUM0YFeaLg==
X-Received: by 2002:a05:600c:4642:: with SMTP id
 n2mr4605130wmo.101.1624544567562; 
 Thu, 24 Jun 2021 07:22:47 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 12sm6965377wmj.12.2021.06.24.07.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/10] hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
Date: Thu, 24 Jun 2021 16:22:06 +0200
Message-Id: <20210624142209.1193073-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
 hw/sd/sd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2647fd26566..3ef6aca89da 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -982,6 +982,16 @@ static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_inactive_state) {
+        sd->state = sd_idle_state;
+        sd_reset(DEVICE(sd));
+    }
+
+    return sd->spi ? sd_r1 : sd_r0;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1021,18 +1031,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 0:	/* CMD0:   GO_IDLE_STATE */
-        switch (sd->state) {
-        case sd_inactive_state:
-            return sd->spi ? sd_r1 : sd_r0;
-
-        default:
-            sd->state = sd_idle_state;
-            sd_reset(DEVICE(sd));
-            return sd->spi ? sd_r1 : sd_r0;
-        }
-        break;
-
     case 1:	/* CMD1:   SEND_OP_CMD */
         sd->state = sd_transfer_state;
         return sd_r1;
@@ -2089,6 +2087,7 @@ void sd_enable(SDState *sd, bool enable)
 static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [2 ... 4]   = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [7]         = sd_cmd_illegal,
@@ -2104,6 +2103,7 @@ static const SDProto sd_proto_spi = {
 static const SDProto sd_proto_sd = {
     .name = "SD",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
-- 
2.31.1


