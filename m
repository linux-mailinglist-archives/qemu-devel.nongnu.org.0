Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B94CE572
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:39:17 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHUAN-0005rg-Mt
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHU81-0003yJ-Sx
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHU80-0005R5-R2
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38648)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHU80-0005Qh-LO
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1DC6309B142
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 14:36:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-145.ams2.redhat.com
 [10.36.117.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D1660C5E;
 Mon,  7 Oct 2019 14:36:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	berrange@redhat.com
Subject: [PATCH v4 2/5] migration: Fix missing rcu_read_unlock
Date: Mon,  7 Oct 2019 15:36:38 +0100
Message-Id: <20191007143642.301445-3-dgilbert@redhat.com>
In-Reply-To: <20191007143642.301445-1-dgilbert@redhat.com>
References: <20191007143642.301445-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 07 Oct 2019 14:36:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

Use the automatic rcu_read unlocker to fix a missing unlock.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 migration/ram.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 22423f08cd..484d66379a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3373,24 +3373,23 @@ static int ram_save_setup(QEMUFile *f, void *opaq=
ue)
     }
     (*rsp)->f =3D f;
=20
-    rcu_read_lock();
-
-    qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SI=
ZE);
+    WITH_RCU_READ_LOCK_GUARD() {
+        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_ME=
M_SIZE);
=20
-    RAMBLOCK_FOREACH_MIGRATABLE(block) {
-        qemu_put_byte(f, strlen(block->idstr));
-        qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->idstr)=
);
-        qemu_put_be64(f, block->used_length);
-        if (migrate_postcopy_ram() && block->page_size !=3D qemu_host_pa=
ge_size) {
-            qemu_put_be64(f, block->page_size);
-        }
-        if (migrate_ignore_shared()) {
-            qemu_put_be64(f, block->mr->addr);
+        RAMBLOCK_FOREACH_MIGRATABLE(block) {
+            qemu_put_byte(f, strlen(block->idstr));
+            qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->id=
str));
+            qemu_put_be64(f, block->used_length);
+            if (migrate_postcopy_ram() && block->page_size !=3D
+                                          qemu_host_page_size) {
+                qemu_put_be64(f, block->page_size);
+            }
+            if (migrate_ignore_shared()) {
+                qemu_put_be64(f, block->mr->addr);
+            }
         }
     }
=20
-    rcu_read_unlock();
-
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
=20
--=20
2.23.0


