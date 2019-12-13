Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B411E475
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 14:22:35 +0100 (CET)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifktu-0001GI-Pi
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 08:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifkrJ-0007Sr-02
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifkrH-0003Vu-Hk
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55622
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifkr7-0003NW-C0
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576243180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXo9tVXDH6HFrV94NzJ2m+iYX5hY6kkuhMDS3waH5+c=;
 b=IQa+Vo6Jqr8Ig6U6l3i2tdiLjCuWr4gdE4nwNstLI3JNaDQ0ZaP0UqtQVkCTXL/SFpDdDe
 E+zFIshJ1LNh3hbk9aoMqDDrcb7LvQCRUC1h1iBSHapc8SZWtKss3dvmIi3gZgalN67c0r
 6Cg8KNVG3b3xVfBzUQ8NJbrVWX+LSBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-yhPnapwlPYKwfWtG4N98Xw-1; Fri, 13 Dec 2019 08:19:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D76107AD4C;
 Fri, 13 Dec 2019 13:19:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.117.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5750B60C05;
 Fri, 13 Dec 2019 13:19:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, cota@braap.org,
 rkagan@virtuozzo.com
Subject: [PATCH 1/2] hyperv: Use auto rcu_read macros
Date: Fri, 13 Dec 2019 13:19:30 +0000
Message-Id: <20191213131931.143878-2-dgilbert@redhat.com>
In-Reply-To: <20191213131931.143878-1-dgilbert@redhat.com>
References: <20191213131931.143878-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yhPnapwlPYKwfWtG4N98Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Use RCU_READ_LOCK_GUARD and WITH_RCU_READ_LOCK_GUARD
to replace the manual rcu_read_(un)lock calls.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/hyperv/hyperv.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 6ebf31c310..da8ce82725 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -546,14 +546,14 @@ uint16_t hyperv_hcall_post_message(uint64_t param, bo=
ol fast)
     }
=20
     ret =3D HV_STATUS_INVALID_CONNECTION_ID;
-    rcu_read_lock();
-    QLIST_FOREACH_RCU(mh, &msg_handlers, link) {
-        if (mh->conn_id =3D=3D (msg->connection_id & HV_CONNECTION_ID_MASK=
)) {
-            ret =3D mh->handler(msg, mh->data);
-            break;
+    WITH_RCU_READ_LOCK_GUARD() {
+        QLIST_FOREACH_RCU(mh, &msg_handlers, link) {
+            if (mh->conn_id =3D=3D (msg->connection_id & HV_CONNECTION_ID_=
MASK)) {
+                ret =3D mh->handler(msg, mh->data);
+                break;
+            }
         }
     }
-    rcu_read_unlock();
=20
 unmap:
     cpu_physical_memory_unmap(msg, len, 0, 0);
@@ -619,7 +619,6 @@ int hyperv_set_event_flag_handler(uint32_t conn_id, Eve=
ntNotifier *notifier)
=20
 uint16_t hyperv_hcall_signal_event(uint64_t param, bool fast)
 {
-    uint16_t ret;
     EventFlagHandler *handler;
=20
     if (unlikely(!fast)) {
@@ -645,15 +644,12 @@ uint16_t hyperv_hcall_signal_event(uint64_t param, bo=
ol fast)
         return HV_STATUS_INVALID_HYPERCALL_INPUT;
     }
=20
-    ret =3D HV_STATUS_INVALID_CONNECTION_ID;
-    rcu_read_lock();
+    RCU_READ_LOCK_GUARD();
     QLIST_FOREACH_RCU(handler, &event_flag_handlers, link) {
         if (handler->conn_id =3D=3D param) {
             event_notifier_set(handler->notifier);
-            ret =3D 0;
-            break;
+            return 0;
         }
     }
-    rcu_read_unlock();
-    return ret;
+    return HV_STATUS_INVALID_CONNECTION_ID;
 }
--=20
2.23.0


