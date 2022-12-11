Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C01649657
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDg-0005bo-4m; Sun, 11 Dec 2022 15:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDd-0005Z5-AW
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:41 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDb-0003Wf-Ar
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c17so10268174edj.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbfoCrcGaXFVkYtW0NcEm2ywaoaTdyydHEEbJmuY5YU=;
 b=Taj6YzEAFVQkU+zsGEU9d7HToeUbNPJhXrzqJ2EN9toaJAr6INb2GUnbm9Cr9/HmPE
 uhq6zeF69m5VZdyA43hGqDaaMKBiM5phIU3Jg/uyOXXDOiakd9HFDuEdtJNC8+kf2B5p
 SkbDm2Xn3iFnkJf0dtmDCLQtayQmTzVe5XnzAxnk96udkdF237DZs9ymo/umhRzQ5xGU
 VOTmtTBudUI5tti20C/pJheRKzXHMYHW7mELasa7BwWiQkclgbqZ+jshiRnZjAi+DM8f
 g43QGgD2mUAlKCBqqIbP0ir8nSeo0DdxmsNPGO68dcVGiqKDXrAVTaO2WCpgSWK+2Rql
 vLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbfoCrcGaXFVkYtW0NcEm2ywaoaTdyydHEEbJmuY5YU=;
 b=uBt5Cn1j6pPMNYCcsJZdf6ruOcoRGvqA2D3TXW9pXEFH5Wg4JVWirldHIfQJ3LqQbp
 tFsj2SRKYcmikXO/v0wzCcyL61q+CyRkN0yRAhYllkatiYRbb+xQ2B+zEnrO9aPN72oT
 BSTMB8LM0mJxOWtCllmdF3E17lpO4zma/SH3e5OVE/IPOlcdAj0qCln2auR/Ferxq0xg
 WGBaEgj5h+bWc80WXxrS/k3+GiGeAdQLYMa8ADbaozu2HSRQouIL0zU9w0ym8ZNHC7qm
 M2l/wsk7thcWwWVWDtCvJJvhB4UFr4jWUL1HNfzz6AbhAH2UjPct1c2D6vC+rUTq+CUy
 XsCw==
X-Gm-Message-State: ANoB5pnT6ua64Uw6P/sXmjGeIlSkpSJqZCRWuYSTiBfNewf9sRmkkFSv
 y2WkCMqHIjaIygm9GPxT3blxgsQ1MA6UY2ubonw=
X-Google-Smtp-Source: AA0mqf66JD3B6qtqQynOWI7NYjmYT7T39mj5vsMnM3pgq9fnSRbw/yevMDuMOau8NxJ60Et3HBJhHw==
X-Received: by 2002:a05:6402:4514:b0:463:c4f5:ad1f with SMTP id
 ez20-20020a056402451400b00463c4f5ad1fmr11091730edb.11.1670791597823; 
 Sun, 11 Dec 2022 12:46:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ca15-20020aa7cd6f000000b0046bd3b366f9sm3070075edb.32.2022.12.11.12.46.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 10/11] hw/mips/malta: Use bootloader generator API
 for nanoMIPS CPUs (5/5)
Date: Sun, 11 Dec 2022 21:45:32 +0100
Message-Id: <20221211204533.85359-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

Part 5/5: Convert jumping to kernel

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 68 ++++++++-----------------------------------------
 1 file changed, 11 insertions(+), 57 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 451908b217..876bc26a7f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -619,11 +619,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     /* Small bootloader */
     p = (uint16_t *)base;
 
-#define NM_HI1(VAL) (((VAL) >> 16) & 0x1f)
-#define NM_HI2(VAL) \
-          (((VAL) & 0xf000) | (((VAL) >> 19) & 0xffc) | (((VAL) >> 31) & 0x1))
-#define NM_LO(VAL)  ((VAL) & 0xfff)
-
     stw_p(p++, 0x2800); stw_p(p++, 0x001c);
                                 /* bc to_here */
     stw_p(p++, 0x8000); stw_p(p++, 0xc000);
@@ -642,46 +637,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                 /* nop */
 
     /* to_here: */
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed    */
-        stw_p(p++, 0x8000); stw_p(p++, 0xc000);
-                                /* nop                          */
-    } else {
-        stw_p(p++, 0x0080); stw_p(p++, 0x0002);
-                                /* li a0,2                      */
-    }
-
-    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_VADDR - 64));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR - 64));
-                                /* lui sp,%hi(ENVP_VADDR - 64)   */
-
-    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_VADDR - 64));
-                                /* ori sp,sp,%lo(ENVP_VADDR - 64) */
-
-    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_VADDR));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR));
-                                /* lui a1,%hi(ENVP_VADDR)        */
-
-    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_VADDR));
-                                /* ori a1,a1,%lo(ENVP_VADDR)     */
-
-    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_VADDR + 8));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR + 8));
-                                /* lui a2,%hi(ENVP_VADDR + 8)    */
-
-    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_VADDR + 8));
-                                /* ori a2,a2,%lo(ENVP_VADDR + 8) */
-
-    stw_p(p++, 0xe0e0 | NM_HI1(loaderparams.ram_low_size));
-
-    stw_p(p++, NM_HI2(loaderparams.ram_low_size));
-                                /* lui a3,%hi(loaderparams.ram_low_size) */
-
-    stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
-                                /* ori a3,a3,%lo(loaderparams.ram_low_size) */
 
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32 cpu_to_le32
@@ -719,20 +674,19 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
                      cpu_to_gt32(0x0bc00000 << 3));
 
-    p = v;
-
 #undef cpu_to_gt32
 
-    stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
-
-    stw_p(p++, NM_HI2(kernel_entry));
-                                /* lui t9,%hi(kernel_entry)     */
-
-    stw_p(p++, 0x8339); stw_p(p++, NM_LO(kernel_entry));
-                                /* ori t9,t9,%lo(kernel_entry)  */
-
-    stw_p(p++, 0x4bf9); stw_p(p++, 0x0000);
-                                /* jalrc   t8                   */
+    bl_gen_jump_kernel(&v,
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
 }
 
 /*
-- 
2.38.1


