Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACA3F9028
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:30:45 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMxQ-0002NX-KX
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgI-0006jR-LR
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:02 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgF-00074c-Ef
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:02 -0400
Received: by mail-io1-xd35.google.com with SMTP id a13so5584216iol.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJx2bMrfHAGCXUegSpOWu82TCt1lp12JlVxQFWsXbuA=;
 b=1ppaXoDuZW99Es19ptpJMZDh2hqpwSwV0pyAsfxb9xhbQfCM6Y3UV+RKUtCknpjwwA
 g0qyNkhJa4XHKeN48YNp1XwoOpbSD+9OUwln/zc+1hiDHojOF/9t6W+ACLNn5o0KRgBN
 Q854fU3gcyYADBlm0JXHOyUHGrlPdpxDstUxrmarxZuDHo0jNHG3XxD9mMi4mYndGWIO
 3vERcWJh5FnbiR86mgTMyq2R5bAm+YgFIcsk6vFJdGqGP5pQiRuGgDv4oMIMKW6mpCpT
 YQevjMYtPn5ldNLgYbB/QzKR6Ufgt7dCJaeAbcCiC4znxX4+uAx9memPdqNkH7mOGE4a
 EXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJx2bMrfHAGCXUegSpOWu82TCt1lp12JlVxQFWsXbuA=;
 b=qIOkAc4UC84aY3yt3veMRKvlsNlLnFyblB+vlgfTUuaJkgT3auZSnvMuaEvwEqQWQL
 xxlyvNut1el5qzc5Q5v07Ky3+UoDIqwGDpUdpGyVWzpL+kXrp6eoufbFP/Us/2+Hhnaj
 vo3Buj5LMeG6DWh9cC9pTHS/VDgJV4fUT9O27OtfVJkJvSKSQhRfL7KG/Uv53aovV50m
 lRWOPA2WfeOKhEY8S56R9C9kmqOVqmoLhvolm+r4Ij0k6/yhO1F6rC9eY248az0Wq9/e
 gY4vzNtXfv2Nelcb4ecIS8L+QsUEHEeF4fjcZKOntkefzOwYY3/BRSjUKviz/Su8n7dJ
 aolg==
X-Gm-Message-State: AOAM532LxBxty1c6WpugXRP4Qbnd3T+cpLAubnKy3R3LWGAyU0lCQzUL
 YpindQ+HJNNq4EDMMpQYUpZbdMJCsq+b0niz
X-Google-Smtp-Source: ABdhPJwGPmguBa3oU+H4yqITI2Vsk8qcrAi4qggGM8Shzh7F1occhtoH6xJCN828dBW7XTtPDIm5gg==
X-Received: by 2002:a5e:9901:: with SMTP id t1mr4640185ioj.92.1630012378139;
 Thu, 26 Aug 2021 14:12:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:57 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/43] bsd-user: Implement interlock for atomic operations
Date: Thu, 26 Aug 2021 15:11:58 -0600
Message-Id: <20210826211201.98877-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Implement the internlock in fork_start() and fork_end() to properly cope
with atomic operations and to safely keep state for parent and child
processes.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index d60a0a7ee2..e2ed9e32ba 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -69,15 +69,38 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
 unsigned long target_maxssiz = TARGET_MAXSSIZ;   /* max stack size */
 unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 
+/* Helper routines for implementing atomic operations. */
 
 void fork_start(void)
 {
+    start_exclusive();
+    cpu_list_lock();
+    mmap_fork_start();
 }
 
 void fork_end(int child)
 {
     if (child) {
+        CPUState *cpu, *next_cpu;
+        /*
+         * Child processes created by fork() only have a single thread.
+         * Discard information about the parent threads.
+         */
+        CPU_FOREACH_SAFE(cpu, next_cpu) {
+            if (cpu != thread_cpu) {
+                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+            }
+        }
+        mmap_fork_end(child);
+        /* qemu_init_cpu_list() takes care of reinitializing the
+         * exclusive state, so we don't need to end_exclusive() here.
+         */
+        qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
+    } else {
+        mmap_fork_end(child);
+        cpu_list_unlock();
+        end_exclusive();
     }
 }
 
-- 
2.32.0


