Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC7390633
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:07:09 +0200 (CEST)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZaG-0001DN-A5
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeI-0001Ol-Bz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:16 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeC-0006cK-W6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:13 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso13358494pji.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iDJPnNyNqJZ81+npdsMQSZ1xiMkyQ7w6IzG7NIi4rmo=;
 b=irjPECuJbnKzQ+zIdI1+E+J2kL8Z8BeSmvuyeVMVw6JSAzraJ7A1yUNTb24nz7ukMN
 UioYCz4hR44fCde06f90N5sfZsL4RmvDr4ByGENDck1st9xwDiWh76HUvWf9dQm0eqbI
 BEQ6bhu7z6uot5d6IfUNfWYK4mCEhB6Rfto2NCHusumKGCaYuZ3kL9k7hNA7WkZXv9f7
 VSKcjcxW/UjuLXp7W8zWRtUth9FMEdcBOaBIp/lm7XNoVVs6a6AFfQWPS4dVEMDSoCQW
 X6sRbV2aNKTwf77SeK21o8D8iDfnb2Vfs7QqVTt4gGAjxw9ZFT4yC81XuwDACnh0TuQA
 HlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iDJPnNyNqJZ81+npdsMQSZ1xiMkyQ7w6IzG7NIi4rmo=;
 b=lfe9stAS3q9uc6ZGRssFZGshIroaUe7mx88Q0962epQJFqRl2lxyjpimYTTz+oRC5W
 4zpH0j5BJEX7RnC5E19hJc9Zd3d836sKQQ9Rr9MvQZ9GBLre8UcvvL94fglQdybT0Tkx
 VCpCy1h1rqw0RhxiqQI+Rc7z0NqozlY2Ob/N1TMN612vFiGQco4x+VDDaAc4sTrS1of6
 ZPRq7PmHG49Ab0mZ+HhNs0oZMTTgoP2sQOmd/2Ff+o2uCsSZ8GEvqmW/weEdgrSeCFnz
 +fpl4SZAX/jlpz/VoFgGtynM8g/13IqANChl0Jj/UfMf1wYK3iHND8vP0B0YqVO+daii
 J2vA==
X-Gm-Message-State: AOAM530fyTNWNrPC0M159GhLPIaaEj9Ln7B8CLDnWt0RVy4KPpC6Rebc
 dsF5db/rWTukwku7Wq0H35vdQWsg36ID+g==
X-Google-Smtp-Source: ABdhPJwJSI7kGIV70fHKYfihZE81Q1lm2NHZya+ueLSfxFvm0FskRvYKYl5w0rwcM4W0hTMqSZDBzg==
X-Received: by 2002:a17:902:9348:b029:f0:d51a:7a4c with SMTP id
 g8-20020a1709029348b02900f0d51a7a4cmr30894550plp.60.1621955227239; 
 Tue, 25 May 2021 08:07:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/28] Convert floatx80 and float128 to FloatParts
Date: Tue, 25 May 2021 08:06:38 -0700
Message-Id: <20210525150706.294968-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Changes for v2:
  * Merged 48 of 72 patches.
  * Fixed minmax regression (david)
    Unfortunately, berkeley-testfloat-3 does not have minmax,
    and it didn't look trivial to add.  In the end I simply
    tested an aarch64 guest minmax operations.
  * New patch to perform int->float conversions using hardfloat
    if possible.  Our conversion to gitlab issues passed this
    enhancement request past my eyes again.


r~


Alex Bennée (1):
  tests/fp: Enable more tests

Richard Henderson (27):
  softfloat: Move round_to_uint_and_pack to softfloat-parts.c.inc
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
  softfloat: Use hard-float for {u}int64_to_float{32,64}

 include/fpu/softfloat-helpers.h |    5 +-
 include/fpu/softfloat-macros.h  |   34 +
 include/fpu/softfloat-types.h   |   10 +-
 include/fpu/softfloat.h         |    4 +-
 fpu/softfloat.c                 | 4432 ++++++++-----------------------
 linux-user/arm/nwfpe/fpa11.c    |   41 +-
 target/i386/tcg/fpu_helper.c    |   79 +-
 target/m68k/fpu_helper.c        |   50 +-
 target/m68k/softfloat.c         |   90 +-
 tests/fp/fp-test-log2.c         |  118 +
 tests/fp/fp-test.c              |    9 +-
 fpu/softfloat-parts.c.inc       |  899 ++++++-
 fpu/softfloat-specialize.c.inc  |  340 ---
 tests/fp/wrap.c.inc             |    2 +-
 tests/fp/meson.build            |   27 +-
 15 files changed, 2245 insertions(+), 3895 deletions(-)
 create mode 100644 tests/fp/fp-test-log2.c

-- 
2.25.1


