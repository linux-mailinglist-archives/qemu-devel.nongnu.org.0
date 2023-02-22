Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF569ECF9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUex2-0007Da-8x; Tue, 21 Feb 2023 21:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewy-0007C4-3R
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:44 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewv-0001XJ-EJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:43 -0500
Received: by mail-pl1-x643.google.com with SMTP id e5so8270792plg.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nw++n+vjilR+k0Cfryt+0j1Zm09nTbqymOcGAUWx/EE=;
 b=s6aUvgH9Z7+Gjkgfw3EWUu7uVViVnXSWDLx7XECLzF754aKyUy4TJz8zlhvArQzazF
 AqK8azqzG+SNOczQiK/hbiCO+YX9CtOCei7FlEIG4ISMHQhPDgmUGzBsjdcARk6KYjho
 zoSInM8VvltqMRY6WhHGkpmH7bqCdsTWFDKeTB6QXmL+jKcOPNPLKCOYQhj08jsQFFWT
 llVzftRE5Z86VabsQVFoqCaTbr0ZN9eMg6FNvhU4laTMHX7Y8zfL/14CmkfWfPwzoqgW
 dRNXKdGRhens0mPkI0lLE80fyJCyURdjo/Klejbl+Q3+uD+tM4G8do5sXdR+GbiXmSlZ
 I4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nw++n+vjilR+k0Cfryt+0j1Zm09nTbqymOcGAUWx/EE=;
 b=Iv0frF6HqVxciYyGGXPIwOZr3ZN+ONOYu7H8dK4LCDRJsrszjxUt8IOg5mN7f2JTNY
 g04VzIdqdLQGHlwopTR/SUUVFdFeLON8tyFtSWyLLUu7WBB7TMqJHzSBhvLXAW+8KTeI
 zqgKSihr8dptOGx1zK/c1gi8HJ16g5Y8BXEn7wR/HMSb8vCj6hMz12ux2g2eFOeHadkP
 Jflz6WJDexp7zNUu1lLyvuuMpWW55fW09FFvVKWUP+Mr/4Lk89r3QiCxrupSEm+LtzAw
 N7ftxxGOb3lvDhqP7QT5aJqpkfoq+mi01IAaiMK8rcBIz3/0ujj7SuFdPspG19TjP9Qj
 yvOQ==
X-Gm-Message-State: AO0yUKXBK06dScja1rCM4ZMG0DbSfsvndfR/dKzfvPVeOC8LkFs6maby
 KXDGcz5GF9bHrZO/mOwrgtkoJFnyfPvEkVpJYpK1MQ==
X-Google-Smtp-Source: AK7set9eqiVQpZSmwKWAun52nkU+NCt/ZRqlJJ8HSWUhSvE8yZxxMluNmZuaO1MtVJZkCf7i+tP16A==
X-Received: by 2002:a17:903:138d:b0:196:89bc:70fe with SMTP id
 jx13-20020a170903138d00b0019689bc70femr4778041plb.34.1677033219430; 
 Tue, 21 Feb 2023 18:33:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/25] target/arm: Implement FEAT_RME
Date: Tue, 21 Feb 2023 16:33:11 -1000
Message-Id: <20230222023336.915045-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is based on mainline, without any extra ARMv9-A dependencies
which are still under development.  This is good enough to pass
all of the tests within

    https://github.com/Huawei/Huawei_CCA_QEMU

Changes for v3:
  * Incorporate fix for m-profile arm_cpu_get_phys_page_attrs_debug,
    since it has conflicts with the rest of the patch set.
  * Revert accidental change in S1_ptw_translate remapping
    ARMFault_GPCFOnOutput to ARMFault_GPCFOnWalk.
  * Remove __attribute__((nonnull)) early.
  * Rename get_phys_addr_{inner,outer} -> get_phys_addr_{nogpc,gpc}.

Changes for v2:
  * Drop "Fix pmsav8 stage2 secure parameter".
  * Incorporate review feedback.
  * Mark last two patches as "NOTFORMERGE".


r~


Richard Henderson (25):
  target/arm: Handle m-profile in arm_is_secure
  target/arm: Stub arm_hcr_el2_eff for m-profile
  target/arm: Diagnose incorrect usage of arm_is_secure subroutines
  target/arm: Rewrite check_s2_mmu_setup
  target/arm: Add isar_feature_aa64_rme
  target/arm: Update SCR and HCR for RME
  target/arm: SCR_EL3.NS may be RES1
  target/arm: Add RME cpregs
  target/arm: Introduce ARMSecuritySpace
  include/exec/memattrs: Add two bits of space to MemTxAttrs
  target/arm: Adjust the order of Phys and Stage2 ARMMMUIdx
  target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
  target/arm: Remove __attribute__((nonnull)) from ptw.c
  target/arm: Pipe ARMSecuritySpace through ptw.c
  target/arm: NSTable is RES0 for the RME EL3 regime
  target/arm: Handle Block and Page bits for security space
  target/arm: Handle no-execute for Realm and Root regimes
  target/arm: Use get_phys_addr_with_struct in S1_ptw_translate
  target/arm: Move s1_is_el0 into S1Translate
  target/arm: Use get_phys_addr_with_struct for stage2
  target/arm: Add GPC syndrome
  target/arm: Implement GPC exceptions
  target/arm: Implement the granule protection check
  target/arm: Enable RME for -cpu max
  hw/arm/virt: Add some memory for Realm Management Monitor

 include/exec/memattrs.h |   9 +-
 include/hw/arm/virt.h   |   2 +
 target/arm/cpu-param.h  |   2 +-
 target/arm/cpu.h        | 149 ++++++--
 target/arm/internals.h  |  27 ++
 target/arm/syndrome.h   |  10 +
 hw/arm/virt.c           |  43 +++
 target/arm/cpu.c        |   4 +
 target/arm/cpu64.c      |  37 ++
 target/arm/helper.c     | 164 ++++++++-
 target/arm/ptw.c        | 753 ++++++++++++++++++++++++++++++----------
 target/arm/tlb_helper.c |  96 ++++-
 12 files changed, 1073 insertions(+), 223 deletions(-)

-- 
2.34.1


