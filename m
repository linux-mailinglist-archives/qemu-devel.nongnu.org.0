Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5111F147
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 10:59:18 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ig4Cj-0003Ri-Py
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 04:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ig40X-0005Md-J2
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ig40O-0006os-0f
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39880
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ig40N-0006mp-FS
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576316790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbZyf1ZW8K5V3e1TBoi/wLdXPiQC4RLxVjDdCL55/kI=;
 b=SaaUd37tr6mWXxEh4w7QJFzXgPr+BlIWUTq9feOtUqzacJcF7ypkdyVQzfhpDaT3OkglHS
 c7JXeBEH9RpnryCItXSmCNX3wSAaGRUIok8jOejm+WBCVT0NYAMf7Evt0n3EQvNcIhrFe/
 wg30nlNqljValxP6a8yM/UMECVzOOTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-mli9XaguOgyNadWrUdvxHQ-1; Sat, 14 Dec 2019 04:46:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7B3F1800D63;
 Sat, 14 Dec 2019 09:46:27 +0000 (UTC)
Received: from localhost (ovpn-116-90.ams2.redhat.com [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED5E5D9C9;
 Sat, 14 Dec 2019 09:46:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 16/16] qga: fence guest-set-time if hwclock not available
Date: Sat, 14 Dec 2019 10:45:26 +0100
Message-Id: <20191214094526.8698-17-cohuck@redhat.com>
In-Reply-To: <20191214094526.8698-1-cohuck@redhat.com>
References: <20191214094526.8698-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: mli9XaguOgyNadWrUdvxHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-s390x@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Posix implementation of guest-set-time invokes hwclock to
set/retrieve the time to/from the hardware clock. If hwclock
is not available, the user is currently informed that "hwclock
failed to set hardware clock to system time", which is quite
misleading. This may happen e.g. on s390x, which has a different
timekeeping concept anyway.

Let's check for the availability of the hwclock command and
return QERR_UNSUPPORTED for guest-set-time if it is not available.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-Id: <20191205115350.18713-1-cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 qga/commands-posix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1c1a165daed8..0be301a4ea77 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -156,6 +156,17 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns=
, Error **errp)
     pid_t pid;
     Error *local_err =3D NULL;
     struct timeval tv;
+    static const char hwclock_path[] =3D "/sbin/hwclock";
+    static int hwclock_available =3D -1;
+
+    if (hwclock_available < 0) {
+        hwclock_available =3D (access(hwclock_path, X_OK) =3D=3D 0);
+    }
+
+    if (!hwclock_available) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
=20
     /* If user has passed a time, validate and set it. */
     if (has_time) {
@@ -195,7 +206,7 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns,=
 Error **errp)
=20
         /* Use '/sbin/hwclock -w' to set RTC from the system time,
          * or '/sbin/hwclock -s' to set the system time from RTC. */
-        execle("/sbin/hwclock", "hwclock", has_time ? "-w" : "-s",
+        execle(hwclock_path, "hwclock", has_time ? "-w" : "-s",
                NULL, environ);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
--=20
2.21.0


