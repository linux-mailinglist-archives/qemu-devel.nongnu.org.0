Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6859C5BD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:08:08 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBqJ-0002IA-BJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004lV-LB
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:46 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0001fF-PE
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id w13so4603559pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FF+VbrmmZnxZ1wObhTbkrmTqMO4Rm6Z3tRZAxl2tAjA=;
 b=cmHx8rF2008OR9gqQz/utMFSfT8tvZ+l6m2k/U3Vban8t/aaqHkJUvdPCJEGCGA2Cr
 7P8k/kkfjMlsFSbH3Y1/z3MLMalfLC1ebgAdrbsiFuGRP1DWk+ZiCON44lymu52rxVaN
 w4TgtQdD4Mz5zo84i9vTzRbeL1TVWGuNYZfJMMCipJZcyo7dp8OoIKzp8hkQxDjfEahP
 UwsSn5rd2lGQDG9GW5yyt7pt1ZRIp+iSNZDWAuyM/GugDgVBu0U7HSG7UV28/xpj86uJ
 RS87nD6cbHCRrBw5tbg/pz0YxTrRNazPaHMuhy0NyEVq75cg0R0UJU3gdrqOalg+bpev
 rt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FF+VbrmmZnxZ1wObhTbkrmTqMO4Rm6Z3tRZAxl2tAjA=;
 b=TRkE0fgb4Gop0TDLoBxb8tXPcx/WLIZzzoZ5MO4vuYbGMaiJKNq/NsHP+OFlhCdlci
 v9cC7q4Z5Y8j0NS1y0E6E54wrnM4hcK0EP5cmV/l2wSBpbzKA109FxXdfVrvJ25WKpRB
 mkBvXozcsKokGe64zAJVZHcwBUpFBWxpfUnjMQHdx8VVxF2c5P8PsIy8fpAc1QPpXiLO
 Vy6SeCs57Bkh58B2jn1WaTBE0086DNOZ1Y/XykWPAOfR+HS3o7FbG+AHMPpk5GM7Mtwm
 gnFRsqfRsh3rhNtOMoquSPf4TU2W5jrkrJy3ALc1H79SQoX64e6mEZg9qZOyZBw17ttZ
 fNeg==
X-Gm-Message-State: ACgBeo01d8K1ixKKmj5dOaSI2IWsLzNRZDbvGxHNUVNk9MWv5zzKAr3c
 JTPAaOoqjgFYaMYTvW71l7tNBcR37lmA0A==
X-Google-Smtp-Source: AA6agR7xxDsvvFFJU14S1l8/S6yNcF6fXPqXv8sd0y2AFz09I/Aje+cJSAEI1tHGXGlRWRmaNI3i8w==
X-Received: by 2002:a05:6a00:804:b0:52f:43f9:b634 with SMTP id
 m4-20020a056a00080400b0052f43f9b634mr21450290pfk.62.1661182290529; 
 Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 54/66] target/arm: Only use ARMMMUIdx_Stage1* for two-stage
 translation
Date: Mon, 22 Aug 2022 08:27:29 -0700
Message-Id: <20220822152741.1617527-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

If stage2 is disabled, we do not need to adjust mmu_idx.
Below, we'll use get_phys_addr_lpae and not recurse.
Adjust regime_is_user so that it can be used for E10_0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 46f5178692..9366066ae0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -90,6 +90,7 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
@@ -99,10 +100,6 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
     }
 }
 
@@ -2534,10 +2531,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
-        /*
-         * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-         */
-        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1


