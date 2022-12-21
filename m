Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AEC652C3F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGF-0002Bt-BU; Wed, 21 Dec 2022 00:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGC-00029Y-I5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:20 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rG9-0003Mj-NO
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:20 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 17so14497937pll.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NAylcbyr/YaNVznH7//zM+vcTgAsno4AOEpkppooxno=;
 b=O4Qoq6gh6q803njMrZi8tk7oV5X8+PeKVzcaP7iQaWHwZC+Sf/Te12J/JRekM70LA6
 PWidEBhAberRIWV7aeKg5l3jZclVdcCXD6us6NZlPbcOj2uwWSXqBds0PTznODqjJlFp
 ORicWSwPvR8auCTKwgjGUHeM3o7D00yVgZECHrIq2kC1+2mE8+/mXc8aEJFMpQfttwLE
 NhD29DDpr+CuKjI+irsRwXyATbkXcDa6LckA/S6r2vWL5ES1k2Vcxh6/6af1wBMkmCLN
 NL5IBNHF0A54RmTaHHCJn538W+ceXMwTn+0oEGD6+yx0uPuEhUCX9AuOelsbqA8MU55n
 p2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAylcbyr/YaNVznH7//zM+vcTgAsno4AOEpkppooxno=;
 b=242x2BeQhTag9ie7YfdhYsmwSVpdaMfUo5vL6GriLP9ADOorKmbGZJ7KHzqtr+nlrd
 jWNFzXoTI7jAeJmaAxgsZzkZar84K891RmXb5hSWlt0mYs3jE4KW7WIE1s9e1UR9O96n
 WIgMnSK47jJeBedGmvLogd7EgoIkw9Ibe456GI2vIStABaQTfW/0orIbhTZHEkOiRJZD
 LHLfyO8Bw/dt485k0e7yEMhm4MARLsYOolAPePKwkAgT9sYR0vlLneicl7DRWB0O/QxL
 d8nSqlqf0osk+uI0SfT4FWRF6KHs6Lv4FiOJ23d71juaQBi/JxDcqKKoAdKnE3fUcth0
 oPjA==
X-Gm-Message-State: AFqh2kpa1eKfGWLFKMmxFZGMYbL96zNsFdJ8iSCbrLspsipte0woH2cK
 EDDwpT6UYoEvAFa6cXSdYkhWBFWcdoEIhV00
X-Google-Smtp-Source: AMrXdXsJ68qC7p8Va1KI1LZSKLTQPnZUjiJFKJnYLoH3P8SEyDpzoJoMpMhJvw9H+69hmZ5C4mn8Sw==
X-Received: by 2002:a17:90a:db01:b0:218:8263:4aac with SMTP id
 g1-20020a17090adb0100b0021882634aacmr749871pjv.17.1671598995546; 
 Tue, 20 Dec 2022 21:03:15 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 00/14] accel/tcg: Rewrite user-only vma tracking
Date: Tue, 20 Dec 2022 21:02:59 -0800
Message-Id: <20221221050313.2950701-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6efbc:

  Merge tag 'hppa-fixes-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2022-12-20 15:32:27 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221220

for you to fetch changes up to 811242654934bd4613634235ef6a8219792ab088:

  accel/tcg: Restrict page_collection structure to system TB maintainance (2022-12-20 17:11:12 -0800)

----------------------------------------------------------------
Use interval trees for user-only vma mappings.
Assorted cleanups to page locking.

----------------------------------------------------------------
Philippe Mathieu-Daudé (5):
      accel/tcg: Restrict cpu_io_recompile() to system emulation
      accel/tcg: Remove trace events from trace-root.h
      accel/tcg: Rename tb_invalidate_phys_page_fast{,__locked}()
      accel/tcg: Factor tb_invalidate_phys_range_fast() out
      accel/tcg: Restrict page_collection structure to system TB maintainance

Richard Henderson (9):
      util: Add interval-tree.c
      accel/tcg: Rename page_flush_tb
      accel/tcg: Use interval tree for TBs in user-only mode
      accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
      accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
      accel/tcg: Move page_{get,set}_flags to user-exec.c
      accel/tcg: Use interval tree for user-only page tracking
      accel/tcg: Move PageDesc tree into tb-maint.c for system
      accel/tcg: Move remainder of page locking to tb-maint.c

 accel/tcg/internal.h            |  83 +---
 include/exec/exec-all.h         |  43 +-
 include/exec/translate-all.h    |   6 -
 include/qemu/interval-tree.h    |  99 ++++
 accel/tcg/cputlb.c              |   7 +-
 accel/tcg/tb-maint.c            | 994 ++++++++++++++++++++++++++++++----------
 accel/tcg/translate-all.c       | 811 --------------------------------
 accel/tcg/user-exec.c           | 658 +++++++++++++++++++++++++-
 tests/tcg/multiarch/test-vma.c  |  22 +
 tests/unit/test-interval-tree.c | 209 +++++++++
 util/interval-tree.c            | 882 +++++++++++++++++++++++++++++++++++
 accel/tcg/trace-events          |   4 +
 tests/unit/meson.build          |   1 +
 trace-events                    |   4 -
 util/meson.build                |   1 +
 15 files changed, 2662 insertions(+), 1162 deletions(-)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 tests/tcg/multiarch/test-vma.c
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

