Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B09655BE0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:06:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOa-0002L8-8k; Sat, 24 Dec 2022 18:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOU-0002II-Pf
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:34 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOT-0006Gi-7S
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:34 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so30551pjk.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFR0O1YijUsq1uYIRbDYqS29WFSZX2n/uoAxYINV+hk=;
 b=f1pSupuz8JnCPqeWS3Y+RLVCiI0ncCl4sYCj6dGf/Mq/XHznK7PQQLMgp+VRg+dL/N
 bI6fwnwfvdbqjSG0FtjjE9RQeKN5IupVyFtqY2thAuumw5Nj5mSZUJX0mAAF2uVVJhbI
 1uaZgukb9ojokk6kyXvTfNzlYKlUMdPwwfYZRSsAH6vNCujZtt2pM5tnmfG9kwpLagC/
 9BwlPxNyt1L4W0YfP/ivsp4OTPsmKXdJO0W9Ti08q3vpz0SfYLONsl/7woYU6XYwWaQT
 Lz+xf/0WBF/BD/4eheUbsjwEu9Lug+lgz6hL6DXo88CoJ8lwK//S8SEj/mI1v6u+Csay
 LZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFR0O1YijUsq1uYIRbDYqS29WFSZX2n/uoAxYINV+hk=;
 b=nL8WY9F9mrboDUlYjIOyiOkAtsWwU2xJLhT7mrP0tUnYlmLNae0T3GHnXvUGZvqCl0
 foHYQZOlGJu/BPG86DVbGjHrSgMp0Q8z0XfXtuCiv0LSc9jT9U3jo24mFoVkMb8D53C+
 YnzswXBIi+BuLJNHVBH07E9Fv05er+fULQkaBXhojVx2JtFVFGGYjuHNr0xg/vSUng/2
 DsxhBr5srACufk1o8icAQnpxgsQ499KL9MfrSXNORLvfJBe7aPvm9Z8lCJUKAuuTbNMh
 Y/g0oT/zLJ7YYTnZrFJYRk9BGV1wcbO2/NY8qcM/TXbbvxVC5W+XcTiQ3to/sXtYTgsN
 z/mw==
X-Gm-Message-State: AFqh2kqnpvFDgZLhmdbpHA50juptVEGuPzuWCDxlsiF6ojqFqdMMYSC0
 FcHlMYJOkSrVup6E14NDBRkLRraTmuaL3zI8
X-Google-Smtp-Source: AMrXdXvF253YVRqYeIwQzC0+4vUvXP/vnwTbbq0F1U5h6Dmecek/LbdujrmZ1752TTJd2/CnMcdOvA==
X-Received: by 2002:a17:902:e74c:b0:189:9cfd:be79 with SMTP id
 p12-20020a170902e74c00b001899cfdbe79mr21666649plf.15.1671926252521; 
 Sat, 24 Dec 2022 15:57:32 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 10/43] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
Date: Sat, 24 Dec 2022 15:56:47 -0800
Message-Id: <20221224235720.842093-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


