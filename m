Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D504514718B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:13:48 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhvH-0007wl-Cw
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeH-0005Nm-RT
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeG-0006pT-8C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43820
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeG-0006oO-4C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCzeNHVQYeQzqHFX9R7K9wyt51BbDBU9nAmL+c6dKAo=;
 b=dUoZOyQoXsqMZ05gbt3rpIkSA18ePXcKJayaTv/77aF1KZNJkHgB/FdOGjU/orRYfFte2q
 a90ThvN3bUmeUhwZztWiQk+nRPX/sF+VlXJrerHDwdndGb31iBFZo5cpQq6JYEED40fZgu
 5nJ21Cst5OFZk0zaz7/hT3uHZ6LGMHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-XM4DcGYNOICGGozRkdp8hQ-1; Thu, 23 Jan 2020 11:48:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A25208010DE
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF3A719C69;
 Thu, 23 Jan 2020 16:47:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 061/108] virtiofsd: Add timestamp to the log with
 FUSE_LOG_DEBUG level
Date: Thu, 23 Jan 2020 16:45:43 +0000
Message-Id: <20200123164630.91498-62-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: XM4DcGYNOICGGozRkdp8hQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

virtiofsd has some threads, so we see a lot of logs with debug option.
It would be useful for debugging if we can see the timestamp.

Add nano second timestamp, which got by get_clock(), to the log with
FUSE_LOG_DEBUG level if the syslog option isn't set.

The log is like as:

  # ./virtiofsd -d -o vhost_user_socket=3D/tmp/vhostqemu0 -o source=3D/tmp/=
share0 -o cache=3Dauto
  ...
  [5365943125463727] [ID: 00000002] fv_queue_thread: Start for queue 0 kick=
_fd 9
  [5365943125568644] [ID: 00000002] fv_queue_thread: Waiting for Queue 0 ev=
ent
  [5365943125573561] [ID: 00000002] fv_queue_thread: Got queue event on Que=
ue 0

Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index f08324f000..98114a3f4a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -36,6 +36,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/timer.h"
 #include "fuse_virtio.h"
 #include "fuse_log.h"
 #include "fuse_lowlevel.h"
@@ -2276,7 +2277,13 @@ static void log_func(enum fuse_log_level level, cons=
t char *fmt, va_list ap)
     }
=20
     if (current_log_level =3D=3D FUSE_LOG_DEBUG) {
-        localfmt =3D g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid=
), fmt);
+        if (!use_syslog) {
+            localfmt =3D g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
+                                       get_clock(), syscall(__NR_gettid), =
fmt);
+        } else {
+            localfmt =3D g_strdup_printf("[ID: %08ld] %s", syscall(__NR_ge=
ttid),
+                                       fmt);
+        }
         fmt =3D localfmt;
     }
=20
--=20
2.24.1


