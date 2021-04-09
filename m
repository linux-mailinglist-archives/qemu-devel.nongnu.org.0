Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9735A24B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:50:45 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtP9-0001co-Ut
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCj-0002aQ-97; Fri, 09 Apr 2021 11:37:53 -0400
Received: from [201.28.113.2] (port=41884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCh-0002YS-Ox; Fri, 09 Apr 2021 11:37:53 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 9 Apr 2021 12:19:21 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 34490800172;
 Fri,  9 Apr 2021 12:19:21 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] target/ppc: add disable-tcg option
Date: Fri,  9 Apr 2021 12:19:12 -0300
Message-Id: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 09 Apr 2021 15:19:21.0391 (UTC)
 FILETIME=[B7714BF0:01D72D53]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.araujo@eldorado.org.br, lagarcia@br.ibm.com,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to add the option to build without TCG for the
powerpc target. This RFC shows mostly the strategies employed when
dealing with compilation problems, and ask for input on the bits
we don't quite understand yet.

The first patch mostly code motion, as referenced in 2021-04/msg0717.
The second patch shows the 2 strategies we've considered, and hope to
get feedback on. The third patch contains the stubs we haven't decided
on how to deal with yet, but needed to exist to compile the project.
The final patch just changes the meson.build rules

Bruno Larsen (billionai) (4):
  target/ppc: Code motion required to build disabling tcg
  target/ppc: added solutions for problems encountered when building
    with disable-tcg
  target/ppc: Add stubs for tcg functions, so it build with disable-tcg
  target/ppc: updated build rules for disable-tcg option

 target/ppc/arch_dump.c          |   17 +
 target/ppc/cpu.c                |  859 +++++++++++++++++++++++
 target/ppc/cpu.h                |   15 +
 target/ppc/gdbstub.c            |  253 +++++++
 target/ppc/kvm.c                |   30 +
 target/ppc/kvm_ppc.h            |   11 +
 target/ppc/machine.c            |   33 +-
 target/ppc/meson.build          |   22 +-
 target/ppc/tcg-stub.c           |  139 ++++
 target/ppc/translate_init.c.inc | 1148 +------------------------------
 10 files changed, 1407 insertions(+), 1120 deletions(-)
 create mode 100644 target/ppc/tcg-stub.c

-- 
2.17.1


