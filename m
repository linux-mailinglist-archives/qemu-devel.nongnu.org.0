Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3EC6348D0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaL3-0007Mm-0T; Tue, 22 Nov 2022 15:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaL0-0007Kq-Kd
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:50 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKz-0003Ul-2i
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:50 -0500
Received: by mail-pg1-x530.google.com with SMTP id q71so15058996pgq.8
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQs4PX8mAmo3ud+ztM98k++NoSQ+C6IEic73PWAugco=;
 b=JqIOfIfrfJ2WYbtWU3dXp6OX1IlvRFsvRgKki8dfBCQRE79I+i5Vm80f0WhyY6GrdR
 /hoQoPasTJd4ugMH8YFkPmhDhuyCVp4ixv05OT5RpTVp6U46UY06y+n0XkUvnOk2WAFV
 Vdk3ygSuC1EcSN9MsuTChU8A2c3TqBm7D9eZT3gzsHvnwZOE9Oozbiq/HQElWHXzGj4G
 RijyK/FkNzQCnNZWm04VAkSn6BRe/SwYIArdbO7zsRqDHF9Zrlud4Db1ndfkamLRe5Nm
 a2Do176wSZcleMX1JsXxSo14RHhD/XBiNG9lLtzM0gUmdZmkGyE4yd11OcShrrqtn7YK
 NwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQs4PX8mAmo3ud+ztM98k++NoSQ+C6IEic73PWAugco=;
 b=t6habXfCLjnCSw99Jyy+Xwt2mW7RmwAoP/AbadPNpzIdiPczHLiKxFCiv7QRkJAtUD
 d2KlY/V6Ihy1iFpnczSYoW0GsjX4WyPSKRZBR306Ir5DrfUapX3vua2XnYfdQxLe/fB8
 VAmzo6TCIG6wEFywfx9MH/6s18vke9LdqpuSDkHnmrhzx3Q38y2TODFJ6XcioBCBTD4V
 TrKeQg04MsZIycRw4v6tLlEsn9MmFAc0AaqmHAZXYJdxxTBbT6hQHacVkK2qkZ5LpQWL
 w72T1+zBokpnviB70ydfI1/co3eBEKsoc6+l8xu6PozQp6A8k36BbK2ERwqVnNRCGOWb
 o0EQ==
X-Gm-Message-State: ANoB5pkVjFSEwELoKKjtBBxtQfLajTlrfH8QaMDoIWY/qwsM4ARD+Zpk
 MrRDeFnTucTr5X9G+RAoBgKOxJpv2tkVwA==
X-Google-Smtp-Source: AA0mqf5uMu8MruNL5xSMISOLa+WgKRWlavz+t4tNonJZvhsWsckmzSZ0rK8JgASofrdtMVjPah8tBw==
X-Received: by 2002:a62:8648:0:b0:56e:cbe8:9353 with SMTP id
 x69-20020a628648000000b0056ecbe89353mr5598773pfd.5.1669150666263; 
 Tue, 22 Nov 2022 12:57:46 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 5/7] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
Date: Tue, 22 Nov 2022 12:57:37 -0800
Message-Id: <20221122205739.603510-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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


