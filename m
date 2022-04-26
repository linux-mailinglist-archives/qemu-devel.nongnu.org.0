Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2F510361
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO83-0006IC-Ez
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5U-0002vV-9C
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Q-0003l2-3E
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:49 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 15so8134145pgf.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1X2YtAIHV2nemNTfa5nAcwrAA/MgBlAAmi1naTsBqxQ=;
 b=Noenf8Uvg6+10ml8lQrHFX9yNINzCu7zWwQBK3OlrjDSnwyy/uFTKfg6qOKeGFOHYK
 WvfXvvzkTgLA1TvlLOEXH5SpEUQ56dDHd5jfa1fXSzp3Fwo275a+UFG9mHZBSVneZ5sx
 tawIgwB0yE6Jpnm1KLrjf8Tj5SNCjXIERb/znTIjoDW93JyXwKEa19iXy5nhjlCxoEFT
 xffNzEkyMEGniBdIRelJGYezcaIorWNYKGCsdjGZBUAyn3kLngQXnKCIrllrD1EOX57l
 0xIWU/eNQwXsg4hAX8Rts2pLFdG3gIoICPtO9R/OVKLvugBJBavtiDp/gvYbKQ0/3nMf
 xUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1X2YtAIHV2nemNTfa5nAcwrAA/MgBlAAmi1naTsBqxQ=;
 b=gA6bYE2lZhv3yr0D9GpgB6TEMaFzWTMcxBgTHM7+DctEPV+5C2caMAh2nkr+8UNfCS
 CMx7i909RvPsYYbbO15CzTzXyfrfgp8EenyEehBaC9MXL3WXsfILVj4V4gVp4V8/beEX
 1jW0OfHrj6PEFeRnAN7SmJxZA4N+rMe4jtAxS5w7+X2yKs4aC0dBAMJX7EM6Syqb7ljH
 q7FNWe6Y6Vrsg8tErQfBWahW/biqbzW1XjgCj/wF7rGKVSJvPszYOmLnzWOlbv0tHgHv
 nXfQNuI/eqx61vEHDkqO1uxob2LcaZm/bsVWBnjQ1u8p3m0JknmeypvjLIH6hHTpRovJ
 tqJA==
X-Gm-Message-State: AOAM530mvrOpBwhfJIMA5StkBshP5bmujGDOZVQioaQXn3t/SNhe95k6
 FmuWd1WaLzan1/tOsqWdG0xR3zfbOetA9g==
X-Google-Smtp-Source: ABdhPJzuEFiw/gdke+9s5ZAjmXAySLZ1L0s3FTQg9d0eQSa3wIyX8DYjDCQ00HOAXvP/AtHIR/s/Rw==
X-Received: by 2002:a05:6a00:1d24:b0:50c:f8b5:974d with SMTP id
 a36-20020a056a001d2400b0050cf8b5974dmr21009931pfx.76.1650990645351; 
 Tue, 26 Apr 2022 09:30:45 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/47] target/arm: Use tcg_constant
Date: Tue, 26 Apr 2022 09:29:56 -0700
Message-Id: <20220426163043.100432-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the tcg_constant patches out of my larger v3 cleanups
patch set, and then split the 5 patches into tiny bites.


r~


Richard Henderson (47):
  target/arm: Use tcg_constant in gen_probe_access
  target/arm: Use tcg_constant in gen_mte_check*
  target/arm: Use tcg_constant in gen_exception*
  target/arm: Use tcg_constant in gen_adc_CC
  target/arm: Use tcg_constant in handle_msr_i
  target/arm: Use tcg_constant in handle_sys
  target/arm: Use tcg_constant in disas_exc
  target/arm: Use tcg_constant in gen_compare_and_swap_pair
  target/arm: Use tcg_constant in disas_ld_lit
  target/arm: Use tcg_constant in disas_ldst_*
  target/arm: Use tcg_constant in disas_add_sum_imm*
  target/arm: Use tcg_constant in disas_movw_imm
  target/arm: Use tcg_constant in shift_reg_imm
  target/arm: Use tcg_constant in disas_cond_select
  target/arm: Use tcg_constant in handle_{rev16,crc32}
  target/arm: Use tcg_constant in disas_data_proc_2src
  target/arm: Use tcg_constant in disas_fp*
  target/arm: Use tcg_constant in simd shift expanders
  target/arm: Use tcg_constant in simd fp/int conversion
  target/arm: Use tcg_constant in 2misc expanders
  target/arm: Use tcg_constant in balance of translate-a64.c
  target/arm: Use tcg_constant for aa32 exceptions
  target/arm: Use tcg_constant for disas_iwmmxt_insn
  target/arm: Use tcg_constant for gen_{msr,mrs}
  target/arm: Use tcg_constant for vector shift expanders
  target/arm: Use tcg_constant for do_coproc_insn
  target/arm: Use tcg_constant for gen_srs
  target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
  target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
  target/arm: Use tcg_constant for v7m MRS, MSR
  target/arm: Use tcg_constant for TT, SAT, SMMLA
  target/arm: Use tcg_constant in LDM, STM
  target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
  target/arm: Use tcg_constant in trans_CPS_v7m
  target/arm: Use tcg_constant in trans_CSEL
  target/arm: Use tcg_constant for trans_INDEX_*
  target/arm: Use tcg_constant in SINCDEC, INCDEC
  target/arm: Use tcg_constant in FCPY, CPY
  target/arm: Use tcg_constant in {incr,wrap}_last_active
  target/arm: Use tcg_constant in do_clast_scalar
  target/arm: Use tcg_constant in WHILE
  target/arm: Use tcg_constant in LD1, ST1
  target/arm: Use tcg_constant in SUBR
  target/arm: Use tcg_constant in do_zzi_{sat,ool}, do_fp_imm
  target/arm: Use tcg_constant for predicate descriptors
  target/arm: Use tcg_constant for do_brk{2,3}
  target/arm: Use tcg_constant for vector descriptor

 target/arm/translate-a64.c | 302 +++++++++++--------------------------
 target/arm/translate-sve.c | 202 +++++++++----------------
 target/arm/translate.c     | 244 ++++++++++--------------------
 3 files changed, 241 insertions(+), 507 deletions(-)

-- 
2.34.1


