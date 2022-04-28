Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42553513849
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:26:58 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk62h-0007Ji-Cw
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5KA-0005iO-Kw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K8-0006WD-2U
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id e24so7062874wrc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bpK+CDLhNe+DkiGyDtqKW6TKeAWT7FZyMCm45BF78Q0=;
 b=GVtZXPoYHZh4KaImG2zmcJ1VaLaem1y3qXogflld5GTxMz3f2wuYPFL9rhvOFQ9KsE
 XJE3WJeVRqCrywpyEGXCiya4PtCAuWrI19WwpZ1ZsgEcF/glx7sclcMiR01uhjbo0Txo
 ubw9+u2V8jnfW2Pq+EbVWUTnLP/FC9TQ6DSFx/MRVV6ASBhCEqAlXZ84Fj7GNiFEGC3F
 3yN1LoNsgdzdSC6Egea5xid9x7pQGNo8T6AvuFielgaA1wObOmSYtve9t465CGMw7rhN
 jyh+drhUgSZ3JlZMwvPbetoMzEpbDM0etnptq7e+tH5QJrx0fWlo1KjbwHM3d+BJEE5w
 Bt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpK+CDLhNe+DkiGyDtqKW6TKeAWT7FZyMCm45BF78Q0=;
 b=TvRFaT2/ulEK/8a070t9QPmswpleTPVDoPm6nAv92WNnXtQs2gHIQxd4hMRAIuPhU7
 0ovWirs0q0Wn1mG1uPVyblQkHsu6d7fFK6OvSJUHjhKTaGeQu2UJWjLSmDOby62rune3
 HUG8p4iosQ7Z+P4upnNLQ7q9olJh5ruHrUsd2L7xxrCBKlS/hFlPympABKzMi6nkbZ7/
 qtkFOlfEojHRGyy1bvopQfi/0fHovksDmif4jaocX0ne/XHvsL3TwB0Zvc2QHur1KUeM
 9Q3Tewo2XL1Jg9rfz6yycdKPeDv9bxs0NZEwnXtnXZLcXnCxBGszuQ8QA5L1s7jZsA4e
 M9uA==
X-Gm-Message-State: AOAM532b0sv8cv/JC9m+0JWjUSqrFyphxTk7vfItSINhu+rCPnNNl0ML
 px5xOO4uroP6uq+rmnoxET87/8Gh5J9hyw==
X-Google-Smtp-Source: ABdhPJxHEJS5W/Ffhee/4NrvmcbiY1nWY+ovmO2ZOpywUaTfss/5ObAv+Y41X24PHiNmXJKN6NyZbg==
X-Received: by 2002:a05:6000:1863:b0:20a:f4f9:a6a with SMTP id
 d3-20020a056000186300b0020af4f90a6amr4132139wri.619.1651156850752; 
 Thu, 28 Apr 2022 07:40:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/54] target/arm: Advertise support for FEAT_BBM level 2
Date: Thu, 28 Apr 2022 15:39:57 +0100
Message-Id: <20220428143958.2451229-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The description in the Arm ARM of the requirements of FEAT_BBM is
admirably clear on the guarantees it provides software, but slightly
more obscure on what that means for implementations.  The description
of the equivalent SMMU feature in the SMMU specification (IHI0070D.b
section 3.21.1) is perhaps a bit more detailed and includes some
example valid implementation choices. (The SMMU version of this
feature is slightly tighter than the CPU version: the CPU is permitted
to raise TLB Conflict aborts in some situations that the SMMU may
not. This doesn't matter for QEMU because we don't want to do TLB
Conflict aborts anyway.)

The informal summary of FEAT_BBM is that it is about permitting an OS
to switch a range of memory between "covered by a huge page" and
"covered by a sequence of normal pages" without having to engage in
the 'break-before-make' dance that has traditionally been
necessary. The 'break-before-make' sequence is:

 * replace the old translation table entry with an invalid entry
 * execute a DSB insn
 * execute a broadcast TLB invalidate insn
 * execute a DSB insn
 * write the new translation table entry
 * execute a DSB insn

The point of this is to ensure that no TLB can simultaneously contain
TLB entries for the old and the new entry, which would traditionally
be UNPREDICTABLE (allowing the CPU to generate a TLB Conflict fault
or to use a random mishmash of values from the old and the new
entry).  FEAT_BBM level 2 says "for the specific case where the only
thing that changed is the size of the block, the TLB is guaranteed
not to do weird things even if there are multiple entries for an
address", which means that software can now do:

 * replace old translation table entry with new entry
 * DSB
 * broadcast TLB invalidate
 * DSB

As the SMMU spec notes, valid ways to do this include:

 * if there are multiple entries in the TLB for an address,
   choose one of them and use it, ignoring the others
 * if there are multiple entries in the TLB for an address,
   throw them all out and do a page table walk to get a new one

QEMU's page table walk implementation for Arm CPUs already meets the
requirements for FEAT_BBM level 2. When we cache an entry in our TCG
TLB, we do so only for the specific (non-huge) page that the address
is in, and there is no way for the TLB data structure to ever have
more than one TLB entry for that page. (We handle huge pages only in
that we track what part of the address space is covered by huge pages
so that a TLB invalidate operation for an address in a huge page
results in an invalidation of the whole TLB.) We ignore the Contiguous
bit in page table entries, so we don't have to do anything for the
parts of FEAT_BBM that deal with changis to the Contiguous bit.

FEAT_BBM level 2 also requires that the nT bit in block descriptors
must be ignored; since commit 39a1fd25287f5dece5 we do this.

It's therefore safe for QEMU to advertise FEAT_BBM level 2 by
setting ID_AA64MMFR2_EL1.BBM to 2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220426160422.2353158-3-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6ed2417f6fc..c3bd0676a87 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -9,6 +9,7 @@ the following architecture extensions:
 - FEAT_AA32HPD (AArch32 hierarchical permission disables)
 - FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
 - FEAT_AES (AESD and AESE instructions)
+- FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ec2d159163f..2974cbc0d35 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -840,6 +840,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
+    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1


