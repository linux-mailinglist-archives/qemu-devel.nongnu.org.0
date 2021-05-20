Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F263938AFB5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:10:31 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiRa-0000yo-Qw
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiQN-0007og-Dl
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:09:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiQI-0001cm-AM
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:09:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso2663024wmc.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7gjzzaVXa0Sy8IMXM97M+gM0f0kAcQs0lDAVE2RbtsU=;
 b=Iy2l+jH13H23q1stoAEo+wEqU4UKP+VtGOPCGoCP39WK4THr1fTKMF4EOetjla12kH
 pFnqIYo5Xq/Y+2oJd0AhmpFL1ZJgtlztcLGomR8EPIoWZjIJkIzZ/orbaoKyeOcV4pq3
 2Paamwj029N8S8WhGlqm2jS6THaFPSFSrZgZrae6CxNl9lXTfLx97Do/nw07hLqRJQB+
 6tnFbT2G0dwEFs5UXfevp1PM6NEnPPHv9/W3NsKG09tSDOwsx8Uv6i24Y/DfvnNt7mWU
 zOVCfbQSRcfi6CDVeSJbQVxT/ZaJ14/2alh/B4o0PAqB7OFVOMwlF31ZTXTfaQIJVB4C
 Z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7gjzzaVXa0Sy8IMXM97M+gM0f0kAcQs0lDAVE2RbtsU=;
 b=mtH4+JIiLwz0HWYzhGSCVfoSsGRTfymAuvxllblhO5Yoyk4483ipCTuEvkHlSIwbLp
 fmczWmUxB68zvz327+VnQIA9gMzfZhIgnTnSg8zzA4EMzTzWckhJX/v5wWBy5KDUGGnA
 ywxrfKnRFzQM+AgzFDOZcAWZ3ZKQqRxtizQ7VfiJ0IQiVOH4g7XqwSRIwoIa6Xysia6+
 SXDn6EO6KwDFUQxDCVIM5HS0/BY0CXNuCkyWYenK4wv0WNvoNVyuzhZlk2PGoIVnn6cl
 pD6+XhUOL2nYECSLQRGxJjyt0uOBShAHofhYAi2E4OMyuqO/1cgiDFdtupxadC9nDzkE
 7Rxg==
X-Gm-Message-State: AOAM5321/01dKLBondLjklnysaMP/LXiCfsUrRVJVtEjT1CF6FZ5G16m
 06PwtOi7U97NuSPlqb/yYjGbtw==
X-Google-Smtp-Source: ABdhPJw54ynmXtwfkmdRrKDWXNWiCtkfAi1qTnwVS2ejPksreCwWMBFEJMN0s+iisdp1BamZvd08cw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3604376wmq.138.1621516148684; 
 Thu, 20 May 2021 06:09:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g10sm3351951wrq.12.2021.05.20.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 06:09:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct SP in M-profile exception return
Date: Thu, 20 May 2021 14:09:05 +0100
Message-Id: <20210520130905.2049-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When an M-profile CPU is restoring registers from the stack on
exception return, the stack pointer to use is determined based on
bits in the magic exception return type value.  We were not getting
this logic entirely correct.

Whether we use one of the Secure stack pointers or one of the
Non-Secure stack pointers depends on the EXCRET.S bit.  However,
whether we use the MSP or the PSP then depends on the SPSEL bit in
either the CONTROL_S or CONTROL_NS register.  We were incorrectly
selecting MSP vs PSP based on the EXCRET.SPSEL bit.

(In the pseudocode this is in the PopStack() function, which calls
LookUpSp_with_security_mode() which in turn looks at the relevant
CONTROL.SPSEL bit.)

The buggy behaviour wasn't noticeable in most cases, because we write
EXCRET.SPSEL to the CONTROL.SPSEL bit for the S/NS register selected
by EXCRET.ES, so we only do the wrong thing when EXCRET.S and
EXCRET.ES are different.  This will happen when secure code takes a
secure exception, which then tail-chains to a non-secure exception
which finally returns to the original secure code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This was noticed by the Arm TF-M folks, who have a pending change
to their code which will run into the situation we mishandle.
---
 target/arm/m_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index d63ae465e1e..eda74e55450 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1597,10 +1597,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * We use this limited C variable scope so we don't accidentally
          * use 'frame_sp_p' after we do something that makes it invalid.
          */
+        bool spsel = env->v7m.control[return_to_secure] & R_V7M_CONTROL_SPSEL_MASK;
         uint32_t *frame_sp_p = get_v7m_sp_ptr(env,
                                               return_to_secure,
                                               !return_to_handler,
-                                              return_to_sp_process);
+                                              spsel);
         uint32_t frameptr = *frame_sp_p;
         bool pop_ok = true;
         ARMMMUIdx mmu_idx;
-- 
2.20.1


