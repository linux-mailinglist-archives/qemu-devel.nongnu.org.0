Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE34143A17
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 10:57:48 +0100 (CET)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itqI7-0005kh-4j
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 04:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itqCx-0007cA-Ba
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itqCw-0005aV-99
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32181
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itqCw-0005a3-5B
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579600345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SESDgoYHaT2EdHh2wdhmxq9LXKAhecSvK7Rz0OkkUgI=;
 b=Z0nkWYOqCQNCZI8D2qyU/EpULycAjcZW7OLXBCirM85HbT0Li7wyZAeYElX8LCJ4bMDBsN
 uIVdkjXZR5l88GxPEHsyihXLNZSCoeiLlMMJDhyZhQ29UybIwav2lSEchTJUyFuNK8lQi3
 U47G3Hj42luR7+e1UaYIz/FPuLzd4Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-NZx9BpA7Ocen6QSO_AsOXA-1; Tue, 21 Jan 2020 04:52:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5814A800D41;
 Tue, 21 Jan 2020 09:52:23 +0000 (UTC)
Received: from thuth.com (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDB9110027A9;
 Tue, 21 Jan 2020 09:52:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v5 5/6] iotests: Skip Python-based tests if QEMU does not
 support virtio-blk
Date: Tue, 21 Jan 2020 10:52:04 +0100
Message-Id: <20200121095205.26323-6-thuth@redhat.com>
In-Reply-To: <20200121095205.26323-1-thuth@redhat.com>
References: <20200121095205.26323-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: NZx9BpA7Ocen6QSO_AsOXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to enable some of the python-based tests in the "auto" group,
and these tests require virtio-blk to work properly. Running iotests
without virtio-blk likely does not make too much sense anyway, so instead
of adding a check for the availability of virtio-blk to each and every
test (which does not sound very appealing), let's rather add a check for
this a central spot in the "check" script instead (so that it is still
possible to run "make check" for qemu-system-tricore for example).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/check | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2890785a10..1629b6c914 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -642,7 +642,15 @@ fi
 python_usable=3Dfalse
 if $PYTHON -c 'import sys; sys.exit(0 if sys.version_info >=3D (3,6) else =
1)'
 then
-    python_usable=3Dtrue
+    # Our python framework also requires virtio-blk
+    if "$QEMU_PROG" -M none -device help | grep -q virtio-blk >/dev/null 2=
>&1
+    then
+        python_usable=3Dtrue
+    else
+        python_unusable_because=3D"Missing virtio-blk in QEMU binary"
+    fi
+else
+    python_unusable_because=3D"Unsupported Python version"
 fi
=20
 default_machine=3D$($QEMU_PROG -machine help | sed -n '/(default)/ s/ .*//=
p')
@@ -830,7 +838,7 @@ do
                 run_command=3D"$PYTHON $seq"
             else
                 run_command=3D"false"
-                echo "Unsupported Python version" > $seq.notrun
+                echo "$python_unusable_because" > $seq.notrun
             fi
         else
             run_command=3D"./$seq"
--=20
2.18.1


