Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9468B064
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 09:01:19 +0200 (CEST)
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxQo3-0006OH-2n
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 03:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57975)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxQmH-0004yu-Ho
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 02:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxQmG-0003Lq-HG
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 02:59:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38159 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxQmF-0003JE-8w; Tue, 13 Aug 2019 02:59:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4673VM5jyVz9sNm; Tue, 13 Aug 2019 16:59:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565679563;
 bh=paputZaqccUW+iVp8WnLv1n+G/bFHNi0dohCddlcj3g=;
 h=From:To:Cc:Subject:Date:From;
 b=pYnZ0lLQZj90IXYpFHES4iSsypQWx8ZJFcrFtlPelwEDMcmISa4i9eBfcF1B2jHlc
 LfqziF/ah+iN48gVdrShn5czaXGg3U9+ei7nulVnqNWySwvf5jPkrDLoiX3i38NmW5
 9byeD8EG3kjBBII4VkuDDrgKRXgVQL5b2+z4tovM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 13 Aug 2019 16:59:18 +1000
Message-Id: <20190813065920.23203-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 0/2] ppc-for-4.1 queue 20190813
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
Cc: clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5e7bcdcfe69ce0fad66012b2cfb2035003c37e=
ef:

  display/bochs: fix pcie support (2019-08-12 16:36:41 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190813

for you to fetch changes up to 310cda5b5e9df642b19a0e9c504368ffba3b3ab9:

  spapr/xive: Fix migration of hot-plugged CPUs (2019-08-13 16:50:30 +100=
0)

----------------------------------------------------------------
ppc patch queue 2019-08-13 (last minute qemu-4.1 fixes)

Here's a very, very last minute pull request for qemu-4.1.  This fixes
two nasty bugs with the XIVE interrupt controller in "dual" mode
(where the guest decides which interrupt controller it wants to use).
One occurs when resetting the guest while I/O is active, and the other
with migration of hotplugged CPUs.

The timing here is very unfortunate.  Alas, we only spotted these bugs
very late, and I was sick last week, delaying analysis and fix even
further.

This series hasn't had nearly as much testing as I'd really like, but
I'd still like to squeeze it into qemu-4.1 if possible, since
definitely fixing two bad bugs seems like an acceptable tradeoff for
the risk of introducing different bugs.

----------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      spapr/xive: Fix migration of hot-plugged CPUs

David Gibson (1):
      spapr: Reset CAS & IRQ subsystem after devices

 hw/intc/spapr_xive_kvm.c | 19 +++++++++++++++++--
 hw/intc/xive.c           | 21 ++++++++++++++++++++-
 hw/ppc/spapr.c           | 24 ++++++++++++------------
 include/hw/ppc/xive.h    |  1 +
 4 files changed, 50 insertions(+), 15 deletions(-)

