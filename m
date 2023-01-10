Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8F66482D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHjq-0003vi-D6; Tue, 10 Jan 2023 11:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjo-0003uO-8L
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:36 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjl-0006AL-Om
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id m3so9287661wmq.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djWjHp1PKVzuHPGY/PIVLhSBEcAmWoL71xzvCOJIpjc=;
 b=TuKlboWPbvposCOlgrcg/KtwgV7jHLYx+hFvF4LOl9zNKz1818Qe1lc9bidbuyNIUt
 pFVoxgPqm5IisID+FIwou32Oz9NwA3VzngIm6WzJ6nnwElJlEzlyy9ue97dtOXrMJ9WW
 g3hslvZe4IXrXe4nFrZaZ91/Q4zyn6dEVXYj0vnsdpPkxRxdOD3h6jGUaZkNi21cHdUp
 cU8bAlIJjfIKEdVmStkrtVVHPrWG9igsJMCDuw/5gbI99xDq8QvNyzS66wnVyieIjybO
 xtloNwF+GpzX5qK3EahOHfJ0fn0Ehjowosw+fm/uPqaIWhOzx2uM1exlTK5n4+/9SVax
 g5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djWjHp1PKVzuHPGY/PIVLhSBEcAmWoL71xzvCOJIpjc=;
 b=MeEzKwiTdWfrMWOiSweyJlYqiWn6/cDHNmF4hzPqhBZJr0lJ2rnK4nouFRECXbZx1y
 WgRMyFEe9xq0M7QCkOyCRkl4bKoFp03Mgj5W/RfmNYbAvqCEJpg0jNq5oak+/55P9Pc5
 BSJCsv562B+8ut4SB13LS8QcZb0hz055hsdF8wya6mSgF6LPjHzBp9rKGiRwHDXMBpyp
 xdz0y/eBsrw1wuC9tCZ+fYVuTy05vYb65BQfoM6aNUS5ayyneEnsgW7oFJn9/evmLoSA
 Y7BRjE3dmH8njLmUsBIRcNAnaISZ1x1TthDR1p4ww/uzBDU6H/V3WF4+EarSGIyngFrO
 EAyw==
X-Gm-Message-State: AFqh2ko2BAetpeiUUplOkc/DmeoGdnaKOxYBRHwVLpn1OqvS8Y0RNdHn
 /dLzxBs3lVkdZ/vfWeP+wtUKrBR1BvuDzNDC
X-Google-Smtp-Source: AMrXdXujPhEd18uM6h37MjYfydsUbn/lQFdDS1699jE+ilIpEh3QV6TRVmuyM6+ruYeD0FkCa3UUWw==
X-Received: by 2002:a05:600c:3c87:b0:3d9:e8b3:57f9 with SMTP id
 bg7-20020a05600c3c8700b003d9e8b357f9mr8522703wmb.8.1673369072346; 
 Tue, 10 Jan 2023 08:44:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b003d9e00dfccfsm12905306wmf.8.2023.01.10.08.44.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 04/18] hw/arm: Use full "target/arm/cpu.h" path to include
 target's "cpu.h"
Date: Tue, 10 Jan 2023 17:43:52 +0100
Message-Id: <20230110164406.94366-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

First we want to introduce a new "cpu.h" header in the "hw/arm/"
namespace; second we would like to get rid of '-I target/$ARCH/'
in the CPPFLAGS.
Use the full path to "cpu.h": "target/arm/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/digic.h      | 2 +-
 include/hw/arm/fsl-imx6.h   | 2 +-
 include/hw/arm/fsl-imx6ul.h | 2 +-
 include/hw/arm/fsl-imx7.h   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 8f2735c284..646802806e 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -18,7 +18,7 @@
 #ifndef HW_ARM_DIGIC_H
 #define HW_ARM_DIGIC_H
 
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "hw/timer/digic-timer.h"
 #include "hw/char/digic-uart.h"
 #include "qom/object.h"
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 83291457cf..9d24d98189 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -33,7 +33,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl-imx6"
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 7812e516a5..4f42fe4192 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -37,7 +37,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl-imx6ul"
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 4e5e071864..ed8c1ec813 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -38,7 +38,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl-imx7"
-- 
2.38.1


