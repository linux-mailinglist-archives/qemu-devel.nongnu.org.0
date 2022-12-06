Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EB643C28
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POd-0003Lf-Ue; Mon, 05 Dec 2022 23:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POY-0003Ku-Su
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:27 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POT-0006vR-Q5
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:23 -0500
Received: by mail-oi1-x235.google.com with SMTP id m204so15581442oib.6
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3BIGT1pZ45/j9LT4r8cYsIqb+kv0UcAVp4YvlVRfdVU=;
 b=DAGUKcFlGlwkxztC9FepWm9gVfHmCd4zHti4yawFEIkrIezt9XoFJFtTZtUWMZAym6
 o0jyfqPMwPzhmsalukkILto1Uk4GKvuz6HlVQq9junYtjWfUIi4jWL9E7z4DhOphKX34
 1FujTtmBoxmKf3FmdfQUkc8l0fKMapBAbCVrWl6AcBMmt5Cb/GiNrtno1yKc7JaWoi0k
 r8RVy+gFBebGqTbmG4VL/emLSuTuotsLlE9zC+hdG1E4wPIK7r5X8MceYiyEpWjLQis2
 EjdlDIukA9ZxJHHzN13+B1pzywdZWKYdpeX7hCo0CToYWlhBww1roU2GvoY6M6aCYf68
 ZNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3BIGT1pZ45/j9LT4r8cYsIqb+kv0UcAVp4YvlVRfdVU=;
 b=WbPnl8ELlxFazQ8pF6FMtphBQTkSrhCF0khnPtAp8WSsFsdELV8LuJwKAwkQtba8Mj
 7Fymuew5qF/Wp2yvKXURiObsw/4fSBorexnqLz0RG6xSvV4wFunUrouksETPWc6r8W++
 +0xWi2h3yH8fos36BBqQ/N4XF/rA6xqTFm+1y1TAj2bNHg7SapPrpvkaZQPP29ybneDN
 MiemnNZ4/4Sz/N1gmBkMBGhz+g+1vHjUz3thsiMlk9JrC2QYyv40NrCuiaeoditbgtTo
 vKDjMeC2qgfH8clpUjszr+OX7W+veExmGVMj9usngh5BfP42NQrLA+dWQ+OzpCuMtYcP
 1XOA==
X-Gm-Message-State: ANoB5pmjPrxA9C92xidEO+NF0u1PPpSeD4q3F5JrzqdzoaRSdKRMNgfr
 8G+ot487itZ0BUNGKRP32e7hAZ8yeV9xqONpw88=
X-Google-Smtp-Source: AA0mqf59y3GKBcTf6dLxASmeKIGGifT+Jyd+MWWIC42oQVxfdd0rO4j/EsqcfR+Vrs5RTD/2WyMtxw==
X-Received: by 2002:a05:6808:16a9:b0:35a:76f3:f550 with SMTP id
 bb41-20020a05680816a900b0035a76f3f550mr41550447oib.219.1670300238756; 
 Mon, 05 Dec 2022 20:17:18 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 00/22] tcg: exit_tb tidy, goto_tb reorg
Date: Mon,  5 Dec 2022 22:16:53 -0600
Message-Id: <20221206041715.314209-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

Small patch for exit_tb.  Large reorg for goto_tb, primarily aimed at
fixing a race condition in which a host thread gets suspended in the
middle of executing a two insn sequence, and the sequence is updated.
The updated second insn does not match the previous first insn, so
when the thread restarts the entire sequence will not branch to either
the old or the new destination.

The middle-end is adjusted to support both direct and indirect jumps
simultaneously, instead of depending on TCG_TARGET_HAS_direct_jump.
This allows the backend to decide whether to use direct or indirect
based on the branch displacement.  Which allows us to only update a
single instruction, which means there's no multi-insn sequence that
can be interrupted.

This patch set fixes all except loongarch64, which will follow
separately along with other cleanup.


r~


Richard Henderson (22):
  tcg: Split out tcg_out_exit_tb
  tcg/i386: Remove unused goto_tb code for indirect jump
  tcg/ppc: Remove unused goto_tb code for indirect jump
  tcg/sparc64: Remove unused goto_tb code for indirect jump
  tcg: Replace asserts on tcg_jmp_insn_offset
  tcg: Introduce set_jmp_insn_offset
  tcg: Introduce get_jmp_target_addr
  tcg: Split out tcg_out_goto_tb
  tcg: Rename TB_JMP_RESET_OFFSET_INVALID to TB_JMP_OFFSET_INVALID
  tcg: Add gen_tb to TCGContext
  tcg: Add TranslationBlock.jmp_insn_offset
  tcg: Change tb_target_set_jmp_target arguments
  tcg: Move tb_target_set_jmp_target declaration to tcg.h
  tcg: Always define tb_target_set_jmp_target
  tcg: Remove TCG_TARGET_HAS_direct_jump
  tcg/aarch64: Reorg goto_tb implementation
  tcg/ppc: Reorg goto_tb implementation
  tcg/sparc64: Remove USE_REG_TB
  tcg/sparc64: Reorg goto_tb implementation
  tcg/arm: Implement direct branch for goto_tb
  tcg/riscv: Introduce OPC_NOP
  tcg/riscv: Implement direct branch for goto_tb

 include/exec/exec-all.h          |   5 +-
 include/tcg/tcg.h                |  14 +--
 tcg/aarch64/tcg-target.h         |   6 +-
 tcg/arm/tcg-target.h             |   5 -
 tcg/i386/tcg-target.h            |   9 --
 tcg/loongarch64/tcg-target.h     |   3 -
 tcg/mips/tcg-target.h            |   5 -
 tcg/ppc/tcg-target.h             |   7 +-
 tcg/riscv/tcg-target.h           |   5 +-
 tcg/s390x/tcg-target.h           |  11 --
 tcg/sparc64/tcg-target.h         |   4 -
 tcg/tci/tcg-target.h             |   4 -
 accel/tcg/cpu-exec.c             |  16 ++-
 accel/tcg/translate-all.c        |  10 +-
 tcg/tcg-op.c                     |  14 +--
 tcg/tcg.c                        |  42 +++++--
 tcg/aarch64/tcg-target.c.inc     | 104 ++++++++--------
 tcg/arm/tcg-target.c.inc         |  89 +++++++++-----
 tcg/i386/tcg-target.c.inc        |  68 ++++++-----
 tcg/loongarch64/tcg-target.c.inc |  66 +++++-----
 tcg/mips/tcg-target.c.inc        |  59 +++++----
 tcg/ppc/tcg-target.c.inc         | 193 ++++++++++-------------------
 tcg/riscv/tcg-target.c.inc       |  65 ++++++----
 tcg/s390x/tcg-target.c.inc       | 106 +++++++++-------
 tcg/sparc64/tcg-target.c.inc     | 200 ++++++++++++-------------------
 tcg/tci/tcg-target.c.inc         |  31 +++--
 26 files changed, 544 insertions(+), 597 deletions(-)

-- 
2.34.1


