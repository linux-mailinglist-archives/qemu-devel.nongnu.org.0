Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4302399382
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:29:24 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWYN-0007eg-RW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1loWW5-0004tP-IU; Wed, 02 Jun 2021 15:27:02 -0400
Received: from [201.28.113.2] (port=39068 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1loWW3-0002aI-Bx; Wed, 02 Jun 2021 15:27:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 16:26:18 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 9E79D80148C;
 Wed,  2 Jun 2021 16:26:18 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/4] target/ppc: mmu cleanup
Date: Wed,  2 Jun 2021 16:26:00 -0300
Message-Id: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 02 Jun 2021 19:26:18.0803 (UTC)
 FILETIME=[299D7030:01D757E5]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to clean up some of the code in mmu-hash64.c and
mmu_helper.c, including removing the includes inside ifdef of those
files.

Helpers are in mmu_helper.c now and code that is needed in a !TCG build
are in mmu-hash64.c and mmu_common.c.

Comments are welcome, thanks,
Lucas Mateus.
Based-on: 558f3e1031caf539b74d2891f6a8fb491735a1ac

Lucas Mateus Castro (alqotel) (4):
  target/ppc: Don't compile ppc_tlb_invalid_all without TCG
  target/ppc: divided mmu_helper.c in 2 files
  target/ppc: moved ppc_store_sdr1 to mmu_common.c
  target/ppc: Moved helpers to mmu_helper.c

 target/ppc/cpu.c        |   28 -
 target/ppc/cpu.h        |   35 +
 target/ppc/cpu_init.c   |    4 +
 target/ppc/internal.h   |   26 +
 target/ppc/meson.build  |    6 +-
 target/ppc/mmu-hash64.c |  219 +----
 target/ppc/mmu-hash64.h |    1 +
 target/ppc/mmu_common.c | 1634 +++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c | 2023 ++++++---------------------------------
 9 files changed, 2019 insertions(+), 1957 deletions(-)
 create mode 100644 target/ppc/mmu_common.c

-- 
2.17.1


