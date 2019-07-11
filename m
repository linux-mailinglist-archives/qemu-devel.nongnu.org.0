Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B73657E6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 15:30:55 +0200 (CEST)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlZ9y-00071e-7d
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 09:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hlZ8o-0005ok-3a
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hlZ8m-0002oq-W1
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:29:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hlZ8k-0002jy-GI; Thu, 11 Jul 2019 09:29:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA5FC356E4;
 Thu, 11 Jul 2019 13:29:37 +0000 (UTC)
Received: from localhost (unknown [10.40.205.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C6A60185;
 Thu, 11 Jul 2019 13:29:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 11 Jul 2019 15:29:35 +0200
Message-Id: <20190711132935.13070-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 11 Jul 2019 13:29:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] doc: Preallocation does not require writing
 zeroes
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When preallocating an encrypted qcow2 image, it just lets the protocol
driver write data and then does not mark the clusters as zero.
Therefore, reading this image will yield effectively random data.

As such, we have not fulfilled the promise of always writing zeroes when
preallocating an image in a while.  It seems that nobody has really
cared, so change the documentation to conform to qemu's actual behavior.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json         | 9 +++++----
 docs/qemu-block-drivers.texi | 4 ++--
 qemu-img.texi                | 4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c..a4363b84d2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5167,10 +5167,11 @@
 # @off: no preallocation
 # @metadata: preallocate only for metadata
 # @falloc: like @full preallocation but allocate disk space by
-#          posix_fallocate() rather than writing zeros.
-# @full: preallocate all data by writing zeros to device to ensure disk
-#        space is really available. @full preallocation also sets up
-#        metadata correctly.
+#          posix_fallocate() rather than writing data.
+# @full: preallocate all data by writing it to the device to ensure
+#        disk space is really available. This data may or may not be
+#        zero, depending on the image format and storage.
+#        @full preallocation also sets up metadata correctly.
 #
 # Since: 2.2
 ##
diff --git a/docs/qemu-block-drivers.texi b/docs/qemu-block-drivers.texi
index 91ab0eceae..c02547e28c 100644
--- a/docs/qemu-block-drivers.texi
+++ b/docs/qemu-block-drivers.texi
@@ -31,8 +31,8 @@ Supported options:
 @item preallocation
 Preallocation mode (allowed values: @code{off}, @code{falloc}, @code{ful=
l}).
 @code{falloc} mode preallocates space for image by calling posix_falloca=
te().
-@code{full} mode preallocates space for image by writing zeros to underl=
ying
-storage.
+@code{full} mode preallocates space for image by writing data to underly=
ing
+storage.  This data may or may not be zero, depending on the storage loc=
ation.
 @end table
=20
 @item qcow2
diff --git a/qemu-img.texi b/qemu-img.texi
index c8e9bba515..b5156d6316 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -666,8 +666,8 @@ Supported options:
 @item preallocation
 Preallocation mode (allowed values: @code{off}, @code{falloc}, @code{ful=
l}).
 @code{falloc} mode preallocates space for image by calling posix_falloca=
te().
-@code{full} mode preallocates space for image by writing zeros to underl=
ying
-storage.
+@code{full} mode preallocates space for image by writing data to underly=
ing
+storage.  This data may or may not be zero, depending on the storage loc=
ation.
 @end table
=20
 @item qcow2
--=20
2.21.0


