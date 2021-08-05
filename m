Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219D3E0C89
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 04:56:32 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBTYc-0004yW-M2
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 22:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTXP-00043D-29; Wed, 04 Aug 2021 22:55:16 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:49862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTXL-0004zf-TS; Wed, 04 Aug 2021 22:55:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2728854|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0104754-0.000411257-0.989113;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvY9egp_1628132099; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvY9egp_1628132099)
 by smtp.aliyun-inc.com(10.147.41.121);
 Thu, 05 Aug 2021 10:55:00 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 00/13] Support UXL field in mstatus 
Date: Thu,  5 Aug 2021 10:52:59 +0800
Message-Id: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=115.124.28.147; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-147.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set implements UXL field in mstatus register. Programmer can change
UXLEN by writting to this field. So that you can run a 32 bit program
on a 64 bit CPU.

This patch set depends on one patch set by Richard Henderson
https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00059.html.

LIU Zhiwei (13):
  target/riscv: Add UXL to tb flags
  target/riscv: Support UXL32 for branch instructions
  target/riscv: Support UXL32 on 64-bit cpu for load/store
  target/riscv: Support UXL32 for slit/sltiu
  target/riscv: Support UXL32 for shift instruction
  target/riscv: Fix div instructions
  target/riscv: Support UXL32 for RVM
  target/riscv: Support UXL32 for vector instructions
  target/riscv: Support UXL32 for atomic instructions
  target/riscv: Support UXL32 for float instructions
  target/riscv: Fix srow
  target/riscv: Support UXL32 for RVB
  target/riscv: Changing the width of U-mode CSR

 target/riscv/cpu.h                      |  18 +++
 target/riscv/csr.c                      |  42 +++++-
 target/riscv/insn_trans/trans_rva.c.inc |  36 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc |  51 +++++--
 target/riscv/insn_trans/trans_rvd.c.inc |   4 +-
 target/riscv/insn_trans/trans_rvf.c.inc |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc |  62 ++++++--
 target/riscv/insn_trans/trans_rvm.c.inc |  24 ++-
 target/riscv/insn_trans/trans_rvv.c.inc |  44 +++---
 target/riscv/translate.c                | 186 ++++++++++++++++++++----
 target/riscv/vector_helper.c            |  54 +++++--
 11 files changed, 414 insertions(+), 111 deletions(-)

-- 
2.17.1


