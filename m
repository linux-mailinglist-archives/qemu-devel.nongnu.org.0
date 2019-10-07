Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CFCE3F4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 15:42:19 +0200 (CEST)
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHTHG-00023y-Mb
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 09:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHTBB-0003sX-03
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHTB9-0007Ok-Va
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:36:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iHTB9-0007OJ-QM
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:35:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16E7E30842A8
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 13:35:58 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92A0860127;
 Mon,  7 Oct 2019 13:35:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] edk2 build scripts: honor external BaseTools flags with
 uefi-test-tools
Date: Mon,  7 Oct 2019 15:35:39 +0200
Message-Id: <20191007133540.30623-5-philmd@redhat.com>
In-Reply-To: <20191007133540.30623-1-philmd@redhat.com>
References: <20191007133540.30623-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 07 Oct 2019 13:35:58 +0000 (UTC)
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

Unify the recipe for "build-edk2-tools" in
"tests/uefi-test-tools/Makefile" with the recipe for "edk2-basetools" in
"roms/Makefile".

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20190920083808.21399-2-lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/uefi-test-tools/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/uefi-test-tools/Makefile b/tests/uefi-test-tools/Makef=
ile
index 1d78bc14d5..7e0177d733 100644
--- a/tests/uefi-test-tools/Makefile
+++ b/tests/uefi-test-tools/Makefile
@@ -99,7 +99,9 @@ Build/bios-tables-test.%.efi: build-edk2-tools
 	+./build.sh $(edk2_dir) BiosTablesTest $* $@
=20
 build-edk2-tools:
-	$(MAKE) -C $(edk2_dir)/BaseTools
+	$(MAKE) -C $(edk2_dir)/BaseTools \
+		EXTRA_OPTFLAGS=3D'$(EDK2_BASETOOLS_OPTFLAGS)' \
+		EXTRA_LDFLAGS=3D'$(EDK2_BASETOOLS_LDFLAGS)'
=20
 clean:
 	rm -rf Build Conf log
--=20
2.21.0


