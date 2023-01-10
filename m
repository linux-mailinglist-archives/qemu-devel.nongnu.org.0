Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C726647A0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkj-0004Dj-JM; Tue, 10 Jan 2023 11:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkH-000486-FH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkF-0006FC-8x
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id v2so1426711wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+m8L9ejC6qlw4tOENu9F3qOBbscmRJfWRVLTYz7u+s=;
 b=G1yQhukDyIZYsrGkdRZQifpF9SUe82x8HpGVCgxxC+ASBvF3AWC5fphfWGs6UZwvJU
 fLKm3wKqZ5Whd8ZG6Gj0uGg8wjg2JznC4rfyphJc1wm7FuBjVRHGm8+i4V4tfb5xsDhI
 GleHthtwu1Xcg4Y97HxGg2noxeXowlO4d4FMpC3xnrvXQ2cZXbq6Jriv5/E7ueQGJtPW
 JZanF8pQGweYyXbbZTUjEhaMvwuQur/sWAyY+JL4YQiGOwCsh+Vr42HMju9CSX8b72P7
 RmG/BxEEpvGwLQvKEMEnVRnvtYAhLaANArcdgWhwNAvx8ntMEgsaUwq7H9vbTobxwNGb
 ObJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+m8L9ejC6qlw4tOENu9F3qOBbscmRJfWRVLTYz7u+s=;
 b=258DDmnGTeVW1X1/bzEhTzwK6smri/QxXA0VGGKFzLW7dAM5yLOCZoR2I0B4n6Xrnw
 /1knnpe5B+K/sYuuNOrn4Z9aibqZqzmqR6A3k/hU44DxXpCReWQYx2oKlDfJDTD5vOTf
 JpvpldygmLPXG9Lc/g0pfX9fsrM/U9iIFVpoj8OeTEnokVsezbdKM/RBWAdTD0dzwv4H
 SY606U3idOjuak3ZGIa+Ji+eZjwE7au3aZtwk2xtWm84PiN7tSVgxREXev0QkKAJYrNP
 +VN0M3K0+YwOH523HymSH7FsZ8T/G2c8Igm6lU/7zQKhbIHTAe+fa/qmrF77m16LwyKZ
 IiHA==
X-Gm-Message-State: AFqh2krXyjFvmMmn8vN6zb2tf3aVDe0GVXbR4zTwjm6W+vHMHD8caKrn
 PjwXqG/Ksidh0WLB+YOSfllIEvanpr5E0aRZ
X-Google-Smtp-Source: AMrXdXvdHLq02aFDDjjNwacJgOJtrAIzO6LSW9DAZ3o8HKl2zCSx2PRCqYlCRbwNMarM8Ir/Y2Ri6Q==
X-Received: by 2002:a05:6000:12c6:b0:2bc:6f72:93cf with SMTP id
 l6-20020a05600012c600b002bc6f7293cfmr4784588wrx.64.1673369099664; 
 Tue, 10 Jan 2023 08:44:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm1333824wrm.78.2023.01.10.08.44.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:59 -0800 (PST)
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
Subject: [PATCH 09/18] hw/arm/armv7m: Remove 'target/arm/cpu.h' from NVIC
 header
Date: Tue, 10 Jan 2023 17:43:57 +0100
Message-Id: <20230110164406.94366-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

"hw/intc/armv7m_nvic.h" only requires the HW definitions exposed
by the "hw/arm/cpu.h" header.

Move the "target/arm/cpu.h" header inclusion to armv7m.c which
is the single unit requiring it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c               | 2 ++
 include/hw/intc/armv7m_nvic.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50a9507c0b..1e9ed1e7af 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/arm/cpu.h"
 #include "hw/arm/armv7m.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
@@ -20,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "target/arm/cpu.h"
 #include "target/arm/idau.h"
 #include "migration/vmstate.h"
 
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca..c0c514af63 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -10,7 +10,7 @@
 #ifndef HW_ARM_ARMV7M_NVIC_H
 #define HW_ARM_ARMV7M_NVIC_H
 
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/sysbus.h"
 #include "hw/timer/armv7m_systick.h"
 #include "qom/object.h"
-- 
2.38.1


