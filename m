Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD33376E3E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:53:52 +0200 (CEST)
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCAB-0004Hj-AB
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4g-0003wR-Cn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:10 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4b-0003Ty-VU
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id g24so6197568pji.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Mpqsl6ZXk9A8jU5cS9KzGLD3JWl8vKGch9eyqc3DFM=;
 b=iZ3oP1NJBSMZbnlOXIPpqLJGNZGAXBdkI6/bmR24LXkcBlZoPC9TOwSR6+d94Doib2
 0JvRwDTYFAEjw/tD+22GjSSCxMWcst/Tibud+2orxHSbNw8vNJO1gUtNkfA2SjsjS7c8
 +3jFR9c8seIYsGyvzFPegg8PTHdtb/U20HMWWC/K3Is3HN/A2dOt+wrKxfUz5sXMa64m
 42buLEy713G0CEeSM4U2PRgPAqofM6XJy02rT1LkTk+O0OPo97T4guN3gn4C+/JJ0bQn
 N5rYp7vgSy11KgBn2qvFM9tKRtPy7453KIpFo/qOa2VMGkJCHVE6PBEBG5ei2toTXWU4
 G0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Mpqsl6ZXk9A8jU5cS9KzGLD3JWl8vKGch9eyqc3DFM=;
 b=rUFDGGUEVcffB/fuickI0lBPG3NN6JrwHhTioyTwCZDU825SwD6yEYMzOKPvibj3dc
 Al06rnZT3ESlDuJYDr9ovovJMFQ9kqK5CHdRprqAKnxYRpFVgNmW5Pn5JA984QAfWmHW
 0s9tduN+bVgVnOa6x6lm5JP1qfQCoQq7nIvGBf2HVhVw42S/QQGRr1sJ1dF6mTDab60U
 elWysAcTB51HYHvW837csYRLRN9KiAv+5BXrpvU9184OtxQ5KfJwdOvIM0XQvxdBTWBG
 EYlbt80yHKkehOJmU8UI6HTOf4BTv6zmjdi3E1q+xyXxpJ6A9TQ7yHVD/qED02ZAik/u
 6iiA==
X-Gm-Message-State: AOAM530pjRz05CuRukqrnERkStlPPWvxp2FKRWXpgEq1t2t7XCXg/ICC
 9OSlkPNnz1OZW6+AbAuH65Q8Ry/4vHm1kw==
X-Google-Smtp-Source: ABdhPJzNV8ynI/Uv1YHYj1hiYOfnrn8pMwQIMSCb1PWYFrzeeC0JE13tHWPdblHxRW2MI+NIRax9xA==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr14292920pjf.32.1620438484152; 
 Fri, 07 May 2021 18:48:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Fri,  7 May 2021 18:46:50 -0700
Message-Id: <20210508014802.892561-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorg everything using QEMU_GENERIC and multiple inclusion to
reduce the amount of code duplication between the formats.

The use of QEMU_GENERIC means that we need to use pointers instead
of structures, which means that even the smaller float formats
need rearranging.

I've carried it through to completion within fpu/, so that we don't
have (much) of the legacy code remaining.  There is some floatx80
stuff in target/m68k and target/i386 that's still hanging around.


r~


Alex Bennée (1):
  tests/fp: add quad support to the benchmark utility

Richard Henderson (71):
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
  softfloat: Move rount_to_int_and_pack to softfloat-parts.c.inc
  softfloat: Move rount_to_uint_and_pack to softfloat-parts.c.inc
  softfloat: Move int_to_float to softfloat-parts.c.inc
  softfloat: Move uint_to_float to softfloat-parts.c.inc
  softfloat: Move minmax_flags to softfloat-parts.c.inc
  softfloat: Move compare_floats to softfloat-parts.c.inc
  softfloat: Move scalbn_decomposed to softfloat-parts.c.inc
  softfloat: Move sqrt_float to softfloat-parts.c.inc
  softfloat: Split out parts_uncanon_normal
  softfloat: Reduce FloatFmt
  softfloat: Introduce Floatx80RoundPrec
  softfloat: Adjust parts_uncanon_normal for floatx80
  tests/fp/fp-test: Reverse order of floatx80 precision tests
  softfloat: Convert floatx80_add/sub to FloatParts
  softfloat: Convert floatx80_mul to FloatParts
  softfloat: Convert floatx80_div to FloatParts
  softfloat: Convert floatx80_sqrt to FloatParts
  softfloat: Convert floatx80_round to FloatParts
  softfloat: Convert floatx80_round_to_int to FloatParts
  softfloat: Convert integer to floatx80 to FloatParts
  softfloat: Convert floatx80 float conversions to FloatParts
  softfloat: Convert floatx80 to integer to FloatParts
  softfloat: Convert floatx80_scalbn to FloatParts
  softfloat: Convert floatx80 compare to FloatParts
  softfloat: Convert float32_exp2 to FloatParts
  softfloat: Move floatN_log2 to softfloat-parts.c.inc
  softfloat: Convert modrem operations to FloatParts

 include/fpu/softfloat-helpers.h  |    5 +-
 include/fpu/softfloat-macros.h   |  247 +-
 include/fpu/softfloat-types.h    |   10 +-
 include/fpu/softfloat.h          |   11 +-
 include/qemu/host-utils.h        |  291 ++
 target/mips/fpu_helper.h         |   10 +-
 accel/tcg/tcg-runtime-gvec.c     |   36 +-
 fpu/softfloat.c                  | 7760 ++++++++++--------------------
 linux-user/arm/nwfpe/fpa11.c     |   41 +-
 target/i386/tcg/fpu_helper.c     |   79 +-
 target/m68k/fpu_helper.c         |   50 +-
 target/m68k/softfloat.c          |   90 +-
 tests/fp/fp-bench.c              |   88 +-
 tests/fp/fp-test-log2.c          |  118 +
 tests/fp/fp-test.c               |   11 +-
 fpu/softfloat-parts-addsub.c.inc |   62 +
 fpu/softfloat-parts.c.inc        | 1480 ++++++
 fpu/softfloat-specialize.c.inc   |  424 +-
 tests/fp/wrap.c.inc              |   12 +
 tests/fp/meson.build             |   11 +
 20 files changed, 4886 insertions(+), 5950 deletions(-)
 create mode 100644 tests/fp/fp-test-log2.c
 create mode 100644 fpu/softfloat-parts-addsub.c.inc
 create mode 100644 fpu/softfloat-parts.c.inc

-- 
2.25.1


