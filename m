Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E72F38F9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:37:44 +0100 (CET)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOY3-0002er-IE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWH-0000y5-78; Tue, 12 Jan 2021 13:35:53 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWE-0007F9-Ew; Tue, 12 Jan 2021 13:35:52 -0500
Received: by mail-ej1-x633.google.com with SMTP id w1so4885077ejf.11;
 Tue, 12 Jan 2021 10:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZanZiJ3tTZSMBujs+F1bLNbZeY/v2F63RmtFKqnRXj4=;
 b=dUoqNviw/pjbxVL7TjynR6A/+y579dM8g8u+tMtPz5fQKSBztKWEBI65tCRom+hNZg
 oijQ3NMQuMtbqnWixlyHuKiXVl7ctkHdWR3mkl4limigjVmNPQ1dP+o+vCm4AINfqTFM
 OwoYnNBXYUKlO+HrMvdwAjHpZz1Elkn8zMkJ6WAWlEGb7xdQFaNSgC7Yj8fbGVxxnnl1
 TEc9ZK4FVs8xRxYBHwAfRR1q3CFBWXKrDDJzdfKJ/2lQjsewJ9pha7GJi43E94CnBcyx
 ZChaVjTEoUy0Ujb/AcUHZlQS/vcw78KtaeViYaaO4Nyi1xYxK+L4wjGlks+Gns47KNo+
 nbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZanZiJ3tTZSMBujs+F1bLNbZeY/v2F63RmtFKqnRXj4=;
 b=bme45xCW6FJFlbaYULaw22IOeNMRAkfNXMdYJs30kpnp/KykUCt/5laXMypZTUdKk+
 o3VrPTHAo2ZJMxQbVllkO6yUYRVhIWoEzbeqemMK/zbjJXm7rP7RtuGnDIcgF7Y16T0t
 4/SzBxgih68HR46yTJ8HPqwop5abH7Ua7fnMbaNN0Te3ncoBhCk17SackLZr6SRuaVwe
 SIn0PxnJ+zqyMryYcOYPuMsfraKYfvfOJAcb3oM4Hd2wepxvSA0IrMnkSgcV11C/T6Xy
 voHOrBPPgi8WY1yBxvqWIJWPdj6CEuj9EUHbzsY3B4NVZ/RilPQeGOeGA0jb6vqI4W4a
 KQig==
X-Gm-Message-State: AOAM533uGt67gffzF9DBrLuOy9YJVWTvbvAnq6PVZszM09O0oHrerWT7
 54hXzQw6fBwtRWWmZfyh0B4=
X-Google-Smtp-Source: ABdhPJysWxc+TAlm+ctgH1Xuw3U+dIcY2JoBnCZcJOfWq19ss3KHzzKDrTCH6LUMvGYcbq/pkumZmw==
X-Received: by 2002:a17:906:653:: with SMTP id t19mr138235ejb.44.1610476548916; 
 Tue, 12 Jan 2021 10:35:48 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id qn4sm1510593ejb.50.2021.01.12.10.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:35:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 02/11] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Tue, 12 Jan 2021 19:35:20 +0100
Message-Id: <20210112183529.2011863-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a213..40f72c36b61 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -428,8 +428,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.26.2


