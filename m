Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79486DC451
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 14:04:16 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLQzP-0001Ll-7O
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 08:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iLQy8-0000WH-Gr
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:02:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iLQy7-0006oh-77
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:02:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iLQxz-0006di-JL; Fri, 18 Oct 2019 08:02:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5FF0A76C;
 Fri, 18 Oct 2019 12:02:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-198.ams2.redhat.com
 [10.36.117.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 892CC1001B03;
 Fri, 18 Oct 2019 12:02:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] doc: Describe missing generic -blockdev options
Date: Fri, 18 Oct 2019 14:02:35 +0200
Message-Id: <20191018120235.4438-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 18 Oct 2019 12:02:46 +0000 (UTC)
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We added more generic options after introducing -blockdev and forgot to
update the documentation (man page and --help output) accordingly. Do
that now.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-options.hx | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 793d70ff93..2e6ba5ef1f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -849,7 +849,8 @@ ETEXI
 DEF("blockdev", HAS_ARG, QEMU_OPTION_blockdev,
     "-blockdev [driver=3D]driver[,node-name=3DN][,discard=3Dignore|unmap=
]\n"
     "          [,cache.direct=3Don|off][,cache.no-flush=3Don|off]\n"
-    "          [,read-only=3Don|off][,detect-zeroes=3Don|off|unmap]\n"
+    "          [,read-only=3Don|off][,auto-read-only=3Don|off]\n"
+    "          [,force-share=3Don|off][,detect-zeroes=3Don|off|unmap]\n"
     "          [,driver specific parameters...]\n"
     "                configure a block backend\n", QEMU_ARCH_ALL)
 STEXI
@@ -885,6 +886,25 @@ name is not intended to be predictable and changes b=
etween QEMU invocations.
 For the top level, an explicit node name must be specified.
 @item read-only
 Open the node read-only. Guest write attempts will fail.
+
+Note that some block drivers support only read-only access, either gener=
ally or
+in certain configurations. In this case, the default value
+@option{read-only=3Doff} does not work and the option must be specified
+explicitly.
+@item auto-read-only
+If @option{auto-read-only=3Don} is set, QEMU may fall back to read-only =
usage
+even when @option{read-only=3Doff} is requested, or even switch between =
modes as
+needed, e.g. depending on whether the image file is writable or whether =
a
+writing user is attached to the node.
+@item force-share
+Override the image locking system of QEMU by forcing the node to utilize
+weaker shared access for permissions where it would normally request exc=
lusive
+access.  When there is the potential for multiple instances to have the =
same
+file open (whether this invocation of qemu is the first or the second
+instance), both instances must permit shared access for the second insta=
nce to
+succeed at opening the file.
+
+Enabling @option{force-share=3Don} requires @option{read-only=3Don}.
 @item cache.direct
 The host page cache can be avoided with @option{cache.direct=3Don}. This=
 will
 attempt to do disk IO directly to the guest's memory. QEMU may still per=
form an
--=20
2.20.1


