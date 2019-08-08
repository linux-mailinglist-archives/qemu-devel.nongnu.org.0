Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24188651A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 17:05:04 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvjyS-0002Pt-4e
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hvjxB-0001Fd-7Q
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hvjxA-0006sI-9E
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hvjxA-0006rl-40
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 71C49641C9
 for <qemu-devel@nongnu.org>; Thu,  8 Aug 2019 15:03:43 +0000 (UTC)
Received: from localhost (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6CE0600F8;
 Thu,  8 Aug 2019 15:03:36 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 19:03:24 +0400
Message-Id: <20190808150325.21939-2-marcandre.lureau@redhat.com>
In-Reply-To: <20190808150325.21939-1-marcandre.lureau@redhat.com>
References: <20190808150325.21939-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 08 Aug 2019 15:03:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/2] qemu-file: move qemu_{get,
 put}_counted_string() declarations
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
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move migration helpers for strings under include/, so they can be used
outside of migration/

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/qemu-file-types.h | 4 ++++
 migration/qemu-file.h               | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu=
-file-types.h
index c0a1988155..2867e3da84 100644
--- a/include/migration/qemu-file-types.h
+++ b/include/migration/qemu-file-types.h
@@ -161,6 +161,10 @@ static inline void qemu_get_sbe64s(QEMUFile *f, int6=
4_t *pv)
     qemu_get_be64s(f, (uint64_t *)pv);
 }
=20
+size_t qemu_get_counted_string(QEMUFile *f, char buf[256]);
+
+void qemu_put_counted_string(QEMUFile *f, const char *name);
+
 int qemu_file_rate_limit(QEMUFile *f);
=20
 #endif
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 13baf896bd..185d3de505 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -155,8 +155,6 @@ QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
=20
-size_t qemu_get_counted_string(QEMUFile *f, char buf[256]);
-
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
@@ -175,6 +173,4 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t =
block_offset,
                              ram_addr_t offset, size_t size,
                              uint64_t *bytes_sent);
=20
-void qemu_put_counted_string(QEMUFile *f, const char *name);
-
 #endif
--=20
2.23.0.rc1


