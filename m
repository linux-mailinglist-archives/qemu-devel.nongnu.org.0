Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C4607972
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:23:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsvk-0003aL-8O
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:23:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsvj-0006Hj-Gk
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsvT-0003U0-O3; Fri, 21 Oct 2022 10:23:07 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsvP-0004QZ-GY; Fri, 21 Oct 2022 10:23:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 11:21:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 799FA8001F1;
 Fri, 21 Oct 2022 11:21:58 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v4 0/3] PowerPC interrupt rework
Date: Fri, 21 Oct 2022 11:21:53 -0300
Message-Id: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2022 14:21:58.0815 (UTC)
 FILETIME=[7AD5E2F0:01D8E558]
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

This version fixes the problems found by Daniel with e500 tests and
rebases on ppc-next.

Based-on: https://gitlab.com/danielhb/qemu/-/tree/ppc-next

Matheus Ferst (3):
  target/ppc: introduce ppc_maybe_interrupt
  target/ppc: unify cpu->has_work based on cs->interrupt_request
  target/ppc: move the p*_interrupt_powersave methods to excp_helper.c

 hw/ppc/pnv_core.c        |   1 +
 hw/ppc/ppc.c             |   7 +-
 hw/ppc/spapr_hcall.c     |   6 ++
 hw/ppc/spapr_rtas.c      |   2 +-
 target/ppc/cpu.c         |   2 +
 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_init.c    | 196 +--------------------------------------
 target/ppc/excp_helper.c | 144 ++++++++++++++++++++++++++++
 target/ppc/helper.h      |   1 +
 target/ppc/helper_regs.c |   2 +
 target/ppc/internal.h    |   6 --
 target/ppc/translate.c   |  11 ++-
 12 files changed, 170 insertions(+), 209 deletions(-)

-- 
2.25.1


