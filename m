Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462259C644
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:31:27 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCCs-0006Iz-3R
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oj-0004f2-2O
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oe-0001ba-4p
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:27 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x23so10240752pll.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=GP2UHDeqVxGGLUq+DQ0rv8QWikrXA3M84uvtu5h5jcN9Rq27Ret1xxxCYCsGmfYM1z
 HmJCmxyU0d+/c8gDhbRrm4BlnOR2YsdqTW4Taz2Ha6Y6e4NoqIa/nunD3mQWaQMCXf++
 T1CRNhbq3mVZPFSGaAK7kh1Lm0xntsxldY1tmzurA7gOoYFR7npvApfscIoGDjWxGLnW
 pkHl2KerNDJNGtN1dYP+9nRknQa774glW1omwoIvQafkOnE+Ik2eX3JiRcrF1e9PVVjB
 DU1cuyq9i3EI72bLNR/PG0sdQg5+fLw8CEuIJ36Ur/WXwvDyt+Uy1oCQQZO/bU43oDGz
 MMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=xo23dnxOzePU1Ep3Wq17JsOWEvxJA8Duhh9AWdiGTJzqFQjROzazj+TkNe8PsJrTzx
 HLxLMmRQLqxlRRah+z+OBlDz7/LNapGI1e6Vh6d7Bl1KMql+ENoMrDb55AeNFhibV9v9
 FCSVba6yv+heDAK9rMGDIQbrETy90iMU60jw0iliQStqEu8czPvsUJpswB1Yci+sCfv4
 lY1Fjw88hpW4GEyp1SHnYAfij3WosVuK1RHU0TNvSS1u5MdJGSvn0fWX/nwltKntzd7A
 y6y0AsdePeW7wLMcm4QFrfdmC4TUP6FeTGET0xJQdaP7y2veNPdK9D3XiJ2Kk7oY1mYm
 +bjw==
X-Gm-Message-State: ACgBeo0Qh8hzpwr4peL4+wKrB8M6jP/+glB5ae0ESnaAeRVt/CLKwIb3
 Jt6pux15AP76iwB2Ko+yT0LJN3LAQeBpPg==
X-Google-Smtp-Source: AA6agR7U2B91Sd55eclKiL/4GUMq+yYTPi0I8B9Jiod+CobAewHLT50FB2INac4YYOa8zRdBmpzpVA==
X-Received: by 2002:a17:902:c086:b0:172:c7cd:bab0 with SMTP id
 j6-20020a170902c08600b00172c7cdbab0mr14512682pld.60.1661182282774; 
 Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 44/66] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 22 Aug 2022 08:27:19 -0700
Message-Id: <20220822152741.1617527-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
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

Copy attrs and sharability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  | 8 ++++++++
 target/arm/tlb_helper.c | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac..118ca0e5c0 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,14 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and sharability fields from the page table entry.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA  \
+     uint8_t pte_attrs;           \
+     uint8_t shareability;
+
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 49601394ec..353edbeb1d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
+        res.f.pte_attrs = res.cacheattrs.attrs;
+        res.f.shareability = res.cacheattrs.shareability;
+
         tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
-- 
2.34.1


