Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2791D4990
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 22:59:34 +0200 (CEST)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ20c-0001A1-2W
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 16:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJ1xU-0006XZ-9n
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 16:56:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJ1xT-0001OT-D0
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 16:56:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJ1xR-0001NS-3C; Fri, 11 Oct 2019 16:56:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 592183082145;
 Fri, 11 Oct 2019 20:56:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5390C60A97;
 Fri, 11 Oct 2019 20:56:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] qemu-io: Support help options for --object
Date: Fri, 11 Oct 2019 22:55:49 +0200
Message-Id: <20191011205551.32149-3-kwolf@redhat.com>
In-Reply-To: <20191011205551.32149-1-kwolf@redhat.com>
References: <20191011205551.32149-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 11 Oct 2019 20:56:16 +0000 (UTC)
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of parsing help options as normal object properties and
returning an error, provide the same help functionality as the system
emulator in qemu-io, too.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-io.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/qemu-io.c b/qemu-io.c
index f64eca6940..91e3276592 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -475,6 +475,13 @@ static QemuOptsList qemu_object_opts =3D {
     },
 };
=20
+static bool qemu_io_object_print_help(const char *type, QemuOpts *opts)
+{
+    if (user_creatable_print_help(type, opts)) {
+        exit(0);
+    }
+    return true;
+}
=20
 static QemuOptsList file_opts =3D {
     .name =3D "file",
@@ -622,7 +629,7 @@ int main(int argc, char **argv)
=20
     qemu_opts_foreach(&qemu_object_opts,
                       user_creatable_add_opts_foreach,
-                      NULL, &error_fatal);
+                      qemu_io_object_print_help, &error_fatal);
=20
     if (!trace_init_backends()) {
         exit(1);
--=20
2.20.1


