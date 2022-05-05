Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7CC51C94B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:35:32 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhG7-0003QJ-9n
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYj-0003BW-0f; Thu, 05 May 2022 14:50:41 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYh-0004Zp-8v; Thu, 05 May 2022 14:50:40 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e5e433d66dso5097986fac.5; 
 Thu, 05 May 2022 11:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCQbTAwfBVgkKdJs2uamHplhph1davWJR6r0xIJa4WQ=;
 b=Hq3JEBdj8DXxbSnayXd5lJZJDjbiQQU8dgxTiFbWSudGPY0WxnOgqh84vHljtNSMVa
 Gx0G4A2Mdl3sarZ038y0TPk5U/tkup2CxIxr5q63TKTM7maC9hpkNUGOoBDA7f7VhN7M
 MtyXbkBInFq0PZIfIvROtlT/gP0SS12tiqbs3o0f7asy5PkBOvBTbDY2mEMsxJVg6Mre
 8vsXf8FYHA6tCzzbSSdUXC1OjyZzzOwTsE/G+Iuil6Ie80zuDwWsGEF94dMa6I0NYXtM
 MhYgZMG2OxU3hjHapWRd1En+rcxex6nQ5kJOCb0DSBgvDOouZNjXUtS3la5IN+G0096/
 wLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCQbTAwfBVgkKdJs2uamHplhph1davWJR6r0xIJa4WQ=;
 b=pStih7park7syN4NyQ4UgP0UujPTmeuHbqOYlbmaArpIxsWNW73cEgPCoJ/6IRrf3T
 VANrMIclJP9SfVT+abXuSeDfN14Hs6FTszPcVUtLGUR2OckjuM7jQzRtL1EutM1ZdS0V
 oH6eO3x8fcbgUzTfZkHh9DgPLuq9ITHscO1/SmXuliSdtNZr8H7BpuKR1fWF1kj8Nbp2
 W2ohTA8XuJckYOgmozuFmFt2Uhqug0stgWyBmJw2SdzU4dAjHfHl0UVbHOR6+lP3WDIi
 oWnT5PZusbNVTUnSYSa1dfPOs+Pt/WLtbArWkQ3iMaEfv9iwU6LWE835JLyh7P/O7MgO
 Osew==
X-Gm-Message-State: AOAM531TyfzG+U58KZVuceOlEZpF+a3P++8j4TtOx4LEjeFUSnyG1dBE
 nFyPXqI8FBpifFOGUota8yQuH5kCoXw=
X-Google-Smtp-Source: ABdhPJx3qJU1oyxTIxK+mSITuHStPcloVbODkovELf+aRtP1xDVUV2J3kk7NfK32oLLcMhsRXj6Syg==
X-Received: by 2002:a05:6870:c186:b0:e9:5f39:85b1 with SMTP id
 h6-20020a056870c18600b000e95f3985b1mr3041944oad.144.1651776637794; 
 Thu, 05 May 2022 11:50:37 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 10/30] target/ppc: Remove unused msr_* macros
Date: Thu,  5 May 2022 15:49:18 -0300
Message-Id: <20220505184938.351866-11-danielhb413@gmail.com>
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

Some msr_* macros are not used anywhere. Remove them as part of
the work to remove all hidden usage of *env.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220504210541.115256-3-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ad31e51d69..112b456220 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -463,23 +463,14 @@ typedef enum {
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#define msr_sf   ((env->msr >> MSR_SF)   & 1)
-#define msr_isf  ((env->msr >> MSR_ISF)  & 1)
 #if defined(TARGET_PPC64)
 #define msr_hv   ((env->msr >> MSR_HV)   & 1)
 #else
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_icm  ((env->msr >> MSR_ICM)  & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
-#define msr_ucle ((env->msr >> MSR_UCLE) & 1)
-#define msr_vr   ((env->msr >> MSR_VR)   & 1)
-#define msr_spe  ((env->msr >> MSR_SPE)  & 1)
-#define msr_vsx  ((env->msr >> MSR_VSX)  & 1)
-#define msr_key  ((env->msr >> MSR_KEY)  & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
-#define msr_tgpr ((env->msr >> MSR_TGPR) & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
 #define msr_ile  ((env->msr >> MSR_ILE)  & 1)
 #define msr_ee   ((env->msr >> MSR_EE)   & 1)
@@ -487,25 +478,14 @@ typedef enum {
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
-#define msr_se   ((env->msr >> MSR_SE)   & 1)
-#define msr_dwe  ((env->msr >> MSR_DWE)  & 1)
-#define msr_uble ((env->msr >> MSR_UBLE) & 1)
-#define msr_be   ((env->msr >> MSR_BE)   & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
-#define msr_al   ((env->msr >> MSR_AL)   & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
-#define msr_is   ((env->msr >> MSR_IS)   & 1)
 #define msr_ds   ((env->msr >> MSR_DS)   & 1)
-#define msr_pe   ((env->msr >> MSR_PE)   & 1)
-#define msr_px   ((env->msr >> MSR_PX)   & 1)
-#define msr_pmm  ((env->msr >> MSR_PMM)  & 1)
-#define msr_ri   ((env->msr >> MSR_RI)   & 1)
 #define msr_le   ((env->msr >> MSR_LE)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
-#define msr_tm   ((env->msr >> MSR_TM)   & 1)
 
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
-- 
2.32.0


