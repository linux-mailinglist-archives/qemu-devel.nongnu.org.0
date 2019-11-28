Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47F10CEBE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 20:13:53 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaPEc-00033s-Oc
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 14:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iaOGA-0001yk-Ei
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 13:11:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iaOG0-000187-JA
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 13:11:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51332
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iaOFz-0000r8-E8
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 13:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574964668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qLEFXoqq1G06/WAJ/X09qY5VOZBdscnk6gkfirUXnUA=;
 b=RX8bNTXptUG8S4gTwgw9VVWDl1EJCYoExYdlBn80KkkEtKi0fMekn1Ob7OoGMZQ4vhaK4K
 Mtyj4F4g79FRWfdQsw91Aglixu9eDPibsyeYNwxsLKnbkn/4YNCncu/5H2jSovHfzy8nx0
 N9FVvak2VHcOg/U+Nf2pfuhOapHYOCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-_HfXfYfuOCW-KIYGJ3gEnQ-1; Thu, 28 Nov 2019 13:11:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 155818017CC;
 Thu, 28 Nov 2019 18:11:04 +0000 (UTC)
Received: from localhost (ovpn-116-200.ams2.redhat.com [10.36.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C41BA203;
 Thu, 28 Nov 2019 18:11:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: [PATCH v2] qga: fence guest-set-time if hwclock not available
Date: Thu, 28 Nov 2019 19:11:00 +0100
Message-Id: <20191128181100.23187-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _HfXfYfuOCW-KIYGJ3gEnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laszlo Ersek <lersek@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
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

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

v1 (RFC) -> v2:
- use hwclock_path[]
- use access() instead of stat()

---
 qga/commands-posix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1c1a165daed8..ffb6420fa9cd 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -156,6 +156,17 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns=
, Error **errp)
     pid_t pid;
     Error *local_err =3D NULL;
     struct timeval tv;
+    const char hwclock_path[] =3D "/sbin/hwclock";
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


