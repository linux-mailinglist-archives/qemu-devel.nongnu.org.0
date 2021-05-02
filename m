Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D0370FF1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:59:28 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLzi-0000d8-3l
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxs-0007T6-7m
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:32 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxq-0000V7-BV
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:31 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 x7-20020a17090a5307b02901589d39576eso200262pjh.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=giGjmKzEqdi5mnTDmBfzJZBEJZ4oPNy2d1g4EbEqZvk=;
 b=Yw4Q6/+LNlc8wbgomUh/zEl2hF8OcbEu2nS1+mvlQthH2+iHJ9+nruhn75JIkU5PsG
 aZq3elb+cr8ZacT1s7DM5nxn6R/BdKQVpc/373TovmzpllCdwB6O60DwxRYRjJTLNwtv
 CISdw5/DhBSAYy4uVVIc7Nwtfgto5MKi2UAf+VkOI08gsOgUKuFdLiriNbx/xKIIPxa3
 CU1FZXN/MAVZLudEAmHDapewDaHK8o9kGrHQ/ZNhxFRt5/eoyoWJclEDLupM9oEPkJTt
 /wgsxtm9x2Sa+kYpmVW6phlUdcqMgY/w65o0NLfrLPGkkUyKg4KadMY8FYjwOqCI4hqI
 xnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=giGjmKzEqdi5mnTDmBfzJZBEJZ4oPNy2d1g4EbEqZvk=;
 b=WYYIXpaIhSNdoPWF+L4ktOQO57vW4sD1eU62HK3+n6tQ1jO+rs7ARlhP3ZBWecBaGa
 Iu0LPTcaV8wRPJ6FK8wnTqgRSGLq+yNdVq995mGe6hETZelmZJpE/xpheBhORZm8xvHM
 ZDCKylV4ZzXswPZav/0ocexCXOjJqAxLA3YgNTmg1QSkykAl0S9FHBMvD4yft5HAgotG
 A8VFHdJ/kyFaZ2R2rDzIy7dx40mge4d6YxNdyV5DIDRmBtIlTjb9SjQHkgsONaVdilaq
 BSYwvZ4+p3O3ZNpSpiyLqig19Lpk9YwZyOXrVVIPTHj45gGbFMDM0sCmVFQ+dtE5ckms
 JqIA==
X-Gm-Message-State: AOAM533a2TNVrZFJOMKaLHPKxqO/tuAsY91vatP/yAFxRzaDyAkkhCqq
 08+K0w69CZm4EygNuPbiG2cgJgTic43B3Q==
X-Google-Smtp-Source: ABdhPJxvif5qHNA5liigMYr5am16YLLLXunUUizMbGF9V9lBOvVnxU0Bglf+u3Uu7UeqUydz2bSVSg==
X-Received: by 2002:a17:90b:46c4:: with SMTP id
 jx4mr13837757pjb.155.1619999848789; 
 Sun, 02 May 2021 16:57:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/26] TCI fixes and cleanups
Date: Sun,  2 May 2021 16:57:01 -0700
Message-Id: <20210502235727.1979457-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


Richard Henderson (26):
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
  tests/tcg: Increase timeout for TCI
  gitlab: Rename ACCEL_CONFIGURE_OPTS to EXTRA_CONFIGURE_OPTS
  gitlab: Enable cross-i386 builds of TCI

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
 tcg/tci.c                                     | 1120 ++++++++---------
 tcg/tci/tcg-target.c.inc                      |  550 ++++----
 .gitlab-ci.d/crossbuilds.yml                  |   21 +-
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
 35 files changed, 1179 insertions(+), 1075 deletions(-)
 create mode 100644 tcg/internal.h

-- 
2.25.1


