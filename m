Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F319B3758B2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:49:28 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehBn-00035m-J9
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2Z-0004ix-9c; Thu, 06 May 2021 12:39:55 -0400
Received: from [201.28.113.2] (port=23611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2X-0001sf-Nw; Thu, 06 May 2021 12:39:55 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 6 May 2021 13:39:49 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 0DF7E800E42;
 Thu,  6 May 2021 13:39:49 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 0/4] hw/ppc: code motion to compile without TCG
Date: Thu,  6 May 2021 13:39:37 -0300
Message-Id: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 06 May 2021 16:39:49.0180 (UTC)
 FILETIME=[6E2EAFC0:01D74296]
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

After the feedback from v2 I changed:
* The name _tcg or _tcg_only to _softmmu in spapr_softmmu,
* Divided h_resize_hpt_prepare and h_resize_hpt_commit into a KVM and
  softmmu parts,
* How to register some hypercalls in a !TCG environment in spapr_hcall.c,
* Where to move the functions ppc_hash64_filter_pagesizes and
  ppc_store_lpcr,
* Changed registration verification in pnv_dt_core and spapr_dt_cpu.

This patch aims to move and change some functions to make some progress
toward enabling the disable-tcg option on PPC.

Lucas Mateus Castro (alqotel) (4):
  hw/ppc: Moved hypercalls that depend on softmmu to new file
  target/ppc: moved function out of mmu-hash64
  target/ppc: moved ppc_store_lpcr to misc_helper.c
  hw/ppc: Altered calls from oea_read to read

 hw/ppc/meson.build       |   3 +
 hw/ppc/pnv.c             |   2 +-
 hw/ppc/spapr.c           |   4 +-
 hw/ppc/spapr_caps.c      |  59 ++++
 hw/ppc/spapr_hcall.c     | 608 ++-----------------------------------
 hw/ppc/spapr_softmmu.c   | 627 +++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h   |   6 +
 target/ppc/cpu.h         |   1 +
 target/ppc/misc_helper.c |  10 +
 target/ppc/mmu-hash64.c  |  67 -----
 target/ppc/mmu-hash64.h  |   4 -
 11 files changed, 741 insertions(+), 650 deletions(-)
 create mode 100644 hw/ppc/spapr_softmmu.c

-- 
2.17.1


