Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB43F8FE4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:28:05 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMul-0003ef-Il
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgJ-0006ly-Gi
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:03 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgG-00075E-D0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:03 -0400
Received: by mail-il1-x12d.google.com with SMTP id b4so4706452ilr.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9feBSntQr9wc6R2ciEEy86mL4P4Ky1+jxtK/c/4Bt7Q=;
 b=CugYFDh8AgB9Ry45KASJ7p+Crq4goDZ7Gvy7vspE7Yj4QVbUZ9j5LpksOJGF0MuvWj
 V973xRiBnF+JhYEPh2O7lRDPQ5gBQiHr+NI3NDDc80y0UsJOgCSuJt/CYy4GwWEAgAe9
 c3CKiFfIipd08Qgs7n6sQV/IEwVAInOtZ7LKc0RgWR5QulIFbVFAxvWBtrVddYjtTthv
 xDVhlPeTpVpgaB1Q3S5yIXBbUIw4YPMkMpf+8yGDBnFwNENZtQfydX0lvBrUDWx/qgaX
 zvbxp2xezUixoDuTGKA8LDCqhQg0HdXpyvZMCblMgiIjN9JNFlnWjq8itz5BlqDTbpsg
 WVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9feBSntQr9wc6R2ciEEy86mL4P4Ky1+jxtK/c/4Bt7Q=;
 b=MLQgad+23igyTxrc9eFWQ3bGFoYiqVf2/Xtfe/o4RJ1weynYhYLLTzRgEZDLh8Ou4R
 bByXy9x6SwJ9chgGibuSBKCFNsCX7xdNrWwhjjNg7N5rQCrBDTv1AG/J8Q0nHcGgPvy4
 o/UJ92eykJShCJ0Aq9eiTG0t+Lm/n99TvB6IwQjhxqVdv9Bpo9bWxq9D4AFyMOaYYXoT
 qW2kVprOJorfTC8+7zCIO1/19z4+qCQIBQkmaSIEXFIN4Uubg0Le6A5J7oM0mca2r57Z
 ucwPjzXL+l3gJELOfQ6+9vn0bshTk61qESxNygmNNpMjb/iELXYjGF4slmnacB8wTDw1
 kS8g==
X-Gm-Message-State: AOAM530Qd8wa/CA7CoR1sxDfNw7r6YcvDIgNmrXfRwUX4xW6ZGmyZRlw
 ezuMTaYUhhyOPYJ/lqxdQ/RM4+RW1mBtPW6j
X-Google-Smtp-Source: ABdhPJxkZUE4KLOMcBB+JvbVA9oCO+xkRQCqUuPB14qfpVdGRyKcJBvWivuR6uFaqO58WMNXII0Hpw==
X-Received: by 2002:a92:c841:: with SMTP id b1mr4156268ilq.300.1630012379088; 
 Thu, 26 Aug 2021 14:12:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:58 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/43] bsd-user: Implement cpu_copy() helper routine
Date: Thu, 26 Aug 2021 15:11:59 -0600
Message-Id: <20210826211201.98877-42-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Justin Hibbits <chmeeedalf@gmail.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

cpu_copy shouldbe called when processes are creating new threads. It
copies the current state of the CPU to a new cpu state needed for the
new thread.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index e2ed9e32ba..b35bcf4d1e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -180,6 +180,36 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+CPUArchState *cpu_copy(CPUArchState *env)
+{
+    CPUState *cpu = env_cpu(env);
+    CPUState *new_cpu = cpu_create(cpu_type);
+    CPUArchState *new_env = new_cpu->env_ptr;
+    CPUBreakpoint *bp;
+    CPUWatchpoint *wp;
+
+    /* Reset non arch specific state */
+    cpu_reset(new_cpu);
+
+    memcpy(new_env, env, sizeof(CPUArchState));
+
+    /*
+     * Clone all break/watchpoints.
+     * Note: Once we support ptrace with hw-debug register access, make sure
+     * BP_CPU break/watchpoints are handled correctly on clone.
+     */
+    QTAILQ_INIT(&cpu->breakpoints);
+    QTAILQ_INIT(&cpu->watchpoints);
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+    }
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
+    }
+
+    return new_env;
+}
+
 void gemu_log(const char *fmt, ...)
 {
     va_list ap;
-- 
2.32.0


