Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86E55BE4C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:57:19 +0200 (CEST)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Hq-0004y4-IA
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kR-0002om-C2
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kO-0003vl-Fs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q18so9948866pld.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=Y2x5BqQuJUT7L7s9ZfBDTQkmSgsAXZkm0wo8r3elruj8sASAQSfwJlOyyOTvuyHWGG
 mHpnenItkofw/LO/xc6LvPlI9DZGkuh6I4os/uQQIRWgjlCN68C283qlf1O1e1Ov1z/B
 nLR+d/uL5FX8hnHcfqn4NH4FwcFqjdGH8dbFmsKIuJkcQDxtHHsNB2ay7dVHjqfamQg2
 Xc5u5J960qp4HOg5F+YD6vvjzidBW1KoUG1203tDSXQgMBj5+zsncu1YXIvGTXO/6ZJ6
 tUYav39LszqtUc0NAVNO0M9Pb1b3Z23It7cyMn6yvGR2z6ic2Cn10iFW0ILTGNO+Dr0q
 M2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=iWucglytDtaH6Q3gsfuwip/QqT3h97Zm73AS1q182uFA3FK5YCbDwXX/QWNRKDnI3m
 r+rmULyMI3WxK0b8FpSWO1z4WLGB58uiMyFN0LRvmdBFFfoGrrohhXZBiT2pgV0jDAW2
 fVXqrou0MMrm7hqcVblSf/hiAomZpe3cwU1bOsGqdS3FXqXMTPiQ39d95/uCuAwE89ez
 RHZaW47dIcqX2r8CH7gTadvtACR32MWqRxfCALsRIGlIcmETOLqwZwpAoWT5QObFNoeH
 /nF7lOjdygwG+2UzRCDtpRJGbMziHMv8vok7ouZaP8e6RY077Q07oz0QUfydnptttoHX
 h70A==
X-Gm-Message-State: AJIora/O3R3EpRVP00tXa3Kbi5d+gQGm+39zbbXojDcmEqkvv1OFvutp
 f8z4dSsPZ38NTRc9AQP1go+e8ptt1Fkumw==
X-Google-Smtp-Source: AGRyM1vZZvdaIZeY3u8hhmCa4pwAaC+jWNUrxS+YMCPX8/A4vQZiFUSIwh03VMctNsqga3fie6ZA7Q==
X-Received: by 2002:a17:90b:4b42:b0:1ed:f6f:ff2 with SMTP id
 mi2-20020a17090b4b4200b001ed0f6f0ff2mr25916066pjb.131.1656390161288; 
 Mon, 27 Jun 2022 21:22:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Tue, 28 Jun 2022 09:51:05 +0530
Message-Id: <20220628042117.368549-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1


