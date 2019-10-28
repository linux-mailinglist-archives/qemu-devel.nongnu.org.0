Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC71E7150
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:27:04 +0100 (CET)
Received: from localhost ([::1]:53176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP46w-0007Nr-TN
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3vZ-0001D8-9W
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3vY-0001Ch-5S
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:17 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45943
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3vY-0001CQ-1O
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572264915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sFl7vp6h1iBNHEgQncQy6nm9F7BxXtnEy0wC1s13J0=;
 b=aqZX4s5NE7EWFZY/3QWUbhLS3GzWnKP+ebuJa66uMMONXD4A4U4sQfQRFS8nT6nskDRo2U
 joRBxS7UG3l01/HfULkkoS7tak+n5mDX2eFRHB4lXBy/w2NZAQwVJYNpo5aeIRAHXAsha1
 V7tdYpWQcsSTgJwcycCvU1BS18smnXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-yb6o2CfcPuqUOdIp_EUw8A-1; Mon, 28 Oct 2019 08:15:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17D6A180496E;
 Mon, 28 Oct 2019 12:15:10 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A92FA100164D;
 Mon, 28 Oct 2019 12:15:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/69] iotests: Use case_skip() in skip_if_unsupported()
Date: Mon, 28 Oct 2019 13:13:55 +0100
Message-Id: <20191028121501.15279-4-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yb6o2CfcPuqUOdIp_EUw8A-1
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

skip_if_unsupported() should use the stronger variant case_skip(),
because this allows it to be used even with setUp() (in a meaningful
way).

In the process, make it explicit what we expect the first argument of
the func_wrapper to be (namely something derived of QMPTestCase).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190917092004.999-4-mreitz@redhat.com
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6d5de6e504..bd867d7e02 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -929,14 +929,14 @@ def skip_if_unsupported(required_formats=3D[], read_o=
nly=3DFalse):
     '''Skip Test Decorator
        Runs the test if all the required formats are whitelisted'''
     def skip_test_decorator(func):
-        def func_wrapper(*args, **kwargs):
+        def func_wrapper(test_case: QMPTestCase, *args, **kwargs):
             usf_list =3D list(set(required_formats) -
                             set(supported_formats(read_only)))
             if usf_list:
-                case_notrun('{}: formats {} are not whitelisted'.format(
-                    args[0], usf_list))
+                test_case.case_skip('{}: formats {} are not whitelisted'.f=
ormat(
+                    test_case, usf_list))
             else:
-                return func(*args, **kwargs)
+                return func(test_case, *args, **kwargs)
         return func_wrapper
     return skip_test_decorator
=20
--=20
2.21.0


