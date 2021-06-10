Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511693A3163
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:52:12 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNub-0003eW-Tp
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lrNqj-00011x-NH; Thu, 10 Jun 2021 12:48:09 -0400
Received: from [201.28.113.2] (port=50320 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lrNqi-0003S0-0j; Thu, 10 Jun 2021 12:48:09 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 10 Jun 2021 13:47:03 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 960288014C4;
 Thu, 10 Jun 2021 13:47:03 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/3] target/ppc: mmu cleanup
Date: Thu, 10 Jun 2021 13:46:45 -0300
Message-Id: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 10 Jun 2021 16:47:03.0758 (UTC)
 FILETIME=[3DAB46E0:01D75E18]
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

This patch series aims to clean up some of the code  mmu_helper.c,
including removing the #includes inside ifdef.

Helpers are in mmu_helper.c now and code that is needed in a !TCG build
is in mmu_common.c.

Comments are welcome, thanks,
Lucas Mateus.
Based-on: 6f398e533f5e259b4f937f4aa9de970f7201d166 

Lucas Mateus Castro (alqotel) (3):
  target/ppc: Turn ppc_tlb_invalid_all in a noop
  target/ppc: divided mmu_helper.c in 2 files
  target/ppc: moved ppc_store_sdr1 to mmu_common.c

 target/ppc/cpu.c        |   28 -
 target/ppc/cpu.h        |   21 +
 target/ppc/internal.h   |   26 +
 target/ppc/meson.build  |    6 +-
 target/ppc/mmu_common.c | 1651 +++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c | 1606 +------------------------------------
 6 files changed, 1703 insertions(+), 1635 deletions(-)
 create mode 100644 target/ppc/mmu_common.c

-- 
2.17.1


