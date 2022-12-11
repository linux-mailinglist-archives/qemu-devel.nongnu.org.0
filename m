Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6472F649653
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TCv-0005C9-S1; Sun, 11 Dec 2022 15:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCp-0005BY-CQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:52 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCn-0003R4-RK
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:51 -0500
Received: by mail-ej1-x62c.google.com with SMTP id t17so23348620eju.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRicYZqzpc3cw7t4zjTLWqGMUt8jQUSw27xt0blAqtE=;
 b=rUwWFA55Y9VFNwLtvhGGO4kULs22T3/1FL9g5S97txAjG5ABq6zTG51fzmxXD6StzV
 Y8OAkP1BlSM5TG08LU0pSbT5BQalsFK6jW9rUnIX40L+KMrKP5FmRbVU2mahp411X1Ii
 fRkmfJEJf18XT2QeMH3zs8H8ze2ICjHXN5+OuvPJSJezNvLqrd7ZzqdnrfiO0KBQRlWT
 2iIHAkbN88ftYaJ6V0OHoqwFJBXo+k1aWlyR5SFQ/0lsVZXOpkKtJqylG1Z9ahfALKdH
 0IwcMii7PmaCF8bKhjQvIen5Ver/yS+U5HEiyJn+T5oQaNLFHX4XWdWtrvKhb/LheTk/
 vNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRicYZqzpc3cw7t4zjTLWqGMUt8jQUSw27xt0blAqtE=;
 b=5Eey106jyzEziXTEjt36se00ZZl3KytyNFR4NC6c81OqFkf+MGvKcqrEtLXkfe6rEQ
 xaGQFvA6oNCEDqjFTgk/shkIoKSeYUMz6jyoRHngfipwpQYN12GB0B8wbPFTJQJM+WOn
 L1rKoAZN8GLvgzyv1SH+dIhDCUJMobbI76lPb5IX0kkRiXWOlfp20iGo2CByQO125kLx
 ntt6fLv6/6/AjnNYNTQwSVsJANOGqz1a6v+s+I/JDcWzvLpcWwWuYKlu513+RAzR7GGM
 dd2kGQXrewVbJAVd6M32r2xJ9wmtM2ZxRJLZXOPOc+J/s67dsvqCUmp20r8AqKy7wvEs
 mqxA==
X-Gm-Message-State: ANoB5pkIw1LZ/22WfALBeDtGgRa4QVELqXu/4imPDtYgBBsee+aAnWOi
 EM8ECg+PFutRP6ThsOSqV7O6d8AvcMOQPvQxemk=
X-Google-Smtp-Source: AA0mqf6Me8vX5ALjZ5Y+T4STJF0sCdauy6ulRl2XYspI7+3iAeEFKKcz08ZaGKGK1OTSTzB8jEI21w==
X-Received: by 2002:a17:906:b88c:b0:7c1:6f86:eee with SMTP id
 hb12-20020a170906b88c00b007c16f860eeemr1771047ejb.33.1670791548200; 
 Sun, 11 Dec 2022 12:45:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 kv17-20020a17090778d100b00781dbdb292asm2428468ejc.155.2022.12.11.12.45.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:45:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 02/11] hw/mips/bootloader: Implement nanoMIPS NOP
 opcode generator
Date: Sun, 11 Dec 2022 21:45:24 +0100
Message-Id: <20221211204533.85359-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/bootloader.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 21ffd4d772..0035f37335 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -54,14 +54,30 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
     return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
 }
 
+static void st_nm32_p(void **ptr, uint32_t insn)
+{
+    uint16_t *p = *ptr;
+
+    stw_p(p, insn >> 16);
+    p++;
+    stw_p(p, insn >> 0);
+    p++;
+
+    *ptr = p;
+}
+
 /* Base types */
 static void bl_gen_nop(void **ptr)
 {
-    uint32_t *p = *ptr;
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        st_nm32_p(ptr, 0x8000c000);
+    } else {
+        uint32_t *p = *ptr;
 
-    stl_p(p, 0);
-    p++;
-    *ptr = p;
+        stl_p(p, 0);
+        p++;
+        *ptr = p;
+    }
 }
 
 static void bl_gen_r_type(void **ptr, uint8_t opcode,
-- 
2.38.1


