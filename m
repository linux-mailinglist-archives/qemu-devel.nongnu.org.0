Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABF9814B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:31:25 +0200 (CEST)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0USC-0000Lm-KC
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i0UPR-0006Tk-9M
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i0UPQ-00057R-8E
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i0UPQ-00056q-36
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77E5B315C005
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 17:28:31 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE24860F88;
 Wed, 21 Aug 2019 17:28:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 19:28:11 +0200
Message-Id: <1566408501-48680-4-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566408501-48680-1-git-send-email-pbonzini@redhat.com>
References: <1566408501-48680-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 21 Aug 2019 17:28:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/13] module: use g_hash_table_add()
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

The hashtable is used like a set, use the convenience
g_hash_table_add() function.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/module.c b/util/module.c
index 142db7e..ca9885c 100644
--- a/util/module.c
+++ b/util/module.c
@@ -179,11 +179,10 @@ void module_load_one(const char *prefix, const char=
 *lib_name)
=20
     module_name =3D g_strdup_printf("%s%s", prefix, lib_name);
=20
-    if (g_hash_table_lookup(loaded_modules, module_name)) {
+    if (!g_hash_table_add(loaded_modules, module_name)) {
         g_free(module_name);
         return;
     }
-    g_hash_table_insert(loaded_modules, module_name, module_name);
=20
     exec_dir =3D qemu_get_exec_dir();
     search_dir =3D getenv("QEMU_MODULE_DIR");
--=20
1.8.3.1



