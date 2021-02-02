Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2830C982
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:22:36 +0100 (CET)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Jt-0002eB-Gs
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu5-0005hW-1m
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0002IV-Jy
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id 190so3300433wmz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZMKRUtHDuX4hpPKu6tOVyoM1QFOvP6HE/wEDS5GtqAM=;
 b=Iu156SsvDHBre5xoC48zKt1TG3s1FWcDBat99+WvKiz0hNoJE3uQaOQIII94s3A3fs
 sSQ+660TEICC82Rj1BKqTGG4V8oY7SOMs1vjdfkk2aWkqhZZB3zBtXAxTHRZFrrOrOqU
 /7IK9lWyxyu5g9l3NAFKzBaVy4WXp6HBtRqj/eonugk5YvsuYV8T0fDp8F394E4o0gHx
 2tSiMEDEKu5O8Y4rPO4v1n5MeH0RcKT7af8RJuQh5bViU12Trs7hgtaV8TIOEzwagD9w
 v+krumVnbm1WD9jmm4dyG91DzE0QCi/DSa0V6s0m+wCI4ZFYHBLrskkU+bHUjs6+aRou
 TaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMKRUtHDuX4hpPKu6tOVyoM1QFOvP6HE/wEDS5GtqAM=;
 b=GHoEKqR6GO/lmC43V/b7lpVhEc72+i/KsRSqFZeGxduYcs43ruSnXzrCDosq7R1jf1
 XlaJUenQA0Y6nAsjAJB+hRRYjP66Py3BJyjcvVlXjjrfOXY/rS7p3KhOOSuSl7K19Ti1
 zejEPJfvwEzF4+Cu6hXK1LcpDE5YLc2x+Syznz+2Cti7GHJFcPKBA/hlR1HYcPtRb/X9
 TRwig5Mv1fjUPWK9ImA7SuE8zRLODKH4sI+2uyvEqyzW9wTvcVBAVeUdzt9oX6/idTs2
 9N8raBTzo7DXULRovqv9QNu1xi01FBAlj16mr+btgFRkB9T89mp2av1siRjfKVju7loL
 Ucmw==
X-Gm-Message-State: AOAM530vN4vq8V/e3yKuDwaH6xZGrL4CcRYY+8ZAXxIwyW3ZDWOWZ/t+
 QxE7Mj8px0dOaNcTSx+W/DxZT4yOSEDgaQ==
X-Google-Smtp-Source: ABdhPJwS9iE0x10E5KMyJvKvC0H1mzFjZ+SgG8D1psUuRZZNLjeDw+g7RzgQiBNcG8WVFo2Dvv9vxw==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr4697411wma.170.1612288537817; 
 Tue, 02 Feb 2021 09:55:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] hw/arm/xlnx-versal: Versal SoC requires ZynqMP
 peripherals
Date: Tue,  2 Feb 2021 17:55:15 +0000
Message-Id: <20210202175517.28729-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Versal SoC instantiates the TYPE_XLNX_ZYNQMP_RTC object in
versal_create_rtc()(). Select CONFIG_XLNX_ZYNQMP to fix:

  $ make check-qtest-aarch64
  ...
  Running test qtest-aarch64/qom-test
  qemu-system-aarch64: missing object type 'xlnx-zynmp.rtc'
  Broken pipe

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210131184449.382425-5-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 09298881f2f..be017b997ab 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -364,6 +364,7 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
     select XLNX_ZDMA
+    select XLNX_ZYNQMP
 
 config NPCM7XX
     bool
-- 
2.20.1


