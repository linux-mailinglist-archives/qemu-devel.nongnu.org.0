Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A6A6A44
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:44:37 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i596q-0003i0-H1
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i58qL-0002Sn-7E
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i58qK-0000sQ-3T
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:27:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i58qJ-0000qn-Uj
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:27:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 425D8307D945;
 Tue,  3 Sep 2019 13:27:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 503475C25B;
 Tue,  3 Sep 2019 13:27:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 15:26:49 +0200
Message-Id: <20190903132649.20226-11-philmd@redhat.com>
In-Reply-To: <20190903132649.20226-1-philmd@redhat.com>
References: <20190903132649.20226-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 03 Sep 2019 13:27:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 10/10] .travis.yml: Cache Linux/Clang jobs
 together
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These jobs build different components but use the same
host features. Put them in the same cache bucket.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .travis.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 7132cf8fba..bd891fe284 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -173,11 +173,13 @@ matrix:
     # Test with Clang for compile portability (Travis uses clang-5.0)
     - env:
         - CONFIG=3D"--disable-system"
+        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
=20
=20
     - env:
         - CONFIG=3D"--disable-user --target-list=3D${MAIN_SOFTMMU_TARGET=
S}"
+        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
=20
=20
@@ -190,6 +192,7 @@ matrix:
=20
     - env:
         - CONFIG=3D"--disable-user --target-list-exclude=3D${MAIN_SOFTMM=
U_TARGETS}"
+        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
=20
=20
--=20
2.20.1


