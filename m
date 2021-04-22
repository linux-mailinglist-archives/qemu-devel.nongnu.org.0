Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD23687CA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:17:58 +0200 (CEST)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZflt-00020u-5b
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfLG-0006EJ-1f; Thu, 22 Apr 2021 15:50:26 -0400
Received: from [201.28.113.2] (port=23502 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfLE-0002SN-8p; Thu, 22 Apr 2021 15:50:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 22 Apr 2021 16:31:36 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 31F06800BEE;
 Thu, 22 Apr 2021 16:31:36 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/4] hw/ppc: remove call to tcg-only function
Date: Thu, 22 Apr 2021 16:31:27 -0300
Message-Id: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 22 Apr 2021 19:31:36.0352 (UTC)
 FILETIME=[1BF3D200:01D737AE]
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
Cc: bruno.larsen@eldorado.org.br, lucas.araujo@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm working with Bruno Larsen (billionai) to enable the disable-tcg
option for PowerPC, right now I'm aiming at removing call to tcg-only
functions from hw/ppc, there is still some work to be done in
target/ppc.

This patch creates a spapr_hcall_tcg_stub.c file
that has the same hcalls as spapr_hcall except those that call tcg-only
functions, said functions now only trip a fatal error.

The functions ppc_store_lpcr and ppc_hash64_filter_pagesizes were in
tcg-only files but as their logic is necessary they have been moved to a
non-tcg-only file.

This is still a work in progress and this patches focuses on the
spapr* calls, as there will still be some undefined references to
functions in tcg-only files and include to tcg-only .h, mostly on
target/ppc.

Comments are welcome, thanks,
Lucas Mateus.

Lucas Mateus Castro (alqotel) (4):
  target/ppc: updated build options
  hw/ppc: Add kvm-only file spapr_hcall_tcg_stub.c
  hw/ppc: updated build rules to use new file
  target/ppc: transfered functions to non-tcg-only files

 hw/ppc/meson.build            |   10 +-
 hw/ppc/spapr.c                |    1 +
 hw/ppc/spapr_caps.c           |    1 +
 hw/ppc/spapr_cpu_core.c       |    1 +
 hw/ppc/spapr_hcall.c          |    1 +
 hw/ppc/spapr_hcall_tcg_stub.c | 1825 +++++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c           |    1 +
 target/ppc/common-misc.c      |   86 ++
 target/ppc/common-misc.h      |   13 +
 target/ppc/int_helper.c       |   10 +-
 target/ppc/meson.build        |   21 +-
 target/ppc/mmu-hash64.c       |   67 +-
 target/ppc/mmu-hash64.h       |    4 -
 13 files changed, 1957 insertions(+), 84 deletions(-)
 create mode 100644 hw/ppc/spapr_hcall_tcg_stub.c
 create mode 100644 target/ppc/common-misc.c
 create mode 100644 target/ppc/common-misc.h

-- 
2.17.1


