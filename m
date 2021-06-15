Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456A3A74B9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:11:30 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszU9-0003zY-3V
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQf-0004ck-0h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQd-00089s-58
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:52 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e22so10263070pgv.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6xkphnJBNo/K1DX+n+4XklxOsTRpwFklbH0yf7ANvo=;
 b=orK1N/okKba8HJImQ3grPtPAeeO7D8OVMYcvfD28O9EBEQrpfCtgBGr1e7y2jUutpO
 RHED7aNDb0yqQgs6TyLmxjkbEcs5aiuDEoMGKOOiwkCquu+agwgPdbQusRYhN+RFGc/H
 K+8cMyvBzae4lY7T3vgMhEzbFI+2KC2JpPCHCzjDTu2S+CmqGSP5xH1TLj4ovnpDKoW0
 UzOkfS/tqqTSeJmKUCs42Iqf/FIJksCNFEzzO08UtH24nj5pmvile49WPGtlusl0majB
 iWCD4yFZKnuzQk8dvrNyZibGna0IU035S1Lqi0RVV1teT2/B41Oj5a0h2SMvr1/lsmAo
 4t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6xkphnJBNo/K1DX+n+4XklxOsTRpwFklbH0yf7ANvo=;
 b=PQdCHdAxDS98wuSqf0gXnCLEEDDgNGjRzpBmia4Rkcz9A8ifgGKxIYhKcF0QZ2w7JL
 UUT+/NKbQYAoklSvXhp5eQFf71GrGvFE3NOjoTSf3lP9OewrU7o3VMr/t0MKo9m9C1Z1
 +LYyCZUvfPTRMScqYySFrCkIYWiZ8TStNrafnWntgbANpIYFl4WWU/1CyUiSSfzuYrPl
 tOmOW0ybEQhaEKQ5LXcQ+XG01HhtR4R006j/ZwEU9Nusd3F4Bj5TX7VBzka/J3TSuMK5
 9Byq/yrzqJfSxlCsg+TEtDQouLolu1emzAaobVMgoCwuF1Xl70qFVSq3fcmSKUQFXFZG
 pEvw==
X-Gm-Message-State: AOAM5336nnEIprymswYYpOzQYYrOZHfkEQHP8BIRodtPU1fglTnMsUAg
 Rf6XpwNmI8X++GO9S2UDk0ls7L8fdQ+w9w==
X-Google-Smtp-Source: ABdhPJzgbjO1keGwO3ZQBtDBooZy8KFZtdPYbwddgZsS2JW12d2YU4zwg0dBQ2M4b0X5j3P1Fu7vyw==
X-Received: by 2002:aa7:99c9:0:b029:2e9:e084:e1de with SMTP id
 v9-20020aa799c90000b02902e9e084e1demr2167491pfi.80.1623726469922; 
 Mon, 14 Jun 2021 20:07:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/s390x: Improve s390_cpu_dump_state vs cc_op
Date: Mon, 14 Jun 2021 20:07:42 -0700
Message-Id: <20210615030744.1252385-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use s390_cpu_get_psw_mask so that we print the correct
architectural value of psw.mask.  Do not print cc_op
unless tcg_enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 559fc3573f..1445b74451 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -338,12 +338,14 @@ void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUS390XState *env = &cpu->env;
     int i;
 
-    if (env->cc_op > 3) {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %15s\n",
-                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
+    qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
+                 s390_cpu_get_psw_mask(env), env->psw.addr);
+    if (!tcg_enabled()) {
+        qemu_fprintf(f, "\n");
+    } else if (env->cc_op > 3) {
+        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
     } else {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %02x\n",
-                     env->psw.mask, env->psw.addr, env->cc_op);
+        qemu_fprintf(f, " cc %02x\n", env->cc_op);
     }
 
     for (i = 0; i < 16; i++) {
-- 
2.25.1


