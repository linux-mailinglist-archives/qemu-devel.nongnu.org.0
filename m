Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2D8F116
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:43:14 +0200 (CEST)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIqG-0001PU-NG
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIiu-0001ag-Iu
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIir-0002H3-5Z
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIir-0002Gm-0i
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4475A30A7BAE;
 Thu, 15 Aug 2019 16:35:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBAE0BAAC;
 Thu, 15 Aug 2019 16:35:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:40 +0100
Message-Id: <20190815163504.18937-10-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 16:35:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/33] migration/savevm: flush file for
 iterable_only case
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

It would be proper to flush file even for iterable_only case.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190709140924.13291-2-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index a2a5f89b75..0bfdceefcc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1292,7 +1292,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f,=
 bool iterable_only,
     }
=20
     if (iterable_only) {
-        return 0;
+        goto flush;
     }
=20
     vmdesc =3D qjson_new();
@@ -1353,6 +1353,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f,=
 bool iterable_only,
     }
     qjson_destroy(vmdesc);
=20
+flush:
     qemu_fflush(f);
     return 0;
 }
--=20
2.21.0


