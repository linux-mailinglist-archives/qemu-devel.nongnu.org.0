Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175B5387D9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:46:42 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlLd-0007x8-JQ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEn-0007RE-QQ; Mon, 30 May 2022 15:39:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEl-0008KT-3H; Mon, 30 May 2022 15:39:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so183668pjs.1; 
 Mon, 30 May 2022 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rg50Y+o/eUBM4CXukBeXYZLp2dR7HPz/PEGiozmLP6Y=;
 b=JPSP8o0dKou9uVyq3AFeQ53pDBjfFbAHq27cLZmArPZK3vKbM8UZV568fS6TntPiHX
 IqPqUEm/ZBRzkWUpiuS8txARfpAMGovGYwEl1LBXZDHJ3Xdnz88PcfXLaQ3ObWj386yX
 rcaSMMt9tsbxneEuAjrmmiGfY949MixeVMWFDn3AvEdiFVFMrIFZvKhZvwU1DugkgC1t
 f5kg7kwYUuPpUPj2nI6OAFothiVLyLkx5mWklRLmylAdVsIwOfXt86OzVZodctm14BJt
 Qkp+E1hknZEZuRJSFkxxXjB0CpURzNNqBSBieqsdsqTWt4lH/tfHHUCeRHKtyc2FNDhx
 2RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rg50Y+o/eUBM4CXukBeXYZLp2dR7HPz/PEGiozmLP6Y=;
 b=EV9zO1k8EQPmFMui+x+6MoVOX12NlnGjTTxNqzbnN9cIi0dLwKa+YZmIgd2nXnLeIH
 mM6qyOKPcEh1Wc/IqEBiTQ9uqo01kS4Rgk4OO5U4jw1ojNiioeylYguvvL9ChxES+ySI
 1NP91P7cO4KfqXXVRqgwuvLcV5LGruopA1tCjY3Du08ZhilP1GJ/DYQ+FaiHg9dEBWS3
 dy75ABGq+7w+t9Zcgo4ufdasOxECRvuJc8GW6x5D6e/LFcRTsqL0lP6bHESb4jLfA/SA
 v86MIfrH0DUPJFFSfiyaCl8m3onwfoFQr9WuQsbS1Mbe7qhbA9thIt6KOjrao9LXtrtk
 afJw==
X-Gm-Message-State: AOAM532CYLpgzKjtZ/CzhLiXbJyqZda9ktzvc21r9IQ4g0o9ijVdix3o
 6eJZ/K6/vAlTJWd/zOboXX11Co5PtU4=
X-Google-Smtp-Source: ABdhPJwSa4+x/hTMTq1v9eukOa3b88lWiYE7ogSHRQG5YPR/DBvH1+u/FxvGr04IMmiaaZkgsqZ4kQ==
X-Received: by 2002:a17:903:249:b0:163:6dc0:b8b3 with SMTP id
 j9-20020a170903024900b001636dc0b8b3mr24575333plh.24.1653939573124; 
 Mon, 30 May 2022 12:39:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q44-20020a17090a17af00b001cd4989ff41sm85671pja.8.2022.05.30.12.39.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 08/25] hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
Date: Mon, 30 May 2022 21:37:59 +0200
Message-Id: <20220530193816.45841-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
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
Message-Id: <20210624142209.1193073-8-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e018498b10..22405e8bb6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1020,6 +1020,16 @@ static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
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
@@ -1059,18 +1069,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
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
@@ -2132,6 +2130,7 @@ void sd_enable(SDState *sd, bool enable)
 static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [2 ... 4]   = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [7]         = sd_cmd_illegal,
@@ -2147,6 +2146,7 @@ static const SDProto sd_proto_spi = {
 static const SDProto sd_proto_sd = {
     .name = "SD",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
-- 
2.36.1


