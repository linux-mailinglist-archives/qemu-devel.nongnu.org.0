Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF26A449D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFR-0002WY-Te; Mon, 27 Feb 2023 09:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEd-0000Re-HD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEO-0001F9-3v
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:57 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3909475wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jD/AgMbY1XM7XEOywFgDqrCzK2fQrhv4LmiUJ1k8b2E=;
 b=ZC3R3nyXCJm/Y6hmkOZsAj6ForOphXQzKRsgjXrivdo44/NGNTljmWSaxF7VCWGR0t
 r0v0qDfpQPyfthysTzLBMP6g8kAzvjEMEJ1T+d+x84KQNUfL85O1CXvc7HYRTJpdF1J7
 wKStECThNG18I2iX0neSOmyj8fOOSt1C8L7sdsbCB83tSzzpM9QmZs8IvByOYuEVodnS
 3GpZTx7e9R/MFSFVCu0/d5T1aorLqqfs+yCEFz3xuj9Qf6wvhgw5F4PWPCKf3jYb5UvJ
 ulhfeaczSjo7ufLgfov1n5WqjQLjDhGprqZX5NhgimsiSyqC53UDnVwdsyzDszPixtsn
 E2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jD/AgMbY1XM7XEOywFgDqrCzK2fQrhv4LmiUJ1k8b2E=;
 b=LXJQbuiCvdEY7zTXYi/YusmBx0aBcAos9HdGK5y30yr6a+goH4vC8IHGqtsyEs9OJP
 xIUuw69GfplYDaRyZqg2y9m0EfG0pq87wtcR0XcUO+qTbBgy+10rptHwtOTnl9bfk+T1
 cnP11AsQqJhIJqXHWpeDWJE4M82RufhlXEMl2Zw9CJvcvPslDws3QYF5sEMH0bsAv5j+
 y/NbQZa1/j62LAIBNBZhRSTeIKkJLRqLsm7EK4FENydOxRGLjDOSvzfn+1cEWresgznp
 HEzYvttUzH93+VlNf4QyFYcChjBgdxum1EQpsBVJv8jjhFJnt4Xnj0kF+IV2g4fKlZ2P
 HRoA==
X-Gm-Message-State: AO0yUKU/A4lCDbRtHs92nh3LKwSKbJErWYHDjvx9ugHirCYrutVf1Xch
 V5b23t9O1c+h0QfJc69YPl4NbDWNeCZQ/hWz
X-Google-Smtp-Source: AK7set8lo+KZnRfCLHz8wdOLR6S/XyayEfWxlvxTzCEG7Icdp1IallOGuhTLROi9MAJS9+UYv85ONQ==
X-Received: by 2002:a05:600c:3b9e:b0:3ea:f6c4:5f26 with SMTP id
 n30-20020a05600c3b9e00b003eaf6c45f26mr9714872wms.17.1677507114581; 
 Mon, 27 Feb 2023 06:11:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b003e1f6e18c95sm13307668wmb.21.2023.02.27.06.11.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 116/126] hw/ide/piix: Remove unused includes
Date: Mon, 27 Feb 2023 15:02:03 +0100
Message-Id: <20230227140213.35084-107-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-19-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2f71376b93..6354ae740b 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -28,14 +28,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-
+#include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
-- 
2.38.1


