Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2264F14B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fpp-0000L3-AH; Fri, 16 Dec 2022 13:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpd-0000Hj-LD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:21 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpb-0003EY-QV
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:17 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso3288243pjh.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tuDuCTxGOZ/turMwVgm9n+iH3Vv1E6VEpV3ZO/ITrnk=;
 b=xATaUElyDtzRYC6UXiUOQuRgmIGsnDfifZak9dWcKnICRdNz6MQXi4UIZA51jmR9gM
 ZOU36dLoCRag9snNnwXB0TQvhrCgHVmtl+qLBliizXOuVS9WxNGa6xPWD40FYXvVcTfa
 nOiL8odX3zmGEnLseJEmf85yYPSZji3Gb+5FOh22liDIGQRrweLsIasjsrGo0t5nnsC/
 2ipPHi77JAfvvtg49fl3u15CeVY7AO+HWIlcFrjpV2GoDxe0ZHMMk8drPSouwhi1NtSO
 pCctSO7Fnw5NKImBNNH5RS3PU8qfqBjuwQpq/OVrMusK9gOKtRiOaIq8iAkQuI7Eovgh
 9x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuDuCTxGOZ/turMwVgm9n+iH3Vv1E6VEpV3ZO/ITrnk=;
 b=F2Vm+cmnyd3+m8wphjhgCezGUw8QBTAZsrR77S+Ep4e15qCEarIaTkhengbvk2Uz6Y
 F18tmKmBnvIE8DFyfe2W3RNPI3412luVmltXKm71DWyN+JgTVt5E4xSEzxtUJbE03m38
 VO875vs7JrqG0k3eCyz5qUkjw24L58PDRllhrP/aHc+DxkguYSv/8uSow7FE6/mvbgGn
 kHjbVjJpB7OmrdrVcJStx6OAdXtmL5IMrZGo4jMDEx/DngxlMqL706GsHi/Fb8zfR1Ng
 KWaKunDBhhE1dGIhZzxvoInMyLrvoxG1qZEQG+d5SzIV79g5IFgt/aVwQY/EemRkJL9H
 QOBQ==
X-Gm-Message-State: ANoB5png/uHhBcB6uUd3/xgHOpqRGZj33REiE0WkQutRVXNdugAbuV8f
 IR81iAz+2MlH3g2xazJpUaIZOlOk4hG3cwPG
X-Google-Smtp-Source: AA0mqf5MxnnWzsEFpwMUjB3YyUyUdZ5nnL/7J7VskRoEXO2w+jG3RsTaTsf2Q8itSKxwmPcL0+xUpQ==
X-Received: by 2002:a05:6a20:e60e:b0:a7:8d78:6069 with SMTP id
 my14-20020a056a20e60e00b000a78d786069mr40719131pzb.57.1671216792523; 
 Fri, 16 Dec 2022 10:53:12 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/13] accel/tcg: Rewrite user-only vma tracking
Date: Fri, 16 Dec 2022 10:52:52 -0800
Message-Id: <20221216185305.3429913-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:

  Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221216

for you to fetch changes up to a9d0226381d6d70a9c1901ad1480961c93de8b8d:

  accel/tcg: Restrict page_collection structure to system TB maintainance (2022-12-16 10:09:51 -0800)

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

Richard Henderson (8):
      util: Add interval-tree.c
      accel/tcg: Rename page_flush_tb
      accel/tcg: Use interval tree for TBs in user-only mode
      accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
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
 accel/tcg/translate-all.c       | 746 ------------------------------
 accel/tcg/user-exec.c           | 658 +++++++++++++++++++++++++-
 tests/tcg/multiarch/test-vma.c  |  22 +
 tests/unit/test-interval-tree.c | 209 +++++++++
 util/interval-tree.c            | 882 +++++++++++++++++++++++++++++++++++
 accel/tcg/trace-events          |   4 +
 tests/unit/meson.build          |   1 +
 trace-events                    |   4 -
 util/meson.build                |   1 +
 15 files changed, 2662 insertions(+), 1097 deletions(-)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 tests/tcg/multiarch/test-vma.c
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

