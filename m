Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71D55BA93
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:48:46 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5q2f-0007Ve-QK
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5q01-00066I-4M; Mon, 27 Jun 2022 10:46:01 -0400
Received: from [200.168.210.66] (port=24325 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pzz-0005Gk-Ly; Mon, 27 Jun 2022 10:46:00 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:11 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 459D58001D4;
 Mon, 27 Jun 2022 11:11:11 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 0/6] Fix gen_*_exception error codes
Date: Mon, 27 Jun 2022 11:10:58 -0300
Message-Id: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:11.0535 (UTC)
 FILETIME=[C11BCBF0:01D88A2F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The first patch of this series is the RFC of [1] (hence the r-b in v1).
Patches 2~4 follow the other problems that Laurent pointed out, and
patches 5-6 fix similar problems that I found.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00400.html

Matheus Ferst (6):
  target/ppc: Fix gen_priv_exception error value in mfspr/mtspr
  target/ppc: fix exception error value in slbfee
  target/ppc: remove mfdcrux and mtdcrux
  target/ppc: fix exception error code in helper_{load,store}_dcr
  target/ppc: fix PMU Group A register read/write exceptions
  target/ppc: fix exception error code in spr_write_excp_vector

 target/ppc/cpu.h                 |  6 ++----
 target/ppc/helper.h              |  2 +-
 target/ppc/power8-pmu-regs.c.inc | 10 ++++-----
 target/ppc/timebase_helper.c     |  6 +++---
 target/ppc/translate.c           | 36 ++++++++------------------------
 5 files changed, 20 insertions(+), 40 deletions(-)

-- 
2.25.1


