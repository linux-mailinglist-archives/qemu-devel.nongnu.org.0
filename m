Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3069ECDC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexU-0007ht-QS; Tue, 21 Feb 2023 21:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexP-0007Zh-NS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexM-0001iL-Jy
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id c23so2379442pjo.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhxQ9e9pVV9RyCPmKQ2M0WUBfbr0akWOWFlqn9fFR48=;
 b=ElH/lQgU1lUWROxso2hhGUR7CpV70Htl3OQkwUrxntluMvqtXu1LEXdAgvT7zKyLRX
 /MlM1+ziqlBbBW/h+IEW81iHMA9xey0wm2VmmfS6puPIooLD8ntrnmBtwZpkYRlXO3Yt
 g4olycpluVe2VZBc7VJCVgq3NeEQ+mYsfQk8N8h2Y9HRGybbMgjlc1VKPd6PtTc8R+H2
 mX+hMFn+Q4qe6neYvl4w9bUKEm4RC4rzsFaoMAVM9xM0yh88dQa8zcL7dM00M1q7lrTG
 pZl3YIEAOflwR2kX/qchxoHxiYyg5McGWiBsEbn6yZLSA1pG7Rtn75drpf+VTxYvL1nx
 izHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhxQ9e9pVV9RyCPmKQ2M0WUBfbr0akWOWFlqn9fFR48=;
 b=RJMI9aPpgjCU+5gqPTFkAayHwlNKC5ArshN6MlCqKUbszp9M/5r1RmUrc6nx52QXos
 oTqPkl73Uo4knXYyuQkbKQO4p+yPZz/S3lIHUIa7qvRelou5QrE2CyK8lFyyyU8Jz/Lf
 6ZA6uMYGjdJJkyT/GN4NBg8/6NdfwGzwUCRXzGKIso2d/TJRy55CNlLYSIN/0viMGa0V
 HTvn92/5kw8LRGrLBrhOD8/UerPkOrA23G/qth5HVaGmimfDSI3/HUBqaNrcNwHVDKOQ
 mJcaFIRqcJ93RToqAB5Pk+F1lYAbt5YkJwkYRRyMruRLBaej7Pj8mtUn1WodN7EEzMSr
 N+Kw==
X-Gm-Message-State: AO0yUKWeLZcu2thdlXxylpNsd708joq4FPS7wQr4jpndcDoHoPjnCNRD
 lGNHzVgkv9COOHWeEFbKv9vFmDEClw0vnELB/Do=
X-Google-Smtp-Source: AK7set8d5hS4pvCS7C5xzLtUJ+at+eJxfQTeFT/w5wXNFojPqt+bmm9FWQBSeiQs6VMwSCQR5u9/JA==
X-Received: by 2002:a17:903:2345:b0:196:3feb:1f1e with SMTP id
 c5-20020a170903234500b001963feb1f1emr9489627plh.47.1677033247402; 
 Tue, 21 Feb 2023 18:34:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for stage2
Date: Tue, 21 Feb 2023 16:33:31 -1000
Message-Id: <20230222023336.915045-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6fa3d33a4e..7e1aa34d24 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,10 +37,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address, MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2859,12 +2855,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1


