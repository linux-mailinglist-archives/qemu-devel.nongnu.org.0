Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05B40DE8C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:49:06 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtdJ-0000Pu-Fx
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLm-0001ji-UC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0002at-0g
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id v1so4073753plo.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqnQxPNNPW3cXaX5Uop3j/apP2OYNx8szUJcSd+WiRU=;
 b=HdaTNicbghT2Nv/qVmD8NK8+XhuFByIPSHH10YCHWY9Rh5NcE/xOQ2lG2ynitnFbZU
 L16A8Y8RU0eN8LnDJtwM+FfbYkoMgyEgWmJe/6OOL31m2eBalhM7buCdbYa14EdMe1FS
 zPNO8PtF4ET8/fNJf+UacC3ckupe8w0vvf8vsv2kDeZSl3beFCCKjRnLihecsIiJwPwd
 JCu/r4OIpX+A15vXJbXSjcdtfsG9fBRJvVv6JVh8/m50xYIRQNX2iBqZPxTdxxiVU/Bo
 fmyzsWfHPDmOA41J/svIFQ4RbdQVTdJaLnS5SZyS6IUKCQpx8+fvoYmlVoQl3CSLa2PW
 otRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yqnQxPNNPW3cXaX5Uop3j/apP2OYNx8szUJcSd+WiRU=;
 b=VbB3JqUAiAp6/ZSbxxz/Jp2OkVwm5gz8R9zlH4V15AyuLYPwFuLCKtS3Xa4YGGKn3B
 xUgBeF2ktYfPoACdVfCaF1XzebvBRe5rqFt6ztzERA+qjwCXBgVn+GzcFSkhLWrKjV4K
 OSbr8ESMch7oQPag+JzHWyJhpM3vwOWOMO3V5T35ZRXtFz1wz0uDSenyff18oRRFjb1D
 gw6JdRKstg1yNEAE42SiqCJB0EpVvvrQGcLG+tpOQ5Qrlso34GCvukPetPthykAL+/Z8
 OVpdvGnGFbiNcTdmUUwlozyjMmmGKD7f9ImESIS/n06lkhq2rp/fr+rOhASWtB0F4P6e
 FOIg==
X-Gm-Message-State: AOAM530p5ocAbXvEUoT2w1Td1vGGEZKnw6LK3Ugrdub8H2KLIr/rGJtm
 q7TDDrmf7uhAkbDSMf6kP6ZeIXV/YAtNcg==
X-Google-Smtp-Source: ABdhPJygPJtD9IUnGjBVvS3JBN6/4oAjmM0uvEyyV6xzJg1KRof9aG+u44Jf4OycD9vTPZiJQH5rVA==
X-Received: by 2002:a17:903:1c2:b0:138:b303:7b95 with SMTP id
 e2-20020a17090301c200b00138b3037b95mr5243574plh.78.1631806243716; 
 Thu, 16 Sep 2021 08:30:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/35] target/s390x: Restrict has_work() handler to sysemu and
 TCG
Date: Thu, 16 Sep 2021 08:30:15 -0700
Message-Id: <20210916153025.1944763-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-25-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..df8ade9021 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,7 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -104,6 +105,7 @@ static bool s390_cpu_has_work(CPUState *cs)
 
     return s390_cpu_has_int(cpu);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
@@ -269,6 +271,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = s390_cpu_has_work,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
@@ -292,7 +295,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.25.1


