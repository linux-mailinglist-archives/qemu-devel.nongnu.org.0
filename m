Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B55154DE3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:24:56 +0100 (CET)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izodr-0006Wd-Ro
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoZz-00084r-Fu
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoZy-00033N-F9
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoZy-00030k-9V
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObvH6HTtlRYrU4MCOqRZunbW7X4Wic+3+LxpMF0dCWQ=;
 b=S3GBgVUitFdj23d/yxdN1TlRelliUMHTha4TJTjbLd1ZCxCF6unU6EYpFtNmE2A16yXQ7x
 ylzC3AHnoUscKcLsb/aque7wf5E/thaTZfgheAyEUyrjjWa8Gyq8fd/0PTYZ67b+nL1Lor
 D/5wLdDPLo/jZEb/gecYGEaXuV6UdII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-nnPA8QPoPKiickpLHiffSQ-1; Thu, 06 Feb 2020 16:20:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C81C01081FA3;
 Thu,  6 Feb 2020 21:20:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71BF060BEC;
 Thu,  6 Feb 2020 21:20:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/46] tests/boot_linux_console: use os.path for filesystem
 paths
Date: Thu,  6 Feb 2020 22:19:04 +0100
Message-Id: <20200206211936.17098-15-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: nnPA8QPoPKiickpLHiffSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liam Merwick <liam.merwick@oracle.com>

Change extract_from_deb() to use os.path routines to manipulate the
filesystem path returned when extracting a file.

Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <1580914565-19675-7-git-send-email-liam.merwick@oracle.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 16b7503b5f..dca0a940ab 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -49,7 +49,12 @@ class BootLinuxConsole(Test):
         process.run("ar x %s %s" % (deb, file_path))
         archive.extract(file_path, self.workdir)
         os.chdir(cwd)
-        return self.workdir + path
+        # Return complete path to extracted file.  Because callers to
+        # extract_from_deb() specify 'path' with a leading slash, it is
+        # necessary to use os.path.relpath() as otherwise os.path.join()
+        # interprets it as an absolute path and drops the self.workdir par=
t.
+        return os.path.normpath(os.path.join(self.workdir,
+                                             os.path.relpath(path, '/')))
=20
     def extract_from_rpm(self, rpm, path):
         """
--=20
2.21.1


