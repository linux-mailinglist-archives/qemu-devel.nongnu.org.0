Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2435F72
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYX6e-0002dN-Jf
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:41:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1m-0007YN-FH
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1l-0001yl-C1
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:53777 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYX1l-0007FD-0U
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 312FC1A21AF;
	Wed,  5 Jun 2019 16:35:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 0B43B1A2173;
	Wed,  5 Jun 2019 16:35:26 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:35:10 +0200
Message-Id: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/6] target/mips: Amend and clean up MSA support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series contains various refactorings and cleanups of MSA
support.

Improve support for logic instructions, add tests for shift
instructions, improve code style, outline future organization.

Aleksandar Markovic (6):
  target/mips: Fix space-related format issues im msa_helper.c
  target/mips: Fix block-comment-related issues im msa_helper.c
  target/mips: Unroll loops in helpers for MSA logic instructions
  tests/tcg: target/mips: Add tests for MSA shift instructions
  tests/tcg: target/mips: Amend and rearrange MSA wrappers
  target/mips: Outline places for future MSA helpers

 target/mips/msa_helper.c                           | 252 +++++++++++--
 tests/tcg/mips/include/wrappers_msa.h              | 402 ++++++++++++++-------
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_b.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_d.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_h.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_w.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_b.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_d.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_h.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_w.c | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_b.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_d.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_h.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_w.c  | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_b.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_d.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_h.c | 153 ++++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_w.c | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_b.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_d.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_h.c  | 153 ++++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_w.c  | 153 ++++++++
 22 files changed, 3544 insertions(+), 170 deletions(-)
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_w.c

-- 
2.7.4


