Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC61930A9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 19:50:32 +0100 (CET)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHB6l-0004Ux-VG
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 14:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jHB47-00026z-4T
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 14:47:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jHB46-0003gq-7A
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 14:47:47 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60749)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jHB45-0003g5-AF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 14:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585162064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnv3awp4VN8xXiCk1fwWSqRez1nXNOKyCpBaU0jBJ4c=;
 b=KIEnuBo0stzaaOkzA44Fh75So3Cayk0l4K/VFdkBKacX90P09t3gLf8uKBUO79NtNEEAI/
 CtuYBXtzC2VfbXK6BtUqfI8Pwe1Q8i+V24gJIerVc//NWo2/QVbUIUZrZJutLXIXo2M70G
 oWOrBDnFO6FFDoH21Gz/mCc/lI+Ng0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-i5qjA_jkNumXA4kHX-4fOg-1; Wed, 25 Mar 2020 14:47:40 -0400
X-MC-Unique: i5qjA_jkNumXA4kHX-4fOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E0081005509;
 Wed, 25 Mar 2020 18:47:39 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE7BB60BF3;
 Wed, 25 Mar 2020 18:47:38 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0 3/3] object-add: don't create return value if failed
Date: Wed, 25 Mar 2020 19:47:23 +0100
Message-Id: <20200325184723.2029630-4-marcandre.lureau@redhat.com>
In-Reply-To: <20200325184723.2029630-1-marcandre.lureau@redhat.com>
References: <20200325184723.2029630-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If object-add failed, no need to create a return value that may later
be leaked.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qom/qom-qmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 435193b036..6bd137ccbf 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -287,8 +287,8 @@ void qmp_object_add(QDict *qdict, QObject **ret_data, E=
rror **errp)
     visit_free(v);
     if (obj) {
         object_unref(obj);
+        *ret_data =3D QOBJECT(qdict_new());
     }
-    *ret_data =3D QOBJECT(qdict_new());
 }
=20
 void qmp_object_del(const char *id, Error **errp)
--=20
2.26.0.rc2.42.g98cedd0233


