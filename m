Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186537BF7C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:13:04 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpbh-0007rI-SF
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXZ-0003yD-6Z; Wed, 12 May 2021 10:08:45 -0400
Received: from [201.28.113.2] (port=48830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXX-00081F-Cw; Wed, 12 May 2021 10:08:44 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 8E2078000C2;
 Wed, 12 May 2021 11:08:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/11] target/ppc: add support to disable-tcg
Date: Wed, 12 May 2021 11:08:02 -0300
Message-Id: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 12 May 2021 14:08:38.0769 (UTC)
 FILETIME=[4E464E10:01D74738]
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
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new version of the patch series that adds support for the
disable-tcg build flag. It is not marked as v2 because so much has
changed between them that it didn't feel like it made sense to relate to
that first RFC.

Most of the patches here are meant to be final, but 2 of them near the
end are a bit of a shot in the dark, so we figured RFC would be a better
way to tag this patch series.

Bruno Larsen (billionai) (10):
  target/ppc: created ppc_{store,get}_vscr for generic vscr usage
  target/ppc: moved ppc_store_sdr1 to cpu.c
  target/ppc: moved ppc_cpu_dump_state to cpu_init.c
  target/ppc: moved ppc_store_msr into gdbstub.c
  target/ppc: moved ppc_store_lpcr to cpu.c
  target/ppc: updated vscr manipulation in machine.c
  target/ppc: added KVM fallback to fpscr manipulation
  target/ppc: wrapped some TCG only logic with ifdefs
  target/ppc: created tcg-stub.c file
  target/ppc: updated meson.build to support disable-tcg

Lucas Mateus Castro (alqotel) (1):
  include/exec: added functions to the stubs in exec-all.h

 include/exec/exec-all.h     |  10 ++
 include/exec/helper-proto.h |   2 +
 target/ppc/arch_dump.c      |   3 +-
 target/ppc/cpu.c            |  56 +++++++++++
 target/ppc/cpu.h            |   2 +
 target/ppc/cpu_init.c       | 192 +++++++++++++++++++++++++++++++++++-
 target/ppc/excp_helper.c    |   6 +-
 target/ppc/gdbstub.c        |  12 ++-
 target/ppc/int_helper.c     |   9 +-
 target/ppc/kvm.c            |  14 +++
 target/ppc/kvm_ppc.h        |   6 ++
 target/ppc/machine.c        |   7 +-
 target/ppc/meson.build      |  16 ++-
 target/ppc/misc_helper.c    |  16 ---
 target/ppc/mmu_helper.c     |  26 -----
 target/ppc/tcg-stub.c       |  33 +++++++
 target/ppc/translate.c      | 187 -----------------------------------
 17 files changed, 347 insertions(+), 250 deletions(-)
 create mode 100644 target/ppc/tcg-stub.c

-- 
2.17.1


