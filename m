Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2251468FF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:26:58 +0100 (CET)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucVc-0001TM-NR
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iub8t-00025V-3x
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iub8s-000536-3r
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iub8s-00052D-0J
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBMjeyeAZyM2/vGJZhH1BtgKby+UDT6rTZKWS6FFQ30=;
 b=aIBx+DB6xeKHA8O1Ja/pVKXDlU2fxlvQBqwcV3cyNv8l0OnYp+ObuCGFk6N2PNkQiC+joT
 OWlEHIrOG9qCoHwzEF/hvY9J9JrPlrzx4lPNotyTn6cmyCp9iWXqoWPgQKiCAcuPhmmQXu
 Y3yMrBNALHozWLs/s6QfoRd8T7stz/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-ljTShN33Mdqqg0pUQ0bhIw-1; Thu, 23 Jan 2020 06:59:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22E1618A6ED2
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:18 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E1C819C69;
 Thu, 23 Jan 2020 11:59:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/21] multifd: multifd_queue_page only needs the qemufile
Date: Thu, 23 Jan 2020 12:58:22 +0100
Message-Id: <20200123115831.36842-13-quintela@redhat.com>
In-Reply-To: <20200123115831.36842-1-quintela@redhat.com>
References: <20200123115831.36842-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ljTShN33Mdqqg0pUQ0bhIw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 19caf5ed4d..d4c829bc77 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -974,7 +974,7 @@ static int multifd_send_pages(QEMUFile *f)
     return 1;
 }
=20
-static int multifd_queue_page(RAMState *rs, RAMBlock *block, ram_addr_t of=
fset)
+static int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t off=
set)
 {
     MultiFDPages_t *pages =3D multifd_send_state->pages;
=20
@@ -993,12 +993,12 @@ static int multifd_queue_page(RAMState *rs, RAMBlock =
*block, ram_addr_t offset)
         }
     }
=20
-    if (multifd_send_pages(rs->f) < 0) {
+    if (multifd_send_pages(f) < 0) {
         return -1;
     }
=20
     if (pages->block !=3D block) {
-        return  multifd_queue_page(rs, block, offset);
+        return  multifd_queue_page(f, block, offset);
     }
=20
     return 1;
@@ -2128,7 +2128,7 @@ static int ram_save_page(RAMState *rs, PageSearchStat=
us *pss, bool last_stage)
 static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
                                  ram_addr_t offset)
 {
-    if (multifd_queue_page(rs, block, offset) < 0) {
+    if (multifd_queue_page(rs->f, block, offset) < 0) {
         return -1;
     }
     ram_counters.normal++;
--=20
2.24.1


