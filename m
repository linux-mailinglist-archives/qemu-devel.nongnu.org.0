Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C4B0471
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 21:09:20 +0200 (CEST)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i87zT-0005oE-4u
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 15:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i87wr-000483-9m
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i87wq-0006fH-8T
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34214)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i87wq-0006f3-3C
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DF363084288
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 19:06:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-243.ams2.redhat.com
 [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D6660318;
 Wed, 11 Sep 2019 19:06:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Date: Wed, 11 Sep 2019 20:06:22 +0100
Message-Id: <20190911190622.7629-6-dgilbert@redhat.com>
In-Reply-To: <20190911190622.7629-1-dgilbert@redhat.com>
References: <20190911190622.7629-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 11 Sep 2019 19:06:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 5/5] migration: Missing rcu_read_unlock
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

Error path missing an unlock.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/ram.c b/migration/ram.c
index 1bb82acfe0..977172ea7e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3445,6 +3445,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque=
)
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
         if (!block->idstr[0]) {
             error_report("%s: RAMBlock with empty name", __func__);
+            rcu_read_unlock();
             return -1;
         }
         qemu_put_byte(f, strlen(block->idstr));
--=20
2.21.0


