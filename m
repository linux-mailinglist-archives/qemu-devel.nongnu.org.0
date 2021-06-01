Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB839760C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:06:19 +0200 (CEST)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5yE-0001LF-53
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tJ-00026w-OT
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:13 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tH-0002QZ-J4
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:13 -0400
Received: by mail-io1-xd34.google.com with SMTP id d9so9533563ioo.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JJ91SvtOTI5hYjIknzGKSBW536AjsEX1KpXJxRnAjc=;
 b=pLoLH9/gf5zJlm84uSV12/XoJGBzNzKfy6sPRNtQwiAWDMC0w6KhoigMynbvSHu671
 UJTRQGEdkWX0yfPNnHgVvadntkxQ6aXNiXt4873OPDrIT10mpCeP5JE41NNhEIazy5Na
 mtnxxmBjGxn7ntJ9JowU0ERi5XE3yxJSch5hA+t6rs/A7kPq3pnjijK2zGxLZe4OEx2z
 YUxBIsDaGAT4tzbvheKj5ZibbWI4bC2vXVr3+7/zAQxPeQ5Fk/6EhpEpCr3yPthgP1Kf
 vKQ5YlQbjt09eNLpKZsIry6nRkMTBRgqEzQET2diWd7LfdBH8PE+YUusoYANP3Ejs5x6
 dwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JJ91SvtOTI5hYjIknzGKSBW536AjsEX1KpXJxRnAjc=;
 b=JUbFHSdmxOr9B3lK92vjFfigqogCbP9MYTeQInBk+7GhwldCwGeqoFlQJMyqOwGC9l
 Jz6HNJa95tRbd4XwUoMuTMiwK6eDdUWCEvyUOTiGvJHDeF0oLDGk4U/nCFaGF/jCg8qF
 EooqS1Hzy3uEcy5dz9N37x0H3ZaBK02/zxIzOEEED94T/6svcVzdKOHgffWNKaYYcweH
 QjDjIkOoOgQz+vAEZL1RHsGZr+2TIlsUwy48tslZJRncuQRVBHVGo/yjjxKLikJDqAXv
 9EttDY5VilPuss3fVdJCZuCA2ziY8ucVcIAtKpHVmHvY3Ra2Jw0mFx+tCJNU24OyYKJa
 F2UA==
X-Gm-Message-State: AOAM531Z2mN5tfC926NgnUTBLRU25uTDqb0VXgWHdlR/eiGwS45aI/nT
 EWR+bqtig85oyYA1tl5wfBze86uGc8yqDw==
X-Google-Smtp-Source: ABdhPJwBBe/iYrzW0mKlm2R6556iwHsa9qY8CEVT7mbLd1+iyDB4LMt3h7t8ktFN8uJhTMpEtjKt1A==
X-Received: by 2002:a05:6638:b84:: with SMTP id
 b4mr25283463jad.122.1622559670044; 
 Tue, 01 Jun 2021 08:01:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/27] TCI fixes and cleanups
Date: Tue,  1 Jun 2021 08:00:39 -0700
Message-Id: <20210601150106.12761-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd34.google.com
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

About half of the patches have review.  These do not:

  04-plugins-Drop-tcg_flags-from-struct-qemu_plugin_dy.patch
  09-tcg-tci-Improve-tcg_target_call_clobber_regs.patch
  12-tcg-tci-Reserve-r13-for-a-temporary.patch
  13-tcg-tci-Emit-setcond-before-brcond.patch
  15-tcg-tci-Change-encoding-to-uint32_t-units.patch
  16-tcg-tci-Implement-goto_ptr.patch
  22-tcg-tci-Implement-add2-sub2.patch
  23-tcg-tci-Split-out-tci_qemu_ld-tci_qemu_st.patch
  24-Revert-tcg-tci-Use-exec-cpu_ldst.h-interfaces.patch
  25-tcg-tci-Remove-the-qemu_ld-st_type-macros.patch
  26-tcg-tci-Use-set-clear-_helper_retaddr.patch

Changes since v6:
  * The new xtensa test_load_store.S test highlighted alignment
    exceptions that got lost earlier (my fault).  So revert a
    previously committed patch of this series and fix that up.

Changes since v5:
  * More patches now upstream.
  * Re-work how ffi is used, to avoid breaking plugins.

Changes since v4:
  * 19 more patches now upstream.

Changes since v3:
  * First patch fixes g2h() breakage.  This shows a hole in our CI,
    in that we only build softmmu with TCI, not linux-user.
  * Tidy-up for the magic qemu_ld/st macros.
  * Fix libffi return value case with ffi_arg.

Changes since v2:
  * 20-something patches are now upstream.
  * Increase testing timeout for tci.
  * Gitlab testing for tci w/ 32-bit host.


r~



Richard Henderson (27):
  tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode
  tcg: Add tcg_call_flags
  accel/tcg/plugin-gen: Drop inline markers
  plugins: Drop tcg_flags from struct qemu_plugin_dyn_cb
  accel/tcg: Add tcg call flags to plugins helpers
  tcg: Store the TCGHelperInfo in the TCGOp for call
  tcg: Add tcg_call_func
  tcg: Build ffi data structures for helpers
  tcg/tci: Improve tcg_target_call_clobber_regs
  tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
  tcg/tci: Use ffi for calls
  tcg/tci: Reserve r13 for a temporary
  tcg/tci: Emit setcond before brcond
  tcg/tci: Remove tci_write_reg
  tcg/tci: Change encoding to uint32_t units
  tcg/tci: Implement goto_ptr
  tcg/tci: Implement movcond
  tcg/tci: Implement andc, orc, eqv, nand, nor
  tcg/tci: Implement extract, sextract
  tcg/tci: Implement clz, ctz, ctpop
  tcg/tci: Implement mulu2, muls2
  tcg/tci: Implement add2, sub2
  tcg/tci: Split out tci_qemu_ld, tci_qemu_st
  Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
  tcg/tci: Remove the qemu_ld/st_type macros
  tcg/tci: Use {set,clear}_helper_retaddr
  tests/tcg: Increase timeout for TCI

 configure                                     |    3 +
 meson.build                                   |    9 +-
 accel/tcg/plugin-helpers.h                    |    5 +-
 include/exec/helper-head.h                    |   37 +-
 include/exec/helper-tcg.h                     |   34 +-
 include/qemu/plugin.h                         |    1 -
 include/tcg/tcg-opc.h                         |    4 +-
 include/tcg/tcg.h                             |    1 +
 target/hppa/helper.h                          |    3 -
 target/i386/ops_sse_header.h                  |    3 -
 target/m68k/helper.h                          |    1 -
 target/ppc/helper.h                           |    3 -
 tcg/internal.h                                |   50 +
 tcg/tci/tcg-target-con-set.h                  |    1 +
 tcg/tci/tcg-target.h                          |   68 +-
 accel/tcg/plugin-gen.c                        |   20 +-
 plugins/core.c                                |   30 +-
 tcg/optimize.c                                |    3 +-
 tcg/tcg.c                                     |  250 ++--
 tcg/tci.c                                     | 1199 +++++++++--------
 tcg/tci/tcg-target.c.inc                      |  550 ++++----
 tcg/tci/README                                |   20 +-
 tests/docker/dockerfiles/alpine.docker        |    1 +
 tests/docker/dockerfiles/centos7.docker       |    1 +
 tests/docker/dockerfiles/centos8.docker       |    1 +
 tests/docker/dockerfiles/debian10.docker      |    1 +
 .../dockerfiles/fedora-i386-cross.docker      |    1 +
 .../dockerfiles/fedora-win32-cross.docker     |    1 +
 .../dockerfiles/fedora-win64-cross.docker     |    1 +
 tests/docker/dockerfiles/fedora.docker        |    1 +
 tests/docker/dockerfiles/ubuntu.docker        |    1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |    1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |    1 +
 tests/tcg/Makefile.target                     |    6 +-
 34 files changed, 1243 insertions(+), 1069 deletions(-)
 create mode 100644 tcg/internal.h

-- 
2.25.1


