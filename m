Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969675387F8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:00:26 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlYv-0006Os-JO
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlG1-0001CL-Mo; Mon, 30 May 2022 15:40:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFz-0000H0-QN; Mon, 30 May 2022 15:40:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cx11so3377665pjb.1;
 Mon, 30 May 2022 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IeIpypgJ4YsP/dCbKUVkwF0x+mKlRm0S64Ii1oPkA/s=;
 b=p4vBVKgA8V7P1wmOuCS9T0WiClGDgnqSRSrbdyvegMc1/v/HLtyMzfytf0l27DgoZK
 BAeeYWZCmdiRkNG+0f0mo1CY/MpzGKNrfNsV5N5OyYWwfE71pc8Fojnb1t9sIr+28Hzx
 HwWMmIZ9n7xZ53rmfuJV+fia6yegq+as9WUtJn2wmkRmBWkHyktzCJ6T0oduZxbh/0xM
 gpiy0bK9JgC2IA7gfQacuWkJUDplEahuWK2OibGYNi2L42tDjWKMeYVTou6gOFS9WH9n
 kZ8KzeL7NXdlT6gKbuMHe+M6FbwrMEa1gKifRXjQnXgqUMzm3I7XYnf1Viq+SNPmFT0F
 on+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IeIpypgJ4YsP/dCbKUVkwF0x+mKlRm0S64Ii1oPkA/s=;
 b=MWIyyxa91UZWv4oO1lgDEqlKfC4X8fjTSCEv9kQ5lwolCJaCaW+7YT8SEd1XCREUOn
 HvBCpfnZ5FZ8bwcrYhmaUXL5dXYGOyGVWR79U7069jv3eW3gGzxHYBMltwqnmRxUdWpd
 Eqf65Ii9c5R4buK/mUNGpNKm2nag3uzU4QdZY77uMcFM86p7q8wusVWvkhWDbjfbedRm
 IYOJn1HlQ/FuYbyjGv8OVaT6A+cCzRNJ+96AGgen4UVztB0s4YfRohgBMpbDCEa5sy5b
 21bPQd29GlkkByHhNoONwhLvavTbtMHhzxUvBxmTP+DG0oNhM026o886ra9/nF/CwmsW
 87bg==
X-Gm-Message-State: AOAM531Zqd5hG/iQUn6NZyTPuiILRRdNJP8hExCfQYVNKTecyeY3nd2T
 juHzrlJzReGKgsPjnnXlHliEchf1HGM=
X-Google-Smtp-Source: ABdhPJwaRFJaITyF0RHybTcZ2BpQmF9ptjOMGw5BC15W0kqZsO2Q0rZJNYhC0yY6M7N3q7T06Y+qhQ==
X-Received: by 2002:a17:903:2304:b0:162:ed1:ed9c with SMTP id
 d4-20020a170903230400b001620ed1ed9cmr43212316plh.122.1653939650029; 
 Mon, 30 May 2022 12:40:50 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pf5-20020a17090b1d8500b001e2a36fb4aasm65644pjb.43.2022.05.30.12.40.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 17/25] hw/sd: Add sd_emmc_cmd_SEND_RELATIVE_ADDR() handler
Date: Mon, 30 May 2022 21:38:08 +0200
Message-Id: <20220530193816.45841-18-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 5e315f171c..100fe191a7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1048,6 +1048,25 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
     return sd_r2_i;
 }
 
+static void sd_emmc_set_rca(SDState *sd, uint16_t value)
+{
+    sd->rca = value;
+}
+
+static sd_rsp_type_t sd_emmc_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
+{
+    switch (sd->state) {
+    case sd_identification_state:
+    case sd_standby_state:
+        sd->state = sd_standby_state;
+        sd_emmc_set_rca(sd, req.arg >> 16);
+        return sd_r1;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
 {
     switch (sd->state) {
@@ -2189,6 +2208,7 @@ static const SDProto sd_proto_emmc = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_emmc_cmd_SEND_OP_CMD,
         [2]         = sd_emmc_cmd_ALL_SEND_CID,
+        [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
-- 
2.36.1


