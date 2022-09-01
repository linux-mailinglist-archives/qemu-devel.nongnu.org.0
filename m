Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DD5A8F61
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:09:39 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeKY-00011U-Vw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3v-0005s7-MO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3t-0003GR-Vn
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id u18so8341642wrq.10
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=HQfoTiO5xIrT302HofUFO4RioFMFKKBINHO9/6/a34Nv9+SbpPGujeWNAmuSmg90Cw
 tAubLWzbsHFbdUU5l8RoYjR0vP5SjWBR5ZiMl/cG25D54JXBpej9HE7kPRrJZCizrooB
 zsldSeE4BOwvHaUbpj3cqLHHADLdSD3H9ewloX2c+KkmLNJNhyBIBIZWZeaP7vid8ayJ
 /gS4nd7ZpPDkmaaqe1rrO9iUElMRq97VLv7hUlJnSCLgJ1PUBGgoRzLntuHqFWdpHsEG
 yeA4vXaACEUeZGG0TSmaGYDULU4FX3fItJG8dcEwOB1K6IzEdOQo8HJRXLXjzIO3QGzc
 hRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=BrRrYx8FLPrYSgQJ2CV1OoQtnmLGeRzr50cl+bnsFIBS9ukrFAMLc4x4LLensdcai3
 BsMZjoCn9hX1vrbXThA2YFambXV3cc5ysQizNmUN72vYIPMeRo6t7SSELD0/gNt3dAz6
 vUbKglhUmCwX9BiYPDR7x+MFrtCuuWuugKi2seTxyERUoVkeftt8hgecNET5Cr1Ulu1Y
 XlmutSF/pwk8tYlI5WG7s/oiX8UY9RFYrRhX1hdjZpw83DoA556kkk5Sko3n7rrfz6Zt
 zEyjeudsIeAlKWZx8dFMkSjsg5vePEMtFdMewoZ27SB9gr/ugIqtLZGEdg1usOFMOGct
 Z8Cg==
X-Gm-Message-State: ACgBeo3zoQqkeYgrRwEVcFaio77lKah57Kb5c3XoD7KikolHwHhnCvpI
 NN3Dqt6FyK81/HH6q7kxNmhAFpHNjx4lR4Tf
X-Google-Smtp-Source: AA6agR6UBvyeHK9eKooLytkr/Vhjznt599l2ovDgNeh++rOCdFBGyPLeAJ2aHLxP8nL1W7i/OwFg0Q==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr13502698wri.590.1662015143275; 
 Wed, 31 Aug 2022 23:52:23 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 02/20] linux-user/hppa: Allocate page zero as a commpage
Date: Thu,  1 Sep 2022 07:51:49 +0100
Message-Id: <20220901065210.117081-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to start validating PAGE_EXEC, which means that we've
got to mark page zero executable.  We had been special casing this
entirely within translate.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3e3dc02499..29d910c4cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1646,6 +1646,34 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->gr[31] = infop->entry;
 }
 
+#define LO_COMMPAGE  0
+
+static bool init_guest_commpage(void)
+{
+    void *want = g2h_untagged(LO_COMMPAGE);
+    void *addr = mmap(want, qemu_host_page_size, PROT_NONE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    /*
+     * On Linux, page zero is normally marked execute only + gateway.
+     * Normal read or write is supposed to fail (thus PROT_NONE above),
+     * but specific offsets have kernel code mapped to raise permissions
+     * and implement syscalls.  Here, simply mark the page executable.
+     * Special case the entry points during translation (see do_page_zero).
+     */
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #endif /* TARGET_HPPA */
 
 #ifdef TARGET_XTENSA
@@ -2326,12 +2354,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 #if defined(HI_COMMPAGE)
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
 #else
 #define HI_COMMPAGE 0
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #define init_guest_commpage() true
 #endif
 
@@ -2555,7 +2583,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE != 0) {
+    } else if (LO_COMMPAGE != -1) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.34.1


