Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7140DE63
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:46:04 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtaN-000375-QZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001a1-8p
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLZ-0002ao-TG
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so6284144pff.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54hnQT1IlwQI1vqo01dQd8XkfxGimuQYo48f9SWydvk=;
 b=Hjrgstxnep7o/Hr+KHF+lb6Ag0brMUDSrBglIPfYKX9JZOID81wcKhTOO/EHj3nVIp
 4Fe4Dyx2sjAnhb0bBDb1XXhDLE0XqcPWwlSiOdsPk8lWCtZi4pu8Keex3G+NDCevy6kQ
 rGSMc3HfhlL9KX/4WKnzufDc/wHgM1Z5Hlsq5uPlt+YrOJCApdSvPmbGhPs+k39oHR7R
 S0kEJqKeUVBvQBvUjN2WNXnzNtmdLJxldGnHCxAYPsqCZvcFEXa/gCct/4QIVc9waPS3
 DDjJIcIPRSdnILbfuhEj6FIV4ndiVN/ZIsaRfUtBaD5BFtaL+XoyqwX0zrM7w2Ap2mbJ
 se8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54hnQT1IlwQI1vqo01dQd8XkfxGimuQYo48f9SWydvk=;
 b=KRhOe4DSJx2NQoYivzK/uA7omhU3A3xNgBfsNvN1ht0UXfSBDjOM34PLbvS84wiKt6
 bBI9+reTdJcvTYk7uXdv/5BOWZ6klomvLR5GURoNVdxNnWJ6Wr7h8GV9dlIUaKCz3aaC
 28ZA5xO0veBh9nY0VrP5jfkv/LBxM2lwpdAtkUbmrXy9MS/MS8ymws0NYW3yR3nKlIG0
 HS3yBwmVFiMNBLnP7zXWn+pdA3waU5NxR8wdp1XchdmFxhb/S0OivS69pGpkPac0+8N6
 OIDn8iEefURy0fPoHAPUxaDvNyCwETiQ79F0bVbdiN64mkjQkmX/LgJUxk86ygOd2NmH
 u3WA==
X-Gm-Message-State: AOAM533TJSWOYcfE9RA5WKNue64agc2LUsGrqM9cqeYdGHZf9EEmLPL7
 yITlJftKW7aTnHrO2/8HPKi21XqsLjweHA==
X-Google-Smtp-Source: ABdhPJznvrVM/7KN1w1zyK8/pRyZoEgvz5N/BAFUMwQED9LA3bO5Es5XGut6uk5Qlz5vCMavsXEKRA==
X-Received: by 2002:a62:18c1:0:b0:436:2125:e79e with SMTP id
 184-20020a6218c1000000b004362125e79emr5734063pfy.68.1631806243108; 
 Thu, 16 Sep 2021 08:30:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/35] target/rx: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:14 -0700
Message-Id: <20210916153025.1944763-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-24-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976..ac6b40b271 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.25.1


