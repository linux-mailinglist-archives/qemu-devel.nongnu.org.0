Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E111F699AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShn9-0007sD-Pi; Thu, 16 Feb 2023 12:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn7-0007q9-L6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn6-0007oC-2t
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4748653wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xDtiZiwM6CTrTLFYe2kPXYgLad2LKywg9x6k3ULcoB8=;
 b=jebiAT9sb9ij7lnApH2ru5p0Vmp3on4vbCoSH/U/ItYo+zDubcJPZE3ZgFb3a89I8o
 YswOdDjHTmcfcEsaiHU9V/frXWgpmGrnxXsEqJU/mG+3daQQJSUYw3XPnsayo16zH2hQ
 49HYINkLsvxN5005HPCTvVTCjHRR0Mko2sSb3I7N/CihxCr3398J6Gn8wn35Ylo0Cxyz
 NkEjS7Z1mYQ0cYyTEC8zHpoDdJOxjw6WwLsb4OKaMdfJ1L+pZfE220IrigmEw2vsBPQ3
 xV+++ooojVmwlRtU3D7XQnwE6Z5rENqEmFjJJKZ5MElxx5tq3OiXbv9DC2ycROXQbvOE
 yttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDtiZiwM6CTrTLFYe2kPXYgLad2LKywg9x6k3ULcoB8=;
 b=3WkcNV5A0Tump3IFl8t74XjRTF2lRIDoHqO5PmmlznnwjZgBgi9YubIBx7hTg4LVTe
 hcI0osbIGfFTsU8/apkwqjfdx0GvRxMnp65nveizIz7aOlfy0OFCPVximcoTzfg+DoIZ
 tOUr8TUSZfKUJIUtWBDT4yVMNGNky+wdbByubgUCgHXYGnCVPU3CbL6bxk+HsCd7+J9P
 NfTz4X61isvL9YvI+Hbr3/DniEdBEgFSW8g2h2I8y1iFoEMGxHF7cm1GGU2uud+Eesc2
 ZEvn5UUa6Y4aqNLowxH+PYTMJ2ahMeV6w4QnTCx55VLZEi87z5N5n9bThc2+3iz5YeE/
 tYXQ==
X-Gm-Message-State: AO0yUKVdNaFp3hw11WDdJrAAT+TdWOueiP4tLxbc1uVkgIqGk+jf6d9M
 c71qxaejamUt/qy4/cTPxNbOA5IgvUNRdLXN
X-Google-Smtp-Source: AK7set+UjSLUyLl8KiqnZ+xrnfZgqj770KCbMag4Z7WUfAhpF4ZTabkjafhRcv65AO7ItCgOy/lVLQ==
X-Received: by 2002:a05:600c:3b07:b0:3de:1d31:1042 with SMTP id
 m7-20020a05600c3b0700b003de1d311042mr6304439wms.23.1676567486420; 
 Thu, 16 Feb 2023 09:11:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] hw/intc/armv7m_nvic: Use OBJECT_DECLARE_SIMPLE_TYPE()
 macro
Date: Thu, 16 Feb 2023 17:10:54 +0000
Message-Id: <20230216171123.2518285-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
similarly to automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca1..07f9c21a5f3 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -16,10 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_NVIC "armv7m_nvic"
-
-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
-- 
2.34.1


