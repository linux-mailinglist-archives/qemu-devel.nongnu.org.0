Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59D4DBE29
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:22:12 +0100 (CET)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiaR-0001Lm-QX
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKx-0001N5-Bt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:11 -0400
Received: from [2607:f8b0:4864:20::435] (port=46849
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKv-0002Hs-Rr
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id s11so5848336pfu.13
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1c7FByY8RueDOU9kVxB+CSgBA4nxhG+Xofet2o37MpM=;
 b=I+JIv442p5jaHL4TAGlwZlm+2mqrWXMiSqfB/uw49ArZX5+jt0OehgMMSLAnBn2LWn
 Op8nRfKPwXcDLfK9AKI/LuOvr7F04eZTABzEqLwyXKdCw8ElnmPT+Cro3xxcniwReuO4
 Yp22YVcufsLZ6WYSIwd/Kmgu0zaUIxPAUChYynEoOGi1PdTUf4rFpFQVd4S7o+yHTted
 U0+6zwx8sX5+30ap5LkH1V1TQmc9PP4eM/qrUZGz/3Mb4nClCdEG1/DHuHJzUIWiP4wU
 wp97BC0lddj/LY9nG2VITEGG3z+77ZRH3nw/be3p744uCxj4ReiReM/bi2XRyGhvCFE2
 FEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1c7FByY8RueDOU9kVxB+CSgBA4nxhG+Xofet2o37MpM=;
 b=QcvyFlheV+GuX7g4PHDcYAHubI0+Z623Qv44vmTbsbb9pmtcDNI3AQ55LMLrMlZywD
 Htol6L79HgQ3smf1uOWHd9f5wwyPfIn25cI9ot1HT7kRWBsI2dJg8B8VoyX3bCEwaj0l
 ZmdEEvJ2vy5usB7YYwoL3eY+DHjnM2WncUWfMhhwZfcPNfJEYU7xYQR5df6Os+sRzYVh
 PhRr0ePiutRoSyYNUDpqfCaNSMrW1aqb6J+AEk/cFfR+iH1wu77+5w3owPNGcniEaWkb
 VqK2F3hHrOYb5WLaZVudwrQOza0WQhUmNZvA7htUt3O3nLYNiwz69cfUlO3KlRcPF99+
 9EkQ==
X-Gm-Message-State: AOAM531qq1IY1a6Uc3+KvrnUEbgbC+nAQj4Mdm1RFyy0iLof/TW2hltL
 FDj73DSnd/UMNJeQWjcTi564t5CBKs5IYQ==
X-Google-Smtp-Source: ABdhPJzCozEcK/+CHIe95Ag9QOYvOgefrxPQBoK0N2xIOtJcSb3bbKhLezkC6xT+L70CoDTtsD8Q8Q==
X-Received: by 2002:a63:9307:0:b0:373:a700:beaa with SMTP id
 b7-20020a639307000000b00373a700beaamr2335461pge.260.1647493568617; 
 Wed, 16 Mar 2022 22:06:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 29/51] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Wed, 16 Mar 2022 22:05:16 -0700
Message-Id: <20220317050538.924111-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 410e76ccbb..161f8efe82 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -177,8 +177,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUArchState {
     uint32_t regs[NUM_GP_REGS];
     uint32_t ctrl[NUM_CR_REGS];
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9fc4fa7725..e041aa41d0 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.25.1


