Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848625387E4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:54:08 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlSp-0003yy-K1
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFk-00011g-Pi; Mon, 30 May 2022 15:40:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFj-0000FX-A2; Mon, 30 May 2022 15:40:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id w21so122228pfc.0;
 Mon, 30 May 2022 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bD+/gL5DIK0X7iuBgZKzxQ+ir0BOqublJqqgaaEZNs=;
 b=a742GVZzEdMrm5XU/BPLymhdpnDz7nC2yRMcxM8fTBp0rmcaNLo660b5gDp/B4V2KU
 lsIv3aWwifKxQCnnGIN6Z5xpVniN7F/ulPfBgVZke7yXij1V+FvHpWSz0Hu3z0PeIOgF
 3RLBvJ6f88l4pZtXn8F7PTL/LmssMKlGAIbbZEwlLLV/CBtAxAbsG79vGC8AKfYbKcv/
 z6czFYa6BdB7anvrI46c17KZTC0+kZxo+p2p+PZpa18Y8RTYV3Qar7c5T4No0TYuPcWw
 cpS9oaApnY9l9eaQ8hW1ClnM0i6qqyzsFG23Xf8zY2LjJaK+RYTrWNQzME6426/h7E0N
 nlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bD+/gL5DIK0X7iuBgZKzxQ+ir0BOqublJqqgaaEZNs=;
 b=kle3TiY5l09ZEJm9iuO5NCppAaB9LSGpC9iiw9n4WBLYZr8J3lXZY8kviTBz0L0PwA
 50w9z0XzSLqvj6Ww07JFTAN8YF4hK6qV0PJpIQZKSLTJt6qTj3c+pdwr4N4GgcrosPor
 1F5sullnxVBaTRpOm26VP87D4nH3aAty8YKocFOnUct6EVDBDyFJObt4hXKcUL45kQgy
 opC4b2ZnFfFVhmVYsKCi/THDw8Kw63P5jKb6wJfpQQm7Pre9+f9AErx+aFDImtvmMAPp
 wqo5BKUv5nqrvdZJyh5C+GI8TOVf6trBiVeAIsUgGoMfKR4R0WM2DDuP6tPBKF33cpa/
 ieQQ==
X-Gm-Message-State: AOAM530t0d1GLwg+ULlJogfE0yJ38tn5Zc6Lechb2qjnIAhMgq8lkMO/
 fjKawlPLjtk6xARn11WMWr36FIU8sb4=
X-Google-Smtp-Source: ABdhPJzWiLC2gVEO9y/zScfs6/MhnDwkZw2MCRAstV88jLBLU8BqsTuSQCl3rPkrGLJmOvJW4eqyFg==
X-Received: by 2002:a63:f913:0:b0:3fa:2b27:bb82 with SMTP id
 h19-20020a63f913000000b003fa2b27bb82mr36558323pgi.213.1653939633188; 
 Mon, 30 May 2022 12:40:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v129-20020a626187000000b0050dc762814asm9276110pfb.36.2022.05.30.12.40.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 15/25] hw/sd: Add sd_emmc_cmd_SEND_OP_CMD() handler
Date: Mon, 30 May 2022 21:38:06 +0200
Message-Id: <20220530193816.45841-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
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
 hw/sd/sd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8b178aa261..538231dbab 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2166,10 +2166,17 @@ static const SDProto sd_proto_sd = {
     },
 };
 
+static sd_rsp_type_t sd_emmc_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
+{
+    sd->state = sd_ready_state;
+    return sd_r3;
+}
+
 static const SDProto sd_proto_emmc = {
     .name = "eMMC",
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
+        [1]         = sd_emmc_cmd_SEND_OP_CMD,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
-- 
2.36.1


