Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C1B4117AD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:56:38 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKii-00087N-9I
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9h-0002qx-Ed
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9O-0000tV-Dz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id w29so30194815wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xu+mK8AOnXi204q+XHXbI1+B7494jG7C23y0nQnHqpg=;
 b=AWnorpxNH5EkQJZhM7wkyfKai3qNM0H+I+oWM782rgsk2YA93qjkBoWCjrKgUIM9/N
 H2KcQrpUDPlMb6DNUAs3x9MwD8OVIdqDyjZHvNRBlpuspy919Br7ry9b8IVdOqkIZIUk
 rGwknR/8UmCTNbIdr1u/hqGio4KuisMn0AMg6iar6F6e9vtRjgereI/2SLUQyVKkaTZH
 c5XUKL8EATOzc7AEDPJXLrW7y8cOMeIcKCw6mhYuiylGu0NKeRBhFhUroZ8zNFAlUMxs
 C2KK2rD+S6nydAXLkaZXwRrKTeZi0ZJdqt/Ua638U4nlT6UgCF3dFPQN4qmv67Nb5Rv9
 FStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xu+mK8AOnXi204q+XHXbI1+B7494jG7C23y0nQnHqpg=;
 b=WLsmGU1ZKnd0+hE+BgtZ0xRXJ7LAyrGwCx5FrKF6IqXY9BReP9m61GM+w4Wuh7MAsT
 EgnYsbURQP9LhwTtHQ0bvkPdc9S+9JM8Ve5WGV/i1ZYV7ye4mVUjJNfzR1VcG+O/kD2A
 MBU3eCes0rdkZjS8L92H65t/jAjdDJkmEwERbeC++SVfiJXlbg/rPlMVE9ey9LEIv2+D
 hMDEnPjaH8RcSyeN4ZIZeOGZpTHzjfCYLq7dsFyKvTctdiuaRwh376CXINwylM8o9y+3
 2ZUJNzJlSOD2ghlV260xWUpusgrc0JTdyvV7VDwoFpNOm225XETB0mE6vIyqpSEC680X
 +aAg==
X-Gm-Message-State: AOAM530qGG+3FArD2+Gqm2eq6pe2gPLZqoG8C3qOyBbwXKx9787UnIta
 kCy9+Z3tHseEuar6SVwO+k5EBt3dCyNX2g==
X-Google-Smtp-Source: ABdhPJxriO3XasuuF4EVwaBXdzPj88GHjbXqZ0d0DgstxM0ygIb081qRfoJG2b+mJs8z/6dor+nbcQ==
X-Received: by 2002:adf:cc82:: with SMTP id p2mr29451315wrj.5.1632147602542;
 Mon, 20 Sep 2021 07:20:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] target/arm: Enforce that FPDSCR.LTPSIZE is 4 on inbound
 migration
Date: Mon, 20 Sep 2021 15:19:37 +0100
Message-Id: <20210920141947.5537-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Architecturally, for an M-profile CPU with the LOB feature the
LTPSIZE field in FPDSCR is always constant 4.  QEMU's implementation
enforces this everywhere, except that we don't check that it is true
in incoming migration data.

We're going to add come in gen_update_fp_context() which relies on
the "always 4" property.  Since this is TCG-only, we don't actually
need to be robust to bogus incoming migration data, and the effect of
it being wrong would be wrong code generation rather than a QEMU
crash; but if it did ever happen somehow it would be very difficult
to track down the cause.  Add a check so that we fail the inbound
migration if the FPDSCR.LTPSIZE value is incorrect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-3-peter.maydell@linaro.org
---
 target/arm/machine.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de8243..c74d8c3f4b3 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,19 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * TCG gen_update_fp_context() relies on the invariant that
+     * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
+     * forbid bogus incoming data with some other value.
+     */
+    if (arm_feature(env, ARM_FEATURE_M) && cpu_isar_feature(aa32_lob, cpu)) {
+        if (extract32(env->v7m.fpdscr[M_REG_NS],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
+            extract32(env->v7m.fpdscr[M_REG_S],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
+            return -1;
+        }
+    }
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.20.1


