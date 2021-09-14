Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B1340A244
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:59:57 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwnk-0004HW-6i
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6e-0001nL-6F
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:25 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6W-0007lN-VF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id w7so10986041pgk.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3+wfe7Ux0D29NdwhN6ov8jkhZkotQHpDYIJoiL5pyQ=;
 b=pTF6QdRMlBW8NJiB0A8O1fDgFusClxIAaf5eo+skdcdG7+Sh8jpk82y+89jxuSnh02
 EIHWm91IjJB5mBQl/beGmk+jk0k7J2tB6TRclzw4IvecRr1bclbvliwR114uiNPAWKll
 ZhgpJvTgRFfIHTQDNYcMh1QDGx+0quKIyh6n/lMQdQ6nmsH7pwJJn+a5QpEz8ls5TE7w
 BbOfeQjqRliAUPCCa6NfO0uCbdX/CQ1NFzve77ttVR2QWhp3Bys+Rpm5rd9urZqkvbvt
 zSVm6bBTl0ertGAcZsNoxRj9O60mYb7uZV4VhzxrzWGtLJjFtxNR16B7wMC1MOlvUZcu
 vO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x3+wfe7Ux0D29NdwhN6ov8jkhZkotQHpDYIJoiL5pyQ=;
 b=CP+WiPJgxcQ7dhsXcXvHTPVRMs1DCm3nEDZRdy5kNzVtT/xuozrA5rltaCNbJlqpJ7
 kVSHiAYWBOvtoFyHFtkE6Li8tG86IVou8+yYEke9wLDZKLKE2PZE4gWFTz5MTfw4mGnh
 DIyHfj/h4nkkMqvwdM74G2IeuzCMGPB8k7Crda/UlXefQ78sJAPKQDQ/yrcxKlZT1yat
 ah9V2wI3yHrvanJIbXC+NGRtcOiwMkt1mLr1sSbvW/Devi9x0NfzL5zqImOrOQX3eRP+
 JiT2YZzwYvg5o8E++Q8xXAkKg0rPfCBWlDMZi3mhUaFuaTTI0ereizxoGfRiwI3bUSRK
 /eYg==
X-Gm-Message-State: AOAM530m3SCFd8LseTTCqcmNnadqK09Axk3Yd+Ys2ZKmbxEsA84EatjR
 FWYahfYpxDnfiFdQ/q75xAUqPxE2ziU/Ew==
X-Google-Smtp-Source: ABdhPJzDGxMxlJQLolp+VOzKwgb84Q0vIwDwR9xQ7vwNZUjUdIjxQafbyr/dhMXVahx8telPCMsxtA==
X-Received: by 2002:a63:ef01:: with SMTP id u1mr13261556pgh.336.1631578515054; 
 Mon, 13 Sep 2021 17:15:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/44] target/nios2: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:35 -0700
Message-Id: <20210914001456.793490-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-16-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef8..947bb09bc1 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     ncc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
-
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


