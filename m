Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB63FB121
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:27:09 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKalA-0006Uk-3J
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj3-0003XH-5O
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj1-0007M7-AZ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y23so12413938pgi.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELO8ldzR6uETqHFDoxmjf00JPNHufBQpShlXLq8y3W4=;
 b=Tqbm0Iz7VtSJ45AuyhvlmuSEqZWFxIABFEIOkZZmKbBgR3rabzHQRNJdPGWWBhtdWv
 JKmXB+MjSh/jhCXBVO1Y1EFf2yL+KDCCoht+KU7qmslus4dInFfmjwdy4XAUDh7ccuv/
 aCc/jqqWTdDx/flMvN++soj2T8S43o10mlNnTeFzHKqFvGenTeJh6D4uZSGA9rFsFQ6p
 POvhRMzQcukjJriD8jTj92AvRHJYLUzyG2eoDEFuhL7iRA4fAyTJ8/irYEK1Hvkn15ye
 V7XlQM3UKCBFv50aEWVn6SPd7sWagvvVe3OUMFqYMFaYG1U0ok2DAEspxFDENZbszk4u
 nQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ELO8ldzR6uETqHFDoxmjf00JPNHufBQpShlXLq8y3W4=;
 b=oggzko4bIQTtnuinmQmRkBMJep0jPKIrvd3e+dh0UjdX011VYjHEMkJFfus++9GCdw
 MvP9r7mpU4Bz7SKV0Xm6i8lQzADijTcXEFRn4noImXjceyalqY3hHJr1IhPnV+/jPphR
 w6FD4f3OsjjCoj+ARG/HdOfSFFSIIoGejMF+bOSvEHRbps1XhV7zXL0EPzP7gj1Vv+CU
 79zYeFtQCT8g8JZ8U1dnYGEeLe5qoXmPjQYjACYARr4dMRFeSvCPte4tchzDVG1MjlgE
 PDZ6Wn0hX/C3koR44cMP6QtnubRMummGGlH2bzkkVaNIPuvGu85lV4wf1Ls1+xqo75nT
 cJZA==
X-Gm-Message-State: AOAM533MwjCoEl/PRbDa1agBe7aHFiwuAmS/Qp85sJc2sw4uIIM6D5dd
 Um/lfQDIhB7CXjBeCYeklocyln6SFeX+LA==
X-Google-Smtp-Source: ABdhPJwjMA0lI2R1noEpsNJFVL3Vuq0fVw0eUvKca8VtHDdv3VFbKxlgT86do+3z9FIZWGQJUw/oEg==
X-Received: by 2002:a63:da49:: with SMTP id l9mr20163867pgj.277.1630304692908; 
 Sun, 29 Aug 2021 23:24:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/48] tcg: optimize redundant sign extensions
Date: Sun, 29 Aug 2021 23:24:03 -0700
Message-Id: <20210830062451.639572-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we have support for optimizing redundant zero extensions,
which I think was done with x86 and aarch64 in mind, which zero-extend
all 32-bit operations into the 64-bit register.

But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
The last 5 patches address this.

But before that, split the quite massive tcg_optimize function.


r~


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

 tcg/optimize.c | 2594 +++++++++++++++++++++++++++++-------------------
 1 file changed, 1577 insertions(+), 1017 deletions(-)

-- 
2.25.1


