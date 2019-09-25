Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D75BE0D5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 17:09:12 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD8ul-0007GS-4i
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 11:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iD8ni-0000hp-4p
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 11:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iD8ng-0004bq-Pl
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 11:01:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50977)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iD8ng-0004bV-Ja
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 11:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6CF2C04BD48;
 Wed, 25 Sep 2019 15:01:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-251.ams2.redhat.com
 [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3AA95C224;
 Wed, 25 Sep 2019 15:01:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 marcandre.lureau@redhat.com, richardw.yang@linux.intel.com,
 alex.benee@linaro.org
Subject: [PULL 4/9] migration: remove sent parameter in
 get_queued_page_not_dirty
Date: Wed, 25 Sep 2019 16:01:25 +0100
Message-Id: <20190925150130.12303-5-dgilbert@redhat.com>
In-Reply-To: <20190925150130.12303-1-dgilbert@redhat.com>
References: <20190925150130.12303-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 25 Sep 2019 15:01:51 +0000 (UTC)
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

From: Wei Yang <richardw.yang@linux.intel.com>

This is a cleanup for previous removal of unsentmap.

The sent parameter is not necessary now.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190819061843.28642-4-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c        | 2 +-
 migration/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a8b1aa2597..22423f08cd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2348,7 +2348,7 @@ static bool get_queued_page(RAMState *rs, PageSearc=
hStatus *pss)
             dirty =3D test_bit(page, block->bmap);
             if (!dirty) {
                 trace_get_queued_page_not_dirty(block->idstr, (uint64_t)=
offset,
-                       page, test_bit(page, block->bmap));
+                                                page);
             } else {
                 trace_get_queued_page(block->idstr, (uint64_t)offset, pa=
ge);
             }
diff --git a/migration/trace-events b/migration/trace-events
index 00ffcd5930..858d415d56 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -76,7 +76,7 @@ qemu_file_fclose(void) ""
=20
 # ram.c
 get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned lo=
ng page_abs) "%s/0x%" PRIx64 " page_abs=3D0x%lx"
-get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, u=
nsigned long page_abs, int sent) "%s/0x%" PRIx64 " page_abs=3D0x%lx (sent=
=3D%d)"
+get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, u=
nsigned long page_abs) "%s/0x%" PRIx64 " page_abs=3D0x%lx"
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, u=
nsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
--=20
2.21.0


