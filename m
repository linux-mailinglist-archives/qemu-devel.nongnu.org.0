Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1F107577
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 17:11:08 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYBWV-00066w-Ki
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 11:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iYBR4-0000I3-Rr
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iYBR3-0002l1-NZ
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32604
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iYBR3-0002kj-JL
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574438729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pw2Brk0D+0cTmO+ThyXqjBZwmszkPvwLmjKihJY9kPE=;
 b=cKCFQCkujQabQSuDUGoWW35e29iyMs67Z3k2ENqq9w/jS5/heCkjrAWJyYNdloeFpV2ETj
 hfqiUwjgjs09DF0CAG2O6N+n5iWtKzWNNnaR/lvxvXvYj7kckbzZWt/zRnn2R8LBVmDPp3
 kcghpUAiGIrAjbXpyswMBrbHpt3K8To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Sn5ci1yxPPazAWuIFj5waQ-1; Fri, 22 Nov 2019 11:05:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6479A1883521;
 Fri, 22 Nov 2019 16:05:26 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF1D10372C3;
 Fri, 22 Nov 2019 16:05:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/8] qcow2: Declare BDRV_REQ_NO_FALLBACK supported
Date: Fri, 22 Nov 2019 17:05:06 +0100
Message-Id: <20191122160511.8377-4-kwolf@redhat.com>
In-Reply-To: <20191122160511.8377-1-kwolf@redhat.com>
References: <20191122160511.8377-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Sn5ci1yxPPazAWuIFj5waQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the common case, qcow2_co_pwrite_zeroes() already only modifies
metadata case, so we're fine with or without BDRV_REQ_NO_FALLBACK set.

The only exception is when using an external data file, where the
request is passed down to the block driver of the external data file. We
are forwarding the BDRV_REQ_NO_FALLBACK flag there, though, so this is
fine, too.

Declare the flag supported therefore.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index b201383c3d..3fa10bf807 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1722,7 +1722,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverStat=
e *bs, QDict *options,
         }
     }
=20
-    bs->supported_zero_flags =3D header.version >=3D 3 ? BDRV_REQ_MAY_UNMA=
P : 0;
+    bs->supported_zero_flags =3D header.version >=3D 3 ?
+                               BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK :=
 0;
=20
     /* Repair image if dirty */
     if (!(flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) && !bs->read_only &&
--=20
2.20.1


