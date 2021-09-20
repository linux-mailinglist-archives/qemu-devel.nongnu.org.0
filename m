Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A122D4128B2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:14:32 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRYV-0008Ud-KZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6C-0003Gt-Np
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR69-0001eD-Sr
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id d6so33410681wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EcdesvsJoOlVD4oVUrlLoUx+HKq+WK1ZDA+Budxbds=;
 b=Se/2z/geo5FI46kWLvoUFaBaTiYbHfGC3XDIQIWMW5byBRWA6HAsiEd+X8A++IYic0
 PUMvwzGa5vS6iRHULvULPQaoissydXnBxTA3W2wVLWW4xWGIw5OF8WJQyPVZKR5v/ZFh
 ct0kFGjN2EwIGzqxag7mFcP3fwuynpPfUouxRbQpa3x17RvpPw9YdzWfOtyQK4ztwBa0
 JPWFEsu0rVu+DAf2XcANd5/L2vFfYtyE0mRnG8OlN8UtMg+1RujReg9lAO06n8GqMKce
 E/UhmwFXkOBQRwk+nz+iqOnQRbOlFQTMlN6QHOD/YYWDdphQ8qliBr7uFxoBQa2/5pYF
 zssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8EcdesvsJoOlVD4oVUrlLoUx+HKq+WK1ZDA+Budxbds=;
 b=QDyBK4lDIr9lONDGEcbxLNYznKlikSVnA7tUQ8HqDh+/oCl2YR2fqD+ABUtm8EqYoF
 qq4HfiPFcCZ6nvr6f+F70PM/q0+BKqQEddvkFXhxF8f27MABDFtcgyAioKgytA7vdoyV
 39StcXsQNJYlN3m9YnZGNy97Pd2PIhrvkx5FaCiN7o7JLKhop5zdQf7iu03FXU3Ko+KI
 8o14gU+bwG+CB1vrDiThL7QLbMGnJGUWX3l1SshQAk0oFqANt2+YgFJBEd47ygT2iz35
 F6hScGXuDZX/fWWEz1SnHNaoJU4pPiFIw8rSc3hqPovFGk4JTuHh8aLLu4lmzKZkF78L
 aKHw==
X-Gm-Message-State: AOAM5331X9Bs855CSMrXVnx6qIxFr1h5EkjZCEDYr5zTL7+KsLZP7cV9
 HobmilVh0FX5JQxi8RM1LB7jIW6Z3rA=
X-Google-Smtp-Source: ABdhPJzlOI9er9FjK4o4c2iPxj09AR/ZVzEbvFwr0m6nKF+czseY1PAcsl51p7XLmzJaUNvYo32eUA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr1107445wmr.168.1632174312177; 
 Mon, 20 Sep 2021 14:45:12 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 b207sm759238wmb.29.2021.09.20.14.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/31] sysemu: Introduce AccelOpsClass::has_work()
Date: Mon, 20 Sep 2021 23:44:21 +0200
Message-Id: <20210920214447.2998623-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..de83f095f20 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,11 @@ struct AccelOpsClass {
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
+
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7e2cb2c571b..e59046ce39c 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,8 +255,13 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    if (cc->has_work) {
+        return cc->has_work(cpu);
+    }
+    if (cpus_accel->has_work) {
+        return cpus_accel->has_work(cpu);
+    }
+    g_assert_not_reached();
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
-- 
2.31.1


