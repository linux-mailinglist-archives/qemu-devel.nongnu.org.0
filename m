Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B03700B0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:44:50 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcY89-0008Au-87
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4f-00067N-6R; Fri, 30 Apr 2021 14:41:13 -0400
Received: from [201.28.113.2] (port=4684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4Z-0002GC-1F; Fri, 30 Apr 2021 14:41:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 15:41:02 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 08C388013C2;
 Fri, 30 Apr 2021 15:41:02 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG 
Date: Fri, 30 Apr 2021 15:40:45 -0300
Message-Id: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 30 Apr 2021 18:41:02.0179 (UTC)
 FILETIME=[5EBFC330:01D73DF0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 farosas@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the feedback from v1 I reworked the patch with suggested ideas and
this version has less duplicated code and is overall simpler.

This patch series is still a WIP, there are still 2 main problems I am
trying to solve, I'll mention them in their respective patches.

The aim of these patches is to progress toward enabling disable-tcg on
PPC by solving errors in hw/ppc with that option.

As a WIP comments are welcome.

Lucas Mateus Castro (alqotel) (2):
  target/ppc: Moved functions out of mmu-hash64
  hw/ppc: Moved TCG code to spapr_hcall_tcg

 hw/ppc/meson.build       |   3 +
 hw/ppc/spapr.c           |   1 +
 hw/ppc/spapr_caps.c      |   1 +
 hw/ppc/spapr_cpu_core.c  |   1 +
 hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
 hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c      |   1 +
 target/ppc/meson.build   |   1 +
 target/ppc/mmu-hash64.c  |  81 +--------
 target/ppc/mmu-hash64.h  |   6 -
 target/ppc/mmu-misc.c    |  86 ++++++++++
 target/ppc/mmu-misc.h    |  22 +++
 12 files changed, 478 insertions(+), 369 deletions(-)
 create mode 100644 hw/ppc/spapr_hcall_tcg.c
 create mode 100644 target/ppc/mmu-misc.c
 create mode 100644 target/ppc/mmu-misc.h

-- 
2.17.1


