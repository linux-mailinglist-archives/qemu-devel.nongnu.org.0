Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48658F01D4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 16:47:40 +0100 (CET)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS13S-0006om-O2
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 10:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iS0zx-0004EI-VY
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iS0zw-0002PE-NR
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33541
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iS0zv-0002Nv-Uu
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572968638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghXHSt2wQDU1/F9XO6CyAfwFu9GIMkCeh9USSijcSwU=;
 b=JlF85fh00bWgJRQ9Xo+YTeDFR3y9stFdk5JkZxORK+8+vb5L4MHgJugFx22UPk5QB2l17Y
 kBcC7ve7QCD0UoPWNeUFb5tnyj2g98OysIG7wUIwu0pB9qcjVTXqCH/X9kUi7ADXcZhYFS
 V4qKIVJIesRk+YGaXHrpTCfarYLJSIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-38V1Nny6MxOh_N1xbFCLmA-1; Tue, 05 Nov 2019 10:43:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D84B477;
 Tue,  5 Nov 2019 15:43:53 +0000 (UTC)
Received: from localhost (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DAE4608AC;
 Tue,  5 Nov 2019 15:43:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] image-fuzzer: Write bytes instead of string to image file
Date: Tue,  5 Nov 2019 16:43:23 +0100
Message-Id: <20191105154332.181417-3-stefanha@redhat.com>
In-Reply-To: <20191105154332.181417-1-stefanha@redhat.com>
References: <20191105154332.181417-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 38V1Nny6MxOh_N1xbFCLmA-1
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

This is necessary for Python 3 compatibility.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20191016192430.25098-3-ehabkost@redhat.com
Message-Id: <20191016192430.25098-3-ehabkost@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/image-fuzzer/qcow2/layout.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/image-fuzzer/qcow2/layout.py b/tests/image-fuzzer/qcow2/=
layout.py
index c57418fa15..fe273d4143 100644
--- a/tests/image-fuzzer/qcow2/layout.py
+++ b/tests/image-fuzzer/qcow2/layout.py
@@ -518,7 +518,7 @@ class Image(object):
         rounded =3D (size + self.cluster_size - 1) & ~(self.cluster_size -=
 1)
         if rounded > size:
             image_file.seek(rounded - 1)
-            image_file.write("\0")
+            image_file.write(b'\x00')
         image_file.close()
=20
     @staticmethod
--=20
2.23.0


