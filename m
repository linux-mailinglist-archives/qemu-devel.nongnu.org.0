Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEE15447B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:04:52 +0100 (CET)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izgpv-0003uq-Rz
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1izgdH-00030E-Nj
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1izgdG-0000Zr-H8
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1izgdG-0000Xp-DS
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580993505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8KZ/TW2HT1XQWa+bFUi9md34JHzWwCTHP8M8ZEnN3U=;
 b=aRu+vacSxXHsJNH37Y4XdLH96dLEHLASIDFnugRJst6WMUQaCyQcJb5lx+/zD8eZiB/sXG
 nh/KUVnI37ihV+CiFl46/0f8Q8fcIc2YIWfKmVwFhFFMQ5ZLdyqAMN9JRgWtfirARQXPzg
 WEy5Pv2nGBfrToRQ+V9ZgVFncp9uQXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-JvAIFooiPIm5Czd5SGv1Bg-1; Thu, 06 Feb 2020 07:51:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA0118C43CD;
 Thu,  6 Feb 2020 12:51:42 +0000 (UTC)
Received: from localhost (unknown [10.36.118.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3401489A83;
 Thu,  6 Feb 2020 12:51:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/17] qcow2: Use a GString in report_unsupported_feature()
Date: Thu,  6 Feb 2020 13:51:19 +0100
Message-Id: <20200206125132.594625-5-mreitz@redhat.com>
In-Reply-To: <20200206125132.594625-1-mreitz@redhat.com>
References: <20200206125132.594625-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JvAIFooiPIm5Czd5SGv1Bg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

This is a bit more efficient than having to allocate and free memory
for each item.

The default size (60) is enough for all the existing incompatible
features or the "Unknown incompatible feature" message.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Message-id: 20200115135626.19442-1-berto@igalia.com
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index cef9d72b3a..e29fc07068 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -453,16 +453,15 @@ static void cleanup_unknown_header_ext(BlockDriverSta=
te *bs)
 static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
                                        uint64_t mask)
 {
-    char *features =3D g_strdup("");
-    char *old;
+    g_autoptr(GString) features =3D g_string_sized_new(60);
=20
     while (table && table->name[0] !=3D '\0') {
         if (table->type =3D=3D QCOW2_FEAT_TYPE_INCOMPATIBLE) {
             if (mask & (1ULL << table->bit)) {
-                old =3D features;
-                features =3D g_strdup_printf("%s%s%.46s", old, *old ? ", "=
 : "",
-                                           table->name);
-                g_free(old);
+                if (features->len > 0) {
+                    g_string_append(features, ", ");
+                }
+                g_string_append_printf(features, "%.46s", table->name);
                 mask &=3D ~(1ULL << table->bit);
             }
         }
@@ -470,14 +469,14 @@ static void report_unsupported_feature(Error **errp, =
Qcow2Feature *table,
     }
=20
     if (mask) {
-        old =3D features;
-        features =3D g_strdup_printf("%s%sUnknown incompatible feature: %"=
 PRIx64,
-                                   old, *old ? ", " : "", mask);
-        g_free(old);
+        if (features->len > 0) {
+            g_string_append(features, ", ");
+        }
+        g_string_append_printf(features,
+                               "Unknown incompatible feature: %" PRIx64, m=
ask);
     }
=20
-    error_setg(errp, "Unsupported qcow2 feature(s): %s", features);
-    g_free(features);
+    error_setg(errp, "Unsupported qcow2 feature(s): %s", features->str);
 }
=20
 /*
--=20
2.24.1


