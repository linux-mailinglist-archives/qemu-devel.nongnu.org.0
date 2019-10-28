Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A218E71A1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:41:12 +0100 (CET)
Received: from localhost ([::1]:53291 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4Kc-00079i-Tl
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3wU-0002GC-5X
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3wS-0001hB-3d
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22975
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3wQ-0001fi-4N
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572264968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KtF1ttxzQVWMJ0uFhuyIKocv6MjBfAG0v3x4sYo5rw=;
 b=c2Jd4mf8A7Ymp95YLW8pRJHlG4io37u1kDl4jE6HoMasDpLKRW1YSUx1wLE/VTghEFkR/q
 lkBqbk0uzKcEExXRfWGSuRGw4SmDj6Bf4Krxvv0tASvA8oDV/MAdQA2tJs7sRQev9QhQ3Z
 WhIt+NlM5Fqq1aqJ7zYrscHegI0lU/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-JheJ54MEMNqZOCp8-NO06Q-1; Mon, 28 Oct 2019 08:16:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D2310052E0;
 Mon, 28 Oct 2019 12:16:05 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 284D160856;
 Mon, 28 Oct 2019 12:16:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/69] iotests/209: Create socket in $SOCK_DIR
Date: Mon, 28 Oct 2019 13:14:22 +0100
Message-Id: <20191028121501.15279-31-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: JheJ54MEMNqZOCp8-NO06Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191017133155.5327-19-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/209 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index 259e991ec6..e0f464bcbe 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -24,7 +24,8 @@ from iotests import qemu_img_create, qemu_io, qemu_img_ve=
rbose, qemu_nbd, \
=20
 iotests.verify_image_format(supported_fmts=3D['qcow2'])
=20
-disk, nbd_sock =3D file_path('disk', 'nbd-sock')
+disk =3D file_path('disk')
+nbd_sock =3D file_path('nbd-sock', base_dir=3Diotests.sock_dir)
 nbd_uri =3D 'nbd+unix:///exp?socket=3D' + nbd_sock
=20
 qemu_img_create('-f', iotests.imgfmt, disk, '1M')
--=20
2.21.0


