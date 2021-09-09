Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E1405E16
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 22:38:32 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOQoZ-0008Lx-5P
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 16:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQld-0004RC-KZ; Thu, 09 Sep 2021 16:35:29 -0400
Received: from [201.28.113.2] (port=9947 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQlZ-0005xi-MV; Thu, 09 Sep 2021 16:35:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 9 Sep 2021 17:35:15 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 54B3D80121D;
 Thu,  9 Sep 2021 17:35:15 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/2] Require hypervisor privilege for tlbie[l] when PSR=0 and
 HR=1.
Date: Thu,  9 Sep 2021 17:34:37 -0300
Message-Id: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Sep 2021 20:35:15.0711 (UTC)
 FILETIME=[324CC0F0:01D7A5BA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: leandro.lupori@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

While working on FreeBSD radix support, Leandro Lupori (CC'ed) noticed
that the latest build still fails in KVM but works in TCG[1]. This
difference occurs because the current implementation of "tlbiel" does
not validate the instruction parameters and always check for supervisor
privilege.

This patch series partially address this problem by requiring hypervisor
privilege for radix mode when PSR=0. The validation of other parameters
can be done when we move storage control instructions to decodetree.

[1] To reproduce the issue, grab an ISO from [2] run qemu as

qemu-system-ppc64 -cpu power9 -m 2G \
    -machine pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
    -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso

or

qemu-system-ppc64 -cpu power9 -m 2G -enable-kvm \
    -machine pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
    -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso

Stop the boot at the prompt and use

OK set radix_mmu=1
OK boot

[2] https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/

Matheus Ferst (2):
  target/ppc: add LPCR[HR] to DisasContext and hflags
  target/ppc: Check privilege level based on PSR and LPCR[HR] in
    tlbie[l]

 target/ppc/cpu.h         |  1 +
 target/ppc/helper_regs.c |  3 +++
 target/ppc/translate.c   | 23 ++++++++++++++++++-----
 3 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.25.1


