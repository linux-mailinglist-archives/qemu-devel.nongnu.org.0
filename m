Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92320559F35
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:24:41 +0200 (CEST)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4n2u-0002LD-1k
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4mvs-0007T7-6q; Fri, 24 Jun 2022 13:17:24 -0400
Received: from [187.72.171.209] (port=15972 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4mvq-0008Lo-DF; Fri, 24 Jun 2022 13:17:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 14:17:13 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E806880003F;
 Fri, 24 Jun 2022 14:17:12 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v2 0/3] ppc: Check for bad Radix configs
Date: Fri, 24 Jun 2022 14:16:50 -0300
Message-Id: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 24 Jun 2022 17:17:13.0415 (UTC)
 FILETIME=[3EDE4570:01D887EE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
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

Changes from v1:
- Use proper format defines in logs
- Optimized ppc_radix64_is_valid_level() and added a comment with
  instructions on how to proceed when adding new Radix CPUs with
  different configurations
- Moved calls to ppc_radix64_is_valid_level() outside of
  ppc_radix64_next_level(). This also avoids calling it twice for
  level 0, through ppc_radix64_walk_tree().
- Removed debug ifdefs from PDE/PTE alignment checks

Leandro Lupori (3):
  ppc: Check partition and process table alignment
  target/ppc: Improve Radix xlate level validation
  target/ppc: Check page dir/table base alignment

 hw/ppc/spapr.c             |  5 +++
 hw/ppc/spapr_hcall.c       |  9 +++++
 target/ppc/mmu-book3s-v3.c |  5 +++
 target/ppc/mmu-radix64.c   | 79 +++++++++++++++++++++++++++++++-------
 4 files changed, 85 insertions(+), 13 deletions(-)

-- 
2.25.1


