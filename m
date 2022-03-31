Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C54EDCFB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:33:36 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwnn-00019m-7l
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:33:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfc-0003ls-MK; Thu, 31 Mar 2022 11:25:08 -0400
Received: from [187.72.171.209] (port=51585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfb-0004ne-2n; Thu, 31 Mar 2022 11:25:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 12:24:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 41DE4800013;
 Thu, 31 Mar 2022 11:58:35 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 0/5] Port PPC64/PowerNV MMU tests to QEMU
Date: Thu, 31 Mar 2022 11:58:08 -0300
Message-Id: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 15:24:02.0562 (UTC)
 FILETIME=[5A179620:01D84513]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:
- added new files to MAINTAINERS, under PowerPC TCG CPUs, and added
  myself as a reviewer (not sure if this is the right procedure)
- removed the "virtual" ppc64le-softmmu target.
  ppc64/Makefile.softmmu-target now builds all tests in both BE and LE

Cédric Le Goater (2):
  target/ppc: Add support for the Processor Attention instruction
  ppc/pnv: Activate support for the Processor Attention instruction

Leandro Lupori (3):
  tests/tcg/ppc64: add basic softmmu test support
  tests/tcg/ppc64: add MMU test sources
  tests/tcg/ppc64: build PowerNV and LE tests

 MAINTAINERS                              |   2 +
 hw/ppc/pnv_core.c                        |   6 +
 include/hw/ppc/pnv_core.h                |   1 +
 target/ppc/cpu.h                         |   8 +
 target/ppc/excp_helper.c                 |  27 +
 target/ppc/helper.h                      |   1 +
 target/ppc/translate.c                   |  14 +
 tests/tcg/ppc64/Makefile.softmmu-rules   |  34 +
 tests/tcg/ppc64/Makefile.softmmu-target  | 124 ++++
 tests/tcg/ppc64/system/include/asm.h     |  62 ++
 tests/tcg/ppc64/system/include/console.h |  15 +
 tests/tcg/ppc64/system/include/io.h      |  61 ++
 tests/tcg/ppc64/system/include/pnv.h     |  21 +
 tests/tcg/ppc64/system/include/uart.h    |  54 ++
 tests/tcg/ppc64/system/lib/boot.S        |  68 ++
 tests/tcg/ppc64/system/lib/console.c     | 173 +++++
 tests/tcg/ppc64/system/lib/powerpc.lds   |  27 +
 tests/tcg/ppc64/system/mmu-head.S        | 142 +++++
 tests/tcg/ppc64/system/mmu.c             | 764 +++++++++++++++++++++++
 tests/tcg/ppc64/system/mmu.h             |   9 +
 20 files changed, 1613 insertions(+)
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-rules
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-target
 create mode 100644 tests/tcg/ppc64/system/include/asm.h
 create mode 100644 tests/tcg/ppc64/system/include/console.h
 create mode 100644 tests/tcg/ppc64/system/include/io.h
 create mode 100644 tests/tcg/ppc64/system/include/pnv.h
 create mode 100644 tests/tcg/ppc64/system/include/uart.h
 create mode 100644 tests/tcg/ppc64/system/lib/boot.S
 create mode 100644 tests/tcg/ppc64/system/lib/console.c
 create mode 100644 tests/tcg/ppc64/system/lib/powerpc.lds
 create mode 100644 tests/tcg/ppc64/system/mmu-head.S
 create mode 100644 tests/tcg/ppc64/system/mmu.c
 create mode 100644 tests/tcg/ppc64/system/mmu.h

-- 
2.25.1


