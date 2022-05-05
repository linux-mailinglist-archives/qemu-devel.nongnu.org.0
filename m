Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2551C9A9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:53:26 +0200 (CEST)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhXR-0000po-6c
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYu-0003Ks-KC; Thu, 05 May 2022 14:50:53 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYt-0004Pb-3w; Thu, 05 May 2022 14:50:52 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so5080726fac.12; 
 Thu, 05 May 2022 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIkvIFum4rl4GYZMjv7mQoM6eVPSOn+G8IcVUodEjUI=;
 b=gPXyWQYeRPSnXpdH6Ew42k5tSc3BOimpq38VZTDUMk7qCTi8rbZsazSxMl6SYleJHm
 wLHslgbt5tzrVFu+dStV4yKcBJKPeABapkzawlnCJ7jRHamvHppASSXZKduz8wTMaSz6
 Bv9oOATrQZJ/8U1K+xW4V3KDBwWAAYKZKEhbzH2yqU9zcwVSEkrzAa7vNBa4CrRhYRU0
 8F0K0+vevB1GWTAhtujbXSp126WwSmlkJmQOWtZrkKYyKoyQ5Ug1tTlHk75Tn8bc37rI
 AD2Czw9HSdE6SBGr5L04QLMhmJNAvxfDWpsIEamWdgrB/K7pRtIZjBM0aEe+DwOV12p7
 dDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIkvIFum4rl4GYZMjv7mQoM6eVPSOn+G8IcVUodEjUI=;
 b=qa1dlq45weM0pqLtx4MP80nzl6/JThX0StF9VHj1K2NUOWg+OA4NCjbve1M8MEMyiV
 IzlnRBd3bAIbuYjzZ4KmjGe0EkJJsqFm0QIG0VgHa/gO3lxisbPae0b7ctg0DUwJGMFP
 8vbygr+WmXcZyslK4u8j+lYDgwVdVD45WTi7G87mhwDd/5eiW7yZfsOs0qhqrnzdwWTV
 Ju8Z1Za/Zn6yS9M4DrlRBsAhq8uyLWzoWnL7CyO20p2D6QvHse9cm+tkEqEdSQ5mbIpQ
 Anvb0lAxCaUP4QfxO0YpD1UzYjwsyF9lRvMKXwpAmbS8FaUonT8OhBW8RGPThjZXQJ0C
 xX6A==
X-Gm-Message-State: AOAM532SzuD1yBhp6tH+QmX0sMVLhqPrY/xVv8dcsk5S3iuMa5vdU+PI
 CdcyAtRJ+uVs5QYWrGpvXGezEX2ATN8=
X-Google-Smtp-Source: ABdhPJxJHDarlYcpKbke2etkri5ygj9Uo5hUzObBGgS9Mzv01ABCSekEFq4stGR1ZN180z10yT0rbw==
X-Received: by 2002:a05:6870:580e:b0:e2:7e06:e785 with SMTP id
 r14-20020a056870580e00b000e27e06e785mr3085964oap.38.1651776650058; 
 Thu, 05 May 2022 11:50:50 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 14/30] target/ppc: Remove msr_ile macro
Date: Thu,  5 May 2022 15:49:22 -0300
Message-Id: <20220505184938.351866-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_ile macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-7-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5abc612fe0..0d5a850794 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
@@ -477,7 +478,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
-#define msr_ile  ((env->msr >> MSR_ILE)  & 1)
 #define msr_ee   ((env->msr >> MSR_EE)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
@@ -2679,7 +2679,7 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
     } else if (pcc->lpcr_mask & LPCR_ILE) {
         ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
     } else {
-        ile = !!(msr_ile);
+        ile = FIELD_EX64(env->msr, MSR, ILE);
     }
 
     return ile;
-- 
2.32.0


