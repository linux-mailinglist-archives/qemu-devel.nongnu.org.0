Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE3381ECE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:38:14 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG28-0001Uk-Rv
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFye-00079o-CY
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:36 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyc-0007cg-By
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:36 -0400
Received: by mail-qt1-x833.google.com with SMTP id h21so3018158qtu.5
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BdKKalUDsBdZ5mvHPRA2ZgGVxN6FNBUzJI7icAKloPM=;
 b=GZzBicA3ON8oEHDsENXVdKalFA5ouS/eXp5Wetbx2Ocyr+DSXBPV0G0oow19XGYs9x
 TLO3BE6nlGavnJuDttZrIHeYyjqkwDNyOQRRbTTGcUCAp0K8O6zxApWVerOR0Z1a/QWc
 itCvsGQimU5sAk/oD0umWvZwX9RWmIDxX3KKJ/8Q/Mjf74Xj7UiYfVhYxz0PW9NuotsQ
 nXqoAlaiuefqUJrVI1ZJDwkub+vdfzOfO9/cVVKhglHFMUGDzt+xKvz6T2sHJj+Iwhye
 Zv1jKmtY/q9HnedsL1G76n9Hpks3h9mfitAAETIJoKuv/ubVPogIGuiZfMSPNXpEzT7n
 1BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BdKKalUDsBdZ5mvHPRA2ZgGVxN6FNBUzJI7icAKloPM=;
 b=l9CCR3k3B62JG8DoMrKGfIilO9msqwMObwQgv8imR6Ymhh20ofR9xzSlNYySh6jV0o
 TDe1D8oB8xk+/bW2GC1FWd5GiwUELIscF5AjTJ0uwXR8gIpy9Td4C1AF0wNYJ5bgzvwC
 oZRruPsEJLrjWQ2VyTBUxpG27PMUmcsbmQfW2HlUhhecTuyfMMcgX4QuzehvaDeMYVd5
 6Fm4bJXD4aem6Gq4VNdIPnYIFrHT314WBvHZIRKoOHZtSXc8iVeyihJRLF5JuRwZnZj2
 h8vIRiAfBLYv05bZBeeWuOhh7EXI2RFQEDI8DMOi3aocRZAzx+MM9ptbUexg/gw7HLl8
 ieLg==
X-Gm-Message-State: AOAM532aovW7qjrDNEgD3nzXk0xYpqtknoON443CWicVFcClsDpOaCi+
 87/0OQUp+p0vUND/2DCuL/W2l2brxbPrjQWfD6Q=
X-Google-Smtp-Source: ABdhPJyq7/EHG0TBxosH5MEO1Qz9jMtjtt+ltw/Rpp4UDANtEL3p3uh2ZPFx3liLwabBDObKVpdkTg==
X-Received: by 2002:ac8:7c4b:: with SMTP id o11mr25765060qtv.336.1621168472867; 
 Sun, 16 May 2021 05:34:32 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/46] softfloat: Convert float128 to FloatParts (part 1)
Date: Sun, 16 May 2021 07:33:45 -0500
Message-Id: <20210516123431.718318-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have 46 of 72 patches reviewed, and they include ones that
are of express intrest to David, for s390x.  Let's merge these
so that the next patch set is much smaller.


r~


The following changes since commit 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79:

  Merge remote-tracking branch 'remotes/marcandre/tags/rtd-pull-request' into staging (2021-05-14 17:20:08 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-fp-20210516

for you to fetch changes up to 463b3f0d7fa11054daeb5ca22346f77d566795bf:

  softfloat: Move round_to_int_and_pack to softfloat-parts.c.inc (2021-05-16 07:13:51 -0500)

----------------------------------------------------------------
Reorg FloatParts to use QEMU_GENERIC.
Begin replacing the Berkeley float128 routines with FloatParts128.
  - includes a new implementation of float128_muladd
  - includes the snan silencing that was missing from
    float{32,64}_to_float128 and float128_to_float{32,64}.
  - does not include float128_min/max* (written but not yet reviewed).

----------------------------------------------------------------
Alex Bennée (1):
      tests/fp: add quad support to the benchmark utility

Richard Henderson (45):
      qemu/host-utils: Use __builtin_bitreverseN
      qemu/host-utils: Add wrappers for overflow builtins
      qemu/host-utils: Add wrappers for carry builtins
      accel/tcg: Use add/sub overflow routines in tcg-runtime-gvec.c
      softfloat: Move the binary point to the msb
      softfloat: Inline float_raise
      softfloat: Use float_raise in more places
      softfloat: Tidy a * b + inf return
      softfloat: Add float_cmask and constants
      softfloat: Use return_nan in float_to_float
      softfloat: fix return_nan vs default_nan_mode
      target/mips: Set set_default_nan_mode with set_snan_bit_is_one
      softfloat: Do not produce a default_nan from parts_silence_nan
      softfloat: Rename FloatParts to FloatParts64
      softfloat: Move type-specific pack/unpack routines
      softfloat: Use pointers with parts_default_nan
      softfloat: Use pointers with unpack_raw
      softfloat: Use pointers with ftype_unpack_raw
      softfloat: Use pointers with pack_raw
      softfloat: Use pointers with ftype_pack_raw
      softfloat: Use pointers with ftype_unpack_canonical
      softfloat: Use pointers with ftype_round_pack_canonical
      softfloat: Use pointers with parts_silence_nan
      softfloat: Rearrange FloatParts64
      softfloat: Convert float128_silence_nan to parts
      softfloat: Convert float128_default_nan to parts
      softfloat: Move return_nan to softfloat-parts.c.inc
      softfloat: Move pick_nan to softfloat-parts.c.inc
      softfloat: Move pick_nan_muladd to softfloat-parts.c.inc
      softfloat: Move sf_canonicalize to softfloat-parts.c.inc
      softfloat: Move round_canonical to softfloat-parts.c.inc
      softfloat: Use uadd64_carry, usub64_borrow in softfloat-macros.h
      softfloat: Move addsub_floats to softfloat-parts.c.inc
      softfloat: Implement float128_add/sub via parts
      softfloat: Move mul_floats to softfloat-parts.c.inc
      softfloat: Move muladd_floats to softfloat-parts.c.inc
      softfloat: Use mulu64 for mul64To128
      softfloat: Use add192 in mul128To256
      softfloat: Tidy mul128By64To192
      softfloat: Introduce sh[lr]_double primitives
      softfloat: Move div_floats to softfloat-parts.c.inc
      softfloat: Split float_to_float
      softfloat: Convert float-to-float conversions with float128
      softfloat: Move round_to_int to softfloat-parts.c.inc
      softfloat: Move round_to_int_and_pack to softfloat-parts.c.inc

 include/fpu/softfloat-macros.h   |  213 +--
 include/fpu/softfloat.h          |    7 +-
 include/qemu/host-utils.h        |  291 +++
 target/mips/fpu_helper.h         |   10 +-
 accel/tcg/tcg-runtime-gvec.c     |   36 +-
 fpu/softfloat.c                  | 3701 ++++++++++++++++----------------------
 tests/fp/fp-bench.c              |   88 +-
 tests/fp/fp-test.c               |    2 +-
 fpu/softfloat-parts-addsub.c.inc |   62 +
 fpu/softfloat-parts.c.inc        |  817 +++++++++
 fpu/softfloat-specialize.c.inc   |   84 +-
 tests/fp/wrap.c.inc              |   12 +
 12 files changed, 2974 insertions(+), 2349 deletions(-)
 create mode 100644 fpu/softfloat-parts-addsub.c.inc
 create mode 100644 fpu/softfloat-parts.c.inc

