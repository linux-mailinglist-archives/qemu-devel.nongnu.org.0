Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB2143CFD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:37:51 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itsn0-00084k-7Z
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsbH-0005cl-NW
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsbD-0001rY-Rd
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37321
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsbD-0001rM-Nd
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g00Sq/cK8U3tYs/oClzdAX9DYHJt/T2uy+uz0rgmeYk=;
 b=a/5/cGeWZL4MGN5VXLCU91P5mkUGqwMI2CXRPpEfShbMacdApsnM58ndi9Au2c4LZz7B/r
 /RfICot2yDmfJNlYPhOTNET13gG83q7FDBl7J9vgELJ1Vt+wp7Ck24bBRwDyoFTYoWHKzW
 UfbBYHUbRWdSobUiw4ZK4zcPfWMFDN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-imVtNJaEONWylmsFmCThUA-1; Tue, 21 Jan 2020 07:25:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 739948010DB;
 Tue, 21 Jan 2020 12:25:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63B9E60FC4;
 Tue, 21 Jan 2020 12:25:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 011/109] virtiofsd: Fix common header and define for QEMU
 builds
Date: Tue, 21 Jan 2020 12:22:55 +0000
Message-Id: <20200121122433.50803-12-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: imVtNJaEONWylmsFmCThUA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

All of the fuse files include config.h and define GNU_SOURCE
where we don't have either under our build - remove them.
Fixup path to the kernel's fuse.h in the QEMUs world.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/buffer.c         | 3 ---
 tools/virtiofsd/fuse_i.h         | 3 +++
 tools/virtiofsd/fuse_lowlevel.c  | 5 +----
 tools/virtiofsd/fuse_opt.c       | 1 -
 tools/virtiofsd/fuse_signals.c   | 1 -
 tools/virtiofsd/passthrough_ll.c | 7 +------
 6 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 5df946c82c..db1885ab19 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -9,9 +9,6 @@
  * See the file COPYING.LIB
  */
=20
-#define _GNU_SOURCE
-
-#include "config.h"
 #include "fuse_i.h"
 #include "fuse_lowlevel.h"
 #include <assert.h>
diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index e63cb58388..bae06992e0 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -6,6 +6,9 @@
  * See the file COPYING.LIB
  */
=20
+#define FUSE_USE_VERSION 31
+
+
 #include "fuse.h"
 #include "fuse_lowlevel.h"
=20
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index b3d26cab66..f76f3d3fdc 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -9,11 +9,8 @@
  * See the file COPYING.LIB
  */
=20
-#define _GNU_SOURCE
-
-#include "config.h"
 #include "fuse_i.h"
-#include "fuse_kernel.h"
+#include "standard-headers/linux/fuse.h"
 #include "fuse_misc.h"
 #include "fuse_opt.h"
=20
diff --git a/tools/virtiofsd/fuse_opt.c b/tools/virtiofsd/fuse_opt.c
index edd36f4a3b..1fee55e266 100644
--- a/tools/virtiofsd/fuse_opt.c
+++ b/tools/virtiofsd/fuse_opt.c
@@ -10,7 +10,6 @@
  */
=20
 #include "fuse_opt.h"
-#include "config.h"
 #include "fuse_i.h"
 #include "fuse_misc.h"
=20
diff --git a/tools/virtiofsd/fuse_signals.c b/tools/virtiofsd/fuse_signals.=
c
index 19d6791cb9..10a6f88088 100644
--- a/tools/virtiofsd/fuse_signals.c
+++ b/tools/virtiofsd/fuse_signals.c
@@ -8,7 +8,6 @@
  * See the file COPYING.LIB
  */
=20
-#include "config.h"
 #include "fuse_i.h"
 #include "fuse_lowlevel.h"
=20
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 9377718d9d..e702f7dec6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -35,15 +35,10 @@
  * \include passthrough_ll.c
  */
=20
-#define _GNU_SOURCE
-#define FUSE_USE_VERSION 31
-
-#include "config.h"
-
+#include "fuse_lowlevel.h"
 #include <assert.h>
 #include <dirent.h>
 #include <errno.h>
-#include <fuse_lowlevel.h>
 #include <inttypes.h>
 #include <limits.h>
 #include <pthread.h>
--=20
2.24.1


