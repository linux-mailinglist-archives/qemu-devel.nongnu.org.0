Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AE6C4F03
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf047-0002gE-SW; Wed, 22 Mar 2023 11:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf045-0002fx-VG
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:49 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf044-0007Ek-84
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:49 -0400
Received: by mail-pl1-x630.google.com with SMTP id o11so19570367ple.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jebCWAPwTs4r/XAQO7vnr7xoyu1msDqQuoXwNf4SW9k=;
 b=pKNgl2WbP73Enx6Y16CUDVrQl98kmEamLbmsSmmbeTuCgMhBgzyow/pwjFo166MFCg
 +/7MlXUx6Fr8kvG3rCvJ+DTh0K637TbOtxjTBA25iEzwi7IWgceVx1JYDWkExaYqlRCn
 Ayu/tecb8wUtxacomHD15tkMOOOr94KkF9SS/gqEumdSSRGSIPn6Cyh+z4YvPVr45q2G
 9s05SvVx+73PNYAH+YC+bLwNxiEAaLzFR2zwlrW5m6nRIQon89xCEGm7zG0PJpJLSoR6
 VTyCMYJ7QOaASMeMuA3Si3kvuzvW9u7xXt+2Cv/K5ILmjBxDKRkPKVNNCAcVFk39ncwX
 4xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jebCWAPwTs4r/XAQO7vnr7xoyu1msDqQuoXwNf4SW9k=;
 b=4RduQ3cU/Wg7mvfZFLs5Da5iIu9psLUa3fOSy4SZAPF6vASipcJy7gVjoCWCWDPFTQ
 02CRst+BdtQp1qJCIKLT9yC3p6iAWarjPw73FytdrBRc5lOPcVn0Wo8HlhjyJGO2qK6W
 xDbYLDvqsiMtm1SbmVxrSIMyqy91M1oaPsm619tZUWpPA+0LafH6iYRYEBWpUy6+StQ0
 jFQxmYDIGztrXqMCWgydkIpkBEaTnfg+7SZg0FEM2FeRTPVisDu1g7X47EOoK5Gp/cBj
 5S0bkfIKqSy++FgJTXmfmyTUkueOqE2ZfBFwR5aEm/qf7zkvAklGBNznmW3ioZ7p6UiR
 OVag==
X-Gm-Message-State: AO0yUKW6E1ggqtnVk3oT8dBEuWFMCpq78Ut2MeeLDp9x6oHkx4VIXpCS
 M3yvCtzpfTrqbasXS31FIRJRoSEkTXtzdUkYPrE=
X-Google-Smtp-Source: AK7set/Zcs1kHuU87SXia/HYKm74ureOMq+KYnTPYYZWwDMdkHzTq+jl1SoEKjHyjYH1kLKT1Krhng==
X-Received: by 2002:a17:90b:1bc2:b0:234:1621:3792 with SMTP id
 oa2-20020a17090b1bc200b0023416213792mr4185968pjb.4.1679497666281; 
 Wed, 22 Mar 2023 08:07:46 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	peter.maydell@linaro.org
Subject: [PATCH for-8.0 00/11] tcg patch queue
Date: Wed, 22 Mar 2023 08:07:33 -0700
Message-Id: <20230322150744.175010-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Posting pre-PR because I had to adjust Emilio's QTree patch [1],
and added a new patch to avoid an assert that can be generated
with incorrect -R reserved_va values vs the ARM commpage.

r~

[1] https://gitlab.com/rth7680/qemu/-/jobs/3975817279#L92

Emilio Cota (2):
  util: import GTree as QTree
  tcg: use QTree instead of GTree

Richard Henderson (9):
  linux-user: Diagnose misaligned -R size
  include/exec: Change reserved_va semantics to last byte
  accel/tcg: Pass last not end to page_set_flags
  accel/tcg: Pass last not end to page_reset_target_data
  accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
  accel/tcg: Pass last not end to page_collection_lock
  accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
  accel/tcg: Pass last not end to tb_invalidate_phys_range
  linux-user/arm: Take more care allocating commpage

 configure                   |   15 +
 meson.build                 |    4 +
 include/exec/cpu-all.h      |   15 +-
 include/exec/exec-all.h     |    2 +-
 include/qemu/qtree.h        |  201 +++++
 linux-user/arm/target_cpu.h |    2 +-
 accel/tcg/tb-maint.c        |  112 +--
 accel/tcg/translate-all.c   |    2 +-
 accel/tcg/user-exec.c       |   25 +-
 bsd-user/main.c             |   10 +-
 bsd-user/mmap.c             |   10 +-
 linux-user/elfload.c        |   67 +-
 linux-user/main.c           |   31 +-
 linux-user/mmap.c           |   22 +-
 linux-user/syscall.c        |    4 +-
 softmmu/physmem.c           |    2 +-
 tcg/region.c                |   19 +-
 tests/bench/qtree-bench.c   |  286 +++++++
 tests/unit/test-qtree.c     |  333 +++++++++
 util/qtree.c                | 1390 +++++++++++++++++++++++++++++++++++
 tests/bench/meson.build     |    4 +
 tests/unit/meson.build      |    1 +
 util/meson.build            |    1 +
 23 files changed, 2412 insertions(+), 146 deletions(-)
 create mode 100644 include/qemu/qtree.h
 create mode 100644 tests/bench/qtree-bench.c
 create mode 100644 tests/unit/test-qtree.c
 create mode 100644 util/qtree.c

-- 
2.34.1


