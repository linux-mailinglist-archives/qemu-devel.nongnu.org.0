Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB3655BEB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOV-0002IM-C6; Sat, 24 Dec 2022 18:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOS-0002HR-Nl
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:32 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOP-0006Gr-Ix
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:32 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 19so1057917plo.12
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5fURURdpD95K+AiPWNLzyWdmAHAOzWJ7x2HA9bfmtE=;
 b=gSOKXzHUlob4/XFdvy6zVrRqgy6Kn+0xjuruKXOb+Kh9hceluI8yE7R5KBMYNSP/E1
 1G46aQLSJmbwUzdGIs5sSYvDq9ErjdUe9A9FTV2fqINzcUXojHeswUHPAYU+h8rYgkif
 AheLTANcinF/vIf8CM0X2v4M4mwp3W81AzQDm7Q12v9Up783qvH9IOPZn3mCjZnbCbO2
 75GOTCZU2O+HK9dZBv2X6vENR1BYPfGKw5cc0txf1ufpmwjjmCA5mbzFNfx3gtKs4wuu
 YS72044HjlY4nnltPYc9NEDZjOg8GtjXF7dStOpgidot7+qfXVBPgzog/FI7KTs9jzml
 4elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5fURURdpD95K+AiPWNLzyWdmAHAOzWJ7x2HA9bfmtE=;
 b=w5N6YKhXN3frybR27F5HEwMh39f908L/BUeXp6177856Y+hsbkfGmVcKYSpuCXrb92
 1TmeRDJlkt4YmzbFExWnSIh6aVy5MMMiX0MCFKOMPe1ir5oUJ5hsRI3pk+J64Cp/d8rG
 tT7NrVFH1Bxa0zctjIJynZSHTMjvCzgCJExQ4377sbX/owjz8+R/AxtKmdLgbVMCyTqA
 wbeFHI87Ufcx5VdQdTvkCykQjsCLRV0s2p3jF/gETPr4ALpDaoHe/Zg0TwAco47htrlI
 egJX1jTnhWfNWZCo9RL1D3qDT7J9FcJV/ANxt6eT8Ku0zYWn4os6T9NWsYig08wiQLhN
 D52w==
X-Gm-Message-State: AFqh2krvPHiGtrvdExkcL52ekGYCdLP/pqKdWHtXVMx954f+jRcfPvqY
 qkZvIZ64Jr+Qv2H1lkz4wLz0nY86bllmprAs
X-Google-Smtp-Source: AMrXdXuICCWcCygDes0PcaFwcxgRSBqXzGGBP8nxTDYEYEw5ZKMwNIpLCv4Glwi6BThGPucwu9Be3w==
X-Received: by 2002:a05:6a20:1455:b0:ad:e06f:9540 with SMTP id
 a21-20020a056a20145500b000ade06f9540mr22269325pzi.4.1671926248344; 
 Sat, 24 Dec 2022 15:57:28 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 06/43] hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_mips_irq_request
Date: Sat, 24 Dec 2022 15:56:43 -0800
Message-Id: <20221224235720.842093-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/mips_int.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 2db5e10fe0..73437cd90f 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -32,17 +32,12 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     MIPSCPU *cpu = opaque;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    bool locked = false;
 
     if (irq < 0 || irq > 7) {
         return;
     }
 
-    /* Make sure locking works even if BQL is already held by the caller */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (level) {
         env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
@@ -59,10 +54,6 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu)
-- 
2.34.1


