Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9AE7149
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:24:09 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP447-0003uW-W6
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3vh-0001K1-Ta
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3vg-0001GX-6V
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:25 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22466
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3vf-0001Fx-Tf
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572264923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kl79FN+OL3HPkPGAYUaT5f+1b0u1rlEs1rN9DSJ5JBg=;
 b=M/oR6vD0VTBQ9sgnk41nV5I/Oygn24s+5iVKqV9xopMaRXpd+dlre5ofcOavj74BFexy9n
 IKZb/NGhmgkqlY4BWXsBJ/Vf1EQujesDwBFxthNMOd+M17PZFA4zqftHLIk7txayvdL2A4
 4Bmj3iFaqthennIQIz0lpUGDyCi2Egg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-ldqXuYncNYG1xdc0aV4nPQ-1; Mon, 28 Oct 2019 08:15:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728AD10052E1;
 Mon, 28 Oct 2019 12:15:18 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CB4100164D;
 Mon, 28 Oct 2019 12:15:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/69] iotests: Cache supported_formats()
Date: Mon, 28 Oct 2019 13:13:59 +0100
Message-Id: <20191028121501.15279-8-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ldqXuYncNYG1xdc0aV4nPQ-1
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
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20190917092004.999-8-mreitz@redhat.com
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 936d33df61..a4a2238b42 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -921,9 +921,17 @@ def qemu_pipe(*args):
 def supported_formats(read_only=3DFalse):
     '''Set 'read_only' to True to check ro-whitelist
        Otherwise, rw-whitelist is checked'''
-    format_message =3D qemu_pipe("-drive", "format=3Dhelp")
-    line =3D 1 if read_only else 0
-    return format_message.splitlines()[line].split(":")[1].split()
+
+    if not hasattr(supported_formats, "formats"):
+        supported_formats.formats =3D {}
+
+    if read_only not in supported_formats.formats:
+        format_message =3D qemu_pipe("-drive", "format=3Dhelp")
+        line =3D 1 if read_only else 0
+        supported_formats.formats[read_only] =3D \
+            format_message.splitlines()[line].split(":")[1].split()
+
+    return supported_formats.formats[read_only]
=20
 def skip_if_unsupported(required_formats=3D[], read_only=3DFalse):
     '''Skip Test Decorator
--=20
2.21.0


