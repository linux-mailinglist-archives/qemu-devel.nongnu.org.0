Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C575525CD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:32:17 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3O4F-00036h-Pe
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3Nzi-000149-8P; Mon, 20 Jun 2022 16:27:34 -0400
Received: from [187.72.171.209] (port=41085 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3Nzg-0000Ag-JJ; Mon, 20 Jun 2022 16:27:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 20 Jun 2022 17:27:22 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 82879800048;
 Mon, 20 Jun 2022 17:27:22 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 0/3] ppc: Check for bad Radix configs
Date: Mon, 20 Jun 2022 17:27:01 -0300
Message-Id: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 20 Jun 2022 20:27:22.0897 (UTC)
 FILETIME=[25CC1010:01D884E4]
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

On PowerPC64 using Radix MMU, when partition or process table is not
properly aligned, according to their size, an exception must be raised
(DSI/ISI/HDSI/HISI) and the "Bad Radix Config" bit must be set in the
appropriate register.
Hardware and KVM already do this, but TCG was missing this part.

This patch series also improves the code that validates each Radix Tree
level, by checking the number of levels and the size of each one.

Finally, when DEBUG_MMU is defined, PDE/PTE base address alignment is
also checked and reported, to make it easier to detect invalid
configurations.

Leandro Lupori (3):
  ppc: Check partition and process table alignment
  target/ppc: Improve Radix xlate level validation
  target/ppc: Check page dir/table base alignment

 hw/ppc/spapr.c             |  5 +++
 hw/ppc/spapr_hcall.c       |  9 +++++
 target/ppc/mmu-book3s-v3.c |  5 +++
 target/ppc/mmu-radix64.c   | 74 ++++++++++++++++++++++++++++++++------
 4 files changed, 82 insertions(+), 11 deletions(-)

-- 
2.25.1


