Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3E3B0989
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:51:06 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvig5-0007nF-Ne
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvida-00051t-Eh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidU-0005Hy-CW
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:30 -0400
Received: by mail-pg1-x532.google.com with SMTP id y14so5985851pgs.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyACFkGX+AoOo24zZ8c++sg0FmDfffCQNskIwq7OASc=;
 b=MjfDn5b0vjwmpoKtHkmAUmDVxZ9/siV5BWqBoJFT5UoArkHlgZWfOVzS7wS+AOFKfZ
 jE6srbbKAWanR+Shkr30AcnSg8FfkD0GcEBq7QQkz7leqgpmA2FcwT0NfxzBrwbdrPdq
 981QwANs5P8fnJh9EfHHWnDDjU1Q0Ss0gJrm/VAfW2qIfTkrQiIrBvfLeO0sjE2NSG5+
 pMr00RiwbFDQph4lNrcWC/S2L5tI5FMe+1mO2Zh/r2mJWZK09NK+FGGbJJuVpObK3cdT
 EMdh7f77yWfdHejC2FNB573tC+hf6sqxBha5HpjFdVj+RbqYcJ97MsZQPR7lIB5cxUIB
 Vj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyACFkGX+AoOo24zZ8c++sg0FmDfffCQNskIwq7OASc=;
 b=bNFmpEL45DLUutfh+hVxTk7rwq+D3FlgF+ByOM1cpW5MGBH9FtiQy5Z4Gbs4pvxJfe
 xvPfduYTBx6Dfn6CLZHM4mfQE4FuWuQKSDbSkNUJLLL77xITC9BiKjmPAlzXEWAkeI2Y
 84VAPTChYn+yHb1Va57feVcn28Pfm+q7+dc1cCHAvMtA1mdCRqsvOyzMIVRlXh2Tf2Qp
 JHTvoF3P394SsPNml26Thg7YWWtwB26dhd4DlsjtUxpELKBDD6Y2Kh2VrCFTFa7CP0dq
 16pyf8Q6NveMtjvaib5pTZRZg8+TQBnaN4SP1M5ZviLpPW7s8oJmIeY0PbkyVRr42X99
 0ecQ==
X-Gm-Message-State: AOAM53141J9lOVqKiV3Cqe/vxYVbf+OOLjAit9OzdC6gXFyLvgdPStim
 q00AKXkrcocyZH7w05aLon+xue4oE/F0pA==
X-Google-Smtp-Source: ABdhPJxI/XXFCmCJCCzuKoHEBWIyh26/V+Ih0zQ8SooKOTkWdszEmgNlkFIWL9nZ1fQUmkAZ1kmjTg==
X-Received: by 2002:a65:5248:: with SMTP id q8mr4348564pgp.176.1624376903123; 
 Tue, 22 Jun 2021 08:48:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] target/cris: Remove DISAS_SWI
Date: Tue, 22 Jun 2021 08:48:07 -0700
Message-Id: <20210622154820.1978982-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index bed7a7ed10..8c1bad9564 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -56,7 +56,6 @@
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 #define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
-#define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3310,7 +3309,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_SWI:
         case DISAS_TB_JUMP:
             /* nothing more to generate */
             break;
-- 
2.25.1


