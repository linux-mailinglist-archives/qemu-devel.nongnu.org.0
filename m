Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECB17A33D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 11:35:30 +0100 (CET)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9nqj-0002P1-S9
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 05:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j9npq-0001qG-Hn
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:34:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j9npp-0006zN-A1
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:34:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j9npp-0006yL-6g
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583404472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=06nVdthrWxg0fESZekdLfKI/RJGrwKQ3j9sAU1A61vE=;
 b=QftEVJN2ZzvTuxOsFpIGueY3Wcbch7feSshJHVKVH6NTxbt5Ma/3U/Oaq2kuA5tRGOit2v
 p9TE/tnBSCV9ZCv35YxoBjBP8GELMrzNCRCZ03Uewelq5WRKFa3nWX1EJ5httOvl7j8Z/L
 p/C/HxDKI0jI6MjSoSVpgyNWQi4Pkjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-DLtYTu8rNISSTwGm8x3mpw-1; Thu, 05 Mar 2020 05:34:30 -0500
X-MC-Unique: DLtYTu8rNISSTwGm8x3mpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 513068017CC;
 Thu,  5 Mar 2020 10:34:29 +0000 (UTC)
Received: from secure.mitica (ovpn-116-211.ams2.redhat.com [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 594DC1001902;
 Thu,  5 Mar 2020 10:34:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Improve zstd test
Date: Thu,  5 Mar 2020 11:34:27 +0100
Message-Id: <20200305103427.157658-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were one error on the test (missing an s for --exists).
But we really need a recent zstd (0.8.1).
That version was released in 2016, so it is newer that some of our travis
images.  Just check for the version that we need.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reported-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7b373bc0bb..1bf48df1ef 100755
--- a/configure
+++ b/configure
@@ -2464,7 +2464,8 @@ fi
 # zstd check
=20
 if test "$zstd" !=3D "no" ; then
-    if $pkg_config --exist libzstd ; then
+    libzstd_minver=3D"0.8.1"
+    if $pkg_config --atleast-version=3D$libzstd_minver libzstd ; then
         zstd_cflags=3D"$($pkg_config --cflags libzstd)"
         zstd_libs=3D"$($pkg_config --libs libzstd)"
         LIBS=3D"$zstd_libs $LIBS"
--=20
2.24.1


