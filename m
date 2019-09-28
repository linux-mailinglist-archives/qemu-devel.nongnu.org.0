Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE6C11F0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 21:07:18 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEI3p-0002bU-Gw
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 15:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iEI0R-0007UP-7W
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 15:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iEI0O-00086X-R4
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 15:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iEI0O-00081z-KE; Sat, 28 Sep 2019 15:03:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E678C05683F;
 Sat, 28 Sep 2019 19:03:42 +0000 (UTC)
Received: from thuth.com (ovpn-116-92.ams2.redhat.com [10.36.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D103600C4;
 Sat, 28 Sep 2019 19:03:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org
Subject: [PATCH] configure: Remove s390 (31-bit mode) from the list of
 supported CPUs
Date: Sat, 28 Sep 2019 21:03:34 +0200
Message-Id: <20190928190334.6897-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Sat, 28 Sep 2019 19:03:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On IBM Z, KVM in the kernel is only implemented for 64-bit mode, and
with regards to TCG, we also only support 64-bit host CPUs (see the
check at the beginning of tcg/s390/tcg-target.inc.c), so we should
remove s390 (without "x", i.e. the old 31-bit mode CPUs) from the
list of supported CPUs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 397bb476e1..a4488c6705 100755
--- a/configure
+++ b/configure
@@ -728,7 +728,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
+  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
     supported_cpu="yes"
   ;;
   ppc64le)
-- 
2.18.1


