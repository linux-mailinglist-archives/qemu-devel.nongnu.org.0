Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51E17F203
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 09:35:48 +0100 (CET)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBaMd-0008O8-Ug
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 04:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jBaJO-0004g3-1r
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jBaJM-0003ZH-Uq
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56495
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jBaJM-0003YO-RH
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583829144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOcQ63OgzqIDc13B4UUajPYNBSN7JfR6j847LWhFxL8=;
 b=QdaPFK9Bv+AsrO+GeMp0/VCEfUjP39FeesRKekMXbX7cBj53oYe3fBqtArnrWCwVYZUH30
 cH/KEB5raQA8ebHSUiCSk+THAM2XNGbJYH0d6SEWF7cWdRQKHOPnhsq8CzwoNUmdWXpOIl
 FDzNpr5ZyEsH+9LzHS+FTyyOLbHolgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-gZmO1iEQMpyIbcjJaNg7QQ-1; Tue, 10 Mar 2020 04:32:22 -0400
X-MC-Unique: gZmO1iEQMpyIbcjJaNg7QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4C328017CC;
 Tue, 10 Mar 2020 08:32:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C475C28F;
 Tue, 10 Mar 2020 08:32:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 27AC39D24; Tue, 10 Mar 2020 09:32:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tests/vm: write raw console log
Date: Tue, 10 Mar 2020 09:32:15 +0100
Message-Id: <20200310083218.26355-2-kraxel@redhat.com>
In-Reply-To: <20200310083218.26355-1-kraxel@redhat.com>
References: <20200310083218.26355-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run "tail -f /var/tmp/*/qemu*console.raw" in another terminal
to watch the install console.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/vm/basevm.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 8400b0e07f65..c53fd354d955 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -213,6 +213,9 @@ class BaseVM(object):
     def console_init(self, timeout =3D 120):
         vm =3D self._guest
         vm.console_socket.settimeout(timeout)
+        self.console_raw_path =3D os.path.join(vm._temp_dir,
+                                             vm._name + "-console.raw")
+        self.console_raw_file =3D open(self.console_raw_path, 'wb')
=20
     def console_log(self, text):
         for line in re.split("[\r\n]", text):
@@ -234,6 +237,9 @@ class BaseVM(object):
         while True:
             try:
                 chars =3D vm.console_socket.recv(1)
+                if self.console_raw_file:
+                    self.console_raw_file.write(chars)
+                    self.console_raw_file.flush()
             except socket.timeout:
                 sys.stderr.write("console: *** read timeout ***\n")
                 sys.stderr.write("console: waiting for: '%s'\n" % expect)
--=20
2.18.2


