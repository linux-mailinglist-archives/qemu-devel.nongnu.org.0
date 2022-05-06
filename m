Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C969551DEC8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:11:12 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2Q2-0000n8-4w
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I7-0005Um-J6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:59 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I5-0003rr-Ex
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:59 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so5411865ote.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=zuRChkffAAnJEbWXGmEPNva4T2icaZo3AiJflLEEAs7zu0rWzGERylXz3unj54Hqyi
 93WmOOc0cTi3kXMyiHT0rp1k5RkuwHdHNkzQ1hWoh697PBiMbcWJOTmdjdeOdxAbAWzz
 iSJNtlejJmGcFySg8EIpaDXrCo4NHwoyC6/ViQj/XXghENjBMIORR9+BA+u8PYu+dVX0
 bBkhoQzSmiw3nH70s5RENB7RLF77c4Te1RiRR6kQd3eOMJiWXR0L5o7UuMtqgpCouvs1
 IR9lU3G4R4gdAwlpW3fp5+TGh35+i60B6LLYagym+PF6rYnyWPEDgjv7rsxIZPy6Ukdu
 1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=PDHiKG0eKz7LB8Wm95ZIV1GvSPuFDbn6gi7cp6iPuheWaqZ49cBEJ+k88QPOzgzRmR
 h3r/FGTNoEtD0/fSghFUk+pYidyUXLRDwLE7h0GnRg7S7qITONv64ESikNsXwQmBjYJs
 whWMI1DUUO9649LWtFZa5iXd79x1o4vjlvZYQyux45ljXLk1v+4H1NlhPJYyv6r2PPW0
 cqzjA4yOZQDOB9zKaOm05LQKnZLAjuAxisGt3OBoTncTFSjiEf2SED+b0qG2fz30kqAH
 pBCjehLSXDBSO3FAeh3GxeQwBC1TboAGAT3NRCqNbLmmHTwiAAg9c3pTFq1tzZqwi7hN
 DWeQ==
X-Gm-Message-State: AOAM530qESvqMrfZY/ZC8SFujFYAnc4SU84RJlDnnTzZiuhqpWuNkb2T
 +/eU9tM/nk6a2rWfPI2pW3EQlMVH4aSGtH/t
X-Google-Smtp-Source: ABdhPJyhw1TAdzD0rBV+oifLcEgFtR6OzovfxgnRfCdlGOSU2OoLbyg//kgazw63Y/hzxmVA5LX2XA==
X-Received: by 2002:a05:6830:2f3:b0:605:f29f:502c with SMTP id
 r19-20020a05683002f300b00605f29f502cmr1461363ote.24.1651860176362; 
 Fri, 06 May 2022 11:02:56 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 07/24] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Fri,  6 May 2022 13:02:25 -0500
Message-Id: <20220506180242.216785-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1


