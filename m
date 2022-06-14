Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FB54B69D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:47:59 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19ht-0007bS-BF
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o19Rq-0005QH-2U; Tue, 14 Jun 2022 12:31:22 -0400
Received: from [187.72.171.209] (port=34837 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o19Ro-0008Tq-GZ; Tue, 14 Jun 2022 12:31:21 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 14 Jun 2022 13:31:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 41E0480046B;
 Tue, 14 Jun 2022 13:31:12 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH RESEND 0/3] ppc: Implement ISA 3.00 tlbie[l]
Date: Tue, 14 Jun 2022 13:30:15 -0300
Message-Id: <20220614163018.39819-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 14 Jun 2022 16:31:12.0678 (UTC)
 FILETIME=[2935BC60:01D8800C]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for ISA 3.00 tlbie/tlbiel instructions, with
RIC, PRS and R operands.

Also, for Radix MMU, add support for the TLB invalidation of a
single page. Flush by PID/LPID, or based in process/partition
scope is not supported, because it would make using the
generic QEMU TLB implementation hard. In these cases, all
entries are flushed.

Resent after rebasing and fixing conflicts with master.

Leandro Lupori (3):
  target/ppc: Move tlbie to decode tree
  target/ppc: Move tlbiel to decode tree
  target/ppc: Implement ISA 3.00 tlbie[l]

 target/ppc/cpu_init.c                        |   4 +-
 target/ppc/helper.h                          |  18 +++
 target/ppc/insn32.decode                     |   8 +
 target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
 target/ppc/translate.c                       |  64 +-------
 target/ppc/translate/storage-ctrl-impl.c.inc | 102 ++++++++++++
 6 files changed, 286 insertions(+), 64 deletions(-)
 create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc

-- 
2.25.1


