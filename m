Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C92F391E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:46:01 +0100 (CET)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOg2-0001fH-MA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWc-0001XF-6P; Tue, 12 Jan 2021 13:36:14 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWa-0007RU-Kg; Tue, 12 Jan 2021 13:36:13 -0500
Received: by mail-ej1-x62f.google.com with SMTP id 6so4937015ejz.5;
 Tue, 12 Jan 2021 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sTf/aemsAO2NtfPs8v4zrOflI4yUb4IKKFkIlDtQdrA=;
 b=nt3Sr93wmoNyIKcCz30xibARHh/Rs7H3fHH6D446KnXhwTyWIkulJq7KfkrYodKvru
 aXDJt50D9ItyavdSgWtYPl7yFpSNv2eF7V/MuiMFrZwZZkOPbndH9iryksotchCc+8F/
 TOEbXjMKvj45tc74hvq5C1imH7Q9FJFvFzBTXtnFEgMk0TMOxXQGHQHDjOK6XvGEodVd
 8BuSpizxXUtxillHfEMKT5BmMdhEmCGeoP0pVo0AMXBL+/vaqJy9gCJStJ9fgfODvBBk
 NgpIAB00M16eVPPiKuFDFGYCuPLCQx1t4945XaqZtfKyVMm4rBvnUmIX/+Zkfpo1Nwnc
 Kk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sTf/aemsAO2NtfPs8v4zrOflI4yUb4IKKFkIlDtQdrA=;
 b=r0bJ2rakuVu7A7nuSuFEDvhsQ3C3Ks6t4FCFDJVW4g1vG50dxuC73vWo2jK5s1WeMd
 ia4npmxvZ1AetBjpVhaUGjEFDkTMi5r5umK2w1J2XcHChIgMiTy6UWNc15uepXpkENM8
 lMbPDQnqYdPQ0cH64Dd8Zu6Yv0D5/NixI1rgqz2sTCrrZDrtoBV6OsRSpHxz9xDUfusl
 nwlA/2YzMG0BpsqP1b5bw5ozOR2NBbROeNVTfHPbV/lVQNoOUqx7/D0dX9kGEaoqgZy2
 PEDuYwPBKmq+JZaXeEbGiVVQXUQ2eCBm0RtFIcayDKhXc0QbkFGmaMHMf1mfkK5igdYq
 xDDA==
X-Gm-Message-State: AOAM530HGW1UOD+Bcq2+LJSBgURyHxd1eJnaGQVADlORXETlRMuGhSd0
 eKenE0EawOVhVkoOqHUzMtI=
X-Google-Smtp-Source: ABdhPJyTLFYq815QTQiMct9wfSoFn3sulj1+mU2xMypZG7hgK72rzLWTWoiZ7LNFLtGEt9U8PIJUPw==
X-Received: by 2002:a17:907:206a:: with SMTP id
 qp10mr124370ejb.432.1610476571090; 
 Tue, 12 Jan 2021 10:36:11 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id d8sm1823526edm.75.2021.01.12.10.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 05/11] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
Date: Tue, 12 Jan 2021 19:35:23 +0100
Message-Id: <20210112183529.2011863-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
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

When the block is disabled, all registers are reset with the
exception of the ECSPI_CONREG. It is initialized to zero
when the instance is created.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index bcc535f2893..96aecc8fa28 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -232,12 +232,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    unsigned i;
 
     trace_imx_spi_reset();
 
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


