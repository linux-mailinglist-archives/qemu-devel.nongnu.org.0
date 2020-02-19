Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127761639E7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 03:16:08 +0100 (CET)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4EuF-0005jX-1o
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 21:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4EsU-0003y9-3p
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 21:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4EsT-00011j-41
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 21:14:18 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35477)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4EsS-0000z4-Py; Tue, 18 Feb 2020 21:14:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Mh9f2pGHz9sSD; Wed, 19 Feb 2020 13:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582078454;
 bh=9Vl5kb2z+w3qlwpTjNYUwWcx/DhdJluC3saDRVBLnKE=;
 h=From:To:Cc:Subject:Date:From;
 b=QZ7rSGviEulCDm/HCkxi0USMk+QwKHYt5Vg4zzNRMohmaK6IJ492rZjwxH00ganOI
 xeZps8QTXii6WiQWsdtMTXp+9NBUsHvB/Zo2pwtLkZyBdSvlYmq2GXjl4ypGtr+MOE
 fqUyFDnutKzujzuW0/8689JRf/M4kDZqf9n/fxMQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org,
	philmd@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] target/ppc: Correct some errors with real mode
 handling
Date: Wed, 19 Feb 2020 13:13:57 +1100
Message-Id: <20200219021409.21332-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER "book S" (server class) cpus have a concept of "real mode" where
MMU translation is disabled... sort of.  In fact this can mean a bunch
of slightly different things when hypervisor mode and other
considerations are present.

We had some errors in edge cases here, so clean some things up and
correct them.

Changes since v3:
 * Fix style errors reported by checkpatch
Changes since v2:
 * Removed 32-bit hypervisor stubs more completely
 * Minor polish based on review comments
Changes since RFCv1:
 * Add a number of extra patches taking advantage of the initial
   cleanups

David Gibson (12):
  ppc: Remove stub support for 32-bit hypervisor mode
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
  target/ppc: Streamline construction of VRMA SLB entry
  target/ppc: Don't store VRMA SLBE persistently

 hw/ppc/spapr_cpu_core.c         |   6 +-
 target/ppc/cpu-qom.h            |   1 +
 target/ppc/cpu.h                |  25 +--
 target/ppc/mmu-hash64.c         | 331 ++++++++++++--------------------
 target/ppc/translate_init.inc.c |  63 ++++--
 5 files changed, 179 insertions(+), 247 deletions(-)

--=20
2.24.1


