Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72C4FD32
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jun 2019 19:08:53 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hf5z1-0003E4-JU
	for lists+qemu-devel@lfdr.de; Sun, 23 Jun 2019 13:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wJ-0001bF-SN
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wI-0004Em-Oo
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:03 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:39383 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hf5wI-000304-Hz
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6FADC1A1CE2;
 Sun, 23 Jun 2019 19:04:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 544A51A0EDA;
 Sun, 23 Jun 2019 19:04:57 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Jun 2019 19:04:33 +0200
Message-Id: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 00/16] tcg/ppc: Add vector opcodes
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
Cc: richard.henderson@linaro.org,
 "David Gibson --cc=amarkovic @ wavecomp . com"
 <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Changes since v4:
  * Patch 1, "tcg/ppc: Introduce Altivec registers", is divided into
    ten smaller patches.
  * The net result (code-wise) is not changed between former patch 1
    and ten new patches.
  * Remaining (2-7) patches from v4 are applied verbatim.
  * This means that code-wise v5 and v4 do not differ.
  * v5 is devised to help debugging, and to better organize the code.

Changes since v3:
  * Add support for bitsel, with the vsx xxsel insn.
  * Rely on the new relocation overflow handling, so
    we don't require 3 insns for a vector load.

Changes since v2:
  * Several generic tcg patches to improve dup vs dupi vs dupm.
    In particular, if a global temp (like guest r10) is not in
    a host register, we should duplicate from memory instead of
    loading to an integer register, spilling to stack, loading
    to a vector register, and then duplicating.
  * I have more confidence that 32-bit ppc host should work
    this time around.  No testing on that front yet, but I've
    unified some code sequences with 64-bit ppc host.
  * Base altivec now supports V128 only.  Moved V64 support to
    Power7 (v2.06), which has 64-bit load/store.
  * Dropped support for 64-bit vector multiply using Power8.
    The expansion was too large compared to using integer regs.

Richard Henderson (16):
  tcg/ppc: Introduce Altivec registers
  tcg/ppc: Introduce flag have_isa_altivec
  tcg/ppc: Introduce macro VX4()
  tcg/ppc: Introduce macros VRT(), VRA(), VRB(), VRC()
  tcg/ppc: Add support for load/store/logic/comparison
  tcg/ppc: Add support for vector maximum/minimum
  tcg/ppc: Add support for vector add/subtract
  tcg/ppc: Add support for vector saturated add/subtract
  tcg/ppc: Prepare case for vector multiply
  tcg/ppc: Add empty file tcg-target.opc.h
  tcg/ppc: Support vector shift by immediate
  tcg/ppc: Support vector multiply
  tcg/ppc: Support vector dup2
  tcg/ppc: Update vector support to v2.06
  tcg/ppc: Update vector support to v2.07
  tcg/ppc: Update vector support to v3.00

 tcg/ppc/tcg-target.h     |   39 +-
 tcg/ppc/tcg-target.inc.c | 1073 +++++++++++++++++++++++++++++++++++++++++++---
 tcg/ppc/tcg-target.opc.h |   11 +
 3 files changed, 1061 insertions(+), 62 deletions(-)
 create mode 100644 tcg/ppc/tcg-target.opc.h

-- 
2.7.4


