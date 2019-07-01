Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C733E115CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:53:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM7TL-0002Wm-0U
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:53:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hM7MB-0004XQ-G6
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hM7M8-0003lw-LS
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:46:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hM7M4-000310-6N; Thu, 02 May 2019 04:46:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E23B8308FC4D;
	Thu,  2 May 2019 08:45:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B66954FDF;
	Thu,  2 May 2019 08:45:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:45:03 +0200
Message-Id: <20190502084506.8009-5-thuth@redhat.com>
In-Reply-To: <20190502084506.8009-1-thuth@redhat.com>
References: <20190502084506.8009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 02 May 2019 08:45:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 4/7] cirrus / travis: Add gnu-sed and bash
 for macOS and FreeBSD
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Christophe Fergeau <cfergeau@redhat.com>, Max Reitz <mreitz@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to enable the qemu-iotests during "make check" again,
and for running the iotests, we need bash and gnu-sed.

Reviewed-by: Li-Wen Hsu <lwhsu@freebsd.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 4 ++--
 .travis.yml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 47ef5bc604..8326a3a4b1 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -7,7 +7,7 @@ freebsd_12_task:
     cpu: 8
     memory: 8G
   install_script: pkg install -y
-    bison curl cyrus-sasl git glib gmake gnutls
+    bash bison curl cyrus-sasl git glib gmake gnutls gsed
     nettle perl5 pixman pkgconf png usbredir
   script:
     - mkdir build
@@ -20,7 +20,7 @@ macos_task:
   osx_instance:
     image: mojave-base
   install_script:
-    - brew install pkg-config python glib pixman make sdl2
+    - brew install pkg-config python gnu-sed glib pixman make sdl2
   script:
     - ./configure --python=3D/usr/local/bin/python3 || { cat config.log;=
 exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
diff --git a/.travis.yml b/.travis.yml
index 2e06aee9d0..ba94644192 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -42,6 +42,7 @@ addons:
     packages:
       - glib
       - pixman
+      - gnu-sed
=20
=20
 # The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
--=20
2.21.0


