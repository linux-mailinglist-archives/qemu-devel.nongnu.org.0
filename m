Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F472F7FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:35:36 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R8R-0001Yy-RX
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4T-0005xT-1M; Fri, 15 Jan 2021 10:31:29 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4Q-0001DG-Qg; Fri, 15 Jan 2021 10:31:28 -0500
Received: by mail-ed1-x52c.google.com with SMTP id g1so9299394edu.4;
 Fri, 15 Jan 2021 07:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=55dYkHbl/cwpKN2kA/sZVcE4jjUL5RKiblFskzBR/GA=;
 b=LM0eThwHGM0htSwCiVS/1dNHnUU8+1cGq4s8BGwylgNVjgcWSt5LgHY+ANj3HSh8yJ
 sFHFdSdOVu6gssGcdGEt5YlPL17YTgZA4gSelQA79xe1koS7V4kxV+3oSimEOhuimGRK
 OC2VTHB7UJMCHxfrZMJxM+EBp+KfZil1kT9EVpflQGueoWWsKbcpCZMDXHSZRAMmw0jK
 edKC4TF80SwELmBR98tVjXs72Eti4ePqPeR7UIu28YaNj8w1KbpHHZ9JFSHhqd+44V0S
 KX0q2hm+ZwtJfd8zLvvHzD8M4cfPs9ESKBuXh0W2pypiSjKltD83HP7VrEmL/2VV4DMk
 705A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=55dYkHbl/cwpKN2kA/sZVcE4jjUL5RKiblFskzBR/GA=;
 b=Y0DhnxU6p0RDBAEmRRDzP1hEeezUNojIwMlMvrP3J8y8HbCz0xMNEI7EqXrscokkUw
 KXkayATRKVSQfBVMkNhAHtxjY/iV9DKmQVcN1yp78dDO5garL4PDACM7TB3fPrmta8ya
 geo4rHVvytdaU3w6QB/fdX/u/DQ3Q6KvjCOhSZ6vj73/PKUN1Vm0sjGeR5dRE6eW2RGm
 X/4r1ERaoPYy8pKDedz5Q19YYBOc1byRPgv1c/N9TtUk/itUj807pM8WFPN0Q7SHLSXn
 yFXC8jRWpfvrMLvzbqQ9aKuU+8vwz1zMX4YpTd2Eii4AUN1DxHRQEq4tg/Y2ldPiutvm
 cClA==
X-Gm-Message-State: AOAM532ZxcXWodL5aep2iXIqmLTX6YarTpWb/VX8wLe89h/lqTpf0HEn
 zawfkiGbPt7/3ztriAtVpeTS0F+a8yY=
X-Google-Smtp-Source: ABdhPJzE2HLxi/PzuMR3uNE6yeTL2wjXoccf9fn/f7hQDo//uPoqL92nPqvIKAuqAzK+coYdt/O/RQ==
X-Received: by 2002:a05:6402:5246:: with SMTP id
 t6mr10038334edd.62.1610724684744; 
 Fri, 15 Jan 2021 07:31:24 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id rl7sm3713330ejb.107.2021.01.15.07.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/9] hw/ssi: imx_spi: Disable chip selects when controller
 is disabled
Date: Fri, 15 Jan 2021 16:30:46 +0100
Message-Id: <20210115153049.3353008-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210112145526.31095-4-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index f06bbf317e2..c132f99ba5b 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -254,6 +254,10 @@ static void imx_spi_reset(DeviceState *dev)
 
     imx_spi_update_irq(s);
 
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
+
     s->burst_length = 0;
 }
 
-- 
2.26.2


