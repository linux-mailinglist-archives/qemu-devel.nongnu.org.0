Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C147974
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 06:45:26 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcjWH-0006mA-PJ
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 00:45:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60164)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hcjQE-0001P1-H1
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 00:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hcjQC-0005sP-Kd
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 00:39:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hcjQB-0005q8-Mp
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 00:39:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DC4A31628FB;
 Mon, 17 Jun 2019 04:39:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05D242CFD6;
 Mon, 17 Jun 2019 04:39:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42D7B1753A; Mon, 17 Jun 2019 06:38:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 06:38:58 +0200
Message-Id: <20190617043858.8290-12-kraxel@redhat.com>
In-Reply-To: <20190617043858.8290-1-kraxel@redhat.com>
References: <20190617043858.8290-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 17 Jun 2019 04:39:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 11/11] tests/vm: ubuntu.i386: apt proxy setup
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Configure apt proxy so package downloads
can be cached and can pass firewalls.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/vm/ubuntu.i386 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index a22d137e76df..b869afd212fa 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -51,6 +51,10 @@ class UbuntuX86VM(basevm.BaseVM):
                           "    ssh-authorized-keys:\n",
                           "    - %s\n" % basevm.SSH_PUB_KEY,
                           "locale: en_US.UTF-8\n"])
+        proxy =3D os.environ.get("http_proxy")
+        if not proxy is None:
+            udata.writelines(["apt:\n",
+                              "  proxy: %s" % proxy])
         udata.close()
         subprocess.check_call(["genisoimage", "-output", "cloud-init.iso=
",
                                "-volid", "cidata", "-joliet", "-rock",
--=20
2.18.1


