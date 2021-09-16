Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53240DE6C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:47:02 +0200 (CEST)
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtbJ-0004QP-TN
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLi-0001Xr-Ou
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:55 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLW-0002Yv-6P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d18so4069185pll.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/Nt2deQEM4uyDo8RGvA8xthDggEvZqmw8YagLLQ3b4=;
 b=Lv7yyag9vyK2KwngmY71nt8wdxIxgWbE6/azJy29oWMPBqczh34W4989gx77LkvhwV
 RFdnfgjt/Qnu1NBvk8l77/I2/EU6YkZedrxPg5z3sH0LxPHOCTllQeBcVaxXTY6q5llB
 zIHz6WNhaBPCy0H+6EAfRUKT/YyCSFy+fsZfKdXfu+EuajaD90aOatyteMyA6LNAhyk3
 3g83/jm5WQHY1aYbRBmgbUkQLiOu7MheXfnsMcakmKnQv8x18+XaxBhVIcfeT45YA8yh
 dh5j1PEmJImqMYSOegDd94cgxrTirRowX8hb70P7P70wdNIupr+fUbi+8bDFKbr/zLIs
 o0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/Nt2deQEM4uyDo8RGvA8xthDggEvZqmw8YagLLQ3b4=;
 b=XmvWTkJA7h/RNaBo6fOSkImqDns6aGPpx+9zxyENU9deQaLPY9rJlltpyjrJdZLUpb
 IDWELT/GswzjrSWW8vv79KPGRF2GdKlfAl1EDrIX0TCwB78MYKaxmX4ScFv9SxcKccre
 ZH5oQ2sL8HV885RKkTu0vm05tnNCwyrVypKHg9YQQBYRnpuO0nhtjjPQa6oDv0S6jylP
 +klHOtHwRJZPNNgQLm/vseeOGB8IZTlCEtvhgDN7RdJF63/NfJAMMzlR29j2rB3XB44L
 8UuQz7DAzoNnFo0SxS50i+MqTxjsRs9g62fQVktieMEf1c8I3EogNRMhUNa17KTHRdqM
 De0w==
X-Gm-Message-State: AOAM531RH+ECFdFZgznbXvx4Nstsl9WtKLFJBx7ZMuWHXrss/7RX/D9y
 k1xIB6QIarrxeZRtiarEtM/fThZEPSXwMw==
X-Google-Smtp-Source: ABdhPJyaR+j9gb0n5Rn716h9zeBO8CrOTfgSvvKWja4EYZAMxizoVB2U+ayPPGjENbVDv1eoyeI51Q==
X-Received: by 2002:a17:90a:301:: with SMTP id 1mr6762410pje.65.1631806240255; 
 Thu, 16 Sep 2021 08:30:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] target/openrisc: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:10 -0700
Message-Id: <20210916153025.1944763-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Message-Id: <20210912172731.789788-20-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f..3c368a1bde 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -205,7 +208,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
-- 
2.25.1


