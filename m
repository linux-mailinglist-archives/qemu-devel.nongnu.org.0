Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F1B01DC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 18:43:52 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i85ig-0002XG-DM
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 12:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i85h3-0001LS-1n
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i85h2-00005s-54
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:42:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21733)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i85h1-00005J-W3
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:42:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5656730024DA
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 16:42:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-243.ams2.redhat.com
 [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55DE560C18;
 Wed, 11 Sep 2019 16:42:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 quintela@redhat.com
Date: Wed, 11 Sep 2019 17:42:00 +0100
Message-Id: <20190911164202.31136-2-dgilbert@redhat.com>
In-Reply-To: <20190911164202.31136-1-dgilbert@redhat.com>
References: <20190911164202.31136-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 11 Sep 2019 16:42:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] rcu: Add automatically released
 rcu_read_lock variant
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

RCU_READ_LOCK_AUTO takes the rcu_read_lock  and then uses glib's
g_auto infrastrcture (and thus whatever the compilers hooks are) to
release it on all exits of the block.

Note this macro has a variable declaration in, and hence is not in
a while loop.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/rcu.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 22876d1428..6a25b27d28 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -154,6 +154,18 @@ extern void call_rcu1(struct rcu_head *head, RCUCBFu=
nc *func);
       }),                                                               =
 \
       (RCUCBFunc *)g_free);
=20
+typedef char rcu_read_auto_t;
+static inline void rcu_read_auto_unlock(rcu_read_auto_t *r)
+{
+  rcu_read_unlock();
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(rcu_read_auto_t, rcu_read_auto_unlock)
+
+#define RCU_READ_LOCK_AUTO g_auto(rcu_read_auto_t) \
+    _rcu_read_auto =3D 'x'; \
+    rcu_read_lock();
+
 #ifdef __cplusplus
 }
 #endif
--=20
2.21.0


