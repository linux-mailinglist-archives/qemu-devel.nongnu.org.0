Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94945387D3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:44:25 +0200 (CEST)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlJQ-0005kH-Ky
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDx-0006Un-3N; Mon, 30 May 2022 15:38:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDv-0008CN-JF; Mon, 30 May 2022 15:38:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id e66so10876351pgc.8;
 Mon, 30 May 2022 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJO2kVCczmXNji68pRuyrx67SZ6xs6b+pC/1wsj0JMU=;
 b=Mw0WMZI/hpylm9nOZIm9BtHTXHLXQ3Ckj7kMDOLKLaNTGP4rJg7dvpcxohvgbN6DuY
 bakrmetn2e/k1rYQKmXwcDMdPOL5L0YkU/Ya+cnJhpO9DRyYSqN9uvD4Ae8NabAe8GHU
 pMwhlh/UPv1yr33/SoFdoKlfxwWGtYgdPBKiBaw4kxL6wLew1vaU/DfAcQCtmGOFxr6u
 5MSp3jjI4Bkb8nYgbfSa6602LaTGB9bbhsMBruEZWTfk/dYhnPF99deCxRnNp7F/cYWt
 lTXwLROPRO7uIGl21YwVoOpGSl9SsSs4ScIQ41ybAtEVoxx1YkYrGVotcmD/mM1BgGT5
 FGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJO2kVCczmXNji68pRuyrx67SZ6xs6b+pC/1wsj0JMU=;
 b=sg11wwq1iqQHZIe+GAHW6Rbmcrl2nawgRkTNhxQFVONToj+hMEcn0+3BIeaaHzmoY1
 EXDmxS6/MsvFZthr4xYXrSdQded4jQymIHSxMMpDgAeqvhgqAYHtpmZ2dXLsiVwMX18Z
 52lu+uWgRoHTXrWbiUehNXpBdi/Hry/RvMs1q3eWFzKLQJL0oen1oUKsHJpuiCFP5jxw
 VMjE+bHrAGWIIeu1nZXFj/zrTVi/joNQrUfDaPHBvHcTwVWviLqzLkzhjQ/KeRRb/6Ou
 MdJc2xVbKwqclVkupDe6hreyYl3QXwr4VUVKHFD3HjvZwd239VsyHufLzfCm9BwQy8tN
 xzcA==
X-Gm-Message-State: AOAM5328LuhwTGcnaucoWmhR+XExcVyBcAT/uAGtiVIue6lLG51GIWDt
 WNXSDlp5zd8MGO1QJE8zn6cqoN3uoLc=
X-Google-Smtp-Source: ABdhPJz32BLkdJl/6evjL9tbbPcjZrBvpRbm9mKaLvTqeu04Dzb0b8KAVF+MOEGC/OiUhYQQCtR2dg==
X-Received: by 2002:a05:6a00:889:b0:510:91e6:6463 with SMTP id
 q9-20020a056a00088900b0051091e66463mr58666738pfj.58.1653939520514; 
 Mon, 30 May 2022 12:38:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ij30-20020a170902ab5e00b00163cdf1a200sm3514900plb.38.2022.05.30.12.38.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:38:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 02/25] hw/sd: When card is in wrong state,
 log which state it is
Date: Mon, 30 May 2022 21:37:53 +0200
Message-Id: <20220530193816.45841-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
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

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Since we will reuse this code, extract as sd_invalid_state_for_cmd()
helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7e3bb12b1a..b0e7a7e6d0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -966,6 +966,14 @@ static bool address_in_range(SDState *sd, const char *desc,
     return true;
 }
 
+static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1534,9 +1542,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
-    return sd_illegal;
+    return sd_invalid_state_for_cmd(sd, req);
 }
 
 static sd_rsp_type_t sd_app_command(SDState *sd,
-- 
2.36.1


