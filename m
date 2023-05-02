Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C96F4B3A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:18:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwSB-0001lH-6a; Tue, 02 May 2023 16:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwS9-0001l7-GC
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:18:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwS7-00020I-OU
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:18:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30639daee76so797848f8f.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683058700; x=1685650700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GKKjWxmUfJat17opiEK5bVzsyD7FAFzu17pLU34fGsM=;
 b=bBjJXIXeGEO7Zx8/LwaMVDjwu3i+M5/YuYLurqg/DSvFQm46drtlULkraoZQzPnn7n
 eTWaENUqeC0NR3B5UOOho5B+Csxg2j75ocVUqGveksDCssL+JxGTCWNvU7TQkrcFmLqa
 uJA+SdMWoxFlY9VED2O7cj2F0OB58GzXidlKjSPpW2xhokPtw2yDU+kePMFdpfQgC5Uw
 CGdN7hR3/wfB765Rt/fKwQk7Q7iKD5oye6oTFX2pQwGbWufaJfaKz1uQdEmiTcwwr43D
 OSUqQ/KhKW1s8LZEYvCvriYZGuStbHGShV/bj/ikGVck/xQx0I22ZjBAnsL8s5bINphP
 y6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683058700; x=1685650700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKKjWxmUfJat17opiEK5bVzsyD7FAFzu17pLU34fGsM=;
 b=g5JTfJhwY3FTNm8OsbdVwMWG0qKe/3+59S0VruYPnxspytqFhZMQcE9pIqIVo6KKhT
 Zlk/BTMDRktS7jg8zdvHTbTnwG1VB6BJ45FE9kNY2dQuioGudVeInovlw7srBpZY76jp
 WCXmnww/1BsAAJa8d5LK9CjDCUeL/UeVTUJY42kXtrGRaa77N+qUoGQ4lCKt+Ai3wuDS
 d5d0KxY8A/quoE0IHllA4gBH9PzgPRCQrGjwPM8kQDlTCOwJWB4ApeGaNWAsD+3FounJ
 6GCCSoB9toxWxdDRDXXJneOrVqBex2AIiPnV6EEP7xHSEgGtBqb7EVd7GGdYV1WIuqdz
 sGrg==
X-Gm-Message-State: AC+VfDzj2CDCwOn1RIvR2lQ0BbflVJdz4V9iUfuIzy4L01vXBXWQEFYL
 pRWS7s0zY1rKuAZvfdt5NKSlAUGCzSJkxGi5tIN9Ew==
X-Google-Smtp-Source: ACHHUZ4Z5j8jAGpJXiqjb/KcGjP4OQwbCLBQiSSYK7zlx3502nVp4XN4oaNCMqe1av8JY32nvPUJ0Q==
X-Received: by 2002:adf:fa42:0:b0:306:2713:8088 with SMTP id
 y2-20020adffa42000000b0030627138088mr8172361wrr.25.1683058700038; 
 Tue, 02 May 2023 13:18:20 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:5063:9fcd:f6cc:e52d])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm22479765wrs.67.2023.05.02.13.18.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:18:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/12] tcg patch queue
Date: Tue,  2 May 2023 21:18:17 +0100
Message-Id: <20230502201818.1726224-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

The following changes since commit c586691e676214eb7edf6a468e84e7ce3b314d43:

  Merge tag 'pull-target-arm-20230502-2' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-05-02 16:38:29 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230502-2

for you to fetch changes up to 129f1f9ee7df77d367d961b3c25353612d33cd83:

  tcg: Introduce tcg_out_movext2 (2023-05-02 13:05:45 -0700)

----------------------------------------------------------------
Misc tcg-related patch queue.

v2: Update bitops.h rotate patch.

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
 include/qemu/bitops.h            | 16 +++++-----
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
 18 files changed, 339 insertions(+), 68 deletions(-)

