Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526C69D30E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8F-0006Lj-M1; Mon, 20 Feb 2023 13:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6g-0004fW-Ig
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:49 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6c-00045M-DB
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:45 -0500
Received: by mail-pl1-x632.google.com with SMTP id t14so2810258plo.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWlppU2XNhFXTdVt0C0CpRj3rW11FE4bGKcS7c5hawE=;
 b=YkXS++rAzG+g59bE2dOEeHYSr2ib3vIn6M8PbG1sw+iGMkNNzopHMgNyoL2qMOyWip
 4qG5XY3NaHFqMgsDx/eSKy2dZKT/bpvj0LCBoOdZ4PR+3euBOBHWH1pDJDiWZ2N48EO1
 KIDhHSNwrs1w/BeqCqcgk854qxQWX1kgPBNSVWSYH8A/f0ugcJd0FUwujwmsJOeIws8k
 dFCsnDC4CiRQzjdfCq82Kgu9PQlRbbjTls33L8UesrpVzflKy4XZw9zSVXYf7rASjZkC
 4y36VJtTL3jTmd+NkV6F5oqna6fsQpnXpsbWTK2EGJCjOEvlW7JlvXKzKZ3IGdqFVOQI
 5BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWlppU2XNhFXTdVt0C0CpRj3rW11FE4bGKcS7c5hawE=;
 b=o+Ro2UZ7LVWn9rRHUUoQDG+oNx9RsNiOH4S/Vz8f79Jr49zSCoVGLhKco5tnE2ffsu
 cySdVuX6Cpqt789muRMdCYTzwKU1IAFJvFFLZOoj3fWxqXOs/t3ODM6sqiqd6WfqFtRH
 FF0x1RBTTD63XAKT9EhbP7bm5bN5bHrgOKPNDLt/uxDt6osXfFlzpsG154bbLCjSW/7Q
 HacdC0Vh0/M6FnooFuXLx9F1XJeitRc6hs37cGkuU2et3dlHEZe9tDJoS/Q4JBo1KOs1
 G7U+MCcT33opS/DVj/5vBMNoZ9E7HDmc6z/ouSSsdjrK/VKDia/v9sb8SyoMeCQmfe6q
 5CyQ==
X-Gm-Message-State: AO0yUKULCFoD6t9PUmFIjCnotmHyjQoHN23ZDDe6FGE2O2eT9t5nhzPb
 UHNYhwz5LK3GqWhvNEdb9vCm7hcie/2d7ud4KRs=
X-Google-Smtp-Source: AK7set/fOJAVGy8gfW1fq3EOGvPoM+5YRWCIIA2wQ33lXhECd3k0v7WhvOcW9Ieq+l7WPSnIz3xxrQ==
X-Received: by 2002:a17:902:fa0d:b0:199:11c3:cc4f with SMTP id
 la13-20020a170902fa0d00b0019911c3cc4fmr1542500plb.44.1676918501653; 
 Mon, 20 Feb 2023 10:41:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 25/27] tests/tcg/s390x: Add per.S
Date: Mon, 20 Feb 2023 08:40:50 -1000
Message-Id: <20230220184052.163465-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/per.S                   | 55 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 tests/tcg/s390x/per.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598d..c286d22a9f 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += per
diff --git a/tests/tcg/s390x/per.S b/tests/tcg/s390x/per.S
new file mode 100644
index 0000000000..02f8422c44
--- /dev/null
+++ b/tests/tcg/s390x/per.S
@@ -0,0 +1,55 @@
+#define N_ITERATIONS 10
+
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x96
+per_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe per_on_psw
+start_per:
+    lghi %r0,N_ITERATIONS
+    xgr %r1,%r1
+    lctlg %c9,%c11,per_on_regs
+loop:
+    brct %r0,loop
+    lctlg %c9,%c11,per_off_regs
+    cgijne %r1,N_ITERATIONS-1,fail     /* expected number of events? */
+    lpswe success_psw
+fail:
+    lpswe failure_psw
+
+pgm_handler:
+    chhsi program_interruption_code,0x80         /* PER event? */
+    jne fail
+    cli per_code,0x80                  /* successful-branching event? */
+    jne fail
+    la %r1,1(%r1)                      /* increment event counter */
+    mvc return_psw(8),program_old_psw
+    lg %r3,program_old_psw+8
+    llgc %r2,ilc
+    sgr %r3,%r2                        /* rewind PSW */
+    stg %r3,return_psw+8
+    lpswe return_psw
+
+    .align 8
+per_on_psw:
+    .quad 0x4000000000000000,start_per
+per_on_regs:
+    .quad 0x80000000,0,-1              /* successful-branching everywhere */
+per_off_regs:
+    .quad 0,0,0
+return_psw:
+    .quad 0,0
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.34.1


