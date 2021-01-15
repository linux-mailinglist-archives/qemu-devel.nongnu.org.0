Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D32F7FB5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:37:24 +0100 (CET)
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RAB-0003bi-Fn
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4D-0005lc-A2; Fri, 15 Jan 2021 10:31:13 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4A-00014D-78; Fri, 15 Jan 2021 10:31:12 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so2816336ede.0;
 Fri, 15 Jan 2021 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z4qy97PFtHKZ/41ys7UAdQh2nrLy+ZugZUPugDx4O98=;
 b=AKI5uBOzblTOtH+Y7blzK5kUzm7yX4uP4lOKG2Q6F2ycmw3FsO++nnhUxzXdfA5XJG
 XZYZ85YCskXvpMe8rpnC4HrptdTt3GjMUclmZY/RyqkolB1AblsypnQ2pYKXeZXVmTyB
 e+/yXhRrPtzGfkuwxMOwv/AfHd8rHcZSpwsCpIwJMTy09UaREP7jYC915+nl5LCJjOc1
 5EVlz0Fig/u5Xvg7U9QqOXRcj377Qjd1MaH5onD7vpHLYEhWdKjjgInQiY2nL58GFiPC
 tulis2+2sfRpwolfN/pbgkBw9WrsVO8Kx+gswt0NiwGUBL8yR2kgA4AIfX35TIGdYnKy
 N5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z4qy97PFtHKZ/41ys7UAdQh2nrLy+ZugZUPugDx4O98=;
 b=eI7LylLZn1yXdRzgzQbTX1ze5xehZIokZZKaBm1cEHvokGSbOEMjkNeuohV5pskbSd
 pGkRgPhqlWJrYEHguap7kf9YBDdSbtApTiOjKrGEAWuXwmYnkKuPDvq681GQ+IwlkzC+
 ka79eCVIDRw1Uc37nY5S3qhuZFvk9uR/HHhGiZ2fRUOD/tAsMfD2A092WJEqtqQ0/HkH
 K3Z43VWge3HsAWUj171vrFQHOsUT1V4T8oj9+t/L6nYVSng1C3K3h7Pgh3bnh8eugSYz
 6u70bOaideps/MWqwHUe7sOKxxF21X/iUQ/ntHIjVqg36i2EG2uXQF1XmNNT3e15pyZM
 Sa5Q==
X-Gm-Message-State: AOAM531jP0lHWrmaoSlrh7asw8g9NTOt4nFuTsl3ysEFQcITa3EWK13d
 QeuTIJ14NpXMdNPpCFGfkQOUUKgWJmQ=
X-Google-Smtp-Source: ABdhPJxHD291RM+cDSzyoPG+y1Ffmdg+MFamJVee5CPxbE0/XGtkUPwwimZP+IE2KD8yhhdl0B0yqA==
X-Received: by 2002:a05:6402:40c4:: with SMTP id
 z4mr9862256edb.233.1610724668346; 
 Fri, 15 Jan 2021 07:31:08 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d4sm4147193edq.36.2021.01.15.07.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/9] hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG
 register value
Date: Fri, 15 Jan 2021 16:30:43 +0100
Message-Id: <20210115153049.3353008-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the block is disabled, all registers are reset with the
exception of the ECSPI_CONREG. It is initialized to zero
when the instance is created.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 40f72c36b61..78b19c2eb91 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    unsigned i;
 
     DPRINTF("\n");
 
-    memset(s->regs, 0, sizeof(s->regs));
-
-    s->regs[ECSPI_STATREG] = 0x00000003;
+    for (i = 0; i < ARRAY_SIZE(s->regs); i++) {
+        switch (i) {
+        case ECSPI_CONREG:
+            /* CONREG is not updated on reset */
+            break;
+        case ECSPI_STATREG:
+            s->regs[i] = 0x00000003;
+            break;
+        default:
+            s->regs[i] = 0;
+            break;
+        }
+    }
 
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
-- 
2.26.2


