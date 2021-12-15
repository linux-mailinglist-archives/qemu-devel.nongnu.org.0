Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B04757D5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:35:22 +0100 (CET)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSZ7-0006wt-HA
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:35:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRid-00073S-FA
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:07 -0500
Received: from [2a00:1450:4864:20::435] (port=42992
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiY-0008Rr-RY
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:07 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so37353338wrd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tLNa3rIPfRwl8m/eEZTAjhUMYzfnAvACuXtMQvvgIj0=;
 b=Ey2eAYmO/iAHeBAImw1yeZiEGIhxnCdS8gxid9CBpQ4npDvhXhuwcjbEzgixXVktrX
 k8dnJ47X7gxR7gxMgIapaj9ioNIKdrUSdYnaDF0gUaN9VlB3iLBO+Of0k/3cpnwJixJg
 7frqLEOSpnHpkeeD7NXaNLbUaLxNnSeo8ql1w4bU7lpPp+wdFmY4Rbi2veXnOju3yiGB
 9e4wuQmVOnTN+tdw3CK+YloWhihhjl3hmQgxb05MXxrz9A1DKA463NVQxaYizL6G0xHt
 +kHHTzw8JeGuVrSSR83FBZ34CPZnITxuJlzit2VE+ae2VeWF4JK3f2cr1dbzMnc2CQwz
 riFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLNa3rIPfRwl8m/eEZTAjhUMYzfnAvACuXtMQvvgIj0=;
 b=kh15rubNlHxiBveVSTz6iENkMTrgxWALa/zUadqk/TKO/TLr2Kv4dN/YsyHk/8sOJX
 63YFC8SphZdyirNDS+JB1UBr6H8rH03Pnrm5bXxaydsMcH7c5MJtLyesjmIp6gjE7fwv
 FifUfkDThxSv4guSPHYIIZDjKN9ia6T2kUIHmvJ2TzPv5ngXAhG3updeWvXCLArxdxoG
 vjzqRWDnpwnGXldQJd3c7lsnejt1q/yvcB9QmEqw2eVJZKnlpx9VJ+LveaF04cY/lxbd
 tkYN3dFBVDbYp5XqwWsvJmahK/8NMbZY1TRVXbe1z2nm6AcVGEWc/jvlk44+I2NttogL
 JCig==
X-Gm-Message-State: AOAM5326hx0AQnt/J6bJ5rj4/pfD0kd7dfRvBvaoK8OymcgNS/9Grmqi
 zmLlHrKbw9C5wMUnJ+VKIef6jGxgIx/Dmg==
X-Google-Smtp-Source: ABdhPJxDcleqcAThbqxSEmkhDIX1u+p/Kz6vFlVquvWHO0HGZaAMsyCTnsb1JZLf3M+npLbSmXen2g==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr3898533wrv.115.1639564860547; 
 Wed, 15 Dec 2021 02:41:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] target/arm: Suppress bp for exceptions with more priority
Date: Wed, 15 Dec 2021 10:40:33 +0000
Message-Id: <20211215104049.2030475-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2983e36dd33..32f3caec238 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -220,6 +220,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    target_ulong pc;
     int n;
 
     /*
@@ -231,6 +232,28 @@ bool arm_debug_check_breakpoint(CPUState *cs)
         return false;
     }
 
+    /*
+     * Single-step exceptions have priority over breakpoint exceptions.
+     * If single-step state is active-pending, suppress the bp.
+     */
+    if (arm_singlestep_active(env) && !(env->pstate & PSTATE_SS)) {
+        return false;
+    }
+
+    /*
+     * PC alignment faults have priority over breakpoint exceptions.
+     */
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
+        return false;
+    }
+
+    /*
+     * Instruction aborts have priority over breakpoint exceptions.
+     * TODO: We would need to look up the page for PC and verify that
+     * it is present and executable.
+     */
+
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
-- 
2.25.1


