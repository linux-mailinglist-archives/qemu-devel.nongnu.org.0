Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F4373F53
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:13:22 +0200 (CEST)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leK9J-0003JV-Rn
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2h-0005DW-W2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2e-0002CL-V6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i13so2453097pfu.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=cdni221sQs4ZR75/eR5WZWJPxuAbYI8k+G/bRDKNue0=;
 b=HZY92WJItqzrh55JC5d3dF5clFNYC5JozoxArGu5/RRUXQHrzhbBjxoPjCpiIwn3Ys
 BXB/nspHrrjzIURdsG+qParfbET/vzekGFkLSZ8gT/ZhqYHysIWOo67WOB6tHEchFjUX
 voxYRIDAbVaBucHxX6u27UeoLlXlwm4N1gGlTVi7qfmZGc7BxVnCYFlYj9T9D78PKkKU
 euuy9F1RieBIv/A3YqOBvUUg4rpWQX00RYTXzigXD83gg0kGE8VXgomHNxORphc01+Rq
 IeGiVHiYkcryk1cfPKl6+a8kLfpChDlMEvcKeEqb9HcWjhZBxlTK0G/DXDUi5VFmQLCt
 BCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cdni221sQs4ZR75/eR5WZWJPxuAbYI8k+G/bRDKNue0=;
 b=kCzSiqFkj8Zw5AzMERLwWxqEZSLE7JJgdiP4aEPjACDYzEicVFOYbnwkMJhbPUCj4x
 ke/xiOcn4nCv6Fa2dYdM5DHOCQJITNtSUZMAsu3ctUaOpbFlyBwFnErxJmkIRfAa9xcy
 IM2IogoQqZ/QFZ1CyrEO1IC9LGrqT5wt+NM2KATLQafqtUaLNH+I8UeOqF/HBANJwKmv
 t3ZxiQ8d9BhEDd6w5iItYYUJSBO/Q222s5NH1CuN4ejMfT6WE+qjNZzfb6FdgsJlwS3P
 0uGwo8bE6McyjkQZVFpjlWAbLOp6piJMZNaUqHDD6LJL74nfRM1BSGZjg3420CFtA2/E
 1fiA==
X-Gm-Message-State: AOAM533CtO9n3UFa9wiRQflYQqfRZncdxxixv/f+ONLXUi7QrJj4HjrV
 +DhiYa4NadDtuJ/vxLoPBRk+8xmS8WKc/BpF
X-Google-Smtp-Source: ABdhPJzlPmkwM3FNOmjxZZ5a94H/Etd4+AJwVN00m/ey6lmqxde/Yx3CLiTHQkNaBF71B2cV0jphmw==
X-Received: by 2002:a65:4048:: with SMTP id h8mr29144719pgp.123.1620230785662; 
 Wed, 05 May 2021 09:06:25 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 00/17] support subsets of bitmanip extension
Date: Thu,  6 May 2021 00:06:01 +0800
Message-Id: <20210505160620.15723-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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

This patchset implements RISC-V B-extension v0.93 version Zba, Zbb and
Zbs subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zba-, Zbb- and Zbs-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v6

To test rvb implementation, specify cpu argument with 'x-b=true' or
'x-b=true,bext_spec=v0.93'to enable B-extension support.

Changelog:

v6:
 * rebase riscv-to-apply.next branch.
 * remove all #ifdef TARGET_RISCV64 macros.

v5:
 * add bext_spec cpu option, default set to v0.93.
 * rebase master branch.

v4:
 * Remove 'rd != 0' checks from immediate shift instructions.

v3:
 * Convert existing immediate shift instructions to use gen_shifti()
   and gen_shiftiw() interfaces.
 * Rename *u.w instructions to *.uw.
 * Rename sb* instructions to b*.
 * Rename pcnt* instructions to cpop*.

v2:
 * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
 * Remove addwu, subwu and addiwu instructions as they are not longer
   exist in latest draft.
 * Optimize implementation with cleaner tcg ops.

Frank Chang (6):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: single-bit instructions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine
  target/riscv: rvb: add b-ext version cpu option

Kito Cheng (11):
  target/riscv: reformat @sh format encoding for B-extension
  target/riscv: rvb: count leading/trailing zeros
  target/riscv: rvb: logic-with-negate
  target/riscv: rvb: pack two words into one register
  target/riscv: rvb: min/max instructions
  target/riscv: rvb: sign-extend instructions
  target/riscv: rvb: shift ones
  target/riscv: rvb: rotate (left/right)
  target/riscv: rvb: address calculation
  target/riscv: rvb: add/shift with prefix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          |  90 +++++
 target/riscv/cpu.c                      |  27 ++
 target/riscv/cpu.h                      |   5 +
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |  87 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc | 438 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 306 +++++++++++++++++
 9 files changed, 958 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


