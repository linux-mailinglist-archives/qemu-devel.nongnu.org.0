Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F551544A4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:12:31 +0100 (CET)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izgxK-0002U8-4a
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1izgtI-00031n-KV
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1izgtH-0001GP-ML
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24857
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1izgtH-0001Fy-JT
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580994499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fwv88teGsU/TtRahBGM1Tj86M1w59NaS8vu2Xy+LddA=;
 b=ACXATI/H9h5egAuAnO6NeaxqrCF39fs06DU17K4Xou/8RbfpRXUOv8JlyYwr0T5tRv1SBQ
 flMeUGWMzm2lDkfcjOOkLYG+MRz3o8wCDgVwZB714NnXqjribhntbgI6Ip4Q7ULc+goAie
 iZt78ttNrq8WczKdMz6d79uzWnOesSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-OF7j6KgrO3Co0QLFNRK_Ng-1; Thu, 06 Feb 2020 08:08:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C67F48010CB;
 Thu,  6 Feb 2020 13:08:16 +0000 (UTC)
Received: from localhost (unknown [10.36.118.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E51E65C1D8;
 Thu,  6 Feb 2020 13:08:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/147: Fix drive parameters
Date: Thu,  6 Feb 2020 14:08:12 +0100
Message-Id: <20200206130812.612960-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: OF7j6KgrO3Co0QLFNRK_Ng-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

8dff69b94 added an aio parameter to the drive parameter but forgot to
add a comma before, thus breaking the test.  Fix it again.

Fixes: 8dff69b9415b4287e900358744b732195e1ab2e2
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/147 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 2b6f859a09..30782b8924 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -134,7 +134,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
         self.server.add_drive_raw('if=3Dnone,id=3Dnbd-export,' +
                                   'file=3D%s,' % test_img +
                                   'format=3D%s,' % imgfmt +
-                                  'cache=3D%s' % cachemode +
+                                  'cache=3D%s,' % cachemode +
                                   'aio=3D%s' % aiomode)
         self.server.launch()
=20
--=20
2.24.1


