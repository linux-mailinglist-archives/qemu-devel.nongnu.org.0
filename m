Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FF50E304
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:25:45 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizeq-0000py-QN
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY4-0007HN-Q1; Mon, 25 Apr 2022 10:18:45 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY2-0003PN-3C; Mon, 25 Apr 2022 10:18:44 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A340711EE04;
 Mon, 25 Apr 2022 14:18:39 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 25 Apr 2022 14:18:39 +0000
Subject: [PATCH qemu 0/9] Add mask agnostic behavior for rvv instructions
MIME-Version: 1.0
Message-ID: <165089631935.4839.7564289944057093570-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: ~eopxd <yueh.ting.chen@gmail.com>
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to v-spec, agnostic elements can be either kept as undisturbed
or set elements' bits to all 1s. To distinguish the difference of mask
policies, QEMU should be able to simulate the mask agnostic behavior as
"set masked-off elements' bits to all 1s". An option 'rvv_ma_all_1s' is
added to enable the behavior, it is default as disabled.

This patch set is based on the patch set "Add tail agnostic behavior for
rvv instructions".
Based on: <164863587444.17401.9965527486691250478-0@git.sr.ht>

Yueh-Ting (eop) Chen (9):
  target/riscv: rvv: Add mask agnostic for vv instructions
  target/riscv: rvv: Add mask agnostic for vector load / store
    instructions
  target/riscv: rvv: Add mask agnostic for vx instructions
  target/riscv: rvv: Add mask agnostic for vector integer shift
    instructions
  target/riscv: rvv: Add mask agnostic for vector integer comparison
    instructions
  target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic
    instructions
  target/riscv: rvv: Add mask agnostic for vector floating-point
    instructions
  target/riscv: rvv: Add mask agnostic for vector mask instructions
  target/riscv: rvv: Add mask agnostic for vector permutation
    instructions

 target/riscv/cpu.c                      |   1 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  32 +++++
 target/riscv/internals.h                |   5 +-
 target/riscv/translate.c                |   2 +
 target/riscv/vector_helper.c            | 159 ++++++++++++++++++++++--
 7 files changed, 189 insertions(+), 14 deletions(-)

-- 
2.34.2

