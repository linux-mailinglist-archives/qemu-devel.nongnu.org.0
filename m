Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26755655BE2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOX-0002Jp-Bm; Sat, 24 Dec 2022 18:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOU-0002ID-JP
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:34 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOT-0006Hd-1V
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:34 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b2so8032122pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1y/tXWdTWI0vCwq66Bd7dAixKbHX6fB2Vsdpuh+SVC4=;
 b=G5vuMOqaKsTCUUUP7M0ZCTmn6uv/KwYRnto8TC7IBhrfeZxvqxpsYl6JRz4LN60sgp
 7UMTJ7r0cvjyK5mqgUMiVCTcIQ6nF7FVjLuAeK8TH/fd0UYIWrKgE+iWZD+eCCKiAKJi
 P+/wYifLb0JgfImcGQd+pem5gOkrIDPhwzUkWxmP9z8ygXxCNJ+iEiN1k2ZzkqA05+pj
 vhOg27H5oFl2AhM6WErh5j6++O4XNMZtA9Z705sRga3PowESrGQd5cPXD9WxfriKnEke
 Op/cyMJ8ZRQz1EP5qK0pxRgLZDVJKO20oC+30qD+SmEMDjAUusPhfcIDqq0X2Xp7apEI
 qjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y/tXWdTWI0vCwq66Bd7dAixKbHX6fB2Vsdpuh+SVC4=;
 b=r1csSV+I42170JWhy7WGGVUOUgPLYzVhMjWhsoa6Ao2PqLINo+J8zptLUbhQvuyP8M
 GupbWBicSsov3Zok8ivCPQZUmcNXTWK1DWRV1w2RA5/EgXr3jOFRh6jitV2ZrL1ryFLt
 BagvmzvXW5nEjnpSAW5Ldy3gvftAqyghyT29bxKghvdUFPaNTxFWs95cg6Q+WS1uo7If
 YTsuXBSUznZL6xg6af4NesY/j+aILiyjxXSXnVubvXMY3fJdzZbd+xrXuC07vYpKxB98
 31wNBpxq+IN19026ZybZhhLLcP/iOvTCpZD1T7L5O+jxsByHpZTBN0LilZkwFBWaf2XB
 s7ug==
X-Gm-Message-State: AFqh2krVGFC6yMzMY/Wcalzsi1g5e7qgT6jAtvfK5HtaB4Gvm3IjthUe
 DbU7UeMqDrAvJ3gx6PR7QHKCKgDouY79O04i
X-Google-Smtp-Source: AMrXdXv/pW7zoJQLszcAwAhrJPJP4SFTjX0/TZf8fI/KNUIeDnxFCJnogU2+ER7zGSd5nC8A3QwPxg==
X-Received: by 2002:a17:902:74ca:b0:18d:dd85:303f with SMTP id
 f10-20020a17090274ca00b0018ddd85303fmr15681166plt.22.1671926251618; 
 Sat, 24 Dec 2022 15:57:31 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 09/43] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Date: Sat, 24 Dec 2022 15:56:46 -0800
Message-Id: <20221224235720.842093-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..241d06bab8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -610,7 +610,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
-    bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
@@ -621,10 +620,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
@@ -634,10 +630,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
-
     return old;
 }
 
-- 
2.34.1


