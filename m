Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BF562366
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:47:35 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o708R-00060u-5l
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702f-00031s-6K
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:33 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702X-0005hI-Rl
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so250897wmi.0
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NJ/AhFBVNeKie2SLbn7FmgaDpmNEtGrcl/kxe6zssvA=;
 b=wOlu/j7LCwBjJhUVYAwscycupj2WyrMC1iLuHQupuN1in9zolJ51yj0XeOBzScV2Rt
 pD/cJcx4n2tEfUv8ZQxtOXW93zp53z+PG7iMU2pQTY4oakmOvTDoGncT16RN7EDFz6Hz
 p8nHO4YqFWYn9+MFiaN1BmLydZS2VhfS/d+yGnSjUf5lqlTeH7TwV4XXdaDH3GB6643v
 OzaDumip/e+cRG0wepEKrQLJQWLn7RQk0C3smFVPMFL///Pen6l5zQJucapBsEbCmYjk
 L+muIspoJY1dL0LdnUkESfGlblzvbY5LCy0VQtsgcSNaEOHyBi0P2Fpu+6PK5IbiuKEU
 RQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJ/AhFBVNeKie2SLbn7FmgaDpmNEtGrcl/kxe6zssvA=;
 b=kiqHim9grDk8UZiCtdJqDkGfGUcQqoxRxB2/2beWxwcc1BiFUYgZyfYg6NohVDzGVq
 p2M0ezyw2xdw9AaB9XYIlzX8NFp7Bh7Th49rkSoJYOQr7mVo0fq1WdSCebm2AOpyTNfW
 D5F8wuviopmUh0icEclHqTbafsgDaOOP+xdDBzJfQJEDLOPwzOYxk/rO2YcRuRu8TsU+
 R10ytR+lsB9AtZSHvX+HhWylNM1dVronmfyRhVQdmYOSXpBTV2+vtjhZSUzOaDcVEkwB
 l5CQmX4TgfrEeDvpJpEOp5NAMWYcYL+CuhzojAoleklu++nrUHaR+X6T4EPUhNAYVw1U
 4qMg==
X-Gm-Message-State: AJIora/7qMCO+63qwKD5FqyZuXNki3obK3SEO6S4TJXWZjF+bv2bJNqz
 iRT0MNczuErLxP1wTvs1jmoHSA==
X-Google-Smtp-Source: AGRyM1tl/25kuqW++acKDDgJOC2L6soFrLGygc9EkKAT+VMZ5gEo/cmRWzVz32pI/sLKRuQFjJdEHw==
X-Received: by 2002:a05:600c:601c:b0:3a0:4cd9:ed46 with SMTP id
 az28-20020a05600c601c00b003a04cd9ed46mr14023558wmb.139.1656618084502; 
 Thu, 30 Jun 2022 12:41:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm13200228wrr.108.2022.06.30.12.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:41:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/arm: Suppress debug exceptions when OS Lock set
Date: Thu, 30 Jun 2022 20:41:14 +0100
Message-Id: <20220630194116.3438513-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630194116.3438513-1-peter.maydell@linaro.org>
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

The "OS Lock" in the Arm debug architecture is a way for software
to suppress debug exceptions while it is trying to power down
a CPU and save the state of the breakpoint and watchpoint
registers. In QEMU we implemented the support for writing
the OS Lock bit via OSLAR_EL1 and reading it via OSLSR_EL1,
but didn't implement the actual behaviour.

The required behaviour with the OS Lock set is:
 * debug exceptions (apart from BKPT insns) are suppressed
 * some MDSCR_EL1 bits allow write access to the corresponding
   EDSCR external debug status register that they shadow
   (we can ignore this because we don't implement external debug)
 * similarly with the OSECCR_EL1 which shadows the EDECCR
   (but we don't implement OSECCR_EL1 anyway)

Implement the missing behaviour of suppressing debug
exceptions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 9a78c1db966..691b9b74c4a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -142,6 +142,9 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
+    if (env->cp15.oslsr_el1 & 1) {
+        return false;
+    }
     if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
-- 
2.25.1


