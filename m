Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE25416FDA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:02:33 +0200 (CEST)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi2K-0003VU-VO
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgd-0004bb-VS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgc-0006pa-Dm
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so25550649wrq.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRKOlLYiSGogxCXK7W1sZhtnHuRe58y47UC3DXkXm/g=;
 b=B3in8lo5Ftj1ZWYW4d3iRbT6My7HPS9340+n8jYee0PG6H3f1FWsaxbQ29hBXTsR96
 S5ylV6RBV6667ZFItiMgghyH4+172SWd1bkQC0ZmSogm5rJDoGmGmEtK0KHO3f6HuXpn
 CWPlShK2FnjnqBTgjEbcIMOookkO3/65IbnMHsLm69rTcuGZwidgn+eu7tK8i9PXD5i/
 xa8zQz2Lgvh996KoRx0bYi+n52RGzBfxpYHrTJMUO4ubBOddewTjxSEmlm6JUaHE8K05
 1LDYPwRVmypRiErPoeyvNS3CjRrF33D6sD0jrp78MXs+wYepXxRQpdY0iHQNYRLnTh3X
 O0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JRKOlLYiSGogxCXK7W1sZhtnHuRe58y47UC3DXkXm/g=;
 b=spsKhz1HzoqsUyaWEHkGBN1yTtNpuJbDlzhlTCzUVvfIsMfiLYQvV4nRcNAudCztfl
 8ao/67ut4nUq4NDv+m6fFxIpzPiPBsLU/ZPP8pn4ziYt52YkLv6SlJiDLGysJfiUxAuT
 Cgv8aaYbgjF+iT6Fz08ShR95268GD0u+VFg3IfHvch94DEbpnpIZ5fjAN56AT1WbVF8p
 v/q5bISs/UYE2R/7HozTR6HZuaWExVbTpiyobf0HTxvUCs92C3f6D8PBkthe9uu/Kw0m
 EmI6FSQkhoFj3Eet2ZcPHBBDKTv8eI+zo5xGeYuY28fz42pO/fz010s5cH7YKaGpPMOt
 e7KA==
X-Gm-Message-State: AOAM531e+EH2YlaTwHmkYYt1eqDES63MZP1oDjJCXuw8l1X1zu2yf76Q
 BpRew/5fLFhNqideWQ89wIq+XnGitFc=
X-Google-Smtp-Source: ABdhPJxSsi7GocfHNhpK13aPvafIyRTlD02upQgzK1BlcjNSRQVC4JWnZMwFlNu2os4BXMV9LBa9Wg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr10524041wro.166.1632476404945; 
 Fri, 24 Sep 2021 02:40:04 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v191sm7786345wme.36.2021.09.24.02.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/40] accel/tcg: Introduce TCGCPUOps::has_work()
Date: Fri, 24 Sep 2021 11:38:23 +0200
Message-Id: <20210924093847.1014331-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a target-specific has_work() handler for TCG.
Eventually call it from tcg_cpu_has_work(), our
AccelOpsClass::has_work() handler.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h | 4 ++++
 accel/tcg/tcg-accel-ops.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 55123cb4d22..4a4c4053e3b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -66,6 +66,10 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ebaacff1842..cd44bb6d0d8 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -80,6 +81,9 @@ static bool tcg_cpu_has_work(CPUState *cpu)
     if (cc->has_work) {
         return cc->has_work(cpu);
     }
+    if (cc->tcg_ops->has_work) {
+        return cc->tcg_ops->has_work(cpu);
+    }
     return false;
 }
 
-- 
2.31.1


