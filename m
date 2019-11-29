Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A610D11B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 06:41:47 +0100 (CET)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaZ2G-0005Ne-Fn
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 00:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iaYv5-0002jQ-Rx
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 00:34:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iaYuv-0002x5-CW
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 00:34:17 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:50333)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iaYuv-0002Lr-0w; Fri, 29 Nov 2019 00:34:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47PNTz4HYxz9sPv; Fri, 29 Nov 2019 16:33:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575005639;
 bh=0HM60uAYu+yKL7iLi6nzmDD9IX9aj5HEoBJPQL/u0sw=;
 h=From:To:Cc:Subject:Date:From;
 b=B27fB5/qKVH+dZlrwh8cU0TxTPGkHFtz1qk9XWyTkstEQiTR8JVDZQMRqS4GnHUNu
 xcDWkG4QLCSfmVt4VRIarqiCKkmmOU0XPzSo7n2vIuePgCu94H1HObiwi73jZOlY5D
 dNf2lBeYQoLql7R4Gi5skyYK3VwZ7Gq88CPrVebg=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org
Subject: [for-5.0 0/4] spapr: Improvements to CAS feature negotiation
Date: Fri, 29 Nov 2019 16:33:52 +1100
Message-Id: <20191129053356.232413-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: lvivier@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series contains several cleanups to the handling of the
ibm,client-architecture-support firmware call used for boot time
feature negotiation between the guest OS and the firmware &
hypervisor.

Mostly it's just internal polish, but one significant user visible
change is that we no longer generate an extra CAS reboot to switch
between XICS and XIVE interrupt modes (by far the most common cause of
CAS reboots in practice).

David Gibson (4):
  spapr: Don't trigger a CAS reboot for XICS/XIVE mode changeover
  spapr: Improve handling of fdt buffer size
  spapr: Fold h_cas_compose_response() into
    h_client_architecture_support()
  spapr: Simplify ovec diff

 hw/ppc/spapr.c              | 92 +++----------------------------------
 hw/ppc/spapr_hcall.c        | 90 +++++++++++++++++++++++++-----------
 hw/ppc/spapr_ovec.c         | 30 ++++--------
 include/hw/ppc/spapr.h      |  4 +-
 include/hw/ppc/spapr_ovec.h |  4 +-
 5 files changed, 83 insertions(+), 137 deletions(-)

--=20
2.23.0


