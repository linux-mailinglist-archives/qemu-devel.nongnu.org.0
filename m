Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A65AE934
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:15:46 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYQb-0004o7-9D
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY7C-0008O2-Q9; Tue, 06 Sep 2022 08:55:43 -0400
Received: from [200.168.210.66] (port=62986 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY7A-0002Az-53; Tue, 06 Sep 2022 08:55:42 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 6 Sep 2022 09:55:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3EC628002BE;
 Tue,  6 Sep 2022 09:55:33 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH v2 0/8] Multiple ppc instructions fixes
Date: Tue,  6 Sep 2022 09:55:15 -0300
Message-Id: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Sep 2022 12:55:33.0741 (UTC)
 FILETIME=[F3B3A1D0:01D8C1EF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set fixes multiple instructions for PPC targets that were
producing incorrect results, or setting the wrong bits in FPSCR.

Patch 1 is just a style fix, trivial.
Patch 8 adds helper_reset_fpstatus() calls to instructions
    that have an issue where the exception flags are being kept from
    the previous instruction, causing incorrect bits to be set,
    specially the non-sticky FI bit.
Other patches fixes other specific situations.

v1->v2:
- Squash patches 8 through 19 and write a better commit message to it.
- Dropped Daniel's R-b in the squashed patches, as the squash merged
    both reviewed and non-reviewed patches. Now require a new, single
    R-b.

Víctor Colombo (8):
  target/ppc: Remove extra space from s128 field in ppc_vsr_t
  target/ppc: Remove unused xer_* macros
  target/ppc: Zero second doubleword in DFP instructions
  target/ppc: Set result to QNaN for DENBCD when VXCVI occurs
  target/ppc: Zero second doubleword for VSX madd instructions
  target/ppc: Set OV32 when OV is set
  target/ppc: Zero second doubleword of VSR registers for FPR insns
  target/ppc: Clear fpstatus flags on helpers missing it

 target/ppc/cpu.h        |  6 +-----
 target/ppc/dfp_helper.c | 31 ++++++++++++++++++++++++++++---
 target/ppc/fpu_helper.c | 39 +++++++++++++++++++++++++++------------
 target/ppc/int_helper.c |  4 ++--
 target/ppc/translate.c  |  8 ++++++++
 5 files changed, 66 insertions(+), 22 deletions(-)

-- 
2.25.1


