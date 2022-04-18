Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB70505E48
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:14:42 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngWpd-0000Sh-6y
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWmp-0006g5-9C; Mon, 18 Apr 2022 15:11:47 -0400
Received: from [187.72.171.209] (port=10848 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWmn-00036o-Ik; Mon, 18 Apr 2022 15:11:46 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Apr 2022 16:11:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C1C5F8000A0;
 Mon, 18 Apr 2022 16:11:37 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v3 0/5] Port PPC64/PowerNV MMU tests to QEMU
Date: Mon, 18 Apr 2022 16:10:55 -0300
Message-Id: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2022 19:11:38.0304 (UTC)
 FILETIME=[20FBF400:01D85358]
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

Changes from v2:
- Added semihosting support for ppc64
- Use semihosting calls to exit tests, instead of using Processor
Attention instruction
- Use semihosting calls for console output, instead of programming
emulated serial hardware

Leandro Lupori (5):
  ppc64: Add semihosting support
  ppc64: Fix semihosting on ppc64le
  tests/tcg/ppc64: Add basic softmmu test support
  tests/tcg/ppc64: Add MMU test sources
  tests/tcg/ppc64: Build PowerNV and LE tests

 MAINTAINERS                               |   2 +
 configs/devices/ppc64-softmmu/default.mak |   3 +
 include/exec/softmmu-semi.h               |  23 +-
 qemu-options.hx                           |  18 +-
 semihosting/arm-compat-semi.c             |  33 +
 target/ppc/cpu.h                          |   3 +-
 target/ppc/excp_helper.c                  |   9 +
 target/ppc/translate.c                    |  14 +
 tests/tcg/ppc64/Makefile.softmmu-rules    |  34 +
 tests/tcg/ppc64/Makefile.softmmu-target   | 125 ++++
 tests/tcg/ppc64/system/include/asm.h      |  68 ++
 tests/tcg/ppc64/system/lib/boot.S         |  84 +++
 tests/tcg/ppc64/system/lib/powerpc.lds    |  27 +
 tests/tcg/ppc64/system/mmu-head.S         | 142 ++++
 tests/tcg/ppc64/system/mmu.c              | 764 ++++++++++++++++++++++
 tests/tcg/ppc64/system/mmu.h              |   9 +
 16 files changed, 1346 insertions(+), 12 deletions(-)
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-rules
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-target
 create mode 100644 tests/tcg/ppc64/system/include/asm.h
 create mode 100644 tests/tcg/ppc64/system/lib/boot.S
 create mode 100644 tests/tcg/ppc64/system/lib/powerpc.lds
 create mode 100644 tests/tcg/ppc64/system/mmu-head.S
 create mode 100644 tests/tcg/ppc64/system/mmu.c
 create mode 100644 tests/tcg/ppc64/system/mmu.h

-- 
2.25.1


