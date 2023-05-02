Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDE6F4294
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3d-0000cM-FM; Tue, 02 May 2023 07:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3b-0000bm-II
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3Z-0003CH-4R
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so21714125e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026424; x=1685618424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=dx9zQOBfvXZFJ4Axgi64Q8hbr+6tNTqjipB6Ifi8coc=;
 b=KXgUzYcme4747EXBjmn9jCVmdSJtD5ag555LBX2OGtCNEYBBuFP9FWwNLHbtq4cts7
 3MSf6dJiP/mmUipUwGVZ2gq0/T9Ev09c1sblCW9ayh8IzFz0CnpaR0LdSKrghf0g7Myz
 GHxDEepBg9Mgi5ul9/nzsDQ6DSv49EPkWejMpC42+l4k8SRkvAaN/a59Wa9gnIj9siqX
 QMBpBh6pwfApbASMiNDco0qdUfp7CQnX83BO7LdMJke3UKSEWkUIfru1L8E6W/h9z2Ej
 DjqKZJnYWvwQ4biydhUirKDbLbjfpAaJ6PkGpR5WjjDS0MNzPmpUgi6FIbKoRqCu4LHs
 UhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026424; x=1685618424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dx9zQOBfvXZFJ4Axgi64Q8hbr+6tNTqjipB6Ifi8coc=;
 b=NELS+dD2e0zQCh0wfoNSpDwDhPZecXbW1/3N0LRat+ZjE9tDXQVqV9MQ5oms68TMNp
 RrbBVkJBNGz0CdyucOrehS1Qdf7Z/qK//caDYUPPWiltQLKt5SCWZmBMei3zL8W5N5zf
 CEIgBlPq2QMTB6yutJ4jk9xiALnLigvGv4EiDe99McFem5DM8CNID8mni/RirM7PmYih
 OiY1vjMTcs3ZlL4XYZAymBcp6WlpuLC/aniBcIGahq0TSNwUwTBtniSmu+olBWXHlqpX
 /aaGBt69uu+Vsu891dc/uizJJeFwGORym4KdmteUuSteKYzNh1P+cNfhCYiwm1fLKb/f
 Fbyg==
X-Gm-Message-State: AC+VfDyE5HBfjIKGpPhou1ZP+3m7mCdSkxdJ/5Uf4/C7Jeeuq+QWUlmJ
 500r1+O+gIc3E2B45+W6SQhT8QAKLO/GLrIP4bQBXA==
X-Google-Smtp-Source: ACHHUZ7o3K189V4oPtnvbDS/TTF8kuvb+n5q9Tw93mtYhEs3XL57kpxK+M7eDBey8F8s8dwQ8c8YfQ==
X-Received: by 2002:a1c:4b06:0:b0:3f0:3d47:2cc5 with SMTP id
 y6-20020a1c4b06000000b003f03d472cc5mr12370944wma.10.1683026424597; 
 Tue, 02 May 2023 04:20:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] tcg patch queue
Date: Tue,  2 May 2023 12:20:11 +0100
Message-Id: <20230502112023.776823-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230502

for you to fetch changes up to bdc7fba1c5a29ae218b45353daac9308fe1aae82:

  tcg: Introduce tcg_out_movext2 (2023-05-02 12:15:41 +0100)

----------------------------------------------------------------
Misc tcg-related patch queue.

----------------------------------------------------------------
Dickon Hood (1):
      qemu/bitops.h: Limit rotate amounts

Kiran Ostrolenk (1):
      qemu/host-utils.h: Add clz and ctz functions for lower-bit integers

Nazar Kazakov (2):
      tcg: Add tcg_gen_gvec_andcs
      tcg: Add tcg_gen_gvec_rotrs

Richard Henderson (7):
      softmmu: Tidy dirtylimit_dirty_ring_full_time
      qemu/int128: Re-shuffle Int128Alias members
      migration/xbzrle: Use __attribute__((target)) for avx512
      accel/tcg: Add cpu_ld*_code_mmu
      tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
      tcg/mips: Conditionalize tcg_out_exts_i32_i64
      tcg: Introduce tcg_out_movext2

Weiwei Li (1):
      accel/tcg: Uncache the host address for instruction fetch when tlb size < 1

 meson.build                      |  5 +--
 accel/tcg/tcg-runtime.h          |  1 +
 include/exec/cpu_ldst.h          |  9 ++++++
 include/qemu/bitops.h            | 24 +++++++++-----
 include/qemu/host-utils.h        | 54 +++++++++++++++++++++++++++++++
 include/qemu/int128.h            |  4 +--
 include/tcg/tcg-op-gvec.h        |  4 +++
 accel/tcg/cputlb.c               | 53 ++++++++++++++++++++++++++++++
 accel/tcg/tcg-runtime-gvec.c     | 11 +++++++
 accel/tcg/user-exec.c            | 58 +++++++++++++++++++++++++++++++++
 migration/xbzrle.c               |  9 +++---
 softmmu/dirtylimit.c             | 15 ++++++---
 tcg/tcg-op-gvec.c                | 28 ++++++++++++++++
 tcg/tcg.c                        | 69 +++++++++++++++++++++++++++++++++++++---
 tcg/arm/tcg-target.c.inc         | 44 +++++++++++--------------
 tcg/i386/tcg-target.c.inc        | 19 +++++------
 tcg/loongarch64/tcg-target.c.inc |  4 ++-
 tcg/mips/tcg-target.c.inc        |  4 ++-
 18 files changed, 347 insertions(+), 68 deletions(-)

