Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5676593C4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rA-00031l-3k; Thu, 29 Dec 2022 19:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r4-0002xs-5h
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:34 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r0-0002fd-QT
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso19548936pjb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pj3A1RydZ5k++XJlvrH6d1P1H8txrpAYpf5yEofm078=;
 b=nmYI0B3Ap4MGR4wiT/cEJEa7Rtq78hvBESKqEYgzNBBqbhyw2Pg9JFGOZ22T1GQZYf
 sK5BH9hrQcXqGVMlF6d6XHwh/f4IoNE59jPJ3OoH3EogmXJm/X1vIC9ZVPhJpLbeUn8+
 +pHs1C0BE/opFqQkaN7kQ3LYfmhUyKnqiLIikt+/LP4uxZ3JZ1iex0L5Fr6sAfRQw9XK
 26T5Ev1lbu1xMg/txI1grFfTdFVamgPefxICt67AKYhTCmJwZpBye6IC9pR7NGHrnnrY
 S//yfIPLMCVAkLrx/HP+5y00K93kQHQFbdT3OH/GuRQMScBfZfaYW1g1ZHeEJwgM783N
 5kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pj3A1RydZ5k++XJlvrH6d1P1H8txrpAYpf5yEofm078=;
 b=R8sWHBdctRg5AGcGIMMP9uzKVkruU+V2t8wUC5xmCs+OfQ3UYqZPIEkKCtAYRMszWQ
 inxNVbPyzMODK4ZUSg59OMiv9MAzH0fOMxd1cIQBr4vVf0hqvmZB3L2ZogZY7K+Fw5ir
 zwO2yhuEZS60MRmG6DQ/N8jIMrYUaSNYWDwahGJuoZAaRUt7IAqza82jo74l9buKO7ps
 puhu2ujStNsgUkU5rJ7vHoNw7ByvDIaTo2oLZYhZM2c3ETrlsiBLyvUSHZhFhVtP1OKy
 mIC0cUPeDix489GpTGG5IyPiDwKcWu2AHQqysNaLEBNerP6CJmLKZ/Q9MVO4yp2Fk67g
 Qcqw==
X-Gm-Message-State: AFqh2ko3HqBUI2XPt8doYf1RhL3m1z/Lkbv594iMlf8jJrkoam/ONG/Y
 dpAADWAOPMEWjrjz3hI3SAPphg1sinkJmFtC
X-Google-Smtp-Source: AMrXdXtmEs13cQw9XXjjOifhXUhnaP2cJ4KRIXKyS6pY/fK3HDaJ5MkfjoutcrHeeHQZuTROFmJurw==
X-Received: by 2002:a17:902:6a81:b0:191:3808:14b0 with SMTP id
 n1-20020a1709026a8100b00191380814b0mr32078596plk.4.1672358549519; 
 Thu, 29 Dec 2022 16:02:29 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 07/47] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
Date: Thu, 29 Dec 2022 16:01:41 -0800
Message-Id: <20221230000221.2764875-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index add4d54ae7..287659c74d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2163,22 +2163,13 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 void ppc_maybe_interrupt(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    bool locked = false;
-
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (ppc_next_unmasked_interrupt(env)) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 #if defined(TARGET_PPC64)
-- 
2.34.1


