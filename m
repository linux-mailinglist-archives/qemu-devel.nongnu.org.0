Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21B5905C5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:23:27 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBu2-0004of-9A
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnF-0006jY-Q9
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000sO-2v
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso2978485wmq.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=bBQi63nUBjyD4P8li6gSvAkrvfkoQz4taZFgjQpefug=;
 b=PbYn+ImqxRrZalnxqoq/L7G3eeVOoA1PJW/yAjviXUWAX+SeJOcxBlEcleqJiCZMpN
 FrLIdXdmMJzuy4ZYThI8Cf2Bv/VTFdyeDK0Uak54EHTMy/FH9qzaAUZc0Sn4f4aYtIio
 KXyZAa4mgg+atjvuZShVXpjgTnyyQ4sSINOT53lo5uEc4HHfrfaA80potRaKMlqq5QSS
 j1KbJajodGlcLI4pIFPOQsRucVtFaagMSu48mmoA3e4EO+DBvsy27PH3PVWK13MbK8eQ
 0vAa9g+l0huGd8R6ZD7RqYlo3AsoX9jdqnBnMg7gJNEUo4JSSFJ/tinXBkPiq+2Equhd
 5RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=bBQi63nUBjyD4P8li6gSvAkrvfkoQz4taZFgjQpefug=;
 b=o1Kl2Ec/ff31LO01xidyPl6qcu2FXEfiAybljHyviMqSTfBxadFAGjs8BnqeelEIAu
 M18X63vM1oXNpXytVdrd8O3XiqGxa7WVRuCPOtZZ3M+BpcrmGZKWlXeh8Grsfw90uDDM
 f4SKXJa+J4PFwGxQ9d1rUlj0Tfr30CekEFXN8ww39fQGZY+e93Fcw9vQwekvGCImWJ5p
 lm7G01TRHM/rwrp+7QeVEdroFzm2kcJuy3ncHjUng2rt8BhcdwnmLoeho1e2GvcSUGTl
 6WzKXMpIL3n+hU/PHXxy0mDUFGkBRZ76MZkZqyeaxzBp6gPc5PNO42ak+JMpCpTpFtUp
 BC2Q==
X-Gm-Message-State: ACgBeo1nv4v8VdbrqPTQ6RKrwNWi+6Zq7viro9lG+kjoGmEIX9fQdG/e
 vFV2GY3Wu1aYDjiyiO3qqJPF6w==
X-Google-Smtp-Source: AA6agR4eBFQVCwBwoYQ/Dky3JbZTY59xDZBu0l2pgbgLcIh8BigNhcNTPnF/Wrud8xJ6pIQjbCXbOQ==
X-Received: by 2002:a1c:6a0a:0:b0:3a5:bcad:f2cc with SMTP id
 f10-20020a1c6a0a000000b003a5bcadf2ccmr2907305wmc.74.1660238181983; 
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Date: Thu, 11 Aug 2022 18:16:10 +0100
Message-Id: <20220811171619.1154755-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..87c89748954 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
         uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
                                  1ull << 63 : 1ull << 31;
         if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
-            env->cp15.c9_pmovsr |= (1 << 31);
+            env->cp15.c9_pmovsr |= (1ULL << 31);
             pmu_update_irq(env);
         }
 
-- 
2.25.1


