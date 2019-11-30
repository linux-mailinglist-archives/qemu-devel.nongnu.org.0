Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C410DF09
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 20:48:53 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ib8jc-0004DQ-Oc
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 14:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ib8dx-0006ZC-CM
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ib8dv-0005Dn-4q
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:43:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ib8du-0005Bg-T9
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575142976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzScTi0f13u/09c3vl32cClyMnYp+cJJAy0b4UZrYmo=;
 b=h0E4Fm6tu0IHKU6MCkLg73OojrGv0DGeVy/WCgb5OQt+TCrSTucjcW2cq/dbhT5POK3cuY
 DNF0cC92ZSpUB22nCW8UHHpN0EImP1PS3h9jbhXX1iqkj6YxULWXbLSX9lBh4Y2EebQMM7
 oP/pNQRiDVYzX8m9oY0BDNwNApSmEAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-FHyFTlptOQKGHPVuX3yJ6w-1; Sat, 30 Nov 2019 14:42:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BBC110054E3;
 Sat, 30 Nov 2019 19:42:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C3375D9E1;
 Sat, 30 Nov 2019 19:42:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40B921135A63; Sat, 30 Nov 2019 20:42:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/21] s390x: Fix latent query-cpu-definitions error handling
 bug
Date: Sat, 30 Nov 2019 20:42:37 +0100
Message-Id: <20191130194240.10517-19-armbru@redhat.com>
In-Reply-To: <20191130194240.10517-1-armbru@redhat.com>
References: <20191130194240.10517-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: FHyFTlptOQKGHPVuX3yJ6w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Cornelia Huck <cohuck@redhat.com>, vsementsov@virtuozzo.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp_query_cpu_definitions() tries to ignore get_max_cpu_model()'s
errors.  However, it crashes when its @errp argument is null or
&error_abort, and exit(1)s when it's &error_fatal.  Messed up in
commit 38cba1f4d8 "s390x: return unavailable features via
query-cpu-definitions".

The bug can't bite as no caller actually passes such @errp values.
Fix it anyway.

Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target/s390x/cpu_models.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 3ed301b5e5..547bab8ac3 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -462,11 +462,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error=
 **errp)
         .list =3D NULL,
     };
=20
-    list_data.model =3D get_max_cpu_model(errp);
-    if (*errp) {
-        error_free(*errp);
-        *errp =3D NULL;
-    }
+    list_data.model =3D get_max_cpu_model(NULL);
=20
     object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
                          &list_data);
--=20
2.21.0


