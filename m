Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BD11FF8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 18:19:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMEQU-0000NI-RN
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 12:19:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMEL3-0004FI-Bn
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMEL2-0002Lp-Gu
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:13:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hMEL2-0002Li-By
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:13:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3C788830A;
	Thu,  2 May 2019 16:13:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 596BF17D58;
	Thu,  2 May 2019 16:13:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu,  2 May 2019 18:13:08 +0200
Message-Id: <20190502161310.15624-7-thuth@redhat.com>
In-Reply-To: <20190502161310.15624-1-thuth@redhat.com>
References: <20190502161310.15624-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 May 2019 16:13:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/8] configure: Remove old
 *-config-devices.mak.d files when running configure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Otubo <otubo@redhat.com>, Helge Deller <deller@gmx.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "make" in a build directory from the pre-Kconfig merge time,
the build process currently fails with:

 make: *** No rule to make target `.../default-configs/pci.mak',
  needed by `aarch64-softmmu/config-devices.mak'.  Stop.

To make sure that this problem at least goes away when the user runs
"configure" (or "sh config.status") again, we have to make sure that
we re-generate the .mak.d files. Thus remove the old stale files
while running the configure script.

Message-Id: <1552300145-12526-1-git-send-email-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 362bfef637..f14b25c49c 100755
--- a/configure
+++ b/configure
@@ -1818,6 +1818,9 @@ EOF
 exit 0
 fi
=20
+# Remove old dependency files to make sure that they get properly regene=
rated
+rm -f *-config-devices.mak.d
+
 if ! has $python; then
   error_exit "Python not found. Use --python=3D/path/to/python"
 fi
--=20
2.21.0


