Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A665F1D8F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:26:44 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefK6-0003YN-Uq
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGw-0006G1-Q8
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:26 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGu-0006DD-W2
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:26 -0400
Received: by mail-qv1-xf29.google.com with SMTP id i12so4674080qvs.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Er5K/gOH+d/N4ssCZVhWDhoM4cqR3r9KMS8eFuyse0Q=;
 b=lCPyYEL5K6odvYQOgsoBaTyenSBxueEilywtMqlFcRnXAdwRD2TyBg8enE+15i0wqh
 5v2ABcpgT4Z3EslIiGg2Z/3VbNRyRPzbhQCTlfv5kH2be+S3xBnfG3YLme7hGiBRXfUl
 N0d3YM+8SYdvoVCuIXRX646GcE8OhtAdRUIX9jx3g2+q6BZc0RX8eqi8rGNV3/4SYLdv
 2iCCyu8Jyn9C98rsItVo+tQWC9d1tpMIshxI1MSDeY8CFilTbrlzzJmptlHvRZksNkOj
 yVVtlVfawWQxi3nR2ln29QRhxHdJsl4+Qv/koZd+2NGS1risnH+4DPtGGSgSUF4yc7Ep
 x3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Er5K/gOH+d/N4ssCZVhWDhoM4cqR3r9KMS8eFuyse0Q=;
 b=RgAxKcGichrgJxH1NbEwdN679soZQ1kngeaxwk2ugBZrYwL87q/GrdRdQA03WS50H/
 JRw1rvUNkNSuMUDhUdIDHJGwCpzyBLFymjXzabU+v2B0D/w34nr+u5KtqN9GtmGmquoW
 KlXQvDnIr236HHMJW3dBkAhkDj+2zv0WTYTLU6L3h36Oz4TOmNIoSO87f36GtVl8BT/t
 NCMsfxlh4sTvOEmJNUu4lgEdRylBe4Mfdw+KGLsf3bEGpiwiV+izK8Ca92cxusA5p5Wn
 OmKB+ApLgOriQqS5mZSgmQM/FRMCKHKSLXsDq/4gQdLIJsp2vXOAkQlCOGITgKkq0Ad3
 /Veg==
X-Gm-Message-State: ACrzQf1TzxABMMnkZRYrod0lDxZeqrlxPErv+Jfj6qXGsk57TjNDvrEh
 s2Oixfu2eVYxh6RSg/jWXMAnxZCXL1DsQg==
X-Google-Smtp-Source: AMsMyM5htokTlo+r2Cz81G0N5jTQ+Fq+igNYiGgCbZRhJKiVRk6Jbcnv2zblT3pEtwkQ5TTNY/8C8A==
X-Received: by 2002:a05:6214:4110:b0:4af:b016:5ff8 with SMTP id
 kc16-20020a056214411000b004afb0165ff8mr10166197qvb.118.1664641403795; 
 Sat, 01 Oct 2022 09:23:23 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/42] target/arm: Implement FEAT_HAFDBS
Date: Sat,  1 Oct 2022 09:22:36 -0700
Message-Id: <20221001162318.153420-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a major reorg to arm page table walking.  While the result
here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
(HAFDBS), the ultimate goal is the Realm Management Extension (RME).
RME "recommends" that HAFDBS be implemented (I_CSLWZ).

For HAFDBS, being able to find a host pointer for the ram that
backs a given page table entry is required in order to perform the
atomic update to that PTE.  The easiest way to find a host pointer
is to use the existing softtlb mechanism.  Thus all of the page
table walkers have been adjusted to take an mmu_idx that corresponds
to the regime in which the page table is stored.  In some cases,
this is a new "physical" mmu_idx that has a permanent 1-1 mapping.

For RME, "physical" addresses also have page permissions, coming
from the Root realm Granule Protection Table, which can be thought
of as a third stage page table lookup.  So eventually the new
Secure and Nonsecure physical mmu indexes will joined by
Realm and Root physical mmu indexes, and all of them will take
the new Granule Page Table into account.

Previously, we had A-profile allocate separate mmu_idx for secure
vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
when SCR_EL3.NS is changed.  I did not see how we could reasonably
add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
Trusted Firmware, at the code paths used to change between Secure
and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
to keep them live at the same time within qemu.

Changes for v3:
  * 20-odd patches upstreamed.
  * Changes to the base CPUTLBEntryFull patch set, propogated.
  * Queries via arm_cpu_get_phys_page_attrs_debug, i.e. gdbstub,
    do not use the softmmu tlb, and so do not modify cpu state.


r~


Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")


Richard Henderson (42):
  target/arm: Split s2walk_secure from ipa_secure in get_phys_addr
  target/arm: Add is_secure parameter to get_phys_addr_lpae
  target/arm: Fix S2 disabled check in S1_ptw_translate
  target/arm: Add is_secure parameter to regime_translation_disabled
  target/arm: Split out get_phys_addr_with_secure
  target/arm: Add is_secure parameter to v7m_read_half_insn
  target/arm: Add TBFLAG_M32.SECURE
  target/arm: Merge regime_is_secure into get_phys_addr
  target/arm: Add is_secure parameter to do_ats_write
  target/arm: Fold secure and non-secure a-profile mmu indexes
  target/arm: Reorg regime_translation_disabled
  target/arm: Drop secure check for HCR.TGE vs SCTLR_EL1.M
  target/arm: Introduce arm_hcr_el2_eff_secstate
  target/arm: Hoist read of *is_secure in S1_ptw_translate
  target/arm: Remove env argument from combined_attrs_fwb
  target/arm: Pass HCR to attribute subroutines.
  target/arm: Fix ATS12NSO* from S PL1
  target/arm: Split out get_phys_addr_disabled
  target/arm: Fix cacheattr in get_phys_addr_disabled
  target/arm: Use tlb_set_page_full
  target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
  target/arm: Use probe_access_full for MTE
  target/arm: Use probe_access_full for BTI
  target/arm: Add ARMMMUIdx_Phys_{S,NS}
  target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
  target/arm: Plumb debug into S1_ptw_translate
  target/arm: Use softmmu tlbs for page table walking
  target/arm: Split out get_phys_addr_twostage
  target/arm: Use bool consistently for get_phys_addr subroutines
  target/arm: Add ptw_idx argument to S1_ptw_translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Split out S1TranslateResult type
  target/arm: Move be test for regime into S1TranslateResult
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Implement FEAT_HAFDBS
  target/arm: Use the max page size in a 2-stage ptw

 docs/system/arm/emulation.rst  |    1 +
 target/arm/cpu-param.h         |   10 +-
 target/arm/cpu.h               |  143 ++--
 target/arm/internals.h         |  125 ++-
 target/arm/sve_ldst_internal.h |    1 +
 target/arm/cpu64.c             |    1 +
 target/arm/helper.c            |  200 +++--
 target/arm/m_helper.c          |   29 +-
 target/arm/mte_helper.c        |   61 +-
 target/arm/ptw.c               | 1315 ++++++++++++++++++++------------
 target/arm/sve_helper.c        |   54 +-
 target/arm/tlb_helper.c        |   31 +-
 target/arm/translate-a64.c     |   30 +-
 target/arm/translate.c         |    9 +-
 14 files changed, 1113 insertions(+), 897 deletions(-)

-- 
2.34.1


