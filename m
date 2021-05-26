Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A301739138F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:22:35 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpkI-0008Q1-OB
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpeg-0007ie-EB; Wed, 26 May 2021 05:16:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpee-0003vE-Ik; Wed, 26 May 2021 05:16:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t193so434832pgb.4;
 Wed, 26 May 2021 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kOHAbEzZ0rp5rLYGoHSACEChJTJyO3dBSHm5NkBx8ME=;
 b=oV15o0Vxbtr+ejH0E/9Q3EI9pP19GYY3zdTT3VeBMhlo3bwo8SWsZDNXZNs/5gmyeV
 PI9GP+HYGfLX0WZM0SHLntr6O61H2+BOVTKjhPBI6rSsEykh/Du3mHbV/3AbQiE4r383
 qi1IrwJloVBaeQgQgsN5xWvqljktKMFfUVcdmK60vchOqD2ajDBM5MRfcFSUgmoiu+VS
 AVJp8eYmIKNPAPukObHG9rPMANeQ/X02g/fmsGLRi3HOVH2nqOW6j9lcZIOakThtVVDv
 uF/PAeBmlBDHU4eUun5Gj/5+ktMOsTxs1IzxQirUZI0M4kb2BIxjoL65MbkhWgvg4NuK
 CKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kOHAbEzZ0rp5rLYGoHSACEChJTJyO3dBSHm5NkBx8ME=;
 b=rDU4y2LlFKpqTTwS8ntu8P0EBqhH5CkUOUu/ZuVD+ZGkTrX91w0xTbLUpLAL//9IpU
 mQaOyB37gm0zGQo9ojriItmFv2Y0DhfyKWodJIHYbfYWUJkm8JY8ir1eyTGXZV1EyOh4
 DJdUffcKROpniVEKeYeGzjq/8oLs2DhdIdRX/VE3f7nl7Xi2it8KPFz8iublouspioT6
 p2cYGJFFWE5hJzgpEJWNMhOj9fkB40orqNqUKjlrKdh2s3vRLzeUB80VlHUE86DVbBXh
 f75fqr1N/fbjf8cB9suacs5SDIgS9ZsDKY8IcmrmWHKAagxgx5Chp61zNjmlaMDebNS3
 WbJg==
X-Gm-Message-State: AOAM5322xQLAWu6EZmFfhIU73Sx5vzTnG9Lgr8DfV+jwSimVsnsoYue4
 3/v6jBF+pBQ6ujNDsIFDXuphnHL5JWDMQw==
X-Google-Smtp-Source: ABdhPJwoHOpJJvzymGWkmiLDjzYo/6g6fNI+V0sD82AnIpFVFlJq1VaO6EsQgg4SODyZRwqGEpZ8nA==
X-Received: by 2002:a62:b40c:0:b029:2de:4a1e:a753 with SMTP id
 h12-20020a62b40c0000b02902de4a1ea753mr34253657pfn.64.1622020602788; 
 Wed, 26 May 2021 02:16:42 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id h22sm15055171pfn.55.2021.05.26.02.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:16:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 2/3] spapr: Set LPCR to current AIL mode when starting a
 new CPU
Date: Wed, 26 May 2021 19:16:25 +1000
Message-Id: <20210526091626.3388262-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210526091626.3388262-1-npiggin@gmail.com>
References: <20210526091626.3388262-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG does not keep track of AIL mode in a central place, it's based on
the current LPCR[AIL] bits. Synchronize the new CPU's LPCR to the
current LPCR in rtas_start_cpu(), similarly to the way the ILE bit is
synchronized.

Open-code the ILE setting as well now that the caller's LPCR is
available directly, there is no need for the indirection.

Without this, under both TCG and KVM, adding a POWER8/9/10 class CPU
with a new core ID after a modern Linux has booted results in the new
CPU's LPCR missing the LPCR[AIL]=0b11 setting that the other CPUs have.
This can cause crashes and unexpected behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_rtas.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 63d96955c0..b476382ae6 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -132,8 +132,8 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     target_ulong id, start, r3;
     PowerPCCPU *newcpu;
     CPUPPCState *env;
-    PowerPCCPUClass *pcc;
     target_ulong lpcr;
+    target_ulong caller_lpcr;
 
     if (nargs != 3 || nret != 1) {
         rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
@@ -152,7 +152,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     }
 
     env = &newcpu->env;
-    pcc = POWERPC_CPU_GET_CLASS(newcpu);
 
     if (!CPU(newcpu)->halted) {
         rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
@@ -164,10 +163,15 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
     hreg_compute_hflags(env);
 
+    caller_lpcr = callcpu->env.spr[SPR_LPCR];
     lpcr = env->spr[SPR_LPCR];
-    if (!pcc->interrupts_big_endian(callcpu)) {
-        lpcr |= LPCR_ILE;
-    }
+
+    /* Set ILE the same way */
+    lpcr = (lpcr & ~LPCR_ILE) | (caller_lpcr & LPCR_ILE);
+
+    /* Set AIL the same way */
+    lpcr = (lpcr & ~LPCR_AIL) | (caller_lpcr & LPCR_AIL);
+
     if (env->mmu_model == POWERPC_MMU_3_00) {
         /*
          * New cpus are expected to start in the same radix/hash mode
-- 
2.23.0


