Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF45B8A6C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:26:42 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTLd-0003pa-D8
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMO-00088K-4l
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSML-0000ae-F5
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id cc5so15852870wrb.6
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5hn5ZCIWBTjKXNmV0CdKODbs07VBGmCbJWLiyFIEtk8=;
 b=UT2iBFutxaQZG3iau273rZQEnu9bwj2hVUgwj9atPhXvuLjzq38B+yh4zIxRRmNWY3
 lTek+YRzjy964PBiL06pl51sGJmvHYweKkU++77WDgSYyA3gtgieTndhcWHbTj+WAB5m
 fSrhWxxvBNJeRs1moVLV9XWZAEtj9H3fgz5lBIQWhdRVL0pOGwrK2qD/3Skly+je8bOd
 PLYNv809mJBxUzuNCh5+q3OdI4BQS4ZoN/BTksjK4qLeCKznQFPAewyWBj44gsX0K5I3
 lr4xWHmxdDiRkjZu1DnevjFzHh6azlWW604vuuZibXAXU2AEzpK16/eh2/XNPGzwJP46
 /YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5hn5ZCIWBTjKXNmV0CdKODbs07VBGmCbJWLiyFIEtk8=;
 b=GqGND5F/84+SnPbvdRTuqzMpqHFKlPkipHhkg6g185DlEexlQR95CEIpWweM+IoGVF
 z6ddwKcswIlAcXb4J2PdLLZMNhQnX4YCadkZQHUXxXghBKkOJ6vJQRQciOur60yUzHCY
 y/vtyj+4sHdbA0k2WEEfVgyyDVhMPb6rTHo1P3hAzxI+EkRyA1Qycjic6QgA6jPeSxu/
 A3699bFg3C01sVOMKekheT3izPL7p6cXKtUrkeq5JRYPUz85mbCpAP2Bgln1oPGDZEJo
 3ChpHWXGJd8kBQa0+dj2suQ8UmGczth09HW6JRGau0ErdG8qP3fU54f0KOZ4Qvx3010P
 MpPA==
X-Gm-Message-State: ACgBeo0gRCutCq1YE9SuuwDuamUDX0+uJhk8fpmNL4TR5cfLL1hxNsJ4
 rU+ZgxmHqHr+dLtovdpDLgbFMwovii26QaVv
X-Google-Smtp-Source: AA6agR64LE5V8zL57GsXZLjfOXvvZUJXo/aM3xvNW2VBYYSW/3CzpqUOaRKa6OAmIU5QE2/tQnbz2g==
X-Received: by 2002:adf:e411:0:b0:226:d3f9:4a03 with SMTP id
 g17-20020adfe411000000b00226d3f94a03mr22967527wrm.673.1663161800516; 
 Wed, 14 Sep 2022 06:23:20 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/11] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
Date: Wed, 14 Sep 2022 14:23:08 +0100
Message-Id: <20220914132308.118495-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

The riscv target incorrectly enabled semihosting always, whether the
user asked for it or not.  Call semihosting_enabled() passing the
correct value to the is_userspace argument, which fixes this and also
handles the userspace=on argument.  Because we do this at translate
time, we no longer need to check the privilege level in
riscv_cpu_do_interrupt().

Note that this is a behaviour change: we used to default to
semihosting being enabled, and now the user must pass
"-semihosting-config enable=on" if they want it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220822141230.3658237-8-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c                      | 9 +++------
 target/riscv/translate.c                       | 1 +
 target/riscv/insn_trans/trans_privileged.c.inc | 3 ++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 67e4c0efd2..278d163803 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1589,12 +1589,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
-            do_common_semihosting(cs);
-            env->pc += 4;
-            return;
-        }
-        cause = RISCV_EXCP_BREAKPOINT;
+        do_common_semihosting(cs);
+        env->pc += 4;
+        return;
     }
 
     if (!async) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8925a44c6e..db123da5ec 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -28,6 +28,7 @@
 
 #include "exec/translator.h"
 #include "exec/log.h"
+#include "semihosting/semihost.h"
 
 #include "instmap.h"
 #include "internals.h"
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 46f96ad74d..3281408a87 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,8 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
+    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+        (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
         post   = opcode_at(&ctx->base, post_addr);
-- 
2.34.1


