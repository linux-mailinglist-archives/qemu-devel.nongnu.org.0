Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D865937E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r8-000310-GW; Thu, 29 Dec 2022 19:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r4-0002yJ-Rh
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:34 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r3-0002g0-6c
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso24358672pjp.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1y/tXWdTWI0vCwq66Bd7dAixKbHX6fB2Vsdpuh+SVC4=;
 b=HxksPY9G2ZbnBY77BTiepwj81VIl2hBLXqFuzerP3bHMeHX1U4C0JQ5MXelVhol/3L
 755Re1XSpyUSQ3XqaAKkYoBz5zG5fCJAiqg2mBN7ZV7ODrTsYCG6evS0CcZbt6jCVzuX
 07Ol1H+7VJuikty2a+oaIP7sZSTpuCgvyarjwVBQ7KZRCkqIWZaMmi9R8SBJ2zdawBsi
 wjs/UwINaS0+HFoBexxQvjiJRAeny3uZlUVIRDO1ST7xKMT5E+aejn5PfOHb1marNlSj
 BX4h0bwWRsojt/XBvYNfkm4LQOmjgiKXQ0/YLdH6REFQgNw9rU90xU68zmv4/ywTSTFK
 Kkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y/tXWdTWI0vCwq66Bd7dAixKbHX6fB2Vsdpuh+SVC4=;
 b=nsIeD+pdXkP13us5TV25qJT9qsej7dVL7/Yg6k0zbT7dM++x94WGrYX7TLtaRRiFLg
 XC29mgV2/Dc5FT0i2XLR6tibTBnMsXJv7G4LM8kJ4TgP484UKVD3aOeSJdNCcbDREg8C
 SWsOyzXw6uchxcJP9GRjig8s6k7ka5GkLdL5h+pehsMJrBfHsnnvHwBAR8hGdnF0S1P4
 8W+Oi8kicNBd3GIlHTuEaXXXTH+E8j/6AFDJwRLJIHtC7sFJjJ2D67y0wy5bXwvvYTzY
 6yBZ8Gb5xAH4PuuXgGY6SBkVRTfLKB8WO3Twujyt0kJtHEnOXxg5sxCMxXdbaZpKZNDn
 Kqrg==
X-Gm-Message-State: AFqh2krVkGiNTwW7DR5s2aoZT+cRs93FVdtuW39E1qIwhQRcR1xnuM9U
 AMlKA482UPKvodgPDBXASHAJAfKVqCoe4cUj
X-Google-Smtp-Source: AMrXdXvmnj4r4ZC4aJlQPeTnD1NsW3Ry5LamEAAQk/xve8tcUZhpOk6+RsSkySEfNgLw16GQEVbZAQ==
X-Received: by 2002:a17:902:d2cd:b0:192:9c7a:e60c with SMTP id
 n13-20020a170902d2cd00b001929c7ae60cmr6953086plc.48.1672358551406; 
 Thu, 29 Dec 2022 16:02:31 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/47] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Date: Thu, 29 Dec 2022 16:01:43 -0800
Message-Id: <20221230000221.2764875-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


