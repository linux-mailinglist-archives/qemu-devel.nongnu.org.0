Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FE1661ED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 17:11:32 +0100 (CET)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4oQF-0007ip-Nj
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 11:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4oNN-0002rk-86
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4oNM-000592-8m
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:08:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24974
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4oNM-000532-4c
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582214908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTx9JZmtFTD/Ejx3Xq+NYb931mqXMVJweEJBkYozBEA=;
 b=LsWToRc33VkPBDr+39v10gdkKN1cDsIkaf0BSO17W/UzK4FEjR7mqnbLsGyA76KxkCP5uP
 0rmuHgWrojxAA1//qbQ3Dz6lmqXEvVs+YXtHi5eZbKqF4OovLk9yGhRdcIC+uL0/tLqtjh
 3uoZKelduwsYth8d0JPDRX7NwlFTDLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-bcYY6jG8MI6dkOevnCACng-1; Thu, 20 Feb 2020 11:08:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D6788017DF;
 Thu, 20 Feb 2020 16:08:20 +0000 (UTC)
Received: from localhost (unknown [10.36.118.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF168AC5B;
 Thu, 20 Feb 2020 16:08:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/18] iotests/147: Fix drive parameters
Date: Thu, 20 Feb 2020 17:06:56 +0100
Message-Id: <20200220160710.533297-5-mreitz@redhat.com>
In-Reply-To: <20200220160710.533297-1-mreitz@redhat.com>
References: <20200220160710.533297-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bcYY6jG8MI6dkOevnCACng-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

8dff69b94 added an aio parameter to the drive parameter but forgot to
add a comma before, thus breaking the test.  Fix it again.

Fixes: 8dff69b9415b4287e900358744b732195e1ab2e2
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200206130812.612960-1-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/147 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index f4b0a11dba..d7a9f31089 100755
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


