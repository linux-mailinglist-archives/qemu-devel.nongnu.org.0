Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714943F6BA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:36:55 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKZS-0003mH-IT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdr-0002dC-La
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0000Pc-GN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6546769pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tIu5ctMGZpoxO9SvCWTvVH9/VQF13Rr00jVN/1rTthk=;
 b=Yij0nAx3EOTH0yER87Cm8/JMG+CbZAfQPj9uXldXUrUWVeCOw/opmYHGkDYVLDKsD3
 /pJ0a1VyDRPR0VQl+ZAVZHIx3fE2wTzarpnwCF8X19zvxFZHmOFIGiOf6TFCuWOlzm4q
 Ktm8J5TehMamWKvBvYz7YqEJx501ur6+FmHq/DwqKk7q4rFOx0QVGxD9AVkaF/PBzIxe
 8DOoN8hmFSFAWQ3zH58dqrZTQQ000d5I1dpUE6L3kXvQLmxO1w+uZLtt8SzD3WtU6+7r
 dxwmcpcRbLdxC5XkwUwqstJeYpX+g0kjPf4IztvExeEjfYTSAwoOaqlmwdILb1E5do47
 QuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tIu5ctMGZpoxO9SvCWTvVH9/VQF13Rr00jVN/1rTthk=;
 b=1WAJQ8/aS1aidvFAUfXtTr22o/scwpsXpAJFzTcbli7qliRXPxOSAAjv6QF8u694fm
 hkSRHE7EljpGse6DxSjdYPGH3p1BgeywTRIpYTLZrKOnZnoys5qkg/Lq6ZRcF2KFfuGv
 cCVzqRLjS6XxIDPPfH27ahW33AocvS7iJAwA79rDfXpyg4KVO4kfiE2bPDMSkZlu3zPa
 g8+glFNAHlwTxzqOQS+9ZtzSQ6s5aUuOmPJsPP23bFm3cbbaH9daJIWShSiBbk50BW5z
 FGEf5bALcCYl971kbhZoQceTzCCG19juJsK0tnUFwMNvLP0+gINFRKAp8nfpW+1Noihe
 BdPg==
X-Gm-Message-State: AOAM530oP6N4rGw87PHdktywQ4/EsXIzB3Rlt4d5+h3AdQaGvvSrx+Kt
 8qeKbKMsrPEHd0t/NmFkn+pkshGaLbPWAg==
X-Google-Smtp-Source: ABdhPJxVHdgZcMdN14IMNNoizSnSF1bSDZd9BQD9EAAk84n+0nxvP08SYgp4L7HoLZ3tQHwxcu03zw==
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr9094868pjb.170.1635482237599; 
 Thu, 28 Oct 2021 21:37:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 58/60] softmmu: fix watchpoint processing in icount mode
Date: Thu, 28 Oct 2021 21:33:27 -0700
Message-Id: <20211029043329.1518029-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Watchpoint processing code restores vCPU state twice:
in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
Normally it does not affect anything, but in icount mode instruction
counter is incremented twice and becomes incorrect.
This patch eliminates unneeded CPU state restore.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <163542168516.2127597.8781375223437124644.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 555c907f67..d58752678d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -938,18 +938,16 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu->watchpoint_hit = wp;
 
                 mmap_lock();
+                /* This call also restores vCPU state */
                 tb_check_watchpoint(cpu, ra);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
                     cpu->exception_index = EXCP_DEBUG;
                     mmap_unlock();
-                    cpu_loop_exit_restore(cpu, ra);
+                    cpu_loop_exit(cpu);
                 } else {
                     /* Force execution of one insn next time.  */
                     cpu->cflags_next_tb = 1 | curr_cflags(cpu);
                     mmap_unlock();
-                    if (ra) {
-                        cpu_restore_state(cpu, ra, true);
-                    }
                     cpu_loop_exit_noexc(cpu);
                 }
             }
-- 
2.25.1


