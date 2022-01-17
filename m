Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE9490A2B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:18:06 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Sph-0003ZY-L6
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9RvS-0006O7-Mn
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:19:59 -0500
Received: from [2a00:1450:4864:20::335] (port=43828
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9RvQ-0007df-TG
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:19:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so20485941wmj.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ9KKqaEP2pWRGu4npcv3vBer5ASXWKoR0TeN9Og9W8=;
 b=sZzssPpejYcyQb23751ShB+lsMLzHr1p0l2L8MvgXt6dHvV4M7T9aE0FEt2yEfQV49
 xGOe/U/yYJE+Tn4/uFHGJ+ib9Jgapuqlvms9Kn9JBtXG/uh87D2nxTBFJOLhM2kBKXo3
 wsBFSjo+AcwAv2wNBHP3IeCskKaDEbO8vUTWXVvkCESJmv6Ih5wll9ysMos5cTcYiiCm
 Z8N6l+A+w1YSC+OEtaMPRYcDtJqX4EMsydbLohnlQWpCULL25gCL1XjXHfOkO6Ws2Ms0
 kAoTwARQipe7k5fCr2isEv1UOKyzS+hSWc1nnm2LjXsmjRloVJjrHSINBJ7cxflGosQD
 Va+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ9KKqaEP2pWRGu4npcv3vBer5ASXWKoR0TeN9Og9W8=;
 b=gwm9UkD50L8rQLfxrPda6HdONKr5CD/78kcNtig8h/Zk6Ii4XAoetWcjZMynJhXXjU
 KXIw6uYkn0w+xSxwDO9rhEgxkpC9H6pJQ5mu/7cpqyLoKdt/kwh0wdUBJYXCS0UeUopM
 6RtIFoeS1AHZBWgVB9icW8UWZhTv+9c6C6rMhMcJUgOicqd28tMVLuPCDKwCH8jFRpZS
 zhz7gHbnJSZlujPGydHdyTdTQJr/wzch4uORxzksXCPx8L8V/kU1rbxYIQD807TH9rzQ
 PhIjdiDDFGbUsBF6P8qO2OCS4aiwcp3fP/ktXGEAz12XxbPS2zD3116NvMyctauEkR8m
 7zLg==
X-Gm-Message-State: AOAM531vMwrz/d1dsK/Dq+WeOS7T1GsgYPgn8myF9BSJt6rQeYa/uwj9
 CTMrxxwFBC56nxg8gJFQkZuQ+w==
X-Google-Smtp-Source: ABdhPJxZOXa7J09w8sHeQhS4DaMsiDzaHYdsnEBIYv75UTTk9z0BDA7X6fuVuEp1CwmugX43dRKn4A==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr18819879wrn.688.1642425595297; 
 Mon, 17 Jan 2022 05:19:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 204sm7096495wmc.29.2022.01.17.05.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:19:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct entrypoint for SVC taken from Hyp to
 Hyp
Date: Mon, 17 Jan 2022 13:19:53 +0000
Message-Id: <20220117131953.3936137-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6d..a898e400f6c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9655,7 +9655,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
      * separately here.
      *
      * The vector table entry used is always the 0x14 Hyp mode entry point,
-     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
+     * unless this is an UNDEF/SVC/HVC/abort taken from Hyp to Hyp.
      * The offset applied to the preferred return address is always zero
      * (see DDI0487C.a section G1.12.3).
      * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
@@ -9669,7 +9669,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
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


