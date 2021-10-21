Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB8436C6E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:09:25 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfJQ-0001sT-02
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfFy-0007JW-IF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfFu-00046N-M9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:46 -0400
Received: by mail-pf1-x436.google.com with SMTP id c29so1780934pfp.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QhHFRrZYacYsRy1TJQU6Qswa8lTc1e0qgAtpaGMhakQ=;
 b=HSVQRmLLPx8k4E3G1DXehyF6uE6hi5weRU75D2hk1V8vk8dcLkKtpsvSIgL3aEcF45
 gEQ5bRjhtzkjLIZhkb0uKh4U4Aayf0hadLj/XmJBr/fFk1aAiVroSHUNKMPbj/ggiPAv
 5x7zhbhTaMveagMf2FSgLcYzqRNMxLnyXHRNeAQIBE9wiUdqcscwAXc1qnX2ejOHP5zU
 SnJE5N2TEWfDHTF4MFn1seKKog8/JMS6u7lBFW1CV+IHXf0gICebCoAwlMIYwKnoeKIm
 0lSII8Mk7PLwWHr/YYtkxy2+aMrlFlXAiloNURZ02DfjYmABaYISB6wY88O+MWJQAam+
 BWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QhHFRrZYacYsRy1TJQU6Qswa8lTc1e0qgAtpaGMhakQ=;
 b=XEDt2Khw1H172+U2dkHHP/5/js1ZgTVhwMOsCzdVA+KPlkyMa4pw69EAaGnGqIcUTH
 N4hYXkfB2yrcJAgKJj/VZULq5fk44SEEGFtcxKdCGXsVXlMdbcYTeqTid7utpIaVvCE/
 5a3xWX7/LELELVPAh60EHOYLixH9I97HUiQeQlsGNEY1Ww+axwQmumTu35/AOSv+0Nxn
 R+BHXhAlo7Fp2uKIY4B5pNp3+O7dJdibldL0lPdELsXkR5z7CF+mBh3+jPDWGsblbpjD
 h3kSA3dpVHpAvxp00W11SQ/IO+lGG2EbLe3woxjPdty5dGFNLJTBLYwmZWn0FNOzLdUa
 d+cw==
X-Gm-Message-State: AOAM5335QHpdIklspnZksCTH1cBM/GOxE17Ti3LY8JiIcx4D+NQuV9Dz
 DbCX+Esd6mqZJfDUaRCdlukWk8ej9M8wUQ==
X-Google-Smtp-Source: ABdhPJxwOWf/hs+K68FtkLTh1HGybbl9lOo2DAFkGTWxFWZ8YvrbZPFFCHK60umqEWeTYgXW7eqhGA==
X-Received: by 2002:a05:6a00:2389:b0:44d:6d57:a38e with SMTP id
 f9-20020a056a00238900b0044d6d57a38emr8466216pfc.50.1634850340765; 
 Thu, 21 Oct 2021 14:05:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/48] tcg: optimize redundant sign extensions
Date: Thu, 21 Oct 2021 14:04:51 -0700
Message-Id: <20211021210539.825582-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we have support for optimizing redundant zero extensions,
which I think was done with x86 and aarch64 in mind, which zero-extend
all 32-bit operations into the 64-bit register.  But targets like Alpha,
MIPS, and RISC-V do sign-extensions instead.

But before that, split the quite massive tcg_optimize function.


r~


Changes for v3:
  * Fix brcond2 bug (luis)
  * Fix fold_count_zeros typo.
  * Rebase and fix up int128.h conflict.

Changes for v2:
  * Rebase, adjusting MemOpIdx renaming.
  * Apply r-b and some feedback (f4bug).


Patches lacking review:
  17-tcg-optimize-Split-out-fold_brcond2.patch
  20-tcg-optimize-Split-out-fold_mulu2_i32.patch
  21-tcg-optimize-Split-out-fold_addsub2_i32.patch
  22-tcg-optimize-Split-out-fold_movcond.patch
  23-tcg-optimize-Split-out-fold_extract2.patch
  24-tcg-optimize-Split-out-fold_extract-fold_sextract.patch
  25-tcg-optimize-Split-out-fold_deposit.patch
  26-tcg-optimize-Split-out-fold_count_zeros.patch
  28-tcg-optimize-Split-out-fold_dup-fold_dup2.patch
  33-tcg-optimize-Add-type-to-OptContext.patch
  34-tcg-optimize-Split-out-fold_to_not.patch
  35-tcg-optimize-Split-out-fold_sub_to_neg.patch
  36-tcg-optimize-Split-out-fold_xi_to_x.patch
  37-tcg-optimize-Split-out-fold_ix_to_i.patch
  38-tcg-optimize-Split-out-fold_masks.patch
  39-tcg-optimize-Expand-fold_mulu2_i32-to-all-4-arg-m.patch
  41-tcg-optimize-Sink-commutative-operand-swapping-in.patch
  42-tcg-optimize-Add-more-simplifications-for-orc.patch
  43-tcg-optimize-Stop-forcing-z_mask-to-garbage-for-3.patch
  44-tcg-optimize-Optimize-sign-extensions.patch
  46-tcg-optimize-Propagate-sign-info-for-setcond.patch
  47-tcg-optimize-Propagate-sign-info-for-bit-counting.patch
  48-tcg-optimize-Propagate-sign-info-for-shifting.patch



Richard Henderson (48):
  tcg/optimize: Rename "mask" to "z_mask"
  tcg/optimize: Split out OptContext
  tcg/optimize: Remove do_default label
  tcg/optimize: Change tcg_opt_gen_{mov,movi} interface
  tcg/optimize: Move prev_mb into OptContext
  tcg/optimize: Split out init_arguments
  tcg/optimize: Split out copy_propagate
  tcg/optimize: Split out fold_call
  tcg/optimize: Drop nb_oargs, nb_iargs locals
  tcg/optimize: Change fail return for do_constant_folding_cond*
  tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
  tcg/optimize: Split out finish_folding
  tcg/optimize: Use a boolean to avoid a mass of continues
  tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
  tcg/optimize: Split out fold_const{1,2}
  tcg/optimize: Split out fold_setcond2
  tcg/optimize: Split out fold_brcond2
  tcg/optimize: Split out fold_brcond
  tcg/optimize: Split out fold_setcond
  tcg/optimize: Split out fold_mulu2_i32
  tcg/optimize: Split out fold_addsub2_i32
  tcg/optimize: Split out fold_movcond
  tcg/optimize: Split out fold_extract2
  tcg/optimize: Split out fold_extract, fold_sextract
  tcg/optimize: Split out fold_deposit
  tcg/optimize: Split out fold_count_zeros
  tcg/optimize: Split out fold_bswap
  tcg/optimize: Split out fold_dup, fold_dup2
  tcg/optimize: Split out fold_mov
  tcg/optimize: Split out fold_xx_to_i
  tcg/optimize: Split out fold_xx_to_x
  tcg/optimize: Split out fold_xi_to_i
  tcg/optimize: Add type to OptContext
  tcg/optimize: Split out fold_to_not
  tcg/optimize: Split out fold_sub_to_neg
  tcg/optimize: Split out fold_xi_to_x
  tcg/optimize: Split out fold_ix_to_i
  tcg/optimize: Split out fold_masks
  tcg/optimize: Expand fold_mulu2_i32 to all 4-arg multiplies
  tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
  tcg/optimize: Sink commutative operand swapping into fold functions
  tcg/optimize: Add more simplifications for orc
  tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
  tcg/optimize: Optimize sign extensions
  tcg/optimize: Propagate sign info for logical operations
  tcg/optimize: Propagate sign info for setcond
  tcg/optimize: Propagate sign info for bit counting
  tcg/optimize: Propagate sign info for shifting

 tcg/optimize.c | 2600 +++++++++++++++++++++++++++++-------------------
 1 file changed, 1583 insertions(+), 1017 deletions(-)

-- 
2.25.1


