Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D3181C94
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:44:07 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3Wg-0004MA-Ch
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3V7-0002XC-7U
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3V6-0001sv-3P
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60172
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3V5-0001qX-W2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOy2nQnwPIklpZwfOTtGVb1JhnKuVMjQB1kgp9F4dkI=;
 b=ej06Qd4j5+P8vJ93dXMPt7Co/VbaLVMgEYoNzSe08aMpXNdhAMudBSgBHNW8Fiks5Rd3c2
 UorO/H6ZjCAPfBE4NREFmHepTKgF5S5JUgwyWQuumsLu3J2r47Vq7LwSCHsnPxrOjFjRy3
 JewtFbeDA3KBhueUx449w10GAbrdz/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-wJ1QGxfkO1ioyARjRNF6Jg-1; Wed, 11 Mar 2020 11:42:25 -0400
X-MC-Unique: wJ1QGxfkO1ioyARjRNF6Jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D7F818A5502;
 Wed, 11 Mar 2020 15:42:24 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453CE91D74;
 Wed, 11 Mar 2020 15:42:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/13] qom-qmp-cmds: fix two memleaks in qmp_object_add
Date: Wed, 11 Mar 2020 16:42:06 +0100
Message-Id: <20200311154218.15532-2-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

'type/id' forgot to free in qmp_object_add, this patch fix that.

The leak stack:
Direct leak of 84 byte(s) in 6 object(s) allocated from:
    #0 0x7fe2a5ebf768 in __interceptor_malloc (/lib64/libasan.so.5+0xef768)
    #1 0x7fe2a5044445 in g_malloc (/lib64/libglib-2.0.so.0+0x52445)
    #2 0x7fe2a505dd92 in g_strdup (/lib64/libglib-2.0.so.0+0x6bd92)
    #3 0x56344954e692 in qmp_object_add /mnt/sdb/qemu-new/qemu_test/qemu/qo=
m/qom-qmp-cmds.c:258
    #4 0x563449960f5a in do_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/q=
api/qmp-dispatch.c:132
    #5 0x563449960f5a in qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/qapi=
/qmp-dispatch.c:175
    #6 0x563449498a30 in monitor_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/q=
emu/monitor/qmp.c:145
    #7 0x56344949a64f in monitor_qmp_bh_dispatcher /mnt/sdb/qemu-new/qemu_t=
est/qemu/monitor/qmp.c:234
    #8 0x563449a92a3a in aio_bh_call /mnt/sdb/qemu-new/qemu_test/qemu/util/=
async.c:136

Direct leak of 54 byte(s) in 6 object(s) allocated from:
    #0 0x7fe2a5ebf768 in __interceptor_malloc (/lib64/libasan.so.5+0xef768)
    #1 0x7fe2a5044445 in g_malloc (/lib64/libglib-2.0.so.0+0x52445)
    #2 0x7fe2a505dd92 in g_strdup (/lib64/libglib-2.0.so.0+0x6bd92)
    #3 0x56344954e6c4 in qmp_object_add /mnt/sdb/qemu-new/qemu_test/qemu/qo=
m/qom-qmp-cmds.c:267
    #4 0x563449960f5a in do_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/q=
api/qmp-dispatch.c:132
    #5 0x563449960f5a in qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/qapi=
/qmp-dispatch.c:175
    #6 0x563449498a30 in monitor_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/q=
emu/monitor/qmp.c:145
    #7 0x56344949a64f in monitor_qmp_bh_dispatcher /mnt/sdb/qemu-new/qemu_t=
est/qemu/monitor/qmp.c:234
    #8 0x563449a92a3a in aio_bh_call /mnt/sdb/qemu-new/qemu_test/qemu/util/=
async.c:136

Fixes: 5f07c4d60d091320186e7b0edaf9ed2cc16b2d1e
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Message-Id: <20200310064640.5059-1-pannengyuan@huawei.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/qom-qmp-cmds.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 49db926fcc..435193b036 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -247,26 +247,22 @@ void qmp_object_add(QDict *qdict, QObject **ret_data,=
 Error **errp)
     QDict *pdict;
     Visitor *v;
     Object *obj;
-    const char *type;
-    const char *id;
+    g_autofree char *type =3D NULL;
+    g_autofree char *id =3D NULL;
=20
-    type =3D qdict_get_try_str(qdict, "qom-type");
+    type =3D g_strdup(qdict_get_try_str(qdict, "qom-type"));
     if (!type) {
         error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
         return;
-    } else {
-        type =3D g_strdup(type);
-        qdict_del(qdict, "qom-type");
     }
+    qdict_del(qdict, "qom-type");
=20
-    id =3D qdict_get_try_str(qdict, "id");
+    id =3D g_strdup(qdict_get_try_str(qdict, "id"));
     if (!id) {
         error_setg(errp, QERR_MISSING_PARAMETER, "id");
         return;
-    } else {
-        id =3D g_strdup(id);
-        qdict_del(qdict, "id");
     }
+    qdict_del(qdict, "id");
=20
     props =3D qdict_get(qdict, "props");
     if (props) {
--=20
2.20.1


