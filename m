Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D843BDA4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:13:01 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVcq-0005Wq-Fj
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZk-0002hb-QB
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:48 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZj-0001ti-3Z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a26so869335pfr.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Kg3mp4JkcobnDJa3/3GCjHaK0wCDpoj41GHBGyBCLk=;
 b=B2PMPSIMDTGbedscs50Y/9yq639o2tar0asFEuCi5M/hvyG59XFK7UPFBbGn3OgDrn
 +Ku3Q8bD5aWMa013GrxNP5k8kWqqqylCC0h86AoqM54G2LXL0rJBBsals/PsZTgmbYNR
 GoqjkQFOTKq0PAXv+eP6OX9AcMzfcPmuzM3D8wESPA62wDXwnh1hgCzLCg8rE43za5a8
 Mi06TlgQ6d+QXx5KnrDZhC+TYCFtCRbwjr4OuwvAzcErrbQo2Nuf/+tRyy21S4ruLwQs
 rK2xI6DI367c1CZcXcwfvEC0tDP5Ix5OlZcivh9mk0+99AJkh4r/yHdJKzCR5PWtJIPv
 1kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Kg3mp4JkcobnDJa3/3GCjHaK0wCDpoj41GHBGyBCLk=;
 b=iku4eA6bDJaJaFY2pyZrkK2JteTDii+W0MwPiuZB0S6dz0lOqBGmgfADmRZl4UDY6D
 UXKnsXivTI/hAfGWAWIJpy2aqhiTVl8NqVrqqudj1RIfveZ9MDj5p9no0qi8vagFe8Pd
 uB8Di6JB8QZvC9ZDD9bratlMT7BrXv1HOtE7dHeUQ3RbVpAlHH6Csupe3Zm2ZvKGiLKX
 wa9coqqFwrPfdKenav72tV9eT9XgK69Otdh+/v8GJzhpDA+Fc7JO7/nGdI2yBLiTDJex
 eh4TQnN2CpITlQpXUcGHRR2muhfxF+VBlLpvQwC2YBxWFa5gW5S6k81gvm6PEnrbyvCC
 1EmA==
X-Gm-Message-State: AOAM531R6LvDKTl73MalfwjFynj6UH5nvFX4H4/1EGUDVQjoN+w6LMMv
 wAn0bnHxpRQuU6pMwajBfneC4kxKmd+diA==
X-Google-Smtp-Source: ABdhPJx/3a3qAA/9pROTY8ibA3eTecT//1GzLDrsZqd92zMH1HyZXUaUq1CL3lE+mPSlZqZvG7P0QA==
X-Received: by 2002:a63:b11:: with SMTP id 17mr21174471pgl.51.1635289785167;
 Tue, 26 Oct 2021 16:09:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/51] tcg: optimize redundant sign extensions
Date: Tue, 26 Oct 2021 16:08:52 -0700
Message-Id: <20211026230943.1225890-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we have support for optimizing redundant zero extensions,
which I think was done with x86 and aarch64 in mind, which zero-extend
all 32-bit operations into the 64-bit register.  But targets like Alpha,
MIPS, and RISC-V do sign-extensions instead.

But before that, split the quite massive tcg_optimize function.


r~


Patches without review:
  34-tcg-optimize-Split-out-fold_to_not.patch
  36-tcg-optimize-Split-out-fold_xi_to_x.patch
  41-tcg-optimize-Sink-commutative-operand-swapping-in.patch
  44-tcg-optimize-Use-fold_xi_to_x-for-mul.patch
  45-tcg-optimize-Use-fold_xi_to_x-for-div.patch
  46-tcg-optimize-Use-fold_xx_to_i-for-rem.patch

Changes for v4:
  * Adjust incorrect split of orc optimizations (luis)
  * Add identity and constant opts for multiply/divide (luis)
  * Adjust mask and size computation (ajb)
  * Add NO_DEST macro for swap_commutative (ajb)

Changes for v3:
  * Fix brcond2 bug (luis)
  * Fix fold_count_zeros typo.
  * Rebase and fix up int128.h conflict.

Changes for v2:
  * Rebase, adjusting MemOpIdx renaming.
  * Apply r-b and some feedback (f4bug).


Richard Henderson (51):
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
  tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
  tcg/optimize: Use fold_xx_to_i for orc
  tcg/optimize: Use fold_xi_to_x for mul
  tcg/optimize: Use fold_xi_to_x for div
  tcg/optimize: Use fold_xx_to_i for rem
  tcg/optimize: Optimize sign extensions
  tcg/optimize: Propagate sign info for logical operations
  tcg/optimize: Propagate sign info for setcond
  tcg/optimize: Propagate sign info for bit counting
  tcg/optimize: Propagate sign info for shifting

 tcg/optimize.c | 2643 +++++++++++++++++++++++++++++-------------------
 1 file changed, 1626 insertions(+), 1017 deletions(-)

-- 
2.25.1


