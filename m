Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3A5FA034
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:30:36 +0200 (CEST)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtnf-0002pi-G1
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkn-0005mp-I8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkl-0005X6-Kv
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u10so17325081wrq.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qe4exUO+WkFuqHnH++UCTLDBzPC/VYNVu02G9HUS/c0=;
 b=tUByiwfMTjnYMmufMag/IbhCQ4h2CWAzS98gVPqcz+P/F9cBHP4+mLjDSHZuKHdoOH
 Yteq673MgYfIPXG4MD/wGsoaqfyhI7GnBhqAOQr0RKzrXG3fepnW3xg/qQxirZ49Ol/A
 YQrQEOwBi/FyP+0qQnOPbK2wBjHBUfWhH4/QqJClA2BKxUKVQitrB/wxgkuxAHG41v0h
 fR0dZO2N/z3BV013tNOvb3lbscxFlZshyZTVKw2U/IHAdg0c800UodI1o+d7sCVS2Pl1
 NA8wb/RPrNQeApQWGjr/r9eZ0c4MD35ATuJEAXGcpImDcrnyziZdOcX2tb6DN5X0eY+f
 H20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qe4exUO+WkFuqHnH++UCTLDBzPC/VYNVu02G9HUS/c0=;
 b=1heVz7uLX/HaC0rfgG1g8oSE6JMvjYAVz4njlZvph9ndJjjMtxJo4jMytnFWrBLQIg
 V25B1wi75HAWMx33d+fwKXbB5o1u1tg/FVLghGJQUDztJj07xzrbBXiXSgnaLBiBUA4v
 hw48UeZXIPT67TYXqQdyzulk92vhLqJzyGeAm7+3OV+4UZuBpmezwBftIfh0J5WtvERM
 sMUkpjYIvICfWJSQKMtuvwgnb6IALBGRgREBK5x9zGepUkOKFmjowu0k0RsVZb0196uc
 /yMGvu48scmtBakpMrM6rkcC4cYAgBJ9CfGq2svwR1g06UZfH/XtFdUopTRDjaztZDri
 aEBQ==
X-Gm-Message-State: ACrzQf1jler2JRS1vtdi6eIt+eORZqNWy5sHj4hHNTTu8Fhv/yFl6Ueu
 RGevqx0+ktJEHkvC3XtfmgRmKTPFnE4ltw==
X-Google-Smtp-Source: AMsMyM7fO5CIziXyZqYPw4mfF2VC0ors60bilRFAH5Wxn24Kch043f5uEsINzUyeqn97q5ip6j/pjQ==
X-Received: by 2002:adf:f011:0:b0:22e:4485:34c2 with SMTP id
 j17-20020adff011000000b0022e448534c2mr12484279wro.593.1665412053550; 
 Mon, 10 Oct 2022 07:27:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] target-arm queue
Date: Mon, 10 Oct 2022 15:27:02 +0100
Message-Id: <20221010142730.502083-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Hi; this is the latest target-arm queue; most of this is a refactoring
patchset from RTH for the arm page-table-walk emulation.

thanks
-- PMM

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221010

for you to fetch changes up to 915f62844cf62e428c7c178149b5ff1cbe129b07:

  docs/system/arm/emulation.rst: Report FEAT_GTG support (2022-10-10 14:52:25 +0100)

----------------------------------------------------------------
target-arm queue:
 * Retry KVM_CREATE_VM call if it fails EINTR
 * allow setting SCR_EL3.EnTP2 when FEAT_SME is implemented
 * docs/nuvoton: Update URL for images
 * refactoring of page table walk code
 * hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when booting Linux with EL3
 * Don't allow guest to use unimplemented granule sizes
 * Report FEAT_GTG support

----------------------------------------------------------------
Jerome Forissier (2):
      target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is implemented
      hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when booting Linux with EL3

Joel Stanley (1):
      docs/nuvoton: Update URL for images

Peter Maydell (4):
      target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
      target/arm: Don't allow guest to use unimplemented granule sizes
      target/arm: Use ARMGranuleSize in ARMVAParameters
      docs/system/arm/emulation.rst: Report FEAT_GTG support

Richard Henderson (21):
      target/arm: Split s2walk_secure from ipa_secure in get_phys_addr
      target/arm: Make the final stage1+2 write to secure be unconditional
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

 docs/system/arm/emulation.rst |   1 +
 docs/system/arm/nuvoton.rst   |   4 +-
 target/arm/cpu-param.h        |   2 +-
 target/arm/cpu.h              | 181 ++++++++------
 target/arm/internals.h        | 150 ++++++-----
 hw/arm/boot.c                 |   4 +
 target/arm/helper.c           | 332 ++++++++++++++----------
 target/arm/kvm.c              |   4 +-
 target/arm/m_helper.c         |  29 ++-
 target/arm/ptw.c              | 570 ++++++++++++++++++++++--------------------
 target/arm/tlb_helper.c       |   9 +-
 target/arm/translate-a64.c    |   8 -
 target/arm/translate.c        |   9 +-
 13 files changed, 717 insertions(+), 586 deletions(-)

