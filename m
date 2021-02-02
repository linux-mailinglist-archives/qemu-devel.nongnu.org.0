Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E027F30C903
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:07:36 +0100 (CET)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l705P-00086U-Q2
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zts-0005Nf-5S
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zti-0002Fa-UC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so21454214wrz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8r7FNnpkrncdt3Og1knfFavndfs/SPtYUNjSL/xsxQA=;
 b=z2hjqgCngx5vHvGpr0UODXdgSXXGPRap9MXKWZ1ObsvVKHob1JPM0uyY21j+YMBNpj
 j5AVliWAn3otqWGH1InSC0hvsUf+Ez2/taVhMkaslxzD5vNJZlJsVvWMx+yJ2AHli7Fp
 cQA+Y/fc12tIXegYs+zgmXCBqMAfxufzPCxIZe8d1DhEKEj+N+bANNLfaBzLPO6odfsP
 oYGRZEZzELoEcJeQ4oP+/fGOSth2L0WSoSeHFOBo0tEntVdMP4L3oFFCeB234W5BYtj0
 /dq4NvySmr0hBveDbhoPM9uAfhlfldOtOGRJ7yeEzFjvYLFCv4H7L0wqlPzt86dEZMI7
 J0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8r7FNnpkrncdt3Og1knfFavndfs/SPtYUNjSL/xsxQA=;
 b=j4gr+b4iP7o4Bfr5rYpRxEVjF7k7VSGMllYbj7bdSzz6FXyTODPAR63cBlSIfTWz7M
 hz9s9NRoZKs3rRbfeKHnaATeIEpOOvq1Ll1GYZEi6FaWq2GeNNQZ4rw3PtEvPK6OlNjx
 o3NMUV9kEagGk4XoTcSj1jey3BedErwJp0EhUsPjGe8w00q3ltWj/7zRMaGWufMMPgLx
 /hbyiX9MLStaEn5bPhvEtWkrQOrUYjMr0YbEVoosuhq+5drk2uWn1wRrumw0eFSEwR6l
 Xs57Nv4H1ZlixqagWbGGaLj9a1hJyhZotzlzpwAOflZfEgx1a8d6Xd/iEFDvfRy8+FqV
 mW3g==
X-Gm-Message-State: AOAM533OrPzCi4Y1uab9/PphGrMGFaFVJtLKyvpGyOlDBb/A0NLuZ9t4
 BcX8JHCktgmVuiG97ZswvjfAGKSsKIzU3A==
X-Google-Smtp-Source: ABdhPJy/s+NJdeUREBWgi0chBe+bPbQrvLa83i8YXs+5i42t2gger7O0x6Xy01GnZkOiAcDrS+Yvjg==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr24716975wrw.150.1612288524660; 
 Tue, 02 Feb 2021 09:55:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] hw/ssi: imx_spi: Use a macro for number of chip selects
 supported
Date: Tue,  2 Feb 2021 17:55:01 +0000
Message-Id: <20210202175517.28729-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-id: 20210129132323.30946-2-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f3643..eeaf49bbac3 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -77,6 +77,9 @@
 
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
+/* number of chip selects supported */
+#define ECSPI_NUM_CS 4
+
 #define TYPE_IMX_SPI "imx.spi"
 OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
@@ -89,7 +92,7 @@ struct IMXSPIState {
 
     qemu_irq irq;
 
-    qemu_irq cs_lines[4];
+    qemu_irq cs_lines[ECSPI_NUM_CS];
 
     SSIBus *bus;
 
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae454e..e605049a213 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < 4; i++) {
+            for (i = 0; i < ECSPI_NUM_CS; i++) {
                 qemu_set_irq(s->cs_lines[i],
                              i == imx_spi_selected_channel(s) ? 0 : 1);
             }
@@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ECSPI_NUM_CS; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-- 
2.20.1


