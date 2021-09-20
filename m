Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB25410E89
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:52:17 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9Pk-0006IZ-HJ
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iv-0005DH-Gg
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:14 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Is-0008EV-En
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:13 -0400
Received: by mail-pg1-x532.google.com with SMTP id w8so15859960pgf.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3KUOion9XWWhoPS4rc4FuBN5MtiU2iUhO/KyBmkvEs=;
 b=B4RMbwu5TdKbTQfxAy9Ztzg1LgicdEVJqzCH6kQbUMxCIFJ0sEZ3WizoT8BRgbbel8
 72jrCt96XbJAy6drqW4X1HZGIrnLuIszI86af6p1dxWFg7kdihpM43fIB3LczlqbS2rQ
 Nw1NFoKW67jHdoiWT6GPvHHQjEXe59jDnYbk7vYGhp2LKiFbvkr84neH3/1JavJRPSYc
 M5UXHDKe8/okjiDkWsJSsehybeagkpxVD1m8phS5MNC3vsa65NfGNz9yhjmM1EcWInlX
 CbwXedybl+rE7n96MWtbGvPOrRtLdX8f6yigjRhx84ShSBNpaL73c4sUh0aITOYWpDU6
 w+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3KUOion9XWWhoPS4rc4FuBN5MtiU2iUhO/KyBmkvEs=;
 b=wAKZ7DYkZcoAzhXVQ4d+Gbd2EUo9x8LSLqW/Iwicq7aNcuY023p88BTIH2U5JtE+aQ
 QCNII0Ytsx8srvB1L4BArcH0i54TO6u7TtYXZuJNcq9Vt38ed/VHfQqm0JFmVZzlLr1r
 kCdFgpEf7JK7qGKMmhV6wGe/xrw6+D62DNrE5c0z1HPRtL50ZB6PcVopmJbk5hftKGRg
 5BTmiqhV75XlHCN1WXlv8/g8QFlIPOE5NuzBMzlDFfqKV6bDGzh75MYrD0vn0gO9qUkl
 h31m3jgjjPvyKfMkZpl8ISiUvhKB/p95ihzpYr04+JIUTGtShyNHyBAAcw61nOJFFNUG
 5teg==
X-Gm-Message-State: AOAM530tqmuYopG2e2EgFErNd6lxpq3pS7Zae00hrBluEfIYR/jqqIC5
 3sSZWJ+ZOhYNF2Y5j6D9j8P6hVdUZoT4Yg==
X-Google-Smtp-Source: ABdhPJy8xIWyGm/lAQahuYVYUrStBMqOw0gBnL9fSOhVmhL6F46RlkLAj3k0cDj6JCT0DBd1gq2Fcw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id
 a1-20020a056a000c81b029030e21bf4c15mr22361978pfv.70.1632105909096; 
 Sun, 19 Sep 2021 19:45:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] target/arm: Assert thumb pc is aligned
Date: Sun, 19 Sep 2021 19:45:02 -0700
Message-Id: <20210920024504.625965-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub.c   | 9 +++++++--
 target/arm/machine.c   | 9 +++++++++
 target/arm/translate.c | 3 +++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b341..a54b42418b 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -76,8 +76,13 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     tmp = ldl_p(mem_buf);
 
-    /* Mask out low bit of PC to workaround gdb bugs.  This will probably
-       cause problems if we ever implement the Jazelle DBX extensions.  */
+    /*
+     * Mask out low bits of PC to workaround gdb bugs.
+     * This avoids an assert in thumb_tr_translate_insn, because it is
+     * architecturally impossible to misalign the pc.
+     * This will probably cause problems if we ever implement the
+     * Jazelle DBX extensions.
+     */
     if (n == 15) {
         tmp &= ~1;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de824..b5004a67e9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,15 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * Misaligned thumb pc is architecturally impossible.
+     * We have an assert in thumb_tr_translate_insn to verify this.
+     * Fail an incoming migrate to avoid this assert.
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62c396b880..e522cd2fbe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9640,6 +9640,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
+    /* Misaligned thumb PC is architecturally impossible. */
+    assert((dc->base.pc_next & 1) == 0);
+
     if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
-- 
2.25.1


