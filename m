Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB230C957
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:17:02 +0100 (CET)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70EW-0002mO-V6
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztx-0005QZ-Nj
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztk-0002Ge-Uk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:45 -0500
Received: by mail-wm1-x329.google.com with SMTP id w4so2004566wmi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gdtHlIrMwoP0z47d98DhPSjo1F4nkYLQdfh3htMSjrQ=;
 b=vOqC/9B8jUykf+sWEebCVJ9gTxI7mAUTbmVJwuvSKsGN7/NT28JEgSBRxhbmz3XOua
 IfGqaoN+G/IOTdvKNGXOo7AM133kgFaI/YfOKlEszVHM9uqL1jbiwUSIJCAyaffu3GRp
 LhU5k6EcJUVvwoxDd71RquE+b5YBXWKRWAS22YFOWYyb9AdZtjX600Qt4Be972jKo94a
 Pk3dwZVNZTMTz5yZHJre4jtHNyE6YcgKtziG2qaiZBVqKzyUtGnsGwn1Zh2v8oXmyaCp
 HlTasuvkA2/vfDkejFB0Z+69EuDFKVLWpIjXAgRQ8aKbHUy1aZWJUEIAMZyXRPUw+Prg
 wzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gdtHlIrMwoP0z47d98DhPSjo1F4nkYLQdfh3htMSjrQ=;
 b=BbHDAu4fYpGdobigVlZqz0BJj9YW7tkaNTiaMHZj0UKD6c8mdVFdQUb3JA70wi9Wd0
 5f/nrQUvo6Bydh6ZkMnqszFk4aKilcQXTAuNoioa/s2XhGBfxgo469inYPkgqNW4fMEs
 im1vJmUR557qCQU9EsoXzN+3uV77wcJlSApsONKlovONpacvxlpCWqHcaznSuhbJju6c
 LC8OKBWTERSVLzcikY6SKpzAQGUaOjOY/XEc3Yn7zTSEKxls5rxIiNIwSjpRu3gjwCG9
 vgoDcv25zOIIQIGfWXTXDbizJxKK0tQsZK/2wDjwfVPqlJT12lX3lthmUZwJZBO75mw9
 Qf6w==
X-Gm-Message-State: AOAM531XXnh0AMUZMiLkfI6H9bmKOwPyjNGR4h7fg2zO8StGG5mFr+Yx
 pZ6iQF7tAbnpxSE782TH/yAwKJLCf8zGvw==
X-Google-Smtp-Source: ABdhPJzIDg+tqfNi88bXatjfuLgan0o7rWeJrc6KdiIrK+QN4bXnJ0HKPz1vKe4K1tSN0nslfBQxBQ==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr4604528wmg.93.1612288530812; 
 Tue, 02 Feb 2021 09:55:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] hw/ssi: imx_spi: Disable chip selects when controller is
 disabled
Date: Tue,  2 Feb 2021 17:55:07 +0000
Message-Id: <20210202175517.28729-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_soft_reset() is called to reset the controller, but chip
select lines should have been disabled, otherwise the state machine
of any devices (e.g.: SPI flashes) connected to the SPI master is
stuck to its last state and responds incorrectly to any follow-up
commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210129132323.30946-8-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4cfbb73e35e..2fb65498c3b 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -254,9 +254,15 @@ static void imx_spi_common_reset(IMXSPIState *s)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_common_reset(s);
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static void imx_spi_reset(DeviceState *dev)
-- 
2.20.1


