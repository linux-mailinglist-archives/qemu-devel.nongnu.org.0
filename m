Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C297B661C0E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBf-0000jP-Sj; Sun, 08 Jan 2023 20:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBe-0000jH-DR
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:54 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBc-0001VP-Iz
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:54 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so11263661pjq.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+fB6VJ+YRBoF2GQRv/rrUiVp1c6UDy0LLsCyWGTU8Y=;
 b=xCOE8F4kanGPSXUlQ+2sHU4wZ7mTi3sPgkVBf91dHtQun+k7N+S/VTHeEN6fMnUENT
 9li2gdET8/MwyzGS98UwnTtibmiVRoLYHvsRi5lc6ggKohZES5s/IBzP3fpILZ4th8BB
 jcMAAAH58JqT/2pcpQ7U2JaC1J+n538UoqxDKOmxLMONaCZGypKFgGzMr4XHKuiKPHXB
 xDLZyI3PxwR+DCT6Jewe1jZYtqTQus8Z7j5PenR567B7hHwUs5FXxFbvG5hifXMegCMF
 Hqs/I80fiJAWResWPlQnhSnj+QUjc/tAIx40hlXwOoHVWYUkoWb2kKl+ILdkAQcpc8X4
 D4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+fB6VJ+YRBoF2GQRv/rrUiVp1c6UDy0LLsCyWGTU8Y=;
 b=MxGcfaOghJjU7UZhTZArnJALbLApxGnM/nLxOUSibS8Av0QK5/x6tb+7zJQIdsf16P
 DZ2godPsNs2GpT4cRBh+0VNEx6p8pMDgw26Ipab31G/FX1dfJoS2qhgoR/eyR4PRkGMe
 ypzekqVHAf0eq+oNAnaSVvE+c25Fn47Rxej+ALy93bhiijGe8BUROrZ0fnPz0qNrytQC
 J5XVLHRL62JTwO761LiOeu/M5xtkDYhqQLHGwPH3VbeEswgKaIAsZkY81ZjZK95lO2Tv
 W9JT2En+Djy03cqk79GqSPoZDvVRDFXo6aLElRU4a5Y8MRyHhIquhrvShrBmy0D6v8Mx
 4xGA==
X-Gm-Message-State: AFqh2kpWnh7dCDdDdg2txbknss365JmZ5uIBeIcAJ3vBgKKpHsmOsltb
 RJpz7+WXuE3IEBGRgC600e9pr+AHX/TpNFAs
X-Google-Smtp-Source: AMrXdXvE7qU8hbCdl9C0QejFPCpxbuWgqqel40holedTUsNDel+9mEk7vawTMeueOgEPghLEQPnl6w==
X-Received: by 2002:a17:902:bb86:b0:193:1f24:a042 with SMTP id
 m6-20020a170902bb8600b001931f24a042mr5688286pls.29.1673228570644; 
 Sun, 08 Jan 2023 17:42:50 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/22] tcg: exit_tb tidy, goto_tb reorg
Date: Sun,  8 Jan 2023 17:42:26 -0800
Message-Id: <20230109014248.2894281-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Changes for v2:
  * Rebase on master,
  * Remove if (0) accidentially left in tcg/sparc64/.


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
 tcg/aarch64/tcg-target.h         |   7 +-
 tcg/arm/tcg-target.h             |   5 -
 tcg/i386/tcg-target.h            |   9 --
 tcg/loongarch64/tcg-target.h     |   3 -
 tcg/mips/tcg-target.h            |   5 -
 tcg/ppc/tcg-target.h             |   7 +-
 tcg/riscv/tcg-target.h           |   4 -
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
 tcg/ppc/tcg-target.c.inc         | 193 +++++++++--------------------
 tcg/riscv/tcg-target.c.inc       |  65 +++++++---
 tcg/s390x/tcg-target.c.inc       |  67 +++++++----
 tcg/sparc64/tcg-target.c.inc     | 201 ++++++++++++-------------------
 tcg/tci/tcg-target.c.inc         |  31 +++--
 26 files changed, 522 insertions(+), 581 deletions(-)

-- 
2.34.1


