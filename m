Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11160E8EF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:23:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlvG-0008A4-3I; Wed, 26 Oct 2022 15:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvD-000899-5Q
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvA-00023u-9n
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 14-20020a05600c228e00b003cf4eaef74eso760911wmf.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g21iFUIJTLfkGwKgjLHJnFZRJtjlPXXNbadVKV4YF7M=;
 b=v7iiaPCwOKH8uaZ0I8HH7Z4oJrDB/dXeQL5oWBplfglj0ikcF3dFnuZF+Bi3UYVe4n
 Om2dXzfijdkMCoTF9An36uKHHVJkJHUKtu1kSuKLDFshciM/MS8c2YNRnYoWAp3VgUWJ
 STy72A2AhQIsHLfaiA1gfwHlR+3dQwhgBT3I4Rw9j2sdYq+9sKY/Jlb4mdb+RCDM8H44
 xpzuli68pZUnX+ZYyyus+g1PSSyYuXunQP507SBMpWc6mNBmzzdDNUJz7ScWN+Q+k7Tk
 Xpgqq00wkgsu+UP4jTQq4E2E+AwTqGuGzydJoeswgDryE+198jBiIupqarxGtGQJEJ7q
 Nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g21iFUIJTLfkGwKgjLHJnFZRJtjlPXXNbadVKV4YF7M=;
 b=vh9y6NnKBMRZ62uUH/5S9xoddBGJM6PRv+73Bnk+gjiga36QXXoaAftfOYlnNoe8bA
 mx0pRX8jwycw0skDnTsszKER9UAhvoDjngXrk7YKqGjgktRXtSCQhz9rNCWvRwPed1km
 ebvFkH8O3X7HP73aI28c8+TQFN/PAQjzaGnlsHUBy0hxYegxG2/cOBhCi9T7EgKWK3k+
 p1Z2noz0y706P8FbQKH7Ha9ubPbmxl9XZJvPmUifAIovst8ynzrOOuIUOmNmSrDFjPcZ
 t8E0xT9kpYMKBUzajGddijpbirx7d5aC1POj1+s9CyQDrHg57AIdXIzy7Y2KyXLkuSej
 HZ9g==
X-Gm-Message-State: ACrzQf1VUysb/pI71vqI/mUzvnPeFs34Abc6vAGjuTNfYQyk16gi3iWN
 sW2MWwDq5CbaiOhp6PMPJSL+kkMBguqcuCER
X-Google-Smtp-Source: AMsMyM6/as29Ga4/BV7d0El8qWL9pXoRGGVzwcEXd3nq6cgBpTjTzvlZHtZgY6ATbFLMNrrMWSrrrg==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr3391303wml.95.1666811914593; 
 Wed, 26 Oct 2022 12:18:34 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg37-20020a05600c3ca500b003b477532e66sm7308712wmb.2.2022.10.26.12.18.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:18:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v4 2/3] hw/mips: Use bl_gen_kernel_jump to generate bootloaders
Date: Wed, 26 Oct 2022 21:18:20 +0200
Message-Id: <20221026191821.28167-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026191821.28167-1-philmd@linaro.org>
References: <20221026191821.28167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Replace embedded binary with generated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210127065424.114125-3-jiaxun.yang@flygoat.com>
[PMD: Pass semihosting_get_argc() to bl_gen_jump_kernel()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..e24572c885 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -35,6 +35,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
@@ -866,30 +867,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     /* Second part of the bootloader */
     p = (uint32_t *) (base + 0x580);
 
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed */
-        stl_p(p++, 0x00000000);              /* nop */
-    } else {
-        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
-    }
-
-    /* lui sp, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
-    /* ori sp, sp, low(ENVP_VADDR) */
-    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a1, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(ram_low_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
-    /* ori a3, a3, low(ram_low_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
-
     /* Load BAR registers as done by YAMON */
     stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
 
@@ -941,13 +918,17 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 #endif
     stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
 
-    /* Jump to kernel code */
-    stl_p(p++, 0x3c1f0000 |
-          ((kernel_entry >> 16) & 0xffff));  /* lui ra, high(kernel_entry) */
-    stl_p(p++, 0x37ff0000 |
-          (kernel_entry & 0xffff));          /* ori ra, ra, low(kernel_entry) */
-    stl_p(p++, 0x03e00009);                  /* jalr ra */
-    stl_p(p++, 0x00000000);                  /* nop */
+    bl_gen_jump_kernel(&p,
+                       true, ENVP_VADDR - 64,
+                       /*
+                        * If semihosting is used, arguments have already been
+                        * passed, so we preserve $a0.
+                        */
+                       !semihosting_get_argc(), 2,
+                       true, ENVP_VADDR,
+                       true, ENVP_VADDR + 8,
+                       true, loaderparams.ram_low_size,
+                       kernel_entry);
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
-- 
2.37.3


