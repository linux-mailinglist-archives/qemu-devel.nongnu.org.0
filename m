Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F6B3B5F37
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:39:18 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrTo-0006my-N3
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRH-00047x-Nz; Mon, 28 Jun 2021 09:36:39 -0400
Received: from [201.28.113.2] (port=33408 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRG-0003mD-1R; Mon, 28 Jun 2021 09:36:39 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 28 Jun 2021 10:36:31 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D33E4800976;
 Mon, 28 Jun 2021 10:36:31 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] Clean up MMU translation
Date: Mon, 28 Jun 2021 10:36:07 -0300
Message-Id: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Jun 2021 13:36:32.0030 (UTC)
 FILETIME=[9B4383E0:01D76C22]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final part of the MMU fixes that were needed to support
disable-tcg, focusing on a possible bug on the second level address
translation of radix64 MMUs, and some changes to hash32 and hash64 to
work the same as radix64.

Changes for v4:
 * added r-b and t-b tags
 * changes commit message of the first patch
 * removed function parameters that were no longer used

Changes for v3:
 * removed patches that were already applied
 * fixed comments on last patch
 * added 2 new patches

Changes for v2:
 * rebase on ppc-for-6.1
 * added the bugfix

Bruno Larsen (billionai) (3):
  target/ppc: fix address translation bug for radix mmus
  target/ppc: change ppc_hash32_xlate to use mmu_idx
  target/ppc: changed ppc_hash64_xlate to use mmu_idx

 target/ppc/mmu-book3s-v3.h | 13 ++++++++++++
 target/ppc/mmu-hash32.c    | 40 +++++++++++++++++------------------
 target/ppc/mmu-hash32.h    |  2 +-
 target/ppc/mmu-hash64.c    | 43 +++++++++++++++++++-------------------
 target/ppc/mmu-hash64.h    |  2 +-
 target/ppc/mmu-radix64.c   | 37 ++++++++++++++++++--------------
 target/ppc/mmu-radix64.h   |  2 +-
 target/ppc/mmu_helper.c    | 12 ++++++-----
 8 files changed, 84 insertions(+), 67 deletions(-)

-- 
2.17.1


