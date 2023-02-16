Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98656699AD7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnR-000095-Dk; Thu, 16 Feb 2023 12:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnO-0008Sv-Ag
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnM-0007wh-Lh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so2510469wrb.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RdFlF/b3VYR2fecwChpgN5HOR7iNVGAod5mHzESL9uI=;
 b=znvZml3ZjylSoN2v8dvO4Z/GkBv12CdVnUKtc5oZbcxyDATpA4eQZLXMydqOyKo5X/
 VU/Pgm34HSphHIb/zrgCyvk12HSm+osqNVheBCNqXE9Z3bqdS+8+1CfrGgzV87tPvSCH
 GgthlS+n9xOZNXUVfOpjnZveBp7qb8nhttzn8ooAw8+03wrOFSl87McXki1SdBZJPjEG
 3ZPMOAcdb6+z0mz+Dn5wdATsAGSb1D4Q6eBFGjG1kk/dt7j587ayXTXBJiOvmp87TOpm
 sAD+0f7/aZC7hmO7oIuhGA4OqpRfdoKn7LJl8q1joUeN2jxF922m4nnMAIwHLOFITHlU
 LKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdFlF/b3VYR2fecwChpgN5HOR7iNVGAod5mHzESL9uI=;
 b=wW2lb16x6Az2x1ceoclSSpczF2r9wOUtDAbxbPoY0tT076lKJPfcQ0A5PkTB3m5AgC
 8xlPw+p0L20qeR5g067qIJBh0jZTDXSnQgBkhLCXjlG7gJgRL394Nqa6AeAE/yRxEuo2
 S3WQFNcnPhgTKbyDujnBjO9ga2bOnsmFiFDXyytCa3KydHOBE5PS5fdBm2rp/8Fh1SsJ
 ieuAOaPs9KDJE36I1YIlYYOnlrCIZ1I9XJEWXxcccITsVwfLBRBWmey5Qegyz/HMYsLv
 wfJ/9uUM8X3buLPib2LtOpS8rbl+2cuA8frnA63+7q4WySRMBoVV73XOi8P7Q116zxgM
 /KJQ==
X-Gm-Message-State: AO0yUKXE5X+Aui5fUHiCWZfOtYv0f5RUTZWa5y13MS2rK8hasgP8DPDJ
 mPal1heRqwMxVfWspU70rCby2fSdxzo+cXaX
X-Google-Smtp-Source: AK7set91lhvxG/dDP+QRSzdfS7CjUHIuIo9OTjjE9p3ghnpbmJfYA8I9r61AU7DqvXUcN74n+k5aCg==
X-Received: by 2002:adf:e64e:0:b0:2c5:5847:7374 with SMTP id
 b14-20020adfe64e000000b002c558477374mr5619107wrn.67.1676567503412; 
 Thu, 16 Feb 2023 09:11:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Date: Thu, 16 Feb 2023 17:11:14 +0000
Message-Id: <20230216171123.2518285-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22670c20c00..509e674b0f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11014,7 +11014,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -11076,7 +11076,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      */
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
+        tcg_handle_semihosting(cs);
         return;
     }
 #endif
-- 
2.34.1


