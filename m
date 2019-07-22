Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77023706D8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 19:27:03 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpc5W-0001Yz-Jr
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hpc5K-0001AW-7X
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hpc5D-0004Lu-Vw
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:26:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hpc5B-0004Js-D2; Mon, 22 Jul 2019 13:26:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA23785376;
 Mon, 22 Jul 2019 17:26:40 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D63A71001DE1;
 Mon, 22 Jul 2019 17:26:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 19:26:12 +0200
Message-Id: <20190722172616.28797-2-mreitz@redhat.com>
In-Reply-To: <20190722172616.28797-1-mreitz@redhat.com>
References: <20190722172616.28797-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 22 Jul 2019 17:26:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/5] block/nvme: fix doorbell stride
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Fix the math involving non standard doorbell stride

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190716163020.13383-2-mlevitsk@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 9896b7f7c6..82fdefccd6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -217,7 +217,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BlockDri=
verState *bs,
         error_propagate(errp, local_err);
         goto fail;
     }
-    q->cq.doorbell =3D &s->regs->doorbells[idx * 2 * s->doorbell_scale +=
 1];
+    q->cq.doorbell =3D &s->regs->doorbells[(idx * 2 + 1) * s->doorbell_s=
cale];
=20
     return q;
 fail:
--=20
2.21.0


