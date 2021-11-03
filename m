Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19111443C1C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:09:24 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7aV-0006DE-7i
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-00054u-KK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VD-0000tg-OS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id s9so1464632qvk.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cp6F7ZXBQgbCbYqEZRE/UiFfLmca7aMu3by8nxJeJnI=;
 b=sPuc0k4lxxJi1HtBFzuhzWVEiHcvGIUiqSm52W24nPR61HagVB/DAf71bR6qgidCFl
 W8OnH8kwD1fgkVs+v2IH9ULvFhiVX5vIufjuy9YsjH2fBKK4YeHXD6G6WeZEQU81H84U
 lUmeUmemcvFh9JpAtWH6JoEqbg5iW3nIFvrfuM9PIG+0gwzjTaN6GXKcXB/ZBcZPKxeD
 ewigaZI+9zSGgFyP4VAXaA81TUupb6/tGa9zv8rFF6wXX+lupTFI8V8w8+MWizE1hNpx
 eiVfmy/dr7ETV65gMbY4rzhqiU+4GiM4IhrH4pdiRDrwr5P2jxNi2P612F4logEO0Em1
 v4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cp6F7ZXBQgbCbYqEZRE/UiFfLmca7aMu3by8nxJeJnI=;
 b=Q/im4AptgT8WMfQ/yHeWU7uB3caCrgR0BAvQqnKrlaTyLdgtq6G31TCa65QSs1I953
 TObMSgWm7ePaFGxsKXpw6jpSHvwGGYHGCsrqH4Gg55IRWtFkq8gfv/gimW0hoYr8eUE0
 Uic0W59eDiwP9uGNOQJrlSgv5ncFOW3q2HNT3p3QPLRziDHO2cQtrG+YY8WoDo2PmN07
 ihz5QBR8+eV+7mmqleF9PgiFh+YUneU9bQUZxWf+rJjj03GWuhKLeC2PWJDanjop714+
 Rs10gllHHIPepoUUw5rCvOhaicK+S/ZLtYXn6r8lmubXJKvMj5MTQJKdopsY5Q+q7ZgT
 f16Q==
X-Gm-Message-State: AOAM531zzrLSvVCPylZ+DSNmooQw8yEpI2G8wbyyOqWQ8rZkHyf7Pv/8
 /LNtS9rUibaaH3BpqlECulwagDdw9Ko8GA==
X-Google-Smtp-Source: ABdhPJzyW8yOurG0CkErdRKlA6xcZMR2Mk42onsfmpxYF6lIEJbqf6iqi+J8IPxuSxxQX6CqCcjDLQ==
X-Received: by 2002:a05:622a:148d:: with SMTP id
 t13mr41936079qtx.393.1635912234911; 
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/10] target/arm: Hoist pc_next to a local variable in
 aarch64_tr_translate_insn
Date: Wed,  3 Nov 2021 00:03:43 -0400
Message-Id: <20211103040352.373688-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cec672f229..9c4258ccac 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14750,6 +14750,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
     if (s->ss_active && !s->pstate_ss) {
@@ -14769,10 +14770,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
-    s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
+    s->pc_curr = pc;
+    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
-- 
2.25.1


