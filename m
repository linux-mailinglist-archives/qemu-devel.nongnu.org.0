Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE81580082
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:11:09 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFync-0006bU-69
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiD-0000t7-PJ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiC-0000Fk-3Q
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k11so15663810wrx.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QS8/Mz4m9SIuDGhgYB4lvPLK9Hni5wZ7MVsQ4sSUUEo=;
 b=hF6YZy1VAcTK6qC1lTDtiUryQZ2Z8uxqJk6BbwyoJJu+/4lSm98/cdut9K+znTnWqh
 fZZiJsYlwujll5l3T/iesUTUrLTo6hiezc8grwPcrBLdxA0EnJKknzcgVmgmhDN3kEL9
 wpGMR7IVTsmzBtq/6Cq/p8Pa7HvHuC2go5//XpCGk7vYlfxKmoTe9n2DBy05RLmBMKkG
 DtqJ4g1iVgt8HZGrfKepWt+SzEoH3ztlY6/0zqD2XMnCpD9HCGnY+gAsneqoNb3C9MYz
 D6J069kb9TsfEXkKpGWAk1ZauAwL3Ie8Nj+D4YZwvJluM10cg7kvAhBuOWqtoUnM3nl3
 VxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QS8/Mz4m9SIuDGhgYB4lvPLK9Hni5wZ7MVsQ4sSUUEo=;
 b=7KPRrrIqL4D5G0T0FMpzk5k2VKeOhh/Ilfip13DWU7KWsVqTC2/yN2tVp5kfOmoDhJ
 lFS9YB7phuGizre2+hLx7+7L5n2NHYvzoReYxYlHtEaIeWq/hnsPIROFK449AC/lPxNa
 5NKkAo78XAYk60qMULvAG0Bg+Z+R6DWx9RAGS+OrAJu54xT6H+lhKuVWBcWHes9PYD8+
 cxKnfqfAJnT0gVMl5un9v/NhLTRs4VrS/4CKVI2aoWLE6CQ3XoygN3MQJYur2jc4Rqo9
 tswMCyUXY+KTtg4sw9Te+HGq2NQiW4wIv/B/YoVva07/RWkO2xZjqFOXC2hs1Sw+o9/m
 mi2g==
X-Gm-Message-State: AJIora8qiG34iBBWQKY7AxoNjJsIrZYsPFECANtfvhqqSCw9pyag0dwV
 tygorfFnI8LoKgvgFpnHQvnWDARzr1/Ejw==
X-Google-Smtp-Source: AGRyM1ug4ZGilnwe4U2/U1lxPPTx/Pc4TAt6nbEySY+9O7YlH0tkemRiU0VR984F+iz4XFxsmvFlug==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id
 u10-20020a5d434a000000b0021daa7eb1bbmr8292689wrr.619.1658757930685; 
 Mon, 25 Jul 2022 07:05:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003a31673515bsm20185235wmq.7.2022.07.25.07.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45A071FFC0;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 08/13] semihosting: Check for errors on SET_ARG()
Date: Mon, 25 Jul 2022 15:05:15 +0100
Message-Id: <20220725140520.515340-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

The SET_ARG() macro returns an error indication; we check this in the
TARGET_SYS_GET_CMDLINE case but not when we use it in implementing
TARGET_SYS_ELAPSED.  Check for and handle the errors via the do_fault
codepath, and update the comment documenting the SET_ARG() and
GET_ARG() macros to note how they handle memory access errors.

Resolves: Coverity CID 1490287
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-4-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1a1e2a6960..d12288fc80 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -171,6 +171,12 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails. Eventually we could use a generic
  * CPUState helper function here.
+ * Note that GET_ARG() handles memory access errors by jumping to
+ * do_fault, so must be used as the first thing done in handling a
+ * semihosting call, to avoid accidentally leaking allocated resources.
+ * SET_ARG(), since it unavoidably happens late, instead returns an
+ * error indication (0 on success, non-0 for error) which the caller
+ * should check.
  */
 
 #define GET_ARG(n) do {                                 \
@@ -739,10 +745,14 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
         if (sizeof(target_ulong) == 8) {
-            SET_ARG(0, elapsed);
+            if (SET_ARG(0, elapsed)) {
+                goto do_fault;
+            }
         } else {
-            SET_ARG(0, (uint32_t) elapsed);
-            SET_ARG(1, (uint32_t) (elapsed >> 32));
+            if (SET_ARG(0, (uint32_t) elapsed) ||
+                SET_ARG(1, (uint32_t) (elapsed >> 32))) {
+                goto do_fault;
+            }
         }
         common_semi_set_ret(cs, 0);
         break;
-- 
2.30.2


