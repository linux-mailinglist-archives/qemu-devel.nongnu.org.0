Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632D66A979
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 06:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGZNa-00074D-8K; Sat, 14 Jan 2023 00:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGZMr-0006ul-Nj
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 00:46:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGZMp-0007Cd-5P
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 00:46:12 -0500
Received: by mail-pf1-x433.google.com with SMTP id w2so2195777pfc.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 21:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/mbN3+megQV7wMPAFNHtDNlxBkE+G0lgdWOpxoeUgDU=;
 b=q35kCQri3o488D5jXlgQ6NmxmM8zaDgQ/DuNHNtc7P66YwxA84AnuvJw+H9ac3zOul
 QjWhXlulcyS/veOEDUWK9VMTxdBNnVY979hUcb2YI772NNznWM6Z2JQ/666yi/LIyZ/L
 imuwjk4LTuEHDQxD3Fij/hh81E0t8kJaonw1aB+FllXUMHAdOnGQ+D+E3Qb7EloUzoOG
 erUmwj+t60tKlmzoDmLwy6aTZWV4qvONn7iAqax/WuYuA5QcwQMCCCbTg6/n0OUuFjtu
 HK6H8L2CatpLvx9IdVLuvXyR8UhXgUFu1efBPrnV6Si/DJtNgoTHCuiaNjvzpf2COMec
 t/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/mbN3+megQV7wMPAFNHtDNlxBkE+G0lgdWOpxoeUgDU=;
 b=1fWq5790HlOm6SPCSd8/MIoePZjg9JCNLgGlhS/3Z6Kt7jH2u0hqX/1WoisZBuIEPD
 6+oT987xRXswqnnizR0ziE0br+s+b7pq3gE4Ah8yCnaUkVNRiav1dqzChCw7tahw3yau
 xbA0rxqtIsbijfAcGjYYuDKHHihrjmsmRvteAisajbXdao/h+1dPdMXZs0ZzGIJyNe5W
 AQ5IXPIKIeLo0T6cr3axIvnuft5ZMc0eTJ1iSpehUse2YYupMZEhOtfh2v6zkjR6kQ4M
 ixh2L1OlIBqhdFk97QykTh+ryGAtgqsDkO/Grl2/wJxnB+/T9ORcjkMP1To5hfumzAUR
 tZNQ==
X-Gm-Message-State: AFqh2krkVBY8jrX+bxv5Wgnk/EJ6knJ+baKE29PdCWz2WoIFAToR1PMk
 zhgGLLHjVvzdaTpqpSFceT3ZX4/X+YJ06Ms9
X-Google-Smtp-Source: AMrXdXvfMoPPfrWK4S9bSCw7DBJLigmzznb14bI7rRV5s2g4uReGJAvNhUK1Kn1cPLK+NrdbmP+cIg==
X-Received: by 2002:aa7:8209:0:b0:581:3328:b468 with SMTP id
 k9-20020aa78209000000b005813328b468mr61413716pfi.6.1673675169464; 
 Fri, 13 Jan 2023 21:46:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79611000000b00575b6d7c458sm2883310pfg.21.2023.01.13.21.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 21:46:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix in_debug path in S1_ptw_translate
Date: Fri, 13 Jan 2023 19:46:05 -1000
Message-Id: <20230114054605.2977022-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

During the conversion, the test against get_phys_addr_lpae got inverted,
meaning that successful translations went to the 'failed' label.

Cc: qemu-stable@nongnu.org
Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..57f3615a66 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -238,8 +238,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             };
             GetPhysAddrResult s2 = { };
 
-            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                    false, &s2, fi)) {
+            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                   false, &s2, fi)) {
                 goto fail;
             }
             ptw->out_phys = s2.f.phys_addr;
-- 
2.34.1


