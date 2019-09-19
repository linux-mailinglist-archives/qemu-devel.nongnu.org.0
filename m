Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9040B823E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 22:09:54 +0200 (CEST)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB2kT-000556-Ns
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 16:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tasleson@redhat.com>) id 1iB2dC-0006EP-It
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 16:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tasleson@redhat.com>) id 1iB2QA-00027H-HA
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 15:48:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tasleson@redhat.com>) id 1iB2QA-00026Q-Br
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 15:48:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D3E03C92D
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 19:48:52 +0000 (UTC)
Received: from sulaco.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B4D5D6D0;
 Thu, 19 Sep 2019 19:48:51 +0000 (UTC)
From: Tony Asleson <tasleson@redhat.com>
To: qemu-devel@nongnu.org,
	kwolf@redhat.com
Subject: [RFC 3/4] NVMe media error reporting
Date: Thu, 19 Sep 2019 14:48:46 -0500
Message-Id: <20190919194847.18518-4-tasleson@redhat.com>
In-Reply-To: <20190919194847.18518-1-tasleson@redhat.com>
References: <20190919194847.18518-1-tasleson@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 19 Sep 2019 19:48:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rudimentary and basic support for returning NVMe errors.

Signed-off-by: Tony Asleson <tasleson@redhat.com>
---
 hw/block/nvme.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 12d8254250..faf72c2b8c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,6 +25,7 @@
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
  */
=20
+#include "block/error_inject.h"
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/block/block.h"
@@ -390,6 +391,13 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *=
ns, NvmeCmd *cmd,
         return NVME_LBA_RANGE | NVME_DNR;
     }
=20
+    if (!is_write) {
+        uint64_t error_sector =3D 0;
+        if (error_in_read(n->serial, slba, nlb, &error_sector)) {
+            return NVME_UNRECOVERED_READ | NVME_DNR;
+        }
+    }
+
     if (nvme_map_prp(&req->qsg, &req->iov, prp1, prp2, data_size, n)) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
         return NVME_INVALID_FIELD | NVME_DNR;
--=20
2.21.0


