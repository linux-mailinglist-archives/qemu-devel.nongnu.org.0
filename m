Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6439006C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:57:49 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVgx-0003v2-Nx
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llVdO-0001cJ-KQ; Tue, 25 May 2021 07:54:10 -0400
Received: from [201.28.113.2] (port=5820 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llVdM-0004P8-Nl; Tue, 25 May 2021 07:54:06 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 25 May 2021 08:54:00 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 85B7980144E;
 Tue, 25 May 2021 08:54:00 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] target/ppc: add support to disable-tcg
Date: Tue, 25 May 2021 08:53:51 -0300
Message-Id: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 25 May 2021 11:54:00.0718 (UTC)
 FILETIME=[A6C04AE0:01D7515C]
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

This patch series finishes the the changes required to support disabling
TCG for ppc targets.

With the current version of the patch, the project compiles and runs ok,
but we need some more testing to ensure that no regressions happened,
especially with relation to gdb.

Based-on: <20210521201759.85475-6-bruno.larsen@eldorado.org.br>

Changelog for v5:
 * removed motion of ppc_cpu_do_interrupt
 * changed commit message of the first patch

Changelog for v4:
 * split former patch 7 into patches 2 and 3
 * undid code motion on patch 7. future cleanup?
 * added copyright blurb to tcg-stubs.c
 * fixed style problem in tcg-stubs.c

Changelog for v3:
 * undone split, since rth's patch fixes what we needed
 * changed commit message for patch 1
 * added some fixes suggested by dgibson for patch 7

Changelog for v2:
 * split the patch series
 * added a fix for 5d145639e, which no longer compiles with linux-user
 * removed patches ther were already accepted
 * applied rth's cleanup to ppc_store_sdr1
 * changed destination of ppc_store_msr
 * undone change to helper-proto, now fewer files include it

Bruno Larsen (billionai) (4):
  target/ppc: used ternary operator when registering MAS
  target/ppc: added ifdefs around TCG-only code
  target/ppc: created tcg-stub.c file
  target/ppc: updated meson.build to support disable-tcg

 target/ppc/cpu_init.c    | 11 +++++-----
 target/ppc/excp_helper.c | 21 ++++++++++++++++---
 target/ppc/meson.build   | 11 ++++++++--
 target/ppc/mmu-hash64.c  | 11 +++++++++-
 target/ppc/mmu_helper.c  | 16 ++++++++++++--
 target/ppc/tcg-stub.c    | 45 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 101 insertions(+), 14 deletions(-)
 create mode 100644 target/ppc/tcg-stub.c

-- 
2.17.1


