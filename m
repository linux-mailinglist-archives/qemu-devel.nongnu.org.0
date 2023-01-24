Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD1678DDF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gW-0008Mz-Ez; Mon, 23 Jan 2023 21:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gU-0008Mk-CA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:14 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gS-0003m4-Kt
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:14 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 b24-20020a17090a551800b0022beefa7a23so309168pji.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9JRd0oYcShkUVxwrdxGixPt3BC5iKHXkm/SWl8UGf5I=;
 b=xKwjNlc1mFc4TKLJw4zrtFhMS3iSZxPVrmlxYwznYJQmMmwwggR/09MQb+BlxJ/1Dt
 IJBEayWm0sDJdt/mAp6U+ILbBXkeU0o3EOKEyaaLvf6oDzLXOiuuS/QOYZqwv9CDxGPP
 Jhcpz7dsiptjCu0nNIF7/MzjlVCQNNKmqnjWYvEgEfpMkJ0L3x/oR212yMF7bv+YTjiz
 aDQGSULTDHjaX1viz0WidUfRoChTqxbgdBwaWhRDBpaaJolfh1ZvEEh2MxorPupFa8zd
 vfDUCuT2v4dphZ4nSLn9PfdrqpmwlkVpGAcxy+ynFizbVvEDFXcwDkjmhQGqaGAIRp4D
 JuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JRd0oYcShkUVxwrdxGixPt3BC5iKHXkm/SWl8UGf5I=;
 b=uhgxmLImknuLCYgq/KJOE5sE5ImADD9GjOGi2KfYWOZZjIGuTU4R7dSp8or8miLlK3
 SShPR7vzrdB0msZYTCp/mtITcooM7E/wIbtSwgGbmKc6rMPNHK34vxLABFOh+DIWxyy4
 CeL0sO/Wld84c6+AX4Hq2i4MnDorf2xPmRh31RNJFFYt154N+VFraUcdiqDhKaHv/7S6
 sZOzlYhAyAIu2e3iDHzfgZWzeD2sYnciuCUvmjEeumUZ2YWpVF7tmmFH/PsfeAT0WEhw
 EwwaHtkSYGadNcTgzCgVjIs3vbrw9V2i433OzFBxNgyIU9L3jHuj9uKhyg16Ci8kOonV
 Q4Aw==
X-Gm-Message-State: AFqh2krcEAxl3Lv3RsmZ0RtmCDUPHnSyLk4DWtIY1fvW29RlZFRkpzWM
 z4sSKwvcnKVvTbIHO4QwgflanyPhScqs8VMj
X-Google-Smtp-Source: AMrXdXvH/pjVXeWf5AV6vh5QEBAL2czDQDj0nUjblrb1dGfV7DoHLHxuf3Jf6OWMJxRBlGkYvmjADA==
X-Received: by 2002:a05:6a21:998d:b0:b8:4ced:c326 with SMTP id
 ve13-20020a056a21998d00b000b84cedc326mr38058743pzb.7.1674525910833; 
 Mon, 23 Jan 2023 18:05:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 00/15] tcg patch queue
Date: Mon, 23 Jan 2023 16:04:52 -1000
Message-Id: <20230124020507.3732200-1-richard.henderson@linaro.org>
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

Second try's the charm today, right?


r~


The following changes since commit 00b1faea41d283e931256aa78aa975a369ec3ae6:

  Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-23 13:40:28 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230123

for you to fetch changes up to 709bcd7da3f6b4655d910634a0d520fa1439df38:

  tcg/loongarch64: Reorg goto_tb implementation (2023-01-23 16:00:13 -1000)

----------------------------------------------------------------
common-user: Re-enable ppc32 host
tcg: Avoid recursion in tcg_gen_mulu2_i32
tcg: Mark tcg helpers noinline to avoid an issue with LTO
tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
disas: Enable loongarch disassembler, and fixes
tcg/loongarch64: Improve move immediate
tcg/loongarch64: Improve add immediate
tcg/loongarch64: Improve setcond
tcg/loongarch64: Implement movcond
tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
tcg/loongarch64: Reorg goto_tb implementation

----------------------------------------------------------------
Richard Henderson (14):
      tcg: Avoid recursion in tcg_gen_mulu2_i32
      tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
      common-user/host/ppc: Implement safe-syscall.inc.S
      linux-user: Implment host/ppc/host-signal.h
      tcg: Mark tcg helpers noinline to avoid an issue with LTO
      target/loongarch: Enable the disassembler for host tcg
      target/loongarch: Disassemble jirl properly
      target/loongarch: Disassemble pcadd* addresses
      tcg/loongarch64: Update tcg-insn-defs.c.inc
      tcg/loongarch64: Introduce tcg_out_addi
      tcg/loongarch64: Improve setcond expansion
      tcg/loongarch64: Implement movcond
      tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
      tcg/loongarch64: Reorg goto_tb implementation

Rui Wang (1):
      tcg/loongarch64: Optimize immediate loading

 include/exec/helper-proto.h                    |  32 ++-
 include/tcg/tcg.h                              |   7 -
 linux-user/include/host/ppc/host-signal.h      |  39 +++
 tcg/arm/tcg-target-con-set.h                   |   7 +-
 tcg/arm/tcg-target-con-str.h                   |   2 +
 tcg/loongarch64/tcg-target-con-set.h           |   5 +-
 tcg/loongarch64/tcg-target-con-str.h           |   2 +-
 tcg/loongarch64/tcg-target.h                   |  11 +-
 target/loongarch/insns.decode                  |   3 +-
 disas.c                                        |   2 +
 target/loongarch/disas.c                       |  39 ++-
 tcg/tcg-op.c                                   |   4 +-
 target/loongarch/insn_trans/trans_branch.c.inc |   2 +-
 tcg/arm/tcg-target.c.inc                       |  28 +-
 tcg/loongarch64/tcg-insn-defs.c.inc            |  10 +-
 tcg/loongarch64/tcg-target.c.inc               | 364 ++++++++++++++++---------
 common-user/host/ppc/safe-syscall.inc.S        | 107 ++++++++
 target/loongarch/meson.build                   |   3 +-
 18 files changed, 497 insertions(+), 170 deletions(-)
 create mode 100644 linux-user/include/host/ppc/host-signal.h
 create mode 100644 common-user/host/ppc/safe-syscall.inc.S

