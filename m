Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFD14DF30
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 17:33:07 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixCkb-00076c-VS
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 11:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ixCfz-0001lP-8u
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:28:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ixCfx-0002ZS-Uh
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:28:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21254
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ixCfx-0002Z3-QX
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580401697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3e2ZTAvWUzY59+JZznkdH+PmXVlpNE6zWCOO8V4Owg8=;
 b=QQYKe4LUb9w2VqWDoV9RtHh7U02IKw2S40ARYiLrxKEtBPxkeOCDshg66F4M6r2CsXbx/H
 MH5wytLXuVrhwRojCbJZpcJYp4jKlZcBKxMuZLtEcLkmxXpPpPhNXZZy5EaMi1SwbaIzaI
 vKeIMXQMS2djkpSrWVrlAhHYt8gRZEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Q8TAERiUNrSLf8MVH8TbnA-1; Thu, 30 Jan 2020 11:28:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744AA8018A3
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 16:28:14 +0000 (UTC)
Received: from secure.mitica (ovpn-116-211.ams2.redhat.com [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0C5B60BE1;
 Thu, 30 Jan 2020 16:28:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] git: Make submodule check only needed modules
Date: Thu, 30 Jan 2020 17:28:10 +0100
Message-Id: <20200130162810.14503-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Q8TAERiUNrSLf8MVH8TbnA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If one is compiling more than one tree from the same source, it is
possible that they need different submodules.  Change the check to see
that all modules that we are interested in are updated, discarding the
ones that we don't care about.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

v1->v2:
patchw insists in not using tabs
---
 scripts/git-submodule.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 98ca0f2737..65ed877aef 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -59,10 +59,14 @@ status)
     fi
=20
     test -f "$substat" || exit 1
-    CURSTATUS=3D$($GIT submodule status $modules)
-    OLDSTATUS=3D$(cat $substat)
-    test "$CURSTATUS" =3D "$OLDSTATUS"
-    exit $?
+    for module in $modules; do
+        CURSTATUS=3D$($GIT submodule status $module)
+        OLDSTATUS=3D$(cat $substat | grep $module)
+        if test "$CURSTATUS" !=3D "$OLDSTATUS"; then
+            exit 1
+        fi
+    done
+    exit 0
     ;;
 update)
     if test -z "$maybe_modules"
--=20
2.24.1


