Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1E5366D3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:09:12 +0200 (CEST)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueOd-0006om-Bm
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM2-00030Z-5k
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLy-0001cb-Nr
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:28 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d22so4764405plr.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUTUBggiPUlwZ7WOApcqxGvEWawXcbJb2Pfw/Rgn2LA=;
 b=FD2Qmuk2Sb6HYzJEtJ4rF0eoLkN0CL/ThgGkXVh84pfpfmWJ/Nnr1S6G5plr3kfu5d
 9ia8V5qOuaPuSzA/mSmG7AdYG3V/64qWt09FqmT8aSArd0Ho6A0oHGSPOKxoD4Rw1Ip3
 cx5RRtaBeRKo2skHP4OOd1a7WOvHVuC6Mypy25sCVLPr/KrxEt+ReO4L9r0C/ASXYYR1
 CDfFDT35zpQjAH1yOzzE3JWdmqxQZg7YVwiQ/m4cYIEATp8DHhAxn9dvEKnneBb6yhGH
 c7CUpzK8cGluXLhpvsbrMbm8hN+qRPkDrBSi/voKIQMamVBkoE+hhoe15q4vAMeNQ6Vy
 kjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUTUBggiPUlwZ7WOApcqxGvEWawXcbJb2Pfw/Rgn2LA=;
 b=VgmkYnUBKb/mIAK25bM44a9vVw+PBXfKvMbw9M2LypqIFl0o9eJcl93BKlVypuStUL
 nlfJCEBCVIjMtJn1BIcWoOEcX+02YRlUYnhGoU7kb6vORpPWWVH239p8/VFA7yUbLVz3
 wIxc9h+4N04QB/y2yY67KxuWL2M2++dwS5JzaajXDCniEY2FUErxevpsnEMFBOvsdwwq
 E8G5fbAWezlx2m1pJScaKdUVR8JBjcTJxdO+7A82IBlNfbUV24skBeTjwkXotTNr+zHa
 Hr8kf4MjyFflvA9ZLPjvVlm90WegK3Ws3Z7Wn+4C0nqz0JgIHWf7cOD1Ei/QsudcbkUF
 m8vQ==
X-Gm-Message-State: AOAM532shNscC15xtEqXgjTXvpAkakZQYBE9twJ3CBuP2/X2i1ZdoZBF
 9yBpgb5TnzV9qisj3ERGWkOEU+4CPIZUHg==
X-Google-Smtp-Source: ABdhPJz1Cd0EPG5gtKRzdJZnGgcRRd8Jdn52iF15mRIzYcIiumHfONaf2uHvvQBLjK73tcHw3N2WGA==
X-Received: by 2002:a17:902:ecc6:b0:163:8bc7:16c5 with SMTP id
 a6-20020a170902ecc600b001638bc716c5mr6380657plh.75.1653674785313; 
 Fri, 27 May 2022 11:06:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/15] target/arm: Rename TBFLAG_A64 ZCR_LEN to SVE_LEN
Date: Fri, 27 May 2022 11:06:09 -0700
Message-Id: <20220527180623.185261-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

With SME, the vector length does not only come from ZCR_ELx.
Comment that this is either the SVE VL, or the Streaming SVE VL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/helper.c        | 2 +-
 target/arm/translate-a64.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5bc6382fce..69e71fdcec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3117,7 +3117,8 @@ FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
  */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
-FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
+/* The current vector length, either SVE VL or Streaming SVE VL. */
+FIELD(TBFLAG_A64, SVE_LEN, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5c875927cf..2a0399100e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13683,7 +13683,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, SVE_LEN, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc9344b015..09ac344d35 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,7 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
-    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->sve_len = (EX_TBFLAG_A64(tb_flags, SVE_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1


