Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A045F01E4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 16:50:18 +0100 (CET)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS161-0001KS-Dn
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 10:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iS10r-0005Th-2P
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iS10q-00033z-0q
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40947
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iS10p-00033r-U0
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572968695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DKPxdw6qHaFVawTqd0tHOb4vypfDV7Nb+1FQkqRD54=;
 b=O+BTyNFSxl5G3IpMLOcFyLFfHVsuLPFZJw9BKneddx0of2GuDSMWJ0IslHN1P+8uvhg29h
 Qm240EfODnkpJGJ8xZ9Ydz7JfebeVJhLw1fFDVKQ7XLToQ0NPx2qnnJykGWK1YYH95wjFF
 Wd/TfEzWmlnAiZF2hR92XqOALC4EYIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-j2qc4dGrME6DkcoU4-v1Xw-1; Tue, 05 Nov 2019 10:44:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38E91005500;
 Tue,  5 Nov 2019 15:44:49 +0000 (UTC)
Received: from localhost (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2207D600C4;
 Tue,  5 Nov 2019 15:44:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] image-fuzzer: Encode file name and file format to bytes
Date: Tue,  5 Nov 2019 16:43:29 +0100
Message-Id: <20191105154332.181417-9-stefanha@redhat.com>
In-Reply-To: <20191105154332.181417-1-stefanha@redhat.com>
References: <20191105154332.181417-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: j2qc4dGrME6DkcoU4-v1Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Callers of create_image() will pass strings as arguments, but the
Image class will expect bytes objects to be provided.  Encode
them inside create_image().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20191016192430.25098-9-ehabkost@redhat.com
Message-Id: <20191016192430.25098-9-ehabkost@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/image-fuzzer/qcow2/layout.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/image-fuzzer/qcow2/layout.py b/tests/image-fuzzer/qcow2/=
layout.py
index a0fd53c7ad..01bff4d05e 100644
--- a/tests/image-fuzzer/qcow2/layout.py
+++ b/tests/image-fuzzer/qcow2/layout.py
@@ -602,8 +602,8 @@ class Image(object):
 def create_image(test_img_path, backing_file_name=3DNone, backing_file_fmt=
=3DNone,
                  fields_to_fuzz=3DNone):
     """Create a fuzzed image and write it to the specified file."""
-    image =3D Image(backing_file_name)
-    image.set_backing_file_format(backing_file_fmt)
+    image =3D Image(backing_file_name.encode())
+    image.set_backing_file_format(backing_file_fmt.encode())
     image.create_feature_name_table()
     image.set_end_of_extension_area()
     image.create_l_structures()
--=20
2.23.0


