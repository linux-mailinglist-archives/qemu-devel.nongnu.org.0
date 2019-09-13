Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40410B19C3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 10:43:17 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8hAi-0003lP-Cy
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 04:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4a-0005eN-IF
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4Z-0008AH-L7
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:36:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4X-000894-KI; Fri, 13 Sep 2019 04:36:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2E71300BEA6;
 Fri, 13 Sep 2019 08:36:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B713A60F80;
 Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:12 +0200
Message-Id: <20190913083615.14719-4-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 08:36:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 3/6] exec: assert on
 memory_region_register_iommu_notifier() failure
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 235d6bc883..da30251a2b 100644
--- a/exec.c
+++ b/exec.c
@@ -692,7 +692,8 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
                             0,
                             HWADDR_MAX,
                             iommu_idx);
-        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
+        assert(!memory_region_register_iommu_notifier(notifier->mr,
+                                                      &notifier->n));
     }
=20
     if (!notifier->active) {
--=20
2.20.1


