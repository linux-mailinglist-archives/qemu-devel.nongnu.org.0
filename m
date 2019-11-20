Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7B1043B2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 19:52:43 +0100 (CET)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXV5m-0001jU-JE
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 13:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iXUym-0004BL-RP
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iXUyl-0005wx-Sk
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27801
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iXUyk-0005wg-Pz
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574275526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjmPaqmUuUTdBnjDEELsejgBcvneILBRa+zAo4pVu2M=;
 b=L6mlGWdA0qwLPlbIMxKvpFIA7UEQ8b9/kaiSUa3H5Q4Ut/s/G+28n3+3RecoWpiYR9WtNm
 aPhPN6xZEtoO8BHS4RdGVPF4t8jJa9PkiF7A8rJvLcUYcX9MjBIdUGmqdxTbhqCikfBtnL
 olQO8kEcKaWWBocgBvv+3qIVk0AnHZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-rz2O9RBMOF-64trxxoI55A-1; Wed, 20 Nov 2019 13:45:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A961005502;
 Wed, 20 Nov 2019 18:45:20 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1A351042B7D;
 Wed, 20 Nov 2019 18:45:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/6] iotests: Add qemu_io_log()
Date: Wed, 20 Nov 2019 19:44:58 +0100
Message-Id: <20191120184501.28159-4-kwolf@redhat.com>
In-Reply-To: <20191120184501.28159-1-kwolf@redhat.com>
References: <20191120184501.28159-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rz2O9RBMOF-64trxxoI55A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that runs qemu-io and logs the output with the
appropriate filters applied.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6a248472b9..330681ad02 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -157,6 +157,11 @@ def qemu_io(*args):
         sys.stderr.write('qemu-io received signal %i: %s\n' % (-exitcode, =
' '.join(args)))
     return subp.communicate()[0]
=20
+def qemu_io_log(*args):
+    result =3D qemu_io(*args)
+    log(result, filters=3D[filter_testfiles, filter_qemu_io])
+    return result
+
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
     args =3D qemu_io_args + list(args)
--=20
2.20.1


