Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AAB79DA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 14:54:06 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAvwj-0000Vz-8h
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 08:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsO-0006Le-6N
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvmP-0002Az-T4
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:43:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49120)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvmP-0002AG-OA; Thu, 19 Sep 2019 08:43:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 147F520EB;
 Thu, 19 Sep 2019 12:43:25 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F3A5D6B0;
 Thu, 19 Sep 2019 12:43:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:41:12 +0200
Message-Id: <20190919124115.11510-32-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 19 Sep 2019 12:43:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 31/34] pc-bios/s390-ccw/net: fix a possible
 memory leak in get_uuid()
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
Cc: Yifan Luo <luoyifan@cmss.chinamobile.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yifan Luo <luoyifan@cmss.chinamobile.com>

There is a possible memory leak in get_uuid(). Should free allocated mem
before
return NULL.

Signed-off-by: Yifan Luo <luoyifan@cmss.chinamobile.com>
Message-Id: <02cf01d55267$86cf2850$946d78f0$@cmss.chinamobile.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/netmain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
index f3542cb2cf11..f2dcc01e2725 100644
--- a/pc-bios/s390-ccw/netmain.c
+++ b/pc-bios/s390-ccw/netmain.c
@@ -269,6 +269,7 @@ static const char *get_uuid(void)
                  : "d" (r0), "d" (r1), [addr] "a" (buf)
                  : "cc", "memory");
     if (cc) {
+        free(mem);
         return NULL;
     }
=20
--=20
2.20.1


