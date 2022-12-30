Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70D65939B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rD-000332-Iq; Thu, 29 Dec 2022 19:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r5-0002yu-Nf
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r3-0002gR-Tw
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so24375389pjj.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFR0O1YijUsq1uYIRbDYqS29WFSZX2n/uoAxYINV+hk=;
 b=Yxmg1DpEG+35EWc1BpVW9AGd9v1eO+rAmp3ncEbT4yC9aIq5epS+qwFw4Nqv7ezsDF
 6yjSlPkzNcoEgqvzfajtf9fddGSzAeL/4/UfGdbOLisN7xEr0zH/L3kqKDtTdzFCI0OO
 ySBf3a+r1Fl6lttzQR+MDYzgNnw39xRj50I8hkNrWqFdDeXEIwYLERPZIY/yhoRo8iyX
 QgmTGScc4iSmnWtBJir3dsIO8EkA5OZ/eQA+q5EHAgN7CGYxLuQB/nDBCjrRwTXiVIrZ
 07hn8OILWg6Ap7mejSDWrqmgYy+5Dl/rjW3dAjXsmjkZV01KgfGemuI48FoWvmQ88hIg
 tx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFR0O1YijUsq1uYIRbDYqS29WFSZX2n/uoAxYINV+hk=;
 b=G2+hcgMBPs7a1jwE0sNLOJEKwtZxAMkyNOj11Jw4k1eatbfb53r0UNw2M/yA2GKg0E
 eyWbrHSjjsp7YB3ffCspwaJLp8hd3iO+QZqkppBhQ+PxNU9QIxvqQX0M/lb+ZZ4c8VBC
 3K0IfpyZYV6kTbkKV+r4UzeV/xU3MnhZ4iUuWC1l0goV3Hgo99D2GB8xbhg3Nqy4rnPv
 fwLbjPMBo/SGB+g+LBWbZeO/SY4Q6BvCq9mvyTKBpe7pN27aaI5zx8OFQIvhtao+FtQ7
 jPIZRFVlZUTwbHCqlVBk7jL61m+LmIdEhyyJZtyulSevnjUx0Hkgpnw1CUUYQxQVFlEL
 VOQA==
X-Gm-Message-State: AFqh2kpK6pUwsEymewfhL8mvFcVOUlKpE4yWYPhg9HfYMh9urfLhUuCk
 hZOtwNvLns+v0RJkWX737NoVxAjA/WKU/YjO
X-Google-Smtp-Source: AMrXdXufchr/lxscTvqO4V5cBExMCmVm4oksA6ddklcQhQbBrWWgnq4Y0ERk0PpaW56NoebRO0EaMg==
X-Received: by 2002:a17:902:9a96:b0:192:54f6:fb4c with SMTP id
 w22-20020a1709029a9600b0019254f6fb4cmr26050135plp.54.1672358552366; 
 Thu, 29 Dec 2022 16:02:32 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/47] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
Date: Thu, 29 Dec 2022 16:01:44 -0800
Message-Id: <20221230000221.2764875-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 hw/ppc/ppc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index dc86c1c7db..4e816c68c7 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -44,13 +44,9 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 {
     CPUPPCState *env = &cpu->env;
     unsigned int old_pending;
-    bool locked = false;
 
     /* We may already have the BQL if coming from the reset path */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     old_pending = env->pending_interrupts;
 
@@ -67,10 +63,6 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 
     trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
                            CPU(cpu)->interrupt_request);
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 /* PowerPC 6xx / 7xx internal IRQ controller */
-- 
2.34.1


