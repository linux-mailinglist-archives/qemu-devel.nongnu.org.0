Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BF3CEE6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 16:38:10 +0200 (CEST)
Received: from localhost ([::1]:59588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hahub-0004I3-Pp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 10:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hahmD-0001Ud-5X
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 10:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hahmC-0002hY-5F
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 10:29:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hahm9-0002Nq-Q0; Tue, 11 Jun 2019 10:29:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A904B30C1AF9;
 Tue, 11 Jun 2019 14:28:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCFF760BE1;
 Tue, 11 Jun 2019 14:28:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 11 Jun 2019 16:28:19 +0200
Message-Id: <20190611142821.3874-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 11 Jun 2019 14:28:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] ARM SMMUv3: Fix spurious notification
 errors and stall with vfio-pci
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch fixes spurious translation configuration decoding errors
rarely happening on guest IOVA invalidation notifications.

The second patch fixes the guest stall observed when attempting to run
a guest exposed with a SMMUv3 and a VFIO-PCI device. As a reminder
SMMUv3 is not integrated with VFIO (the device will not work properly)
but this shouldn't prevent the guest from booting.

Best Regards

Eric

Eric Auger (2):
  hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations
  hw/arm/smmuv3: Implement dummy replay

 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

--=20
2.20.1


