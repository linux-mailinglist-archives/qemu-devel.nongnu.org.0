Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E75C9F272
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 20:36:41 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2gKb-0003zj-UN
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 14:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2g8B-00036m-BK
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2g8A-0005bt-8S
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55886)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2g86-0005YE-TT; Tue, 27 Aug 2019 14:23:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4290418C426D;
 Tue, 27 Aug 2019 18:23:42 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D170960A35;
 Tue, 27 Aug 2019 18:23:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 20:23:09 +0200
Message-Id: <20190827182313.25983-12-mreitz@redhat.com>
In-Reply-To: <20190827182313.25983-1-mreitz@redhat.com>
References: <20190827182313.25983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 27 Aug 2019 18:23:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 11/15] iotests: Disable 126 for flat vmdk
 subformats
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iotest 126 requires backing file support, which flat vmdks cannot offer.
Skip this test for such subformats.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190815153638.4600-8-mreitz@redhat.com
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/126 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/126 b/tests/qemu-iotests/126
index 9b0dcf9255..b7fce1e59d 100755
--- a/tests/qemu-iotests/126
+++ b/tests/qemu-iotests/126
@@ -33,6 +33,8 @@ status=3D1	# failure is the default!
=20
 # Needs backing file support
 _supported_fmt qcow qcow2 qed vmdk
+_unsupported_imgopts "subformat=3DmonolithicFlat" \
+                     "subformat=3DtwoGbMaxExtentFlat"
 # This is the default protocol (and we want to test the difference betwe=
en
 # colons which separate a protocol prefix from the rest and colons which=
 are
 # just part of the filename, so we cannot test protocols which require a=
 prefix)
--=20
2.21.0


