Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F065058B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 11:21:15 +0200 (CEST)
Received: from localhost ([::1]:49018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfLA2-0000t4-PE
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 05:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hfL7V-0007um-25
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hfL7U-0003aW-2d
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:18:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40932)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hfL7T-0003JD-Sm
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3201330842CE;
 Mon, 24 Jun 2019 09:18:24 +0000 (UTC)
Received: from xz-x1.redhat.com (ovpn-12-60.pek2.redhat.com [10.72.12.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B93395C1B5;
 Mon, 24 Jun 2019 09:18:15 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2019 17:18:09 +0800
Message-Id: <20190624091811.30412-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 24 Jun 2019 09:18:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] intel_iommu: Fix unexpected unmaps
 during global unmap
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, peterx@redhat.com,
 Auger Eric <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- rename helper to get_naturally_aligned_size(), simplify the
  codes as suggested [Paolo]
- check against vtd page size when looping over for unmaps [Yan]
- add r-b for Eric

Please review, thanks.

Peter Xu (1):
  intel_iommu: Fix unexpected unmaps during global unmap

Yan Zhao (1):
  intel_iommu: Fix incorrect "end" for vtd_address_space_unmap

 hw/i386/intel_iommu.c | 71 ++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 28 deletions(-)

--=20
2.21.0


