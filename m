Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1652B78B6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:34:01 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIue-0002HY-Sf
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIsi-0000Km-K7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:00 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIsg-0004j2-2b
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:00 -0500
Received: by mail-pl1-x630.google.com with SMTP id y22so597521plr.6
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=dMGEEcdAdGtvuOZ3lpGvjYdytytph7Url81YTIf6eKY=;
 b=CpaVYEr2lzRghrPaPLPV5B8KL+xKQTS33Mc4vx3JLKwi+lQFffUkjpZjVEXraopjyP
 tQD9pO9cHhFeCSSQcGaCWABCgKPfdx8Ev1X+g4zA8N9E9bNIId2fv26A2gETYC+VD2Kb
 TMok00MBrSnnCZYawTnB0VP5m2v5kq4o8pF428ozu0E7cVLI0QwqQD3F/dLZLoYmoVcm
 fOsK9pzazBTuhgH/ULV0jujMciCi9s7JUhp1UDvD/FqakQLMXoYdpPiF1719kEuIwq2I
 mk/quZ9QClo9mAkoWqAyCqv7in6m16XpqpdBV81OQ7VH6wGu8lH55Cpq5gX67U0b8sWU
 ogeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dMGEEcdAdGtvuOZ3lpGvjYdytytph7Url81YTIf6eKY=;
 b=hnXyQvc6IeGW5B4DtBeIvDlq7f99O/xIunrBwi7P3MAlIZLX12Vrd3vzMe1R811e2N
 i2MiV8jaPNRo4x4UKIhVmo6wQk9tbBo8s7BfLOYEab7+3kBex5C041gW7jw4r7fqyO2H
 DJgN2WyVoWhQeTbdRWvPC4VRfpo7zrJQK/4Apmhria2NjGTGgwjCnOUpSxTyZ6h3Q3D4
 hOJnAlUcNsyFEit1kfR2crTaBTR8hnxZXBN9KvDF0sAOmEOl3F+h+ZEUUP613J33e/uB
 Dx46QtvXw1BowrloRRvlQcikddXyyOePbxC/ImUwBtNW+d5s3DQhZYMv8a6GuzcGBgKg
 COcQ==
X-Gm-Message-State: AOAM533wQaOQYJQZZ1PWJchNArwJRjUczqT2RNx4uu33uwrl1xM1+Pno
 MIdYIDG2moAIMzwTp8KgqoF04wXAC/MdIBLMAIM=
X-Google-Smtp-Source: ABdhPJxJHTM6fsrZpsJ28UOG7WERcQUJc86TnV0dgx/suMJkUTQxA3tBfz+CqboywVc0nnTba1rmxw==
X-Received: by 2002:a17:90b:38e:: with SMTP id
 ga14mr2863244pjb.45.1605688315913; 
 Wed, 18 Nov 2020 00:31:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:31:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 00/15] support subsets of bitmanip extension
Date: Wed, 18 Nov 2020 16:29:38 +0800
Message-Id: <20201118083044.13992-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension latest draft version
(2020.10.26) Zbb, Zbs and Zba subset instructions.

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-draft.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v1

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.


Frank Chang (2):
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine

Kito Cheng (13):
  target/riscv: reformat @sh format encoding for B-extension
  target/riscv: rvb: count leading/trailing zeros
  target/riscv: rvb: count bits set
  target/riscv: rvb: logic-with-negate
  target/riscv: rvb: pack two words into one register
  target/riscv: rvb: min/max instructions
  target/riscv: rvb: sign-extend instructions
  target/riscv: rvb: single-bit instructions
  target/riscv: rvb: shift ones
  target/riscv: rvb: rotate (left/right)
  target/riscv: rvb: address calculation
  target/riscv: rvb: add/sub with postfix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          | 128 +++++
 target/riscv/cpu.c                      |   4 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  37 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 475 +++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 597 ++++++++++++++++++++++++
 9 files changed, 1301 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


