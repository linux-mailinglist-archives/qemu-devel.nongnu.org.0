Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF616ACB62
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZF1G-00055J-3g; Mon, 06 Mar 2023 12:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pZF10-0004x1-Ud
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:52:50 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pZF0x-0002oT-PF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmf0xwa1JQ1v8a9gRtU1C277VJVdj+ZIcd/V/LuMuCw=; b=SBPN9C6wyIEvqVkbRmyl1vrezb
 RDhGR0UKfa/BtiCpVdBl0dq6j75v4ykibWfPm4QGNrjQWGOapZTfFkext+HqQjAo+beB4vVo0/7aL
 fJA72GClwNhqD5IrA6qw8Q0KGWlW4suxPBUjcvcf5oC2++rDbME2b6Faiow1UPb8Magc=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH 00/23] Fix NB_MMU_MODES to 16
Date: Mon,  6 Mar 2023 18:52:07 +0100
Message-Id: <20230306175230.7110-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
macro is no longer target-specific.  16 mmu modes is large enough to
cover all currently supported targets (12 arm, 10 ppc, ...), and is the
maxiumum supported by the softmmu tlb api.

As mentioned by Richard in response to our RFC, softmmu tlbs are
dynamically resized and so the overhead of an unused mmu index is fairly
low.

The grand goal is to allow for heterogeneous QEMU binaries
consisting of multiple frontends.

RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html

Anton Johansson (23):
  include/exec: Set default `NB_MMU_MODES` to 16
  target/alpha: Remove `NB_MMU_MODES` define
  target/arm: Remove `NB_MMU_MODES` define
  target/avr: Remove `NB_MMU_MODES` define
  target/cris: Remove `NB_MMU_MODES` define
  target/hexagon: Remove `NB_MMU_MODES` define
  target/hppa: Remove `NB_MMU_MODES` define
  target/i386: Remove `NB_MMU_MODES` define
  target/loongarch: Remove `NB_MMU_MODES` define
  target/m68k: Remove `NB_MMU_MODES` define
  target/microblaze: Remove `NB_MMU_MODES` define
  target/mips: Remove `NB_MMU_MODES` define
  target/nios2: Remove `NB_MMU_MODES` define
  target/openrisc: Remove `NB_MMU_MODES` define
  target/ppc: Remove `NB_MMU_MODES` define
  target/riscv: Remove `NB_MMU_MODES` define
  target/rx: Remove `NB_MMU_MODES` define
  target/s390x: Remove `NB_MMU_MODES` define
  target/sh4: Remove `NB_MMU_MODES` define
  target/sparc: Remove `NB_MMU_MODES` define
  target/tricore: Remove `NB_MMU_MODES` define
  target/xtensa: Remove `NB_MMU_MODES` define
  include/exec: Remove guards around `NB_MMU_MODES`

 include/exec/cpu-defs.h       | 9 ++++++---
 target/alpha/cpu-param.h      | 2 --
 target/arm/cpu-param.h        | 2 --
 target/avr/cpu-param.h        | 1 -
 target/cris/cpu-param.h       | 1 -
 target/hexagon/cpu-param.h    | 2 --
 target/hppa/cpu-param.h       | 1 -
 target/i386/cpu-param.h       | 1 -
 target/loongarch/cpu-param.h  | 1 -
 target/m68k/cpu-param.h       | 1 -
 target/microblaze/cpu-param.h | 1 -
 target/microblaze/cpu.h       | 2 +-
 target/mips/cpu-param.h       | 1 -
 target/nios2/cpu-param.h      | 1 -
 target/openrisc/cpu-param.h   | 1 -
 target/ppc/cpu-param.h        | 1 -
 target/riscv/cpu-param.h      | 1 -
 target/rx/cpu-param.h         | 2 --
 target/s390x/cpu-param.h      | 1 -
 target/sh4/cpu-param.h        | 1 -
 target/sparc/cpu-param.h      | 2 --
 target/tricore/cpu-param.h    | 1 -
 target/xtensa/cpu-param.h     | 1 -
 23 files changed, 7 insertions(+), 30 deletions(-)

--
2.39.1

