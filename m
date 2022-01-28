Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9649FD2A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:54:44 +0100 (CET)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTaF-0007TH-LT
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDG-0002BC-TO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:59 -0500
Received: from [2a00:1450:4864:20::330] (port=56155
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD9-0006RS-Vs
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id r7so4663927wmq.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fRHZFbTPE9xEcVHdaUtARyBl4Hsz+piH6aYCgikS9YI=;
 b=NadRFUSHS9fifjj64sye69XI+DZW2TGDfqWiAYi0IQzxsTjGzRH+nJGfwXulHNbb6F
 MXKIyIxzXuOJ5lNI8P59dGC4gqb8rwSklkFpJ54zq0Ep6ZCpB3bJoVFtPBvOKKWlcAV3
 3yN6Q7G11NemsnALedRkzQ7nSLO3qXSWka0TQNYZonQsrpnD8XA4Vdlv5t2HmTdOfr+d
 121qa1+muJfQSHVtT6z5+sFW01GXA3TLFhUhDhcyP15rB3r1m1thzn/pTzhUxXZf4CiH
 o47KF8dDtjWjpgx3M5/0YXT2m8C2y8bZtIbMZlYORLCrIuRR0AAmfBBpF5vQ1k7bXEsp
 hmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRHZFbTPE9xEcVHdaUtARyBl4Hsz+piH6aYCgikS9YI=;
 b=M0Y01emNT8TwKbjN5dw3Xq1p1qeHR2BkshQD91LtIGeKxHjWcyB+XnlTURS2xjuO0i
 GfHnMMp2IIQMnzA4nDHs246EIeDwoN5YqOvY36oBtWXtVHsnu5YYsumTWmdTtQcuWDqj
 JOizHx4nc6ZwURE9kAlBuZqXpMyfLo/rL5pDeHHUq1o5op2L6GWsQuZtX9XPXoNvdrl9
 a+TY1AGWX+plNS9dMAPL+Gd5hgEUjADlEkntQWHbjRAHiQkMLAQfj9jzeweGehZnQe4N
 1jtfgq12nGbCRbschxI/SyqVEniS2wBuSpYmkfdwSwqqZMtakVL/WxByaO2PDADNh7L1
 /WNg==
X-Gm-Message-State: AOAM531qd+luzGxh9kT59hm8bi+IqriMnVWZkdVktnZ1D9bDoP3gEikc
 cjqZS3TXA9NISZZYF5ztReviQBpya5jHYQ==
X-Google-Smtp-Source: ABdhPJzlxIauCod12p1N5E86ZX5h7XwCiZW4gRpXhOFt1KmdRqjFW6Ddd3u412M7H4RXchott28uuw==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr16268887wmc.177.1643383843101; 
 Fri, 28 Jan 2022 07:30:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/32] target/arm: Use correct entrypoint for SVC taken from
 Hyp to Hyp
Date: Fri, 28 Jan 2022 15:30:09 +0000
Message-Id: <20220128153009.2467560-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The exception caused by an SVC instruction may be taken to AArch32
Hyp mode for two reasons:
 * HCR.TGE indicates that exceptions from EL0 should trap to EL2
 * we were already in Hyp mode

The entrypoint in the vector table to be used differs in these two
cases: for an exception routed to Hyp mode from EL0, we enter at the
common 0x14 "hyp trap" entrypoint.  For SVC from Hyp mode to Hyp
mode, we enter at the 0x08 (svc/hvc trap) entrypoint.
In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException.

QEMU incorrectly routed both of these exceptions to the 0x14
entrypoint.  Correct the entrypoint for SVC from Hyp to Hyp by making
use of the existing logic which handles "normal entrypoint for
Hyp-to-Hyp, otherwise 0x14" for traps like UNDEF and data/prefetch
aborts (reproduced here since it's outside the visible context
in the diff for this commit):

    if (arm_current_el(env) != 2 && addr < 0x14) {
        addr = 0x14;
    }

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220117131953.3936137-1-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4df12394021..6dd241fbef3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9658,7 +9658,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
      * separately here.
      *
      * The vector table entry used is always the 0x14 Hyp mode entry point,
-     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
+     * unless this is an UNDEF/SVC/HVC/abort taken from Hyp to Hyp.
      * The offset applied to the preferred return address is always zero
      * (see DDI0487C.a section G1.12.3).
      * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
@@ -9672,7 +9672,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
         addr = 0x04;
         break;
     case EXCP_SWI:
-        addr = 0x14;
+        addr = 0x08;
         break;
     case EXCP_BKPT:
         /* Fall through to prefetch abort.  */
-- 
2.25.1


