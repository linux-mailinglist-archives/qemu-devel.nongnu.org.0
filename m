Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A26CB089
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEa-00042e-9v; Mon, 27 Mar 2023 17:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEX-00042B-Gn
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEV-0005ur-MX
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so13165971pjt.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+PLQMlzLYIhh5emuU+LY0b1ADSzwX5G0kGRiG5iIMo=;
 b=w0g7sEXtm6fbvKG8DVUeN39hlBJyyxV+QFCchSZ/4L5m+CqBZ2B0JbSyTeF5c8XaMs
 y3qGEoxSeDczgHyU/ec2p73+KDrPuf20J0FR30/qHu4IC6XuWaPrOlrGvNZmU5r085ma
 SsYLVImivFPgi1kLdZLSVnuwXo6LcaUDIaL/1BLsd7KCcWWO4ldqMvxbXziaFzsAL/o/
 7wiXZtXgKMAFTrstM1BeECXQvEanC0defRxSS5DajrIJzfkz6wKOmQ4WlBW1GPu4wubC
 YhH2uj/c9/W11zdaf99HUj6uTfQnBBDEDZpwasiETNwZTgashNhfb7rGTfEsUYp6ntSf
 Qtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+PLQMlzLYIhh5emuU+LY0b1ADSzwX5G0kGRiG5iIMo=;
 b=wgqoXBTJ+15e4GJQKtYseXEOJyfJPDCDLVAwGyfFWhpRxiLX1aIoyBY8KFICNR8Ye9
 w5L2qBZJcIk2kcSBRm99ky6jkESJCbUuSy3JwcVfpEFTfkP5lOFIrqFVlbDWeOkLCali
 8JrIfTlT8GluIB1hXN1/dU8EcJ1D0pbBUXHQiNCv1iMbH+2ybd5MEzTvDNZgZs19uR0q
 AHNd6E4QRQxtPoB2wKh0bXpeGGX9bO7ZPDHVomWL8WeEIzA4aiTohObESv+VC/k4Bm/c
 Nnljj6h6qDswWkxTaxCrru/iPbGdV2tUYsTmIH9fFOcR0cQfgycHjKZTobbaAfhgWOWE
 Bu/w==
X-Gm-Message-State: AAQBX9fDbZ4oE+5k5NaXs5QFAVQPqPHl96Jq0r+AEGjBxQ4LaXhUhJRe
 PL0r4/g1qOs9BAGgeirO95LwrvDqUCmFh+DwU18=
X-Google-Smtp-Source: AKy350Z1TC4PlPeWAo3nKRG5yNthlSqGM2I3JleFJThFbDmWSXIrjiQa6j75Tr50o8STzD82i+08Vw==
X-Received: by 2002:a17:90b:4c8b:b0:23f:44da:208d with SMTP id
 my11-20020a17090b4c8b00b0023f44da208dmr15074002pjb.47.1679951906051; 
 Mon, 27 Mar 2023 14:18:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 00/12] tcg patch queue
Date: Mon, 27 Mar 2023 14:18:12 -0700
Message-Id: <20230327211824.1785547-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Changes from v1:
  * Patch 10 is new, avoiding an overflow in probe_guest_base,
    visible with aarch64 host, --static --disable-pie, exposed
    by the placement of the host binary in the address space.

r~

Emilio Cota (2):
  util: import GTree as QTree
  tcg: use QTree instead of GTree

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
 linux-user/elfload.c        |   72 +-
 linux-user/flatload.c       |    2 +-
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
 24 files changed, 2415 insertions(+), 150 deletions(-)
 create mode 100644 include/qemu/qtree.h
 create mode 100644 tests/bench/qtree-bench.c
 create mode 100644 tests/unit/test-qtree.c
 create mode 100644 util/qtree.c

-- 
2.34.1


