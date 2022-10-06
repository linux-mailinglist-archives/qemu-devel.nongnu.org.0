Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8E5F6EB1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:11:58 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXDn-0008Uq-Oo
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9E-0002d4-2t; Thu, 06 Oct 2022 16:07:12 -0400
Received: from [200.168.210.66] (port=39047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9C-0001fe-20; Thu, 06 Oct 2022 16:07:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3E7438002BE;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 0/6] Enable doorbell instruction for POWER8 CPUs
Date: Thu,  6 Oct 2022 17:06:48 -0300
Message-Id: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:03.0542 (UTC)
 FILETIME=[339E4160:01D8D9BF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Reviewing the interrupt rework patch series, Fabiano noted[1] that the
POWER8 User's Manual lists the Directed Hypervisor Doorbell interrupt,
even without implementing the "Embedded.Processor Control" category. The
manual also lists the msgclr and msgsnd instructions, but the decode
legacy code currently gates them with the PPC2_PRCNTL flag, which is not
enabled for this CPU.

Reading the Power ISA v2.07, we noticed that the title of the
Processor Control chapter does not include the category information like
in Power ISA v2.06, and the instruction listing in the appendices says
that their category is "S\nE.PC". The document is not clear about this
notation, but since implementations should support only one environment
(embedded or server), I'd interpret this change as "these instructions
are now available if the processor implements the server environment or
E.PC category."

While reviewing the flag for those instructions, we also saw that the
msgsync, introduced in PowerISA v3.0, was available on all processors
with the PPC2_PRCNTL flag, which includes older CPUs like e500mc and
e6500.

This patch series fixes the instruction flags for these three
instructions. We then take this opportunity to move processor control
instruction to decodetree, fixing an embarrassing error in the
definition of the REQUIRE_HV macro along the way.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-09/msg00586.html

Matheus Ferst (6):
  target/ppc: fix msgclr/msgsnd insns flags
  target/ppc: fix msgsync insns flags
  target/ppc: fix REQUIRE_HV macro definition
  target/ppc: move msgclr/msgsnd to decodetree
  target/ppc: move msgclrp/msgsndp to decodetree
  target/ppc: move msgsync to decodetree

 target/ppc/insn32.decode                      |   8 ++
 target/ppc/translate.c                        |  86 ++-------------
 .../ppc/translate/processor-ctrl-impl.c.inc   | 103 ++++++++++++++++++
 3 files changed, 119 insertions(+), 78 deletions(-)
 create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

-- 
2.25.1


