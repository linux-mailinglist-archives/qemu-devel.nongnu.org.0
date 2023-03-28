Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC86CCDC5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGa-0006qJ-9T; Tue, 28 Mar 2023 18:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGZ-0006qA-1b
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:11 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGX-00072k-7i
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:10 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ja10so13168804plb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBSzInpfsMkQapSXg9xaa0+2prrUGi7ONZTAdhEkmP0=;
 b=Sk1obogPtO6QEg3HaRUGK4BL5cD3rwmpVzg6G5OtNdIHk6WMZ4FTbOn4ENWqfwfypS
 GBAeJfk/LTR5bvDcnsqDXdONgI0nQsrpwM2M8ePSRrg7HA3QEwKZZJyzgawizWwcgsvt
 ip7z7SvmVYw9Pjxp02MdNvsCnu8b7lu4eYgXIRmopwt0eueUFGriE3Fasu/Q7JX8K/Mq
 PD7mj1HWyCflLuWMFA715//8Msrg+suyTrYp/yjzje9vqGLLC9WlZdC+Rs4cz+biP46i
 vOCBz75oxipho2Pc4UNYhidQnvqGVXBnTvJyO85RTqf5IVv4z5QmZvrK59gFcZqkG2Qx
 rJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBSzInpfsMkQapSXg9xaa0+2prrUGi7ONZTAdhEkmP0=;
 b=H7Z3B+0VU9spHTUzXhrpyy/+0FSam5WxptlyqtbdBq+Pe5BerLTADlKSjqB2H2h5xg
 YRN8L+K8VWV+9wcp3rIt/VOfhaRL1FByKfITcmvuCjDgtvVBg04Mvkwzu3SWSqXmsnxv
 +IqROQwPfpFqiWSdRSsYaE7fdiMOPWwELe357tSRivF0Q5Y41bodJqAXfNXsQpojrfpm
 UchRFq5qYt+qmgxmpse9svxZx08AoE8ed0A1Ehqshl2SZE1307trfjmT1sl/2yj4T36p
 LlKEIGZnKmZRzWNADVzIcMm243EYSW0rluRt/QcwRWFyejVeFMSWDhk5I4a5bOL2cEeb
 Q74w==
X-Gm-Message-State: AAQBX9eoW9PnRfwi9UtCnIc22hHySLdkXUd7UCntDzpY9FwFE4ISp4L7
 9EpHza7DRr8fSIxRx6c/yjNnH1DQXNwJZor4uGk=
X-Google-Smtp-Source: AKy350a8mKocOJuQ2chU0k9ptXBgL4CeJEKZPq0yEEd5Ax0R1Ezqu8SCSdHj6vRkhGZNK+c/e3UogQ==
X-Received: by 2002:a17:90b:3850:b0:234:4187:1acc with SMTP id
 nl16-20020a17090b385000b0023441871accmr135632pjb.19.1680044287400; 
 Tue, 28 Mar 2023 15:58:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/15] tcg patch queue
Date: Tue, 28 Mar 2023 15:57:51 -0700
Message-Id: <20230328225806.2278728-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

The following changes since commit d37158bb2425e7ebffb167d611be01f1e9e6c86f:

  Update version for v8.0.0-rc2 release (2023-03-28 20:43:21 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230328

for you to fetch changes up to 87e303de70f93bf700f58412fb9b2c3ec918c4b5:

  softmmu: Restore use of CPU watchpoint for all accelerators (2023-03-28 15:24:06 -0700)

----------------------------------------------------------------
Use a local version of GTree [#285]
Fix page_set_flags vs the last page of the address space [#1528]
Re-enable gdbstub breakpoints under KVM

----------------------------------------------------------------
Emilio Cota (2):
      util: import GTree as QTree
      tcg: use QTree instead of GTree

Philippe Mathieu-Daudé (3):
      softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
      softmmu/watchpoint: Add missing 'qemu/error-report.h' include
      softmmu: Restore use of CPU watchpoint for all accelerators

Richard Henderson (10):
      linux-user: Diagnose misaligned -R size
      accel/tcg: Pass last not end to page_set_flags
      accel/tcg: Pass last not end to page_reset_target_data
      accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
      accel/tcg: Pass last not end to page_collection_lock
      accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
      accel/tcg: Pass last not end to tb_invalidate_phys_range
      linux-user: Pass last not end to probe_guest_base
      include/exec: Change reserved_va semantics to last byte
      linux-user/arm: Take more care allocating commpage

 configure                     |   15 +
 meson.build                   |    4 +
 include/exec/cpu-all.h        |   15 +-
 include/exec/exec-all.h       |    2 +-
 include/hw/core/cpu.h         |   39 +-
 include/hw/core/tcg-cpu-ops.h |   43 ++
 include/qemu/qtree.h          |  201 ++++++
 linux-user/arm/target_cpu.h   |    2 +-
 linux-user/user-internals.h   |   12 +-
 accel/tcg/tb-maint.c          |  112 ++--
 accel/tcg/translate-all.c     |    2 +-
 accel/tcg/user-exec.c         |   25 +-
 bsd-user/main.c               |   10 +-
 bsd-user/mmap.c               |   10 +-
 linux-user/elfload.c          |   72 ++-
 linux-user/flatload.c         |    2 +-
 linux-user/main.c             |   31 +-
 linux-user/mmap.c             |   22 +-
 linux-user/syscall.c          |    4 +-
 softmmu/physmem.c             |    2 +-
 softmmu/watchpoint.c          |    5 +
 target/arm/tcg/mte_helper.c   |    1 +
 target/arm/tcg/sve_helper.c   |    1 +
 target/s390x/tcg/mem_helper.c |    1 +
 tcg/region.c                  |   19 +-
 tests/bench/qtree-bench.c     |  286 +++++++++
 tests/unit/test-qtree.c       |  333 ++++++++++
 util/qtree.c                  | 1390 +++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build           |    2 +-
 tests/bench/meson.build       |    4 +
 tests/unit/meson.build        |    1 +
 util/meson.build              |    1 +
 32 files changed, 2474 insertions(+), 195 deletions(-)
 create mode 100644 include/qemu/qtree.h
 create mode 100644 tests/bench/qtree-bench.c
 create mode 100644 tests/unit/test-qtree.c
 create mode 100644 util/qtree.c

