Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E993B14C999
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:29:54 +0100 (CET)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwlXe-0003Os-1s
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwlNJ-0007Gk-Je
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwlNI-0000Yu-KU
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:19:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52124
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwlNI-0000YB-GH
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580296752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GHbc+kIfqQUvTvWVpNsxxx32NubsmS6F1GsHCe6Xw4o=;
 b=Q230dfYzGoISi7Q1KsTnIFOfPu488r4NP84yd1Lgd6ouTgwz1DVSs/TE0Zzf7PhSdgiOK+
 L04/YY1645fG+p+FquGfSGwwWHADhTmhoMdAKsfT3bH+8SHSYN4BdAEttY3Q/xWdZlOeDn
 dUvh3Qs5HlnsmcrJw8BQQnD/hF+8/XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-n7srqyxdPMiLkjyJskfwWA-1; Wed, 29 Jan 2020 06:19:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51ABF18CA240
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:19:08 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5358B60BE0;
 Wed, 29 Jan 2020 11:19:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] git: Make submodule check only needed modules
Date: Wed, 29 Jan 2020 12:19:06 +0100
Message-Id: <20200129111906.9815-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: n7srqyxdPMiLkjyJskfwWA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 scripts/git-submodule.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 98ca0f2737..c3e8526e59 100755
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
+=09CURSTATUS=3D$($GIT submodule status $module)
+=09OLDSTATUS=3D$(cat $substat | grep $module)
+=09if test "$CURSTATUS" !=3D "$OLDSTATUS"; then
+=09    exit 1
+=09fi
+    done
+    exit 0
     ;;
 update)
     if test -z "$maybe_modules"
--=20
2.24.1


