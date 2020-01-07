Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4893131ECA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 06:14:53 +0100 (CET)
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iogtZ-0003Ik-Uo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 23:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iognM-0005Lc-NQ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iognI-0004e8-8D
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:44 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:41111)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iognH-0004Vc-U1; Mon, 06 Jan 2020 23:48:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sKdW5mPgz9sRK; Tue,  7 Jan 2020 15:48:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578372511;
 bh=Y1fJLmHsx1ZlkSB3wbl8Ri4K1UbGDGFlzQzbv2B7WYU=;
 h=From:To:Cc:Subject:Date:From;
 b=BV5fei4JrPN1TkKMk0DpAoJiaZLaYm1qawLA7gdJ7RdobZ02JhtlmCLgwLHpbK5Se
 kiXfizDlnfwFflmzi/j1sfhlTPBP6fkNSRVvRRwjtnEHzDJw4Dk9VHwrhRTZqvBSYc
 RUMNuBdDj8OadN7buAoCZuf9WLZ8j3/c0Njp+qGk=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	groug@kaod.org,
	philmd@redhat.com,
	clg@kaod.org
Subject: [PATCH v2 00/10] target/ppc: Correct some errors with real mode
 handling
Date: Tue,  7 Jan 2020 15:48:17 +1100
Message-Id: <20200107044827.471355-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 paulus@samba.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER "book S" (server class) cpus have a concept of "real mode" where
MMU translation is disabled... sort of.  In fact this can mean a bunch
of slightly different things when hypervisor mode and other
considerations are present.

We had some errors in edge cases here, so clean some things up and
correct them.

Changes since RFCv1:
 * Add a number of extra patches taking advantage of the initial
   cleanups

David Gibson (10):
  ppc: Drop PPC_EMULATE_32BITS_HYPV stub
  ppc: Remove stub of PPC970 HID4 implementation
  target/ppc: Correct handling of real mode accesses with vhyp on hash
    MMU
  target/ppc: Introduce ppc_hash64_use_vrma() helper
  spapr, ppc: Remove VPM0/RMLS hacks for POWER9
  target/ppc: Remove RMOR register from POWER9 & POWER10
  target/ppc: Use class fields to simplify LPCR masking
  target/ppc: Streamline calculation of RMA limit from LPCR[RMLS]
  target/ppc: Correct RMLS table
  target/ppc: Only calculate RMLS derived RMA limit on demand

 hw/ppc/spapr_cpu_core.c         |   6 +-
 target/ppc/cpu-qom.h            |   1 +
 target/ppc/cpu.h                |   8 --
 target/ppc/mmu-hash64.c         | 241 ++++++++++++--------------------
 target/ppc/translate_init.inc.c |  54 ++++---
 5 files changed, 130 insertions(+), 180 deletions(-)

--=20
2.24.1


