Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F0B046F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 21:08:57 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i87z6-0005WV-51
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 15:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i87wj-0003xX-50
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i87wi-0006aO-23
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i87wh-0006Zq-Sy
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3DCD57EB88
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 19:06:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-243.ams2.redhat.com
 [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11B7160167;
 Wed, 11 Sep 2019 19:06:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Date: Wed, 11 Sep 2019 20:06:18 +0100
Message-Id: <20190911190622.7629-2-dgilbert@redhat.com>
In-Reply-To: <20190911190622.7629-1-dgilbert@redhat.com>
References: <20190911190622.7629-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 11 Sep 2019 19:06:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/5] rcu: Add automatically released
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

RCU_READ_LOCK_AUTO takes the rcu_read_lock and then uses glib's
g_auto infrastructure (and thus whatever the compiler's hooks are) to
release it on all exits of the block.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/rcu.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 22876d1428..8768a7b60a 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -154,6 +154,24 @@ extern void call_rcu1(struct rcu_head *head, RCUCBFu=
nc *func);
       }),                                                               =
 \
       (RCUCBFunc *)g_free);
=20
+typedef void RCUReadAuto;
+static inline RCUReadAuto *rcu_read_auto_lock(void)
+{
+    rcu_read_lock();
+    /* Anything non-NULL causes the cleanup function to be called */
+    return (void *)0x1;
+}
+
+static inline void rcu_read_auto_unlock(RCUReadAuto *r)
+{
+    rcu_read_unlock();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
+
+#define RCU_READ_LOCK_AUTO \
+    g_autoptr(RCUReadAuto) _rcu_read_auto =3D rcu_read_auto_lock()
+
 #ifdef __cplusplus
 }
 #endif
--=20
2.21.0


