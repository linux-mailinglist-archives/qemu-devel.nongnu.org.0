Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D452F05E8
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 09:17:31 +0100 (CET)
Received: from localhost ([::1]:52064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyVuk-0004wg-Tu
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 03:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsd-0002pq-Tj; Sun, 10 Jan 2021 03:15:19 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsc-0005zy-Dg; Sun, 10 Jan 2021 03:15:19 -0500
Received: by mail-pg1-x532.google.com with SMTP id q7so8656029pgm.5;
 Sun, 10 Jan 2021 00:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yiZYra9gqHUl+N2i47qt4AFi/fzPb5dHXFPbEQlB07k=;
 b=FX2A05NGeP+4h8z00v1eu/L+MQtV3kotxT7akCuflOLL8F+yI/cFwHmV96pt404Z/s
 syeYnPBO//xRaakbgeP80JIfgXPBqWJWtI4T/hRyZLoSDR1SlxzduEbczsAuFnO4tMd6
 /c715WQ08aWocvRL/NRyculieNESKluipnjOYeqhh29HNrAkK+ZwWbC/lPCo0VghKwHA
 nSbkHQvMZzpPt6SMvCqzVNhHkmXi99KJ8Htk7TFfAJpY4c9sc15NUV5UK7eKOCATsI6n
 CAR3+BbkTg2qvqPRGWHwRa53n2+rU8Geg8kY37dzspm6YO5V5/FMKhTWifDLX3s4AXGp
 swLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yiZYra9gqHUl+N2i47qt4AFi/fzPb5dHXFPbEQlB07k=;
 b=mb+iZEbdRg4407GtXe/VkagtMnX+k7bDkqh4d12zdBLGUv6emyliBdCi+6A7XwtWFJ
 8p6UXkrF1bzckMvPoyYr1B9jpQZHweXbQLfqjBEMP/QvWWfqE9OdITmRPQHuJnhiyIdR
 qO9w4qi4Urio0I8xvivzQfQp4jwUiUqHW4Q2XNkB/0zzjMp5jCkLLUjFPR4ZxibhrmxI
 o4sAx+Ydk8Zg1rn8cWcTgcGX5fedPxenG/Eq1oCZlpEkUfIrmagTC+ywVFKv35S18mmf
 r0IoeJp9jA9IWeYXPqnAFJ+st2r9cLq/JQBSaHBmFj7Qw/VSqtDr4L8IXGCW6da+6lfp
 tsgg==
X-Gm-Message-State: AOAM5305URRwdE0DECmJ7pQNDC+XhdDU8i1PS8JYQOkSzVGPNeEOHHdh
 5PTsrf19xvbojAY4XLoTc8g=
X-Google-Smtp-Source: ABdhPJxcPPskbBNqVtnT+0U4EAvzBNE8Kdji5ECt+C0psZz3Tq/DJzf/+2n4YMo/Lf1XsoYPnLpjbQ==
X-Received: by 2002:aa7:9846:0:b029:1ae:7f23:c5 with SMTP id
 n6-20020aa798460000b02901ae7f2300c5mr3819063pfq.44.1610266516969; 
 Sun, 10 Jan 2021 00:15:16 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:16 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Sun, 10 Jan 2021 16:14:24 +0800
Message-Id: <20210110081429.10126-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f364..eeaf49bbac 100644
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
index d8885ae454..e605049a21 100644
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
2.25.1


