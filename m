Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E214757B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:27:42 +0100 (CET)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSRh-0001dd-2v
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRia-0006sV-Nr
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:04 -0500
Received: from [2a00:1450:4864:20::42a] (port=44787
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0008RN-9J
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t18so37328573wrg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dWLzLfQlZup7XMFO5JjnyV3vJtIaJi3BRfsuFCKl1fw=;
 b=tjcHFBy++rBJC+apkSX9pLVod0YN4PSXuNE+vIIA4etm0fwMGdon8hC7yx9pGxKx8p
 +a8W+FyjsdgU3wC4ph1hfngIiEHhyUXKqbk/Z6/1SIe9AVgLzErCPJ+OpmZDPdma9Wib
 EKCaij7bbjOvEGuH8gNQnZiDi9CTalLA30mENEMQNiB4IJv181gCx6IirBFI6FWZOJtZ
 KYYPfzPFqUjhf4ZYPq7h/wz1WxkAJpyWus7Wj37JypVSI9KYsg871Pzxpe8ubURBiLST
 J383CjWn7Nxi7ifXhAz0LOrQ1NMgaRPGHZtHXlEEun9V/vvkzgPDqfn84TBQe8VpDzjH
 JFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWLzLfQlZup7XMFO5JjnyV3vJtIaJi3BRfsuFCKl1fw=;
 b=aUoJcnoYIl0VuZMJWOFnuAoy4+ZmPL1vlfJ2QUcT6LgZIYazHeaAzPtsM/Ktn63GBm
 dvdi07uXaeJkRXn4UFaNr0mZs8QkI5OvlZ7ROzVDh+MjcI8BysWezU4k6R3TJ5BiKS0B
 +/+dOHnM8JpMbsnih3Yq4n0KeSvAfARZgdjwj2f4gQ/pqU7zY9gE3wNNHzeftneAkfN+
 o1lngKBBY/XDIDgQBTpqts64hiAitDQEATspIvmCNN+aZTa+jhdKDKufzUZxdCu1mUuW
 vZvCAzCCUx+xP2rjNBNW5kdumAOvfVrcIlqeFPCRtNGDpzinKP8aRta6+lOkbg6TG0jv
 wpxw==
X-Gm-Message-State: AOAM531o53hqhGK4oKb55FeSBTo6jbzxIbBxXka+PSuZNj8ghL+iKBh0
 H4Fa17aB+IgDXXqUIVymruEmLoDQVF2V4A==
X-Google-Smtp-Source: ABdhPJzoj/XC/7uESrALOkJ7nut9OmJBvVBARjn2z5U2AXfM5Z/r/KER5x0z814oy5ayC8MhAZ3DGQ==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr3776973wrx.298.1639564860040; 
 Wed, 15 Dec 2021 02:41:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] target/arm: Assert thumb pc is aligned
Date: Wed, 15 Dec 2021 10:40:32 +0000
Message-Id: <20211215104049.2030475-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub.c   |  9 +++++++--
 target/arm/machine.c   | 10 ++++++++++
 target/arm/translate.c |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 134da0d0ae3..ca1de475116 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -77,8 +77,13 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
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
index c74d8c3f4b3..135d2420b5c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -794,6 +794,16 @@ static int cpu_post_load(void *opaque, int version_id)
             return -1;
         }
     }
+
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
index 45917c3a6d2..0a3840d227f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9646,6 +9646,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
+    /* Misaligned thumb PC is architecturally impossible. */
+    assert((dc->base.pc_next & 1) == 0);
+
     if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 2;
         return;
-- 
2.25.1


