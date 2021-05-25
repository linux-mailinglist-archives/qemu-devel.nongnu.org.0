Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387973904C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:13:02 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYjs-0006A0-Oy
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYar-0001lS-BF
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYap-00045u-9u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x8so32600899wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N54AOgtuynAe4o4KVPvsfs8DcF31nKce6XRNZJjbLbs=;
 b=eFoXtRXMwg33ccw7+8GFfb14zApGHG1l13ZTGbgXl1bMDB9A9GoBjiQJ3bpWIhB5bT
 AwsagP9lW0Gq/vcFi9Ew+DTH7xSlE3+8QOTKFebrhDloOglfutDbsNr7Rqcx85GgfsSt
 UifVQEFSJZqXY9MxLyo0JeIbNY2WDgMz6xORwNovp+Nfm+UasjNYffMc7NtbVUJYdfiZ
 AUVMC3ySUsnmpZ2P+30QMNGq9tPUUhFEaFBlZgOMhJs2q2OMNDRCvf71Xbl9wYGipgAT
 Tfgd1BQ/ezAdNnHK9kqRsVwcVWf/RSjLonRTYKPkT3PmG3tPmCz9udRhMRWbW5iie9Da
 lLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N54AOgtuynAe4o4KVPvsfs8DcF31nKce6XRNZJjbLbs=;
 b=rmTZqbqTwbQ39fhblpPeczds3vT3u27E9Ufqce8eYsL2Ctgr7keMmr8xuH2jIx99c1
 or+f9WIp9429t1pXPjG6RkLvAahQ9bC/k/jyZTlKElS8JbBFLqixfz+PkLGPQW8pAY8p
 pXnkavsIYGrCPUD+4nQVEA+eDFElO3m5lPtvLaKJrjqR5crlHtwtvpNnrCvSJ4yYOX5m
 T8J3VEogTFnFmO/p6iVuHUEAXf+sBKeriVoIgQV30Efe1i6kqxWEZu2U4idNmsU2tj+F
 5nrLd6Bt527O78MkRx0rX03jZgbRfWi7nEWzL8n/OZ+pWkEODaTwXUu6scA8t/CL+0aB
 l9KA==
X-Gm-Message-State: AOAM532LyMmNLZ2hWM81LWAPPl1kVdLZEf9uvute9VqS6pbyct+zBOdx
 xDfEtqHvHj5dkzvDXiVuHyMDB9uqtq9fLpXT
X-Google-Smtp-Source: ABdhPJy300vkCndd7QCgD46/1IEW5NgyS57+s22WlZ29HGMI/ZEDvclJbaRYaA+AycYexhsg0C+0zA==
X-Received: by 2002:a5d:414d:: with SMTP id c13mr27657452wrq.240.1621955017724; 
 Tue, 25 May 2021 08:03:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 009/114] target/arm: Use correct SP in M-profile exception
 return
Date: Tue, 25 May 2021 16:01:39 +0100
Message-Id: <20210525150324.32370-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520130905.2049-1-peter.maydell@linaro.org
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


