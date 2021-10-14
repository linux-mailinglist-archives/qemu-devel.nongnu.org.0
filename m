Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B042E448
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:38:17 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9Md-0004ri-Ol
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JD-0001xb-T0; Thu, 14 Oct 2021 18:34:43 -0400
Received: from [201.28.113.2] (port=23608 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JB-0005Cp-W4; Thu, 14 Oct 2021 18:34:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 14 Oct 2021 19:34:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 544CC800BB0;
 Thu, 14 Oct 2021 19:34:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/4] Fix incorrect accesses to XER
Date: Thu, 14 Oct 2021 19:32:30 -0300
Message-Id: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Oct 2021 22:34:36.0829 (UTC)
 FILETIME=[AB1DE4D0:01D7C14B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This patch series fixes some uses of env->xer that were left behind when
SO, OV, and CA bits were separated into other fields of CPUPPCState. At
the time, all of them weren't in target-specific files/directories,
which probably made it harder to track what needed to be changed.
Currently, this still is the case for linux-user/elfload.c. Is there
any particular reason for that? I can try to provide a patch to split
it.

Matheus Ferst (4):
  linux-user/ppc: Fix XER access in save/restore_user_regs
  target/ppc: Fix XER access in gdbstub
  linux-user: Fix XER access in ppc version of elf_core_copy_regs
  target/ppc: Fix XER access in monitor

 linux-user/elfload.c                        |  2 +-
 linux-user/ppc/signal.c                     |  9 +++--
 target/ppc/cpu.c                            |  2 +-
 target/ppc/cpu.h                            |  2 +-
 target/ppc/gdbstub.c                        |  8 ++--
 target/ppc/monitor.c                        |  9 ++++-
 tests/tcg/ppc64/Makefile.target             |  2 +
 tests/tcg/ppc64le/Makefile.target           |  2 +
 tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
 9 files changed, 67 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

-- 
2.25.1


