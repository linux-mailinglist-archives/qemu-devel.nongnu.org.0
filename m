Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9413752D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 18:48:48 +0100 (CET)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipyOs-0006Ua-Dz
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 12:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyAJ-0004FH-Ta
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyAI-0002bg-GP
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyAI-0002aG-Bl
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YenyR+cDlGnKbLpY/elkWxAa8k3PezuARzjo1X24+Yw=;
 b=YBnaC2CXPjlVuwkZ48aAbA2rqk+QNlyrs5sqxzdliQ5DZO0ev1R+jSjlDqqJt2N2oKUQm0
 ec0uoDHU9/Canf0kBQsYjGsRlqRTWjJ72zCQCoygVA0l11kGQ3+itTudtV8NGDE2hEixqX
 RUKtcHg3C1JgEpjJvT+ARK+oxMy5qtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Fm2T6eCWPFaTofxLe91aaQ-1; Fri, 10 Jan 2020 12:33:40 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65FC6800D48;
 Fri, 10 Jan 2020 17:33:38 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB9619C4F;
 Fri, 10 Jan 2020 17:33:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] migration: Fix incorrect integer->float conversion
 caught by clang
Date: Fri, 10 Jan 2020 18:31:56 +0100
Message-Id: <20200110173215.3865-10-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Fm2T6eCWPFaTofxLe91aaQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fangrui Song <i@maskray.me>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fangrui Song <i@maskray.me>

Clang does not like qmp_migrate_set_downtime()'s code to clamp double
@value to 0..INT64_MAX:

    qemu/migration/migration.c:2038:24: error: implicit conversion from 'lo=
ng' to 'double' changes value from 9223372036854775807 to 92233720368547758=
08 [-Werror,-Wimplicit-int-float-conversion]

The warning will be enabled by default in clang 10. It is not
available for clang <=3D 9.

The clamp is actually useless; @value is checked to be within
0..MAX_MIGRATE_DOWNTIME_SECONDS immediately before.  Delete it.

While there, make the conversion from double to int64_t explicit.

Signed-off-by: Fangrui Song <i@maskray.me>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[Patch split, commit message improved]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 27500d09a9..f79d0bf89a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2035,11 +2035,10 @@ void qmp_migrate_set_downtime(double value, Error *=
*errp)
     }
=20
     value *=3D 1000; /* Convert to milliseconds */
-    value =3D MAX(0, MIN(INT64_MAX, value));
=20
     MigrateSetParameters p =3D {
         .has_downtime_limit =3D true,
-        .downtime_limit =3D value,
+        .downtime_limit =3D (int64_t)value,
     };
=20
     qmp_migrate_set_parameters(&p, errp);
--=20
2.24.1


