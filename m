Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94E5A9861
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:23:45 +0200 (CEST)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkAa-0002yV-SO
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk5J-0005Vo-QV; Thu, 01 Sep 2022 09:18:17 -0400
Received: from [200.168.210.66] (port=23956 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk5H-0002Uu-OB; Thu, 01 Sep 2022 09:18:17 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 1 Sep 2022 10:18:10 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E34DC8002C5;
 Thu,  1 Sep 2022 10:18:09 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 00/19] Multiple ppc instructions fixes
Date: Thu,  1 Sep 2022 10:17:37 -0300
Message-Id: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Sep 2022 13:18:10.0501 (UTC)
 FILETIME=[48540750:01D8BE05]
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
Patches 8 through 19 add helper_reset_fpstatus() calls to instructions
    that have an issue where the exception flags are being kept from
    the previous instruction, causing incorrect bits to be set,
    specially the non-sticky FI bit.
Other patches fixes other specific situations.

Víctor Colombo (19):
  target/ppc: Remove extra space from s128 field in ppc_vsr_t
  target/ppc: Remove unused xer_* macros
  target/ppc: Zero second doubleword in DFP instructions
  target/ppc: Set result to QNaN for DENBCD when VXCVI occurs
  target/ppc: Zero second doubleword for VSX madd instructions
  target/ppc: Set OV32 when OV is set
  target/ppc: Zero second doubleword of VSR registers for FPR insns
  target/ppc: Clear fpstatus flags on VSX_CVT_INT_TO_FP_VECTOR
  target/ppc: Clear fpstatus flags on VSX_CVT_INT_TO_FP
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_FP
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_INT_VECTOR
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_INT2
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_INT
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_FP_HP
  target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_FP_VECTOR
  target/ppc: Clear fpstatus flags for xscvqpdp
  target/ppc: Clear fpstatus flags for xscvdpsp[n]
  target/ppc: Clear fpstatus flags on VSX_CMP
  target/ppc: Clear fpstatus flags on VSX_ROUND

 target/ppc/cpu.h        |  6 +-----
 target/ppc/dfp_helper.c | 31 ++++++++++++++++++++++++++++---
 target/ppc/fpu_helper.c | 39 +++++++++++++++++++++++++++------------
 target/ppc/int_helper.c |  4 ++--
 target/ppc/translate.c  |  8 ++++++++
 5 files changed, 66 insertions(+), 22 deletions(-)

-- 
2.25.1


