Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4131801E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 20:59:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hORFV-0003MX-N5
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 14:25:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOREN-000359-ME
	for qemu-devel@nongnu.org; Wed, 08 May 2019 14:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOREI-0001dr-Ur
	for qemu-devel@nongnu.org; Wed, 08 May 2019 14:23:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hOREI-0001aJ-PX
	for qemu-devel@nongnu.org; Wed, 08 May 2019 14:23:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5032BC058CBD;
	Wed,  8 May 2019 18:23:45 +0000 (UTC)
Received: from localhost (ovpn-116-61.gru2.redhat.com [10.97.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B603427BA8;
	Wed,  8 May 2019 18:23:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2019 15:23:39 -0300
Message-Id: <20190508182339.22447-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 May 2019 18:23:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] configure: Require python3 >= 3.5
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The oldest python3 version in distros that will be supported by
QEMU 4.1 is 3.5.3 (the one in Debian Stretch).  Error out if
running python3 < 3.5.

We have a .travis.yml job configured to use Python 3.4.  Change
it to use Python 3.5.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 configure   | 5 +++--
 .travis.yml | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 6b3ed8c532..520c207d66 100755
--- a/configure
+++ b/configure
@@ -1841,8 +1841,9 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (2,7))'; then
-  error_exit "Cannot use '$python', Python 2 >= 2.7 or Python 3 is required." \
+if ! $python -c 'import sys; sys.exit(sys.version_info < (2,7) or \
+                                      (3,0) <= sys.version_info < (3,5))'; then
+  error_exit "Cannot use '$python', Python 2 >= 2.7 or Python 3 >= 3.5 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
diff --git a/.travis.yml b/.travis.yml
index 66448d99d6..0f6986b3f1 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -211,7 +211,7 @@ matrix:
         - CONFIG="--target-list=x86_64-softmmu"
       language: python
       python:
-        - "3.4"
+        - "3.5"
 
 
     - env:
-- 
2.18.0.rc1.1.g3f1ff2140


