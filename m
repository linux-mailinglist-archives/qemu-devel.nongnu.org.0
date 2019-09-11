Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA7AF4CD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 06:07:45 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tux-0002Nw-N1
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 00:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsS-0000TD-8k
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsO-0002np-8E
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:06 -0400
Received: from ozlabs.org ([203.11.71.1]:37365)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i7tsK-0002gb-Hz; Wed, 11 Sep 2019 00:05:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46SpFg68Lnz9sP6; Wed, 11 Sep 2019 14:04:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568174695;
 bh=LGrQXH4yGXMJmAViGew/M2Z062dwDk7rodvJCq9nOAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JPRztFDuVJ99PcVruEKGJeNIx2Bm843Uou5GbtYSwyiJVe39bBEv2r/BG9+TJAPRu
 MyKU6hzDHN3CsmpNth8D4Ml63Zwj+eTM1zJL4pyd+H6O5UlMr/iJ5OSFvQn/+YSNmf
 conHnmZ+1cF5Qi+twhhubQezQXG89dzlUgd+NZ4I=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 11 Sep 2019 14:04:45 +1000
Message-Id: <20190911040452.8341-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 0/7] spapr: CAS and reset cleanup preliminaries
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PAPR defines a feature negotiation protocol between host and guest
called ibm,client-architecture-support or CAS.  When invoked by the
guest this can either result in updated device tree information being
given to the guest to indicate the new configuration, or it can
trigger a reboot (called a CAS reboot) for more wide reaching
configuration changes.

CAS changes are time consuming and irritating for the user, so we'd
like to avoid them as much as possible.  We hope we can avoid them in
all situations, in fact, but there's some work to do to get there.

This series has some initial changes that get us closer to that mark.

Alexey Kardashevskiy (4):
  spapr: Fixes a leak in CAS
  spapr: Skip leading zeroes from memory@ DT node names
  spapr: Do not put empty properties for -kernel/-initrd/-append
  spapr: Stop providing RTAS blob

David Gibson (3):
  spapr: Simplify handling of pre ISA 3.0 guest workaround handling
  spapr: Move handling of special NVLink numa node from reset to init
  spapr: Perform machine reset in a more sensible order

 MAINTAINERS                     |   2 -
 Makefile                        |   2 +-
 configure                       |   6 +-
 hw/ppc/spapr.c                  | 128 ++++++++++++++------------------
 hw/ppc/spapr_hcall.c            |   3 +-
 hw/ppc/spapr_rtas.c             |  41 ----------
 include/hw/ppc/spapr.h          |   4 +-
 pc-bios/spapr-rtas.bin          | Bin 20 -> 0 bytes
 pc-bios/spapr-rtas/Makefile     |  27 -------
 pc-bios/spapr-rtas/spapr-rtas.S |  37 ---------
 10 files changed, 58 insertions(+), 192 deletions(-)
 delete mode 100644 pc-bios/spapr-rtas.bin
 delete mode 100644 pc-bios/spapr-rtas/Makefile
 delete mode 100644 pc-bios/spapr-rtas/spapr-rtas.S

--=20
2.21.0


