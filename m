Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2543F6DB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:56:38 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKsX-0006MY-IU
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJds-0002dF-EE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdo-0000Q1-II
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: by mail-pf1-x435.google.com with SMTP id x66so8066510pfx.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3wWK4kTFEJCz0QHTFpGH7uNAR2Mgy+YfWQ3IzNlXl0=;
 b=UAGi1O0lZMRk43GTkYWQKKZWeA9hiMjHTjzXx71iVXL+pbaD78PwnO23Xk5x14qIrh
 nIUYRatoVZfVSG6LPA8Eo5LAL0GQIXYtkkgajeArJntFm93J3WV2ljHgasac6kQ6VP42
 Wc44NNQV6In2VtR+hqP+eHQOLMVeZM7iSN//7CZ7ztygbYNm2l3pzWEeQ1eG7qCR7h0J
 m7sfnz6RceU8q6QhV5tQ7fdm0+wzDxhR1PA/0wUCTiDZjCitICgdUla98B0u6EGbD/DY
 V8fPCOPryqYW8F3j1+N7UIkXltcMFpQK/OSJCQSX/7dYxGIMaQQoHIbGtO2wCFozQF7j
 X3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3wWK4kTFEJCz0QHTFpGH7uNAR2Mgy+YfWQ3IzNlXl0=;
 b=mFs2ykaBR7jj7eI263bJOdD2ehSi8wB+uXHpIEH5Ufr6eLn4fbvUVzO9VAJqUKhFRJ
 v2ghfpXjSV++ac+3RDVKtxq84vUoNy1Y5RZz+8PknE27V34hRFx50PQfdCgKKE5/K5jJ
 AC6zhuGc5tLskuYoIPAZyQNhJJlvjPZmqjAbfFkNw1xlewNj3aVFLRqaRFbettOieEXm
 lAH6Lc4c3GV0TR9KFA/lef3jQrcR+zVNTBjWHbUX9gyqCih3PASUpoTLBHAgzSzLlG33
 Yj+mRtgxyI7MOeEbLlpgHqruosv6HlLa46F7/skjJwcFrDGlyeDiwb/ZGAoOXwTF7MGY
 vUqA==
X-Gm-Message-State: AOAM5330WJRhZW+XKfatrmfn/jHDwl9aZghRMI2wzH0K0nZLYjnM4X7e
 gF4hp67GAxOTfpuKExjVJD9wQbSLeEp77w==
X-Google-Smtp-Source: ABdhPJz78yWRWGrNur7pC2xggzX/g6a9mYYe+E8YLGwE6z+/QQ27OmbqR6xU/Gk5SePtWy53MSlCUA==
X-Received: by 2002:a62:7d8d:0:b0:47b:dfd7:e888 with SMTP id
 y135-20020a627d8d000000b0047bdfd7e888mr8646274pfc.42.1635482239221; 
 Thu, 28 Oct 2021 21:37:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 60/60] softmmu: fix for "after access" watchpoints
Date: Thu, 28 Oct 2021 21:33:29 -0700
Message-Id: <20211029043329.1518029-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Watchpoints that should fire after the memory access
break an execution of the current block, try to
translate current instruction into the separate block,
which then causes debug interrupt.
But cpu_interrupt can't be called in such block when
icount is enabled, because interrupts muse be allowed
explicitly.
This patch sets CF_LAST_IO flag for retranslated block,
allowing interrupt request for the last instruction.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <163542169727.2127597.8141772572696627329.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9765a509d2..b9a8c1d1f4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -946,7 +946,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu_loop_exit(cpu);
             } else {
                 /* Force execution of one insn next time.  */
-                cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
                 mmap_unlock();
                 cpu_loop_exit_noexc(cpu);
             }
-- 
2.25.1


