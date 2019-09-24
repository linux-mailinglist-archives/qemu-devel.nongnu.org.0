Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D482BCC30
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 18:15:09 +0200 (CEST)
Received: from localhost ([::1]:47858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCnT1-0001i9-ST
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 12:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iCmuL-0008BP-B7
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iCmuJ-00069M-T7
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:39:17 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:35692
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iCmuJ-0005cL-NA; Tue, 24 Sep 2019 11:39:15 -0400
Received: from host86-138-245-63.range86-138.btcentralplus.com
 ([86.138.245.63] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iCmrR-0007WZ-EH; Tue, 24 Sep 2019 16:36:19 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Date: Tue, 24 Sep 2019 16:35:49 +0100
Message-Id: <20190924153556.27575-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/7] target/ppc: DFP fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes the DFP issue reported at https://bugs.launchpad.net/qemu/+bug/1841990
caused by the change in FP register storage in commit ef96e3ae96 "target/ppc:
move FP and VMX registers into aligned vsr register array" along with some
further tidy-up/improvements.

Patches 1 and 2 introduce get/set helper functions for reading and writing
DFP even-odd register pairs (rather than accessing the register pointers
directly) which then leads to the real fix in patch 3.

Following on from this patches 4 to 6 change the struct PPC_DFP internal
decimal representation from uint64[2] to ppc_vsr_t which enables us to use
the existing VsrD() macro to access the correct elements regardless of host
endian and remove the explicit HI_IDX and LO_IDX references.

Finally patch 7 simplifies the calls to set_dfp{64,128}() in DFP macros
which can now be generated directly by the preprocessor rather than requiring
an explicit if() statement.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (7):
  target/ppc: introduce get_dfp{64,128}() helper functions
  target/ppc: introduce set_dfp{64,128}() helper functions
  target/ppc: update {get,set}_dfp{64,128}() helper functions to
    read/write DFP numbers correctly
  target/ppc: introduce dfp_finalize_decimal{64,128}() helper functions
  target/ppc: change struct PPC_DFP decimal storage from uint64[2] to
    ppc_vsr_t
  target/ppc: use existing VsrD() macro to eliminate HI_IDX and LO_IDX
    from dfp_helper.c
  target/ppc: remove unnecessary if() around calls to set_dfp{64,128}()
    in DFP macros

 target/ppc/cpu.h        |   1 +
 target/ppc/dfp_helper.c | 384 ++++++++++++++++++++--------------------
 target/ppc/helper.h     |   2 +-
 3 files changed, 193 insertions(+), 194 deletions(-)

-- 
2.20.1


